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
     * 关系模型(多对多，多态) - 名片夹
     */
    public function cardcases()
    {
        return $this->morphedByMany('App\Models\Cardcase', 'taggable');
    }

    /**
     * 关系模型(多对多，多态) - 模板
     */
    public function templates()
    {
        return $this->morphedByMany('App\Models\Template', 'taggable');
    }
}
