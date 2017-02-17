<?php

namespace App\Model\Admin;

//use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{

    protected $table = 'administrators';
//    const ROLE_UN = 0; // 未知
    const ROLE_USER = 1; // 个人
    const ROLE_COMPANY = 2; // 公司

    protected $fillable = [
        'name', 'email', 'password',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    // 设置角色
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
