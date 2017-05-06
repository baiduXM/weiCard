<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Breadcrumbs;


class PositionController extends Controller
{

    public function __construct()
    {

//        // 首页 > 部门列表
//        Breadcrumbs::register('admin.department', function ($breadcrumbs) {
//            $breadcrumbs->parent('admin.company');
//            $breadcrumbs->push('部门列表', route('admin.company_department.index'));
//        });


    }

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
        return view('admin.position.index')->with([
//            'departments' => $departments,
//            'params' => $params,
        ]);
    }

    public function create()
    {
//        $companies = Company::where('status', '=', '1')->with([
//            'departments' => function ($query) {
//                $query->where('pid', '=', 0);
//            }
//        ])->get();
//
//        return view('admin.department.create')->with([
//            'companies' => $companies,
//        ]);

    }

    public function store(Request $request)
    {

    }

    public function show($id)
    {
//        return view('admin.department.show')->with([]);
    }

    public function edit($id)
    {
//        return view('admin.department.edit')->with([]);
    }

    public function update(Request $request, $id)
    {

    }

    public function destroy($id)
    {

    }
}