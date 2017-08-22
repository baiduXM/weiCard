<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Department;
use App\Models\Employee;
use App\Models\TemplateGroup;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Validator;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Input;
use Breadcrumbs;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class EmployeeController extends HomeController
{

    protected $path_type = 'employee'; // 文件路径保存分类
    /* 导入字段 */
    protected $importArray = array(
        'department_id' => '部门',
        'positions'     => '职位',
        'number'        => '工号',
        'nickname'      => '姓名',
        'email'         => '邮箱',
        'mobile'        => '手机',
        'telephone'     => '座机',
    );
    /* 导出字段 */
//* 工号，姓名，部门，职位，手机，是否绑定，员工二维码

    protected $exportArray = array(
        'company'    => '公司',
        'number'     => '工号',
        'nickname'   => '姓名',
        'department' => '部门',
        'positions'  => '职位',
        'mobile'     => '手机',
        'card_url'   => '名片地址',
//        'qrcode_url' => '二维码地址',
        'has_bind'   => '是否绑定',
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
     * @return View
     */
    public function index()
    {
        if ($this->is_mobile) {
            return view('mobile.employee.index')->with([
                'employee' => Auth::user()->employee,
                'company'  => Auth::user()->company,
            ]);
        }

        if (!Auth::user()->company) {
            return redirect()->to('user')->with('error', '请先绑定公司');
        }

        $company = Auth::user()->company;
        $departments = Department::where('company_id', $company->id)->get();
        $templategroups = TemplateGroup::where('company_id', $company->id)->get();

        $query = Employee::query();
        $params = Input::query();

        if (!empty($params) && !empty($params['word']) && !empty(trim($params['keyword']))) {
            $word = $params['word'];
            $keyword = trim($params['keyword']);
            if ($word == 'department') {
                foreach ($departments as $k => $v) {
                    // if($v->name == $keyword){//精确搜索
                    if (strpos($v->name, $keyword) !== false) {//模糊搜索
                        $department_id[] = $v->id;
                        // break;
                    } else {
                        $department_id[] = '';
                    }
                }
                $query->whereIn('department_id', $department_id)->orderBy('department_id', 'DESC')->orderBy('positions', 'DESC');
            } else {
                $query->where($word, 'like', '%' . $keyword . '%')->orderBy('department_id', 'DESC')->orderBy('positions', 'DESC');
            }
        }
        $employees = $query->where('company_id', '=', $company->id)->orderBy('created_at', 'desc')->paginate();

        return view('web.employee.index')->with([
            'employees'      => $employees,
            'departments'    => $departments,
            'templategroups' => $templategroups,
            'params'         => $params,
        ]);
    }

    /**
     * 离职员工列表
     */
    public function trash()
    {
        if (!Auth::user()->company) {
            return redirect()->to('user')->with('error', '请先绑定公司');
        }

        $company = Auth::user()->company;
        $departments = Department::where('company_id', $company->id)->get();

        $query = Employee::query();
        $params = Input::query();

        if (!empty($params) && !empty($params['word']) && !empty($params['keyword'])) {
            $word = $params['word'];
            $keyword = $params['keyword'];
            if ($word == 'department') {
                foreach ($departments as $k => $v) {
                    // if($v->name == $keyword){//精确搜索
                    if (strpos($v->name, $keyword) !== false) {//模糊搜索
                        $department_id[] = $v->id;
                        // break;
                    } else {
                        $department_id[] = '';
                    }
                }
                $query->whereIn('department_id', $department_id)->orderBy('department_id', 'DESC')->orderBy('positions', 'DESC');
            } else {
                $query->where($word, 'like', '%' . $keyword . '%')->orderBy('department_id', 'DESC')->orderBy('positions', 'DESC');
            }
        }
        $employees = $query->where('company_id', '=', $company->id)->onlyTrashed()->orderBy('created_at', 'desc')->paginate();
        return view('web.employee.trash')->with([
            'employees'   => $employees,
            'departments' => $departments,
            'params'      => $params,
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
        if (Auth::user()->company) {
            $company = Auth::user()->company;
        } else {
            return redirect()->to('user')->with('error', '获取公司错误');
        }
//        dump($request->all());
//        exit;
        /* 验证 */
        $this->validate($request, [
            'Employee.number'    => 'required|unique:employees,employees.number,null,id,company_id,' . $company->id . '|regex:/^([A-Za-z0-9])*$/',// TODO:BUG
            'Employee.nickname'  => 'required',
            'Employee.mobile'    => 'unique:employees,employees.mobile|numeric',
            'Employee.email'     => 'email',
            'Employee.avatar'    => 'image|max:' . 2 * 1024, // 最大2MB
            'Employee.telephone' => '',
        ], [], [
            'Employee.number'    => '工号',
            'Employee.nickname'  => '姓名',
            'Employee.email'     => '邮箱',
            'Employee.avatar'    => '头像',
            'Employee.telephone' => '座机',
            'Employee.mobile'    => '手机',
        ]);
        /* 获取字段类型 */
        $data = $request->input('Employee');
        /* 获取文件类型 */
        if ($request->hasFile('Employee.avatar')) {
            $data['avatar'] = $this->save($request->file('Employee.avatar'), $this->path_type, Auth::user()->company->id, $data['number']);
        }
        foreach ($data as $key => $value) {
            if (trim($value) === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            } else {
                $data[$key] = trim($value); // 去除空格
            }
        }
        /* 获取文件类型 */
        if ($request->hasFile('Employee.avatar')) {
            $data['avatar'] = $this->save($request->file('Employee.avatar'), $this->path_type, Auth::user()->company->id, $data['number']);
        }

        $data['company_id'] = Auth::user()->company->id;

        /* 添加 */
        if ($res = Employee::create($data)) {
            $this->createQrcode(url('cardview/e-' . $res->id), 'uploads/company/' . $data['company_id'] . '/qrcode', ['name' => $data['nickname'] . $data['number']]);
            $err_code = 300;
        } else {
            $err_code = 301;
        }

        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');
    }

    /**
     * 恢复员工
     *
     * @param Request $request
     * @param         $id
     * @return array
     */
    public function recover(Request $request, $id)
    {
        $res = Employee::withTrashed()->where('id', $id)->restore();
        if ($res) {
            return redirect()->back()->with('success', '恢复员工成功');
        }
        return redirect()->back()->with('error', '恢复员工失败');

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
        $templategroup_id = $employee->templategroup_id;
        $templategroup = TemplateGroup::query()->find($templategroup_id);
        if (count($templategroup) > 0) {
            $templategroup_name = $templategroup->name;
            $employee['templategroup_name'] = $templategroup_name;
        }
        return $employee;
    }


    /**
     * 更新
     *
     * @param Request $request
     * @param         $id
     * @return mixed
     */
    public function update(Request $request, $id)
    {
        $employee = Employee::find($id);
        /* 验证 */
        $this->validate($request, [
            'Employee.number'    => 'required|unique:employees,employees.number,' . $id . ',id,company_id,' . $employee->company_id . '|regex:/^([A-Za-z0-9])*$/',// TODO:BUG
            'Employee.nickname'  => 'required',
            'Employee.email'     => 'email',
            'Employee.mobile'    => 'unique:employees,employees.mobile,' . $id . '|numeric',
            'Employee.avatar'    => 'image|max:' . 2 * 1024, // 最大2MB
            'Employee.telephone' => '',
        ], [], [
            'Employee.number'    => '工号',
            'Employee.nickname'  => '姓名',
            'Employee.email'     => '邮箱',
            'Employee.avatar'    => '头像',
            'Employee.telephone' => '座机',
            'Employee.mobile'    => '手机',
        ]);
        $data = $request->input('Employee');
        /* 获取文件类型 */
        if ($request->hasFile('Employee.avatar')) {
            $data['avatar'] = $this->save($request->file('Employee.avatar'), $this->path_type, $employee->company->id, $data['number']);
        }

        foreach ($data as $key => $value) {
            if (trim($value) === '') {
                $employee->$key = null; // 未填字段设置为null，否则会保存''
            } else {
                $employee->$key = trim($value); // 去除空格
            }
        }
        if ($employee->save()) {
            $filePath = 'uploads/company/' . $employee->company_id . '/qrcode';
            $fileName = $employee->nickname . '.png';
            if (!file_exists($filePath . '/' . $fileName)) { // 判断是否创建二维码
                $this->createQrcode(url('cardview/e-' . $employee->id), $filePath, ['name' => $employee->nickname . $employee->number]);
            }
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
     * @param         $id
     * @return \Illuminate\Http\RedirectResponse|int
     */
    public function destroy(Request $request, $id)
    {
        $employee = Employee::with('user', 'company')->find($id);
        $this->dimission($employee); // 移交员工名片到公司名片库
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

    public function batchDestroy(Request $request)
    {
        $ids = explode(',', $request->input('ids'));
        $employees = Employee::whereIn('id', $ids)->get();
        foreach ($employees as $key => $employee) {
            $this->dimission($employee); // 移交员工名片到公司名片库
        }
        $res = Employee::whereIn('id', $ids)->delete();
        if ($res) {
//            return redirect('company/employee')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
//            return redirect('company/employee')->with('error', '删除失败 - ' . $res . '条记录');
        }

    }

    /**
     * 永久删除
     *
     * @param Request $request
     * @param         $id
     * @return \Illuminate\Http\RedirectResponse|int
     */
    public function forceDelete(Request $request, $id)
    {
        $res = Employee::where('id', $id)->forceDelete();
        if ($res) {
            return redirect()->back()->with('success', '永久删除成功');
        }
        return redirect()->back()->with('error', '永久删除失败');

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
        if ($request->isMethod('post')) {
            if ($request->hasFile('file')) {
                $file = $request->file('file');
                // TODO:保存excel文件
                $excelPath = $this->save($file, 'company', Auth::user()->company->id);
                $res = $this->dealExcel($excelPath);
                return redirect()->to('company/employee')->with('success', '成功添加' . $res . '条数据');
            } else {
                return redirect()->to('company/employee')->with('error', '未检测到文件');
            }
        }

        return redirect()->to('company/employee');
    }


    /**
     * 导出文件
     * 工号，姓名，部门，职位，手机，是否绑定，员工二维码
     *
     * @param Request $request
     * @param null    $type    null|unbinding|demission|all-unbinding
     *                         数据类型，空|未绑定员工|离职员工|全库未绑定员工
     * @return \Illuminate\Http\RedirectResponse
     */
    public function exportExcel(Request $request, $type = null)
    {
        if (!Auth::user()->company) {
            return redirect()->back()->with('error', '您不是公司管理员');
        }
        $cellData[0] = $this->exportArray;
        switch ($type) {
            case 'unbinding': // 未绑定员工
                $filename = '未绑定员工数据';
                $employees = Auth::user()->company->employees->where('user_id', null);
                break;
            case 'demission': // 已离职员工
                $filename = '已离职员工数据';
                $employees = Employee::onlyTrashed()->where('company_id', Auth::user()->company->id)->get();
                break;
            case 'all-unbinding': // 已离职员工
                $filename = '全库未绑定员工数据';
                $employees = Employee::where('user_id', null)->get();
                break;
            default:
                $filename = '全体员工数据';
                $employees = Auth::user()->company->employees;
                break;
        }
        if (count($employees)) {
            foreach ($employees as $k => $employee) {
                foreach ($this->exportArray as $key => $word) {
                    if ($key == 'company') { // 部门
                        $cellData[$k + 1][$key] = $employee->company ? $employee->company->display_name : '';
                        continue;
                    }
                    if ($key == 'department') { // 部门
                        $cellData[$k + 1][$key] = $employee->department ? $employee->department->name : '';
                        continue;
                    }
                    if ($key == 'has_bind') { // 是否绑定
                        $cellData[$k + 1][$key] = $employee->user_id ? '已绑定' : '';
                        continue;
                    }
                    if ($key == 'card_url') { // 名片地址
                        $cellData[$k + 1][$key] = url('cardview/e-' . $employee->id);
                        continue;
                    }
                    $cellData[$k + 1][$key] = $employee->$key;
                }
            }
        }
        Excel::create(iconv('UTF-8', 'GBK', $filename), function ($excel) use ($cellData) {
            $excel->sheet('sheet1', function ($sheet) use ($cellData) {
                $sheet->rows($cellData);
            });
        })->export('xls');

    }

    /**
     * 导出二维码文件（压缩包）
     *
     * @return \Illuminate\Http\RedirectResponse|\Symfony\Component\HttpFoundation\BinaryFileResponse
     */
    public function exportQrcode()
    {
        $company = Auth::user()->company;
        $zipPath = 'uploads/company/' . $company->id . '/qrcode.zip';
        $targetPath = 'uploads/company/' . $company->id . '/qrcode';
        // 判断是否存在二维码
        foreach ($company->employees as $k => $employee) {
            if (!file_exists($targetPath . '/' . $employee->nickname . '.png')) {
                $this->createQrcode(url('cardview/e-' . $employee->id), $targetPath, ['name' => $employee->nickname . $employee->number]);
            }
        }
        // 打包二维码
        $res = $this->toZip($zipPath, $targetPath);
        if ($res) {
            return response()->download($zipPath);
        } else {
            return redirect()->back()->with('error', '下载失败');
        }
    }


    /**
     * 处理excel
     *
     * @param $filePath 文件路径
     * @return int 返回已插入数据条数(int)，和错误数据（array）
     */
    protected function dealExcel($filePath)
    {
        $res = 0;
        Excel::selectSheetsByIndex(0)->load($filePath, function ($reader) use (&$res) {
            $time = date('Y-m-d H:i:s', time());
            $data = $reader->all()->toArray();

            $company_id = Auth::user()->company->id;
            // TODO:置换数组
            $data_swap = $this->swapArray($data);
            if (!isset($data_swap['部门'])) {
                return redirect()->back()->with('error', '未检测到[部门]字段');
            }
            // TODO:添加部门
            $department = Department::where('company_id', $company_id)->select('id', 'name')->get()->toArray();
            $department_swap = $department ? $this->swapArray($department) : array('id' => array(), 'name' => array());
            $temp = array_unique($data_swap['部门']); // 去重
            foreach ($temp as $k => $v) {
                if (isset($department_swap['name'])) { // 避免无数据时报错
                    if (in_array($v, $department_swap['name'])) { // 查看是否已存在，不存在添加
                        continue;
                    }
                }
                $department_temp[$k]['company_id'] = $company_id;
                $department_temp[$k]['name'] = $v;
                $department[] = array(
                    'id'   => Department::create($department_temp[$k])->id,
                    'name' => $v,
                );
            }
            $department_swap = $this->swapArray($department);

            $department = array_combine($department_swap['id'], $department_swap['name']);

            // TODO:添加职位

//            $position = Position::where('company_id', $company_id)->select('id', 'name')->get()->toArray();
//
//            $position_swap = $position ? $this->swapArray($position) : array('id' => array(), 'name' => array());
//            $temp = array_unique($data_swap['职位']); // 去重职位
//            foreach ($temp as $k => $v) {
//                if (isset($position_swap['name'])) { // 避免无数据时报错
//                    if (in_array($v, $position_swap['name'])) { // 查看是否已存在，不存在添加
//                        continue;
//                    }
//                }
//                $position_temp[$k]['company_id'] = $company_id;
//                $position_temp[$k]['name'] = $v;
//                $position[] = array(
//                    'id'   => Position::create($position_temp[$k])->id,
//                    'name' => $v,
//                );
//            }
//            $position_swap = $this->swapArray($position);
//            $position = array_combine($position_swap['id'], $position_swap['name']);

            // TODO:添加员工

            $employee = array();
            foreach ($data as $k => $items) {
                foreach ($items as $key => $item) {
                    if (in_array($key, $this->importArray)) {
                        if ($key == '部门') {
                            $item = array_search($item, $department);
                        }
                        $employee[$k][array_search($key, $this->importArray)] = $item;
                    }
                }
                $employee[$k]['company_id'] = $company_id;
                $employee[$k]['created_at'] = $time;

            }
            $validator = Validator::make($employee, [
                '*.number' => 'required|unique:employees,employees.number,null,id,company_id,' . $company_id . '|regex:/^([A-Za-z0-9])*$/',
                '*.mobile' => 'required|unique:employees,employees.mobile,null',
            ], [], [
                '*.number' => '工号',
                '*.mobile' => '手机',
            ]);
            if ($validator->fails()) {
//                $error[0] = $this->importArray;
//                $error[0]['error'] = '错误信息';
                foreach ($validator->errors()->toArray() as $key => $value) {
                    $k = explode('.', $key)[0];
//                    $error[$k + 1] = $data[$k];
//                    $error[$k + 1]['error'] = implode('|', $value);
                    unset($employee[$k]); // 移除错误数据
                }
            }
            if (count($employee) > 0) {
                Employee::insert($employee);
            }
//            $res['error'] = $error;
            $res = count($employee);
        });
//        dd($res['error']);
        return $res;
    }


}

