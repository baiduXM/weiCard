<?php

namespace App\Models;


class TemplateGroup extends CommonModel
{
    public $timestamps = false;

    protected $guarded = [
        'id',
    ];

    protected $hidden = [
    ];

    protected $table = 'template_group';

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
