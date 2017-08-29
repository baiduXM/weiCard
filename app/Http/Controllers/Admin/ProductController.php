<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\AdminController;
use App\Models\Company;
use App\Models\Product;
use Illuminate\Http\Request;
use Breadcrumbs;
use App\Models\CommonModel;
use Illuminate\Support\Facades\Input;


class ProductController extends AdminController
{
    protected $path_type = 'product'; // 文件路径保存分类

    public function __construct()
    {

        // 首页 > 产品列表
        Breadcrumbs::register('mpmanager.product', function ($breadcrumbs) {
            $breadcrumbs->parent('mpmanager.company');
            $breadcrumbs->push('产品列表', route('mpmanager.company_product.index'));
        });

        // 首页 > 产品列表 > 添加
        Breadcrumbs::register('mpmanager.product.create', function ($breadcrumbs) {
            $breadcrumbs->parent('mpmanager.product');
            $breadcrumbs->push('添加', route('mpmanager.company_product.create'));
        });

        // 首页 > 产品列表 > 编辑
        Breadcrumbs::register('mpmanager.product.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('mpmanager.product');
            $breadcrumbs->push('编辑', route('mpmanager.company_product.edit', $id));
        });

    }

    /**
     * 首页
     *
     */
    public function index()
    {

        $model = new Product();
        $query = Product::query();
        $params = Input::query();
        if ($params) {
            foreach ($params as $key => $value) {
                if (array_key_exists($key, $model->query)) {
                    $query->where($key, $model->query[$key], $value);
                }
            }
            if(isset($params['company_id'])){
                $company_id = $params['company_id'];
            }else{
                $company_id = 0;
            }            
        }else{
            $company_id = 0;
        }
        $products = $query->with('company')->paginate();
        $company = new Company;
        $companies = $company->get();
        return view('admin.product.index')->with([
            'products' => $products,
            'common' => new CommonModel(),
            'params' => $params,
            'company_id' => $company_id,
            'companies' => $companies,
        ]);
    }

    public function create()
    {
        $companies = Company::all();
        if (count($companies) > 0) {
            return view('admin.product.create')->with([
                'companies' => $companies,
                'common' => new CommonModel(),
            ]);
        } else {
            return redirect('mpmanager/company')->with('error', '没有审核通过的公司可选择');
        }
    }

    public function store(Request $request)
    {

        $data = $request->input('Product');
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
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }

        /* 获取文件类型 */
        if ($request->hasFile('Product.product_img')) {
            $company = Company::find($data['company_id']);
            $data['product_img'] = $this->save($request->file('Product.product_img'), $this->path_type, $company->id);
        }

        /* 添加 */
        if (Product::create($data)) {
            return redirect('mpmanager/company_product')->with('success', '添加成功');
        } else {
            return redirect()->back();
        }
    }

    public function show($id)
    {
        $product = Product::find($id);
        return view('admin.product.show')->with([
            'product' => $product,
            'common' => new CommonModel(),
        ]);
    }

    public function edit($id)
    {
        $product = Product::find($id);
        return view('admin.product.edit')->with([
            'product' => $product,
            'common' => new CommonModel(),
        ]);
    }

    public function update(Request $request, $id)
    {
        $product = Product::find($id);
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
            $data['product_img'] = $this->save($request->file('Product.product_img'), $this->path_type, $product->company->id);
        }

        foreach ($data as $key => $value) {
            if ($value !== '') {
                $product->$key = $data[$key];
            }
        }
        if ($product->save()) {
            return redirect('mpmanager/company_product')->with('success', '修改成功 - ' . $product->id);
        } else {
            return redirect()->back();
        }
    }

    public function destroy($id)
    {
        $product = Product::where('id', $id)->first();
        if ($product->delete()) {
            if ($product->product_img) {
                $this->deleteFiles($product->product_img);
            }
            return redirect('mpmanager/company_product')->with('success', '删除成功 - ' . $product->id);
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $product->id);
        }
    }

    /**
     * 批量删除
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function batchDestroy(Request $request)
    {
        $ids = explode(',', $request->input('ids'));
        $files_path = Product::whereIn('id', $ids)->pluck('product_img');
        $res = Product::whereIn('id', $ids)->delete();
        if ($res) {
            $this->deleteFiles($files_path);
            return redirect('mpmanager/company_product')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $res . '条记录');
        }
    }

}