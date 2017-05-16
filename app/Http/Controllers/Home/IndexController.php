<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\Employee;
use App\Models\Template;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\URL;

class IndexController extends Controller
{

    public function index()
    {
        return view('home.index');
    }

    /* 名片预览展示 */
    public function cardview()
    {
        $geturl = URL::current();
        $server_name = $_SERVER['SERVER_NAME'];
        $id = Input::get('id');
        $com = Input::get('com');
        $emp = Input::get('emp');
        $qrcodeurl = 'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=' . $geturl . '?com=' . $com . '%26%26emp=' . $emp;
        $useable_type = 'company';
        if ($emp != '') {
            $employee = Employee::find($emp);
            //dd(11);
            if ($com != '') {
                //dd(222);
                $company = Company::find($com);
                /*目前模板选择只开放公司选择，默认useable_type=company,TODO*/
                $template_id = DB::table('template_useable')->where('useable_type', 'company')->where('useable_id', $com)->pluck('template_id');
                if ($template_id != null) {
                    $template_name = Template::find($template_id)->pluck('name');
                    $template_name = $template_name[0];
                } else {
                    $template_name = 'W0001PCN01';
                }

            } else {
                $company_id = $employee->company_id;
                $company = Company::find($company_id);
                /*目前模板选择只开放公司选择，默认useable_type=company,TODO*/
                $template_id = DB::table('template_useable')->where('useable_type', 'company')->where('useable_id', $company_id)->pluck('template_id');
                if ($template_id != null) {
                    $template_name = Template::find($template_id)->pluck('name');
                    $template_name = $template_name[0];
                } else {
                    $template_name = 'W0001PCN01';
                }

            }
        } else {
            return redirect()->route('errorview')->with('com', '$com');
        }
        $employee = Employee::find($emp);
        return view($template_name . '.index')->with([
            'template_name' => $template_name,
            'employee' => $employee,
            'company' => $company,
            'qrcodeurl' => $qrcodeurl,
            'server_name' => $server_name,
        ]);
    }

    public function errorview()
    {
        return view('errors.errorview');
    }


}

