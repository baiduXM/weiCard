<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Common\UploadController;
use App\Http\Controllers\Controller;
use App\Models\Common;
use App\Models\Company;
use Breadcrumbs;
use Illuminate\Http\Request;

class CompanyController extends Controller
{

    public function __construct()
    {
        // 首页 > 公司列表
        Breadcrumbs::register('admin.company', function ($breadcrumbs) {
            $breadcrumbs->parent('admin');
            $breadcrumbs->push('公司列表', route('admin.user.index'));
        });

        // 首页 > 公司列表 > 添加公司
        Breadcrumbs::register('admin.company.create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.company');
            $breadcrumbs->push('添加公司', route('admin.company.create'));
        });

        // 首页 > 公司列表 > 公司详情（审核）
        Breadcrumbs::register('admin.company.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.company');
            $breadcrumbs->push('用户详情', route('admin.company.show', $id));
        });

        // 首页 > 公司列表 > 修改公司（审核）
        Breadcrumbs::register('admin.company.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.company');
            $breadcrumbs->push('修改用户', route('admin.company.edit', $id));
        });
    }


    /**
     * 索引
     *
     * @return $this
     */
    public function index()
    {
        $companies = Company::paginate();
        $common = new Common();
        return view('admin.company.index')->with([
            'companies' => $companies,
            'common' => $common,
        ]);
    }

    /**
     * 添加页面
     *
     * @return $this
     */
    public function create()
    {
        $company = new Company();
        return view('admin.company.create')->with([
            'company' => $company,
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
            'Company.name' => 'required|max:255|unique:companies,companies.name',
            'Company.code' => 'required|max:255|unique:companies,companies.code',
            'Company.user_id' => 'required|numeric',
            'Company.logo' => 'image|max:' . 2 * 1024, // 最大2MB
            'Company.email' => 'email|max:255|unique:companies,companies.email',
            'Company.telephone' => 'unique:companies,companies.telephone',
            'Company.address' => 'max:255',
            'Company.description' => 'max:255',
            'Company.manager_id' => 'numeric',
            'Company.status' => '',
        ], [], [
            'Company.name' => '公司名',
            'Company.code' => '公司代码',
            'Company.user_id' => '注册人ID',
            'Company.logo' => '公司LOGO',
            'Company.email' => '公司邮箱',
            'Company.telephone' => '公司电话',
            'Company.address' => '公司地址',
            'Company.description' => '公司简介',
            'Company.manager_id' => '审核人ID',
            'Company.status' => '审核状态',
        ]);

        /* 获取字段 */
        $data = $request->input('Company');
        foreach ($data as $key => $value) {
            if ($value == '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }

        /* 获取文件 */
        if ($request->hasFile('Company.logo')) {
            $uploadController = new UploadController();
            $data['logo'] = $uploadController->saveImg($request->file('Company.logo'), 'company', $data['code']);
        }

        /* 添加 */
        if (Company::create($data)) {
            return redirect('admin/company')->with('success', '添加成功');
        } else {
            return redirect()->back();
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
        $company = Company::findOrFail($id);
        return view('admin.company.show')->with('company', $company);
    }

    /**
     * 更新页面
     *
     * @param $id
     * @return $this
     */
    public function edit($id)
    {
        $company = Company::find($id);
        return view('admin.company.edit')->with('company', $company);
    }

    /**
     * 更新
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {
        $user = Company::find($id);
        $this->validate($request, [
            'Company.name' => 'required|alpha_dash|unique:users,users.name,' . $id,
            'Company.email' => 'email|unique:users,users.email,' . $id,
            'Company.nickname' => 'max:30',
            'Company.avatar' => 'image|max:' . 2 * 1024, // 最大2MB
            'Company.mobile' => 'digits:11|unique:users,users.mobile,' . $id,
            'Company.description' => 'max:255',
        ], [], [
            'Company.name' => '账号',
            'Company.email' => '邮箱',
            'Company.nickname' => '昵称',
            'Company.avatar' => '头像',
            'Company.mobile' => '手机',
            'Company.description' => '说明',
        ]);
        $data = $request->input('Company');
        foreach ($data as $key => $value) {
            if ($value == '') {
                $data[$key] = null;
            }
            if ($key == 'password') {
                $data[$key] = bcrypt($value);
            }
        }

        if ($request->hasFile('Company.avatar')) {
            $data['avatar'] = UploadController::saveImg($request->file('Company.avatar'));
            $user->avatar = $data['avatar'];
        }

        $user->name = $data['name'];
        $user->email = $data['email'];
        $user->nickname = $data['nickname'];
        $user->mobile = $data['mobile'];
        $user->description = $data['description'];
        $user->is_admin = isset($data['is_admin']) ? 1 : 0;
        $user->is_active = $data['is_active'];
        if ($user->save()) {
            return redirect('admin/company')->with('success', '修改成功');
        } else {
            return redirect()->back();
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
        $user = Company::find($id);
        if ($user->delete()) {
            return redirect('admin/user')->with('success', '删除成功 - ' . $user->name);
        } else {
            return redirect('admin/user')->with('error', '删除失败 - ' . $user->name);
        }
    }

    /**
     * 批量删除
     *
     * @param array $ids
     * @return \Illuminate\Http\RedirectResponse
     */
    public function batchDestroy(Request $request, $ids = array())
    {
        if ($ids == null) {
            $ids = explode(',', $request['ids']);
        }
        $res = Company::whereIn('id', $ids)->delete();
        if ($res) {
            return redirect('admin/user')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect('admin/user')->with('error', '删除失败 - ' . $res . '条记录');
        }
    }


}