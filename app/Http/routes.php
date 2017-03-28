<?php

/*
 * 资源路由方法restful
    //GET /photo index photo.index                  索引
    //GET /photo/create create photo.create         创建
    //POST /photo store photo.store                 保存
    //GET /photo/{photo} show photo.show            显示
    //GET /photo/{photo}/edit edit photo.edit       编辑
    //PUT/PATCH /photo/{photo} update photo.update  更新
    //DELETE /photo/{photo} destroy photo.destroy   删除
*/
Route::get('phpinfo', function () {
    echo phpinfo();
});


Route::get('/', function () {
    return redirect()->to('/index');
});


// 保存图片
//Route::any('/upload', ['as' => 'upload', 'uses' => 'Common\UploadController@saveImg']);

// 登录模块
Route::auth();
Route::post('login', 'Auth\AuthController@postLogin'); // 重写登录方法

// 前台路由组
Route::group(['middleware' => ['web', 'auth']], function () {
    Route::get('index', ['as' => 'index', 'uses' => 'Home\IndexController@index']);
    Route::resource('user', 'Home\UserController');
    Route::resource('company', 'Home\CompanyController');
    Route::resource('template', 'Home\TemplateController');
    Route::resource('contact', 'Home\ContactController');
    Route::resource('employee', 'Home\EmployeeController');
});

// 后台管理界面
Route::group(['prefix' => 'admin', 'middleware' => 'auth'], function () {

    // 首页
    Route::get('/', ['as' => 'admin', function () {
        return redirect()->route('admin.index');
    }]);
    Route::get('index', ['as' => 'admin.index', 'uses' => 'Admin\IndexController@index']);


    Route::group(['prefix' => 'user'], function () { // 用户管理-补充
        Route::delete('batch', ['as' => 'user.batchDestroy', 'uses' => 'Admin\UserController@batchDestroy']);
    });
    Route::resource('user', 'Admin\UserController'); // 用户管理
    Route::resource('company', 'Admin\CompanyController'); // 公司管理
    Route::resource('template', 'Admin\TemplateController'); // 模板管理
    Route::group(['prefix' => 'manager'], function () { // 客服管理-补充
        Route::get('{id}/role', ['as' => 'admin.manager.role', 'uses' => 'Admin\ManagerController@getRole']);
        Route::post('{id}/role', ['as' => 'admin.manager.setRole', 'uses' => 'Admin\ManagerController@postRole']);
        Route::get('{id}/permission', ['as' => 'admin.manager.permission', 'uses' => 'Admin\ManagerController@getPermission']);
        Route::post('{id}/permission', ['as' => 'admin.manager.setPermission', 'uses' => 'Admin\ManagerController@postPermission']);
    });
    Route::resource('manager', 'Admin\ManagerController'); // 客服管理
    Route::resource('role', 'Admin\RoleController'); // 角色管理
    Route::resource('permission', 'Admin\PermissionController'); // 权限管理

    // 设置
    Route::group(['prefix' => 'setting'], function () {
        Route::any('/', ['as' => 'admin.setting.index', 'uses' => 'Admin\SettingController@index']);
        Route::any('/safety', ['as' => 'admin.setting.safety', 'uses' => 'Admin\SettingController@safety']);
        Route::any('/person', ['as' => 'admin.setting.person', 'uses' => 'Admin\SettingController@person']);

    });

});