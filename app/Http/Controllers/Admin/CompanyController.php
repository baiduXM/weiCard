<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\AdminController;
use App\Models\CommonModel;
use App\Models\Company;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class CompanyController extends AdminController
{

    protected $path_type = 'company'; // 文件路径保存分类

    public function __construct()
    {

        // 首页 > 公司列表 > 添加
        Breadcrumbs::register('admin.company.create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.company');
            $breadcrumbs->push('添加', route('admin.company.create'));
        });

        // 首页 > 公司列表 > 详情
        Breadcrumbs::register('admin.company.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.company');
            $breadcrumbs->push('详情', route('admin.company.show', $id));
        });

        // 首页 > 公司列表 > 编辑
        Breadcrumbs::register('admin.company.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.company');
            $breadcrumbs->push('编辑', route('admin.company.edit', $id));
        });

        // 首页 > 公司列表 > 审核
        Breadcrumbs::register('admin.company.verified', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.company');
            $breadcrumbs->push('审核', route('admin.company.verified', $id));
        });
    }

    /**
     * 索引
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $companies = Company::with('user', 'employees')->paginate();
        return view('admin.company.index')->with([
            'companies' => $companies,
            'common'    => new CommonModel(),
        ]);
    }

    /**
     * 添加页面
     *
     * @return View
     */
    public function create()
    {
        return view('admin.company.create')->with([
            'company' => new Company(),
            'common'  => new CommonModel(),
        ]);
    }

    /**
     * 添加
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        /* 验证 */
        $this->validate($request, [
            'Company.name'         => 'required|max:255|unique:companies,companies.name|regex:/^[a-zA-Z0-9]+([A-Za-z0-9])*$/',
            'Company.display_name' => 'required|max:255|unique:companies,companies.display_name',
            'Company.logo'         => 'image|max:' . 2 * 1024, // 最大2MB
            'Company.homepage'     => 'url',
            'Company.email'        => 'email|max:255|unique:companies,companies.email',
            'Company.telephone'    => 'unique:companies,companies.telephone',
            'Company.address'      => 'max:255',
            'Company.description'  => 'max:255',
//            'Company.limit' => 'numeric|required',
        ], [], [
            'Company.name'         => '公司名称',
            'Company.display_name' => '显示名称',
            'Company.logo'         => '公司LOGO',
            'Company.homepage'     => '公司主页',
            'Company.email'        => '公司邮箱',
            'Company.telephone'    => '公司电话',
            'Company.address'      => '公司地址',
            'Company.description'  => '公司简介',
//            'Company.limit' => '员工人数设置',
        ]);

        /* 获取字段 */
        $data = $request->input('Company');
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }

        /* 默认添加审核通过 */
        $data['status'] = 1;
//        $data['status'] = 0;
        $data['manager_id'] = Auth::guard('admin')->id();
//        $data['verified_at'] = date('Y-m-d H:i:s', time());

        /* 获取文件 */
        if ($request->hasFile('Company.logo')) {
            $data['logo'] = $this->save($request->file('Company.logo'), $this->path_type, $data['name']);
        }

        /* 添加 */
        if (Company::create($data)) {
            return redirect('admin/company')->with('success', '添加成功');
        } else {
            return redirect()->back()->with('error', '添加失败');
        }
    }

    /**
     * 详情
     *
     * @param $id
     * @return $this
     */
    public function show($id)
    {
        if (!$company = Company::find($id)) {
            return redirect('admin/company')->with('warning', '公司不存在');
        }
        return view('admin.company.show')->with([
            'company' => $company,
            'common'  => new CommonModel(),
        ]);
    }

    /**
     * 更新页面
     *
     * @param $id
     * @return $this
     */
    public function edit($id)
    {
        if (!$company = Company::find($id)) {
            return redirect()->back()->with('warning', '公司不存在');
        }
        if (Auth::guard('admin')->user()->is_super == 1 || $company->manager_id == null || $company->manager_id == Auth::guard('admin')->id()) {
            $common = new CommonModel();
            return view('admin.company.edit')->with([
                'company' => $company,
                'common'  => $common,
            ]);
        } else {
            return redirect('admin/company')->with('error', '您不是超级管理员/审核者，无法修改！');
        }
    }

    /**
     * 更新
     *
     * @param Request $request
     * @param         $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {

        $this->validate($request, [
            'Company.name'         => 'required|max:255|unique:companies,companies.name,' . $id,
            'Company.display_name' => 'required|max:255|unique:companies,companies.display_name,' . $id,
            'Company.logo'         => 'image|max:' . 2 * 1024, // 最大2MB
            'Company.homepage'     => 'url',
            'Company.email'        => 'email|max:255|unique:companies,companies.email,' . $id,
            'Company.telephone'    => 'unique:companies,companies.telephone,' . $id,
            'Company.address'      => 'max:255',
            'Company.description'  => 'max:255',
//            'Company.limit' => 'numeric|required',
        ], [], [
            'Company.name'         => '公司名称',
            'Company.display_name' => '显示名称',
            'Company.logo'         => '公司LOGO',
            'Company.homepage'     => '公司主页',
            'Company.email'        => '公司邮箱',
            'Company.telephone'    => '公司电话',
            'Company.address'      => '公司地址',
            'Company.description'  => '公司简介',
//            'Company.limit' => '员工人数设置',
        ]);
        $data = $request->input('Company');

        /* 获取文件 */
        if ($request->hasFile('Company.logo')) {
            $data['logo'] = $this->save($request->file('Company.logo'), $this->path_type, $data['name']);
        }
