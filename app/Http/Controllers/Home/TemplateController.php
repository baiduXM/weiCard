<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Category;
use App\Models\Employee;
use App\Models\Template;
use App\Models\TemplateGroup;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class TemplateController extends HomeController
{
    /**
     * 模板列表展示
     *
     * @param $type
     *
     * @return $this
     */
    public function index($type = 1)
    {
        $query = Template::query();
        $query->whereIn('type', [0, $type]);
        if ($type == 1) { // 个人模板
            $current = Auth::user()->templates;
        } elseif ($type == 2) {
            $current = Auth::user()->company->templates;
        }
        if (!count($current)) {
            $current = $query->first();
        } else {
            $current = $current[0];
        }
        $templates = $query->paginate(4); // type:0-全部，1-个人，2-公司
        return view('web.template.index')->with([
            'templates' => $templates,
            'current' => $current,
            'type' => $type == 1 ? 'u' : 'c',
        ]);
    }

    /**
 * 手机端个人模板列表展示
 *
 * @param $type
 *
 * @return $this
 */
    public function mindex()
    {
        $query = Template::query();
        $query->where('type', 1);
        $templates = $query->orderBy('sort', 'asc')->get();
        $user = Auth::user();
        $t = $user ->templates;
        if(count($t) > 0){
            $this_template= $t[0];
        }
        else{
            $this_template = $query->first();
        }
        return view('mobile.templates.index')->with([
            'templates' => $templates,
            'this_template' => $this_template,
            'user' => $user,
        ]);
    }

    /**
     * 手机端企业模板列表展示
     *
     * @param $type
     *
     * @return $this
     */
    public function comtemplate()
    {
        if (!Auth::user()->employee) {
            //dd(11);
            return redirect()->to('company/employee');
        }
        $query = Template::query();
        $query->where('type', 2);
        $user = Auth::user();
        $id = $user->employee->id;
        $person = Employee::find($id);
        $categorys = Category::where('company_id', '=', $person->company['id'])->get();
        $category_n = count($categorys);
        if ($category_n != null) {
            $template_list = $query->where('category_number', '<=', $category_n)->orderBy('sort', 'asc')->get();
        } else {

            $template_list = $query->orderBy('sort', 'asc')->get();
           }


        /* 查询当前所选模板 */

        $templategroup_id = $person->templategroup_id;
        if($templategroup_id){
            $templategroup = TemplateGroup::where('id', $templategroup_id)->first();
        }
        $templates = $person->templates;
        if(count($templates)>0){
            $this_template= $templates[0];
        }else{
            if($templategroup_id){
                    $template_id = $templategroup->template_id;
                    $templates = Template::where('id', $template_id)->first();
                    $this_template= $templates;
            }else{
                     $templates = Employee::find($person->id)->company->templates;
                     if(count($templates) <= 0){
                         $this_template = Template::whereIn('type', [0, 2])->first();
                     }else{
                         $this_template = $templates[0];
                     }
            }
        }
        return view('mobile.templates.comtemplate')->with([
            'templates' => $template_list,
            'this_template' => $this_template,
            'user' => $user,
        ]);
    }



    /**
     * 模板更换
     *
     * @param $params
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function change($params)
    {
        /* 获取参数 */
        $param = explode('-', $params);
        switch ($param[0]) {
            case 'e':
                $data['type'] = 'App\Models\Employee';
                $model = Auth::user()->employee;
                break;
            case 'u':
                $data['type'] = 'App\Models\User';
                $model = Auth::user();
                break;
            case 'c':
                $data['type'] = 'App\Models\Company';
                $model = Auth::user()->company;
                break;
            default:
                break;
        }
        $data['template_id'] = $param[1];

        // 查看[用户/公司/员工]是否选中模板
        $current = $model->templates;
        if (count($current) > 0) { // 已选择模板
            $model->templates()->detach($current[0]->id);
            $model->templates()->attach($data['template_id']);
        } else { // 未选择模板
            $model->templates()->attach($data['template_id']);
        }

        return redirect()->back();
    }

    /**
     * 手机端模板更换
     *
     * @param $params
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function uchange($params)
    {

        $data['type'] = 'App\Models\User';
        $model = Auth::user();
        $data['template_id'] = $params;

        $current = $model->templates;
        if (count($current) > 0) { // 已选择模板
            $model->templates()->detach($current[0]->id);
            $model->templates()->attach($data['template_id']);
        } else { // 未选择模板
            $model->templates()->attach($data['template_id']);
        }

        return redirect()->route('cardcase.show')->with('type','u');
    }

    public function echange($params){
        $data['type'] = 'App\Models\Employee';
        $data['template_id'] = $params;
        $employee = Auth::user()->employee;
        $type = 'e';
        if($employee){
            $id = $employee->id;
            $person = Employee::find($id);
            $t = $person->templates;
        }

        if (count($t) > 0) { // 已选择模板
            $person->templates()->detach($t[0]->id);
            $person->templates()->attach($data['template_id']);
        } else { // 未选择模板
            $person->templates()->attach($data['template_id']);
        }
        return redirect('cardcase/show/'.$type);
    }
    
    
}

