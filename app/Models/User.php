<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class User extends Model
{

    const IS_ADMIN = 1; // 管理员
    const IS_ACTIVE = 1; // 激活
    const IS_ACTIVE_NOT = 0; // 不激活

//    public $timestamps = true;

    protected $fillable = [
        'name', 'email', 'password', 'mobile', 'nickname', 'avatar', 'description', 'is_admin', 'is_active', 'company_id', 'employee_id', 'sex', 'age',
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    // 判断是否可用
    public function isActive($index = null)
    {
        $array = [
            self::IS_ACTIVE => '激活',
            self::IS_ACTIVE_NOT => '停用',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : $array[self::IS_ACTIVE];
        }
        return $array;
    }

    public function getName($id)
    {
        if ($id != 0) {
            return User::findOrFail($id)->name;
        } else {
            return '无';
        }
    }
}
