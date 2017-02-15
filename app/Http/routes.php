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

//Route::group(['middleware' => 'web'], function () {

    Route::auth();
    Route::get('/home', 'HomeController@index');
//});


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
        Route::any('update/{id}', ['as' => 'admin_user_update', 'uses' => 'Admin\UserController@update'])
            ->where(['id' => '[0-9]+']);
        Route::any('delete/{id}', ['as' => 'admin_user_delete', 'uses' => 'Admin\UserController@delete'])
            ->where(['id' => '[0-9]+']);
        Route::get('detail/{id}', ['as' => 'admin_user_detail', 'uses' => 'Admin\UserController@detail'])
            ->where(['id' => '[0-9]+']);
    });

    // 公司管理
    Route::group(['prefix' => 'company'], function () {
        // TODO
        Route::get('/', ['as' => 'admin_company_index', 'uses' => 'Admin\CompanyController@index']);
        Route::any('create', ['as' => 'admin_company_create', 'uses' => 'Admin\CompanyController@create']);
        Route::any('update/{id}', ['as' => 'admin_company_update', 'uses' => 'Admin\CompanyController@update']);
        Route::any('delete/{id}', ['as' => 'admin_company_delete', 'uses' => 'Admin\CompanyController@delete']);
        Route::get('detail/{id}', ['as' => 'admin_company_detail', 'uses' => 'Admin\CompanyController@detail']);
    });

    // 模板管理
    Route::group(['prefix' => 'template'], function () {
        // TODO
        Route::get('/', ['as' => 'admin_template_index', 'uses' => 'Admin\TemplateController@index']);
        Route::any('create', ['as' => 'admin_template_create', 'uses' => 'Admin\TemplateController@create']);
        Route::any('update/{id}', ['as' => 'admin_template_update', 'uses' => 'Admin\TemplateController@update'])
            ->where(['id' => '[0-9]+']);
        Route::any('delete/{id}', ['as' => 'admin_template_delete', 'uses' => 'Admin\TemplateController@delete'])
            ->where(['id' => '[0-9]+']);
        Route::get('detail/{id}', ['as' => 'admin_template_detail', 'uses' => 'Admin\TemplateController@detail'])
            ->where(['id' => '[0-9]+']);
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