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

//    use SoftDeletes; // 软删除

    const VERIFIED_ING = 0; // 待审核
    const VERIFIED_SUCCEED = 1; // 审核通过
    const VERIFIED_FAILED = 2; // 审核失败

//    public $timestamps = false;

//    protected $dateFormat = 'U';


    protected $guarded = [
        'id', 'created_at', 'updated_at', 'deleted_at',
    ];

    protected $hidden = [
    ];

    /**
     * 获取公司对应的用户（创始人）
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    /**
     * 审核者（管理员）
     */
    public function manager()
    {
        return $this->belongsTo('App\Models\Manager');
    }

    /**
     * 获取公司拥有的员工
     */
    public function employees()
    {
        return $this->hasMany('App\Models\Employee');
    }

    /**
     * 获取公司部门
     */
    public function departments()
    {
        return $this->hasMany('App\Models\Department');
    }

    /**
     * 获取状态
     *
     * @param null $index
     * @return array|mixed
     */
    public function getStatus($index = null)
    {
        $array = [
            self::VERIFIED_ING => '待审核',
            self::VERIFIED_SUCCEED => '审核通过',
            self::VERIFIED_FAILED => '审核失败',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : reset($array);
        }
        return $array;
    }

}