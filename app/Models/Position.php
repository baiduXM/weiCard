<?php

namespace App\Models;


class Position extends CommonModel
{
    public $timestamps = false;
    const IS_ONLY = 1; // 是否唯一

    protected $guarded = [
        'id',
    ];

    protected $hidden = [
    ];

    /* 允许url带参数查询字段 */
    public $query = array(
        'company_id' => '=',
    );

    /**
     * 关系模型(多对一) - 公司
     */
    public function company()
    {
        return $this->belongsTo('App\Models\Company');
    }

    /**
     * 关系模型(一对多) - 员工
     */
    public function employees()
    {
        return $this->hasMany('App\Models\Employee');
    }


}