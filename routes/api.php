<?php

use App\Http\Controllers\Api\Auth\ProfileController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/profile', function (Request $request) {
//     return $request->user();
// });







Route::group(['prefix' => 'auth'], function () {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/verify', [AuthController::class, 'verify']);
    Route::group(['prefix' => 'profile','middleware' => ['auth:api' ,'mobile_verified' ]], function () {
        Route::get('/', [ProfileController::class, 'Show']);

    });
});


Route::group(['middleware' => ['auth:api' ,'mobile_verified' ]], function () {

    Route::resource('users' , UserController::class);

});

