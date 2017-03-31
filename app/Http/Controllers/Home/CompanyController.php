<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Home\Company;
use App\Models\Home\User;
use Breadcrumbs;
use Illuminate\Support\Facades\Auth;

class CompanyController extends Controller
{

    protected $company_id; // 公司id

    public function __construct()
    {
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司
        Breadcrumbs::register('company', function ($breadcrumbs) {
            $breadcrumbs->push('我的公司', route('company.index'));
        });

        // 我的公司 > 公司注册
        Breadcrumbs::register('company.create', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('公司注册', route('company.create'));
        });

//        // 我的公司 > 公司部门
//        Breadcrumbs::register('company.department', function ($breadcrumbs) {
//            $breadcrumbs->parent('company');
//            $breadcrumbs->push('公司部门', route('company.department'));
//        });
    }

    /**
     * 公司首页
     * @return $this
     */
    public function index()
    {

        if ($this->isCompany(Auth::id())) {
            $company = Company::findOrFail($this->company_id);
        } else {
            $company = null;
        }
        return view('home.company.index')->with([
            'company' => $company,
            'user' => Auth::user()
        ]);
    }

    public function create()
    {
        return view('home.company.create');
    }

    public function store(Request $request)
    {
        // TODO
    }

    public function show($id)
    {
        // TODO
    }

    public function edit($id)
    {
        // TODO
        $user = User::find($id);
        return view('home.user.edit')->with('user', $user);
    }

    public function update(Request $request, $id)
    {
        // TODO
    }

    public function destroy($id)
    {
        // TODO
    }


    public function register()
    {
        return view('home.company.register');
    }

    public function postRegister()
    {

    }

    public function group()
    {
        return view('home.company.group');
    }


    public function department()
    {
        return view('home.company.department');
    }

    public function employee()
    {
        return view('home.company.employee');
    }

    public function workmate()
    {
        return view('home.company.workmate');
    }


    /**
     * 判断用户是否关联公司
     *
     * @param $id       用户id
     * @return mixed
     *      没关联：返回0
     *      有关联：返回公司id
     */
    public function isCompany($id)
    {
        return $this->company_id = User::findOrFail($id, ['company_id'])->company_id;
    }

}

