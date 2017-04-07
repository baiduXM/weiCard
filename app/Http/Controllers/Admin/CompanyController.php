<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Common\UploadController;
use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\Manager;
use App\Models\User;
use Breadcrumbs;

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
        $user = new User();
        $manager = new Manager();
        return view('admin.company.index')->with([
            'companies' => $companies,
            'user' => $user,
            'manager' => $manager,
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
            'User.name' => 'required|alpha_dash|unique:users,users.name',
            'User.password' => 'required|confirmed',
            'User.email' => 'email|unique:users,users.email',
            'User.nickname' => 'alpha_dash',
            'User.avatar' => 'image|max:' . 2 * 1024, // 最大2MB
            'User.mobile' => 'digits:11|unique:users,users.mobile',
            'User.description' => 'max:255',
        ], [], [
            'User.name' => '账号',
            'User.password' => '密码',
            'User.email' => '邮箱',
            'User.nickname' => '昵称',
            'User.avatar' => '头像',
            'User.mobile' => '手机',
            'User.description' => '说明',
        ]);

        /* 获取字段类型 */
        $data = $request->input('User');
        foreach ($data as $key => $value) {
            if ($value == '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
            if ($key == 'password') {
                $data[$key] = bcrypt($value);// 对密码加密
            }
        }

        /* 获取文件类型 */
        if ($request->hasFile('User.avatar')) {
            $data['avatar'] = UploadController::saveImg($request->file('User.avatar'));
        }

        /* 添加 */
        if (User::create($data)) {
            return redirect('admin/user')->with('success', '添加成功');
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
        $user = User::findOrFail($id);
        return view('admin.user.show')->with('user', $user);
    }

    /**
     * 更新页面
     *
     * @param $id
     * @return $this
     */
    public function edit($id)
    {
        $user = User::find($id);
        return view('admin.user.edit')->with('user', $user);
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
        $user = User::find($id);
        $this->validate($request, [
            'User.name' => 'required|alpha_dash|unique:users,users.name,' . $id,
            'User.email' => 'email|unique:users,users.email,' . $id,
            'User.nickname' => 'max:30',
            'User.avatar' => 'image|max:' . 2 * 1024, // 最大2MB
            'User.mobile' => 'digits:11|unique:users,users.mobile,' . $id,
            'User.description' => 'max:255',
        ], [], [
            'User.name' => '账号',
            'User.email' => '邮箱',
            'User.nickname' => '昵称',
            'User.avatar' => '头像',
            'User.mobile' => '手机',
            'User.description' => '说明',
        ]);
        $data = $request->input('User');
        foreach ($data as $key => $value) {
            if ($value == '') {
                $data[$key] = null;
            }
            if ($key == 'password') {
                $data[$key] = bcrypt($value);
            }
        }

        if ($request->hasFile('User.avatar')) {
            $data['avatar'] = UploadController::saveImg($request->file('User.avatar'));
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
            return redirect('admin/user')->with('success', '修改成功');
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
        $user = User::find($id);
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
        $res = User::whereIn('id', $ids)->delete();
        if ($res) {
            return redirect('admin/user')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect('admin/user')->with('error', '删除失败 - ' . $res . '条记录');
        }
    }


}