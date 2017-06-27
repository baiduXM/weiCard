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


    public function index()
    {
        if ($this->is_mobile) {
            $groups = $this->getGroups(Auth::id());
            $groups = $this->sortArray($groups, 'order');

            return view('mobile.group.index')->with([
                'groups' => $groups,
            ]);
        }
        $groups = Group::paginate();

        return view('web.group.index')->with([
            'groups' => $groups,
        ]);
    }

    public function show(Request $request, $id)
    {
        if ($request->ajax()) {
            $cardcases = Cardcase::with('follower')->where('group_id', $id)->where('user_id', Auth::id())->get()->toArray();
            $nogroup = Cardcase::with('follower')->where('group_id', null)->where('user_id', Auth::id())->get()->toArray();
            $data['group'] = $cardcases;
            $data['none'] = $nogroup;
            return response()->json($data);
        }
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
     * 删除
     *
     * @param int $id
     *
     * @return \Illuminate\Http\RedirectResponse|int
     */
    public function destroy($id)
    {
        $group = Group::find($id);
        if ($group->delete()) {
            return response()->json('删除成功');
        }
    }
}