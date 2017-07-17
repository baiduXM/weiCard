<?php
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

/* server information */
Route::get('phpinfo', function () {
    echo phpinfo();
});

/* 默认首页 */
Route::get('/', function () {
    return redirect()->to('user');
});


/* 前台登录 */

// Authentication Routes...
Route::get('qrcode', 'Common\HomeController@showQrcode');
Route::get('login', 'Auth\HomeAuthController@getLogin');
Route::post('login', 'Auth\HomeAuthController@postLogin');
Route::get('logout', 'Auth\HomeAuthController@logout');

// Registration Routes...
Route::get('register', 'Auth\HomeAuthController@showRegistrationForm');
Route::post('register', 'Auth\HomeAuthController@register');

// Password Reset Routes...
Route::get('password/reset/{token?}', 'Auth\PasswordController@showResetForm');
Route::post('password/email', 'Auth\PasswordController@sendResetLinkEmail');
Route::post('password/reset', 'Auth\PasswordController@reset');

/* 第三方登录 */
Route::group(['prefix' => 'oauth'], function () {
    # 用户点击登录按钮时请求的地址
    Route::get('{driver}', 'Auth\HomeAuthController@redirectToProvider');
    # 接口回调地址
    Route::get('{driver}/callback', 'Auth\HomeAuthController@handleProviderCallback');
});

/* 后台登录 */
Route::get('admin/login', 'Auth\AdminAuthController@getLogin');
Route::post('admin/login', 'Auth\AdminAuthController@postLogin');
Route::get('admin/register', 'Auth\AdminAuthController@getRegister');
Route::post('admin/register', 'Auth\AdminAuthController@postRegister');
Route::get('admin/logout', 'Auth\AdminAuthController@logout');

/* 名片预览展示 */
Route::get('cardview/{params}', ['as' => 'cardview', 'uses' => 'Common\HomeController@cardview']);
Route::any('errorview', ['as' => 'errorview', 'uses' => 'Common\HomeController@errorview']);
Route::get('companyinfo/{params}', ['as' => 'companyinfo', 'uses' => 'Common\HomeController@companyinfo']);

