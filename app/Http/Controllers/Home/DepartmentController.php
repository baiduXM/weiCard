<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Department;
use App\Models\Employee;
use App\Models\Position;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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
//        $this->validate($request, [
//            'Position.name' => 'required',
//            // 'Position.level' => 'required|regex:/^[0-9]*$/',
//            // 'Position.is_only' => 'boolean',
//        ], [], [
//            'Position.name' => '职位名称',
//            // 'Position.level' => '职位级别',
//            // 'Position.is_only' => '是否唯一',
//        ]);
//        /* 获取字段类型 */
//        $data = $request->input('Position');
//        foreach ($data as $key => $value) {
//            if ($value === '') {
//                $data[$key] = null; // 未填字段设置为null，否则会保存''
//            }
//        }
//
//        $data['company_id'] = Auth::user()->company->id;
//
//        /* 添加 */
//        if (Position::create($data)) {
//            $err_code = 300;
//        } else {
//            $err_code = 301;
//        }
//
//        Config::set('global.ajax.err', $err_code);
//        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
//        return Config::get('global.ajax');
//        // TODO:添加部门，只需要名称
    }

    public function update($id)
    {
        // TODO:更新，设置主管
    }

    public function destroy($id)
    {
        // TODO:删除部门，所属员工无部门
    }

}