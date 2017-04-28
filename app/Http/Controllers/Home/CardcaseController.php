<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Cardcase;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class CardcaseController extends Controller
{


    /**
     * 首页
     *
     * @return $this
     */
    public function index()
    {
        $cardcases = Cardcase::where('user_id', Auth::id())->paginate();
        return view('home.cardcase.index')->with([
            'cardcases' => $cardcases,
        ]);
    }

    /**
     * 关注收藏
     *
     * @param $id           被关注人ID
     * @param $type         被关注人类型
     * @return string
     */
    public function follow($id, $type)
    {
        // 添加名片到名片夹

        // 名片关联用户
//        Auth::user()->follower
        Cardcase::save();
        return $id . $type;
    }


    public function create()
    {

        return view('admin.cardcase.create')->with([
        ]);

    }

    public function store(Request $request)
    {

    }

    public function show($id)
    {
        return view('admin.cardcase.show')->with([]);
    }

    public function edit($id)
    {
        return view('admin.cardcase.edit')->with([]);
    }

    public function update(Request $request, $id)
    {

    }

    public function destroy($id)
    {

    }
}

