<?php
/**
 * Created by PhpStorm.
 * User: Hsieh
 * Date: 2017/4/7
 * Time: 11:05
 */

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Template extends Model
{
    protected $fillable = [
        'name', 'display_name',
    ];

    protected $hidden = [
    ];
}