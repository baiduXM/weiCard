<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\UploadController;
use App\Http\Controllers\Controller;
use App\Models\Employee;
use App\Models\Position;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;
use Breadcrumbs;

class EmployeeController extends Controller
{

    protected $path_type = 'employee'; // 文件路径保存分类
    /* 导入字段 */
    protected $inArray = array(
        'number' => '工号',
        'nickname' => '姓名',
        'email' => '邮箱',
        'mobile' => '手机',
        'telephone' => '座机',
    );
    /* 导出字段 */
    protected $outArray = array(
        'number' => '工号',
        'nickname' => '姓名',
        'bind_key' => '绑定码',
        'bind_url' => '绑定链接',
        'bind_has' => '是否绑定',
    );

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
        $position_only = Position::where('id', '=', $data['position_id'])->first();
        if ($position_only['is_only'] == 1) {
            $employee_only = Employee::where('position_id', '=', $data['position_id'])->first();
            if (!empty($employee_only)) {
                $allow = false;       //唯一职位已存在员工时，不允许添加
            } else {
                $allow = true;
            }
        } else {
            $allow = true;        //非唯一职位，允许添加
        }
        /* 获取文件类型 */
        if ($request->hasFile('Employee.avatar')) {
            $uploadController = new UploadController();
            $data['avatar'] = $uploadController->save($request->file('Employee.avatar'), $this->path_type, Auth::user()->company->name, $data['number']);
        }
        if ($allow) {
            foreach ($data as $key => $value) {
                if ($value === '') {
                    $data[$key] = null; // 未填字段设置为null，否则会保存''
                }
            }
            /* 获取文件类型 */
            if ($request->hasFile('Employee.avatar')) {
                $uploadController = new UploadController();
                $data['avatar'] = $uploadController->save($request->file('Employee.avatar'), $this->path_type, Auth::user()->company->name, $data['number']);
            }

            $data['company_id'] = Auth::user()->company->id;

            /* 添加 */
            if (Employee::create($data)) {
                $err_code = 300;
            } else {
                $err_code = 301;
            }
        } else {
            $err_code = 302;
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
        $position_only = Position::where('id', '=', $data['position_id'])->first();
        if ($position_only['is_only'] == 1) {
            $employee_only = Employee::where('position_id', '=', $data['position_id'])->first();
            if (!empty($employee_only)) {
                $allow = false;//唯一职位已存在员工时，不允许添加
            } else {
                $allow = true;
            }
        } else {
            $allow = true;//非唯一职位，允许添加
        }
        if ($allow) {
            /* 获取文件类型 */
            if ($request->hasFile('Employee.avatar')) {
                $uploadController = new UploadController();
                $data['avatar'] = $uploadController->save($request->file('Employee.avatar'), $this->path_type, $employee->company->name, $data['number']);
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
        } else {
            $err_code = 502;
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
     * 导入excel
     * 先上传文件、然后读取excel、解析、
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Routing\Redirector
     */
    public function import(Request $request)
    {
        if ($request->ajax()) {
            if ($request->hasFile('file')) {
                $file = $request->file('file');
                $uploadController = new UploadController();
                $excelPath = $uploadController->save($file, 'company', Auth::user()->company->name);
                /* TODO：导入数据，验证数据，错误录入，导出错误表，注明错误信息 */
                Excel::selectSheetsByIndex(0)->load($excelPath, function ($reader) use ($file) {
                    $error = array();
                    $data = $reader->all()->toArray();
                    $time = date('Y-m-d H:i:s', time());
                    $company_id = Auth::user()->company->id;
                    foreach ($data as $k => $items) {
                        foreach ($items as $key => $item) {
                            if (in_array($key, $this->inArray)) {
                                $res[$k][array_search($key, $this->inArray)] = $item;
                            }
                        }
                        $res[$k]['company_id'] = $company_id;
                        $res[$k]['created_at'] = $time;
                    }
                    $validator = Validator::make($res, [
                        '*.number' => 'required|unique:employees,employees.number,null,id,company_id,' . $company_id . '|regex:/^([A-Za-z0-9])*$/',
                    ], [], [
                        '*.number' => '工号'
                    ]);
                    if ($validator->fails()) {
                        $error[0] = $this->inArray;
                        $error[0][] = '错误信息';
                        foreach ($validator->errors()->toArray() as $key => $value) {
                            $k = explode('.', $key)[0];
                            $error[$k + 1] = $data[$k];
                            $error[$k + 1][] = implode('|', $value);
                            unset($res[$k]); // 移除错误数据
                        }
                    }
                    if ($res) {
                        Employee::insert($res);
                    }
                    Config::set('global.ajax.msg', '导入数据' . count($res) . '条成功，' . (count($error) - 1) . '条失败');
                    Config::set('global.ajax.data', array('cellData' => $error, 'filename' => $file->getClientOriginalName()));
                });
                /* TODO:导出错误数据(ajax错误) */
//                $extension = File::extension($excelPath);
//                $filename = explode('.', $file->getClientOriginalName())[0];
//                Excel::create(iconv('UTF-8', 'GBK', $filename . '[error]'), function ($excel) use ($error) {
//                    $excel->sheet(Auth::user()->company->name, function ($sheet) use ($error) {
//                        $sheet->rows($error);
//                    });
//                })->store()->download($extension);

                /* 导入数据后删除文件 */
                File::delete($excelPath);


            } else {
                $err_code = 802;
                Config::set('global.ajax.err', $err_code);
                Config::set('global.ajax.msg', config('global.msg.' . $err_code));
            }
            return Config::get('global.ajax');
        }
//        $excelPath = 'uploads/company/strong/excel1496710817[error].xlsx';
        return redirect('company/employee');
    }

    /**
     * 导出文件
     *
     * @param Request $request
     * @param string $format 导出文件格式
     * @param null $cellData 导出数据
     * @param null $filename 导出文件名
     */
    public function export(Request $request, $format = 'xls', $cellData = null, $filename = null)
    {
//        dd($request->all());
        $cellData = $cellData ? $cellData : $request->get('cellData');
        $filename = $filename ? $filename : $request->get('filename');

        if (!$cellData) {
            $employees = Auth::user()->company->employees;
            $cellData[0] = $this->outArray;
            foreach ($employees as $k => $employee) {
                foreach ($this->outArray as $key => $word) {
                    if ($key == 'bind_key') {
                        $cellData[$k + 1][$key] = Auth::user()->company->name . '/' . $employee->number;
                    } elseif ($key == 'bind_url') {
                        $cellData[$k + 1][$key] = url('user/binding?code=' . Auth::user()->company->name . '/' . $employee->number);
                    } elseif ($key == 'bind_has') {
                        $cellData[$k + 1][$key] = $employee->user_id ? '已绑定' : '';
                    } else {
                        $cellData[$k + 1][$key] = $employee->$key;
                    }
                }
            }
        }
        if (!$filename) {
            $filename = Auth::user()->company->display_name . date('Y-m-d H_i_s');
        }
        Excel::create(iconv('UTF-8', 'GBK', $filename), function ($excel) use ($cellData) {
            $excel->sheet('sheet1', function ($sheet) use ($cellData) {
                $sheet->rows($cellData);
            });
        })->export($format);

//        return redirect('company/employee');

    }

}

