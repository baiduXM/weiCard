<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Template extends Model
{

    const TYPE_ALL = 0; // 全部
    const TYPE_USER = 1; // 个人
    const TYPE_COMPANY = 2; // 公司


    protected $guarded = [
        'id', 'created_at', 'updated_at',
    ];
    protected $hidden = [
    ];

    /**
     * 关系模型(多对多，多态) - 用户
     */
    public function users()
    {
        return $this->morphedByMany('App\Models\User', 'useable', 'template_useable');
    }

    /**
     * 关系模型(多对多，多态) - 公司
     */
    public function companies()
    {
        return $this->morphedByMany('App\Models\Company', 'useable', 'template_useable');
    }

    /**
     * 关系模型(多对多，多态) - 员工
     */
    public function employees()
    {
        return $this->morphedByMany('App\Models\Employee', 'useable', 'template_useable');
    }

    /**
     * 关系模型(多对多,多态) - 标签
     */
    public function tags()
    {
        return $this->morphToMany('App\Models\Tag', 'taggable');
    }

    /**
     * 判断是否可用
     *
     * @param null $index
     * @return array|mixed
     */
    public function getType($index = null)
    {
        $array = [
            self::TYPE_ALL => '全部',
            self::TYPE_USER => '个人',
            self::TYPE_COMPANY => '公司',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : reset($array);
        }
        return $array;
    }
}
