<?php

namespace App\Models;



class Category extends CommonModel
{
    protected $guarded = [
        'id', 'created_at', 'updated_at', 'deleted_at'
    ];
    protected $hidden = [
    ];




    /**
     * 关系模型(多对一) - 公司
     */
    public function company()
    {
        return $this->belongsTo('App\Models\Company');
    }
}
