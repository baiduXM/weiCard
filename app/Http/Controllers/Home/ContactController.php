<?php
namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Home\Contact;
class ContactController extends Controller
{

    public function index()
    {
        $contact = Contact::all();
        return view('home.contact.index',['contact' => $contact]);
    }
}

