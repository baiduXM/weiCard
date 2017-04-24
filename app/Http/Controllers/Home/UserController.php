<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\UploadController;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;

class UserController extends Controller
{
    protected $path_type = 'user'; // 文件路径保存分类

    public function __construct()
    {
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        Breadcrumbs::register('user', function ($breadcrumbs) {
            $breadcrumbs->push('我的名片', route('user.index'));
        });

        Breadcrumbs::register('user.create', function ($breadcrumbs) {
            $breadcrumbs->parent('user');
            $breadcrumbs->push('我的公司', route('user.create'));
        });

        Breadcrumbs::register('user.show', function ($breadcrumbs) {
            $breadcrumbs->parent('user');
            $breadcrumbs->push('用户详情', route('user.show'));
        });

        Breadcrumbs::register('user.edit', function ($breadcrumbs) {
            $breadcrumbs->parent('user');
            $breadcrumbs->push('修改用户', route('user.edit'));
        });
    }

    /**
     * 用户名片
     *
     * @return $this
     */
    public function index()
    {
        $user = User::find(Auth::id());
        return view('home.user.index')->with([
            'user' => $user,
        ]);
    }

    /**
     * 编辑
     *
     * @return $this
     */
    public function edit()
    {
        $user = User::find(Auth::id());
        return view('home.user.edit')->with([
            'user' => $user,
        ]);
    }


    /**
     * 提交编辑
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request)
    {
        $id = Auth::id();
        $this->validate($request, [
            'User.name' => 'required|alpha_dash|unique:users,users.name,' . $id,
            'User.email' => 'email|unique:users,users.email,' . $id,
            'User.mobile' => 'digits:11|unique:users,users.mobile,' . $id,
            'User.nickname' => 'max:30',
            'User.avatar' => 'image|max:' . 2 * 1024, // 最大2MB
//            'User.sex' => '',
//            'User.age' => 'max:255',
            'User.description' => 'max:255',
        ], [], [
            'User.name' => '账号',
            'User.email' => '邮箱',
            'User.mobile' => '手机',
            'User.nickname' => '昵称',
            'User.avatar' => '头像',
//            'User.sex' => '性别',
//            'User.age' => '年龄',
            'User.description' => '个性签名',
        ]);
        $data = $request->input('User');

        /* 获取文件 */
        if ($request->hasFile('User.avatar')) {
            $uploadController = new UploadController();
            $data['avatar'] = $uploadController->saveImg($request->file('User.avatar'), $this->path_type, $data['name']);
        }
        $user = User::find($id);
        foreach ($data as $key => $value) {
            if ($value !== '') { // TODO:[BUG]如果有个字段原来有字段，后面更新为空，更新不了
                $user->$key = $data[$key];
            }
        }
        if ($user->save()) {
            return redirect()->back()->with('success', '修改成功' . ' - ' . $user->id);
        } else {
            return redirect()->back();
        }
    }

    /**
     * 关联员工
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function binding(Request $request)
    {
        if ($request->isMethod('POST')) {
            $code = $request->input('code');
        }
        if ($request->isMethod('GET')) {
            $code = Input::query('code');
        }
        $user = new User();
        $res = $user->binding($code, Auth::id());
        if ($request->isMethod('POST')) {
            if ($res % 100 == 0) {
                return redirect()->back()->with('success', config('global.msg.' . $res));
            } else {
                return redirect()->back()->with('error', config('global.msg.' . $res));
            }
        }
        if ($request->isMethod('GET')) {
            if ($res % 100 == 0) {
                return redirect('user')->with('success', config('global.msg.' . $res));
            } else {
                return redirect('user')->with('error', config('global.msg.' . $res));
            }
        }

    }

}