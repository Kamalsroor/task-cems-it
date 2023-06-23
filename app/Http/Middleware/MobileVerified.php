<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class MobileVerified
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {

        if ($request->user() && $request->user()->mobile_verified_at === null) {
            return response()->error( 'Mobile number is not verified.',[], 401);
        }

        return $next($request);
    }
}
