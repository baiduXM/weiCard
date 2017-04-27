<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\Employee;
use App\Models\User;
use Illuminate\Http\Request;
use Breadcrumbs;
use App\Models\Common;
use Illuminate\Support\Facades\Input;

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
        $model = new Employee();
        $query = Employee::query();
        $params = Input::query();
        if ($params) {
            foreach ($params as $key => $value) {
                if (in_array($key, $model->query)) {
                    $query->where($key, '=', $value);
                }
            }
        }
        $employees = $query->with('company')->paginate();
        return view('admin.employee.index')->with([
            'employees' => $employees,
            'common' => new Common(),
            'params' => $params,
        ]);
    }

    public function create()
    {
        $companies = Company::where('status', '=', '1')->get();
        return view('admin.employee.create')->with([
            'companies' => $companies,
            'common' => new Common(),
        ]);
    }

    public function store(Request $request)
    {

        $data = $request->input('Employee');
        /* 验证 */
        $this->validate($request, [
            'Employee.company_id' => 'required',
            'Employee.number' => 'required|unique:employees,employees.number,null,id,company_id,' . $data['company_id'] . '|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',
            'Employee.name' => 'required',
            'Employee.title' => 'max:30',
            'Employee.mobile' => 'numeric',
            'Employee.telephone' => 'numeric',
            'Employee.description' => 'max:255',
        ], [], [
            'Employee.company_id' => '公司',
            'Employee.number' => '工号',
            'Employee.name' => '姓名',
            'Employee.title' => '职位',
            'Employee.mobile' => '手机',
            'Employee.telephone' => '座机',
            'Employee.description' => '个人简介',
        ]);

        /* 获取字段类型 */
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }

        /* 添加 */
        if (Employee::create($data)) {
            return redirect('admin/employee')->with('success', '添加成功');
        } else {
            return redirect()->back();
        }
    }

    public function show($id)
    {
        $employee = Employee::find($id);
        return view('admin.employee.show')->with([
            'employee' => $employee,
            'common' => new Common(),
        ]);
    }

    public function edit($id)
    {
        $employee = Employee::find($id);
        return view('admin.employee.edit')->with([
            'employee' => $employee,
            'common' => new Common(),
        ]);
    }

    public function update(Request $request, $id)
    {
        $employee = Employee::find($id);
//        dd($employee->company_id);
        $this->validate($request, [
            'Employee.number' => 'required|unique:employees,employees.number,' . $id . ',id,company_id,' . $employee->company_id . '|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',
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
        $data = $request->input('Employee');

        foreach ($data as $key => $value) {
            if ($value !== '') {
                $employee->$key = $data[$key];
            }
        }

        if ($employee->save()) {
            return redirect('admin/employee')->with('success', '修改成功 - ' . $employee->id);
        } else {
            return redirect()->back();
        }
    }

    public function destroy($id)
    {
        $employee = Employee::with('user', 'company')->find($id);
        if ($employee->user_id == $employee->company->user_id) {
            $employee->company->user_id = null;
            $employee->company->save();
        }
//        }
        if ($employee->delete()) {
            return redirect('admin/employee')->with('success', '删除成功 - ' . $employee->id);
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $employee->id);
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

        /* 员工是公司创始人，设置创始人为空 */
        $employees = Employee::with('user', 'company')->whereIn('id', $ids)->get();
        foreach ($employees as $key => $employee) {
            if ($employee->user_id == $employee->company->user_id) {
                $employee->company->user_id = null;
                $employee->company->save();
            }
        }
        $res = Employee::whereIn('id', $ids)->delete();
        if ($res) {
            return redirect('admin/employee')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $res . '条记录');
        }
    }

}