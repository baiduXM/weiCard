<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;

class Circle extends CommonModel
{
    use SoftDeletes;

    public $timestamps = true;

    protected $guarded = [
        'id', 'created_at', 'updated_at', 'deleted_at',
    ];

    /**
     * 关系模型(多对一) - 名片圈群主
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    /**
     * 关系模型(多对多) - 名片圈中的用户
     */
    public function users()
    {
        return $this->belongsToMany('App\Models\User', 'circle_user');
    }

}