<?php
namespace App\Http\Controllers\Common;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;

/*
 * 上传文件
 *
 * 先上传到temp文件夹
 */

class UploadController extends Controller
{

    const TEMP_FOLDER = '/uploads/temp'; // 临时文件夹
    const IMG_FOLDER = '/uploads/images'; // 图片文件夹
    const FILE_FOLDER = '/uploads/files'; // 附件文件夹
    const OTHER_FOLDER = '/uploads/others'; // 附件文件夹


    /**
     * 保存图片
     * 前台用户，保存文件夹地址，uploads/$username/images
     * 后台用户，保存文件夹地址，uploads/admin/$username/images
     * 网站，保存文件夹地址，uploads/website/images
     *
     * @param $file     文件对象
     * @param string $guard 登录守卫
     * @param null $path
     * @return string
     */
    public function saveImg($file, $guard = '')
    {
        switch ($guard) {
            case '':
                $userName = Auth::guard($guard)->user()->name;
                $targetPath = '/uploads/' . $userName . '/images';
                break;
            case 'admin':
                $userName = Auth::guard($guard)->user()->name;
                $targetPath = '/uploads/admin/' . $userName . '/images';
                break;
            case 'website':
                $targetPath = '/uploads/website/images';
                break;
            default:
                $targetPath = '/uploads/other/images';
                break;
        }
//        dd($targetPath);

        $diskPath = public_path('uploads');
//        dd($diskPath);
        $this->checkFolder($diskPath . $targetPath);
        dd('finish');
        $imgArr = ['jpg', 'jpeg', 'png', 'bmp', 'gif', 'svg'];
        $extension = strtolower($file->getClientOriginalExtension()); // 获取文件扩展名，转换为小写
        if (in_array($extension, $imgArr)) {
            $fileName = '/img' . time() . '.' . $extension;
//            dd(Image::make($file)->save($diskPath . $targetPath . $fileName));
            dd(Image::make($file)->save($diskPath . self::IMG_FOLDER . $fileName));
            return self::IMG_FOLDER . $fileName;
        } else {
            $targetPath = public_path() . self::OTHER_FOLDER;
        }

    }

    /**
     * 检查文件夹是否存在，不存在创建
     *
     * @param $path
     */
    private function checkFolder($path)
    {
//        echo 1;
        Storage::disk('uploads')->makeDirectory('admin/images');
        Storage::disk('uploads')->put('a.txt', 'nihao');
        $url = Storage::disk('uploads')->url('a.txt');
        $dir = Storage::disk('uploads')->allDirectories();
        dd($url);
    }
}