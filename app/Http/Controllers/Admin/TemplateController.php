<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\AdminController;
use Breadcrumbs;
use App\Models\AuthModel;
use App\Models\Template;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TemplateController extends AdminController
{
    protected $path_type = 'template'; //路径

    public function __construct()
    {
        //首页>模板管理>模板上传
        Breadcrumbs::register('admin.template.create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.template');
            $breadcrumbs->push('模板上传', route('admin.template.create'));
        });
        //首页>模板管理>模板展示
        //TODO
    }

    public function index()
    {
        $templates = Template::paginate();
        return view('admin.template.index')->with([
            'templates' => $templates,
        ]);
    }

    public function create()
    {
        return view('admin.template.create')->with([
            'template' => new Template(),
        ]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'Template.name' => 'required',
            'Template.display_name' => 'required',
//             'Template.file' => 'required',
        ], [], [
            'Template.name' => '模板名称',
            'Template.display_name' => '模板显示名称',
//            'Template.file' => '模板文件',
        ]);

        /* 获取字段 */
        $data = $request->input('Template');
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null;
            }
        }

        /* 获取文件,解压文件到指定目录 */
        if ($request->hasFile('Template.file')) {
            $data['file'] = $this->save($request->file('Template.file'), $this->path_type, $data['name']);
        }
        $data['manager_id'] = Auth::guard('admin')->id();

        /* 数据处理 */
        $template = Template::where('name', $data['name'])->get();
        if (!$template->isEmpty()) {
            $save = Template::where('name', $data['name'])->update($data);
            if ($save) {
                return redirect('admin/template')->with('success', '模板修改成功 ');
            } else {
                return redirect()->back()->with('error', '模板修改失败  ');
            }
        } else {
            if (Template::create($data)) {
                return redirect('admin/template')->with('success', '添加成功');
            } else {
                return redirect()->back()->with('error', '添加失败');
            }
        }
    }

    /**
     * 删除
     *
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        $template = Template::find($id);
        if ($template->delete()) {
            $this->deleteFolder($template->file);
            return redirect('admin/template')->with('success', '删除成功 - ' . $template->name);
        } else {
            return redirect('admin/template')->with('error', '删除失败 - ' . $template->name);
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
        $files_path = Template::whereIn('id', $ids)->pluck('file');
        $res = Template::whereIn('id', $ids)->delete();
        if ($res) {
            foreach ($files_path as $item) {
                $this->deleteFolder($item);
            }
            return redirect('admin/template')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect('admin/template')->with('error', '删除失败 - ' . $res . '条记录');
        }
    }
}