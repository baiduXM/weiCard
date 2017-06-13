<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Http\Requests\Request;
use App\Models\Employee;
use App\Models\Template;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;

class TemplateController extends Controller
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
        return view('home.template.index')->with([
            'templates' => $templates,
            'current' => $current,
            'type' => $type == 1 ? 'u' : 'c',
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
}

