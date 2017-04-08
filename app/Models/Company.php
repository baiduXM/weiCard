<?php
/**
 * Created by PhpStorm.
 * User: Hsieh
 * Date: 2017/4/7
 * Time: 11:03
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Company extends Model
{

    const VERIFIED_ING = 0; // 认证中
    const VERIFIED_SUCCEED = 1; // 认证通过
    const VERIFIED_FAILED = 2; // 认证失败
    const VERIFIED_UPDATED = 3; // 资料变更

//    public $timestamps = false;

//    protected $dateFormat = 'U';

    protected $fillable = [
        'user_id', 'name', 'code', 'logo', 'address', 'email', 'telephone', 'description', 'manager_id', 'status',
        'created_at', 'updated_at', 'verified_at', 'deleted_at',
    ];

    protected $hidden = [
    ];


    /**
     * 获取状态
     *
     * @param null $index
     * @return array|mixed
     */
    public function getStatus($index = null)
    {
        $array = [
            self::VERIFIED_ING => '认证中',
            self::VERIFIED_SUCCEED => '认证通过',
            self::VERIFIED_FAILED => '认证失败',
            self::VERIFIED_UPDATED => '资料变更',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : $array[self::VERIFIED_ING];
        }
        return $array;
    }
}