<?php

namespace App\Models\Home;

use Illuminate\Database\Eloquent\Model;

class Company extends Model
{
//    protected $table = 'companies';

    public $timestamps = true;

    protected $fillable = [
        'name', 'email', 'password',
    ];

}