<?php
namespace App\Http\Controllers\Common;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Illuminate\Routing\Controller as BaseController;


/*
 * 路径规则
 * {$path}[/{$name}[/{$type}]]
 * 路径[/用户名[/类型]]
 *
 * path 路径
 * 用户       public/uploads/user/{$name}/{$type}         url可访问
 * 管理       public/uploads/admin/{$name}/{$type}        url可访问
 * 网站       public/uploads/website/                     url可访问
 * 公司       storage/uploads/company/{$name}/{$type}      url不可访问
 * 模板       public/uploads/company/{$name}/{$type}      url不可访问
 *
 * type 类型
 * 图片   images
 * 文件   files
 * 视频   videos
 */
class UploadController extends BaseController
{

    /**
     * 保存图片
     * 用户，保存文件夹地址，public/uploads/home/{$username}/images
     * 管理员，保存文件夹地址，public/uploads/admin/{$username}/images
     * 网站，保存文件夹地址，public/site/website/images
     *
     * @param $file     文件
     * @param string $guard 登录守卫
     * @return string
     */
    public static function saveImg($file, $guard = '')
    {
        switch ($guard) {
            case 'others':
                $targetPath = 'others/images';
                break;
            case 'website':
                $targetPath = 'website/images';
                break;
            default:
                $userName = Auth::guard($guard)->user()->name;
                $targetPath = 'uploads/' . $userName . '/images';
                break;
        }

        $diskPath = public_path();
        self::isFolder($targetPath);

        $imgArr = ['jpg', 'jpeg', 'png', 'bmp', 'gif', 'svg'];
        $extension = strtolower($file->getClientOriginalExtension()); // 获取文件扩展名，转换为小写
        if (in_array($extension, $imgArr)) {
            $fileName = 'img' . time() . '.' . $extension;
            Image::make($file)->save($diskPath . '/' . $targetPath . '/' . $fileName);
            return $targetPath . '/' . $fileName;
        } else {
            return $targetPath;
        }

    }

    /**
     * 检查文件夹是否存在，不存在创建
     *
     * @param $path
     */
    private static function isFolder($path)
    {
        if (!file_exists($path)) {
            Storage::disk('uploads')->makeDirectory($path);
        }
    }
}