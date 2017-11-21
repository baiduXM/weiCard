<?php

namespace App\Http\Controllers\Home;



use App\Http\Requests;
use App\Http\Controllers\Common\HomeController;
use App\Models\Category;
use Illuminate\Http\Request;
use Breadcrumbs;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\DB;

class CategoryController extends HomeController
{
    //
    protected $path_type = 'category';// 文件路径保存分类

    public function __construct()
    {
        //设置面包屑导航
        Breadcrumbs::setView('vendor/breadcrumbs');

        //我的公司>栏目管理
        Breadcrumbs::register('company.category', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('栏目管理', route('company.category.index'));
        });
    }

    public function index(){
        $categorys = Category::where('company_id', '=', Auth::user()->company->id)->orderBy('sort','asc')->paginate();
        /* 企业版各栏目*/
        //关于我们
        $category_about = $categorys->where('category_id', '1');
        if (count($category_about) <= 0) {
            $phone_input = [
                'sort' => '1',
                'category_name' => '关于我们',
                'category_id' => '1',
                'category_url' => '',
                'category_img' => '&#xe653',
                'class' => 'mp-company-btn',
                'is_link' => '0',
                'ajax_link' => 'category-about/'.Auth::user()->company->id,
                'company_id' => Auth::user()->company->id,
            ];
            $input_phone = Category::create($phone_input);
        }

        //产品服务
        $category_product = $categorys->where('category_id', '2');
        if (count($category_product) <= 0) {
            $phone_input = [
                'sort' => '2',
                'category_name' => '产品服务',
                'category_id' => '2',
                'category_url' => '',
                'category_img' => '&#xe633',
                'class' => 'mp-propage-btn',
                'is_link' => '0',
                'ajax_link' => 'category-product/'.Auth::user()->company->id,
                'company_id' => Auth::user()->company->id,
            ];
            $input_phone = Category::create($phone_input);
        }

        //个人信息
        $category_contact = $categorys->where('category_id', '3');
        if (count($category_contact) <= 0) {
            $phone_input = [
                'sort' => '3',
                'category_name' => '个人信息',
                'category_id' => '3',
                'category_url' => '',
                'category_img' => '&#xe714',
                'class' => 'mp-contact-btn',
                'is_link' => '0',
                'ajax_link' => 'category-contact/',
                'company_id' => Auth::user()->company->id,
            ];
            $input_phone = Category::create($phone_input);
        }

        //导航
        $category_nav = $categorys->where('category_id', '4');
        if (count($category_nav) <= 0) {
            $phone_input = [
                'sort' => '4',
                'category_name' => '导航',
                'category_id' => '4',
                'category_url' => '',
                'category_img' => '&#xe66c',
                'class' => '',
                'is_link' => '0',
                'ajax_link' => 'category-nav/'.Auth::user()->company->id,
                'company_id' => Auth::user()->company->id,
            ];
            $input_phone = Category::create($phone_input);
        }

        //分享
        $category_qrcode = $categorys->where('category_id', '5');
        if (count($category_qrcode) <= 0) {
            $phone_input = [
                'sort' => '5',
                'category_name' => '分享',
                'category_id' => '5',
                'category_url' => '',
                'category_img' => '&#xe729',
                'class' => 'mp-code-btn',
                'is_link' => '0',
                'ajax_link' => 'category-qrcode/',
                'company_id' => Auth::user()->company->id,
            ];
            //默认外链栏目1
            $phone_input1 = [
                'sort' => '6',
                'category_name' => '百度',
                'category_id' => '0',
                'category_url' => 'http://www.baidu.com',
                'category_img' => '&#xe623',
                'class' => '',
                'is_link' => '1',
                'ajax_link' => '',
                'company_id' => Auth::user()->company->id,
            ];
            //默认外链栏目2
            $phone_input2 = [
                'sort' => '7',
                'category_name' => '12T',
                'category_id' => '0',
                'category_url' => 'http://www.12t.cn',
                'category_img' => '&#xe6cb',
                'class' => '',
                'is_link' => '1',
                'ajax_link' => '',
                'company_id' => Auth::user()->company->id,
            ];

            //默认外链栏目3
            $phone_input3 = [
                'sort' => '8',
                'category_name' => 'G宝盆',
                'category_id' => '0',
                'category_url' => 'http://www.gbpen.com',
                'category_img' => '&#xe654',
                'class' => '',
                'is_link' => '1',
                'ajax_link' => '',
                'company_id' => Auth::user()->company->id,
            ];

            //默认外链栏目4
            $phone_input4 = [
                'sort' => '9',
                'category_name' => 'E推',
                'category_id' => '0',
                'category_url' => 'http://www.12t.cn/tg_wzjs.html#tg_pro3',
                'category_img' => '&#xe661',
                'class' => '',
                'is_link' => '1',
                'ajax_link' => '',
                'company_id' => Auth::user()->company->id,
            ];
            $input_phone =  Category::create($phone_input);
            $input_phone1 = Category::create($phone_input1);
            $input_phone2 = Category::create($phone_input2);
            $input_phone3 = Category::create($phone_input3);
            $input_phone4 = Category::create($phone_input4);
        }

        $icons = DB::table('icons')->get();
        return view('web.category.index')->with([
            'categorys' => $categorys,
            'icons' => $icons,
        ]);
    }

    /*新增数据*/
    public function store(Request $request){

        /*验证*/
        $this->validate($request, [
            'Category.category_name' => 'required',
            'Category.category_url' => 'required|url:true',
            'Category.category_img' => 'required',
        ], [], [
            'Category.category_name' => '栏目名称',
            'Category.category_url'  => '栏目网址',
            'Category.category_img'  => '栏目图标',
        ]);

        /*获取字段类型*/
        $data = $request->input('Category');
       // dd($data);
        foreach ($data as $key => $value) {

            if ($value === '') {
                $data[$key] = null;//未填字段设置为null，否则会保存''
            }
            if ($key == 'is_link') {
                if ($value == null) {
                    $data['is_link'] = '1';
                }
            }
        }
        $data['category_id'] = '0';
        $data['is_link'] = '1';
        $data['company_id'] = Auth::user()->company->id;
        /*添加*/
        if (Category::create($data)) {
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
        $category = Category::where('id', $id)->first();
        return $category;
    }

    /*编辑*/
    public function update(Request $request, $id)
    {
        $category = Category::find($id);


            /*验证*/
            $this->validate($request, [
                'Category.category_name' => 'required',
                'Category.category_url' => 'url:true',
                'Category.category_img' => 'required',
            ], [], [
                'Category.category_name' => '栏目名称',
                'Category.category_url' => '栏目网址',
                'Category.category_img' => '栏目图标',
            ]);



        $data = $request->input('Category');

        foreach ($data as $key => $value) {
            if ($value !== '') {
                $category->$key = $data[$key];
            }
        }
        if ($category->save()) {
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
        $category = Category::where('id', $id)->first();
        $res = $category->delete();
        if ($res) {
            $err_code = 400;//删除成功
        } else {
            $err_code = 401;//删除失败
        }

        if ($err_code % 100 == 0) {
            return redirect('company/category')->with('success', config('global.msg.' . $err_code));
        } else {
            return dedirect()->back()->with('error', config('global.msg.' . $err_code));
        }

    }



}
