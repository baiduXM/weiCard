<?php
namespace App\Http\Controllers\Common;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class ImageController extends Controller
{

    protected function saveImg(Request $request)
    {
        dd($request);
        return $request;
        $this->validate($request);
        Image::make();
    }
}