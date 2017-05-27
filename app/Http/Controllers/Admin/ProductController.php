<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\Product;
use Illuminate\Http\Request;
use Breadcrumbs;
use App\Models\Common;
use Illuminate\Support\Facades\Input;
use App\Http\Controllers\Common\UploadController;


class ProductController extends Controller
{
    protected $path_type = 'product'; // 文件路径保存分类

    public function __construct()
    {

        // 首页 > 产品列表
        Breadcrumbs::register('admin.product', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.company');
            $breadcrumbs->push('产品列表', route('admin.company_product.index'));
        });

        // 首页 > 产品列表 > 添加
        Breadcrumbs::register('admin.product.create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.product');
            $breadcrumbs->push('添加', route('admin.company_product.create'));
        });

        // 首页 > 产品列表 > 编辑
        Breadcrumbs::register('admin.product.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.product');
            $breadcrumbs->push('编辑', route('admin.company_product.edit', $id));
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
        }
        $products = $query->with('company')->paginate();
        return view('admin.product.index')->with([
            'products' => $products,
            'common' => new Common(),
            'params' => $params,
        ]);
    }

    public function create()
    {
        $companies = Company::where('status', '=', '1')->get();
        if (count($companies) > 0) {
            return view('admin.product.create')->with([
                'companies' => $companies,
                'common' => new Common(),
            ]);
        } else {
            return redirect('admin/company')->with('error', '没有审核通过的公司可选择');
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
            $uploadController = new UploadController();
            $data['product_img'] = $uploadController->saveImg($request->file('Product.product_img'), $this->path_type,$data['company_id']);
        }

        /* 添加 */
        if (Product::create($data)) {
            return redirect('admin/company_product')->with('success', '添加成功');
        } else {
            return redirect()->back();
        }
    }

    public function show($id)
    {
        $product = Product::find($id);
        return view('admin.product.show')->with([
            'product' => $product,
            'common' => new Common(),
        ]);
    }

    public function edit($id)
    {
        $product = Product::find($id);
        return view('admin.product.edit')->with([
            'product' => $product,
            'common' => new Common(),
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
            $uploadController = new UploadController();
            $name = time();
            $data['product_img'] = $uploadController->saveImg($request->file('Product.product_img'), $this->path_type, $data['company_id']);
        }

        foreach ($data as $key => $value) {
            if ($value !== '') {
                $product->$key = $data[$key];
            }
        }
        if ($product->save()) {
            return redirect('admin/company_product')->with('success', '修改成功 - ' . $product->id);
        } else {
            return redirect()->back();
        }
    }

    public function destroy($id)
    {
        $product = Product::where('id', $id)->first();
        if ($product->delete()) {
            $uploadController = new UploadController();
            if($product->product_img){
               $uploadController->deleteFiles($product->product_img); 
            }            
            return redirect('admin/company_product')->with('success', '删除成功 - ' . $product->id);
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
            $uploadController = new UploadController();
            foreach ($files_path as $item) {
                if($product->product_img){
                   $uploadController->deleteFiles($item); 
                }                
            }
            return redirect('admin/company_product')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $res . '条记录');
        }
    }

}