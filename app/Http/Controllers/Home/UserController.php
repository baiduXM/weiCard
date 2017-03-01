<?php
namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Home\User;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    public function index()
    {
//        dd(Auth::user());

        $user = User::find(Auth::id());
        dd($user);
        return view('home.user.index')->with('user', $user);
    }
}