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

    /*
     * 允许url带参数查询字段
     * 字段=>操作符
     */
    public $query = [
        'company_id' => '=',
    ];

    /**
     * 关系模型(一对一) - 用户
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    /**
     * 关系模型(多对一) - 公司
     */
    public function company()
    {
        return $this->belongsTo('App\Models\Company');
    }

    /**
     * 关系模型(多对一) - 部门
     */
    public function department()
    {
        return $this->belongsTo('App\Models\Department');
    }

    /**
     * 关系模型(一对多,多态) - 关注者
     */
    public function followers()
    {
        return $this->morphMany('App\Models\Cardcase', 'follower');
    }

    /**
     * 关系模型(多对多,多态) - 模板
     */
    public function templates()
    {
        return $this->morphToMany('App\Models\Template', 'useable');
    }
}