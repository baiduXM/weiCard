<?php
namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Home\User;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{

    public function index()
    {
        $user = User::find(Auth::id());
        return view('home.user.index')->with('user', $user);
    }

    public function create()
    {
        // TODO
    }

    public function store(Request $request)
    {
        // TODO
    }

    public function show($id)
    {
        // TODO
    }

    public function edit($id)
    {
        // TODO
        $user = User::find($id);
        return view('home.user.edit')->with('user', $user);
    }

    public function update(Request $request, $id)
    {
        // TODO
    }

    public function destroy($id)
    {
        // TODO
    }
}