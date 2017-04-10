<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\User;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Common\UploadController;

class CompanyController extends Controller
{

    protected $company_id = null; // 公司id
    protected $path_type = 'company'; // 文件路径保存分类

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
     *      判断用户是否注册或绑定公司
     *      Y是:显示公司资料
     *          检查公司认证状态
     *          查看是否是公司注册人
     *      N否:提示注册或绑定
     * @return view
     */
    public function index()
    {
        $this->company_id = Auth::user()->company_id;
        if ($this->company_id) {
            $company = Company::find($this->company_id);
        } else {
            $company = null;
        }
        return view('home.company.index')->with([
            'company' => $company,
            'user' => Auth::user()
        ]);
    }

    /*
     *
     */

    /**
     * 注册公司
     *      判断用户是否没有绑定公司
     *      Y没有:显示注册界面
     *      N绑定过:返回公司首页
     * @return view
     */
    public function create()
    {
//        if (!Auth::user()->company_id) {
            return view('home.company.create');
//        } else {
//            return redirect()->back();
//        }
    }

    /*
     * 注册公司->保存
     */
    public function store(Request $request)
    {

        /* 验证 */
        $this->validate($request, [
            'Company.name' => 'required|unique:companies,companies.name',
            'Company.code' => 'required|alpha_num|unique:companies,companies.code',
            'Company.logo' => 'image|max:' . 2 * 1024, // 最大2MB
            'Company.address' => 'max:255',
            'Company.email' => 'email|unique:companies,companies.email',
            'Company.telephone' => 'unique:companies,companies.telephone',
            'Company.description' => 'max:255',
        ], [], [
            'Company.name' => '公司名称',
            'Company.code' => '公司代码',
            'Company.logo' => '公司logo',
            'Company.address' => '公司地址',
            'Company.email' => '公司邮箱',
            'Company.telephone' => '公司电话',
            'Company.description' => '说明',
        ]);
        /* 获取字段类型 */
        $data = $request->input('Company');

        foreach ($data as $key => $value) {
            if ($value == '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }
        $data['user_id'] = Auth::id();
        $data['status'] = 0;

        /* 获取文件类型 */
        if ($request->hasFile('Company.logo')) {
            $uploadController = new UploadController();
            $data['logo'] = $uploadController->saveImg($request->file('Company.logo'), $this->path_type, $data['code']);
        }

        /* 添加 */
        if ($company = Company::create($data)) {
            $user = User::find(Auth::id());
            $user->company_id = $company->id;
            $user->save();
            return redirect('company')->with('success', '添加成功');
        } else {
            return redirect()->back();
        }
    }

    /*
     * 公司详情
     */
    public function show($id)
    {
        // TODO
    }

    /*
     * 编辑公司
     */
    public function edit($id)
    {
        // TODO
        $user = Company::find($id);
        return view('home.user.edit')->with('user', $user);
    }

    /*
     * 编辑公司->更新
     */
    public function update(Request $request, $id)
    {
        // TODO
    }

    /*
     * 删除公司
     */
    public function destroy($id)
    {
        // TODO
    }

    /*
     * 绑定公司
     */
    public function binding()
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
    protected function hasCompany($id)
    {
        return $this->company = Company::where('user_id', $id)->first();
    }

}

