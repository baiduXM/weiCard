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
     * 模型 - 使用者 - 使用类型 关系模型
     */
    public function useable()
    {
        return $this->morphTo();
    }
}