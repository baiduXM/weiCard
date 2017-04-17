<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;

class DepartmentController extends Controller
{
    public function index()
    {
        return view('home.department.index');
    }
}