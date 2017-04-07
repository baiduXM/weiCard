<?php

namespace App\Http\Controllers\Common;

use App\Models\Admin\Company;
use App\Models\Admin\Template;
use function Couchbase\fastlzCompress;
use Illuminate\Support\Facades\Auth;
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
 * 网站   website     public/uploads/website/...                  url可访问
 * 模板   template    storage/app/template/{$code}/...            url不可访问
 *
 */

class UploadController extends BaseController
{

    /**
     * 保存图片
     *
     * @param file $file 文件
     * @param string $path_type 路径类型
     * @return string
     *      文件完整路径
     */
    public function saveImg($file, $path_type = 'user', $id = null)
    {

        $targetPath = $this->getPath($path_type, $id);
        $fileName = $this->getFileName($file);
        if ($targetPath && $fileName) {
            Image::make($file)->save($targetPath . '/' . $fileName);
            return $targetPath . '/' . $fileName;
        } else {
            return false;
        }

    }


    /**
     * 获取文件路径
     *
     * @param $path_type
     * @return bool|string
     */
    public function getPath($path_type, $id = null)
    {
        switch ($path_type) {
            case 'user':
                $targetPath = public_path('uploads') . '/user/' . Auth::user()->name;
                break;
            case 'admin':
                $targetPath = public_path('uploads') . '/admin/' . Auth::guard('admin')->user()->name;
                break;
            case 'company':
                $company = Company::findOrFail($id);
                $targetPath = public_path('uploads') . '/company/' . $company->code;// .公司名称
                break;
            case 'website':
                $targetPath = public_path('uploads') . '/website';
                break;
            case 'template':
                $template = Template::findOrFail($id);
                $targetPath = storage_path('app') . '/template/' . $template->code;// .模板编号
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
    private function isFolder($path)
    {
        if (!file_exists($path)) {
            Storage::disk('uploads')->makeDirectory($path);
        }
    }
}