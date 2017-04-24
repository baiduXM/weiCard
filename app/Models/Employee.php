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

    /* 允许url带参数查询字段 */
    public $query = [
        'company_id',
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

    /**
     * 关系模型 - 模板
     */
    public function templates()
    {
        return $this->morphToMany('App\Models\Template', 'useable');
    }
}