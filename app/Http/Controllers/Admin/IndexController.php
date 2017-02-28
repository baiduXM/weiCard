<?php

namespace App\Http\Controllers\Admin;

use Gate;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;


class IndexController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index(Request $request)
    {
//        $admin = Manager::findOrFail($id);
//        $admin = Auth::guard('admin')->user();
////        dd($admin);
//        if ($request->user()->cannot('update-post', $admin)) {
//            dd('cannot');
//
//            abort(403);
//        }
//
//
//        dd(Gate::denies('super-admin', $admin));
//        if (Gate::denies('super-admin', $admin)) {
//            dd('Gate');
//        }
//
//        if (Gate::forUser($admin)->allows('update-post', $admin)) {
//            //
//        }
            return view('admin.index');

    }


}
