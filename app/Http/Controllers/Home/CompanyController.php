<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Home\Company;
use App\Models\Home\User;
use Breadcrumbs;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Common\UploadController;

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

    /*
     * 注册公司
     */
    public function create()
    {
        return view('home.company.create');
    }

    /*
     * 注册公司->保存
     */
    public function store(Request $request)
    {
        /* 验证 */
        $this->validate($request, [
            'Company.name' => 'required|alpha_dash|unique:users,users.name',
            'Company.password' => 'required|confirmed',
            'Company.email' => 'email|unique:users,users.email',
            'Company.nickname' => 'alpha_dash',
            'Company.avatar' => 'image|max:' . 2 * 1024, // 最大2MB
            'Company.mobile' => 'digits:11|unique:users,users.mobile',
            'Company.description' => 'max:255',
        ], [], [
            'Company.name' => '账号',
            'Company.password' => '密码',
            'Company.email' => '邮箱',
            'Company.nickname' => '昵称',
            'Company.avatar' => '头像',
            'Company.mobile' => '手机',
            'Company.description' => '说明',
        ]);

        /* 获取字段类型 */
        $data = $request->input('Company');
        foreach ($data as $key => $value) {
            if ($value == '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
            if ($key == 'password') {
                $data[$key] = bcrypt($value);// 对密码加密
            }
        }

        /* 获取文件类型 */
        if ($request->hasFile('Company.avatar')) {
            $data['avatar'] = UploadController::saveImg($request->file('Company.avatar'));
        }

        /* 添加 */
        if (Company::create($data)) {
            return redirect('admin/user')->with('success', '添加成功');
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
    protected function isCompany($id)
    {
        return $this->company_id = User::findOrFail($id, ['company_id'])->company_id;
    }

}

