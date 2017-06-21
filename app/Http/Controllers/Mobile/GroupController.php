<?php

namespace App\Http\Controllers\Mobile;

use App\Http\Controllers\Common\HomeController;
use App\Models\Group;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class GroupController extends HomeController
{

    public function __construct()
    {
        // TODO
    }

    /**
     * 分组列表
     *
     * @return $this
     */
    public function index()
    {
        $groups = $this->getGroups(Auth::id());
        $groups = $this->sortArray($groups, 'order');
        return view('mzui.group.index')->with([
            'groups' => $groups,
        ]);
    }


    /**
     * 添加分组
     */
    public function store(Request $request)
    {

        $data = $request->input('Group');
        dd($data);
        exit;
        return $data;

        $user = Auth::user();
        return response()->json();
    }


}

