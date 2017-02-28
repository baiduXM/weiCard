<?php
namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;

class EmployeeController extends Controller
{

    public function index()
    {
        return view('home.employee.index');
    }
}

