<?php
namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;

class CompanyController extends Controller
{

    public function index()
    {
        return view('home.company.index');
    }
}

