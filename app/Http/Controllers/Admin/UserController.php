<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\UploadController;
use App\Http\Controllers\Controller;
use App\Models\Admin\User;
use Illuminate\Http\Request;
use Breadcrumbs;
use Illuminate\Support\Facades\Input;

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

    /**
     * 根据条件获取数据
     *
     * @return $this
     */
    public function index()
    {
        $query = User::query();
        $params = Input::query();
        $search = array();
        $sort = array();
        if ($params) {
            $search['column'] = isset($params['column']) ? $params['column'] : '';
            $search['keyword'] = isset($params['keyword']) ? $params['keyword'] : '';
            $sort['column'] = isset($params['sort_column']) ? $params['sort_column'] : '';
            $sort['order'] = isset($params['sort_way']) ? $params['sort_way'] : 'desc';
        }
        if (!emptyArray($search) && !in_array('', $search)) {
            $query->where($search['column'], 'like', '%' . $search['keyword'] . '%');
        }

        // todo

        if (!emptyArray($sort) && !in_array('', $sort)) {
            $query->orderBy($sort['column'], $sort['order']);
        } else {
//            $query->orderBy('created_at', 'desc');
        }
        $query->where('name', '!=', 'admin');
        $users = $query->paginate();
        return view('admin.user.index')->with('users', $users);
    }

    /**
     * 添加页面
     *
     * @return $this
     */
    public function create()
    {
        $user = new User;
        return view('admin.user.create')->with('user', $user);
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


}