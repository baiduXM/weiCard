<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $guarded = [
        'id', 'created_at', 'updated_at', 'deleted_at',
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