<?php
/**
 * Created by PhpStorm.
 * User: Hsieh
 * Date: 2017/6/21
 * Time: 18:43
 */

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\AdminController;

class IndexController extends AdminController
{
    public function index()
    {
        return view('admin.index');
    }


}