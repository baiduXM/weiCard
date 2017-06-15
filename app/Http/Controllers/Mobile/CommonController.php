<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;

/**
 * 移动端公共控制器，其他模块控制器继承该控制器
 * 可调用Common文件夹下的，全局公共控制器
 *
 * @package App\Http\Controllers\Mobile
 */
class CommonController extends Controller
{
    public function __construct()
    {
        // TODO
    }

    public function search()
    {
        return view('mzui.common.search');
    }
}

