<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;

class Manager extends Authenticatable
{
    const IS_SUPER = 1; // 超级管理员
    const IS_NOT_SUPER = 0; // 普通管理员

    protected $guarded = [
        'id', 'created_at', 'updated_at', 'deleted_at', 'password_confirmation',
    ];
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * 关系模型(一对多) - 公司
     */
    public function companies()
    {
        return $this->hasMany('App\Models\Company');
    }

    /**
     * 判断是否超级管理员
     *
     * @param null $index
     * @return array|mixed
     */
    public function isSuper($index = null)
    {
        $array = [
            self::IS_SUPER => '超级管理员',
//            self::IS_NOT_SUPER => '普通管理员',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : reset($array);
        }
        return $array;
    }
}