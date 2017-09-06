<?php

namespace App\Models;


class UserFollower extends CommonModel
{
    public $timestamps = false;

    protected $guarded = [
        'id',
    ];

    protected $hidden = [
    ];

    protected $table = 'user_followers';

    /**
     * 关系模型(一对一) - 所在分组
     */
    public function group()
    {
        return $this->belongsTo('App\Models\Group');
    }

    /* 我 */
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'follower_id');
    }

    /* 被关注的人 */
    public function followed()
    {
        return $this->belongsTo('App\Models\User', 'followed_id');
    }

    /* 被关注的人 员工信息 */
    public function employee()
    {
        return $this->belongsTo('App\Models\Employee', 'followed_id', 'user_id');
    }

//    /* 被关注的人 公司信息 */
//    public function company()
//    {
//        return $this->hasManyThrough('App\Models\Company', 'App\Models\Employee', 'user_id', 'employee_id', 'followed_id');
//    }


//    public function employee()
//    {
//        return $this->hasManyThrough('App\Models\Employee', 'App\Models\User', 'id', 'user_id', 'followed_id');
//    }

}


