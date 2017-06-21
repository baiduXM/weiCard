<?php

namespace App\Http\Controllers\Common;

use App\Http\Controllers\Controller;
use Overtrue\LaravelPinyin\Facades\Pinyin;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Session;


class CommonController extends Controller
{

    public function __construct()
    {
        // TODO
    }

    public $is_mobile = false;

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

    /*===================================*/
    /**
     * 判断是否是移动设备
     */
    public function isMobile()
    {
        $_SERVER['ALL_HTTP'] = isset($_SERVER['ALL_HTTP']) ? $_SERVER['ALL_HTTP'] : '';
        $mobile_browser = '0';
        if (preg_match('/(up.browser|up.link|mmp|symbian|smartphone|midp|wap|phone|iphone|ipad|ipod|android|xoom)/i', strtolower($_SERVER['HTTP_USER_AGENT'])))
            $mobile_browser++;
        if ((isset($_SERVER['HTTP_ACCEPT'])) and (strpos(strtolower($_SERVER['HTTP_ACCEPT']), 'application/vnd.wap.xhtml+xml') !== false))
            $mobile_browser++;
        if (isset($_SERVER['HTTP_X_WAP_PROFILE']))
            $mobile_browser++;
        if (isset($_SERVER['HTTP_PROFILE']))
            $mobile_browser++;
        $mobile_ua = strtolower(substr($_SERVER['HTTP_USER_AGENT'], 0, 4));
        $mobile_agents = array(
            'w3c ', 'acs-', 'alav', 'alca', 'amoi', 'audi', 'avan', 'benq', 'bird', 'blac',
            'blaz', 'brew', 'cell', 'cldc', 'cmd-', 'dang', 'doco', 'eric', 'hipt', 'inno',
            'ipaq', 'java', 'jigs', 'kddi', 'keji', 'leno', 'lg-c', 'lg-d', 'lg-g', 'lge-',
            'maui', 'maxo', 'midp', 'mits', 'mmef', 'mobi', 'mot-', 'moto', 'mwbp', 'nec-',
            'newt', 'noki', 'oper', 'palm', 'pana', 'pant', 'phil', 'play', 'port', 'prox',
            'qwap', 'sage', 'sams', 'sany', 'sch-', 'sec-', 'send', 'seri', 'sgh-', 'shar',
            'sie-', 'siem', 'smal', 'smar', 'sony', 'sph-', 'symb', 't-mo', 'teli', 'tim-',
            'tosh', 'tsm-', 'upg1', 'upsi', 'vk-v', 'voda', 'wap-', 'wapa', 'wapi', 'wapp',
            'wapr', 'webc', 'winw', 'winw', 'xda', 'xda-'
        );
        if (in_array($mobile_ua, $mobile_agents))
            $mobile_browser++;
        if (strpos(strtolower($_SERVER['ALL_HTTP']), 'operamini') !== false)
            $mobile_browser++;
        // Pre-final check to reset everything if the user is on Windows
        if (strpos(strtolower($_SERVER['HTTP_USER_AGENT']), 'windows') !== false)
            $mobile_browser = 0;
        // But WP7 is also Windows, with a slightly different characteristic
        if (strpos(strtolower($_SERVER['HTTP_USER_AGENT']), 'windows phone') !== false)
            $mobile_browser++;
        if ($mobile_browser > 0)
            $this->is_mobile = true;
        else
            $this->is_mobile = false;

        Session::put('is_mobile', $this->is_mobile);
    }

    /*
     * 路径规则
     * {$path} - 路径
     * {$name} - 用户名/公司名
     * {$code} - 模板编号
     *
     * path_type 路径
     * 用户   user        public/uploads/user/{$name}/...             url可访问
     * 管理   admin       public/uploads/admin/{$name}/...            url可访问
     * 公司   company     public/uploads/company/{$name}/...          url可访问
     * 产品   product     public/uploads/company/{$name}/products/...          url可访问
     * 员工   employee    public/uploads/employee/{$name}/...          url可访问
     * 网站   website     public/uploads/website/...                  url可访问
     * 模板   template    public/templates/{$name}/...                 url可访问
     */

