<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\AdminController;
use App\Models\CommonModel;
use App\Models\Manager;
use Breadcrumbs;
use Illuminate\Http\Request;

class ManagerController extends AdminController
{
    protected $path_type = 'admin'; // 文件路径保存分类

    public function __construct()
    {
        // 首页 > 客服管理
        Breadcrumbs::register('admin.manager', function ($breadcrumbs) {
            $breadcrumbs->parent('admin');
            $breadcrumbs->push('客服管理', route('admin.manager.index'));
        });
        // 首页 > 客服管理 > 添加
        Breadcrumbs::register('admin.manager.create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.manager');
            $breadcrumbs->push('添加', route('admin.manager.create'));
        });
        // 首页 > 客服管理 > 详情
        Breadcrumbs::register('admin.manager.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.manager');
            $breadcrumbs->push('详情', route('admin.manager.index', $id));
        });
        // 首页 > 客服管理 > 编辑
        Breadcrumbs::register('admin.manager.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.manager');
            $breadcrumbs->push('编辑', route('admin.manager.edit', $id));
        });
    }

    // GET 客服列表
    public function index()
    {
        $managers = Manager::paginate();
        return view('admin.manager.index')->with([
            'managers' => $managers,
            'common' => new CommonModel(),
        ]);
    }

    // GET
    public function create()
    {
        $manager = new Manager;
        return view('admin.manager.create')->with([
            'manager' => $manager,
            'common' => new CommonModel(),
        ]);
    }

    // POST
    public function store(Request $request)
    {
        /* 验证 */
        $this->validate($request, [
            'Manager.name' => 'required|unique:managers,managers.name|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',
            'Manager.password' => 'required|confirmed',
            'Manager.email' => 'email|unique:managers,managers.email',
            'Manager.mobile' => 'digits:11|unique:managers,managers.mobile',
            'Manager.nickname' => 'max:30|min:6',
            'Manager.is_super' => 'boolean',
            'Manager.is_active' => 'boolean',
        ], [], [
            'Manager.name' => '账号',
            'Manager.password' => '密码',
            'Manager.email' => '邮箱',
            'Manager.mobile' => '手机',
            'Manager.nickname' => '昵称',
            'Manager.is_super' => '超级管理员',
            'Manager.is_active' => '激活状态',
        ]);

        /* 获取字段类型 */
        $data = $request->input('Manager');
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
            if ($key == 'password') {
                $data[$key] = bcrypt($value);// 对密码加密
            }
        }

        /* 获取文件类型 */
        if ($request->hasFile('Manager.avatar')) {
            $data['avatar'] = $this->save($request->file('Manager.avatar'), $this->path_type, $data['name']);
        }

        /* 添加 */
        if (Manager::create($data)) {
            return redirect('admin/manager')->with('success', '添加成功');
        } else {
            return redirect()->back();
        }
    }

    // GET
    public function show($id)
    {
        if (!$manager = Manager::find($id)) {
            return redirect('admin/manager')->with('warning', '用户不存在');
        }
        return view('admin.manager.show')->with([
            'manager' => $manager,
            'common' => new CommonModel(),
        ]);
    }


    // GET
    public function edit($id)
    {
        if (!$manager = Manager::find($id)) {
            return redirect('admin/manager')->with('warning', '用户不存在');
        }
        return view('admin.manager.edit')->with([
            'manager' => $manager,
            'common' => new CommonModel(),
        ]);
    }

    // PUT\PATCH
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'Manager.name' => 'required|unique:managers,managers.name,' . $id . '|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',
            'Manager.email' => 'email|unique:managers,managers.email,' . $id,
            'Manager.mobile' => 'digits:11|unique:managers,managers.mobile,' . $id,
            'Manager.nickname' => 'max:30|min:6',
            'Manager.is_super' => 'boolean',
            'Manager.is_active' => 'boolean',
        ], [], [
            'Manager.name' => '账号',
            'Manager.email' => '邮箱',
            'Manager.mobile' => '手机',
            'Manager.nickname' => '昵称',
            'Manager.is_super' => '超级管理员',
            'Manager.is_active' => '激活状态',
        ]);
        $data = $request->input('Manager');
        $manager = Manager::find($id);
        foreach ($data as $key => $value) {
            if ($value !== '') {
                $manager->$key = $data[$key];
            }
        }
        if (!array_key_exists('is_super', $data)) {
            $manager->is_super = 0;
        }
        if ($manager->save()) {
            return redirect('admin/manager')->with('success', '修改成功' . ' - ' . $manager->id);
        } else {
            return redirect()->back();
        }
    }

    // DELETE
    /**
     * 删除
     *
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        $manager = Manager::find($id);
        if ($manager->delete()) {
            return redirect('admin/manager')->with('success', '删除成功 - ' . $manager->name);
        } else {
            return redirect('admin/manager')->with('error', '删除失败 - ' . $manager->name);
        }
    }

    /**
     * 批量删除
     *
     * @param Request $request
     * @param array $ids
     * @return \Illuminate\Http\RedirectResponse
     */
    public function batchDestroy(Request $request)
    {
        $ids = explode(',', $request->input('ids'));
        $res = Manager::whereIn('id', $ids)->delete();
        if ($res) {
            return redirect('admin/user')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect('admin/user')->with('error', '删除失败 - ' . $res . '条记录');
        }
    }

}