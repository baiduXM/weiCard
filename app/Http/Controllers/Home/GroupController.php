<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;

class GroupController extends Controller
{
    public function index()
    {
        return view('home.group.index');
    }
}