/* 文件下载 */
Route::get('download', ['as' => 'download', 'uses' => 'Common\Controller@download']);


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
/* ===Web端访问地址=== */
Route::group(['middleware' => ['auth', 'mobile']], function () {

    /* 首页 */
    Route::get('index', ['as' => 'index', 'uses' => 'Home\UserController@index']);

    /* 用户中心 */
    Route::get('user', ['as' => 'user.index', 'uses' => 'Home\UserController@index']);
    Route::get('user/edit', ['as' => 'user.edit', 'uses' => 'Home\UserController@edit']);
    Route::put('user', ['as' => 'user.update', 'uses' => 'Home\UserController@update']);
    Route::match(['get', 'post'], 'user/binding', ['as' => 'user.binding', 'uses' => 'Home\UserController@binding']);
    Route::delete('user/binding', ['as' => 'user.unbinding', 'uses' => 'Home\UserController@unbinding']);


    Route::group(['prefix' => 'company'], function () {
        /* 我的公司->员工 */
        Route::get('employee', ['as' => 'company.employee.index', 'uses' => 'Home\EmployeeController@index']);
        Route::post('employee', ['as' => 'company.employee.store', 'uses' => 'Home\EmployeeController@store']);
        Route::get('employee/trash', ['as' => 'company.employee.trash', 'uses' => 'Home\EmployeeController@trash']);
        Route::get('employee/update/{id?}', ['uses' => 'Common\HomeController@updatePositions']);
        Route::match(['get', 'post'], 'employee/import', ['as' => 'company.employee.import', 'uses' => 'Home\EmployeeController@import']);
        Route::get('employee/exportExcel', ['as' => 'company.employee.exportExcel', 'uses' => 'Home\EmployeeController@exportExcel']);
        Route::get('employee/exportQrcode', ['as' => 'company.employee.exportQrcode', 'uses' => 'Home\EmployeeController@exportQrcode']);
        Route::match(['get', 'post'], 'employee/download', ['as' => 'company.employee.download', 'uses' => 'Home\EmployeeController@download']);
        Route::delete('employee/batch', ['as' => 'company.employee.batchDestroy', 'uses' => 'Home\EmployeeController@batchDestroy']);
        Route::get('employee/{id}', ['as' => 'company.employee.show', 'uses' => 'Home\EmployeeController@show']);
        Route::post('employee/{id}', ['as' => 'company.employee.update', 'uses' => 'Home\EmployeeController@update']);
        Route::delete('employee/{id}', ['as' => 'company.employee.destroy', 'uses' => 'Home\EmployeeController@destroy']);
        Route::post('employee/{id}/recover', ['as' => 'company.employee.recover', 'uses' => 'Home\EmployeeController@recover']);
        Route::delete('employee/{id}/forceDelete', ['as' => 'company.employee.forceDelete', 'uses' => 'Home\EmployeeController@forceDelete']);


        /* 我的公司->部门 */
        Route::resource('department', 'Home\DepartmentController');
//        Route::get('department', ['as' => 'company.department.index', 'uses' => 'Home\DepartmentController@index']);
//        Route::get('department/{id}', ['as' => 'company.department.show', 'uses' => 'Home\DepartmentController@show']);
//        Route::put('department/{id}', ['as' => 'company.department.update', 'uses' => 'Home\DepartmentController@update']);
//        Route::delete('department/{id}', ['as' => 'company.department.destroy', 'uses' => 'Home\DepartmentController@destroy']);

        /* 我的公司->公司产品 */
        Route::get('product', ['as' => 'company.product.index', 'uses' => 'Home\ProductController@index']);
        Route::post('product', ['as' => 'company.product.store', 'uses' => 'Home\ProductController@store']);
        Route::get('product/{id}', ['as' => 'company.product.show', 'uses' => 'Home\ProductController@show']);
        Route::post('product/{id}', ['as' => 'company.product.update', 'uses' => 'Home\ProductController@update']);
        Route::delete('product/{id}', ['as' => 'company.product.destroy', 'uses' => 'Home\ProductController@destroy']);
        Route::any('productlink', ['as' => 'company.product.productlink', 'uses' => 'Home\ProductController@productlink']);

        /* 我的公司->微链接 */
        Route::get('link', ['as' => 'company.link.index', 'uses' => 'Home\LinkController@index']);
        Route::post('link', ['as' => 'company.link.store', 'uses' => 'Home\LinkController@store']);
        Route::get('link/{id}', ['as' => 'company.link.show', 'uses' => 'Home\LinkController@show']);
        Route::post('link/{id}', ['as' => 'company.link.update', 'uses' => 'Home\LinkController@update']);
        Route::delete('link/{id}', ['as' => 'company.link.destroy', 'uses' => 'Home\LinkController@destroy']);

        /* 我的公司->公司职位 */
        Route::get('position', ['as' => 'company.position.index', 'uses' => 'Home\PositionController@index']);
        Route::post('position', ['as' => 'company.position.store', 'uses' => 'Home\PositionController@store']);
        Route::get('position/{id}', ['as' => 'company.position.show', 'uses' => 'Home\PositionController@show']);
        Route::post('position/{id}', ['as' => 'company.position.update', 'uses' => 'Home\PositionController@update']);
        Route::delete('position/{id}', ['as' => 'company.position.destroy', 'uses' => 'Home\PositionController@destroy']);
    });
    /* 我的公司 */
    Route::get('company', ['as' => 'company.index', 'uses' => 'Home\CompanyController@index']);
    Route::put('company', ['as' => 'company.update', 'uses' => 'Home\CompanyController@update']);
    Route::post('company/binding', ['as' => 'company.binding', 'uses' => 'Home\CompanyController@binding']);
    Route::resource('company', 'Home\CompanyController');


    /* 名片夹->分组 */
    Route::get('cardcase/group/{id}', ['as' => 'cardcase.group.show', 'uses' => 'Home\GroupController@show']);
    Route::put('cardcase/group/{id}', ['as' => 'cardcase.group.update', 'uses' => 'Home\GroupController@update']);
    Route::delete('cardcase/group/{id}', ['as' => 'cardcase.group.destroy', 'uses' => 'Home\GroupController@destroy']);
    Route::get('cardcase/group', ['as' => 'cardcase.group.index', 'uses' => 'Home\GroupController@index']);
    Route::post('cardcase/group', ['as' => 'cardcase.group.store', 'uses' => 'Home\GroupController@store']);

    /* 名片夹 */
    Route::get('cardcase/move/{id}', ['as' => 'cardcase.move', 'uses' => 'Home\CardcaseController@move']);
    Route::put('cardcase/move/{id}', ['as' => 'cardcase.move', 'uses' => 'Home\CardcaseController@move']);
    Route::get('cardcase/show/{type?}', ['as' => 'cardcase.show', 'uses' => 'Home\CardcaseController@show']);
    Route::get('cardcase/follow/{params}', ['as' => 'cardcase.follow', 'uses' => 'Home\CardcaseController@follow']);
    Route::post('cardcase/follow/{params}', ['as' => 'cardcase.follow', 'uses' => 'Home\CardcaseController@follow']);
    Route::get('cardcase/unfollow/{params}', ['as' => 'cardcase.unfollow', 'uses' => 'Home\CardcaseController@unfollow']);
    Route::post('cardcase/unfollow/{params}', ['as' => 'cardcase.unfollow', 'uses' => 'Home\CardcaseController@unfollow']);
    Route::delete('cardcase/{id}', ['as' => 'cardcase.destroy', 'uses' => 'Home\CardcaseController@destroy']);
    Route::get('cardcase/{id}', ['as' => 'cardcase.ajaxshow', 'uses' => 'Home\CardcaseController@ajaxshow']); // 放到cardcase路由组的最后
    Route::get('cardcase', ['as' => 'cardcase.index', 'uses' => 'Home\CardcaseController@index']);

    /* 模板中心 */
    Route::get('template/type/{type?}', ['as' => 'template.index', 'uses' => 'Home\TemplateController@index']);
    Route::match(['get', 'post'], 'template/change/{params}', ['as' => 'template.change', 'uses' => 'Home\TemplateController@change']);
    Route::get('template/mobile-change', ['as' => 'template.mindex', 'uses' => 'Home\TemplateController@mindex']);
    Route::match(['get', 'post'], 'template/change-u/{params}', ['as' => 'template.change-u', 'uses' => 'Home\TemplateController@uchange']);
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
//        Route::delete('{id}/binding', ['as' => 'admin.user.unbinding', 'uses' => 'Admin\UserController@unbinding']);
    });
    Route::resource('user', 'Admin\UserController');

    /* 名片夹管理 */
    Route::group(['prefix' => 'user_cardcase'], function () {
        Route::match(['get', 'post'], 'set', ['as' => 'admin.cardcase.set', 'uses' => 'Admin\CardcaseController@setTag']);
    });
    Route::resource('user_cardcase', 'Admin\CardcaseController');
    /* 群管理 */
    Route::resource('user_group', 'Admin\GroupController');
    /* 标签管理 */
    Route::group(['prefix' => 'user_tag'], function () {
        Route::delete('batch', ['as' => 'admin.tag.batchDestroy', 'uses' => 'Admin\TagController@batchDestroy']);
    });
    Route::resource('user_tag', 'Admin\TagController');

    /* 公司管理 */
    Route::group(['prefix' => 'company'], function () {
        Route::delete('batch', ['as' => 'admin.company.batchDestroy', 'uses' => 'Admin\CompanyController@batchDestroy']);
        Route::get('{id}/verified', ['as' => 'admin.company.verified', 'uses' => 'Admin\CompanyController@getVerified']);
        Route::post('{id}/verified', ['as' => 'admin.company.postVerified', 'uses' => 'Admin\CompanyController@postVerified']);
        Route::delete('{id}/unbinding', ['as' => 'admin.company.unbinding', 'uses' => 'Admin\CompanyController@unbinding']);
        Route::post('{id}/login', ['as' => 'admin.company.login', 'uses' => 'Admin\CompanyController@loginByCompany']);
    });
    Route::resource('company', 'Admin\CompanyController');

    /* 部门管理 */
    Route::delete('company_department/batch', ['as' => 'admin.department.batchDestroy', 'uses' => 'Admin\DepartmentController@batchDestroy']);
    Route::resource('company_department', 'Admin\DepartmentController');

    /* 员工管理 */
    Route::delete('company_employee/trash/batch', ['as' => 'admin.employee.batchDestroy', 'uses' => 'Admin\EmployeeController@batchDestroy']);
    Route::resource('company_employee/trash', 'Admin\EmployeeController');

    Route::delete('company_employee/batch', ['as' => 'admin.employee.batchDestroy', 'uses' => 'Admin\EmployeeController@batchDestroy']);
    Route::delete('company_employee/{id}/unbinding', ['as' => 'admin.employee.unbinding', 'uses' => 'Admin\EmployeeController@unbinding']);
    Route::post('company_employee/{id}/recover', ['as' => 'admin.employee.recover', 'uses' => 'Admin\EmployeeController@recover']);
    Route::resource('company_employee', 'Admin\EmployeeController');

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


