<?php
/**
 * Created by PhpStorm.
 * User: Hsieh
 * Date: 2017/4/7
 * Time: 11:03
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Company extends Model
{

    use SoftDeletes;

    const VERIFIED_ING = 0; // 认证中
    const VERIFIED_SUCCEED = 1; // 认证通过
    const VERIFIED_FAILED = 2; // 认证失败

//    public $timestamps = false;

//    protected $dateFormat = 'U';


    protected $guarded = [
        'id', 'created_at', 'updated_at', 'deleted_at',
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
            self::VERIFIED_ING => '审核中',
            self::VERIFIED_SUCCEED => '审核通过',
            self::VERIFIED_FAILED => '审核失败',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : reset($array);
        }
        return $array;
    }

}