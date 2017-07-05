<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Department;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;

class DepartmentController extends HomeController
{

    public function __construct()
    {
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 我的同事
        Breadcrumbs::register('company.department', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('公司部门', route('company.department.index'));
        });
    }

    public function index()
    {
        $company = Auth::user()->company;
        $departments = Department::with('employees', 'owner')->where('company_id', $company->id)->paginate();
        return view('web.department.index')->with([
            'departments' => $departments, // 部门列表
        ]);
    }

    public function show($id)
    {
        $department = Department::with('employees', 'owner')->find($id);
        return $department;

    }

    public function store(Request $request)
    {
        /* 验证 */
        $this->validate($request, [
            'Department.name' => 'required',
        ], [], [
            'Department.name' => '部门名称',
        ]);
        /* 获取字段类型 */
        $data = $request->input('Department');
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }

        $data['company_id'] = Auth::user()->company->id;

        /* 添加 */
        if (Department::create($data)) {
            $err_code = 300;
        } else {
            $err_code = 301;
        }

        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');
    }

    public function update(Request $request, $id)
    {
        $department = Department::find($id);
        /* 验证 */
        $this->validate($request, [
            'Department.name' => 'required',
        ], [], [
            'Department.name' => '部门名称',
        ]);
        $data = $request->input('Department');

        foreach ($data as $key => $value) {
            if ($value !== '') {
                if (empty($value)) {
                    $department->$key = null;
                    continue;
                }
                $department->$key = $data[$key];
            }
        }
        if ($department->save()) {
            $err_code = 500;
        } else {
            $err_code = 501;
        }

        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');
    }

    public function destroy($id)
    {
        $department = Department::find($id);
        $err_code = 401; // 删除失败
        if ($department->delete()) {
            $err_code = 400; // 删除成功
        }
        if ($err_code % 100 == 0) {
            return redirect('company/department')->with('success', config('global.msg.' . $err_code));
        } else {
            return redirect()->back()->with('error', config('global.msg.' . $err_code));
        }
    }

}