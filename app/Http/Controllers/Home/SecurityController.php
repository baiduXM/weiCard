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
}