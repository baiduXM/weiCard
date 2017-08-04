<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Circle;
use App\Models\User;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class CircleController extends HomeController
{

    public function __construct()
    {
        $this->isMobile();
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        Breadcrumbs::register('company.circle', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('圈子', route('circle.index'));
        });
        Breadcrumbs::register('company.circle.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('company.circle');
            $circle = Circle::find($id);
            $breadcrumbs->push($circle->name, route('circle.show', $id));
        });


        $this->checkExpired(); // 遍历检查是否名片圈是否过期
    }


    /**
     * 首页
     */
    public function index()
    {
        $circles = Auth::user()->join_circles;
        if ($this->is_mobile) {
//            $circles = Circle::with('user', 'users')->where('user_id', Auth::id())->orderBy('created_at', 'desc')->get();
            return view('mobile.circle.index')->with([
                'circles' => $circles,
            ]);
        }
//        $circles = Auth::user()->create_circles;
        return view('web.circle.index')->with([
            'circles' => $circles,
        ]);
    }


    /**
     * 添加
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'Circle.name' => 'required',
//            'Circle.expired_time' => 'required',
        ], [], [
            'Circle.name' => '名称',
//            'Circle.expired_time' => '有效期',
        ]);
        $data = $request->input('Circle');
        /* 处理数据 */
        foreach ($data as $key => $value) {
            if (trim($value) == '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
                continue;
            }
            if ($key == 'expired_time') {
                if ($value == 0) {
                    $data[$key] = null;
                } else {
                    $data[$key] = date('Y-m-d H:i:s', strtotime('+' . $value . ' day')); // 未填字段设置为null，否则会保存''
                }
                continue;
            }
            $data[$key] = trim($value); // 未填字段设置为null，否则会保存''
        }
        $data['user_id'] = Auth::id();

        $res = Circle::create($data);
        if (!$res) {
            if ($request->ajax()) {
                return response()->json('添加失败');
            }
            return redirect()->back()->with('error', '添加失败');
        }
        $this->joinCircle($res->id); // 加入圈子
        $res->qrcode_path = $this->createQrcode(url('circle/' . $res->id . '/join'), 'uploads/circle'); // 创建二维码
        $res->save(); // 保存
        if ($request->ajax()) {
            return response()->json('添加成功');
        }
        return redirect()->back()->with('success', '添加成功');
    }

    /**
     * 删除圈子
     *
     * @param Request $request
     * @param         $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request, $id)
    {
        $circle = Circle::find($id);
        if (!$circle->user_id == Auth::id()) {
            return response()->json('不是创建者，无法删除');
        }
        if (!$circle->delete()) {
            return response()->json('删除失败');
        }
        if ($request->ajax()) {
            return response()->json('删除成功');
        }
        return redirect()->back()->with('success', '删除成功');
    }

    /**
     * 现实
     *
     * @param Request $request
     * @param         $id
     * @return $this|\Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     */
    public function show(Request $request, $id)
    {
        $circle = Circle::with('users')->find($id);
        if (!$circle) {
            return redirect()->to('circle');
        }
        if ($request->ajax()) {
            return response()->json($circle);
        }
        if ($this->is_mobile) {
            return view('mobile.circle.show')->with([
                'circle' => $circle,
            ]);
        }
        return view('web.circle.show')->with([
            'circle' => $circle,
        ]);
    }

    /**
     * 显示圈子中的成员
     *
     * @param $id
     * @return $this
     */
    public function edit($id)
    {
        $circle = Circle::find($id);
        return view('mobile.circle.edit')->with([
            'circle' => $circle,
        ]);
    }


    /**
     * @param Request $request
     * @param         $id
     */
    public function update(Request $request, $id)
    {
        $circle = Circle::find($id);
        /* 验证 */
        $this->validate($request, [
            'Circle.name' => 'required',
        ], [], [
            'Circle.name' => '名称',
        ]);
        $data = $request->input('Circle');
        foreach ($data as $key => $value) {
            if ($key == 'expired_time') {
                if ($value == 0) {
                    $circle->$key = null;
                }
                if ($value > '0') {
                    $circle->$key = date('Y-m-d H:i:s', strtotime('+' . $value . ' day')); // 未填字段设置为null，否则会保存''
                }
                continue;
            }
            if (trim($value) === '') {
                $circle->$key = null; // 未填字段设置为null，否则会保存''
            } else {
                $circle->$key = trim($value); // 去除空格
            }
        }
        if ($circle->save()) {
            $err_code = 500;
        } else {
            $err_code = 501;
        }
        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');

    }

    /**
     * 检查是否过期，过期删除
     */
    private function checkExpired()
    {
        Circle::where('expired_time', '<', date('Y-m-d H:i:s'))->delete();
    }

    /**
     * 加入名片圈
     *
     * @param      $id      圈子ID
     * @param null $user_id 用户ID
     */
    protected function joinCircle($id, $user_id = null)
    {
        $user_id = $user_id ? $user_id : Auth::id();
        User::find($user_id)->join_circles()->attach($id);
    }

    /**
     * 退出名片圈
     *
     * @param      $id      圈子ID
     * @param null $user_id 用户ID(默认，当前用户)
     */
    protected function exitCircle($id, $user_id = null)
    {
        $user_id = $user_id ? $user_id : Auth::id();
        User::find($user_id)->join_circles()->detach($id);
    }

    /**
     * 加入名片圈
     * 查询圈子是否存在，是否已在圈子中
     *
     * @param int $id 圈子ID
     * @return string
     */
    public function join($id)
    {
        $circle = Circle::with(['users' => function ($query) {
            $query->where('user_id', Auth::id());
        }])->find($id);
        if (!$circle) { // 圈子是否存在
            return redirect()->to('circle')->with('error', '圈子不存在');
        }
        if (count($circle->users)) { // 是否已加入圈子
            return redirect()->to('circle/' . $id)->with('error', '您已在圈子中');
        }
        $this->joinCircle($id);
        return redirect()->to('circle/' . $id)->with('success', '加入成功');
    }

    /**
     * 退出圈子
     *
     * @param int $id      圈子ID
     * @param int $user_id 用户ID
     * @return \Illuminate\Http\RedirectResponse|string
     */
    public function quit($id, $user_id = null)
    {
        $user_id = $user_id ? $user_id : Auth::id();
        $circle = Circle::with(['users' => function ($query) use ($user_id) {
            $query->where('user_id', $user_id);
        }])->find($id);
//        dd($circle);
        if (!$circle) { // 圈子是否存在
            return response()->json('圈子不存在');
        }
        if (!count($circle->users)) { // 是否已加入圈子
            return response()->json('您不在圈子中');
        }
        $this->exitCircle($id, $user_id);
        return redirect()->to('circle')->with('success', '退出成功');
//        return '';
    }

}

