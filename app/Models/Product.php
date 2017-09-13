<?php

namespace App\Models;


class Product extends CommonModel
{
    protected $guarded = [
        'id', 'created_at', 'updated_at', 'deleted_at', 'avatar'
    ];

    protected $hidden = [
    ];

    /*
     * 允许url带参数查询字段
     * 字段=>操作符
     */
    public $query = [
        'company_id' => '=',
    ];


    /**
     * 关系模型(多对一) - 公司
     */
    public function company()
    {
        return $this->belongsTo('App\Models\Company');
    }


}