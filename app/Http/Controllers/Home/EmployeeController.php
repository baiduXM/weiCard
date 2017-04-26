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
        if (Auth::user()->employee) {
            $employees = Employee::where('company_id', '=', Auth::user()->employee->company->id)->paginate();
            return view('home.employee.index')->with([
                'employees' => $employees,
            ]);
        } else {
            return redirect()->back()->with('error', '请先绑定公司');
        }
    }

    /**
     * 添加员工
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
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
        /* 获取字段类型 */
        $data = $request->input('Employee');
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }
        $data['company_id'] = Auth::user()->company->id;

        /* 添加 */
        if (Employee::create($data)) {
            if ($request->ajax()) {
                return 1;
            }
            return redirect('company/employee')->with('success', '添加成功');
        } else {
            if ($request->ajax()) {
                return 0;
            }
            return redirect()->back();
        }
    }

    /**
     * 查看
     *
     * @param $id
     * @return \Illuminate\Database\Eloquent\Collection|\Illuminate\Database\Eloquent\Model|null|static|static[]
     */
    public function show($id)
    {
        $employee = Employee::with('company', 'department', 'user')->find($id);
        return $employee;
    }

    /*
     * 删除限制
     *
     * 绑定用户不能删除
     * 公司创始人不能删除
     */
    /**
     * 删除
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\RedirectResponse|int
     */
    public function destroy(Request $request, $id)
    {
        $employee = Employee::with('user', 'company')->find($id);

        if ($request->ajax()) {
            $err_code = 400;
            if ($employee->user_id) {
                $err_code = 401;
                $result = array('err' => $err_code, 'msg' => config('global.msg.' . $err_code), 'data' => array());

            }
            if ($employee->delete()) {
                $result = array('err' => $err_code, 'msg' => config('global.msg.' . $err_code), 'data' => array());
            }
            return $result;
        }

        if ($employee->user_id == $employee->company->user_id) {
            $employee->company->user_id = null;
            $employee->company->save();
        }
        if ($employee->delete()) {
            return redirect('admin/employee')->with('success', '删除成功 - ' . $employee->id);
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $employee->id);
        }
    }

}

