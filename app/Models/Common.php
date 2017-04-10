<?php
/**
 * Created by PhpStorm.
 * User: Hsieh
 * Date: 2017/4/10
 * Time: 14:45
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Common extends Model
{

    /**
     * 获取属性
     *
     * @param $table    表名
     * @param $id       主键value
     * @param string $attribute 属性名
     * @param string $key 主键key
     * @return string   属性值
     */
    public function getValue($table, $id, $attribute = 'name', $key = 'id')
    {
        if ($id) {
            $data = DB::table($table)->where($key, $id)->first();
            if ($data) {
                return $data->$attribute;
            } else {
                return '<error>';
            }
        } else {
            return '<null>';
        }
    }
}
