<?php
namespace App\Model\Admin;

use Illuminate\Database\Eloquent\Model;
use Zizaco\Entrust\Traits\EntrustUserTrait;

class Role extends Model
{
    use EntrustUserTrait;

    const ROLE_TYPE_HOME = 0; // 前台
    const ROLE_TYPE_ADMIN = 1; // 后台

    protected $fillable = [
        'name', 'display_name', 'description', 'type'
    ];

    // 角色类型
    public function setype($ind = null)
    {
        $arr = [
            self::ROLE_TYPE_HOME => '前台角色',
            self::ROLE_TYPE_ADMIN => '后台角色'
        ];
        if ($ind !== null) {
            return array_key_exists($ind, $arr) ? $arr[$ind] : $arr[self::ROLE_TYPE_HOME];
        }
        return $arr;
    }
}