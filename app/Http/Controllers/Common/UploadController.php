<?php
namespace App\Http\Controllers\Common;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;

/*
 * 上传文件
 * 先上传到temp文件夹
 */

class UploadController extends Controller
{

    const TEMP_FOLDER = '/uploads/temp'; // 临时文件夹
    const IMG_FOLDER = '/uploads/images'; // 图片文件夹
    const FILE_FOLDER = '/uploads/files'; // 附件文件夹
    const OTHER_FOLDER = '/uploads/others'; // 附件文件夹


    public static function save($file, $guard = '', $path = null)
    {
        $userName = Auth::guard($guard)->user()->name;
        $diskPath = public_path();
        $imgArr = ['jpg', 'jpeg', 'png', 'bmp', 'gif', 'svg'];
        $extension = strtolower($file->getClientOriginalExtension()); // 获取文件扩展名，转换为小写
        if (in_array($extension, $imgArr)) {
            $fileName = '/img' . time() . '.' . $extension;
            Image::make($file)->save($diskPath . self::IMG_FOLDER . $fileName);
            return self::IMG_FOLDER . $fileName;
        } else {
            $targetPath = public_path() . self::OTHER_FOLDER;
        }


    }
}