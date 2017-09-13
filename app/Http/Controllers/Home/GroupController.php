<?php
/**
 * Created by PhpStorm.
 * User: Hsieh
 * Date: 2017/6/9
 * Time: 16:45
 */

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Cardcase;
use App\Models\Group;
use App\Models\UserFollower;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;


class GroupController extends HomeController
{
    public function __construct()
    {
//        $this->isMobile();
        $this->is_mobile = true;
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 我的同事
        Breadcrumbs::register('group', function ($breadcrumbs) {
            $breadcrumbs->push('名片夹', route('cardcase.group.index'));
        });

    }

    /**
     * @param Request $request
     * @return $this|\Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {

        if ($request->ajax()) {
            /* 分组列表 */
            $groups = Group::with('cardcases')->where('user_id', Auth::id())->orderBy('order')->get();
            return response()->json($groups);
        }
        if ($this->is_mobile) {
            $cardcases = Cardcase::where('user_id', Auth::id())->get()->toArray();
            $groups = $this->getGroups(Auth::id());
            $groups = $this->sortArray($groups, 'order');
            foreach ($groups as $k => &$v) {
                if (!isset($v['count'])) {
                    $v['count'] = 0;
                }
                if (count($cardcases) > 0) {
                    foreach ($cardcases as $ck => $vk) {
                        if ($v['id'] == $vk['group_id']) {
                            $v['count'] += 1;
                        }
                    }
                }
            }

            return view('mobile.group.index')->with([
                'groups' => $groups,
            ]);
        }
        $groups = Group::paginate();
        return view('web.group.index')->with([
            'groups' => $groups,
        ]);
    }

    /**
     * 显示组员
     *
     * @param Request $request
     * @param         $id
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     */
    public function show(Request $request, $id)
    {
        if ($request->ajax()) {
            $cardcases['in_group'] = Cardcase::with('follower')->where('group_id', $id)->where('user_id', Auth::id())->get();
            $cardcases['not_in_group'] = Cardcase::with('follower')->where('group_id', null)->where('user_id', Auth::id())->get();
            return response()->json($cardcases);
        }
        /* 除了ajax访问外，其他都跳到首页 */
        return redirect()->route('cardcase.group.index');

    }


    /**
     * 添加分组
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        /* 验证 */
        $this->validate($request, [
            'Group.name' => 'required|unique:groups,groups.name,null,id,user_id,' . Auth::id(), // 不允许重名
        ], [], [
            'Group.name' => '名称',
        ]);
        $data = $request->input('Group');
        $data['user_id'] = Auth::id();
        $data['order'] = 0;

        $group = Group::create($data);
        if ($group) {
            if ($this->is_mobile) {
                return redirect()->route('cardcase.mp')->with('success', '添加成功');
            }
            return redirect()->route('group.index')->with('success', '添加成功'); //
        }
    }

    public function storeAjax(Request $request)
    {
        if ($request->ajax()) {

            /* 验证 */
            $this->validate($request, [
                'Group.name' => 'required|unique:groups,groups.name,null,id,user_id,' . Auth::id(), // 不允许重名
            ], [], [
                'Group.name' => '名称',
            ]);
            $data = $request->input('Group');
            $data['user_id'] = Auth::id();
            $data['order'] = 0;

            if ($group = Group::create($data)) {
                return response()->json(['err' => 0, 'msg' => '添加成功', 'data' => $group]);
            }
        }
    }


    /**
     * @param Request $request
     * @param int     $id 分组ID
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id = null)
    {
        if (!$id) {
            $id = $request->input('group_id');
        }
        $group = Group::find($id);
//        $this->validate($request, [
//            'Group.name' => 'required|unique:groups,groups.name,' . $id . ',id,user_id,' . Auth::id(), // 不允许重名
//        ], [], [
//            'Group.name' => '名称',
//        ]);

        $data = $request->input('Group');
        foreach ($data as $key => $value) {
            $group->$key = trim($value); // 去除空格
        }
        if ($group->save()) {
            if ($this->is_mobile) {
                return redirect()->route('cardcase.mp')->with('success', '修改成功');
            }
            return redirect()->route('cardcase.mp')->with('success', '修改成功');
        }
        return redirect()->route('cardcase.mp')->with('error', '修改失败');
    }

    public function updateAjax(Request $request)
    {
        if ($request->ajax()) {
            $id = $request->input('id');
            $group = Group::find($id);
            /* 验证 */
            $this->validate($request, [
                'Group.name' => 'required|unique:groups,groups.name,' . $id . ',id,user_id,' . Auth::id(), // 不允许重名
            ], [], [
                'Group.name' => '名称',
            ]);
        }
    }

    /**
     * 删除分组
     *
     * @param Request $request
     * @param null    $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request, $id = null)
    {
        if (!$id) {
            $id = $request->input('group_id');
        }
        $group = Group::with('followers')->find($id);
        /* 删除分组前，将关注用户移动到默认分组 */
        if ($group) {
            if (count($group->followers) > 0) {
                $this->moveGroup(['group_id' => $id]);
            }
            // ?bug:删除分组时、判断组内是否有成员的时候，有概率出现错误，需要优化，下面ajax方法同理
            if ($group->delete()) {
                if ($this->is_mobile) {
                    return redirect()->route('cardcase.mp')->with('success', '删除成功');
                }
                return redirect()->back()->with('success', '删除成功');
            }
            return redirect()->back()->with('error', '删除失败');
        }
        return redirect()->back()->with('error', '删除失败');
    }


    public function destroyAjax(Request $request)
    {
        if ($request->ajax()) {
            $group_id = $request->input('group_id');
            $group = Group::find($group_id);
            /* 删除分组前，将关注用户移动到默认分组 */
            if (count($group->followers)) {
                $this->moveGroup(['group_id' => $group_id]);
            }
            if ($group->delete()) {
                return response()->json(['err' => 0, 'msg' => '删除成功']);
            }
            return response()->json(['err' => 1, 'msg' => '删除失败']);
        }
    }

    public function rules(Request $request)
    {
//        $group = $request->input('Group');
        $id = $request->input('group_id') ? $request->input('group_id') : 'null';
        $this->validate($request, [
            'Group.name' => 'required|max:12|unique:groups,groups.name,' . $id . ',id,user_id,' . Auth::id(), // 不允许重名
        ], [], [
            'Group.name' => '名称',
        ]);
        if ($request->ajax()) {
            return response()->json(['err' => 0, 'msg' => '有效数据']);
        }
    }


}