<?php
namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;
use Validator;

class Manager extends Model
{

    protected $fillable = [
        'name', 'email', 'password',
    ];
    protected $hidden = [
        'password', 'remember_token',
    ];


}