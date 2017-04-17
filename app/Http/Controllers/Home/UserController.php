<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Breadcrumbs;

class UserController extends Controller
{
    public function __construct()
    {
        // 我的公司
        Breadcrumbs::register('user', function ($breadcrumbs) {
            $breadcrumbs->push('我的公司', route('user.index'));
        });

        // 我的公司 > 我的公司
        Breadcrumbs::register('admin.user.create', function ($breadcrumbs) {
            $breadcrumbs->parent('user');
            $breadcrumbs->push('我的公司', route('admin.user.create'));
        });

        // 首页 > 用户列表 > 用户详情
        Breadcrumbs::register('admin.user.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.user');
            $breadcrumbs->push('用户详情', route('admin.user.show', $id));
        });

        // 首页 > 用户列表 > 修改用户
        Breadcrumbs::register('admin.user.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.user');
            $breadcrumbs->push('修改用户', route('admin.user.edit', $id));
        });
    }

    public function index()
    {
        $user = User::find(Auth::id());
        return view('home.user.index')->with([
            'user' => $user,
        ]);
    }

    public function create()
    {
        // TODO
    }

    public function store(Request $request)
    {
        // TODO
    }

    public function show($id)
    {
        $user = User::find($id);
        return view('home.user.show')->with([
            'user' => $user,
        ]);
    }

    public function edit($id)
    {
        // TODO
        $user = User::find($id);
        return view('home.user.edit')->with('user', $user);
    }

    public function update(Request $request, $id)
    {
        // TODO
    }

    public function destroy($id)
    {
        // TODO
    }
}