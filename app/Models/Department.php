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

    /* 允许url带参数查询字段 */
    public $query = array(
        'company_id' => '=',
    );

    /**
     * 关系模型 - 公司
     */
    public function company()
    {
        return $this->belongsTo('App\Models\Company');
    }

    /**
     * 关系模型 - 员工
     */
    public function employees()
    {
        return $this->hasMany('App\Models\Employee');
    }


}