<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Group;
use App\Models\User;
use Breadcrumbs;
use Illuminate\Support\Facades\Auth;

class GroupController extends Controller
{
    public function __construct()
    {

        // 首页 > 用户列表 > 名片夹列表
        Breadcrumbs::register('admin.group', function ($breadcrumbs) {
            $breadcrumbs->parent('admin');
            $breadcrumbs->push('群列表', route('admin.user_group.index'));
        });

        // 首页 > 公司列表 > 详情
//        Breadcrumbs::register('admin.cardcase.show', function ($breadcrumbs, $id) {
//            $breadcrumbs->parent('admin.cardcase');
//            $breadcrumbs->push('详情', route('admin.user_cardcase.show', $id));
//        });
//
//        // 首页 > 公司列表 > 编辑
//        Breadcrumbs::register('admin.company.edit', function ($breadcrumbs, $id) {
//            $breadcrumbs->parent('admin.cardcase');
//            $breadcrumbs->push('编辑', route('admin.company.edit', $id));
//        });

    }

    public function index()
    {

        $params = array();
//        dd(User::find(40)->groups);
        $groups = Group::with('user')->paginate();
//        dd($groups[0]);
//        dd($groups[0]->user->nickname);
        return view('admin.group.index')->with([
            'groups' => $groups,
            'params' => $params,
        ]);
    }
}