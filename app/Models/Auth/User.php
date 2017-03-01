<?php

namespace App\Models\Auth;

use Illuminate\Foundation\Auth\User as Authenticatable;

/**
 * 前台验证
 *
 * @package App\Models
 */
class User extends Authenticatable
{



    protected $fillable = [
        'name', 'email', 'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    // 设置权限
    public function role($ind = null)
    {
        $arr = [
//            self::ROLE_UN => '未知',
            self::ROLE_USER => '个人',
            self::ROLE_COMPANY => '公司',
        ];
        if ($ind !== null) {
            return array_key_exists($ind, $arr) ? $arr[$ind] : $arr[self::ROLE_USER];
        }
        return $arr;

    }
}
