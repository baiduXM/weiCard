<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Breadcrumbs;
use Illuminate\Http\Request;

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

        Breadcrumbs::register('user.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('user');
            $breadcrumbs->push('用户详情', route('user.show', $id));
        });

        Breadcrumbs::register('user.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('user');
            $breadcrumbs->push('修改用户', route('user.edit', $id));
        });
    }

    public function index()
    {
        $user = User::find(Auth::id());
        return view('home.user.index')->with([
            'user' => $user,
        ]);
    }

    public function create()
    {
        // TODO
    }

    public function store(Request $request)
    {
        // TODO
    }

    public function show($id)
    {
        $user = User::find($id);
        return view('home.user.show')->with([
            'user' => $user,
        ]);
    }

    public function edit($id)
    {
        // TODO
        $user = User::find($id);
        return view('home.user.edit')->with('user', $user);
    }

    public function update(Request $request, $id)
    {
        // TODO
    }

    public function destroy($id)
    {
        // TODO
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
        $code = explode('/', $request->input('code'));
        $count = count($code);
        if ($count != 2) {
            return redirect()->back()->with('error', '绑定失败 - 绑定代码无效');
        }
        $user = User::with('company', 'employee')->find(Auth::id());
        $company = Company::where('name', '=', $code[0])->first();
        if (!$company) { // 无公司
            return redirect()->back()->with('error', '绑定失败 - 找不到公司信息');
        }
        $employee = Employee::where('number', '=', $code[1])->where('company_id', '=', $company->id)->first();
        if (!$employee) { // 无员工
            return redirect()->back()->with('error', '绑定失败 - 找不到员工信息');
        }
        if ($employee->user_id) { // 员工已绑定
            return redirect()->back()->with('error', '绑定失败 - 员工已绑定用户');
        }
        if (!$company->user_id) { // 公司无创始人
            $user->company()->save($company); // 绑定公司
        }
        $user->employee()->save($employee); // 绑定员工
        return redirect('user')->with('success', '绑定成功');

    }

    /**
     * 解绑公司-员工
     *
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function unbinding($id)
    {
        $user = User::with('company', 'employee')->find($id);
        if (!$user->company) {
            return redirect('admin/user')->with('error', '解绑失败 - 未绑定公司');
        } else {
            $user->company->user_id = null;
            $user->company->save();
        }
        if (!$user->employee) {
            return redirect('admin/user')->with('error', '解绑失败 - 未绑定员工');
        } else {
            $user->employee->user_id = null;
            $user->employee->save();
        }
        return redirect('user')->with('success', '解绑成功 - ' . $id);
    }
}