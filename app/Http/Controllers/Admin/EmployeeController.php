<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use Illuminate\Http\Request;
use Breadcrumbs;
use App\Models\Common;

class EmployeeController extends Controller
{
    public function __construct()
    {
        // 首页 > 员工列表
        Breadcrumbs::register('admin.employee', function ($breadcrumbs) {
            $breadcrumbs->parent('admin');
            $breadcrumbs->push('员工列表', route('admin.employee.index'));
        });

        // 首页 > 公司列表 > 添加
        Breadcrumbs::register('admin.employee.create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.employee');
            $breadcrumbs->push('添加', route('admin.company.create'));
        });

        // 首页 > 公司列表 > 详情
        Breadcrumbs::register('admin.employee.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.employee');
            $breadcrumbs->push('详情', route('admin.employee.show', $id));
        });

        // 首页 > 公司列表 > 编辑
        Breadcrumbs::register('admin.employee.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.employee');
            $breadcrumbs->push('编辑', route('admin.employee.edit', $id));
        });
    }

    public function index()
    {
        $employees = Employee::paginate();
        return view('admin.employee.index')->with([
            'employees' => $employees,
            'common' => new Common(),
        ]);
    }

    public function create()
    {
        return view('admin.employee.create')->with([
//            'companies' => $companies,
//            'common' => new Common(),
        ]);
    }

    public function store(Request $request)
    {

    }

    public function show($id)
    {
        return view('admin.employee.show')->with([
//            'companies' => $companies,
//            'common' => new Common(),
        ]);
    }

    public function edit($id)
    {
        return view('admin.employee.edit')->with([
//            'companies' => $companies,
//            'common' => new Common(),
        ]);
    }

    public function update(Request $request)
    {

    }

    public function destroy($id)
    {

    }

}