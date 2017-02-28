<?php
namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;

class ContactController extends Controller
{

    public function index()
    {
        return view('home.contact.index');
    }
}

