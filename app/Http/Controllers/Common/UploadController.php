<?php
namespace App\Http\Controllers\Common;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Illuminate\Routing\Controller as BaseController;


class UploadController extends BaseController
{

    /**
     * 保存图片
     * 用户，保存文件夹地址，public/uploads/{$username}/images
     * 网站，保存文件夹地址，public/uploads/website/images
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