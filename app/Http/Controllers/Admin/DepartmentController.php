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
        Breadcrumbs::register('mpmanager.department', function ($breadcrumbs) {
            $breadcrumbs->parent('mpmanager.company');
            $breadcrumbs->push('部门列表', route('mpmanager.company_department.index'));
        });

        // 首页 > 公司列表 > 添加
        Breadcrumbs::register('mpmanager.department.create', function ($breadcrumbs) {
            $breadcrumbs->parent('mpmanager.department');
            $breadcrumbs->push('添加', route('mpmanager.company_department.create'));
        });

        // 首页 > 公司列表 > 详情
        Breadcrumbs::register('mpmanager.department.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('mpmanager.department');
            $breadcrumbs->push('详情', route('mpmanager.company_department.show', $id));
        });

        // 首页 > 公司列表 > 编辑
        Breadcrumbs::register('mpmanager.department.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('mpmanager.department');
            $breadcrumbs->push('编辑', route('mpmanager.company_department.edit', $id));
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
        $data = $request->input('Department');
        /* 验证 */
        $this->validate($request, [
            'Department.company_id' => 'required',
            'Department.name'       => 'required',
        ], [], [
            'Department.company_id' => '所属公司',
            'Department.name'       => '部门名称',
        ]);

        /* 获取字段类型 */
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }
        /* 添加 */
        if (Department::create($data)) {
            return redirect('admin/company_department')->with('success', '添加成功');
        } else {
            return redirect()->back();
        }
    }

    public function show($id)
    {

        $department = Department::find($id);
        return view('admin.department.show')->with([
            'department' => $department,
        ]);
    }

    public function edit($id)
    {
        $department = Department::with('employees')->find($id);
        return view('admin.department.edit')->with([
            'department' => $department,
        ]);
    }

    public function update(Request $request, $id)
    {
        $department = Department::find($id);
        $this->validate($request, [
            'Department.company_id' => 'required',
            'Department.name'       => 'required',
        ], [], [
            'Department.company_id' => '所属公司',
            'Department.name'       => '部门名称',
        ]);
        $data = $request->input('Department');

        foreach ($data as $key => $value) {
            if ($key == 'employee_id' && $value == 0) {
                $department->$key = null;
            } elseif ($value !== '') {
                $department->$key = $data[$key];
            }
        }
        if ($department->save()) {
            return redirect()->back()->with('success', '修改成功 - ' . $department->id);
        } else {
            return redirect()->back();
        }
    }

    public function destroy($id)
    {
        $department = Department::find($id);
        if ($department->delete()) {
            return redirect('admin/company_department')->with('success', '删除成功 - ' . $department->id);
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $department->id);
        }
    }

    /**
     * 批量删除
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function batchDestroy(Request $request)
    {
        $ids = explode(',', $request->input('ids'));
        $res = Department::whereIn('id', $ids)->delete();
        if ($res) {
            return redirect('admin/company_department')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $res . '条记录');
        }
    }
}