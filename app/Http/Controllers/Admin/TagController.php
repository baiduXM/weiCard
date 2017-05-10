<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;

class TagController extends Controller
{
    public function index()
    {
//        $model = new Department();
//        $query = Department::query();
//        $params = Input::query();
//        if ($params) {
//            foreach ($params as $key => $value) {
//                if (array_key_exists($key, $model->query)) {
//                    $query->where($key, $model->query[$key], $value);
//                }
//            }
//        }
//        $departments = $query->with('company')->paginate();
        return view('admin.tag.index')->with([
//            'departments' => $departments,
//            'params' => $params,
        ]);
    }

    public function create()
    {

        return view('admin.tag.create')->with([
        ]);

    }

    public function store(Request $request)
    {

    }

    public function show($id)
    {
        return view('admin.tag.show')->with([]);
    }

    public function edit($id)
    {
        return view('admin.tag.edit')->with([]);
    }

    public function update(Request $request, $id)
    {

    }

    public function destroy($id)
    {

    }
}