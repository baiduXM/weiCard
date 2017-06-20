<?php

namespace App\Http\Controllers\Mobile;

use App\Models\Group;
use Illuminate\Support\Facades\Auth;

class GroupController extends CommonController
{

    public function __construct()
    {
        // TODO
    }

    public function index()
    {
        $groups = $this->getGroups(Auth::id());
        $groups = $this->sortArray($groups, 'order');
        return view('mzui.group.index')->with([
            'groups' => $groups,
        ]);
    }


}

