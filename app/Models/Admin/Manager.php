<?php
namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Manager extends Model
{

    const IS_SUPER = 1; // 超级管理员
    const IS_ACTIVE = 1; // 活动
    const IS_ACTIVE_NOT = 0; // 停用

    protected $fillable = [
        'name', 'email', 'password', 'mobile', 'nickname', 'avatar', 'is_super', 'is_active'
    ];
    protected $hidden = [
        'password', 'remember_token',
    ];


    // 判断是否可用
    public function isActive($index = null)
    {
        $array = [
            self::IS_ACTIVE => '活动',
            self::IS_ACTIVE_NOT => '停用',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : $array[self::IS_ACTIVE];
        }
        return $array;
    }


}