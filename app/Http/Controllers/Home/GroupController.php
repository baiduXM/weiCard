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


class GroupController extends HomeController
{
    public function __construct()
    {
        parent::isMobile();
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 我的同事
        Breadcrumbs::register('group', function ($breadcrumbs) {
            $breadcrumbs->push('名片夹', route('cardcase.group.index'));
        });
    }


    public function index()
    {

        $groups = Group::paginate();
//        dd($groups);
//        $groups = Group::first();
//        dd($groups->users);
        if ($this->is_mobile) {
            $groups = Group::all();
            // TODO:手机页面
        }
        return view('home.group.index')->with([
            'groups' => $groups,
        ]);
    }
}