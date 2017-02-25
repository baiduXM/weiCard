<?php
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Model\Admin\Role;

class RoleController extends Controller
{
    //GET /photo index photo.index                  索引
    //GET /photo/create create photo.create         创建
    //POST /photo store photo.store                 保存
    //GET /photo/{photo} show photo.show            显示
    //GET /photo/{photo}/edit edit photo.edit       编辑
    //PUT/PATCH /photo/{photo} update photo.update  更新
    //DELETE /photo/{photo} destroy photo.destroy   删除


    /**
     * 列表GET
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        $roles = Role::paginate();
        return view('admin.roles.index')->with('roles', $roles);
    }

    // GET
    public function create()
    {
        $roles = new Role();
        return view('admin.roles.create')->with('roles', $roles);
    }

    // POST
    public function store()
    {

    }

    // GET
    public function show($id)
    {
        return view('admin.role.index');
    }

    // GET
    public function edit($id)
    {
        return view('admin.role.index');
    }

    // PUT/PATCH
    public function update($id)
    {
        echo 1;
    }

    // DELETE
    public function destroy($id)
    {
        echo 1;
    }


}