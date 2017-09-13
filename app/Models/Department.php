<?php

namespace App\Models;


class Department extends CommonModel
{

//    public $timestamps = false;

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
     * 关系模型(一对一) - 交接人
     */
    public function owner()
    {
        return $this->belongsTo('App\Models\Employee', 'employee_id');
    }


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