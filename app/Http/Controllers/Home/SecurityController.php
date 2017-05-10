<?php
/**
 * Created by PhpStorm.
 * User: Hsieh
 * Date: 2017/3/29
 * Time: 16:59
 */

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Auth\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Input;

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

    public function postPassword(Request $request)
    {
        /* 验证 */
        $this->validate($request, [
            'User.password' => 'required|between:6,20|confirmed',
        ], [], [
            'User.password' => '新密码',
        ]);
        /* 原密码验证 */
        $oldpassword = $request->input('User.password_o');
        $user=User::find(Auth::id());
        if(
        !Hash::check($oldpassword,$user->password)
        ){
            return back()->with('warning','原密码错误！');
        }
        else{
            $user->password=bcrypt($request->input('User.password'));
            $user->update();
            return back()->with('success','密码修改成功！');
        }
    }

}