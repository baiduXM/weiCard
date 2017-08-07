<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Common\AdminController;
use App\Models\Tag;
use Illuminate\Support\Facades\Input;
use Breadcrumbs;

class TagController extends AdminController
{
    public function __construct()
    {

        Breadcrumbs::register('mpmanager.group', function ($breadcrumbs) {
            $breadcrumbs->parent('admin');
            $breadcrumbs->push('群列表', route('mpmanager.user_group.index'));
        });

    }


    /**
     * 个人标签列表页
     *
     * @return $this
     */
    public function index()
    {
        $model = new Tag();
        $query = Tag::query();
        $params = Input::query();
        if ($params) {
            foreach ($params as $key => $value) {
                if (array_key_exists($key, $model->query)) {
                    $query->where($key, $model->query[$key], $value);
                }
            }
        }
        $tag = $query->paginate();
        return view('admin.tag.index')->with([
            'tag' => $tag,
            'params' => $params,
        ]);
    }

    /**
     * 添加标签页面
     *
     * @return $this
     */
    public function create()
    {
        return view('admin.tag.create')->with([
        ]);
    }

    /**
     * 添加数据
     *
     * @param Request $request 请求数据
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        /* 验证 */
        $this->validate($request, [
            'Tag.user_id' => 'bail|required|integer',
            'Tag.name' => 'required|max:30|unique:tags,tags.name,null,id,user_id,' . $request->input('Tag.user_id'),
        ], [], [
            'Tag.user_id' => '用户',
            'Tag.name' => '组名',
        ]);

        /* 获取字段 */
        $data = $request->input('Tag');

        /* 添加 */
        if (Tag::create($data)) {
            return redirect('admin/user_tag')->with('success', '添加成功');
        } else {
            return redirect()->back()->with('error', '添加失败');
        }
    }

    /**
     * 标签详情
     *
     * @param $id
     *
     * @return $this
     */
    public function show($id)
    {
        $tag = Tag::find($id);
        return view('admin.tag.show')->with([
            'tag' => $tag,
        ]);
    }

    /**
     * 编辑标签页
     *
     * @param $id
     *
     * @return $this
     */
    public function edit($id)
    {
        $tag = Tag::find($id);
        return view('admin.tag.edit')->with([
            'tag' => $tag,
        ]);
    }


    /**
     * 更新数据
     *
     * @param Request $request
     * @param integer $id
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {
        /* 验证 */
        $this->validate($request, [
            'Tag.user_id' => 'bail|required|integer',
            'Tag.name' => 'required|max:30|unique:tags,tags.name,' . $id . ',id,user_id,' . $request->input('Tag.user_id'),
        ], [], [
            'Tag.user_id' => '用户',
            'Tag.name' => '组名',
        ]);

        $data = $request->input('Tag');

        $tag = Tag::find($id);
        foreach ($data as $key => $value) {
            if ($value !== '') {
                $tag->$key = $data[$key];
            }
        }

        if ($tag->save()) {
            return redirect('admin/user_tag')->with('success', '修改成功 - ' . $tag->id);
        } else {
            return redirect()->back()->with('error', '修改失败 - ' . $tag->id);
        }

    }

    /**
     * 删除
     *
     * @param $id
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        $tag = Tag::find($id);
        if ($tag->delete()) {
            return redirect('admin/user_tag')->with('success', '删除成功 - ' . $tag->id);
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $tag->id);
        }
    }

    /**
     * 批量删除
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function batchDestroy(Request $request)
    {

        $ids = explode(',', $request->input('ids'));
        $res = Tag::whereIn('id', $ids)->delete();
        if ($res) {
            return redirect('admin/user_tag')->with('success', '删除成功 - ' . $res . '条记录');
        } else {
            return redirect()->back()->with('error', '删除失败 - ' . $res . '条记录');
        }
    }

    /**
     * 标签组中添加名片数据
     * 标签不可重复
     *
     * @param Request $request
     * @param integer $id
     */
    public function change(Request $request, $id)
    {
        $user_id = Input::query('user_id');
        $ids = explode(',', $request->input('ids')); // 名片ids

        $tag = Tag::find($id);
        $tag->cardcases()->sysc(['user_id' => $user_id], $ids); // 目前标签只有名片
    }
}