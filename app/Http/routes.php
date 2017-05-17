<?php

/* server information */
Route::get('phpinfo', function () {
    echo phpinfo();
});

/* 默认首页 */
Route::get('/', function () {
    return redirect()->to('user');
});

/* 前台登录 */
Route::auth();
Route::get('login', 'Auth\AuthController@getLogin'); // 重写登录方法
Route::post('login', 'Auth\AuthController@postLogin'); // 重写登录方法

/* 第三方登录 */
Route::group(['prefix' => 'oauth'], function () {
    # 用户点击登录按钮时请求的地址
    Route::get('{driver}', 'Auth\AuthController@redirectToProvider');
    # 接口回调地址
    Route::get('{driver}/callback', 'Auth\AuthController@handleProviderCallback');
});

/* 后台登录 */
Route::get('admin/login', 'Admin\AuthController@getLogin');
Route::post('admin/login', 'Admin\AuthController@postLogin');
Route::get('admin/register', 'Admin\AuthController@getRegister');
Route::post('admin/register', 'Admin\AuthController@postRegister');
Route::get('admin/logout', 'Admin\AuthController@logout');

/* 名片预览展示 */
Route::any('cardview', ['as' => 'cardview', 'uses' => 'Home\IndexController@cardview']);
Route::any('errorview', ['as' => 'errorview', 'uses' => 'Home\IndexController@errorview']);

/* =====用户界面===== */

/*
 * user
 *
 * cardcase
 * cardcase/tag
 *
 * company
 * company/department
 * company/position
 * company/employee
 *
 * template
 *
 * security
 *
 */

Route::group(['middleware' => 'auth'], function () {

    /* 首页 */
    Route::get('index', ['as' => 'index', 'uses' => 'Home\UserController@index']);
    //Route::any('preview', ['as' => 'preview', 'uses' => 'Home\IndexController@preview']);

    /* 用户中心 */
    Route::get('user', ['as' => 'user.index', 'uses' => 'Home\UserController@index']);
    Route::get('user/edit', ['as' => 'user.edit', 'uses' => 'Home\UserController@edit']);
    Route::put('user', ['as' => 'user.update', 'uses' => 'Home\UserController@update']);
    Route::match(['get', 'post'], 'user/binding', ['as' => 'user.binding', 'uses' => 'Home\UserController@binding']);
    Route::delete('user/binding', ['as' => 'user.unbinding', 'uses' => 'Home\UserController@unbinding']);

    /* 我的公司 */
    Route::get('company', ['as' => 'company.index', 'uses' => 'Home\CompanyController@index']);
    Route::put('company', ['as' => 'company.update', 'uses' => 'Home\CompanyController@update']);

    Route::group(['prefix' => 'company'], function () {
        /* 我的公司->员工 */
        Route::get('employee', ['as' => 'company.employee.index', 'uses' => 'Home\EmployeeController@index']);
        Route::post('employee', ['as' => 'company.employee.store', 'uses' => 'Home\EmployeeController@store']);
        Route::get('employee/{id}', ['as' => 'company.employee.show', 'uses' => 'Home\EmployeeController@show']);
//        Route::put('employee/{id}', ['as' => 'company.employee.update', 'uses' => 'Home\EmployeeController@update']);
        Route::post('employee/{id}', ['as' => 'company.employee.update', 'uses' => 'Home\EmployeeController@update']);
        Route::delete('employee/{id}', ['as' => 'company.employee.destroy', 'uses' => 'Home\EmployeeController@destroy']);
        /* 我的公司->部门 */
        Route::get('department', ['as' => 'company.department.index', 'uses' => 'Home\DepartmentController@index']);
    });

    /* 名片夹 */
    Route::get('cardcase', ['as' => 'cardcase.index', 'uses' => 'Home\CardcaseController@index']);
//    Route::get('cardshow/{id}', ['as' => 'cardcase.index', 'uses' => 'Home\CardcaseController@cardshow']);
    Route::match(['get', 'post'], 'cardcase/follow/{params}', ['as' => 'cardcase.follow', 'uses' => 'Home\CardcaseController@follow']);
    /* 名片夹->标签 */
    Route::group(['prefix' => 'cardcase'], function () {
        Route::get('tag', ['as' => 'tag.index', 'uses' => 'Home\TagController@index']);
    });

    /* 模板中心 */
    Route::resource('template', 'Home\TemplateController');
    Route::match(['get', 'post'], 'template/change/{params}', ['as' => 'template.change', 'uses' => 'Home\TemplateController@change']);

    /* 安全中心 */
    Route::group(['prefix' => 'security'], function () {
        /* 安全中心->验证邮箱 */
        Route::get('email', ['as' => 'security.email', 'uses' => 'Home\SecurityController@email']);
        Route::post('email', ['as' => 'security.postEmail', 'uses' => 'Home\SecurityController@postEmail']);
        /* 安全中心->绑定第三方 */
        Route::get('binding/{param?}', ['as' => 'security.binding', 'uses' => 'Home\SecurityController@binding']);
//        Route::get('binding/{param}', ['as' => 'security.postBinding', 'uses' => 'Home\SecurityController@postBinding']);
        /* 安全中心->修改密码 */
        Route::get('password', ['as' => 'security.password', 'uses' => 'Home\SecurityController@password']);
        Route::any('postpassword', ['as' => 'security.postpassword', 'uses' => 'Home\SecurityController@postpassword']);
    });
    Route::resource('security', 'Home\SecurityController');

});

