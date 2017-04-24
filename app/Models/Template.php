<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Template extends Model
{
    protected $guarded = [
        'id', 'created_at', 'updated_at',
    ];
    protected $hidden = [
    ];

    /**
     * 关系模型 - 用户
     */
    public function users()
    {
        return $this->morphedByMany('App\Models\User', 'useable');
    }

    /**
     * 关系模型 - 公司
     */
    public function companies()
    {
        return $this->morphedByMany('App\Models\Company', 'useable');
    }

    /**
     * 关系模型 - 员工
     */
    public function employees()
    {
        return $this->morphedByMany('App\Models\Employee', 'useable');
    }
}
