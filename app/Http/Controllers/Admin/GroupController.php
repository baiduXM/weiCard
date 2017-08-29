<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\AdminController;
use App\Models\Group;
use Breadcrumbs;

class GroupController extends AdminController
{
    public function __construct()
    {

        // 首页 > 用户列表 > 名片夹列表
        Breadcrumbs::register('mpmanager.group', function ($breadcrumbs) {
            $breadcrumbs->parent('mpmanager');
            $breadcrumbs->push('群列表', route('mpmanager.user_group.index'));
        });

        // 首页 > 公司列表 > 详情
//        Breadcrumbs::register('mpmanager.cardcase.show', function ($breadcrumbs, $id) {
//            $breadcrumbs->parent('mpmanager.cardcase');
//            $breadcrumbs->push('详情', route('mpmanager.user_cardcase.show', $id));
//        });
//
//        // 首页 > 公司列表 > 编辑
//        Breadcrumbs::register('mpmanager.company.edit', function ($breadcrumbs, $id) {
//            $breadcrumbs->parent('mpmanager.cardcase');
//            $breadcrumbs->push('编辑', route('mpmanager.company.edit', $id));
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