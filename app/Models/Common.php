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
    const IS_ACTIVE_NOT = 0; // 停用
    const IS_ACTIVE = 1; // 激活
    const SEX_UNKNOWN = 0; // 未知
    const SEX_MALE = 1; // 男
    const SEX_FEMALE = 2; // 女
    const IS_DELETED = '已删除';

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

    /**
     * 判断是否可用
     *
     * @param null $index
     * @return array|mixed
     */
    public function isActive($index = null)
    {
        $array = [
            self::IS_ACTIVE => '激活',
            self::IS_ACTIVE_NOT => '停用',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : reset($array);
        }
        return $array;
    }

    /**
     * 判断是否软删除
     *
     * @param $time
     * @return string
     */
    public function isDelete($time)
    {
        return $time != null ? self::IS_DELETED : '';
    }

    /**
     * 获取性别
     *
     * @param $index
     * @return array|mixed
     */
    public function getSex($index = null)
    {
        $array = [
            self::SEX_UNKNOWN => '未知',
            self::SEX_MALE => '男',
            self::SEX_FEMALE => '女',
        ];
        if ($index !== null) {
            return array_key_exists($index, $array) ? $array[$index] : reset($array);
        }
        return $array;
    }
}
