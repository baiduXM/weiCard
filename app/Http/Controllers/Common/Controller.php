<?php

namespace App\Http\Controllers\Common;

use App\Models\Cardcase;
use App\Models\Company;
use App\Models\Employee;
use App\Models\User;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesResources;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Overtrue\LaravelPinyin\Facades\Pinyin;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Illuminate\Support\Facades\Session;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class Controller extends BaseController
{
    use AuthorizesRequests, AuthorizesResources, DispatchesJobs, ValidatesRequests;


    public $is_mobile = false; // 是否是手机模式
    public $interview = 'web'; // 访问页面，web|mobile

    public function __construct()
    {

    }

    /**
     * 判断是否是移动设备
     *
     * @return bool
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
            'wapr', 'webc', 'winw', 'winw', 'xda', 'xda-',
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
        if ($mobile_browser > 0) {
            $this->is_mobile = true;
            $this->interview = 'mobile';
        }
        Session::put('is_mobile', $this->is_mobile);
        return $this->is_mobile;
    }

    /**
     * 二维数组排序
     *
     * @param array  $array 要排序的数组
     * @param string $field 排序字段
     * @param string $order 排序顺序，可选。
     *                      asc|desc => 升序|降序
     * @return array    排序后的数组
     */
    public function sortArray(array $array, $field, $order = 'asc')
    {
        $rules = array(
            'direction' => $order == 'asc' ? SORT_ASC : SORT_DESC,
            'field'     => $field,
        );
        $arrSort = $this->swapArray($array);
        array_multisort($arrSort[$rules['field']], $rules['direction'], $array);
        return $array;
    }

    /**
     * 置换数组
     *
     * @param array $data 要置换的数组
     * @return array
     */
    public function swapArray(array $data)
    {
        $arrSort = array();
        foreach ($data AS $unique => $row) {
            foreach ($row AS $key => $value) {
                $arrSort[$key][$unique] = $value;
            }
        }
        return $arrSort;
    }


    /**
     * 字符串转拼音
     *
     * @param        $string     要转换的字符串
     * @param string $type       转换方式，可选。
     *                           permalink|abbr|sentence|convert => 全拼拼接|首字母|全拼带声调|全拼数组
     * @param string $delimiters 分隔符，可选。
     *                           ''|'_'|'-'|'.'
     * @return mixed string|array
     */
    public function pinyin($string, $type = 'permalink', $delimiters = '')
    {
        return Pinyin::$type($string, $delimiters);
    }

    /*===================================*/


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
     * @return bool
     */
    public function saveImg($file, $targetPath, $fileName)
    {
        return Image::make($file)->save($targetPath . '/' . $fileName) ? true : false;
    }

    /**
     * 压缩文件
     *
     * @param $zipPath    压缩后的文件路径
     * @param $targetPath 目标路径
     * @return mixed
     */
    protected function toZip($zipPath, $targetPath)
    {
        $zip = new \ZipArchive();
        if (is_file($zipPath) && file_exists($zipPath)) {
            $res = $zip->open($zipPath, \ZipArchive::OVERWRITE);
        } else {
            $res = $zip->open($zipPath, \ZipArchive::CREATE);
        }
        if ($res === true) {
            if (is_file($targetPath)) { // 判断是否是文件/文件夹
                $zip->addFile($targetPath);
            } else {
                $this->addFileToZip($targetPath . '/', $zip); //调用方法，对要打包的根目录进行操作，并将ZipArchive的对象传递给方法
            }
            $zip->close(); //关闭处理的zip文件
            return true;
        } else {
            return false;
        }

    }

    /**
     * 循环的读取文件夹下的所有文件和文件夹
     * 其中$filename = readdir($handler)是每次循环的时候将读取的文件名赋值给$filename，
     * 为了不陷于死循环，所以还要让$filename !== false。
     * 一定要用!==，因为如果某个文件名如果叫'0'，或者某些被系统认为是代表false，用!=就会停止循环
     *
     * @param $path
     * @param $zip
     */
    function addFileToZip($path, $zip)
    {
        $handler = opendir($path); //打开当前文件夹由$path指定。
        while (($filename = readdir($handler)) !== false) {
            if ($filename != "." && $filename != "..") {//文件夹文件名字为'.'和‘..’，不要对他们进行操作
                if (is_dir($path . "/" . $filename)) {// 如果读取的某个对象是文件夹，则递归
                    addFileToZip($path . "/" . $filename, $zip);
                } else { //将文件加入zip对象
                    $zip->addFile($path . $filename);
                }
            }
        }
        @closedir($path);
    }

    /**
     * 解压Zip文件
     *
     * @param $targetPath   目标路径
     * @param $fileName     文件名
     * @return bool
     */
    public function unZip($targetPath, $fileName)
    {
        /* 解压处理 */
        $zip = new \ZipArchive();
        if ($zip->open($targetPath . '/' . $fileName) === true) {
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
                if ($second_name) {
                    $targetPath = 'uploads/company/' . $name . '/employees/' . $second_name;// .公司员工工号
                } else {
                    $targetPath = 'uploads/company/' . $name . '/employees';// .公司员工根目录
                }
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
    public function hasFolder($path)
    {
        if (!file_exists($path)) {
            mkdir($path, 0777, true);
        }
    }

    /**
     * 删除文件夹
     *
     * @param $path     文件夹路径
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
     * @return boolean              是否删除成功，true/false
     */
    public function deleteFiles($files)
    {
        return Storage::disk('public')->delete($files);
    }

    /**
     * 绑定公司
     *
     * @param string $field   绑定字段
     * @param string $code    绑定代码
     * @param int    $user_id 绑定用户ID
     * @return bool|string 成功返回true，失败返回错误信息
     */
    protected function bindCompany($field, $code, $user_id)
    {
        $user = User::with('company', 'employee')->find($user_id);
        if ($user->company) {
            return '您已绑定公司管理员';
        }
        $company = Company::where($field, $code)->first();
        if (!$company) {
            return '找不到该公司';
        }
        if ($company->user_id) {
            return '该公司已绑定！公司管理员：' . $company->user->nickname;
        }
        if ($user->employee && ($user->employee->company_id != $company->id)) {
            return '您不是该公司员工';
        }
        $company->user_id = $user_id;
        if (!$company->save()) {
            return '绑定失败';
        }
        return true;
    }

    /**
     * 绑定员工
     *
     * @param string $field   绑定字段
     * @param string $code    绑定代码
     * @param int    $user_id 绑定用户ID
     * @return bool|string 成功返回true，失败返回错误信息
     */
    protected function bindEmployee($field, $code, $user_id)
    {
        $user = User::with('company', 'employee')->find($user_id);
        if ($user->employee) {
            return '您已绑定员工';
        }
        $employee = Employee::where($field, $code)->first();
        if (!$employee) {
            return '找不到该员工';
        }
        if ($employee->user) {
            return '该员工已绑定';
        }
        if ($user->company && $user->company->id != $employee->company_id) {
            return '您是其他公司管理员，无法绑定该公司员工';
        }
        $employee->user_id = $user_id;
        if (!$employee->save()) {
            return '绑定失败';
        }
        return true;
    }

    /**
     * 解绑公司
     *
     * @param int $company_id 公司ID
     * @return bool|string 成功返回true，失败返回错误信息
     */
    protected function unbindCompany($company_id)
    {
        $company = Company::find($company_id);
        if (!$company) {
            return '找不到该公司';
        }
        $company->user_id = null;
        if (!$company->save()) {
            return '解绑失败';
        }
        return true;
    }

    /**
     * 解绑员工
     *
     * @param int $employee_id 员工ID
     * @return bool|string 成功返回true，失败返回错误信息
     */
    protected function unbindEmployee($employee_id)
    {
        $employee = Employee::find($employee_id);
        if (!$employee) {
            return '找不到该员工';
        }
        $employee->user_id = null;
        if (!$employee->save()) {
            return '解绑失败';
        }
        return true;
    }


    /**
     * 下载文件
     *
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse|\Symfony\Component\HttpFoundation\BinaryFileResponse
     */
    public function download(Request $request)
    {
        $path = public_path($request->query('path'));
        if (File::isFile($path)) {
            return response()->download($path);
        } else {
            return redirect()->back()->with('error', '下载出错');
        }
    }

    /**
     * 员工离职操作
     *
     * @param object $employee 员工对象
     */
    protected function dimission($employee)
    {
        $this->handoverCardcase2Company($employee);
        $employee->mobile = null; // 员工手机置为空
        $employee->user_id = null; // 员工解绑用户
        $employee->save();
    }

    /**
     * 移交个人企业名片到公司
     *
     * @param object $employee 员工对象
     */
    protected function handoverCardcase2Company($employee)
    {
        // 获取员工收藏的企业名片
        $cardcases = Cardcase::where('user_id', $employee->user_id)->where('follower_type', 'App\Models\Employee')->get();
        // 员工公司ID
        if ($cardcases) {
            $time = date('Y-m-d H:i:s', time());
            foreach ($cardcases as $k => $v) {
                $res = DB::table('cardcase_company')
                    ->where('company_id', $employee->company_id)
                    ->where('follower_id', $v->follower_id)
                    ->first();
                if ($res) {
                    continue;
                }
                $data = array(
                    'company_id'  => $employee->company_id,
                    'follower_id' => $v->follower_id,
                    'remark'      => $employee->nickname . '->员工离职名片移交',
                    'created_at'  => $time,
                );
                DB::table('cardcase_company')->insert($data);
                // TODO:操作日志
            }
        }
    }


    /**
     * 创建二维码
     *
     * @param        $url  二维码地址
     * @param string $path 保存路径
     * @param array  $data 数据{name[,avatar,size,type]}
     * @return \Illuminate\Contracts\Routing\UrlGenerator|string 图片保存路径+命名
     */
    protected function createQrcode($url, $path = 'uploads/qrcode', $data = array())
    {
        $this->hasFolder($path); // 判断文件夹是否存在

        $name = isset($data['name']) ? $data['name'] : 'qrcode' . time(); // 图片命名
        $type = isset($data['type']) ? $data['type'] : 'png'; // 图片格式
        $size = isset($data['size']) ? $data['size'] : 400; // 图片尺寸

        $qrcodeName = $path . '/' . $name . '.' . $type;

        $qrcode = QrCode::format($type);
        $qrcode->size($size);
        $qrcode->generate($url, './' . $qrcodeName);

        return $qrcode ? url($qrcodeName) : false;
    }


}
