<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Breadcrumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;

class UserController extends Controller
{
    protected $path_type = 'user'; // 文件路径保存分类

    public function __construct()
    {
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        Breadcrumbs::register('user', function ($breadcrumbs) {
            $breadcrumbs->push('我的名片', route('user.index'));
        });

        Breadcrumbs::register('user.create', function ($breadcrumbs) {
            $breadcrumbs->parent('user');
            $breadcrumbs->push('我的公司', route('user.create'));
        });

        Breadcrumbs::register('user.show', function ($breadcrumbs) {
            $breadcrumbs->parent('user');
            $breadcrumbs->push('用户详情', route('user.show'));
        });

        Breadcrumbs::register('user.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('user');
            $breadcrumbs->push('修改用户', route('user.edit', $id));
        });
    }

    public function index()
    {
        $user = User::find(Auth::id());
        return view('home.user.index')->with([
            'user' => $user,
        ]);
    }

    public function create()
    {
        // TODO
    }

    public function store(Request $request)
    {
        // TODO
    }

    public function show()
    {
        $user = User::find(Auth::id());
        return view('home.user.show')->with([
            'user' => $user,
        ]);
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

    /**
     * 关联员工
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function binding(Request $request)
    {
        if ($request->isMethod('POST')) {
            $code = $request->input('code');
        }
        if ($request->isMethod('GET')) {
            $code = Input::query('code');
        }
        $user = new User();
        $res = $user->binding($code, Auth::id());
        if ($request->isMethod('POST')) {
            if ($res % 100 == 0) {
                return redirect()->back()->with('success', config('global.msg.' . $res));
            } else {
                return redirect()->back()->with('error', config('global.msg.' . $res));
            }
        }
        if ($request->isMethod('GET')) {
            if ($res % 100 == 0) {
                return redirect('user')->with('success', config('global.msg.' . $res));
            } else {
                return redirect('user')->with('error', config('global.msg.' . $res));
            }
        }

    }

}