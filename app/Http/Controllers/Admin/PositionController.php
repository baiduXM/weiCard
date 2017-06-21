<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Common\AdminController;
use App\Models\Company;
use App\Models\Position;
use Illuminate\Http\Request;
use Breadcrumbs;
use App\Models\CommonModel;
use Illuminate\Support\Facades\Input;


class PositionController extends AdminController
{

    public function __construct()
    {

        // 首页 > 职位列表
        Breadcrumbs::register('admin.position', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.company');
            $breadcrumbs->push('职位列表', route('admin.company_position.index'));
        });

        // 首页 > 职位列表 > 添加
        Breadcrumbs::register('admin.position.create', function ($breadcrumbs) {
            $breadcrumbs->parent('admin.position');
            $breadcrumbs->push('添加', route('admin.company_position.create'));
        });

        // 首页 > 职位列表 > 编辑
        Breadcrumbs::register('admin.position.edit', function ($breadcrumbs, $id) {
            $breadcrumbs->parent('admin.position');
            $breadcrumbs->push('编辑', route('admin.company_position.edit', $id));
        });


    }

    public function index()
    {
        $model = new Position();
        $query = Position::query();
        $params = Input::query();
        if ($params) {
            foreach ($params as $key => $value) {
                if (array_key_exists($key, $model->query)) {
                    $query->where($key, $model->query[$key], $value);
                }
            }
        }
        $positions = $query->with('company')->orderBy('level','ASC')->paginate();
        return view('admin.position.index')->with([
            'positions' => $positions,
            'common' => new CommonModel(),
            'params' => $params,
        ]);
    }

    public function create()
    {
        $companies = Company::where('status', '=', '1')->get();
        if (count($companies) > 0) {
            return view('admin.position.create')->with([
                'companies' => $companies,
                'common' => new CommonModel(),
            ]);
        } else {
            return redirect('admin/company')->with('error', '没有审核通过的公司可选择');
        }

    }

    public function store(Request $request)
    {
        $data = $request->input('Position');
        /* 验证 */
        $this->validate($request, [
            'Position.name' => 'required',
            'Position.level' => 'required|regex:/^[0-9]*$/',
        ], [], [
            'Position.name' => '职位名称',
            'Position.level' => '职位级别',
        ]);

        /* 获取字段类型 */
        foreach ($data as $key => $value) {
            if ($value === '') {
                $data[$key] = null; // 未填字段设置为null，否则会保存''
            }
        }

        /* 添加 */
        if (Position::create($data)) {
            return redirect('admin/company_position')->with('success', '添加成功');
        } else {
            return redirect()->back();
        }
    }

    public function show($id)
    {
        $position = Position::find($id);
        return view('admin.position.show')->with([
            'position' => $position,
            'common' => new CommonModel(),
        ]);
    }

    public function edit($id)
    {
        $position = Position::find($id);
        return view('admin.position.edit')->with([
            'position' => $position,
            'common' => new CommonModel(),
        ]);
    }

    public function update(Request $request, $id)
    {
        $position = Position::find($id);
        $this->validate($request, [
            'Position.name' => 'required',
            'Position.level' => 'required|regex:/^[0-9]*$/',
        ], [], [
            'Position.name' => '职位名称',
            'Position.level' => '职位级别',
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
            return redirect('admin/company_position')->with('success', '修改成功 - ' . $position->id);
        } else {
            return redirect()->back();
        }
    }

    public function destroy($id)
    {
        $position = Position::where('id',$id)->first();
        if ($position->delete()) {
            return redirect('admin/company_position')->with('success', '删除成功 - ' . $position->id);
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $position->id);
        }
    }

        /**
     * 批量删除
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function batchDestroy(Request $request)
    {
        $ids = explode(',', $request->input('ids'));
        $res = Position::whereIn('id', $ids)->delete();
        if ($res) {
            return redirect('admin/company_position')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $res . '条记录');
        }
    }
}