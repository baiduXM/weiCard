<?php
/**
 * Created by PhpStorm.
 * User: Hsieh
 * Date: 2017/6/9
 * Time: 16:45
 */

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
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
//            'Group.name' => 'required', // 允许重名
        ], [], [
            'Group.name' => '分组名称',
        ]);
        $data = $request->input('Group');
        $data['user_id'] = Auth::id();
        $data['order'] = 0;

        $result = Group::create($data);

        if ($result) {
            return response()->json($result, 200);
        } else {
            return response()->json($result, 1);
        }
//        Config::set('global.ajax.err', $err_code);
//        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
//        return Config::get('global.ajax');
    }

    /**
     * 删除
     *
     * @param Request $request
     * @param         $id
     *
     * @return \Illuminate\Http\RedirectResponse|int
     */
//    public function destroy(Request $request, $id)
//    {
//
//        $group = Group::find($id);
//
//        $res = $group->delete();
//        if ($res) {
//            $err_code = 400; // 删除成功
//        } else {
//            $err_code = 401; // 删除失败
//        }
//
//        if ($request->ajax()) {
//
//        }
//
//
//        if ($err_code % 100 == 0) {
//            return redirect('company/position')->with('success', config('global.msg.' . $err_code));
//        } else {
//            return redirect()->back()->with('error', config('global.msg.' . $err_code));
//        }
//    }
}