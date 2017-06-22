<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Common\AdminController;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use App\Models\Manager;


class AdminAuthController extends AdminController
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

    public function logout()
    {
        Auth::guard('admin')->logout();
        return redirect($this->redirectAfterLogout);
    }

    /**
     * 重写登录方法
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

        // 判断登录账号是用户名(name)还是邮箱(email)
        if (filter_var($username, FILTER_VALIDATE_EMAIL)) { // 验证是否邮箱
            if (Auth::guard($this->getGuard())->attempt(['email' => $username, 'password' => $password, 'is_active' => 1], $request->has('remember'))) {
                return $this->handleUserWasAuthenticated($request, $throttles);
            }
        } else { // 用户名登录
            if (Auth::guard($this->getGuard())->attempt(['name' => $username, 'password' => $password, 'is_active' => 1], $request->has('remember'))) {
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
            'is_active' => 0,
        ]);

    }

}