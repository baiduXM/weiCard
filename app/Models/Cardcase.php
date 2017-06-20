<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cardcase extends Model
{
    /**
     * 表明模型是否应该被打上时间戳
     *
     * @var bool
     */
    public $timestamps = true;

    protected $guarded = [
    ];

    /**
     * 允许url带参数查询字段
     *
     * @var array key(字段)=>value(操作符)
     */
    public $query = [
        'user_id' => '=',
        'sort' => ''
    ];

    /**
     * 关系模型(多对一) - 用户
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    /**
     * 关系模型(多对一) - 分组
     */
    public function group()
    {
        return $this->belongsTo('App\Models\Group');
    }

    /**
     * 关系模型(多对一,多态) - 关注者类型（App\Models\User、App\Models\Employee）
     */
    public function follower()
    {
        return $this->morphTo();
    }

//    /**
//     * 关系模型(多对多,多态) - 标签
//     */
//    public function tags()
//    {
//        return $this->morphToMany('App\Models\Tag', 'taggable');
//    }

    /**
     * 获取关注类型
     *
     * @param null $index 模型名
     *
     * @return array|mixed
     *      index为空返回数组
     */
    public function getFollowerType($index = null)
    {
        $array = [
            'App\Models\User' => 'u',
            'App\Models\Employee' => 'e',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : reset($array);
        }
        return $array;
    }


}