<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Template;
use App\Models\Templategroup;
use Illuminate\Http\Request;
use Breadcrumbs;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Config;

class TemplategroupController extends HomeController
{

    public function __construct()
    {
        // 设置面包屑模板

        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 公司产品
        Breadcrumbs::register('company.templategroup', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('模板组', route('company.templategroup.index'));
        });
    }


    public function index()
    {
        if (Auth::user()->company) {
            $query = Template::query();
            $query->where('type', 2);
            $templates = $query->get();
            $templategroup = Templategroup::where('company_id', '=', Auth::user()->company->id)->paginate();
            return view('web.templategroup.index')->with([
                'templates' => $templates,
                'templategroup' => $templategroup,
            ]);
        } else {
            return redirect()->back()->with('error', '请先绑定公司');
        }

    }


    public function store(Request $request)
    {

        /* 验证 */

        $this->validate($request, [
            'Templategroup.name' => 'required',
            'Templategroup.template_id' => 'required',
        ], [], [
            'Templategroup.name' => '模板组名称',
            'Templategroup.template_id' => '模板',
        ]);
        /* 获取字段类型 */
        $data = $request->input('Templategroup');
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }
        $data['company_id'] = Auth::user()->company->id;
        $template_id = $data['template_id'];
        $template_displayname = Template::where('id', $template_id)->first();
        $data['template_displayname'] = $template_displayname->display_name;

        /* 添加 */
        if (TemplateGroup::create($data)) {

            $err_code = 300;

        } else {
            $err_code = 301;
        }
        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');

    }

    /*删除*/
    public function destroy(Request $request, $id){
        $templategroup = Templategroup::where('id',$id)->first();
        $res = $templategroup->delete();
        if ($res) {
            $err_code = 400;//删除成功
        } else {
            $err_code = 401;//删除失败
        }
        if ($err_code % 100 == 0) {
            return redirect('company/templategroup')->with('success', config('global.msg.' . $err_code));
        } else {
            return dedirect()->back()->with('error', config('global.msg.' . $err_code));
        }

    }

    public function show($id){
        $templategroup = Templategroup::where('id',$id)->first();
        return $templategroup;

    }

    public function update(Request $request,$id){

        $templategroup = Templategroup::find($id);
        $this->validate($request, [
            'Templategroup.name' => 'required',
            'Templategroup.template_id' => 'required',
        ], [], [
            'Templategroup.name' => '模板组名称',
            'Templategroup.template_id' => '模板',
        ]);
        $data = $request->input('Templategroup');
        $data['company_id'] = Auth::user()->company->id;
        $template_id = $data['template_id'];
        $template_displayname = Template::where('id', $template_id)->first();
        $data['template_displayname'] = $template_displayname->display_name;
        foreach ($data as $key => $value) {
            if ($value !== '') {
                $templategroup->$key = $data[$key];
            }
        }
        if ($templategroup->save()) {
            $err_code = 500;
        } else {
            $err_code = 501;
        }

        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');

    }


}
