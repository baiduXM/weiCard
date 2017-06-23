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
//        dd($groups);
//        $groups = Group::first();
//        dd($groups->users);
        if ($this->is_mobile) {
            $groups = Group::all();
            // TODO:手机页面
        }
        return view('web.group.index')->with([
            'groups' => $groups,
        ]);
    }
}