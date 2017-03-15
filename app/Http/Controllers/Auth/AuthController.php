<?php

namespace App\Http\Controllers\Auth;

use App\Models\Auth\User;
use Validator;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;

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

    public function __construct()
    {
        $this->middleware($this->guestMiddleware(), ['except' => 'logout']);
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|max:255|unique:users',
            'email' => 'required|email|max:255|unique:users',
            'password' => 'required|min:6|confirmed',
        ],[
            'required' => ':attribute为必填项',
            'email' => ':attribute格式不正确',
            'min' => ':attribute长度太短',
            'max' => ':attribute长度太长',
            'confirmed' => '两次:attribute不一致',
            'unique' => ':attribute已被使用'
        ],[
            'name' => '用户名',
            'email' => '邮箱',
            'password' => '密码',
        ]);
    }

    protected function create(array $data)
    {
        return User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
        ]);
    }
}
