<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Common\HomeController;
use App\Models\User;
use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;
use Illuminate\Support\Facades\Auth;

class HomeAuthController extends HomeController
{
    use AuthenticatesAndRegistersUsers, ThrottlesLogins;
    protected $redirectTo = '/'; // 登录成功后跳转页面
    protected $loginView = 'auth.login'; // 登录页面
    protected $registerView = 'auth.register'; // 注册页面
    protected $redirectAfterLogout = '/'; // 退出登录后跳转页面
    protected $username = 'username'; // 登录账号

    public function __construct()
    {
        $this->middleware('guest', ['except' => 'logout']);
    }

    /**
     * 重写登录页面
     * 隐藏登录页面，直接微信登录
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function getLogin()
    {
        /* 只允许通过微信登录 */
        if (session('is_mobile')) { // mobile端，微信授权
//            return $this->redirectToProvider('weixin');
        } else { // web端，微信扫码
//            return $this->redirectToProvider('weixinweb');
        }


        $view = property_exists($this, 'loginView')
            ? $this->loginView : 'auth.authenticate';

        if (view()->exists($view)) {
            return view($view);
        }

        return view('auth.login');
    }

    /**
     * 重写登录方法
     * 账号可以是用户名（name）或邮箱（email）
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\Response
     */
    public function postLogin(Request $request)
    {
        // 验证
        $this->validate($request, [
            'username' => 'bail|required',
            'password' => 'bail|required',
        ]);

        // ？登录次数限制
        $throttles = in_array(
            ThrottlesLogins::class, class_uses_recursive(static::class)
        );
        if ($throttles && $lockedOut = $this->hasTooManyLoginAttempts($request)) {
            $this->fireLockoutEvent($request);
            return $this->sendLockoutResponse($request);
        }

        $username = $request->input('username');
        $password = $request->input('password');

        // 判断登录账号是“用户名(name)”还是“邮箱(email)”
        $type = filter_var($username, FILTER_VALIDATE_EMAIL) ? 'email' : 'name';
        if (Auth::guard($this->getGuard())->attempt([$type => $username, 'password' => $password], $request->has('remember'))) {
            // 1、Web端，且公司拥有者 -> 跳转Web页面
            // 2、Web端，普通用户|移动端，所有用户 -> 跳转Mobile页面
            if (!session('is_mobile') && $this->isCompanyOwner()) {
                return $this->handleUserWasAuthenticated($request, $throttles);
            } else {
                $this->redirectTo = 'm';
                return redirect('m');
//                return redirect()->intended($this->redirectPath());
            }
        }

        if ($throttles && !$lockedOut) {
            $this->incrementLoginAttempts($request);
        }

        return $this->sendFailedLoginResponse($request);


    }

    /**
     * 注册验证
     *
     * @param array $data
     *
     * @return mixed
     */
    protected
    function validator(array $data)
    {

        return Validator::make($data, [
            'name' => 'required|min:4|max:255|unique:users,users.name',
            'password' => 'required|min:6|confirmed',
        ]);
    }

    /**
     * 注册创建用户
     *
     * @param array $data
     *
     * @return static
     */
    protected
    function create(array $data)
    {
        foreach ($data as $key => $value) {
            if ($key == 'password') {
                $data[$key] = bcrypt($value);
            }
        }
        return User::create($data);
    }

    /**
     * 第三方登录 - 请求接口
     *
     * @param $driver
     *
     * @return mixed
     */
    public
    function redirectToProvider($driver)
    {
        return Socialite::with($driver)->redirect();
    }

    /**
     * 第三方登录 - 回调地址
     *
     * @param Request $request
     * @param         $driver
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public
    function handleProviderCallback(Request $request, $driver)
    {
        $oauthUser = Socialite::with($driver)->user();
        if (Auth::check()) { // 已登录，绑定账号
            $function_name = 'bind_' . $driver;
            $this->$function_name($oauthUser->user);
            return redirect()->back();
        } else { // 未登录，登录/注册
            $function_name = 'oauth_' . $driver;
            $this->$function_name($oauthUser->user);
            return redirect($this->redirectPath());
        }
    }


    /**
     * 第三方登录 - 微信网页扫码
     *
     * @param $data
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    protected
    function oauth_weixinweb($data)
    {
        // TODO:判断是否关注公众号，是->获取信息注册/登录，否->跳转关注公众号页面

        $user = User::where('oauth_weixin', '=', $data['unionid'])->first();
        if ($user) { // 存在，登录
            if (Auth::guard($this->getGuard())->login($user)) {
                return redirect()->intended($this->redirectPath());
            }
        } else { // 不存在，创建，登录
//            if ($data['subscribe'] == 0) { // 未关注
//                return redirect('/follow/public'); // 跳转公众号二维码
//            }

            $array['name'] = $data['unionid'];
            $array['oauth_weixin'] = $data['unionid'];
            $array['sex'] = $data['sex'];
            $array['avatar'] = $data['headimgurl'];
            $array['nickname'] = $data['nickname'];
            if (Auth::guard($this->getGuard())->login($this->create($array))) {
                return redirect($this->redirectPath());
            }
        }
    }

    /**
     * 第三方登录 - 微信登录
     *
     * @param array $data 第三方数据
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    protected
    function oauth_weixin($data)
    {
        $this->oauth_weixinweb($data);
    }

    /**
     * 第三方绑定 - 绑定微信
     *
     * @param $data
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    protected
    function bind_weixinweb($data)
    {
        // 检查是否注册
        $user = User::where('oauth_weixin', '=', $data['unionid'])->first();
        if ($user) { // 已注册
            return redirect()->back()->with('error', '该微信已绑定其他账号');
        } else {
            $user = User::find(Auth::id());

            if (!$user->oauth_weixin) {
                $user->oauth_weixin = $data['unionid'];
            } else {
                return redirect()->back()->with('error', '绑定失败');
            }
            if (!$user->nickname) {
                $user->nickname = $data['nickname'];
            }
            if (!$user->avatar) {
                $user->avatar = $data['headimgurl'];
            }
            if (!$user->sex) {
                $user->sex = $data['sex'];
            }
            if ($user->save()) {
                return redirect()->back()->with('success', '绑定微信成功');
            } else {
                return redirect()->back()->with('error', '绑定失败');
            }
        }
    }

    /**
     * 第三方绑定 - 绑定微信
     *
     * @param $data
     */
    protected
    function bind_weixin($data)
    {
        $this->bind_weixinweb($data);
    }
}