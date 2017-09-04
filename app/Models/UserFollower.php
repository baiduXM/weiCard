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

    public function getFollower($user_id)
    {
//        $this->
    }

}


