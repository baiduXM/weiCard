<?php
namespace App\Model\Admin;

use Illuminate\Database\Eloquent\Model;

class Manager extends Model
{

    protected $fillable = [
        'name', 'email', 'password',
    ];
    protected $hidden = [
        'password', 'remember_token',
    ];

}