<?php

namespace App\Http\Controllers\Auth;

use App\Models\Auth\User;
use Illuminate\Http\Request;
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

    public function __construct()
    {
        $this->middleware($this->guestMiddleware(), ['except' => 'logout']);
    }


    public function getLogin()
    {
        return view($this->loginView);
    }

    public function postLogin(Request $request)
    {
        // 验证
        $this->validate($request, [
            'username' => 'bail|required',
            'password' => 'bail|required',
        ], [
            'required' => ':attribute不能为空',
        ], [
            'username' => '账号',
            'password' => '密码',
        ]);

        // ？登录次数限制
        $throttles = $this->isUsingThrottlesLoginsTrait();
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

    public function getRegister()
    {
        return view($this->registerView);
    }

    public function postRegister(Request $request)
    {
        // 验证
        $this->validate($request, [
            'User.name' => 'required|min:4|max:20|unique:users,users.name',
            'User.password' => 'required|min:6|confirmed',
        ], [
            'required' => ':attribute不能为空',
            'unique' => ':attribute用户名已被占用',
            'confirmed' => '两次:attribute不一致',
            'min' => ':attribute字符过短',
            'max' => ':attribute字符太长',
        ], [
            'User.name' => '账号',
            'User.password' => '密码',
        ]);

        // 创建
        $user = $request->input('User');
        echo User::create([
//            'name' => $user->name,
            'name' => time(),
            'password' => bcrypt($user->password),
        ]);
        dd(11);
//        dd($userm);

        // 登录
        Auth::guard($this->getGuard())->login($this->create($request->all()));
        return redirect($this->redirectPath());

    }


    /**
     * 登录验证
     *
     * @param array $data
     * @return mixed
     */


    protected function validateLogin(array $data)
    {

        return Validator::make($data, [
            'username' => 'required',
            'password' => 'required',
        ], [
            'required' => ':attribute为必填项',
        ], [
            'username' => '账号',
            'password' => '密码',
        ]);
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
            'User.name' => 'required|max:255|unique:users,users.name',
            'User.email' => 'required|email|max:255|unique:users,users.email',
            'User.password' => 'required|min:6|confirmed',
        ], [
            'required' => ':attribute为必填项',
            'email' => ':attribute格式不正确',
            'min' => ':attribute长度太短',
            'max' => ':attribute长度太长',
            'confirmed' => '两次:attribute不一致',
            'unique' => ':attribute已被使用'
        ], [
            'User.name' => '用户名',
            'User.email' => '邮箱',
            'User.password' => '密码',
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
}
