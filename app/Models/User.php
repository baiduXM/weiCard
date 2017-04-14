<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Company;

class User extends Model
{

//    const IS_ADMIN = 1; // 管理员

    protected $guarded = [
        'id', 'password_confirmation'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];


    /**
     * 获取关联到用户的公司，即公司创始人
     */
    public function company()
    {
        return $this->hasOne('Company');
//        return $this->hasOne('App\Models\Company');
    }

    /**
     * 获取关联到用户的员工，即用户绑定员工
     */
    public function employee()
    {
        return $this->hasOne('App\Models\Employee');
    }


}
