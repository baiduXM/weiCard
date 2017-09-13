<?php

namespace App\Models;
use Illuminate\Auth\Authenticatable;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Foundation\Auth\Access\Authorizable;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;

class Manager extends CommonModel implements
    AuthenticatableContract,
    AuthorizableContract,
    CanResetPasswordContract
{
    use Authenticatable, Authorizable, CanResetPassword;
    /**
     * 是否超级管理员
     */
    const IS_SUPER = 1;

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
     *
     * @return array|mixed
     */
    public function isSuper($index = null)
    {
        $array = [
            self::IS_SUPER => '超级管理员',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : reset($array);
        }
        return $array;
    }
}