    /**
     * 图片数组
     *
     * @var array 图片类型后缀
     */
    protected $imageArr = ['jpg', 'jpeg', 'png', 'bmp', 'gif', 'svg'];
    protected $fileArr = ['zip'];
    protected $excelArr = ['xls', 'xlsx', 'csv'];
    protected $videoArr = [];


    /**
     * 上传保存
     *
     * @param file   $file        文件
     * @param string $path_type   保存路径类型
     * @param null   $name        文件夹名
     * @param null   $second_name 二级文件夹名
     *
     * @return bool|string      返回路径
     */
    public function save($file, $path_type = 'user', $name = null, $second_name = null)
    {
        $targetPath = $this->getPath($path_type, $name, $second_name); // 目标路径
        if ($targetPath) { // 检查是否存在
            $this->hasFolder($targetPath);
        }
        $extension = strtolower($file->getClientOriginalExtension());// 获取文件扩展名，转换为小写
        if (in_array($extension, $this->imageArr)) { // 图片保存
            $fileName = 'img' . time() . '.' . $extension;
            if ($this->saveImg($file, $targetPath, $fileName)) {
                return $targetPath . '/' . $fileName;
            }
        } elseif (in_array($extension, $this->fileArr)) {
            $fileName = 'zip' . time() . '.' . $extension;
            $file->move($targetPath, $fileName);
            if ($this->unZip($targetPath, $fileName)) {
                return $targetPath;
            }
        } elseif (in_array($extension, $this->excelArr)) {
            $fileName = 'excel' . time() . '.' . $extension;
//            $file->move($targetPath, $fileName);
            if ($file->move($targetPath, $fileName)) {
                return $targetPath . '/' . $fileName;
            }
        }
        return false;
    }

    /**
     * 保存图片
     *
     * @param $file         文件
     * @param $targetPath   目标路径
     * @param $fileName     文件名
     *
     * @return bool
     */
    public function saveImg($file, $targetPath, $fileName)
    {
        return Image::make($file)->save($targetPath . '/' . $fileName) ? true : false;
    }


    /**
     * 解压Zip文件
     *
     * @param $targetPath   目标路径
     * @param $fileName     文件名
     *
     * @return bool
     */
    public function unZip($targetPath, $fileName)
    {
        /* 解压处理 */
        $zip = new \ZipArchive();
        if ($zip->open($targetPath . '/' . $fileName) === TRUE) {
            $zip->extractTo($targetPath . './');
            $zip->close();
            @unlink($targetPath . '/' . $fileName);
            return true;
        } else {
            return false;
        }
    }


    /**
     * 获取文件夹路径
     *
     * @param string $path_type   路径类型
     * @param string $name        文件夹名
     * @param string $second_name 二级文件夹名
     *
     * @return bool|string      返回文件夹路径
     */
    public function getPath($path_type, $name = null, $second_name = null)
    {
        switch ($path_type) {
            case 'user':
                $targetPath = 'uploads/user/' . $name;
                break;
            case 'admin':
                $targetPath = 'uploads/admin/' . $name;
                break;
            case 'company':
                $targetPath = 'uploads/company/' . $name;// .公司名称
                break;
            case 'product':
                $targetPath = 'uploads/company/' . $name . '/products';// .公司下的产品
                break;
            case 'employee':
                $targetPath = 'uploads/company/' . $name . '/employees/' . $second_name;// .公司员工工号
                break;
            case 'website':
                $targetPath = 'uploads/website';
                break;
            case 'template':
                $targetPath = 'templates/' . $name;// .模板编号
                break;
            default:
                return false;
                break;
        }
        return $targetPath;

    }


    /**
     * 检查文件夹是否存在，不存在创建
     *
     * @param $path
     */
    private function hasFolder($path)
    {
        if (!file_exists($path)) {
            mkdir($path, 0777, true);
        }
    }

    /**
     * 删除文件夹
     *
     * @param $path     文件夹路径
     *
     * @return boolean  是否删除成功，true/false
     */
    public function deleteFolder($path)
    {
        if (Storage::exists($path)) {
            return Storage::disk('public')->deleteDirectory($path);
        }
    }

    /**
     * 删除文件
     *
     * @param string|array $files 文件名，字符串/数组
     *
     * @return boolean              是否删除成功，true/false
     */
    public function deleteFiles($files)
    {
        return Storage::disk('public')->delete($files);
    }


}

