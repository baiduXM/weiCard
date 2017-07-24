<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Circle;
use App\Models\User;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

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
        $this->checkExpired(); // 遍历检查是否名片圈是否过期
    }


    /**
     * 首页
     */
    public function index()
    {
        if ($this->is_mobile) {
            $circles = Circle::with('user', 'users')->where('user_id', Auth::id())->get();
            return view('mobile.circle.index')->with([
                'circles' => $circles,
            ]);
        }
        $circles = Auth::user()->create_circles;
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
//            'Circle.expired_at' => 'required',
        ], [], [
            'Circle.name' => '名称',
//            'Circle.expired_at' => '有效期',
        ]);
        $data = $request->input('Circle');
        /* 处理数据 */
        foreach ($data as $key => $value) {
            if (trim($value) == '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
                continue;
            }
            if ($key == 'expired_at') {
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
                return response()->json(array('err' => 1, 'msg' => '添加失败'));
            }
            return redirect()->back()->with('error', '添加失败');
        }
        $this->joinCircle($res->id); // 加入圈子
        if ($request->ajax()) {
            return response()->json(array('err' => 0, 'msg' => '添加成功'));
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

    public function show(Request $request, $id)
    {
        $circle = Circle::with('users')->find($id);
        if (!$circle) {
            return redirect()->to('circle');
        }
        if ($request->ajax()) {
            return response()->json($circle);
        }
        return view('mobile.circle.show')->with([
            'circle' => $circle,
        ]);
    }

//    public function edit($id)
//    {
//        $circle = Circle::find($id);
//        return view('mobile.circle.edit')->with([
//            'circle' => $circle,
//        ]);
//    }

    /**
     * 检查是否过期，过期删除
     */
    private function checkExpired()
    {
        Circle::where('expired_at', '<', date('Y-m-d H:i:s'))->delete();
    }

    /**
     * 加入名片圈
     *
     * @param      $id      圈子ID
     * @param null $user_id 用户ID
     */
    public function joinCircle($id, $user_id = null)
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
    public function exitCircle($id, $user_id = null)
    {
        $user_id = $user_id ? $user_id : Auth::id();
        User::find($user_id)->join_circles()->detach($id);
    }

}

