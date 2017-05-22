<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Group extends Model
{

    /**
     * 关系模型(一对一) - 名片群群主
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    /**
     * 关系模型(多对多) - 名片群中的用户
     */
    public function users()
    {
        return $this->belongsToMany('App\Models\User', 'group_user');
    }
}