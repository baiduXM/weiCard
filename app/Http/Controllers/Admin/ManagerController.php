<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Common\UploadController;
use App\Http\Controllers\Controller;
use App\Models\Admin\Manager;
use Breadcrumbs;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class ManagerController extends Controller
{
    public function __construct()
    {
        // 首页 > 客服管理
        Breadcrumbs::register('admin.manager', function ($breadcrumbs) {
            $breadcrumbs->parent('admin');
            $breadcrumbs->push('客服管理', route('admin.manager.index'));
        });
        // 首页 > 客服管理 > 添加
        Breadcrumbs::register('admin.manager.create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.manager');
            $breadcrumbs->push('添加', route('admin.manager.create'));
        });
        // 首页 > 客服管理 > 详情
        Breadcrumbs::register('admin.manager.show', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.manager');
            $breadcrumbs->push('详情', route('admin.manager.index', $id));
        });
        // 首页 > 客服管理 > 编辑
        Breadcrumbs::register('admin.manager.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.manager');
            $breadcrumbs->push('编辑', route('admin.manager.edit', $id));
        });
    }

    // GET 客服列表
    public function index()
    {
        $managers = Manager::paginate();
        return view('admin.manager.index')->with([
            'managers' => $managers
        ]);
    }

    // GET
    public function create()
    {
        $manager = new Manager;
        return view('admin.manager.create')->with('manager', $manager);
    }

    // POST
    public function store(Request $request)
    {
//        $path = public_path().'/uploads/images';
//
//        dd($path);
//        dd($request->file('Manager.avatar'));
////        exit;
////
//
////        $destinationPath = '/uploads/images'; // upload path
//        $extension = $request->file('Manager.avatar')->getClientOriginalExtension(); // getting image extension
//        dd($extension);
//        $fileName = rand(11111, 99999) . '.' . $extension; // renameing image
//        dd($request->file('Manager.avatar')->move($destinationPath, $fileName)); // uploading file to given path
//        // sending back with message
////        Session::flash('success', 'Upload successfully');
////        return Redirect::to('upload');
        if ($request->hasFile('Manager.avatar')) {
            $data['avatar'] = UploadController::save($request->file('Manager.avatar'),'admin');
        }
        dd($data);
        $this->validate($request, [
            'Manager.name' => 'required|alpha_dash|unique:managers,managers.name',
            'Manager.email' => 'required|email|unique:managers,managers.email',
            'Manager.password' => 'required|confirmed',
            'Manager.nickname' => 'alpha_dash',
            'Manager.avatar' => 'image|max:2*1024*1024',//最大2MB
            'Manager.avatar' => 'image|size:2*1024*1024',//文件必须2MB
            'Manager.mobile' => 'digits:11|unique:managers,managers.mobile',
            'Manager.description' => 'max:255',
        ], [
            'required' => ':attribute不能为空',
            'alpha_dash' => ':attribute只能包含字母、数字、破折号（ - ）以及下划线（ _ ）',
            'unique' => ':attribute已存在',
            'confirmed' => ':attribute两次密码不一致',
            'image' => ':attribute文件必须为图片格式（ jpeg、png、bmp、gif、 或 svg ）',
            'email' => ':attribute邮箱格式错误',
            'digits' => ':attribute长度必须11位',
            'max' => ':attribute长度太长或文件过大',
        ], [
            'Manager.name' => '账号',
            'Manager.password' => '密码',
            'Manager.nickname' => '昵称',
            'Manager.avatar' => '头像',
            'Manager.email' => '邮箱',
            'Manager.mobile' => '手机',
            'Manager.description' => '说明',
        ]);
//        dd($request->all('Manager'));
//        dd($request->input('Manager'));
        $data = $request->input('Manager');
        if ($request->hasFile('Manager.avatar')) {
            $data['avatar'] = UploadController::save($request->file('Manager.avatar'));
        }
        dd($data);
        if (Manager::create($data)) {
            return redirect('admin/manager')->with('success', '添加成功');
        } else {
            return redirect()->back();
        }
    }

    // GET
    public function show()
    {

    }

    // GET
    public function edit()
    {

    }

    // PUT\PATCH
    public function update()
    {

    }

    // DELETE
    public function destroy()
    {

    }

    // GET + POST
    public function setRole()
    {

    }

    // GET + POST
    public function setPermission()
    {

    }

//    上传图片
    public function uploadpic($filename, $filepath)
    {
        //        1.首先检查文件是否存在
        if ($request::hasFile($filename)) {
            //          2.获取文件
            $file = $request::file($filename);
            //          3.其次检查图片手否合法
            if ($file->isValid()) {
//                先得到文件后缀,然后将后缀转换成小写,然后看是否在否和图片的数组内
                if (in_array(strtolower($file->extension()), ['jpeg', 'jpg', 'gif', 'gpeg', 'png'])) {
                    //          4.将文件取一个新的名字
                    $newName = 'img' . time() . rand(100000, 999999) . $file->getClientOriginalName();
                    //           5.移动文件,并修改名字
                    if ($file->move($filepath, $newName)) {
                        return $filepath . '/' . $newName;   //返回一个地址
                    } else {
                        return 4;
                    }
                } else {
                    return 3;
                }

            } else {
                return 2;
            }
        } else {
            return 1;
        }
    }

}