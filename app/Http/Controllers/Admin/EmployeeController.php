<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\AdminController;
use App\Models\Company;
use App\Models\Employee;
use App\Models\Position;
use Illuminate\Http\Request;
use Breadcrumbs;
use App\Models\CommonModel;
use Illuminate\Support\Facades\Input;


class EmployeeController extends AdminController
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
     */
    public function index(Request $request)
    {
        $model = new Employee();
        $params = Input::query();
        $query = Employee::query();
        if ($params) {
            foreach ($params as $key => $value) {
                if (array_key_exists($key, $model->query)) {
                    $query->where($key, $model->query[$key], $value);
                }
            }
        }
        if ($request->is('*/trash')) {
            $employees = $query->onlyTrashed()->with('company')->paginate(); // 删除了
        } else {
            $employees = $query->with('company')->paginate();
        }
        $companies = Company::get();
        return view('admin.employee.index')->with([
            'employees' => $employees,
            'companies' => $companies,
            'params'    => $params,
        ]);
    }

    public function create()
    {
        $companies = Company::where('status', '=', '1')->get();
        if (count($companies) > 0) {
            return view('admin.employee.create')->with([
                'companies' => $companies,
                'common'    => new CommonModel(),
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
            'Employee.number'     => 'required|unique:employees,employees.number,null,id,company_id,' . $data['company_id'] . '|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',
            'Employee.nickname'   => 'required',
            'Employee.avatar'     => 'image|max:' . 2 * 1024, // 最大2MB
            'Employee.telephone'  => '',
            'Employee.mobile'     => 'unique:employees,employees.mobile',
        ], [], [
            'Employee.company_id'    => '公司',
            'Employee.department_id' => '部门',
            'Employee.number'        => '工号',
            'Employee.nickname'      => '姓名',
            'Employee.avatar'        => '头像',
            'Employee.telephone'     => '座机',
            'Employee.mobile'        => '手机',

        ]);

        /* 获取字段类型 */
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }
        $company = Company::find($data['company_id']);
        /* 获取文件类型 */
        if ($request->hasFile('Employee.avatar')) {
            $data['avatar'] = $this->save($request->file('Employee.avatar'), $this->path_type, $company->name, $data['number']);
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
        $employee = Employee::withTrashed()->find($id);
        return view('admin.employee.show')->with([
            'employee' => $employee,
            'common'   => new CommonModel(),
        ]);
    }

    public function edit($id)
    {
        $employee = Employee::find($id);
        $positions = Position::where('company_id', $employee->company_id)->get();
        return view('admin.employee.edit')->with([
            'employee'  => $employee,
            'positions' => $positions,
            'common'    => new CommonModel(),
        ]);
    }

    public function update(Request $request, $id)
    {
        $employee = Employee::find($id);
        $this->validate($request, [
            'Employee.company_id'    => 'required',
            'Employee.department_id' => '',
            'Employee.positions'     => '',
            'Employee.number'        => 'required|unique:employees,employees.number,' . $id . ',id,company_id,' . $employee->company_id . '|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',
            'Employee.nickname'      => 'required',
            'Employee.avatar'        => 'image|max:' . 2 * 1024, // 最大2MB
            'Employee.telephone'     => '',
        ], [], [
            'Employee.company_id'    => '公司',
            'Employee.department_id' => '部门',
            'Employee.positions'     => '职位',
            'Employee.number'        => '工号',
            'Employee.nickname'      => '姓名',
            'Employee.avatar'        => '头像',
            'Employee.telephone'     => '座机',
        ]);
        $data = $request->input('Employee');

        /* 获取文件类型 */
        if ($request->hasFile('Employee.avatar')) {
            $data['avatar'] = $this->save($request->file('Employee.avatar'), $this->path_type, $employee->company->name, $data['number']);
        }
        foreach ($data as $key => $value) {
            if (empty($value)) {
                $employee->$key = null;
            } else {
                $employee->$key = $value;
            }
        }
        if ($employee->save()) {
            return redirect()->back()->with('success', '修改成功 - ' . $employee->id);
        } else {
            return redirect()->back();
        }

    }

    public function destroy($id)
    {
        $employee = Employee::with('user', 'company')->find($id);
        dd($this->handoverCardcase2Company($employee));
        $employee->mobile = null;
        $employee->save();
        dump($employee);
        if ($employee->delete()) {
            return redirect()->back()->with('success', '删除成功 - ' . $employee->id);
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

    /**
     * 解绑员工
     *
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function unbinding($id)
    {
        $res = $this->unbindEmployee($id);
        if ($res === true) {
            return redirect('admin/company_employee')->with('success', '解绑成功');
        } else {
            return redirect()->back()->with('error', $res);
        }
    }

    /**
     * 恢复员工
     *
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function recover($id)
    {
        $res = Employee::onlyTrashed()->where('id', $id)->restore();
        if ($res) {
            return redirect('admin/company_employee')->with('success', '恢复成功');
        } else {
            return redirect()->back()->with('error', '恢复失败');

        }
    }


}