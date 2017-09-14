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



    /*
     * ajax请求下一页，js加载显示
     *
     */
    /**
     * 首页
     *
     * @param Request $request
     * @param null    $type
     * @return $this|\Illuminate\Http\JsonResponse
     */
    public function index()
    {
//        if (!$request->ajax()) {
//            return view('mobile.circle.list')->with([]);
//        }
//        $createCircles = Auth::user()->create_circles();
//        $circlesCreateIds = $createCircles->pluck('id');
//        switch ($type) {
//            case 'create': // 我创建的
//                $circles = $createCircles->paginate();
//                foreach ($circles as $k => &$v) {
//                    $v['users_num'] = $v->users->count();
//                }
//                break;
//            case 'join': // 我加入的
//                $circles = Auth::user()->join_circles()->whereNotIn('circle_id', $circlesCreateIds)->paginate();
//                foreach ($circles as $k => &$v) {
//                    $v['users_num'] = $v->users->count();
//                }
//                break;
//            default: // 初始化获取
//                $circles['create'] = $createCircles->paginate();
//                foreach ($circles['create'] as $k => &$v) {
//                    $v['users_num'] = $v->users->count();
//                }
//                $circles['join'] = Auth::user()->join_circles()->whereNotIn('circle_id', $circlesCreateIds)->paginate();
//                foreach ($circles['join'] as $k => &$v) {
//                    $v['users_num'] = $v->users->count();
//                }
//                break;
//        }
//        if ($request->ajax()) {
//
//            return response()->json(['err' => 0, 'msg' => '获取数据', 'data' => $circles]);
//        }

        if ($this->is_mobile) {
            return view('mobile.circle.list')->with([
//                'circles' => $circles,
            ]);
        }
        return view('web.circle.index')->with([
//            'circles' => $circles,
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
            'Circle.name' => 'required|max:20|unique:circles,circles.name,null',
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
        $data['code'] = base_convert(time(), 10, 16);
        $res = Circle::create($data);
        if (!$res) {
            return redirect()->back()->with('error', '创建失败');
        }
        $this->joinCircle($res->id); // 加入圈子
        $res->qrcode_path = $this->createQrcode(url('circle/join/' . $res->id), 'uploads/circle'); // 创建二维码
        $res->save(); // 保存
//        $res->users_num = $res->users->count();
        return redirect()->route('circle.show', $res->id)->with('success', '创建并加入圈子');
    }


    /**
     * 删除圈子/退出圈子
     *
     * @param         $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        $circle = Circle::find($id);
        if ($circle->user_id == Auth::id()) { // 创建者，删除
            if (!$circle->delete()) {
                return redirect()->back()->with('error', '删除失败');
            }
            return redirect()->route('circle.index')->with('success', '删除成功');
        } else { // 加入圈子，退出
            if (!$this->exitCircle($circle->id)) {
                return redirect()->route('circle.index')->with('error', '退出失败');
            }
            return redirect()->route('circle.index')->with('success', '退出成功');
        }
    }

    /**
     * 现实
     *
     * @param         $id
     * @return $this|\Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     */
    public function show($id)
    {
        $circle = Circle::with('users')->find($id);
        $circle->expired_time = $circle->expired_time ? date('Y-m-d', strtotime($circle->expired_time)) : null; // 未填字段设置为null，否则会保存''
        if ($this->is_mobile) {
            return view('mobile.circle.detail')->with([
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
            'Circle.name' => 'required|max:20|unique:circles,circles.name,' . $id,
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
     * @param      $circle_id 圈子ID
     * @param null $user_id   用户ID
     * @return bool
     */
    protected function joinCircle($circle_id, $user_id = null)
    {
        $user_id = $user_id ? $user_id : Auth::id();
        $circle = Circle::find($circle_id);
        if ($circle) {
            User::find($user_id)->join_circles()->attach($circle_id);
            return true;
        } else {
            return false;
        }

    }

    /**
     * 退出名片圈
     *
     * @param      $circle_id      圈子ID
     * @param null $user_id        用户ID(默认，当前用户)
     * @return bool
     */
    protected function exitCircle($circle_id, $user_id = null)
    {
        $user_id = $user_id ? $user_id : Auth::id();
        $circle = Circle::find($circle_id);
        if ($circle) {
            User::find($user_id)->join_circles()->detach($circle_id);
            return true;
        } else {
            return false;
        }
    }

    /**
     * 加入名片圈
     * 查询圈子是否存在，是否已在圈子中
     *
     * @param Request $request
     * @param null    $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function join(Request $request, $id = null)
    {
        if ($id) {
            $circle = Circle::with(['users' => function ($query) {
                $query->where('user_id', Auth::id());
            }])->find($id);
        } else {
            $code = strtolower(trim($request->input('Circle.code')));
            $circle = Circle::with(['users' => function ($query) {
                $query->where('user_id', Auth::id());
            }])->where('code', $code)->first();
        }
        if (!$circle) { // 圈子是否存在
            return redirect()->to('circle')->with('error', '圈子不存在');
        }
        if (count($circle->users)) { // 是否已加入圈子
            return redirect()->to('circle/' . $circle->id)->with('error', '您已在圈子中');
        }
        $this->joinCircle($circle->id);
        return redirect()->route('circle.show', $circle->id)->with('success', '加入成功');
    }

    public function joinAjax(Request $request)
    {
        if ($request->ajax()) {
            $code = strtolower(trim($request->input('Circle.code')));
            if (!$code) {
                return response()->json(['err' => 1, 'msg' => '圈号不能为空']);
            }
            $circle = Circle::with(['users' => function ($query) {
                $query->where('user_id', Auth::id());
            }])->where('code', $code)->first();
            if (!$circle) { // 圈子是否存在
                return response()->json(['err' => 1, 'msg' => '圈子不存在']);
            }
            return response()->json(['err' => 0, 'msg' => '圈子存在', 'data' => $circle]);

//            if (count($circle->users)) { // 是否已加入圈子
//                return response()->json(['err' => 0, 'msg' => '您已在圈子中', 'data' => $circle]);
//                //return response()->json(['err' => 1, 'msg' => '您已在圈子中', 'data' => null]);
//            }
//            dd($this->joinCircle($circle->id));
////            return redirect()->to('circle/' . $id)->with('success', '加入成功');
//            return response()->json(['err' => 0, 'msg' => '加入成功', 'data' => $circle]);
        }

    }

    /**
     * 踢出圈子
     *
     * @param Request $request
     * @param int     $circle_id 圈子ID
     * @param int     $user_id   用户ID
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     */
    public function quit(Request $request, $circle_id, $user_id = null)
    {
        $user_id = $user_id ? $user_id : Auth::id();
        $circle = Circle::with(['users' => function ($query) use ($user_id) {
            $query->where('user_id', $user_id);
        }])->find($circle_id);

        if (!$circle) { // 圈子是否存在
//            return response()->json(['err' => 1, 'msg' => '圈子不存在', 'data' => null]);
            return redirect()->route('circle.index')->with('error', '圈子不存在');
        }
        if (!count($circle->users)) { // 是否已加入圈子
//            return response()->json(['err' => 1, 'msg' => '您不在圈子中', 'data' => null]);
            return redirect()->route('circle.index')->with('error', '您不在圈子中');
        }
        if ($circle->user_id == $user_id) {
            $circle->delete();
//            return response()->json(['err' => 0, 'msg' => '圈子已解散', 'data' => route('circle.index')]);
            return redirect()->route('circle.show', $circle->id)->with('success', '退出成功');
        }
        $this->exitCircle($circle_id, $user_id);
//        if ($request->ajax()) {
//            if ($user_id == Auth::id()) {
//                return response()->json(['err' => 0, 'msg' => '成功退出', 'data' => route('circle.index')]);
//            } else {
//                return response()->json(['err' => 0, 'msg' => '移出圈子', 'data' => route('circle.show', $circle_id)]);
//            }
//        }
        return redirect()->route('circle.show', $circle->id)->with('success', '退出成功');
    }

    public function ajaxIndex(Request $request, $type = null)
    {
        if ($request->ajax()) {
            $createCircles = Auth::user()->create_circles();
            $circlesCreateIds = $createCircles->pluck('id');
            switch ($type) {
                case 'create': // 我创建的
                    $circles = $createCircles->paginate();
                    foreach ($circles as $k => &$v) {
                        $v['users_num'] = $v->users->count();
                    }
                    break;
                case 'join': // 我加入的
                    $circles = Auth::user()->join_circles()->whereNotIn('circle_id', $circlesCreateIds)->paginate();
                    foreach ($circles as $k => &$v) {
                        $v['users_num'] = $v->users->count();
                    }
                    break;
                default: // 初始化获取
                    $circles['create'] = $createCircles->orderBy('created_at', 'desc')->paginate();
                    foreach ($circles['create'] as $k => &$v) {
                        $v['users_num'] = $v->users->count();
                    }
                    $circles['join'] = Auth::user()->join_circles()->orderBy('created_at', 'desc')->whereNotIn('circle_id', $circlesCreateIds)->paginate();
                    foreach ($circles['join'] as $k => &$v) {
                        $v['users_num'] = $v->users->count();
                    }
                    break;
            }
            return response()->json(['err' => 0, 'msg' => '获取数据', 'data' => $circles]);

        }
    }

    public function showAjax(Request $request, $id)
    {
        if ($request->ajax()) {
            $circle = Circle::find($id);
//            $ids = $circle->users()->pluck('id'); // 去掉圈子发起人
//            $users = User::with('employee')->whereIn('id', $ids)->get();
            $users = $circle->users;
//            dd($users);
            foreach ($users as &$item) {
                $item->avatar = asset($item->avatar); // 头像
                $item->employee = $item->employee ? $item->employee : null;
                $item->company = $item->employee ? $item->employee->company : null;
                $item->isFollow = Auth::user()->isFollow($item->id); // 我是否关注
                $item->isFollowMe = $item->isFollow(Auth::id()); // 是否关注我
            }
//            $circle->users = $users;
//            dd($users);
            return response()->json(['err' => 0, 'msg' => '获取数据', 'data' => $users]);
        }
    }

    public function storeAjax(Request $request)
    {
        if ($request->ajax()) {
            $this->validate($request, [
                'Circle.name' => 'required|max:20|unique:circles,circles.name,null',
//            'Circle.expired_time' => 'required',
            ], [], [
                'Circle.name' => '名称',
//            'Circle.expired_time' => '有效期',
            ]);
//            $data = $request->input('Circle');
//            /* 处理数据 */
//            foreach ($data as $key => $value) {
//                if (trim($value) == '') {
//                    $data[$key] = null; // 未填字段设置为null，否则会保存''
//                    continue;
//                }
//                if ($key == 'expired_time') {
//                    if ($value == 0) {
//                        $data[$key] = null;
//                    } else {
//                        $data[$key] = date('Y-m-d H:i:s', strtotime('+' . $value . ' day')); // 未填字段设置为null，否则会保存''
//                    }
//                    continue;
//                }
//                $data[$key] = trim($value); // 未填字段设置为null，否则会保存''
//            }
//            $data['user_id'] = Auth::id();
//            $data['code'] = base_convert(time(), 10, 16);
//            $res = Circle::create($data);
//            if (!$res) {
//                return response()->json(['err' => 1, 'msg' => '添加失败', 'data' => null]);
//            }
//            $this->joinCircle($res->id); // 加入圈子
//            $res->qrcode_path = $this->createQrcode(url('circle/' . $res->id . '/join'), 'uploads/circle'); // 创建二维码
//            $res->save(); // 保存
//            $res->users_num = $res->users->count();
//            return redirect()->route('circle.show', $res->id);
//            return response()->json(['err' => 0, 'msg' => '添加成功', 'data' => $res]);
        }
    }

}

