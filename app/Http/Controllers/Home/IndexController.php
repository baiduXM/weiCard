<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Http\Requests\Request;
use App\Models\Company;
use App\Models\Employee;
use App\Models\User;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Redirect;
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
        $geturl=URL::current();
        $id=Input::get('id');
        $com=Input::get('com');
        $emp=Input::get('emp');
        $url=$geturl.'?com='.$com.'%26%26emp='.$emp;
        if($emp!='')
        {
            $employee=Employee::find($emp);
            if($com!=''){
                $company=Company::find($com);
            }
            else{
                $company_id=$employee->company_id;
                $company=Company::find($company_id);
            }
        }
        else{
            return redirect()->route('index')->with('com', '$com');
        }
        $employee=Employee::find($emp);
        $template_name = 'W0001PCN01';
        return view($template_name . '.index' )->with([
            'template_name' => $template_name,
            'employee' => $employee,
            'company' => $company,
            'url'=>$url
        ]);
    }


}

