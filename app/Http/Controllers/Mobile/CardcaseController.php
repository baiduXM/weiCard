<?php

namespace App\Http\Controllers\Mobile;

use Illuminate\Http\Request;

class CardcaseController extends CommonController
{

    public function __construct()
    {
        // TODO
    }

    /**
     * 首页
     */
    public function index()
    {
        return view('mzui.cardcase.index')->with([
            // TODO:传输数据
        ]);
    }

    public function create()
    {
        return view('mzui.cardcase.create')->with([
        ]);

    }

    public function store(Request $request)
    {

    }

    public function show($type = 'u')
    {

    }

    public function edit()
    {
        return view('mzui.cardcase.edit')->with([
        ]);
    }

    public function update(Request $request, $id)
    {

    }

    public function destroy($id)
    {

    }

}

