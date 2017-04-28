<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    protected $guarded = [
    ];


    /**
     * 关系模型(多对一) - 用户
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    /**
     * 关系模型(多对多) - 名片夹
     */
    public function cardcase()
    {
        return $this->belongsToMany('App\Models\Cardcase', 'cardcase_tag');
    }
}
