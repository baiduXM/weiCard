<?php
namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Http\Requests\Request;
use App\Models\Employee;
use App\Models\Template;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class TemplateController extends Controller
{
    /**
     * 模板列表展示
     *
     * @return View
     */
    public function index()
    {
        $user = User::find(Auth::id());
        $user_id = $user->id;
        $employee = Employee::where('user_id', $user_id)->first();
        $company_id = $employee->company_id;
        /*目前模板选择只开放公司选择，默认useable_type=company,TODO*/
        $template_id=DB::table('template_useable')->where('useable_type','company' )->where('useable_id',$company_id)->pluck('template_id');
        if($template_id!=null){
            $template_name=Template::find($template_id)->pluck('name');
            $template_name=$template_name[0];
        }else{
            $template_name='W0001PCN01';
        }
        $templates = Template::paginate(4);
        return view('home.template.index')->with(
            [
                'templates' => $templates,
                'template_name' => $template_name,
            ]
        );
    }

    /*模板更换*/
    public function change($params)
    {
        $user = User::find(Auth::id());
        $user_id = $user->id;
        $employee = Employee::where('user_id', $user_id)->first();
        $company_id = $employee->company_id;
        /*目前模板选择只开放公司选择，默认useable_type=company,TODO*/
        $template_id=DB::table('template_useable')->where('useable_type','company' )->where('useable_id',$company_id)->pluck('template_id');
        if($template_id!=null){
            DB::table('template_useable')->where('useable_type','company' )->where('useable_id',$company_id)->update(['template_id'=>$params]);
        }else{
            DB::table('template_useable')->insert(['useable_type'=>'company','useable_id'=>$company_id,'template_id'=>$params]);
        }

        return redirect()->back();
    }
}

