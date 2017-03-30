<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Home\Company;

class CompanyController extends Controller
{


    public function index()
    {
//        dd(Company::all());
        return view('home.company.index');
    }


    public function group()
    {
        return view('home.company.group');
    }

    public function register()
    {
        return view('home.company.register');
    }

    public function department()
    {
        return view('home.company.department');
    }

    public function employee()
    {
        return view('home.company.employee');
    }

    public function workmate()
    {
        return view('home.company.workmate');
    }


}

