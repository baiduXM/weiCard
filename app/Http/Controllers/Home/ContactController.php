<?php
namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Home\Contact;
class ContactController extends Controller
{

    public function index()
    {
        return view('home.contact.index');
    }
}

