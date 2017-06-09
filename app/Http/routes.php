<?php

/* server information */
Route::get('phpinfo', function () {
    echo phpinfo();
});
Route::get('test', 'Admin\IndexController@test'); // 测试方法

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
Route::get('cardview/{params}', ['as' => 'cardview', 'uses' => 'Home\IndexController@cardview']);
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
        Route::match(['get', 'post'], 'employee/import', ['as' => 'company.employee.import', 'uses' => 'Home\EmployeeController@import']);
        Route::match(['get', 'post'], 'employee/export', ['as' => 'company.employee.export', 'uses' => 'Home\EmployeeController@export']);
        Route::match(['get', 'post'], 'employee/download', ['as' => 'company.employee.download', 'uses' => 'Home\EmployeeController@download']);
//        Route::post('employee/import', ['as' => 'company.employee.import', 'uses' => 'Home\EmployeeController@import']);
        Route::get('employee/{id}', ['as' => 'company.employee.show', 'uses' => 'Home\EmployeeController@show']);
//        Route::put('employee/{id}', ['as' => 'company.employee.update', 'uses' => 'Home\EmployeeController@update']);
        Route::post('employee/{id}', ['as' => 'company.employee.update', 'uses' => 'Home\EmployeeController@update']);
        Route::delete('employee/{id}', ['as' => 'company.employee.destroy', 'uses' => 'Home\EmployeeController@destroy']);
        /* 我的公司->部门 */
        Route::get('department', ['as' => 'company.department.index', 'uses' => 'Home\DepartmentController@index']);
        /* 我的公司->公司产品 */
        Route::get('product', ['as' => 'company.product.index', 'uses' => 'Home\ProductController@index']);
        Route::post('product', ['as' => 'company.product.store', 'uses' => 'Home\ProductController@store']);
        Route::get('product/{id}', ['as' => 'company.product.show', 'uses' => 'Home\ProductController@show']);
        Route::post('product/{id}', ['as' => 'company.product.update', 'uses' => 'Home\ProductController@update']);
        Route::delete('product/{id}', ['as' => 'company.product.destroy', 'uses' => 'Home\ProductController@destroy']);
        /* 我的公司->公司职位 */
        Route::get('position', ['as' => 'company.position.index', 'uses' => 'Home\PositionController@index']);
        Route::post('position', ['as' => 'company.position.store', 'uses' => 'Home\PositionController@store']);
        Route::get('position/{id}', ['as' => 'company.position.show', 'uses' => 'Home\PositionController@show']);
        Route::post('position/{id}', ['as' => 'company.position.update', 'uses' => 'Home\PositionController@update']);
        Route::delete('position/{id}', ['as' => 'company.position.destroy', 'uses' => 'Home\PositionController@destroy']);
    });

    /* 名片夹 */
    Route::get('cardcase', ['as' => 'cardcase.index', 'uses' => 'Home\CardcaseController@index']);
    Route::get('cardcase/show/{type?}', ['as' => 'cardcase.show', 'uses' => 'Home\CardcaseController@show']);
    Route::match(['get', 'post'], 'cardcase/follow/{params}', ['as' => 'cardcase.follow', 'uses' => 'Home\CardcaseController@follow']);
    Route::match(['get', 'post'], 'cardcase/unfollow/{params}', ['as' => 'cardcase.unfollow', 'uses' => 'Home\CardcaseController@unfollow']);
    /* 名片夹->标签 */
//    Route::group(['prefix' => 'cardcase'], function () {
//        Route::get('tag', ['as' => 'tag.index', 'uses' => 'Home\TagController@index']);
//    });

    /* 模板中心 */
    Route::get('template/type/{type?}', ['as' => 'template.index', 'uses' => 'Home\TemplateController@index']);
    Route::match(['get', 'post'], 'template/change/{params}', ['as' => 'template.change', 'uses' => 'Home\TemplateController@change']);
//    Route::resource('template', 'Home\TemplateController');

    /* 安全中心 */
    Route::group(['prefix' => 'security'], function () {
        /* 安全中心->验证邮箱 */
        Route::get('email', ['as' => 'security.email', 'uses' => 'Home\SecurityController@email']);
        Route::post('email', ['as' => 'security.postEmail', 'uses' => 'Home\SecurityController@postEmail']);

        /* 安全中心->绑定第三方 */
        Route::get('binding/{driver?}', ['as' => 'security.binding', 'uses' => 'Home\SecurityController@binding']);
        Route::get('binding/{driver}/callback', 'Home\SecurityController@bindingCallback');

        /* 安全中心->修改密码 */
        Route::get('password', ['as' => 'security.password', 'uses' => 'Home\SecurityController@password']);
        Route::any('postpassword', ['as' => 'security.postpassword', 'uses' => 'Home\SecurityController@postpassword']);
    });
    Route::resource('security', 'Home\SecurityController');

});

/* =====后台管理界面===== */
/*
 * 资源路由方法restful
 * GET          /photo                  index       photo.index     索引
 * GET          /photo/create           create      photo.create    创建
 * POST         /photo                  store       photo.store     保存
 * GET          /photo/{photo}          show        photo.show      显示
 * GET          /photo/{photo}/edit     edit        photo.edit      编辑
 * PUT/PATCH    /photo/{photo}          update      photo.update    更新
 * DELETE       /photo/{photo}          destroy     photo.destroy   删除
 */
/*
 * admin/user 用户管理
 * admin/user_cardcase/?user_id= 名片夹管理
 * admin/user_group/?user_id= 名片群管理
 * admin/user_tag/?user_id= 用户标签管理
 *
 * admin/company 公司管理
 * admin/company_department/?company_id= 部门管理
 * admin/company_position/?company_id= 职务管理
 * admin/company_employee/?company_id= 员工管理
 *
 * admin/template 模板管理
 * admin/template_tag/?template_id= 模板标签管理
 *
 * admin/manager 客服管理
 *
 * admin/setting 系统设置
 * admin/setting/safety 安全设置
 * admin/setting/person 个人设置
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
        Route::get('{id}/refresh', ['as' => 'admin.user.refresh', 'uses' => 'Admin\UserController@refresh']);
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

    /* 员工管理 */
    Route::resource('company_employee', 'Admin\EmployeeController');
    Route::post('company_employee/drop', ['as' => 'admin.employee.drop', 'uses' => 'Admin\EmployeeController@drop']);
    Route::group(['prefix' => 'company_employee'], function () {
        Route::delete('batch', ['as' => 'admin.employee.batchDestroy', 'uses' => 'Admin\EmployeeController@batchDestroy']);
    });

    /* 职位管理 */
    Route::group(['prefix' => 'company_position'], function () {
        Route::delete('batch', ['as' => 'admin.position.batchDestroy', 'uses' => 'Admin\PositionController@batchDestroy']);
    });
    Route::resource('company_position', 'Admin\PositionController');

    /* 产品管理 */
    Route::group(['prefix' => 'company_product'], function () {
        Route::delete('batch', ['as' => 'admin.product.batchDestroy', 'uses' => 'Admin\ProductController@batchDestroy']);
    });
    Route::resource('company_product', 'Admin\ProductController');

    /* 模板管理 */
    Route::group(['prefix' => 'template'], function () {
        Route::delete('batch', ['as' => 'admin.template.batchDestroy', 'uses' => 'Admin\TemplateController@batchDestroy']);
    });
    Route::resource('template', 'Admin\TemplateController');

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