<?php

namespace App\Models;

use Illuminate\Database\Eloquent\SoftDeletes;

class Message extends CommonModel
{
    //    use SoftDeletes;

    public $timestamps = true;

    protected $guarded = [
        'id', 'created_at', 'updated_at',
    ];

    /**
     * 关系模型(多对一) - 留言板拥有者
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

}
