<?php

namespace App\Http\Controllers\Admin;


use App\Http\Controllers\Controller;
use App\Models\Admin\Manager;
use Breadcrumbs;

class ManagerController extends Controller
{
    public function __construct()
    {
        // 首页 > 客服列表
        Breadcrumbs::register('admin.manager.index', function ($breadcrumbs) {
            $breadcrumbs->parent('admin');
            $breadcrumbs->push('客服列表', route('admin.manager.index'));
        });
    }

    // GET 客服列表
    public function index()
    {
        $managers = Manager::where('is_super', '!=', 1)->where('is_active', 1)->paginate(2);
        return view('admin.manager.index')->with([
            'managers' => $managers
        ]);
    }

    // GET
    public function create()
    {

    }

    // POST
    public function store()
    {

    }

    // GET
    public function show()
    {

    }

    // GET
    public function edit()
    {

    }

    // PUT\PATCH
    public function update()
    {

    }

    // DELETE
    public function destroy()
    {

    }

    // GET + POST
    public function setRole()
    {

    }

    // GET + POST
    public function setPermission()
    {

    }


}