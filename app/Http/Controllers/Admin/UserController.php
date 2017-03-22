<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\UploadController;
use App\Http\Controllers\Controller;
use App\Models\Admin\User;
use Illuminate\Http\Request;
use Breadcrumbs;

class UserController extends Controller
{

    public function __construct()
    {
        // 首页 > 用户列表
        Breadcrumbs::register('admin.user', function ($breadcrumbs) {
            $breadcrumbs->parent('admin');
            $breadcrumbs->push('用户列表', route('admin.user.index'));
        });

        // 首页 > 用户列表 > 添加用户
        Breadcrumbs::register('admin.user.create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.user');
            $breadcrumbs->push('添加用户', route('admin.user.create'));
        });

        // 首页 > 用户列表 > 用户详情
        Breadcrumbs::register('admin.user.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.user');
            $breadcrumbs->push('用户详情', route('admin.user.show', $id));
        });

        // 首页 > 用户列表 > 修改用户
        Breadcrumbs::register('admin.user.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.user');
            $breadcrumbs->push('修改用户', route('admin.user.edit', $id));
        });
    }

    // 用户列表
    public function index()
    {

//        $users = User::where('name', '!=', 'admin')->paginate();
//        dd($users);
        $query = User::query();
        $query->where('name', '!=', 'admin');
        $users = $query->paginate();
//        dd($users);
        return view('admin.user.index')->with('users', $users);
    }

    // 新增用户
    public function create()
    {
        $user = new User;
        return view('admin.user.create')->with('user', $user);
    }

    public function store(Request $request)
    {
//        if ($request->hasFile('User.avatar')) {
//            $data['avatar'] = UploadController::saveImg($request->file('User.avatar'));
//
////            $data['avatar'] = UploadController()->saveImg($request->file('User.avatar'));
//        }
//        dd($data);

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
        }

        if (User::create($data)) {
            return redirect('admin/user')->with('success', '添加成功');
        } else {
            return redirect()->back();
        }
    }


    public function show($id)
    {
        $user = User::find($id);
        return view('admin.user.show')->with('user', $user);
    }

    public function edit($id)
    {
        $user = User::find($id);
        return view('admin.user.edit')->with('user', $user);
    }

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
//        dd($data);
//        $user = $data;

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

    public function destroy($id)
    {
        $user = User::find($id);
        if ($user->delete()) {
            return redirect('admin/user')->with('success', '删除成功 - ' . $user->name);
        } else {
            return redirect('admin/user')->with('error', '删除失败 - ' . $user->name);
        }
    }

    public function getRole()
    {

    }

    public function postRole()
    {

    }

    public function getPermission()
    {

    }

    public function postPermission()
    {

    }

    // 用户详情
    public function detail($id)
    {
        $user = User::find($id);
        return view('admin.user.detail', [
            'user' => $user
        ]);
    }

    // 修改用户
    public function update1(Request $request, $id)
    {
        $user = User::find($id);
        if ($request->isMethod('POST')) {
            $this->validate($request, [
                'User.name' => 'required|min:6|max:20',
                'User.email' => 'required|email|max:255',
            ], [
                'required' => ':attribute为必填项',
                'min' => ':attribute长度太短',
                'max' => ':attribute长度太长',
                'email' => ':attribute格式不正确',
            ], [
                'User.name' => '用户名',
                'User.email' => '邮箱',
            ]);
            $data = $request->input('User');
            $user->name = $data['name'];
            $user->email = $data['email'];
            $user->role = $data['role'];
            if ($user->save()) {
                return redirect('admin/user')->with('success', '修改成功');
            } else {
                return redirect()->back();
            }

        }


        return view('admin.user.update', [
            'user' => $user
        ]);
    }

    // 删除用户
    public function delete($id)
    {
        $user = User::find($id);
        if ($user->delete()) {
            return redirect('/admin/user')->with('success', '删除成功 - ' . $user->id);
        } else {
            return redirect('/admin/user')->with('error', '删除失败 - ' . $user->id);
        }

    }


}