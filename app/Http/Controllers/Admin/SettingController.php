<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Common\AdminController;

class SettingController extends AdminController
{
    // TODO
    public function index()
    {
        return view('admin.setting.index');
    }

    public function safety()
    {
        return view('admin.setting.safety');
    }

    public function person()
    {
        return view('admin.setting.person');
    }
}