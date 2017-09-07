<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Employee;
use App\Models\Company;
use App\Models\User;
use App\Models\Template;
use App\Models\UserFollower;
use Illuminate\Support\Facades\Auth;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;

class UserController extends HomeController
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
        $user = Auth::user();
        if ($this->is_mobile) {
            // 判断个人信息是否完整
            $isComplete = true;
            if (!$user->mobile || !$user->email || !$user->avatar) {
                $isComplete = false;
            }
//            dd($isComplete);
            //获取公司信息并判断是否开启员工名片展示
            $user_id = $user->id;
            $employee = Employee::where('user_id', $user_id)->first();
            $company = Company::where('id', $employee['company_id'])->first();
            $is_person = $company['is_person'];
            if ($is_person) { // 关闭为1跳转到企业名片，否则个人名片可编辑
                return redirect('company/employee');
            } else {
                return view('mobile.user.index')->with([
                    'user'       => $user,
                    'isComplete' => $isComplete,
                ]);
            }

        }
        /* 匹配用户查询所属名片 */

        $user_id = $user->id;
        if (Auth::user()->employee) {
            $employee = Employee::where('user_id', $user_id)->first();
            $employee_id = $employee->id;
            $company_id = $employee->company_id;
        } else {
            $employee_id = null;
            $company_id = null;
        }

        return view('web.user.index')->with([
            'employee_id' => $employee_id,
            'company_id'  => $company_id,
        ]);
    }

    /**
     * 编辑
     *
     * @return $this
     */
    public function edit()
    {
        $user = Auth::user();
        $query = Template::query();
        $query->where('type', 1);
        $template = $user->templates;
        if (!count($template)) {
            $template = $query->first();
        } else {
            $template = $template[0];
        }
        if ($this->is_mobile) {
            return view('mobile.user.edit')->with([
                'user'     => $user,
                'template' => $template,
            ]);
        }
        return view('web.user.edit')->with([
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
//            'User.name' => 'required|alpha_dash|unique:users,users.name,' . $id,
            'User.email'        => 'email|required|unique:users,users.email,' . $id,
            'User.mobile'       => 'digits:11|required|unique:users,users.mobile,' . $id,
            'User.fax'          => 'max:30',
            'User.nickname'     => 'max:30|required',
            'User.avatar'       => 'image|max:' . 2 * 1024, // 最大2MB
            'User.qrcode'       => 'image|max:' . 2 * 1024, // 最大2MB
            'User.address'      => 'max:255',
            'User.company_name' => 'max:255',
            'User.homepage'     => 'url:true',

//            'User.sex' => '',
//            'User.age' => 'max:255',
            'User.description'  => 'max:255',
        ], [], [
//            'User.name' => '账号',
            'User.email'        => '邮箱',
            'User.mobile'       => '手机',
            'User.fax'          => '传真',
            'User.nickname'     => '昵称',
            'User.avatar'       => '头像',
            'User.qrcode'       => '微信二维码',
            'User.address'      => '地址',
            'User.company_name' => '公司名',
            'User.homepage'     => '个人网址',
//            'User.sex' => '性别',
//            'User.age' => '年龄',
            'User.description'  => '个性签名',
        ]);
        $data = $request->input('User');

        /* 获取文件 */
        if ($request->hasFile('User.avatar')) {
            $data['avatar'] = $this->save($request->file('User.avatar'), $this->path_type, $id);
        }
        /* 获取文件 */
        if ($request->hasFile('User.qrcode')) {
            $data['qrcode'] = $this->save($request->file('User.qrcode'), $this->path_type, $id);
        }

        $user = User::find($id);
        foreach ($data as $key => $value) {
            if ($value !== '') { // TODO:[BUG]如果有个字段原来有字段，后面更新为空，更新不了
                $user->$key = $data[$key];
            } elseif ($user->$key != '') {
                $user->$key = $data[$key];
            }
        }
        if ($user->save()) {
            if ($this->is_mobile) {
                return redirect()->route('cardcase.show')->with('type', 'u');
            }
            return redirect('user')->with('success', '修改成功');
        } else {
            return redirect()->back();
        }
    }


    /**
     * 个人微信二维码
     **/
    public function qrcode(Request $request)
    {
        $id = Auth::id();
        $user = Auth::user();
        if ($this->is_mobile) {
            return view('mobile.user.qrcode')->with([
                'user' => $user,
            ]);
        }

    }

    /**
     * 更换微信二维码
     **/
    public function changeqrcode(Request $request)
    {
        $id = Auth::id();
        $this->validate($request, [
            'qrcode' => 'required',
        ], [], [
            'qrcode' => '微信二维码图片',
        ]);
        /* 组装图片文件名 */
        $time = time();
        $imgname = 'img' . $time . '.jpg';
        /* 获取图片base64格式数据 */
        $data = $request->input('qrcode');
        if ($data) {
            /* 将base64格式数据转化生成图片放置user个人目录 */
            $param = explode(',', $data);
            $img = base64_decode($param[1]);
            $path = $this->getPath($this->path_type, $id);
            if ($path) {
                $this->hasFolder($path);
            }
            if ($img) {
                $a = file_put_contents($path . '/' . $imgname, $img);
                $b = $path . '/' . $imgname;
                /* 数据库更新头像数据*/
                DB::table('users')->where('id', $id)->update(['qrcode' => $b]);
            }
            return redirect('user/edit')->with('success', '修改微信二维码成功');
        } else {
            return redirect()->back()->with('error', '修改微信二维码失败');
        }


    }

    /**
     * 删除个人微信二维码图片
     **/
    public function delqrcode()
    {
        $user = Auth::user();
        if ($user->qrcode) {
            $this->deleteFiles($user->qrcode);
            $user->qrcode = null;
            if ($user->save()) {
                return redirect('user/qrcode')->with('success', '删除微信二维码成功');
            } else {
                return redirect()->back()->with('error', '删除微信二维码失败');
            }
        }

    }

    /**
     * 更换个人头像界面
     **/
    public function updateavatar(Request $request)
    {
        $id = Auth::id();
        $user = Auth::user();
        if ($this->is_mobile) {
            return view('mobile.user.ava')->with([
                'user' => $user,
            ]);
        }

    }

    /**
     * 更换个人头像
     **/
    public function changeavatar(Request $request)
    {
        $id = Auth::id();
        $this->validate($request, [
            'avatar' => 'required',
        ], [], [
            'avatar' => '所选的图片',
        ]);
        /* 组装图片文件名 */
        $time = time();
        $imgname = 'img' . $time . '.jpg';
        /* 获取图片base64格式数据 */
        $data = $request->input('avatar');
        if ($data) {
            /* 将base64格式数据转化生成图片放置user个人目录 */
            $param = explode(',', $data);
            $img = base64_decode($param[1]);
            $path = $this->getPath($this->path_type, $id);
            if ($path) {
                $this->hasFolder($path);
            }
            if ($img) {
                $a = file_put_contents($path . '/' . $imgname, $img);
                $b = $path . '/' . $imgname;
                /* 数据库更新头像数据*/
                DB::table('users')->where('id', $id)->update(['avatar' => $b]);
            }
            return redirect('user/edit')->with('success', '修改头像成功');
        } else {
            return redirect()->back()->with('error', '修改头像失败');
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
        $code = $request->input('code');
        $res = $this->bindEmployee('mobile', $code, Auth::id());
        if ($request->ajax()) {
            if ($res === true) {
                $res = '绑定成功';
            }
            return response()->json($res);
        }
        if ($res === true) {
            return redirect('user')->with('success', '绑定成功');
        }
        return redirect()->back()->with('error', $res);
    }

    /**
     * 关注用户
     *
     * @param $user_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function follow($user_id)
    {
        if (Auth::user()->isFollow($user_id)) {
            return response()->json(array('err' => 1, 'msg' => '已关注'));
        }
        if (Auth::user()->followThisUser($user_id)) {
            return response()->json(array('err' => 0, 'msg' => '关注成功'));
        }
        return response()->json(array('err' => 1001, 'msg' => '请求错误'));

    }

    /**
     * 取消关注
     *
     * @param $user_id
     * @return \Illuminate\Http\JsonResponse
     */
    public function unfollow(Request $request, $user_id = null)
    {
        if (!$user_id) {
            $user_id = $request->input('user_id');
        }
        if (!Auth::user()->isFollow($user_id)) {
            if ($this->is_mobile) {
                return redirect()->back();
            }
//            return response()->json(array('err' => 1, 'msg' => '未关注'));
        }
        if (Auth::user()->unfollowThisUser($user_id)) {
            if ($this->is_mobile) {
                return redirect()->back();
            }
//            return response()->json(array('err' => 0, 'msg' => '取消关注成功'));
        }

    }

    /**
     * ajax关注用户
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function ajaxFollow(Request $request)
    {
        if ($request->ajax()) {
//            $ids = $request->input();
            $ids = explode(',', $request->input('ids'));
            $count = 0;
            foreach ($ids as $id) {
                if (!Auth::user()->isFollow($id)) {
                    $count += Auth::user()->followThisUser($id);
                }
            }
            return response()->json(array('err' => 0, 'msg' => '关注成功', 'data' => $count));
        }
    }

    /**
     * 取消关注
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function unfollowAjax(Request $request)
    {
        if ($request->ajax()) {
            $user_id = $request->input('user_id');
            if (!Auth::user()->isFollow($user_id)) {
                return response()->json(array('err' => 1, 'msg' => '未关注'));
            }
            if (Auth::user()->unfollowThisUser($user_id)) {
                return response()->json(array('err' => 0, 'msg' => '取消关注成功'));
            }
        }

    }

    public function followAjax(Request $request)
    {
        if ($request->ajax()) {
            $user_id = $request->input('user_id');
            $group_id = $request->input('group_id');

            if (Auth::id() == $user_id) {
                return response()->json(array('err' => 1, 'msg' => '不能关注自己'));
            }
            if (Auth::user()->isFollow($user_id)) {
                return response()->json(array('err' => 1, 'msg' => '已关注'));
            }
            if (Auth::user()->followThisUser($user_id)) {
//                $follower = UserFollower::where('follower_id', $user_id)->first();
//                $follower->group_id = $group_id;
//                $follower->save();
                return response()->json(array('err' => 0, 'msg' => '关注成功'));
            }
        }

    }


}