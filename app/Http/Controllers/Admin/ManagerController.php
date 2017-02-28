<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\Manager;

class ManagerController extends Controller
{
    // 客服列表
    public function index()
    {
        $managers = Manager::where('name', "!=", 'admin')->paginate(); // 超级管理员不能删除
        return view('admin.manager.index')->with([
            'managers' => $managers
        ]);
    }


}