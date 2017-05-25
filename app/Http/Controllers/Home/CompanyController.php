<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Common;
use App\Models\Company;
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


//        // 我的公司 > 公司注册
//        Breadcrumbs::register('company.create', function ($breadcrumbs) {
//            $breadcrumbs->parent('company');
//            $breadcrumbs->push('公司注册', route('company.create'));
//        });
//
//        // 我的公司 > 编辑资料
//        Breadcrumbs::register('company.edit', function ($breadcrumbs, $id) {
//            $breadcrumbs->parent('company');
//            $breadcrumbs->push('编辑资料', route('company.edit', $id));
//        });
//
//        // 我的公司 > 查看资料
//        Breadcrumbs::register('company.show', function ($breadcrumbs) {
//            $breadcrumbs->parent('company');
//            $breadcrumbs->push('查看资料', route('company.show'));
//        });

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


    /**
     * 我的公司 - 首页
     *
     * @return $this
     */
    public function index()
    {
        $company = array();
        if (Auth::user()->company || Auth::user()->employee) {
            $company = Auth::user()->company ? Auth::user()->company : Auth::user()->employee->company;
        }
        return view('home.company.index')->with([
            'company' => $company,
            'common' => new Common(),
        ]);
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
            'Company.name' => 'required|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/|unique:companies,companies.name,' . $id,
            'Company.display_name' => 'required|unique:companies,companies.display_name,' . $id,
            'Company.logo' => 'image|max:' . 2 * 1024, // 最大2MB
            'Company.address' => 'max:255',
            'Company.email' => 'email|unique:companies,companies.email,' . $id,
            'Company.telephone' => 'unique:companies,companies.telephone,' . $id,
            'Company.description' => 'max:255',
            'Company.coordinate_lng' => 'max:255',
            'Company.coordinate_lat' => 'max:255',
            'Company.homepage' => 'url:true',
        ], [], [
            'Company.name' => '公司名称',
            'Company.display_name' => '显示名称',
            'Company.logo' => '公司LOGO',
            'Company.address' => '公司地址',
            'Company.email' => '公司邮箱',
            'Company.telephone' => '公司电话',
            'Company.description' => '公司简介',
            'Company.coordinate_lng' => '坐标（经度）',
            'Company.homepage' => '公司网址',

        ]);
        /* 获取字段类型 */
        $data = $request->input('Company');

        /* 获取文件类型 */
        if ($request->hasFile('Company.logo')) {
            $uploadController = new UploadController();
            $data['logo'] = $uploadController->saveImg($request->file('Company.logo'), $this->path_type, $data['name']);
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
            return redirect('company')->with('success', '修改成功 - ' . $company->id);
        } else {
            return redirect()->back();
        }

    }



}

