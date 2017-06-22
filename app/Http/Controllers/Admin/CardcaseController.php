<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\AdminController;
use App\Models\Cardcase;
use Illuminate\Support\Facades\Input;
use Breadcrumbs;

class CardcaseController extends AdminController
{
    public function __construct()
    {

        // 首页 > 用户列表 > 名片夹列表
        Breadcrumbs::register('admin.cardcase', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.user');
            $breadcrumbs->push('名片夹列表', route('admin.user_cardcase.index'));
        });

        // 首页 > 公司列表 > 详情
        Breadcrumbs::register('admin.cardcase.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.cardcase');
            $breadcrumbs->push('详情', route('admin.user_cardcase.show', $id));
        });

        // 首页 > 公司列表 > 编辑
        Breadcrumbs::register('admin.company.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.cardcase');
            $breadcrumbs->push('编辑', route('admin.company.edit', $id));
        });

    }

    public function index()
    {
        $model = new Cardcase();
        $query = Cardcase::query();
        $params = Input::query();
        if ($params) {
            foreach ($params as $key => $value) {
                if (array_key_exists($key, $model->query)) {
                    $query->where($key, $model->query[$key], $value);
                }
            }
        }
        $cardcases = $query->with('user', 'follower')->paginate();
        return view('admin.cardcase.index')->with([
            'cardcases' => $cardcases,
            'params' => $params,
        ]);
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