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
            $links = Link::where('company_id', '=', Auth::user()->company->id)->orderBy('sort','asc')->paginate();
            //底部link
            //底部-一键拨号
            $link_phone = $links->where('default_link', 'phone');
            if (count($link_phone) <= 0) {
                $phone_input = [
                    'company_id' => Auth::user()->company->id,
                    'link_name' => '一键拨号',
                    'link_url' => 'javascript:;',
                    'link_img' => '&#xe644',
                    'class' => 'mp-tel-btn same animated fadeInLeftBig go',
                    'class_id' => '',
                    'sort' => '1',
                    'is_open' => '1',
                    'default_link' => 'phone',
                ];
                $input_phone = Link::create($phone_input);
            }
            //底部-名片夹
            $link_cardcase = $links->where('default_link', 'cardcase');
            if (count($link_cardcase) <= 0) {
                $phone_input = [
                    'company_id' => Auth::user()->company->id,
                    'link_name' => '名片夹',
                    'link_url' => '',
                    'link_img' => '&#xe617',
                    'class' => 'name same animated fadeInLeftBig go',
                    'class_id' => '',
                    'sort' => '2',
                    'is_open' => '1',
                    'default_link' => 'cardcase',
                ];
                $input_cardcase = Link::create($phone_input);
            }
            //底部-关注
            $link_follow = $links->where('default_link', 'follow');
            if (count($link_follow) <= 0) {
                $phone_input = [
                    'company_id' => Auth::user()->company->id,
                    'link_name' => '关注',
                    'link_url' => '',
                    'link_img' => '&#xe642',
                    'class' => 'mp-follow-btn follow same animated fadeInRightBig go',
                    'class_id' => 'done',
                    'sort' => '3',
                    'is_open' => '1',
                    'default_link' => 'follow',
                ];
                $input_follow = Link::create($phone_input);
            }
            //底部-发票信息
            $link_invoice = $links->where('default_link', 'invoice');
            if (count($link_invoice) <= 0) {
                $phone_input = [
                    'company_id' => Auth::user()->company->id,
                    'link_name' => '发票信息',
                    'link_url' => 'javascript:;',
                    'link_img' => '&#xe6d0',
                    'class' => 'same animated fadeInRightBig qy-mess-btn',
                    'class_id' => '',
                    'sort' => '4',
                    'is_open' => '1',
                    'default_link' => 'invoice',
                ];
                $input_invoice = Link::create($phone_input);
            }
            //底部-留言板
            $link_message = $links->where('default_link', 'message');
            if (count($link_message) <= 0) {
                $phone_input = [
                    'company_id' => Auth::user()->company->id,
                    'link_name' => '留言板',
                    'link_url' => 'javascript:;',
                    'link_img' => '&#xe63d',
                    'class' => '',
                    'class_id' => '',
                    'sort' => '5',
                    'is_open' => '1',
                    'default_link' => 'message',
                ];
                $input_message = Link::create($phone_input);
            }

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
//        /*获取文件类型*/
//        if ($request->hasFile('Link.link_img')) {
//            $data['link_img'] = $this->save($request->file('Link.link_img'), $this->path_type, Auth::user()->company->name);
//        }
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
        //dd($request->input('Link'));
        if ($link->default_link == 'phone' || $link->default_link == 'cardcase' || $link->default_link == 'follow' || $link->default_link == 'invoice' || $link->default_link == 'message') {
            /*验证*/
            $this->validate($request, [
                'Link.sort' => 'required',
            ], [], [
                'Link.sort' => '微链接排序',

            ]);

        } else {
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
        }
        $data = $request->input('Link');
        //dd($data);
//        /*获取文件类型*/
//        if ($request->hasFile('Link.link_img')) {
//            $data['link_img'] = $this->save($request->file('Link.link_img'), $this->path_type, Auth::user()->company->name);
//        }

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











