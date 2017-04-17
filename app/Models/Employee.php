<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $guarded = [
        'id', 'created_at', 'updated_at', 'deleted_at',
    ];

    protected $hidden = [
    ];


    /**
     * 获取员工对应的用户
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    /**
     * 获取员工所属的公司
     */
    public function company()
    {
        return $this->belongsTo('App\Models\Company');
    }

    /**
     * 获取员工所属的部门
     */
    public function department()
    {
        return $this->belongsTo('App\Models\Department');
    }
}