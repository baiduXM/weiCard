<?php

namespace App\Http\Controllers\Admin;

use Gate;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Overtrue\LaravelPinyin\Facades\Pinyin;


class IndexController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:admin');
    }

    public function index()
    {
        return view('admin.index');
    }

    public function test()
    {
        echo(Pinyin::permalink('How are you.其实很简单duiBa,haode好的', '')); // 拼音全拼，无间隔拼接
        // HowareyouqishihenjiandanduiBahaodehaode
        echo '<br>';
        echo(Pinyin::abbr('How are you.其实很简单duiBa,haode好的', '')); // 拼音首字母
        // Hayqshjddhhd
        echo '<br>';
    }


}
