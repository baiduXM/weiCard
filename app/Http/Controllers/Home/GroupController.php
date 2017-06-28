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
     *
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
     *
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
     *
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

        if (Group::create($data)) {
            return response()->json('添加成功');
        }
    }


    /**
     * @param Request $request
     * @param int     $id 分组ID
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function update(Request $request, $id)
    {
        if ($request->ajax()) {
            $ids = $request->input('ids');
            $cardcases = Cardcase::whereIn('id', $ids)->get();
            foreach ($cardcases as $k => &$v) {
                $v->group_id = $id;
                $res[] = $v->save();
            }
            return response()->json('成功移动' . count($res) . '条数据');
        }
        return redirect()->route('cardcase.group.index');
    }

    /**
     * 删除
     *
     * @param int $id
     *
     * @return \Illuminate\Http\RedirectResponse|int
     */
    public function destroy(Request $request, $id)
    {
        if ($request->ajax()) {
            $group = Group::find($id);
            if ($group->delete()) {
                return response()->json('删除成功');
            }
        }
    }
}