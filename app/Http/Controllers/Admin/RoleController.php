<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Admin\Role;

class RoleController extends Controller
{
    //GET /photo index photo.index                  索引
    //GET /photo/create create photo.create         创建
    //POST /photo store photo.store                 保存
    //GET /photo/{photo} show photo.show            显示
    //GET /photo/{photo}/edit edit photo.edit       编辑
    //PUT/PATCH /photo/{photo} update photo.update  更新
    //DELETE /photo/{photo} destroy photo.destroy   删除


    public function index()
    {
        $roles = Role::paginate();
        return view('admin.role.index')->with('roles', $roles);
    }

    // GET
    public function create()
    {
        $roles = new Role();
        return view('admin.role.create')->with('roles', $roles);
    }

    // POST
    public function store(Request $request)
    {
        if ($request->isMethod('POST')) {
            $this->validate($request, [
                'Roles.name' => 'required|unique:roles|alpha_num',
                'Roles.display_name' => 'required|min:2|max:30',
                'Roles.description' => 'max:255',
            ], [
                'alpha_num' => ':attribute必须是字母或数字',
                'required' => ':attribute不能为空',
                'min' => ':attribute长度太短',
                'max' => ':attribute长度太长',
            ], [
                'Roles.name' => '角色名',
                'Roles.display_name' => '可读的角色名',
                'Roles.description' => '角色描述',
            ]);
            $data = $request->input('Roles');
            if (Role::create($data)) {
                return redirect('admin/role')->with('success', '添加成功');
            } else {
                return redirect()->back();
            }
        }
    }

    // GET
    public function show($id)
    {
        $role = Role::find($id);
        return view('admin.role.show')->with('role', $role);
    }

    // GET
    public function edit($id)
    {
        $role = Role::find($id);
        return view('admin.role.edit')->with('role', $role);
    }

    // PUT/PATCH
    public function update(Request $request, $id)
    {
        if ($request->isMethod('PUT')) {
            $role = Role::find($id);
            $this->validate($request, [
                'Roles.name' => 'required|alpha_num|unique:roles,name,' . $id,
                'Roles.display_name' => 'required|min:2|max:30',
                'Roles.description' => 'max:255',
            ], [
                'alpha_num' => ':attribute必须是字母或数字',
                'required' => ':attribute不能为空',
                'min' => ':attribute长度太短',
                'max' => ':attribute长度太长',
            ], [
                'Roles.name' => '角色名',
                'Roles.display_name' => '可读的角色名',
                'Roles.description' => '角色描述',
            ]);
            $data = $request->input('Roles');
            $role->name=$data['name'];
            $role->display_name=$data['display_name'];
            $role->description=$data['description'];
            $role->type=$data['type'];
            if ($role->save()) {
                return redirect('admin/role')->with('success', '修改成功');
            } else {
                return redirect()->back();
            }
        }
    }

    // DELETE
    public function destroy($id)
    {
        $role = Role::find($id);
        if ($role->delete()) {
            return redirect('admin/role')->with('success', '删除成功 - ' . $role->id);
        } else {
            return redirect('admin/role')->with('error', '删除失败 - ' . $role->id);
        }
    }


}