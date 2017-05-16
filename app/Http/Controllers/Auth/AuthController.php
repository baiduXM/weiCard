<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Laravel\Socialite\Facades\Socialite;
use Validator;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;
use Illuminate\Support\Facades\Auth;


class AuthController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Registration & Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users, as well as the
    | authentication of existing users. By default, this controller uses
    | a simple trait to add these behaviors. Why don't you explore it?
    |
    */

    use AuthenticatesAndRegistersUsers, ThrottlesLogins;

    protected $redirectTo = '/index';
    protected $loginView = 'auth.login';
    protected $registerView = 'auth.register';
    protected $username = 'username';
    protected $redirectAfterLogout = '/';

    public function __construct()
    {
        parent::isMobile();
        $this->middleware('guest', ['except' => 'logout']);
    }

    /**
     * 重写登录页面
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function getLogin()
    {
//        dd($this->is_mobile);
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
        if ($type == 'email') {
            if (Auth::guard($this->getGuard())->attempt(['email' => $username, 'password' => $password], $request->has('remember'))) {
                return redirect()->intended($this->redirectPath());

//                return $this->handleUserWasAuthenticated($request, $throttles);
            }
        } else {
            if (Auth::guard($this->getGuard())->attempt(['name' => $username, 'password' => $password], $request->has('remember'))) {
                return $this->handleUserWasAuthenticated($request, $throttles);
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
     * @return mixed
     */
    protected function validator(array $data)
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
     * @param Request $request
     * @param $driver
     * @return mixed
     */
    public function redirectToProvider(Request $request, $driver)
    {
        return Socialite::with($driver)->redirect();
    }

    /**
     * 第三方登录 - 回调地址
     *
     * @param Request $request
     * @param $driver
     * @return \Illuminate\Http\RedirectResponse
     */
    public function handleProviderCallback(Request $request, $driver)
    {
        $oauthUser = Socialite::with($driver)->user();
        $function_name = 'oauth_' . $driver;
        $this->$function_name($oauthUser->user);
        return redirect($this->redirectPath());
    }


    /**
     * 第三方登录 - 微信网页扫码
     *
     * @param $data
     */
    protected function oauth_weixinweb($data)
    {
        $user = User::where('oauth_weixin', '=', $data['unionid'])->first();
        if ($user) { // 存在，登录
            if (Auth::guard($this->getGuard())->login($user)) {
                return redirect()->intended($this->redirectPath());
            }
        } else { // 不存在，创建，登录
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
     * @return \Illuminate\Http\RedirectResponse
     */
    protected function oauth_weixin($data)
    {
        dd($data);
        $this->oauth_weixin($data);
    }

}
