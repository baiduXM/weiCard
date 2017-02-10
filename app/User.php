<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
//    protected $table = 'users';

    const PRIVILEGE_CUSTOMER = 0; // 用户权限
    const PRIVILEGE_SERVICE = 1; // 客服权限
    const PRIVILEGE_ADMIN = 2; // 管理员权限


    public $timestamps = true;

    protected $fillable = [
        'name', 'email', 'password', 'privilege',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    // 设置权限
    public function privilege($ind = null)
    {
        $arr = [
            self::PRIVILEGE_CUSTOMER => '用户',
            self::PRIVILEGE_SERVICE => '客服',
            self::PRIVILEGE_ADMIN => '管理员',
        ];
        if ($ind !== null) {
            return array_key_exists($ind, $arr) ? $arr[$ind] : $arr[self::PRIVILEGE_CUSTOMER];
        }
        return $arr;

    }


}
