<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class Authenticate
{
    /**
     * Handle an incoming request.
     *
<<<<<<< HEAD
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string|null  $guard
=======
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @param  string|null $guard
>>>>>>> 697f93b0898e0306a7faefa3bf9eb752fb448e6d
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
<<<<<<< HEAD

//        echo 1;exit;
=======
>>>>>>> 697f93b0898e0306a7faefa3bf9eb752fb448e6d
        if (Auth::guard($guard)->guest()) {
            if ($request->ajax() || $request->wantsJson()) {
                return response('Unauthorized.', 401);
            } else {
<<<<<<< HEAD
                return redirect()->guest('login');
=======
                return redirect()->guest($guard . '/login');
>>>>>>> 697f93b0898e0306a7faefa3bf9eb752fb448e6d
            }
        }

        return $next($request);
    }
}
