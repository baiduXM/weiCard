<?php

namespace App\Http\Middleware;

use App\Http\Controllers\Common\Controller;
use Closure;

class MobileMiddleware
{
    /**
     * 判断是否是移动端
     *
     * @param \Illuminate\Http\Request $request
     * @param \Closure                 $next
     *
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $commonController = new Controller();
        $commonController->isMobile();

//        if (session('is_mobile') && !$request->is('m/*')) {
////            return redirect('m/');
//            return redirect('m/' . $request->path());
//        }

        return $next($request);
    }

}
