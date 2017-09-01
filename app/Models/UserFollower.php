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

    public function follower()
    {
        return $this->belongsTo('App\Models\User', 'follower_id');
    }

    public function getFollower($user_id)
    {
//        $this->
    }

}


