<?php

namespace App\Model;

use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * 后台登录验证
 *
 * @package App\Model
 */
class Admin extends Authenticatable
{

    protected $table = 'managers';

    protected $fillable = [
        'name', 'email', 'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

}
