<?php

namespace App\Http\Controllers\Mobile;

use App\Models\Cardcase;
use App\Models\Group;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CardcaseController extends CommonController
{

    public function __construct()
    {
        // TODO
    }

    /**
     * 首页
     *
     * @param string $sort  group|alphabet|time  按组|字母|时间排序
     * @param string $order asc|desc 升序|降序
     *
     * @return $this
     */
    public function index($sort = 'group', $order = 'asc')
    {
        $cardcases = Cardcase::with('follower', 'group')->where('user_id', Auth::id())->get()->toArray();
        $cardcases = $this->sortData($cardcases, $sort, $order);
//        dd($cardcases);
        return view('mzui.cardcase.index')->with([
            'data' => $cardcases,
        ]);
    }

    /**
     * 对数据进行分组排序
     *
     * @param array  $data  要排序的数组
     * @param string $sort  排序类型
     * @param string $order asc|desc 升序|降序
     *
     * @return array    排序后的数组
     */
    public function sortData(array $data, $sort, $order = 'asc')
    {
//        dd($data);
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

    public function create()
    {
        return view('mzui.cardcase.create')->with([
        ]);

    }

    public function store(Request $request)
    {

    }

    public function show($type = 'u')
    {

    }

    public function edit()
    {
        return view('mzui.cardcase.edit')->with([
        ]);
    }

    public function update(Request $request, $id)
    {

    }

    public function destroy($id)
    {

    }

}

