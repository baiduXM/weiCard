<?php

namespace App\Http\Controllers\Common;

use App\Http\Controllers\Controller;
use Overtrue\LaravelPinyin\Facades\Pinyin;

/**
 * 移动端公共控制器，其他模块控制器继承该控制器
 * 可调用Common文件夹下的，全局公共控制器
 *
 * @package App\Http\Controllers\Mobile
 */
class CommonController extends Controller
{
    public function __construct()
    {
        // TODO
    }

    /**
     * 二维数组排序
     *
     * @param array  $array 要排序的数组
     * @param string $field 排序字段
     * @param string $order 排序顺序，可选。
     *                      asc|desc => 升序|降序
     *
     * @return array    排序后的数组
     */
    public function sortArray(array $array, $field, $order = 'asc')
    {
        $rules = array(
            'direction' => $order == 'asc' ? SORT_ASC : SORT_DESC,
            'field' => $field,
        );
        $arrSort = array();
        foreach ($array AS $unique => $row) {
            foreach ($row AS $key => $value) {
                $arrSort[$key][$unique] = $value;
            }
        }
        array_multisort($arrSort[$rules['field']], $rules['direction'], $array);
        return $array;
    }


    /**
     * 字符串转拼音
     *
     * @param        $string     要转换的字符串
     * @param string $type       转换方式，可选。
     *                           permalink|abbr|sentence|convert => 全拼拼接|首字母|全拼带声调|全拼数组
     * @param string $delimiters 分隔符，可选。
     *                           ''|'_'|'-'|'.'
     *
     * @return mixed string|array
     */
    public function pinyin($string, $type = 'permalink', $delimiters = '')
    {
        return Pinyin::$type($string, $delimiters);
    }



}

