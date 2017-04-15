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
        $query->where('name', '!=', 'admin');
        $users = $query->with('company', 'employee')->paginate();
//dd($users);
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
     * 关联公司/员工
     *
     * @param Request $request
     * @param $user_id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function binding(Request $request, $user_id)
    {
        $code = $request->input('code');
        $param = array(
            'company' => '',
            'employee' => '',
        );
        $code = explode('/', $code);
        $count = count($code);
        $user = User::with('company', 'employee')->find($user_id);
        if ($count == 1) { // 公司代码
            $param['company'] = $code[0];
            $company = Company::where('name', $param['company'])->first();
//            $company = $user->company;
//            dd($company);
            if ($company && !$company->user_id) { // 有公司，且无创始人
                // 绑定公司
                $user->company()->save($company);
//                // 添加员工
//                $data['name'] = $user->nickname != null ? $user->nickname : $user->name;
//                $data['number'] = $company->id . '-' . $user_id;
//                $data['title'] = '创始人';
//                $data['mobile'] = $user->mobile;
//                $data['description'] = $user->description;
//                $employee = Employee::create($data);
//                $user->employee()->save($employee);
//                $company->employees()->save($employee);
//                $user->employee_id = $employee->id;
                return redirect('admin/user')->with('success', '绑定成功 - ' . '公司' . $company->id);
            }
            return redirect('admin/user')->with('error', '绑定失败 - 公司不存在/公司已被绑定');
        } elseif ($count == 2) { // 公司代码+员工代码
            $param['company'] = $code[0];
            $param['employee'] = $code[1];
            $company = Company::where('name', $param['company'])->first();
            $employee = Employee::where('number', $param['employee'])->where('company_id', $company->id)->first();
            if ($company && $employee) { // 有公司有员工
                $user->company_id = $company->id;
                $user->employee_id = $employee->id;
                $user->save();
                return redirect('admin/user')->with('success', '绑定成功 - ' . '公司' . $user->company_id . ' + 员工' . $user->employee_id);
            }
            return redirect('admin/user')->with('error', '绑定失败 - 绑定代码无效');
        }
        return redirect('admin/user')->with('error', '绑定失败 - 绑定代码无效');
    }


    /**
     * 解绑公司/员工
     */
    public function unbinding(Request $request, $user_id)
    {
        dd($user_id);
    }

}