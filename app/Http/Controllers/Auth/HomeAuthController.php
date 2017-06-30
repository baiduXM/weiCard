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
use Mockery\Exception;

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
        $this->isMobile();
        $this->middleware('guest', ['except' => 'logout']);
    }

    /**
     * 重写登录页面
     * 隐藏登录页面，直接微信登录
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    /**
     * @param Request $request
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View|mixed
     */
    public function getLogin(Request $request)
    {

        $ip = $request->ip();
        $ipArr = array(
            //     '183.250.161.246', // 公司公网IP
            '127.0.0.1', // 本地测试ip
        );
        /* 不在IP组里的微信登录，在IP组里的可账号登录 */
        if (!in_array($ip, $ipArr)) {
            /* 只允许通过微信登录 */
            if ($this->isMobile()) { // mobile端，微信授权
                return $this->redirectToProvider('weixin');
            } else { // web端，微信扫码
                return $this->redirectToProvider('weixinweb');
            }
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
            return $this->handleUserWasAuthenticated($request, $throttles);
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
    protected function validator(array $data)
    {

        return Validator::make($data, [
            'name'     => 'required|min:4|max:255|unique:users,users.name',
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
    protected function create(array $data)
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
    public function redirectToProvider($driver)
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
    public function handleProviderCallback(Request $request, $driver)
    {
        $oauthUser = Socialite::with($driver)->user();
        $function_name = 'oauth_' . $driver;
        $this->$function_name($oauthUser->user);

//        if (Auth::check()) { // 已登录，绑定账号
//            $function_name = 'bind_' . $driver;
//            $this->$function_name($oauthUser->user);
//            return redirect()->back();
//        }
    }


    /**
     * 第三方登录 - 微信网页扫码
     *
     * @param $data
     *
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    protected function oauth_weixinweb($data)
    {
        // 网页扫码没有关注公众号字段
        // 登录/注册
        $user = User::where('oauth_weixin', '=', $data['unionid'])->first();
        if ($user) { // 存在，登录
            if (Auth::guard($this->getGuard())->login($user)) {
                return redirect()->intended($this->redirectPath());
            }
        } else { // 不存在，创建，登录
            // openid:当前公众号授权唯一码
            // unionid:同一个开发平台用户唯一码
            $array['name'] = $data['openid']; // 当前公众号唯一码
            $array['sex'] = $data['sex'];
            $array['avatar'] = $data['headimgurl']; // TODO：下载远程图片到本地
            $array['nickname'] = $data['nickname'];
            $array['oauth_weixin'] = $data['unionid']; // 同一个开发平台用户唯一码
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
    protected function oauth_weixin($data)
    {
        // TODO:判断是否关注公众号
        $home = new HomeController;
        $token = $home->wx_get_token();
        $openid = $data['openid'];
        $url = 'https://api.weixin.qq.com/cgi-bin/user/info?access_token=' . $token . '&openid=' . $openid . '&lang=zh_CN';
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($ch);
        curl_close($ch);//执行发送
        $jsoninfo = json_decode($output, true);
        $subscribe = $jsoninfo["subscribe"];
        if ($subscribe == 0) {
            return view('mobile.common.qrcode');
        }
        $this->oauth_weixinweb($data);
    }

    /**
     * 第三方绑定 - 绑定微信
     *
     * @param $data
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    protected function bind_weixinweb($data)
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
    protected function bind_weixin($data)
    {
        $this->bind_weixinweb($data);
    }

    protected function isSubscribe()
    {
//        https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN
    }

}