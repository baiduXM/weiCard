<?php

namespace App\Http\Controllers\Common;

//use App\Models\Admin\Company;
//use App\Models\Admin\Template;
//use Illuminate\Support\Facades\Auth;
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
 * 公司   company     public/uploads/company/{$code}/...          url可访问
 * 网站   website     public/uploads/website/...                  url可访问
 * 模板   template    public/template/{$code}/...                 url可访问
 *
 */

class UploadController extends BaseController
{

    /**
     * 保存图片
     *
     * @param file $file 文件
     * @param string $path_type 路径类型
     * @param null $name 底层文件夹名
     * @return string
     *      文件路径 + 文件名
     */
    public function saveImg($file, $path_type = 'user', $name = null)
    {
        $targetPath = $this->getPath($path_type, $name);
        if ($targetPath) {
            $this->hasFolder($targetPath);
        }
        $fileName = $this->getFileName($file);
        if ($targetPath && $fileName) {
            Image::make($file)->save($targetPath . '/' . $fileName);
            return $targetPath . '/' . $fileName;
        } else {
            return false;
        }

    }


    /**
     * 获取文件夹路径
     *
     * @param $path_type        路径类型
     * @param null $name 底层文件夹名
     * @return bool|string
     */
    public function getPath($path_type, $name = null)
    {
        if ($name) {
            $name = iconv('utf-8', 'gbk', $name);
        }
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
            case 'website':
                $targetPath = 'uploads/website';
                break;
            case 'template':
                $targetPath = 'template/' . $name;// .模板编号
                break;
            default:
                return false;
                break;
        }
        return $targetPath;
    }

    /**
     * 获取文件名
     *
     * @param $file
     * @return bool|string
     */
    public function getFileName($file)
    {
        if (is_file($file)) {
            $imageArr = ['jpg', 'jpeg', 'png', 'bmp', 'gif', 'svg'];
            $fileArr = [];
            $videoArr = [];
            $extension = strtolower($file->getClientOriginalExtension()); // 获取文件扩展名，转换为小写
            if (in_array($extension, $imageArr)) {
                $fileName = 'img' . time() . '.' . $extension;
            } elseif (in_array($extension, $fileArr)) {
                $fileName = 'file' . time() . '.' . $extension;
            } elseif (in_array($extension, $videoArr)) {
                $fileName = 'video' . time() . '.' . $extension;
            } else {
                return false;
            }
            return $fileName;
        } else {
            return false;
        }
    }


    /**
     * 检查文件夹是否存在，不存在创建
     *
     * @param $path
     */
    private function hasFolder($path)
    {
        if (!file_exists($path)) {
            mkdir(iconv('utf-8', 'gbk', $path), 0777, true);
        }
    }
}