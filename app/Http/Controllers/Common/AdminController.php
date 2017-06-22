<?php

namespace App\Http\Controllers\Common;

class AdminController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }
}

