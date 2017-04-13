<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class User extends Model
{

//    const IS_ADMIN = 1; // 管理员

    protected $guarded = [
        'id', 'password_confirmation'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];



}
