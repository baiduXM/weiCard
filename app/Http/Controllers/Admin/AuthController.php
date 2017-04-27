<?php

namespace App\Http\Controllers\Admin;

use App\Models\Manager;
use Illuminate\Http\Request;
use Validator;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    use AuthenticatesAndRegistersUsers, ThrottlesLogins;
    protected $redirectTo = '/admin'; // 登录成功后跳转页面
    protected $guard = 'admin'; // 用户守卫
    protected $loginView = 'admin.auth.login'; // 登录页面
    protected $registerView = 'admin.auth.register'; // 注册页面
    protected $redirectAfterLogout = '/admin'; // 退出登录后跳转页面
    protected $username = 'username'; // 登录账号

    public function __construct()
    {
        $this->middleware('guest:admin', ['except' => 'logout']);
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
        if (filter_var($username, FILTER_VALIDATE_EMAIL)) {
            $type = 'email';
        } elseif (filter_var($username, FILTER_VALIDATE_EMAIL)) {
            $type = 'mobile';
        } else {
            $type = 'name';
        }

        if ($type == 'email') {
            if (Auth::guard($this->getGuard())->attempt(['email' => $username, 'password' => $password], $request->has('remember'))) {
                return $this->handleUserWasAuthenticated($request, $throttles);
            }
        } elseif ($type == 'mobile') {
            if (Auth::guard($this->getGuard())->attempt(['mobile' => $username, 'password' => $password], $request->has('remember'))) {
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

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|min:4|max:255|unique:managers',
            'password' => 'required|confirmed|min:6',
        ]);
    }

    protected function create(array $data)
    {
        return Manager::create([
            'name' => $data['name'],
            'password' => bcrypt($data['password']),
        ]);

    }


}
