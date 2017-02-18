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
//});

// 前台登录
Route::auth();

// 前台路由组
Route::group(['middleware' => 'web'], function () {

    Route::get('index', 'Home\IndexController@index');

    // 用户操作
    Route::group(['prefix' => 'user'], function () {

    });
});

// 后台登录
Route::get('admin/login', 'Admin\AuthController@getLogin');
Route::post('admin/login', 'Admin\AuthController@postLogin');
Route::get('admin/register', 'Admin\AuthController@getRegister');
Route::post('admin/register', 'Admin\AuthController@postRegister');
Route::get('admin/logout', function () {
    Auth::guard('admin')->logout();
    return redirect()->to('/admin');
});


// 后台管理界面
Route::group(['prefix' => 'admin', 'middleware' => 'auth:admin'], function () {

    // 首页
    Route::get('/', ['as' => 'admin', function () {
        return redirect()->route('admin_index');
    }]);
    Route::get('index', ['as' => 'admin_index', 'uses' => 'Admin\IndexController@index']);

    // 用户管理
    Route::group(['prefix' => 'user'], function () {
        Route::get('/', ['as' => 'admin_user', 'uses' => 'Admin\UserController@index']);
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
    Route::group(['prefix' => 'manager'], function () {
        Route::get('/', ['as' => 'admin_manager', 'uses' => 'Admin\ManagerController@index']);
        Route::any('/create', ['as' => 'admin_manager_create', 'uses' => 'Admin\ManagerController@create']);
        Route::any('/update/{id}', ['as' => 'admin_manager_update', 'uses' => 'Admin\ManagerController@update']);
        Route::any('/delete/{id}', ['as' => 'admin_manager_delete', 'uses' => 'Admin\ManagerController@delete']);
        Route::get('/detail/{id}', ['as' => 'admin_manager_detail', 'uses' => 'Admin\ManagerController@detail']);
    });

    // 设置
    Route::group(['prefix' => 'setting'], function () {
        Route::any('/safety', ['as' => 'admin_setting_safety', 'uses' => 'Admin\SettingController@safety']);
        Route::any('/person', ['as' => 'admin_setting_person', 'uses' => 'Admin\SettingController@person']);

    });


});