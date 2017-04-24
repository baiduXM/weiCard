<?php

namespace App\Http\Controllers\Home;

use App\Models\Common;
use App\Models\Employee;
use Illuminate\Support\Facades\Auth;
use Breadcrumbs;

class EmployeeController extends CompanyController
{
    public function __construct()
    {
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 我的同事
        Breadcrumbs::register('company.employee', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('我的同事', route('employee.index'));
        });
    }

    public function index()
    {
        $employees = Employee::where('company_id', '=', Auth::user()->employee->company->id)
            ->where('id', '!=', Auth::user()->employee->id)
            ->paginate(1);
        return view('home.employee.index')->with([
            'employees' => $employees,
//            'common' => new Common(),
        ]);
    }

    public function create()
    {
        return view('home.employee.create');
    }
}

