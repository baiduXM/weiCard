<?php

namespace App\Http\Controllers\Common;

class AdminController extends Controller
{
    protected $pageSize = 30;

    public function __construct()
    {
        $this->middleware('auth:admin');
    }

}

