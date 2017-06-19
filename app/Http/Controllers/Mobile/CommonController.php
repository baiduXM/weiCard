<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Controller;
use App\Models\Cardcase;
use App\Models\Group;
use Illuminate\Support\Facades\Auth;

/**
 * 移动端公共控制器，其他模块控制器继承该控制器
 * 可调用Common文件夹下的，全局公共控制器
 *
 * @package App\Http\Controllers\Mobile
 */
class CommonController extends Controller
{
    public function __construct()
    {
        // TODO
    }

    public function search()
    {
        return view('mzui.common.search');
    }



    /**
     * 对数据进行分组排序
     *
     * @param array $data 要排序的数组
     * @param string $sort 排序类型
     * @param string $order asc|desc 升序|降序
     *
     * @return array    排序后的数组
     */
    public function sortData(array $data, $sort, $order = 'asc')
    {
        dd($data);
//        $res = array();
        $rules = array(
            'direction' => $order == 'asc' ? SORT_ASC : SORT_DESC, //排序顺序标志 SORT_DESC 降序；SORT_ASC 升序
            'field' => '',       //排序字段
        );
        if ($sort == 'group') {
            $rules['field'] = 'order';
            $groups = Group::with('cardcases')->where('user_id', Auth::id())->orderBy('order', $order)->get()->toArray();
            $group = array(
                'id' => 0,
                'user_id' => Auth::id(),
                'name' => '默认分组',
                'order' => 0,
                'cardcases' => Cardcase::where('user_id', Auth::id())->where('group_id', null)->get()->toArray(),
            );
            array_unshift($groups, $group); // 将默认数组加入到$groups中
            /* 对数组按键名重组 */
            $arrSort = array();
            foreach ($groups AS $unique => $row) {
                foreach ($row AS $key => $value) {
                    $arrSort[$key][$unique] = $value;
                }
            }
            array_multisort($arrSort[$rules['field']], $rules['direction'], $groups); // 对$groups排序
            $data = $groups;

        } elseif ($sort == 'alphabet') {

        } elseif ($sort == 'time') {

        }
        return $data;
    }
}

