<?php

namespace App\Http\Controllers\Common;

use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Illuminate\Routing\Controller as BaseController;

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

class UploadController extends BaseController
{

    protected $imageArr = ['jpg', 'jpeg', 'png', 'bmp', 'gif', 'svg'];
    protected $fileArr = ['zip'];
    protected $excelArr = ['xls', 'xlsx', 'csv'];
    protected $videoArr = [];


    /**
     * 上传保存
     *
     * @param $file
     * @param string $path_type
     * @param null $name
     * @return bool|string
     */
    public function save($file, $path_type = 'user', $name = null)
    {
        $targetPath = $this->getPath($path_type, $name); // 目标路径
        if ($targetPath) { // 检查是否存在
            $this->hasFolder($targetPath);
        }
        $extension = strtolower($file->getClientOriginalExtension());// 获取文件扩展名，转换为小写
        if (in_array($extension, $this->imageArr)) { // 图片保存
            $fileName = 'img' . time() . '.' . $extension;
            $this->saveImg($file, $targetPath, $fileName);
        } elseif (in_array($extension, $this->fileArr)) {
            $fileName = 'zip' . time() . '.' . $extension;
            $file->move($targetPath, $fileName);
            $this->unZip($targetPath . '/' . $fileName);
        } elseif (in_array($extension, $this->excelArr)) {
            $fileName = 'excel' . time() . '.' . $extension;
            Storage::put($fileName, $file);
        }
        return $targetPath . '/' . $fileName;
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
        if ($zip->open($targetPath . '/' . $fileName) === TRUE) {
            $zip->extractTo($targetPath . './');
            $zip->close();
            @unlink($targetPath . '/' . $fileName);
        } else {
            return false;
        }
    }


    /**
     * 获取文件夹路径
     *
     * @param $path_type        路径类型
     * @param null $name 底层文件夹名
     * @return bool|string      路径
     */
    public function getPath($path_type, $name = null)
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
                $targetPath = 'uploads/company/' . $name . '/products';// .公司目录下的产品
                break;
            case 'employee':
                $targetPath = 'uploads/employee/' . $name;// .员工工号
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
     * @param $path 文件夹路径
     * @return boolean 是否删除成功，true/false
     */
    public function deleteFolder($path)
    {
        return Storage::disk('public')->deleteDirectory($path);
    }

    /**
     * 删除文件
     *
     * @param string|array $files 文件名，字符串/数组
     * @return boolean 是否删除成功，true/false
     */
    public function deleteFiles($files)
    {
        return Storage::disk('public')->delete($files);
    }
}