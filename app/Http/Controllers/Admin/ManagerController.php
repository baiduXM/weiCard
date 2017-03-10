<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\Manager;
use Breadcrumbs;
use Illuminate\Http\Request;

class ManagerController extends Controller
{
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
        $managers = Manager::where('is_super', '!=', 1)->where('is_active', 1)->paginate(2);
        return view('admin.manager.index')->with([
            'managers' => $managers
        ]);
    }

    // GET
    public function create()
    {
        return view('admin.manager.create');
    }

    // POST
    public function store(Request $request)
    {
        $this->validate($request, [
            'Manager.name' => 'required|alpha_dash|unique:managers,managers.name',
            'Manager.password' => 'required|confirmed',
            'Manager.nickname' => 'alpha_dash',
            'Manager.avatar' => 'image',
            'Manager.email' => 'email|unique:managers,managers.email',
            'Manager.mobile' => 'digits:11|unique:managers,managers.mobile',
            'Manager.description' => 'max:255',
            'Manager.is_super' => '',
            'Manager.is_active' => '',
        ], [
            'required' => ':attribute不能为空',
            'required' => ':attribute不能为空',
            'required' => ':attribute不能为空',
            'required' => ':attribute不能为空',
            'required' => ':attribute不能为空',
            'required' => ':attribute不能为空',
            'min' => ':attribute长度太短',
            'max' => ':attribute长度太长',
        ], [
            'Manager.name' => '账号',
            'Manager.password' => '密码',
            'Manager.nickname' => '昵称',
            'Manager.avatar' => '头像',
            'Manager.email' => '邮箱',
            'Manager.name' => '角色名',
            'Manager.name' => '角色名',
            'Manager.description' => '角色描述',
        ]);
        $data = $request->input('Manager');
        if (Manager::create($data)) {
            return redirect('admin/manager')->with('success', '添加成功');
        } else {
            return redirect()->back();
        }
    }

    // GET
    public function show()
    {

    }

    // GET
    public function edit()
    {

    }

    // PUT\PATCH
    public function update()
    {

    }

    // DELETE
    public function destroy()
    {

    }

    // GET + POST
    public function setRole()
    {

    }

    // GET + POST
    public function setPermission()
    {

    }


}