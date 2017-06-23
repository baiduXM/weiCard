<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Link;
use Illuminate\Http\Request;
use Breadcrumbs;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;

class LinkController extends HomeController
{
    protected $path_type = 'link'; // 文件路径保存分类

    public function __construct()
    {
        //设置面包屑导航
        Breadcrumbs::setView('vendor/breadcrumbs');

        //我的公司>微链接
        Breadcrumbs::register('company.link', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('微链接', route('company.link.index'));
        });
    }

    public function index()
    {
        if (Auth::user()->company) {
            $links = Link::where('company_id', '=', Auth::user()->company->id)->paginate();
            $icons = DB::table('icons')->get();
            //dd($icons);
            return view('web.link.index')->with([
                'links' => $links,
                'icons' => $icons,
            ]);
        } else {
            return redirect()->back()->with('error', '请先绑定公司');
        }

    }


    public function store(Request $request)
    {
        /*验证*/
        $this->validate($request, [
            'Link.link_name' => 'required',
            'Link.link_url' => 'required|url:true',
            'Link.link_img' => 'required',
        ], [], [
            'Link.link_name' => '微链接名称',
            'Link.link_url' => '微链接网址',
            'Link.link_img' => '微链接图标',
        ]);

        /*获取字段类型*/
        $data = $request->input('Link');
        foreach ($data as $key => $value) {

            if ($value === '') {
                $data[$key] = null;//未填字段设置为null，否则会保存''
            }
        }
        /*获取文件类型*/
        if ($request->hasFile('Link.link_img')) {
            $data['link_img'] = $this->save($request->file('Link.link_img'), $this->path_type, Auth::user()->company->name);
        }
        $data['company_id'] = Auth::user()->company->id;
        /*添加*/
        if (Link::create($data)) {
            $err_code = 300;
        } else {
            $err_code = 301;
        }
        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');
    }


    /*查看*/
    public function show($id)
    {
        $link = Link::where('id', $id)->first();
//        $link->link_img=$link->link_img.';';
        return $link;
    }

    public function update(Request $request, $id)
    {
        $link = Link::find($id);
        /*验证*/
        $this->validate($request, [
            'Link.link_name' => 'required',
            'Link.link_url' => 'required|url:true',
            'Link.link_img' => 'required',
        ], [], [
            'Link.link_name' => '微链接名称',
            'Link.link_url' => '微链接网址',
            'Link.link_img' => '微链接图标',
        ]);
        $data = $request->input('Link');

        /*获取文件类型*/
        if ($request->hasFile('Link.link_img')) {
            $data['link_img'] = $this->save($request->file('Link.link_img'), $this->path_type, Auth::user()->company->name);
        }

        foreach ($data as $key => $value) {
            if ($value !== '') {
                $link->$key = $data[$key];
            }
        }
        if ($link->save()) {
            $err_code = 500;
        } else {
            $err_code = 501;
        }

        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');

    }

    /*删除*/
    public function destroy(Request $request, $id)
    {
        $link = Link::where('id', $id)->first();
        $res = $link->delete();
        if ($res) {
            $err_code = 400;//删除成功
        } else {
            $err_code = 401;//删除失败
        }

        if ($err_code % 100 == 0) {
            return redirect('company/link')->with('success', config('global.msg.' . $err_code));
        } else {
            return dedirect()->back()->with('error', config('global.msg.' . $err_code));
        }

    }


}











