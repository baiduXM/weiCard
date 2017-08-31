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


}


