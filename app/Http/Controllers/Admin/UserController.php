<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;


class UserController extends Controller
{
    const PAGENUM = 20; // 每页显示条数

    // 用户列表
    public function index()
    {
        $users = User::paginate(self::PAGENUM);
        return view('admin.user.index')->with([
            'users' => $users
        ]);
    }

    // 新增用户
    public function create(Request $request)
    {
        if ($request->isMethod('POST')) {

            $this->validate($request, [
                'User.name' => 'required|min:6|max:20',
                'User.email' => 'required|email|max:255',
                'User.password' => 'required|min:6|confirmed',
            ], [
                'required' => ':attribute为必填项',
                'min' => ':attribute长度太短',
                'max' => ':attribute长度太长',
                'email' => ':attribute格式不正确',
                'confirmed' => '两次:attribute不一致',
            ], [
                'User.name' => '用户名',
                'User.email' => '邮箱',
                'User.password' => '密码',
            ]);

            $data = $request->input('User');
            if (User::create($data)) {
                return redirect('admin/user')->with('success', '添加成功');
            } else {
                return redirect()->back();
            }
        }
        $user = new User();
        return view('admin.user.create', [
            'user' => $user,
        ]);
    }

    // 用户详情
    public function detail($id)
    {
        $user = User::find($id);
        return view('admin.user.detail', [
            'user' => $user
        ]);

    }

    // 修改用户
    public function update(Request $request, $id)
    {
        $user = User::find($id);
        if ($request->isMethod('POST')) {

            dd($request->all());

        }

        return view('admin.user.update', [
            'user' => $user
        ]);
    }

    // 删除用户
    public function delete($id)
    {
        // TODO
        echo 1;
        exit;
    }


}