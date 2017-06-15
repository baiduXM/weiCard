<?php

namespace App\Http\Controllers\Mobile;

use Illuminate\Http\Request;

class EmployeeController extends CommonController
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
        return view('mzui.employee.index')->with([
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

    public function edit($id)
    {
    }

    public function update(Request $request, $id)
    {

    }

    public function destroy($id)
    {

    }

}

