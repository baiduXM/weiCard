<?php
namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Manager extends Model
{


    protected $fillable = [
        'name', 'email', 'password', 'mobile', 'nickname', 'avatar', 'is_super', 'is_active'
    ];
    protected $hidden = [
        'password', 'remember_token',
    ];





}