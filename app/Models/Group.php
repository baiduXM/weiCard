<?php

namespace App\Models;


class Group extends CommonModel
{

    /**
     * 批量赋值create二选一
     * $fillable白名单|$guarded黑名单
     *
     * @var array
     */
    protected $guarded = [
        'id',
    ];

    /**
     * 表明模型是否应该被打上时间戳
     *
     * @var bool
     */
    public $timestamps = false;

    /**
     * 关系模型(一对一) - 用户所在分组
     */
    public function users()
    {
        return $this->hasManyThrough('App\Models\User', 'App\Models\UserFollower');
    }

    /**
     * 分组创建者
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
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

    /**
     * 关系模型(一对多) - 名片
     */
    public function followers()
    {
        return $this->hasMany('App\Models\UserFollower');
    }


}