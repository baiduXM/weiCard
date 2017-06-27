<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Company;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Breadcrumbs;
use Illuminate\Support\Facades\Config;

class ProductController extends HomeController
{

    protected $path_type = 'product'; // 文件路径保存分类

    public function __construct()
    {
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 公司产品
        Breadcrumbs::register('company.product', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('公司产品', route('company.product.index'));
        });
    }

    /**
     * 显示员工（除自己）
     *
     * @return $this
     */
    public function index()
    {
        if (Auth::user()->company) {
            $products = Product::where('company_id', '=', Auth::user()->company->id)->paginate();
            $company = Auth::user()->company ? Auth::user()->company : Auth::user()->employee->company;
            return view('web.product.index')->with([
                'products' => $products,
                'company' => $company,
            ]);
        } else {
            return redirect()->back()->with('error', '请先绑定公司');
        }
    }

    /**
     *
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        /* 验证 */
        $this->validate($request, [
            'Product.product_name' => 'required',
            'Product.product_url' => 'required|url:true',
            'Product.product_img' => 'image|max:' . 2 * 1024, // 最大2MB
        ], [], [
            'Product.product_name' => '产品名称',
            'Product.product_url' => '产品链接',
            'Product.product_img' => '产品图片',
        ]);
        /* 获取字段类型 */
        $data = $request->input('Product');
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }
        /* 获取文件类型 */
        if ($request->hasFile('Product.product_img')) {
            $data['product_img'] = $this->save($request->file('Product.product_img'), $this->path_type, Auth::user()->company->name);
        }
//        return $data['product_img'];

        $data['company_id'] = Auth::user()->company->id;

        /* 添加 */
        if (Product::create($data)) {
            $err_code = 300;
        } else {
            $err_code = 301;
        }

        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');
    }

    /**
     * 查看
     *
     * @param $id
     * @return \Illuminate\Database\Eloquent\Collection|\Illuminate\Database\Eloquent\Model|null|static|static[]
     */
    public function show($id)
    {
        $product = Product::where('id', $id)->first();
        return $product;
    }

    public function update(Request $request, $id)
    {

        $product = Product::find($id);
        /* 验证 */
        $this->validate($request, [
            'Product.product_name' => 'required',
            'Product.product_url' => 'required|url:true',
            'Product.product_img' => 'image|max:' . 2 * 1024, // 最大2MB            
        ], [], [
            'Product.product_name' => '产品名称',
            'Product.product_url' => '产品链接',
            'Product.product_img' => '产品图片',
        ]);
        $data = $request->input('Product');

        /* 获取文件类型 */
        if ($request->hasFile('Product.product_img')) {
            $data['product_img'] = $this->save($request->file('Product.product_img'), $this->path_type, Auth::user()->company->name);
        }

        foreach ($data as $key => $value) {
            if ($value !== '') {
                $product->$key = $data[$key];
            }
        }
        if ($product->save()) {
            $err_code = 500;
        } else {
            $err_code = 501;
        }

        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');
    }

    /*
     */
    /**
     * 删除
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\RedirectResponse|int
     */
    public function destroy(Request $request, $id)
    {
        $product = Product::where('id', $id)->first();

        $res = $product->delete();
        if ($res) {
            if ($product->product_img) {
                $this->deleteFiles($product->product_img);
            }
            $err_code = 400; // 删除成功
        } else {
            $err_code = 401; // 删除失败
        }

        if ($err_code % 100 == 0) {
            return redirect('company/product')->with('success', config('global.msg.' . $err_code));
        } else {
            return redirect()->back()->with('error', config('global.msg.' . $err_code));
        }
    }

    /*产品外链*/

    public function productlink(Request $request){
        //dd($request);

        $id=Auth::user()->company->id;
        $this->validate($request,[
            'Company.productlink' => 'url:true',
            'Company.is_productlink' => '',
        ],[],[
            'Company.productlink' => '公司产品外链',
            'Company.is_productlink' => '公司产品外链开关',
        ]);

        $data = $request->input('Company');
        //dd($data);
        $company= Company::find($id);
        foreach ($data as $key => $value) {
            if ($value !== '') {
                $company->$key = $data[$key];
            }
        }
        if($company->save()){
            return redirect('company/product')->with('success','修改成功  ' );
        }else{
            return redirect()->back()->with('error','修改失败  ');
        }

    }

}

