<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Common\HomeController;
use App\Models\Cardcase;
use App\Models\Group;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CardcaseController extends HomeController
{

    public function __construct()
    {
        // TODO
    }

    /**
     * 首页
     *
     * @param string  $sort     排序方式，可选。
     *                          group|alphabet|time => 分组|字母|时间排序
     * @param string  $order    排序顺序，可选。
     *                          asc|desc => 升序|降序
     * @param Request $request
     *
     * @return $this
     */
    public function index(Request $request)
    {
        /* 排序方式 */
        $sort = $request->input('sort') ? $request->input('sort') : 'group';
        /* 排序顺序 */
//        $order = $request->input('order') ? $request->input('order') : 'asc';

        $cardcases = Cardcase::with('follower')->where('user_id', Auth::id())->get()->toArray();
        $cardcases = $this->getPinyin($cardcases);
        if ($sort == 'group') {
            $field = 'order';
            $groups = $this->getGroups(Auth::id());
            $groups = $this->sortArray($groups, $field);
            foreach ($groups as $k => &$v) {
                foreach ($cardcases as $ck => $vk) {
                    if ($v['id'] == $vk['group_id']) {
                        $v['cardcases'][] = $vk;
                    }
                }
                if (!isset($v['cardcases'])) {
                    $v['cardcases'] = array();
                }
            }
            $data = $groups;

        } elseif ($sort == 'alphabet') {
            $alph = range('A', 'Z');
            foreach ($alph as $k => $v) {
                $groups[$v] = array(
                    'id' => $k,
                    'name' => $v,
                    'cardcases' => array(),
                );
            }
            foreach ($cardcases as $k => $v) {
                $groups[strtoupper(substr($v['follower']['pinyin'], 0, 1))]['cardcases'][] = $v;
            }
            foreach ($groups as $k => $v) {
                if (count($v['cardcases']) <= 0) {
                    unset($groups[$k]);
                }
            }
            $data = $groups;
        } elseif ($sort == 'time') {
            // TODO:时间排序怎么分组
            $groups[0] = array(
                'id' => 0,
                'name' => '默认分组',
                'order' => 0,
            );
            $field = 'created_at';
            $cardcases = $this->sortArray($cardcases, $field);
            $groups[0]['cardcases'] = $cardcases;
            $data = $groups;
            dump($groups);

        }

//        dump($data);
//        exit;

        // 排序分组|名片

        // 将名片归类分组

        return view('mzui.cardcase.index')->with([
            'data' => $data,
        ]);
    }


    /**
     * 字符串转拼音
     *
     * @param string $data
     *
     * @return mixed
     */
    private function getPinyin($data)
    {
        if (is_array($data)) {
            foreach ($data as $k => &$v) {
                $v['follower']['pinyin'] = $this->pinyin($v['follower']['nickname']) . ' ' . $this->pinyin($v['follower']['nickname'], 'abbr');
            }
        }
        return $data;
    }

}

