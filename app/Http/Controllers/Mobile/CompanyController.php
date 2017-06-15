<?php

namespace App\Http\Controllers\Mobile;

class CompanyController extends CommonController
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

