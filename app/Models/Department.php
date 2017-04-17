<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    protected $guarded = [
        'id', 'created_at', 'updated_at', 'deleted_at',
    ];

    protected $hidden = [
    ];


    /**
     * 获取员工所属的部门
     */
    public function department()
    {
        return $this->belongsTo('App\Models\Department');
    }

    /**
     * 获取部门员工
     */
    public function employees()
    {
        return $this->hasMany('App\Models\Employee');
    }


}