<?php
/**
 * Created by PhpStorm.
 * User: Hsieh
 * Date: 2017/3/29
 * Time: 16:59
 */

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;

class SecurityController extends Controller
{
    public function index()
    {
        return view('home.security.index');
    }



    public function email()
    {
        return view('home.security.email');
    }

    public function postEmail()
    {

    }

    public function binding()
    {
        return view('home.security.binding');
    }

    public function postBinding()
    {

    }

    public function password()
    {
        return view('home.security.password');
    }

    public function postPassword()
    {

    }

}