<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;


class UserController extends Controller
{

    // 用户列表
    public function index()
    {
        $users = User::paginate(20);
        return view('admin.user')->with([
            'users' => $users
        ]);
    }

    // 新增用户
    public function create()
    {
        // TODO
    }

    // 用户详情
    public function detail($id)
    {
        // TODO
    }

    // 修改用户
    public function update($id)
    {
        // TODO
    }

    // 删除用户
    public function delete($id) {
        // TODO
    }



}