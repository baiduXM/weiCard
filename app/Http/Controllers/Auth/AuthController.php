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
        $this->middleware('guest', ['except' => 'logout']);
    }

    /**
     * 重写登录方法
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
            'name' => 'required|max:255|unique:users,users.name',
            'email' => 'required|email|max:255|unique:users,users.email',
            'password' => 'required|min:6|confirmed',
        ], [
            'required' => ':attribute为必填项',
            'email' => ':attribute格式不正确',
            'min' => ':attribute长度太短',
            'max' => ':attribute长度太长',
            'confirmed' => '两次:attribute不一致',
            'unique' => ':attribute已被使用'
        ], [
            'name' => '用户名',
            'email' => '邮箱',
            'password' => '密码',
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
