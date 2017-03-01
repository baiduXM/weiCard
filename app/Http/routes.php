<?php

/*
 * 资源路由方法
    //GET /photo index photo.index                  索引
    //GET /photo/create create photo.create         创建
    //POST /photo store photo.store                 保存
    //GET /photo/{photo} show photo.show            显示
    //GET /photo/{photo}/edit edit photo.edit       编辑
    //PUT/PATCH /photo/{photo} update photo.update  更新
    //DELETE /photo/{photo} destroy photo.destroy   删除
*/

Route::get('/', function () {
//    return redirect()->route('admin.role.index');
    return redirect()->route('index');
});

// 前台登录
Route::auth();

// 前台路由组
Route::group(['middleware' => ['web', 'auth']], function () {
    Route::get('index', ['as' => 'index', 'uses' => 'Home\IndexController@index']);
    Route::resource('user', 'Home\UserController');
    Route::resource('company', 'Home\CompanyController');
    Route::resource('template', 'Home\TemplateController');
    Route::resource('contact', 'Home\ContactController');
    Route::resource('employee', 'Home\EmployeeController');
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
        return redirect()->route('admin.index');
    }]);
    Route::get('index', ['as' => 'admin.index', 'uses' => 'Admin\IndexController@index']);

    // 用户管理
    Route::group(['prefix' => 'user'], function () {
        Route::get('/', ['as' => 'admin.user', 'uses' => 'Admin\UserController@index']);
        Route::any('create', ['as' => 'admin.user.create', 'uses' => 'Admin\UserController@create']);
        Route::any('update/{id}', ['as' => 'admin.user.update', 'uses' => 'Admin\UserController@update'])
            ->where(['id' => '[0-9]+']);
        Route::any('delete/{id}', ['as' => 'admin.user.delete', 'uses' => 'Admin\UserController@delete'])
            ->where(['id' => '[0-9]+']);
        Route::get('detail/{id}', ['as' => 'admin.user.detail', 'uses' => 'Admin\UserController@detail'])
            ->where(['id' => '[0-9]+']);
    });

    // 公司管理
    Route::group(['prefix' => 'company'], function () {
        Route::get('/', ['as' => 'admin.company.index', 'uses' => 'Admin\CompanyController@index']);
        Route::any('create', ['as' => 'admin.company.create', 'uses' => 'Admin\CompanyController@create']);
        Route::any('update/{id}', ['as' => 'admin.company.update', 'uses' => 'Admin\CompanyController@update']);
        Route::any('delete/{id}', ['as' => 'admin.company.delete', 'uses' => 'Admin\CompanyController@delete']);
        Route::get('detail/{id}', ['as' => 'admin.company.detail', 'uses' => 'Admin\CompanyController@detail']);
    });

    // 模板管理
    Route::group(['prefix' => 'template'], function () {
        Route::get('/', ['as' => 'admin.template.index', 'uses' => 'Admin\TemplateController@index']);
        Route::any('create', ['as' => 'admin.template.create', 'uses' => 'Admin\TemplateController@create']);
        Route::any('update/{id}', ['as' => 'admin.template.update', 'uses' => 'Admin\TemplateController@update'])
            ->where(['id' => '[0-9]+']);
        Route::any('delete/{id}', ['as' => 'admin.template.delete', 'uses' => 'Admin\TemplateController@delete'])
            ->where(['id' => '[0-9]+']);
        Route::get('detail/{id}', ['as' => 'admin.template.detail', 'uses' => 'Admin\TemplateController@detail'])
            ->where(['id' => '[0-9]+']);
    });

    // 客服管理
    Route::group(['prefix' => 'manager'], function () {
        Route::get('/', ['as' => 'admin.manager', 'uses' => 'Admin\ManagerController@index']);
        Route::any('/create', ['as' => 'admin.manager.create', 'uses' => 'Admin\ManagerController@create']);
        Route::any('/update/{id}', ['as' => 'admin.manager.update', 'uses' => 'Admin\ManagerController@update']);
        Route::any('/delete/{id}', ['as' => 'admin.manager.delete', 'uses' => 'Admin\ManagerController@delete']);
        Route::get('/detail/{id}', ['as' => 'admin.manager.detail', 'uses' => 'Admin\ManagerController@detail']);
    });

    // 角色管理
    Route::resource('role', 'Admin\RoleController');
    Route::resource('permission', 'Admin\PermissionController');

    // 设置
    Route::group(['prefix' => 'setting'], function () {
        Route::any('/', ['as' => 'admin.setting.index', 'uses' => 'Admin\SettingController@index']);
        Route::any('/safety', ['as' => 'admin.setting.safety', 'uses' => 'Admin\SettingController@safety']);
        Route::any('/person', ['as' => 'admin.setting.person', 'uses' => 'Admin\SettingController@person']);

    });

});