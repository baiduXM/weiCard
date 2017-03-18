<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\ResetsPasswords;
use Validator;

class PasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset requests
    | and uses a simple trait to include this behavior. You're free to
    | explore this trait and override any methods you wish to tweak.
    |
    */
    use ResetsPasswords;

    protected $redirectTo = '/';
    protected $linkRequestView = 'auth.passwords.forget'; // 忘记密码
    protected $resetView = 'auth.passwords.reset-new'; // 重置密码


    public function __construct()
    {
        $this->middleware('guest');
    }

}
