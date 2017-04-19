<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\UploadController;
use App\Http\Controllers\Controller;
use App\Models\Common;
use App\Models\Company;
use App\Models\Employee;
use App\Models\User;
use Illuminate\Http\Request;
use Breadcrumbs;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;

class UserController extends Controller
{

    protected $path_type = 'user'; // 文件路径保存分类

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
            $breadcrumbs->push('添加', route('admin.user.create'));
        });

        // 首页 > 用户列表 > 详情
        Breadcrumbs::register('admin.user.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.user');
            $breadcrumbs->push('详情', route('admin.user.show', $id));
        });

        // 首页 > 用户列表 > 编辑
        Breadcrumbs::register('admin.user.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.user');
            $breadcrumbs->push('编辑', route('admin.user.edit', $id));
        });
    }

    /**
     * 根据条件获取数据
     *
     * @return $this
     */
    public function index()
    {
        $query = User::query();
        $params = Input::query();
        if (!empty($params)) {
            if (!empty($params['column']) && !empty($params['keyword'])) {
                $search['column'] = $params['column'];
                $search['keyword'] = $params['keyword'];
            }
            if (!empty($params['sort_column']) && !empty($params['sort_way'])) {
                $sort['column'] = $params['sort_column'];
                $sort['order'] = $params['sort_way'];
            }
        }
        if (isset($search)) {
            $query->where($search['column'], 'like', '%' . $search['keyword'] . '%');
        }
        if (isset($sort)) {
            $query->orderBy($sort['column'], $sort['order']);
        }
        $users = $query->with('company', 'employee')->paginate();
        return view('admin.user.index')->with([
            'users' => $users,
            'common' => new Common(),
        ]);
    }

    /**
     * 添加页面
     *
     * @return $this
     */
    public function create()
    {
        return view('admin.user.create')->with([
            'common' => new Common(),
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
            'User.name' => 'required|unique:users,users.name|regex:/^[a-zA-Z]+([A-Za-z0-9])*$/',
            'User.password' => 'required|confirmed',
            'User.email' => 'email|unique:users,users.email',
            'User.mobile' => 'digits:11|unique:users,users.mobile',
            'User.nickname' => 'max:30',
            'User.avatar' => 'image|max:' . 2 * 1024, // 最大2MB
            'User.sex' => '',
            'User.age' => 'max:255',
            'User.description' => 'max:255',
        ], [], [
            'User.name' => '账号',
            'User.password' => '密码',
            'User.email' => '邮箱',
            'User.mobile' => '手机',
            'User.nickname' => '昵称',
            'User.avatar' => '头像',
            'User.sex' => '性别',
            'User.age' => '年龄',
            'User.description' => '个性签名',
        ]);

        /* 获取字段类型 */
        $data = $request->input('User');
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
            if ($key == 'password') {
                $data[$key] = bcrypt($value);// 对密码加密
            }
        }

        /* 获取文件类型 */
        if ($request->hasFile('User.avatar')) {
            $uploadController = new UploadController();
            $data['avatar'] = $uploadController->saveImg($request->file('User.avatar'), 'user', $data['name']);
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
        if (!$user = User::find($id)) {
            return redirect('admin/user')->with('warning', '用户不存在');
        }
        return view('admin.user.show')->with([
            'user' => $user,
            'common' => new Common(),
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
        if (!$user = User::find($id)) {
            return redirect('admin/user')->with('warning', '用户不存在');
        }
        return view('admin.user.edit')->with([
            'user' => $user,
            'common' => new Common(),
        ]);
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
        $this->validate($request, [
            'User.name' => 'required|alpha_dash|unique:users,users.name,' . $id,
            'User.email' => 'email|unique:users,users.email,' . $id,
            'User.mobile' => 'digits:11|unique:users,users.mobile,' . $id,
            'User.nickname' => 'max:30',
            'User.avatar' => 'image|max:' . 2 * 1024, // 最大2MB
            'User.sex' => '',
            'User.age' => 'max:255',
            'User.description' => 'max:255',
        ], [], [
            'User.name' => '账号',
            'User.email' => '邮箱',
            'User.mobile' => '手机',
            'User.nickname' => '昵称',
            'User.avatar' => '头像',
            'User.sex' => '性别',
            'User.age' => '年龄',
            'User.description' => '说明',
        ]);
        $data = $request->input('User');

        /* 获取文件 */
        if ($request->hasFile('User.avatar')) {
            $uploadController = new UploadController();
            $data['avatar'] = $uploadController->saveImg($request->file('User.avatar'), $this->path_type, $data['name']);
        }
        $user = User::find($id);
        foreach ($data as $key => $value) {
            if ($value !== '') {
                $user->$key = $data[$key];
            }
        }
        if ($user->save()) {
            return redirect('admin/user')->with('success', '修改成功' . ' - ' . $user->id);
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
     * @param Request $request
     * @param array $ids
     * @return \Illuminate\Http\RedirectResponse
     */
    public function batchDestroy(Request $request)
    {
        $ids = explode(',', $request->input('ids'));
        $res = User::whereIn('id', $ids)->delete();
        if ($res) {
            return redirect('admin/user')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect('admin/user')->with('error', '删除失败 - ' . $res . '条记录');
        }
    }


    /*
     *  公司名称：判断公司是否有创始人
     *      Y有:绑定公司，创建并关联员工
     *      N无:无法绑定
     *  员工工号：判断员工是否存在
     *      Y:判断员工是否已绑定
     *          Y有:无法绑定，返回
     *          N无:绑定公司，关联员工
     *      N:无法绑定，返回
     */
    /**
     * 关联员工
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function binding(Request $request, $id)
    {
        $code = explode('/', $request->input('code'));
        $count = count($code);
        if ($count != 2) {
            return redirect('admin/user')->with('error', '绑定失败 - 绑定代码无效');
        }
        $user = User::with('company', 'employee')->find($id);
//        $user = User::with('company', 'employee')->find($id);
        $company = Company::where('name', '=', $code[0])->first();
        if (!$company) { // 无公司
            return redirect('admin/user')->with('error', '绑定失败 - 找不到公司信息');
        }
        $employee = Employee::where('number', '=', $code[1])->where('company_id', '=', $company->id)->first();
        if (!$employee) { // 无员工
            return redirect('admin/user')->with('error', '绑定失败 - 找不到员工信息');
        }
        if ($employee->user_id) { // 员工已绑定
            return redirect('admin/user')->with('error', '绑定失败 - 员工已绑定用户');
        }
        if (!$company->user_id) { // 公司无创始人
            $user->company()->save($company); // 绑定公司
        }
        $user->employee()->save($employee); // 绑定员工
        return redirect('admin/user')->with('success', '绑定成功');

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
        }
        if (!$user->employee) {
            return redirect('admin/user')->with('error', '解绑失败 - 未绑定员工');
        }
        $user->company->user_id = null;
        $user->company->save();
        $user->employee->user_id = null;
        $user->employee->save();
        return redirect('admin/user')->with('success', '解绑成功 - ' . $id);
    }

}