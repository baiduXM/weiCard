<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Group extends Model
{

    /**
     * 批量赋值create二选一
     * $fillable白名单|$guarded黑名单
     *
     * @var array
     */
    protected $guarded = [
        'id'
    ];

    /**
     * 表明模型是否应该被打上时间戳
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * 关系模型(多对一) - 用户
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    /**
     * 关系模型(一对多) - 名片
     */
    public function cardcases()
    {
        return $this->hasMany('App\Models\Cardcase');
    }


}