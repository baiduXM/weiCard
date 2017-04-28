<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Cardcase extends Model
{

    protected $guarded = [
    ];

    /**
     * 关系模型(一对一) - 用户
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    /**
     * 关系模型(多对多) - 标签
     */
    public function tags()
    {
        return $this->belongsToMany('App\Models\Tag', 'cardcase_tag');
    }

    /**
     * 关系模型(多对一,多态) - 关注者（user/employee）
     */
    public function follower()
    {
        return $this->morphTo();
    }


    /**
     * 获取关注类型
     *
     * @param null $index       模型名
     * @return array|mixed
     */
    public function getFollowerType($index = null)
    {
        $array = [
            'User' => '用户',
            'Employee' => '同事',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : reset($array);
        }
        return $array;
    }


}