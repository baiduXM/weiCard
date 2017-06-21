<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Link extends Model
{
    protected $guarded = [
        'id', 'created_at', 'updated_at', 'deleted_at'
    ];
    protected $hidden = [
    ];




    /**
     * 关系模型(多对一) - 公司
     */
    public function company()
    {
        return $this->belongsTo('App\Models\Company');
    }
}
