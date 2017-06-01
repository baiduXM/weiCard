<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\Employee;
use Illuminate\Http\Request;
use Breadcrumbs;
use App\Models\Common;
use Illuminate\Support\Facades\Input;
use App\Http\Controllers\Common\UploadController;


class EmployeeController extends Controller
{
    protected $path_type = 'employee'; // 文件路径保存分类

    public function __construct()
    {

        // 首页 > 员工列表
        Breadcrumbs::register('admin.employee', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.company');
            $breadcrumbs->push('员工列表', route('admin.company_employee.index'));
        });

        // 首页 > 员工列表 > 添加
        Breadcrumbs::register('admin.employee.create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.employee');
            $breadcrumbs->push('添加', route('admin.company_employee.create'));
        });

        // 首页 > 员工列表 > 详情
        Breadcrumbs::register('admin.employee.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.employee');
            $breadcrumbs->push('详情', route('admin.company_employee.show', $id));
        });

        // 首页 > 员工列表 > 编辑
        Breadcrumbs::register('admin.employee.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.employee');
            $breadcrumbs->push('编辑', route('admin.company_employee.edit', $id));
        });
    }

    /**
     * 首页
     *
     */
    public function index()
    {

        $model = new Employee();
        $query = Employee::query();
        $params = Input::query();
        if ($params) {
            foreach ($params as $key => $value) {
                if (array_key_exists($key, $model->query)) {
                    $query->where($key, $model->query[$key], $value);
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
        if (count($companies) > 0) {
            return view('admin.employee.create')->with([
                'companies' => $companies,
                'common' => new Common(),
            ]);
        } else {
            return redirect('admin/company')->with('error', '没有审核通过的公司可选择');
        }
    }

    public function store(Request $request)
    {

        $data = $request->input('Employee');
        /* 验证 */
        $this->validate($request, [
            'Employee.company_id' => 'required',
            'Employee.department_id' => '',
            'Employee.position_id' => '',
            'Employee.number' => 'required|unique:employees,employees.number,null,id,company_id,' . $data['company_id'] . '|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',
            'Employee.nickname' => 'required',
            'Employee.avatar' => 'image|max:' . 2 * 1024, // 最大2MB
            'Employee.telephone' => '',
        ], [], [
            'Employee.company_id' => '公司',
            'Employee.department_id' => '部门',
            'Employee.position_id' => '职位',
            'Employee.number' => '工号',
            'Employee.nickname' => '姓名',
            'Employee.avatar' => '头像',
            'Employee.telephone' => '座机',
        ]);

        /* 获取字段类型 */
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }

        /* 获取文件类型 */
        if ($request->hasFile('Employee.avatar')) {
            $uploadController = new UploadController();
            $data['avatar'] = $uploadController->save($request->file('Employee.avatar'), $this->path_type, $data['number']);
        }

        /* 添加 */
        if (Employee::create($data)) {
            return redirect('admin/company_employee')->with('success', '添加成功');
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
        $this->validate($request, [
            'Employee.company_id' => 'required',
            'Employee.department_id' => '',
            'Employee.position_id' => '',
            'Employee.number' => 'required|unique:employees,employees.number,' . $id . ',id,company_id,' . $employee->company_id . '|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',
            'Employee.nickname' => 'required',
            'Employee.avatar' => 'image|max:' . 2 * 1024, // 最大2MB
            'Employee.telephone' => '',
        ], [], [
            'Employee.company_id' => '公司',
            'Employee.department_id' => '部门',
            'Employee.position_id' => '职位',
            'Employee.number' => '工号',
            'Employee.nickname' => '姓名',
            'Employee.avatar' => '头像',
            'Employee.telephone' => '座机',
        ]);
        $data = $request->input('Employee');

        /* 获取文件类型 */
        if ($request->hasFile('Employee.avatar')) {
            $uploadController = new UploadController();
            $data['avatar'] = $uploadController->save($request->file('Employee.avatar'), $this->path_type, $data['number']);
        }

        foreach ($data as $key => $value) {
            if ($value !== '') {
                $employee->$key = $data[$key];
            }
        }
        if ($employee->save()) {
            return redirect('admin/company_employee')->with('success', '修改成功 - ' . $employee->id);
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
            return redirect('admin/company_employee')->with('success', '删除成功 - ' . $employee->id);
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
            return redirect('admin/company_employee')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $res . '条记录');
        }
    }


}