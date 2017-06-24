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


class GroupController extends HomeController
{
    public function __construct()
    {
        $this->isMobile();
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


    public function store(Request $request)
    {
        return response()->json('info', 200);
        /* 验证 */
        $this->validate($request, [
            'Group.name' => 'required|unique:groups,groups.name,null,id,user_id,' . Auth::id(),
        ], [], [
            'Group.name' => '分组名称',
        ]);
        $data = $request->input('Group');
        $data['user_id'] = Auth::id();
        $data['order'] = 0;

        if (Group::create($data)) {
            $err_code = 300;
        } else {
            $err_code = 301;
        }
        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');
    }
}