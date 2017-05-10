<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Template extends Model
{
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
     * 关系模型(多对多,多态) - 标签
     */
    public function tags()
    {
        return $this->morphToMany('App\Models\Tag', 'taggable');
    }
}
