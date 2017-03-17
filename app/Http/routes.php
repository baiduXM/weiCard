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

//Route::group(['prefix' => 'upload'], function () {
//
//});
// 保存图片
Route::any('/upload', ['as' => 'upload', 'uses' => 'Common\UploadController@saveImg']);

// 前台登录
Route::auth();
// 覆盖登录、注册模块
Route::get('login', 'Auth\AuthController@getLogin');
Route::post('login', 'Auth\AuthController@postLogin');
Route::get('register', 'Auth\AuthController@getRegister');
Route::post('register', 'Auth\AuthController@postRegister');
Route::get('logout', function () {
    Auth::logout();
    return redirect()->to('/index');
});




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

    // 用户管理
    Route::resource('user', 'Admin\UserController');

    // 公司管理
    Route::resource('company', 'Admin\CompanyController');

    // 模板管理
    Route::resource('template', 'Admin\TemplateController');

    // 客服管理
    Route::group(['prefix' => 'manager'], function () {
        Route::match(['get', 'post'], '{id}/role', ['as' => 'admin.manager.role', 'uses' => 'Admin\ManagerController@setRole']);
        Route::match(['get', 'post'], '{id}/permission', ['as' => 'admin.manager.permission', 'uses' => 'Admin\ManagerController@setPermission']);
    });
    Route::resource('manager', 'Admin\ManagerController');
    // 角色管理
    Route::resource('role', 'Admin\RoleController');
    // 权限管理
    Route::resource('permission', 'Admin\PermissionController');

    // 设置
    Route::group(['prefix' => 'setting'], function () {
        Route::any('/', ['as' => 'admin.setting.index', 'uses' => 'Admin\SettingController@index']);
        Route::any('/safety', ['as' => 'admin.setting.safety', 'uses' => 'Admin\SettingController@safety']);
        Route::any('/person', ['as' => 'admin.setting.person', 'uses' => 'Admin\SettingController@person']);

    });

});