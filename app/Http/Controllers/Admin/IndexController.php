<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\AdminController;

class IndexController extends AdminController
{
    public function index()
    {
        return view('admin.index');
    }


}