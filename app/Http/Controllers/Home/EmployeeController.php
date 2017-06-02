<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Position;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Breadcrumbs;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Input;
use Maatwebsite\Excel\Facades\Excel;

class EmployeeController extends Controller
{

    protected $path_type = 'employee'; // 文件路径保存分类

    public function __construct()
    {
        parent::isMobile();

        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 我的同事
        Breadcrumbs::register('company.employee', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('我的同事', route('company.employee.index'));
        });
    }

    /**
     * 显示员工（除自己）
     *
     * @return $this
     */
    public function index()
    {
        if ($this->is_mobile) {
            return view('mobile.employee.index')->with([
                'employee' => Auth::user()->employee,
            ]);
        }
        if (Auth::user()->employee) {
            $employees = Employee::with(['followers' => function ($query) {
                $query->where('user_id', '=', Auth::id());
            }])->where('company_id', '=', Auth::user()->employee->company_id)
                ->paginate();
            $positions = Position::where('company_id', '=', Auth::user()->employee->company_id)->get();
            return view('home.employee.index')->with([
                'employees' => $employees,
                'positions' => $positions,
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
            'Employee.nickname' => 'required',
            'Employee.email' => 'email|unique:employees,employees.email,',
            'Employee.avatar' => 'image|max:' . 2 * 1024, // 最大2MB
            'Employee.telephone' => '',
            'Employee.mobile' => '',
        ], [], [
            'Employee.number' => '工号',
            'Employee.nickname' => '姓名',
            'Employee.email' => '邮箱',
            'Employee.avatar' => '头像',
            'Employee.telephone' => '座机',
            'Employee.mobile' => '手机',
        ]);
        /* 获取字段类型 */
        $data = $request->input('Employee');
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

        $data['company_id'] = Auth::user()->company->id;

        /* 添加 */
        if (Employee::create($data)) {
            $err_code = 300;
        } else {
            $err_code = 301;
        }

        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');
    }

    /**
     * 查看
     *
     * @param $id
     * @return \Illuminate\Database\Eloquent\Collection|\Illuminate\Database\Eloquent\Model|null|static|static[]
     */
    public function show($id)
    {
        $employee = Employee::with('company', 'department', 'user', 'position')->find($id);
        return $employee;
    }


    /**
     * 更新
     *
     * @param Request $request
     * @param $id
     * @return mixed
     */
    public function update(Request $request, $id)
    {
        $employee = Employee::find($id);
        /* 验证 */
        $this->validate($request, [
            'Employee.number' => 'required|unique:employees,employees.number,' . $id . ',id,company_id,' . $employee->company_id . '|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',// TODO:BUG
            'Employee.nickname' => 'required',
            'Employee.email' => 'email|unique:employees,employees.email,' . $id,
            'Employee.avatar' => 'image|max:' . 2 * 1024, // 最大2MB
            'Employee.telephone' => '',
            'Employee.mobile' => '',
        ], [], [
            'Employee.number' => '工号',
            'Employee.nickname' => '姓名',
            'Employee.email' => '邮箱',
            'Employee.avatar' => '头像',
            'Employee.telephone' => '座机',
            'Employee.mobile' => '手机',
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
            $err_code = 500;
        } else {
            $err_code = 501;
        }

        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');
    }

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
        if ($employee->user_id) {
            $err_code = 401; // 删除失败 - 员工已绑定用户
        } else {
            $employee->delete();
            $err_code = 400; // 删除成功
        }
        if ($err_code % 100 == 0) {
            return redirect('company/employee')->with('success', config('global.msg.' . $err_code));
        } else {
            return redirect()->back()->with('error', config('global.msg.' . $err_code));
        }
    }

    /**
     * 批量添加
     */
    public function batchAdd()
    {

    }

    /**
     * 导入excel
     *
     * 先上传文件、然后读取excel、解析、
     */
    public function import(Request $request)
    {
//        return $request->file('excel_file');
        if ($request->ajax()) {

//            return $request->all();
//            return $request->file('file');
//            return Input::get('data');
            if ($request->hasFile('file')) {
                $uploadController = new UploadController();
                $excelPath = $uploadController->save($request->file('excel_file'), 'company', Auth::user()->company->name);
                return $excelPath;

                $err_code = 800;
            } else {
                $err_code = 802;
                Config::set('global.ajax.err', $err_code);
                Config::set('global.ajax.msg', config('global.msg.' . $err_code));
                return Config::get('global.ajax');
            }
        }
//        return Auth::user()->company->name;
        return redirect('company/employee');


//        Excel::load();
    }

}

