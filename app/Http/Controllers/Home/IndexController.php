<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;

class IndexController extends Controller
{

    public function index()
    {
        return view('home.index');
    }

    public function preview()
    {
        $template_name = 'W0001PCN01';
        return view($template_name . '.index')->with([
            'template_name' => $template_name,
        ]);
    }


}