//        $data['status'] = Company::VERIFIED_ING;
//        $data['manager_id'] = null;

        $company = Company::find($id);
        foreach ($data as $key => $value) {
            if ($value !== '') {
                $company->$key = $data[$key];
            }
        }

        if ($company->save()) {
            return redirect('admin/company')->with('success', '修改成功 - ' . $company->id);
        } else {
            return redirect()->back()->with('error', '修改失败 - ' . $company->id);
        }
    }

    /**
     * 删除
     *
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        $company = Company::find($id);
//        $company->trashed(); // 软删除
        if ($company->delete()) {
            return redirect('admin/company')->with('success', '删除成功 - ' . $company->id);
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $company->id);
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
        $res = Company::whereIn('id', $ids)->delete();
        if ($res) {
            return redirect('admin/company')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $res . '条记录');
        }
    }

//    /**
//     * 公司关联用户
//     *
//     * @param Request $request
//     * @param         $id
//     * @return \Illuminate\Http\RedirectResponse
//     */
//    public function binding(Request $request, $id)
//    {
//        $code = $request->input('code');
//        $company = new Company();
//        $res = $company->binding($code, $id);
//        if ($res % 100 == 0) {
//            return redirect('admin/company')->with('success', config('global.msg.' . $res));
//        } else {
//            return redirect()->back()->with('error', config('global.msg.' . $res));
//        }
//    }


    /**
     * 解绑公司
     *
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function unbinding($id)
    {
        $res = $this->unbindCompany($id);
        if ($res === true) {
            return redirect('admin/company')->with('success', '解绑成功');
        } else {
            return redirect()->back()->with('error', $res);
        }
    }

    /**
     * 审核
     *
     * @param $id
     * @return \Illuminate\View\View
     */
    public function getVerified($id)
    {
        $company = Company::find($id);
        return view('admin.company.verified')->with([
            'company' => $company,
            'common'  => new CommonModel(),
        ]);
    }

    /**
     * 提交审核
     *
     * @param Request $request
     * @param         $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function postVerified(Request $request, $id)
    {
        $model = new Company();
        $company = $model::find($id);
        $this->validate($request, [
            'Company.status' => 'required',
            'Company.reason' => 'required_if:Company.status,' . $model::VERIFIED_FAILED . '|max:255',
        ], [
            'required_if' => '当 :other 为 ' . $model->getStatus($model::VERIFIED_FAILED) . ' 时 :attribute 不能为空。',
        ], [
            'Company.status' => '审核状态',
            'Company.reason' => '失败原因',
        ]);
        $data = $request->input('Company');


        $data['manager_id'] = Auth::guard('admin')->id();
        $data['verified_at'] = date('Y-m-d H:i:s', time());
        if ($data['status'] == 1) {
            $data['reason'] = null;
        }

        foreach ($data as $key => $value) {
            if ($value !== '') {
                $company->$key = $data[$key];
            }
        }
        if ($company->save()) {
            return redirect('admin/company')->with('info', '审核完成 - ' . $company->id);
        } else {
            return redirect()->back();
        }
    }


}