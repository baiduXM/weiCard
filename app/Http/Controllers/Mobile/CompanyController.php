<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Common\HomeController;

class CompanyController extends HomeController
{

    public function __construct()
    {
        // TODO
    }

    public function index()
    {
        return view('mzui.company.index')->with([
            // TODO:传输数据
        ]);
    }

}

