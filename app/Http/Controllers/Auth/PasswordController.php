<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Common\HomeController;
use Illuminate\Foundation\Auth\ResetsPasswords;

class PasswordController extends HomeController
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
    protected $linkRequestView = 'admin.auth.passwords.forget'; // 忘记密码
    protected $resetView = 'admin.auth.passwords.reset'; // 重置密码


    public function __construct()
    {

    }

//    public function showResetForm()
//    {
//        return 2;
//    }

    public function reset()
    {
        return 1;
    }


}
