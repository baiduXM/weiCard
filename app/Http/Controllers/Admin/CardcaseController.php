<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;

class CardcaseController extends Controller
{
    public function index()
    {
        return view('admin.cardcase.index')->with([
        ]);
    }

    public function create()
    {

        return view('admin.cardcase.create')->with([
        ]);

    }

    public function store(Request $request)
    {

    }

    public function show($id)
    {
        return view('admin.cardcase.show')->with([]);
    }

    public function edit($id)
    {
        return view('admin.cardcase.edit')->with([]);
    }

    public function update(Request $request, $id)
    {

    }

    public function destroy($id)
    {

    }
}