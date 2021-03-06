<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\UploadController;
use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\Employee;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Input;

class UserController extends Controller
{
    protected $path_type = 'user'; // 文件路径保存分类

    public function __construct()
    {
        parent::isMobile();
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
        /* 匹配用户查询所属名片 */
        $user = User::find(Auth::id());
        if (!$user->employee) { // 没有绑定员工，先绑定员工
            return redirect('/user/binding');
        }

        $user_id = $user->id;
        if (Auth::user()->employee) {
            $employee = Employee::where('user_id', $user_id)->first();
            $employee_id = $employee->id;
            $company_id = $employee->company_id;
        } else {
            $employee_id = null;
            $company_id = null;
        }

        return view('home.user.index')->with([
            'employee_id' => $employee_id,
            'company_id' => $company_id,
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
            return redirect()->back()->with('success', '修改成功');
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
        if ($this->is_mobile) {
            if ($request->ajax()) {
                $code = $request->input('code');
                $user = new User();
                $res = $user->binding($code, Auth::id());
                Config::set('global.ajax.err', $res);
                Config::set('global.ajax.msg', config('global.msg.' . $res));
                return Config::get('global.ajax');
            }
            return view('mobile.user.binding');
        } else {
            if ($request->isMethod('POST')) { // 通过原始代码进行绑定
                $code = $request->input('code');
            }
            if ($request->isMethod('GET')) { // 通过URL进行绑定
                $code = Input::query('code');
            }
            $user = new User();
            $res = $user->binding($code, Auth::id());
            if ($res % 100 == 0) {
                return redirect('user')->with('success', config('global.msg.' . $res));
            } else {
                return redirect()->back()->with('error', config('global.msg.' . $res));
            }
        }
    }

}