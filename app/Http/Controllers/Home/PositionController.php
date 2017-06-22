<?php

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Common\HomeController;
use App\Models\Position;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Breadcrumbs;
use Illuminate\Support\Facades\Config;

class PositionController extends HomeController
{

    public function __construct()
    {
        // 设置面包屑模板
        Breadcrumbs::setView('vendor/breadcrumbs');

        // 我的公司 > 公司产品
        Breadcrumbs::register('company.position', function ($breadcrumbs) {
            $breadcrumbs->parent('company');
            $breadcrumbs->push('公司职位', route('company.position.index'));
        });
    }

    /**
     * 显示职位
     *
     * @return $this
     */
    public function index()
    {
        if (Auth::user()->company) {
            $positions = Position::where('company_id', '=', Auth::user()->company->id)->orderBy('level','ASC')->paginate();
            return view('home.position.index')->with([
                'positions' => $positions,
            ]);
        } else {
            return redirect()->back()->with('error', '请先绑定公司');
        }
    }

    /**
     * 添加职位
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        /* 验证 */
        $this->validate($request, [
            'Position.name' => 'required',
            'Position.level' => 'required|regex:/^[0-9]*$/',
            'Position.is_only' => 'boolean',
        ], [], [
            'Position.name' => '职位名称',
            'Position.level' => '职位级别',
            'Position.is_only' => '是否唯一',
        ]);
        /* 获取字段类型 */
        $data = $request->input('Position');
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }

        $data['company_id'] = Auth::user()->company->id;

        /* 添加 */
        if (Position::create($data)) {
            $err_code = 300;
        } else {
            $err_code = 301;
        }

        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');
    }

        /**
     * 查看
     *
     * @param $id
     * @return \Illuminate\Database\Eloquent\Collection|\Illuminate\Database\Eloquent\Model|null|static|static[]
     */
    public function show($id)
    {
        $position = Position::where('id', $id)->first();
        return $position;
    }

    public function update(Request $request, $id)
    {

        $position = Position::find($id);
        /* 验证 */
        $this->validate($request, [
            'Position.name' => 'required',
            'Position.level' => 'required|regex:/^[0-9]*$/',
            'Position.is_only' => 'boolean',
        ], [], [
            'Position.name' => '职位名称',
            'Position.level' => '职位级别',
            'Position.is_only' => '是否唯一',
        ]);
        $data = $request->input('Position');

        foreach ($data as $key => $value) {
            if ($value !== '') {
                $position->$key = $data[$key];
            }
        }
        if (!array_key_exists('is_only', $data)) {
            $position->is_only = 0;
        }
        if ($position->save()) {
            $err_code = 500;
        } else {
            $err_code = 501;
        }

        Config::set('global.ajax.err', $err_code);
        Config::set('global.ajax.msg', config('global.msg.' . $err_code));
        return Config::get('global.ajax');
    }

    /*
     */
    /**
     * 删除
     *
     * @param Request $request
     * @param $id
     * @return \Illuminate\Http\RedirectResponse|int
     */
    public function destroy(Request $request, $id)
    {
        $position = Position::where('id', $id)->first();

        $res = $position->delete();
        if ($res) {
            $err_code = 400; // 删除成功
        } else {
            $err_code = 401; // 删除失败
        }

        if ($err_code % 100 == 0) {
            return redirect('company/position')->with('success', config('global.msg.' . $err_code));
        } else {
            return redirect()->back()->with('error', config('global.msg.' . $err_code));
        }
    }

}