/* =====后台管理界面===== */
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
/*
 * admin/user
 * admin/user_cardcase/?user_id=
 * admin/user_tag/?user_id=
 *
 * admin/company
 * admin/company_department/?company_id=
 * admin/company_position/?company_id=
 * admin/company_employee/?company_id=
 *
 * admin/template
 * admin/template_tag/?template_id=
 *
 * admin/manager
 *
 * admin/setting
 * admin/setting/safety
 * admin/setting/person
 *
 */

Route::group(['prefix' => 'admin', 'middleware' => 'auth:admin'], function () {

    /* 首页 */
    Route::get('/', ['as' => 'admin', function () {
        return redirect()->route('admin.index');
    }]);
    Route::get('index', ['as' => 'admin.index', 'uses' => 'Admin\IndexController@index']);

    /* 用户管理 */
    Route::group(['prefix' => 'user'], function () {
        Route::delete('batch', ['as' => 'admin.user.batchDestroy', 'uses' => 'Admin\UserController@batchDestroy']);
        Route::post('{id}/binding', ['as' => 'admin.user.binding', 'uses' => 'Admin\UserController@binding']);
        Route::delete('{id}/binding', ['as' => 'admin.user.unbinding', 'uses' => 'Admin\UserController@unbinding']);
    });
    Route::resource('user', 'Admin\UserController');

    /* 名片夹管理 */
    Route::resource('user_cardcase', 'Admin\CardcaseController');

    /* 标签管理 */
    Route::resource('user_tag', 'Admin\TagController');

    /* 公司管理 */
    Route::group(['prefix' => 'company'], function () {
        Route::delete('batch', ['as' => 'admin.company.batchDestroy', 'uses' => 'Admin\CompanyController@batchDestroy']);
        Route::get('{id}/verified', ['as' => 'admin.company.verified', 'uses' => 'Admin\CompanyController@getVerified']);
        Route::post('{id}/verified', ['as' => 'admin.company.postVerified', 'uses' => 'Admin\CompanyController@postVerified']);
        Route::post('{id}/binding', ['as' => 'admin.company.binding', 'uses' => 'Admin\CompanyController@binding']);
    });
    Route::resource('company', 'Admin\CompanyController');

    /* 部门管理 */
    Route::resource('company_department', 'Admin\DepartmentController');

    /* 职位管理 */
    Route::resource('company_position', 'Admin\PositionController');

    /* 员工管理 */
    Route::resource('company_employee', 'Admin\EmployeeController');
    Route::group(['prefix' => 'company_employee'], function () {
        Route::delete('batch', ['as' => 'admin.company.batchDestroy', 'uses' => 'Admin\EmployeeController@batchDestroy']);
    });

    /* 模板管理 */
    Route::resource('template', 'Admin\TemplateController');
    Route::group(['prefix' => 'template'], function () {
        Route::any('uploadtem', ['as' => 'admin.template.uploadtem', 'uses' => 'Admin\TemplateController@uploadtem']);
    });

    /* 标签管理 */
    Route::resource('template_tag', 'Admin\TagController');

    /* 客服管理 */
    Route::resource('manager', 'Admin\ManagerController');
    Route::group(['prefix' => 'manager'], function () {
        Route::get('{id}/role', ['as' => 'admin.manager.role', 'uses' => 'Admin\ManagerController@getRole']);
        Route::post('{id}/role', ['as' => 'admin.manager.setRole', 'uses' => 'Admin\ManagerController@postRole']);
        Route::get('{id}/permission', ['as' => 'admin.manager.permission', 'uses' => 'Admin\ManagerController@getPermission']);
        Route::post('{id}/permission', ['as' => 'admin.manager.setPermission', 'uses' => 'Admin\ManagerController@postPermission']);
    });

    /* 设置 */
    Route::resource('setting', 'Admin\SettingController');
    Route::group(['prefix' => 'setting'], function () {
        Route::any('/safety', ['as' => 'admin.setting.safety', 'uses' => 'Admin\SettingController@safety']);
        Route::any('/person', ['as' => 'admin.setting.person', 'uses' => 'Admin\SettingController@person']);
    });

});