<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Model\Admin\Manager;

class ManagerController extends Controller
{
    // 客服列表
    public function index()
    {
        $managers = Manager::paginate();
        return view('admin.manager.index')->with([
            'managers' => $managers
        ]);
    }


}