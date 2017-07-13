<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\CommonModel;
use App\Models\Company;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\View\View;
use Maatwebsite\Excel\Facades\Excel;


class CompanyController extends HomeController
{

    protected $path_type = 'company'; // 文件路径保存分类

    public function __construct()
    {
        $this->isMobile();
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 公司注册
        Breadcrumbs::register('company.create', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('公司注册', route('company.create'));
        });

        // 我的公司 > 编辑资料
        Breadcrumbs::register('company.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('编辑资料', route('company.edit', $id));
        });

        // 我的公司 > 查看资料
        Breadcrumbs::register('company.show', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('查看资料', route('company.show'));
        });

        // 我的公司 > 公司部门
        Breadcrumbs::register('company.department', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('公司部门', route('company.department'));
        });
    }


    /**
     * 我的公司 - 首页
     *
     * @return View
     */
    public function index()
    {
        $user = Auth::user();
        // 判断是否绑定公司
//        if (!$user->company) {
//            return view($this->interview . '.company.binding');
//        }
        // 判断是否绑定员工
        if (!$user->employee) {
            if ($this->is_mobile) {
                return view('mobile.employee.index');
            }
        }
        $company = $user->company;
        return view($this->interview . '.company.index')->with([
            'company' => $company,
            'common'  => new CommonModel(),
        ]);


    }

    public function index4Mobile()
    {
        // 判断是否
        // 公司创始人
        $company = Company::with('departments', 'employees', 'positions')->where('user_id', Auth::id())->get()->toArray();
        return $company;
    }

    /**
     * 更新公司
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request)
    {
        $id = Auth::user()->company->id;
        /* 验证 */
        $this->validate($request, [
            'Company.name'               => 'required|regex:/^([A-Za-z0-9])*$/|unique:companies,companies.name,' . $id,
            'Company.display_name'       => 'required|unique:companies,companies.display_name,' . $id,
            'Company.logo'               => 'image|max:' . 2 * 1024, // 最大2MB
            'Company.address'            => 'max:255',
            'Company.email'              => 'email',
            'Company.telephone'          => '',
            'Company.description'        => 'max:255',
            'Company.coordinate_lng'     => 'max:255',
            'Company.coordinate_lat'     => 'max:255',
            'Company.homepage'           => 'url:true',
            'Company.profilelink'        => 'url:true',
            'Company.is_profilelink'     => '',
            'Company.is_person'          => '',
            'Company.comment'            => 'max:255',
            'Company.service_area'       => 'max:255',
            'Company.registered_capital' => 'max:255',
            'Company.registered_number'  => 'max:255',
            'Company.des_classifyname'   => 'max:255',
            'Company.pro_classifyname'   => 'max:255',
            'Company.share_classifyname' => 'max:255',
            'Company.nav_classifyname'   => 'max:255',
            'Company.per_classifyname'   => 'max:255',


        ], [], [
            'Company.name'               => '公司名称',
            'Company.display_name'       => '显示名称',
            'Company.logo'               => '公司LOGO',
            'Company.address'            => '公司地址',
            'Company.email'              => '公司邮箱',
            'Company.telephone'          => '公司电话',
            'Company.description'        => '公司简介',
            'Company.coordinate_lng'     => '坐标（经度）',
            'Company.homepage'           => '公司网址',
            'Company.profilelink'        => '公司简介外链',
            'Company.is_person'          => '员工名片展示开关',
            'Company.comment'            => '公司备注',
            'Company.service_area'       => '服务范围',
            'Company.registered_capital' => '注册资本',
            'Company.registered_number'  => '公司注册号',
            'Company.des_classifyname'   => '简介栏目名',
            'Company.pro_classifyname'   => '产品栏目名',
            'Company.share_classifyname' => '分享栏目名',
            'Company.nav_classifyname'   => '导航栏目名',
            'Company.per_classifyname'   => '信息栏目名',


        ]);
        /* 获取字段类型 */
        $data = $request->input('Company');
        //dd($data);
        /* 获取文件类型 */
        if ($request->hasFile('Company.logo')) {
            $data['logo'] = $this->save($request->file('Company.logo'), $this->path_type, $id);
        }

        $data['status'] = Company::VERIFIED_ING;
        $data['manager_id'] = null;


        $company = Company::find($id);
        foreach ($data as $key => $value) {
            if ($value !== '') {
                $company->$key = $data[$key];
            }
        }

        if ($company->save()) {
            return redirect('company')->with('success', '修改成功');
        } else {
            return redirect()->back();
        }

    }

    /**
     * 关联员工
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function binding(Request $request)
    {
        $code = $request->input('code');
        $res = $this->bindCompany('name', $code, Auth::id());
//        if ($request->ajax()) {
//            Config::set('global.ajax.err', $res);
//            Config::set('global.ajax.msg', config('global.msg.' . $res));
//            return Config::get('global.ajax');
//        }
        if ($res === true) {
            return redirect('company')->with('success', '绑定成功');
        }
        return redirect()->back()->with('error', $res);
    }


    /**
     * 导入Demo文件
     */
    public function importDemo()
    {
        $res = 0;
        $excelPath = 'uploads/20170712.xlsx';
        Excel::selectSheetsByIndex(0)->load($excelPath, function ($reader) use (&$res) {
            $data = $reader->all()->toArray();
            // TODO:置换数组
            $this->importArray = array(
                'department' => '部门',
                'position'   => '职位',
                'external'   => '对外职位',
            );
            dump($this->importArray);
            $employee = array();
            foreach ($data as $k => $items) {
                foreach ($items as $key => $item) {
                    if (in_array($key, $this->importArray)) {
                        $employee[$k][array_search($key, $this->importArray)] = $item;
                    }
                }
            }
            dump($employee);
//            $count = DB::table('dp2out')->insert($employee);
            $res = count($employee);
        });
        dd($res);
        exit;
    }








}

