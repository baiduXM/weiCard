<?php

namespace App\Http\Controllers\Mobile;

use App\Models\Cardcase;
use Illuminate\Support\Facades\Auth;
use Overtrue\LaravelPinyin\Facades\Pinyin;

class CardcaseController extends CommonController
{

    public function __construct()
    {
        // TODO
    }

    /**
     * 首页
     *
     * @param string $sort group|alphabet|time  按组|字母|时间排序
     * @param string $order asc|desc 升序|降序
     *
     * @return $this
     */
    public function index($sort = 'group', $order = 'asc')
    {
        $cardcases = Cardcase::with('follower', 'group')->where('user_id', Auth::id())->get()->toArray();
        $cardcases = $this->getPinyin($cardcases);
        dd($cardcases);
        $cardcases = $this->sortData($cardcases, $sort, $order);
        return view('mzui.cardcase.index')->with([
            'data' => $cardcases,
        ]);
    }

    private function getPinyin($data)
    {
//        dd($data);
        if (is_array($data)) {
            foreach ($data as $k => &$v) {
                $v['follower']['pinyin'] = Pinyin::permalink($v['follower']['nickname'], '') . ' ' . Pinyin::abbr($v['follower']['nickname']);
            }
        }
        return $data;
    }

}

