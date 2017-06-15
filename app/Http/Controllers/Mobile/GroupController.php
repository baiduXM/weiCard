<?php

namespace App\Http\Controllers\Mobile;

class GroupController extends CommonController
{

    public function __construct()
    {
        // TODO
    }

    public function index()
    {
        return view('mzui.group.index')->with([
            // TODO:传输数据
        ]);
    }

}

