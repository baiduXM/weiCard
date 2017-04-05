<?php

namespace App\Http\Controllers\Admin;

use App\Models\Auth\Admin;
use Validator;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ThrottlesLogins;
use Illuminate\Foundation\Auth\AuthenticatesAndRegistersUsers;

class AuthController extends Controller
{
    use AuthenticatesAndRegistersUsers, ThrottlesLogins;
    protected $redirectTo = '/admin';
    protected $guard = 'admin';
    protected $loginView = 'admin.auth.login';
    protected $registerView = 'admin.auth.register';

//    protected $redirectAfterLogout = '/admin';

    public function __construct()
    {
        $this->middleware('guest:admin', ['except' => 'logout']);
    }

    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|max:255|unique:managers',
            'email' => 'required|email|max:255|unique:managers',
            'password' => 'required|confirmed',
        ]);
    }

    protected function create(array $data)
    {
        return Admin::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
            'is_super' => $data['name'] == 'admin' ? 1 : 0,
        ]);

    }

}
