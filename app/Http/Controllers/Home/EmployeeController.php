<?php

namespace App\Http\Controllers\Home;

use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Breadcrumbs;

class EmployeeController extends CompanyController
{
    public function __construct()
    {
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 我的同事
        Breadcrumbs::register('company.employee', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('我的同事', route('employee.index'));
        });
    }

    /**
     * 显示员工（除自己）
     *
     * @return $this
     */
    public function index()
    {
        $employees = Employee::where('company_id', '=', Auth::user()->employee->company->id)
            ->paginate();
        return view('home.employee.index')->with([
            'employees' => $employees,
        ]);
    }

    /**
     * 添加员工
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {

        if ($request->ajax()) {
            /* 验证 */
            $this->validate($request, [
                'Employee.number' => 'required|unique:employees,employees.number|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',// TODO:BUG
                'Employee.name' => 'required',
                'Employee.title' => 'max:30',
                'Employee.mobile' => 'numeric',
                'Employee.telephone' => 'numeric',
                'Employee.description' => 'max:255',
            ], [], [
                'Employee.number' => '工号',
                'Employee.name' => '姓名',
                'Employee.title' => '职位',
                'Employee.mobile' => '手机',
                'Employee.telephone' => '座机',
                'Employee.description' => '个人简介',
            ]);
            return $request->all();
            return 1111;
        } else {
            return 2222;
        }

        /* 验证 */
        $this->validate($request, [
            'Employee.number' => 'required|unique:employees,employees.number|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',// TODO:BUG
            'Employee.name' => 'required',
            'Employee.title' => 'max:30',
            'Employee.mobile' => 'numeric',
            'Employee.telephone' => 'numeric',
            'Employee.description' => 'max:255',
        ], [], [
            'Employee.number' => '工号',
            'Employee.name' => '姓名',
            'Employee.title' => '职位',
            'Employee.mobile' => '手机',
            'Employee.telephone' => '座机',
            'Employee.description' => '个人简介',
        ]);
//
//        /* 获取字段类型 */
//        $data = $request->input('Employee');
//        foreach ($data as $key => $value) {
//            if ($value === '') {
//                $data[$key] = null; // 未填字段设置为null，否则会保存''
//            }
//        }
//
//        /* 添加 */
//        if (Employee::create($data)) {
//            return redirect('admin/employee')->with('success', '添加成功');
//        } else {
//            return redirect()->back();
//        }
    }


}

