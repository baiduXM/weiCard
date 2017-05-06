<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\UploadController;
use Breadcrumbs;
use App\Http\Controllers\Controller;
use App\Models\Common;
use App\Models\Template;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TemplateController extends Controller
{
    protected $path_type='template'; //路径

    public function __construct()
    {
        //首页>模板管理>模板上传
//        Breadcrumbs::register('admin.template',function ($breadcrumbs){
//            $breadcrumbs->parent('admin');
//            $breadcrumbs->push('模板上传',route('admin.template'));
//        });
        //首页>模板管理>模板展示
        //TODO
    }

    public function uploadtem(Request $request)
    {
        $this->validate($request,[
            'Template.name' => 'required',
            'Template.display_name' => 'required',
           // 'Template.file' => 'required',
        ],[],[
            'Template.name' => '模板名称',
            'Template.display_name' => '模板显示名称',
            //'Template.file' => '模板文件',
        ]);

        /* 获取字段 */
        $data=$request->input('Template');
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null;
            }
        }

        /* 获取文件,解压文件到指定目录 */
        if($request->hasFile('Template.file')){
            $uploadController = new UploadController();
            $data['file']=$uploadController->saveFile($request->file('Template.file'),$this->path_type,$data['name']);
        }

        /* 数据处理 */
        $template=Template::where('name',$data['name'])->get();
        if(!$template->isEmpty()){
        $save = Template::where('name', $data['name'])->update($data);
        if ($save) {
            return redirect('admin/template')->with('success', '模板修改成功 ' );
        } else {
            return redirect()->back()->with('error', '模板修改失败  ' );
        }
        }else{
            if(Template::create($data)){
            return redirect('admin/template')->with('success', '添加成功');
            }else{
            return redirect()->back()->with('error', '添加失败');
            }
        }
    }

    // TODO
    public function index()
    {
        return view('admin.template.index');
    }
}