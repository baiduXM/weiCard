<?php

/*
  |--------------------------------------------------------------------------
  | Application Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register all of the routes for an application.
  | It's a breeze. Simply tell Laravel the URIs it should respond to
  | and give it the controller to call when that URI is requested.
  |
 */

Route::get('/', function () {
    return view('welcome');
});

Route::auth();

Route::get('/home', 'HomeController@index');

// 后台管理界面
Route::group(['prefix' => 'admin'], function () {
    Route::get('/', ['as' => 'admin', function () {
        return redirect()->route('admin_index');
    }]);
    Route::get('index', ['as' => 'admin_index', 'uses' => 'Admin\IndexController@index']);

    Route::group(['prefix' => 'user'], function () {
        Route::get('/', ['as' => 'admin_user_index', 'uses' => 'Admin\UserController@index']);
        Route::any('/create', ['as' => 'admin_user_create', 'uses' => 'Admin\UserController@create']);
        Route::any('/update/{id}', ['as' => 'admin_user_update', 'uses' => 'Admin\UserController@update']);
        Route::any('/delete/{id}', ['as' => 'admin_user_delete', 'uses' => 'Admin\UserController@delete']);
        Route::get('/detail/{id}', ['as' => 'admin_user_detail', 'uses' => 'Admin\UserController@detail']);
    });
});

// 前台用户界面
Route::group(['prefix' => 'home'], function () {
    Route::get('index', [
        'as' => 'home_index', 'uses' => 'Home\IndexController@index'
    ]);
});

