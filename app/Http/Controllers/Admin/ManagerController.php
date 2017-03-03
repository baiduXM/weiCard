<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\Manager;

class ManagerController extends Controller
{
    // 客服列表
    public function index()
    {
        $managers = Manager::where('is_super', 1)->paginate(); // 超级管理员不显示
        return view('admin.manager.index')->with([
            'managers' => $managers
        ]);
    }


}