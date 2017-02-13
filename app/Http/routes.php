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

    // 首页
    Route::get('/', ['as' => 'admin', function () {
        return redirect()->route('admin_index');
    }]);
    Route::get('index', ['as' => 'admin_index', 'uses' => 'Admin\IndexController@index']);

    // 用户管理
    Route::group(['prefix' => 'user'], function () {
        Route::get('/', ['as' => 'admin_user_index', 'uses' => 'Admin\UserController@index']);
        Route::any('create', ['as' => 'admin_user_create', 'uses' => 'Admin\UserController@create']);
        Route::any('update/{id}', ['as' => 'admin_user_update', 'uses' => 'Admin\UserController@update']);
        Route::any('delete/{id}', ['as' => 'admin_user_delete', 'uses' => 'Admin\UserController@delete']);
        Route::get('detail/{id}', ['as' => 'admin_user_detail', 'uses' => 'Admin\UserController@detail']);
    });

    // 公司管理
    Route::group(['prefix' => 'company'], function () {
        // TODO
    });

    // 模板管理
    Route::group(['prefix' => 'template'], function () {
        // TODO
    });

    // 客服管理
    Route::group(['prefix' => 'administrator'], function () {
        Route::get('/', ['as' => 'admin_administrator_index', 'uses' => 'Admin\AdministratorController@index']);
        Route::any('/create', ['as' => 'admin_administrator_create', 'uses' => 'Admin\AdministratorController@create']);
        Route::any('/update/{id}', ['as' => 'admin_administrator_update', 'uses' => 'Admin\AdministratorController@update']);
        Route::any('/delete/{id}', ['as' => 'admin_administrator_delete', 'uses' => 'Admin\AdministratorController@delete']);
        Route::get('/detail/{id}', ['as' => 'admin_administrator_detail', 'uses' => 'Admin\AdministratorController@detail']);
    });

    // 设置
    Route::group(['prefix' => 'setting'], function () {
        // TODO
    });
});

// 前台用户界面
Route::group(['prefix' => 'home'], function () {

    // 首页
    Route::get('/', ['as' => 'home', function () {
        return redirect()->route('home_index');
    }]);
    Route::get('index', ['as' => 'home_index', 'uses' => 'Admin\IndexController@index']);

});

