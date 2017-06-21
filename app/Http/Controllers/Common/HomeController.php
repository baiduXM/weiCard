<?php

namespace App\Http\Controllers\Common;

use App\Http\Controllers\Controller;
use App\Models\Group;

/**
 * 移动端公共控制器，其他模块控制器继承该控制器
 * 可调用Common文件夹下的，全局公共控制器
 *
 * @package App\Http\Controllers\Mobile
 */
class HomeController extends CommonController
{
    public function __construct()
    {
        // TODO
    }

    /**
     * 获取用户分组
     *
     * @param int $user_id 用户ID
     *
     * @return mixed 分组数组
     */
    public function getGroups($user_id)
    {
        $groups = Group::where('user_id', $user_id)->select('id', 'name', 'order')->get()->toArray();
        $group = array(
            'id' => 0,
            'name' => '默认分组',
            'order' => 0,
        );
        array_unshift($groups, $group); // 将默认数组加入到$groups中
        return $groups;
    }
}

