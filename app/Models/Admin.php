<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * 后台登录验证
 *
 * @package App\Models
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
