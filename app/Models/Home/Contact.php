<?php

namespace App\Models\Home;

use Illuminate\Database\Eloquent\Model;

class Contact extends Model
{
    public $timestamps = true;

//    protected $fillable = [
//        'name', 'telephone', 'mobile',
//    ];

    protected $table = 'contacts';
}
