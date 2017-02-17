<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;


class IndexController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
<<<<<<< HEAD
//        $this->middleware('auth');
=======
        $this->middleware('auth:admin');
>>>>>>> 697f93b0898e0306a7faefa3bf9eb752fb448e6d
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
<<<<<<< HEAD
        return view('Admin.index');
=======
        $admin = Auth::guard('admin')->user();
        return view('admin.index');
>>>>>>> 697f93b0898e0306a7faefa3bf9eb752fb448e6d
    }


}
