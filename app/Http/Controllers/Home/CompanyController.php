<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Common;
use App\Models\Company;
use App\Models\User;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Common\UploadController;

/*
 * index
 * 判断是否
 */

class CompanyController extends Controller
{

    protected $path_type = 'company'; // 文件路径保存分类

    public function __construct()
    {
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司
        Breadcrumbs::register('company', function ($breadcrumbs) {
            $breadcrumbs->push('我的公司', route('company.index'));
        });

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

//        // 我的公司 > 公司注册
//        Breadcrumbs::register('company.create', function ($breadcrumbs) {
//            $breadcrumbs->parent('company');
//            $breadcrumbs->push('公司注册', route('company.create'));
//        });// 我的公司 > 公司注册
//        Breadcrumbs::register('company.create', function ($breadcrumbs) {
//            $breadcrumbs->parent('company');
//            $breadcrumbs->push('公司注册', route('company.create'));
//        });

//        // 我的公司 > 公司部门
//        Breadcrumbs::register('company.department', function ($breadcrumbs) {
//            $breadcrumbs->parent('company');
//            $breadcrumbs->push('公司部门', route('company.department'));
//        });
    }

    /*
     * 我的公司
     *
     * 判断用户是否绑定公司
     *  Y:判断公司是否存在
     *      Y:判断是否公司注册人
     *          Y:判断公司审核状态
     *              0审核中：
     *                  查看资料
     *                  更改资料
     *              1审核通过：显示资料
     *                  注销公司
     *                  更改资料
     *              2审核失败：显示失败原因
     *                  查看资料
     *                  更改资料
     *                  放弃注册
     *          N:判断公司审核状态
     *              0审核中：等待
     *              1审核通过：显示资料
     *                  退出公司
     *              2审核失败：显示失败原因
     *                  绑定公司
     *      N:
     *      绑定公司
     *      注册公司
     *  N:
     *  注册公司
     *  绑定公司
     */
    public function index()
    {
        $company = Company::find(Auth::user()->company_id);
        return view('home.company.index')->with([
            'company' => $company,
            'user' => Auth::user(),
            'common' => new Common(),
        ]);
    }

    /*
     * 判断是否绑定公司
     *  Y:返回首页
     *  N:显示注册页面
     */
    public function create()
    {
        if (!Auth::user()->company_id) {
            return view('home.company.create');
        } else {
            return redirect('company')->with('warning', '您已绑定公司，无法注册新公司');
        }
    }

    /*
     * 注册公司->保存
     */
    public function store(Request $request)
    {
        /* 验证 */
        $this->validate($request, [
            'Company.name' => 'required|unique:companies,companies.name|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',
            'Company.display_name' => 'required|unique:companies,companies.display_name',
            'Company.logo' => 'image|max:' . 2 * 1024, // 最大2MB
            'Company.address' => 'max:255',
            'Company.email' => 'email|unique:companies,companies.email',
            'Company.telephone' => 'unique:companies,companies.telephone',
            'Company.description' => 'max:255',
        ], [], [
            'Company.name' => '公司名称',
            'Company.display_name' => '显示名称',
            'Company.logo' => '公司LOGO',
            'Company.address' => '公司地址',
            'Company.email' => '公司邮箱',
            'Company.telephone' => '公司电话',
            'Company.description' => '公司简介',
        ]);
        /* 获取字段类型 */
        $data = $request->input('Company');
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }
        $data['user_id'] = Auth::id();
        $data['status'] = 0;

        /* 获取文件类型 */
        if ($request->hasFile('Company.logo')) {
            $uploadController = new UploadController();
            $data['logo'] = $uploadController->saveImg($request->file('Company.logo'), $this->path_type, $data['name']);
        }

        /* 添加 */
        if ($company = Company::create($data)) {
            $user = User::find(Auth::id());
            $user->company_id = $company->id;
            $user->save();
            return redirect('company')->with('success', '添加成功');
        } else {
            return redirect()->back();
        }
    }

    /*
     * 公司详情
     */
    public function show($id)
    {
        // TODO
    }

    /*
     * 判断公司是否存在
     *  Y:判断是否创始人
     *      Y:显示界面
     *      N:返回
     *  N:返回
     */
    public function edit($id)
    {
        if (!$company = Company::find($id)) {
            return redirect('company')->with('warning', '公司不存在');
        }
        if ($company->user_id != Auth::id()) {
            return redirect('company')->with('error', '您不是该公司创始人，无法修改');
        }
        return view('home.company.edit')->with([
            'user' => Auth::user(),
            'company' => $company,
        ]);
    }

    /*
     * 编辑公司->更新
     */
    public function update(Request $request, $id)
    {
        /* 验证 */
        $this->validate($request, [
            'Company.name' => 'required|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/|unique:companies,companies.name,' . $id,
            'Company.display_name' => 'required|unique:companies,companies.display_name,' . $id,
            'Company.logo' => 'image|max:' . 2 * 1024, // 最大2MB
            'Company.address' => 'max:255',
            'Company.email' => 'email|unique:companies,companies.email,' . $id,
            'Company.telephone' => 'unique:companies,companies.telephone,' . $id,
            'Company.description' => 'max:255',
        ], [], [
            'Company.name' => '公司名称',
            'Company.display_name' => '显示名称',
            'Company.logo' => '公司LOGO',
            'Company.address' => '公司地址',
            'Company.email' => '公司邮箱',
            'Company.telephone' => '公司电话',
            'Company.description' => '公司简介',
        ]);
        /* 获取字段类型 */
        $data = $request->input('Company');

        /* 获取文件类型 */
        if ($request->hasFile('Company.logo')) {
            $uploadController = new UploadController();
            $data['logo'] = $uploadController->saveImg($request->file('Company.logo'), $this->path_type, $data['code']);
        }

        $data['status'] = Company::VERIFIED_ING;

        $company = Company::find($id);
        foreach ($data as $key => $value) {
            if ($value !== '') {
                $company->$key = $data[$key];
            }
        }

        if ($company->save()) {
            return redirect('company')->with('success', '修改成功 - ' . $company->id);
        } else {
            return redirect()->back();
        }

    }

    /*
     * 删除公司
     */
    public function destroy($id)
    {
        // TODO
    }

    /*
     * 判断是否绑定公司
     *  Y:返回首页
     *  N:显示绑定页面
     */
    public function binding()
    {
        // TODO
    }

    /*
     *
     */
    public function postBinding()
    {

    }


    public function register()
    {
        return view('home.company.register');
    }

    public function postRegister()
    {

    }

    public function group()
    {
        return view('home.company.group');
    }


    public function department()
    {
        return view('home.company.department');
    }

    public function employee()
    {
        return view('home.company.employee');
    }

    public function workmate()
    {
        return view('home.company.workmate');
    }


    /**
     * 判断用户是否关联公司
     *
     * @param $id       用户id
     * @return mixed
     *      没关联：返回0
     *      有关联：返回公司id
     */
    protected function hasCompany($id)
    {
        return $this->company = Company::where('user_id', $id)->first();
    }

}

