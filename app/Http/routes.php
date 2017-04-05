<?php
/*
 * 资源路由方法restful
 * GET          /photo              index   photo.index     索引
 * GET          /photo/create       create  photo.create    创建
 * POST         /photo              store   photo.store     保存
 * GET          /photo/{photo}      show    photo.show      显示
 * GET          /photo/{photo}/edit edit    photo.edit      编辑
 * PUT/PATCH    /photo/{photo}      update  photo.update    更新
 * DELETE       /photo/{photo}      destroy photo.destroy   删除
 */

/* server information */
Route::get('phpinfo', function () {
    echo phpinfo();
});

/* 默认首页 */
Route::get('/', function () {
    return redirect()->to('user');
});

/* 登录 */
Route::auth();
Route::post('login', 'Auth\AuthController@postLogin'); // 重写登录方法

//Route::group();

/* 用户界面 */
Route::group(['middleware' => ['web', 'auth']], function () {

    /* 首页 */
    Route::get('index', ['as' => 'index', 'uses' => 'Home\UserController@index']);

    /* 用户中心 */
    Route::resource('user', 'Home\UserController');

    /* 我的名片 */
    Route::resource('card', 'Home\UserController');

    /* 我的公司 */
    Route::group(['prefix' => 'company'], function () {
        Route::resource('register', 'Home\CompanyController');
        Route::get('register', ['as' => 'company.register.create', 'uses' => 'Home\CompanyController@register']);
        Route::post('register', ['as' => 'company.register.store', 'uses' => 'Home\CompanyController@postRegister']);
        Route::get('group', ['as' => 'company.group', 'uses' => 'Home\CompanyController@group']);
        Route::get('department', ['as' => 'company.department', 'uses' => 'Home\CompanyController@department']);
        Route::get('employee', ['as' => 'company.employee', 'uses' => 'Home\CompanyController@employee']);
        Route::get('workmate', ['as' => 'company.workmate', 'uses' => 'Home\CompanyController@workmate']);
    });
    Route::resource('company', 'Home\CompanyController');

    /* 我的公司->员工 */
    Route::resource('employee', 'Home\EmployeeController');

    /* 模板中心 */
    Route::resource('template', 'Home\TemplateController');

    /* 通讯录 */
    Route::resource('contact', 'Home\ContactController');

    /* 安全中心 */
    Route::resource('security', 'Home\SecurityController');

});

/* 后台管理界面 */
Route::group(['prefix' => 'admin', 'middleware' => 'auth:admin'], function () {

    /* 首页 */
    Route::get('/', ['as' => 'admin', function () {
        return redirect()->route('admin.index');
    }]);
    Route::get('index', ['as' => 'admin.index', 'uses' => 'Admin\IndexController@index']);

    /* 用户管理 */
    Route::group(['prefix' => 'user'], function () {
        Route::delete('batch', ['as' => 'user.batchDestroy', 'uses' => 'Admin\UserController@batchDestroy']);
    });
    Route::resource('user', 'Admin\UserController');

    /* 公司管理 */
    Route::resource('company', 'Admin\CompanyController');

    /* 模板管理 */
    Route::resource('template', 'Admin\TemplateController');

    /* 客服管理 */
    Route::group(['prefix' => 'manager'], function () {
        Route::get('{id}/role', ['as' => 'admin.manager.role', 'uses' => 'Admin\ManagerController@getRole']);
        Route::post('{id}/role', ['as' => 'admin.manager.setRole', 'uses' => 'Admin\ManagerController@postRole']);
        Route::get('{id}/permission', ['as' => 'admin.manager.permission', 'uses' => 'Admin\ManagerController@getPermission']);
        Route::post('{id}/permission', ['as' => 'admin.manager.setPermission', 'uses' => 'Admin\ManagerController@postPermission']);
    });
    Route::resource('manager', 'Admin\ManagerController');

    /* 设置 */
    Route::group(['prefix' => 'setting'], function () {
        Route::any('/safety', ['as' => 'admin.setting.safety', 'uses' => 'Admin\SettingController@safety']);
        Route::any('/person', ['as' => 'admin.setting.person', 'uses' => 'Admin\SettingController@person']);
    });
    Route::resource('setting', 'Admin\SettingController');

});