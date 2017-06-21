<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Common\HomeController;
use App\Models\Tag;
use Breadcrumbs;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;

class TagController extends HomeController
{
    public function __construct()
    {
        parent::isMobile();
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 我的同事
        Breadcrumbs::register('tag', function ($breadcrumbs) {
            $breadcrumbs->push('分组', route('cardcase.tag.index'));
        });
    }

    public function index()
    {
        $tags = Tag::paginate();
        return view('home.tag.index')->with([
            'tags' => $tags,
        ]);
    }

    public function store(Request $request)
    {
        $user = Auth::user();
        /* 验证 */
        $this->validate($request, [
//            'Tag.name' => 'required|max:30',
            'Tag.name' => 'required|max:30|unique:tags,tags.name,null,id,user_id,' . $user->id,
        ], [], [
            'Tag.name' => '组名',
        ]);

        /* 获取字段 */
        $data = $request->input('Tag');
        $data['user_id'] = $user->id;

        /* 添加 */
        if (Tag::create($data)) {
            $err_code = 300;
        } else {
            $err_code = 301;
        }
        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');
    }
//create
//store
//show
//edit
//update
//destroy
}