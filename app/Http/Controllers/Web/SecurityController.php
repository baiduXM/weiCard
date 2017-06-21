<?php
/**
 * Created by PhpStorm.
 * User: Hsieh
 * Date: 2017/3/29
 * Time: 16:59
 */

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Breadcrumbs;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Hash;
use Laravel\Socialite\Facades\Socialite;

class SecurityController extends Controller
{
    public function __construct()
    {
        parent::isMobile();
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 我的同事
        Breadcrumbs::register('security', function ($breadcrumbs) {
            $breadcrumbs->push('安全中心', route('security.index'));
        });
        // 首页 > 用户列表 > 详情
        Breadcrumbs::register('security.password', function ($breadcrumbs) {
            $breadcrumbs->parent('security');
            $breadcrumbs->push('修改密码', route('security.password'));
        });
        // 首页 > 用户列表 > 详情
        Breadcrumbs::register('security.binding', function ($breadcrumbs) {
            $breadcrumbs->parent('security');
            $breadcrumbs->push('第三方绑定', route('security.binding'));
        });
    }

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

    /**
     * 第三方绑定
     *
     * @param null $driver
     * @return view
     */
    public function binding($driver = null)
    {
        if ($driver) {
            Config::set('services.' . $driver . '.redirect', 'http://mp.gbpen.com/security/binding/' . $driver . '/callback');
            return Socialite::with($driver)->redirect();
        }
        return view('home.security.binding')->with([
            'user' => Auth::user(),
        ]);
    }


    /**
     *
     */
    public function bindingCallback($driver)
    {
        $oauthUser = Socialite::with($driver)->user();
        dd($oauthUser);
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
        $user = User::find(Auth::id());
        if (!Hash::check($oldpassword, $user->password)) {
            return back()->with('warning', '原密码错误！');
        } else {
            $user->password = bcrypt($request->input('User.password'));
            $user->update();
            return back()->with('success', '密码修改成功！');
        }
    }

}