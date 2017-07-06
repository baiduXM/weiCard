<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\AdminController;
use App\Models\Company;
use App\Models\Department;
use Illuminate\Http\Request;
use Breadcrumbs;
use Illuminate\Support\Facades\Input;


class DepartmentController extends AdminController
{

    public function __construct()
    {

        // 首页 > 部门列表
        Breadcrumbs::register('admin.department', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.company');
            $breadcrumbs->push('部门列表', route('admin.company_department.index'));
        });

        // 首页 > 公司列表 > 添加
        Breadcrumbs::register('admin.department.create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.department');
            $breadcrumbs->push('添加', route('admin.company_department.create'));
        });

        // 首页 > 公司列表 > 详情
        Breadcrumbs::register('admin.department.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.department');
            $breadcrumbs->push('详情', route('admin.company_department.show', $id));
        });

        // 首页 > 公司列表 > 编辑
        Breadcrumbs::register('admin.department.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.department');
            $breadcrumbs->push('编辑', route('admin.company_department.edit', $id));
        });

    }

    public function index()
    {
        $model = new Department();
        $query = Department::query();
        $params = Input::query();
        $companies = Company::get();
        if ($params) {
            foreach ($params as $key => $value) {
                if (array_key_exists($key, $model->query)) {
                    $query->where($key, $model->query[$key], $value);
                }
            }
        }
        $departments = $query->with('company')->paginate();
        return view('admin.department.index')->with([
            'departments' => $departments,
            'companies'   => $companies,
            'params'      => $params,
        ]);
    }

    public function create()
    {
        $companies = Company::where('status', '=', '1')->with([
            'departments' => function ($query) {
                $query->where('pid', '=', 0);
            },
        ])->get();

        return view('admin.department.create')->with([
            'companies' => $companies,
        ]);

    }

    public function store(Request $request)
    {

    }

    public function show($id)
    {
        return view('admin.department.show')->with([]);
    }

    public function edit($id)
    {
        return view('admin.department.edit')->with([]);
    }

    public function update(Request $request, $id)
    {

    }

    public function destroy($id)
    {

    }
}