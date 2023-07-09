<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\Login;
use Illuminate\Http\Request;

class CustomMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        $token     = isset($request->token) ? $request->token : '';
        $tokendata = $request->header('token');
        $header    = $request->header('token') != '' ? $tokendata : '';
        $dataToken = $request->token ? $request->token : $header;
        if ($token || $header) {
            // $data = Login::where([
            //     'token' => $dataToken,
            // ])->get();

            // if ($data->count() > 0) {
            return $next($request);
            // } else {
            //     return response('Unauthorized.', 401);
            // }
        } else {
            return response('Unauthorized.', 401);
        }
    }
}
