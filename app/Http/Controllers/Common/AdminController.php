<?php

namespace App\Http\Controllers\Common;

class AdminController extends CommonController
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }
}

