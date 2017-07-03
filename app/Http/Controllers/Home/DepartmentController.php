<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Department;
use App\Models\Employee;
use App\Models\Position;
use Breadcrumbs;
use Illuminate\Support\Facades\Auth;

class DepartmentController extends HomeController
{

    public function __construct()
    {
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 我的同事
        Breadcrumbs::register('company.department', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('公司部门', route('company.department.index'));
        });
    }

    public function index()
    {
        $company = Auth::user()->company;
        $departments = Department::with('employees', 'owner')->where('company_id', $company->id)->paginate();
        $positions = Position::where('company_id', $company->id)->get();
        return view('web.department.index')->with([
            'departments' => $departments, // 部门列表
            'positions'   => $positions, // 职位列表
//            'employees'   => $employees, // 员工列表
        ]);
    }
}