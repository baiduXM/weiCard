<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
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
        $this->middleware('guest', ['except' => 'logout']);
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
                return $this->handleUserWasAuthenticated($request, $throttles);
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
        return User::create([
            'name' => $data['name'],
            'password' => bcrypt($data['password']),
        ]);
    }

    /**
     * 用户点击第三方登录按钮后，调用此方法请求微信接口
     *
     * @param Request $request
     * @return mixed
     */
    public function redirectToProvider(Request $request, $driver)
    {
        return Socialite::with($driver)->redirect();
//        if ($driver == 'weixin') {
//            $this->redirectToWeixin();
//        } else {
//            return \Socialite::with($driver)->redirect();
//        }
    }

    /**
     *
     */
    public function redirectToWeixin()
    {
        $appid = env('WEIXIN_KEY');
        $redirect_uri = urlencode(env('WEIXIN_REDIRECT_URI'));
        $redirect_uri = urlencode('http://mp.gbpen.com/oauth/weixin/callback');
        $response_type = 'code';
        $scope = 'snsapi_login';
        $state = '';
        $auth_base_uri = 'https://open.weixin.qq.com/connect/qrconnect';
        $url = $auth_base_uri . '?' . 'appid=' . $appid . '&redirect_uri=' . $redirect_uri . '&response_type=' . $response_type . '&scope=' . $scope . '&state=' . $state;
        dd($url);
//        return redirect('https://open.weixin.qq.com/connect/qrconnect?');
        dd(Redirect::to('https://open.weixin.qq.com/connect/qrconnect?'));
//        https://open.weixin.qq.com/connect/qrconnect?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect
    }

    /**
     * 微信的回调地址
     *
     * @param Request $request
     */
    public function handleProviderCallback(Request $request, $driver)
    {
        $oauthUser = \Socialite::with($driver)->user();

        // 在这里可以获取到用户在微信的资料
        dd($oauthUser);
    }

}
