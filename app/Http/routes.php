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

// 用户注册
Route::get('register', 'Auth\HomeAuthController@showRegistrationForm');
Route::post('register', 'Auth\HomeAuthController@register');

// 用户修改密码
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
Route::get('mpmanager/login', ['as' => 'mpmanager.login', 'uses' => 'Auth\AdminAuthController@getLogin']);
Route::post('mpmanager/login', 'Auth\AdminAuthController@postLogin');
Route::get('mpmanager/register', ['as' => 'mpmanager.register', 'uses' => 'Auth\AdminAuthController@getRegister']);
Route::post('mpmanager/register', 'Auth\AdminAuthController@postRegister');
Route::get('mpmanager/logout', 'Auth\AdminAuthController@logout');

// 管理员修改密码
Route::get('mpmanager/password/reset/{token?}', 'Auth\PasswordController@showResetForm');
Route::post('mpmanager/password/email', 'Auth\PasswordController@sendResetLinkEmail');
Route::post('mpmanager/password/reset', 'Auth\PasswordController@reset');

/* 名片预览展示 */
Route::get('viewcard/{id?}', ['as' => 'viewcard', 'uses' => 'Common\HomeController@viewCard']);// new 预览名片
Route::get('cardview/{params}', ['as' => 'cardview', 'uses' => 'Common\HomeController@cardview']);
Route::any('errorview', ['as' => 'errorview', 'uses' => 'Common\HomeController@errorview']);
Route::get('companyinfo/{params}', ['as' => 'companyinfo', 'uses' => 'Common\HomeController@companyinfo']);
Route::get('invoice/{params}', ['as' => 'invoice', 'uses' => 'Common\HomeController@invoice']);

/* 文件下载 */
Route::get('download', ['as' => 'download', 'uses' => 'Common\Controller@download']);

/* 案例展示 */
Route::get('demo', ['as' => 'demo', 'uses' => 'Common\Controller@demo']);
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
    Route::post('userAjax/unfollow', ['as' => 'user.unfollowAjax', 'uses' => 'Home\UserController@unfollowAjax']);
    Route::post('userAjax/follow', ['as' => 'user.followAjax', 'uses' => 'Home\UserController@followAjax']);
    Route::post('userAjax/follows', ['as' => 'user.followsAjax', 'uses' => 'Home\UserController@followsAjax']);

    Route::post('user/follow/{id}', ['as' => 'user.follow', 'uses' => 'Home\UserController@follow']);
    Route::post('user/unfollow/{id?}', ['as' => 'user.unfollow', 'uses' => 'Home\UserController@unfollow']);
    Route::delete('user/binding', ['as' => 'user.unbinding', 'uses' => 'Home\UserController@unbinding']);
    Route::get('user/qrcode', ['as' => 'user.qrcode', 'uses' => 'Home\UserController@qrcode']);
    Route::put('user/qrcode', ['as' => 'user.changqrcode', 'uses' => 'Home\UserController@changeqrcode']);
    Route::get('user/delqrcode', ['as' => 'user.delqrcode', 'uses' => 'Home\UserController@delqrcode']);
    Route::get('user/avatar', ['as' => 'user.avatar', 'uses' => 'Home\UserController@updateavatar']);
    Route::put('user/avatar', ['as' => 'user.changavatar', 'uses' => 'Home\UserController@changeavatar']);
    Route::get('user/edit', ['as' => 'user.edit', 'uses' => 'Home\UserController@edit']);
    Route::match(['get', 'post'], 'user/binding', ['as' => 'user.binding', 'uses' => 'Home\UserController@binding']);
    Route::get('user', ['as' => 'user.index', 'uses' => 'Home\UserController@index']);
    Route::put('user', ['as' => 'user.update', 'uses' => 'Home\UserController@update']);


    Route::group(['prefix' => 'company'], function () {
        /* 我的公司->员工 */
        Route::get('employee', ['as' => 'company.employee.index', 'uses' => 'Home\EmployeeController@index']);
        Route::post('employee', ['as' => 'company.employee.store', 'uses' => 'Home\EmployeeController@store']);
        Route::get('employee/trash', ['as' => 'company.employee.trash', 'uses' => 'Home\EmployeeController@trash']);
        Route::get('employee/update/{id?}', ['uses' => 'Common\HomeController@updatePositions']);
        Route::match(['get', 'post'], 'employee/import', ['as' => 'company.employee.import', 'uses' => 'Home\EmployeeController@import']);
        Route::match(['get', 'post'], 'employee/download', ['as' => 'company.employee.download', 'uses' => 'Home\EmployeeController@download']);
        Route::get('employee/exportExcel/{type?}', ['as' => 'company.employee.exportExcel', 'uses' => 'Home\EmployeeController@exportExcel']);
        Route::get('employee/exportQrcode', ['as' => 'company.employee.exportQrcode', 'uses' => 'Home\EmployeeController@exportQrcode']);
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

        /* 我的公司->模板组 */
        Route::get('templategroup', ['as' => 'company.templategroup.index', 'uses' => 'Home\TemplategroupController@index']);
        Route::post('templategroup', ['as' => 'company.templategroup.store', 'uses' => 'Home\TemplategroupController@store']);
        Route::get('templategroup/{id}', ['as' => 'company.templategroup.show', 'uses' => 'Home\TemplategroupController@show']);
        Route::post('templategroup/{id}', ['as' => 'company.templategroup.update', 'uses' => 'Home\TemplategroupController@update']);
        Route::delete('templategroup/{id}', ['as' => 'company.templategroup.destroy', 'uses' => 'Home\TemplategroupController@destroy']);
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
    /* 我的公司->人脉圈 */
    Route::resource('contacts', 'Home\ContactsController');

    /* 名片夹->分组 */
    Route::delete('groupAjax', ['as' => 'group.destroyAjax', 'uses' => 'Home\GroupController@destroyAjax']);
    Route::post('groupAjax', ['as' => 'group.storeAjax', 'uses' => 'Home\GroupController@storeAjax']);
    Route::put('groupAjax', ['as' => 'group.updateAjax', 'uses' => 'Home\GroupController@updateAjax']);
    Route::any('group/rules', ['as' => 'group.rules', 'uses' => 'Home\GroupController@rules']);
    Route::delete('group/{id?}', ['as' => 'group.destroy', 'uses' => 'Home\GroupController@destroy']);
    Route::put('group/{id?}', ['as' => 'group.update', 'uses' => 'Home\GroupController@update']);
    Route::post('group', ['as' => 'group.store', 'uses' => 'Home\GroupController@store']);


    Route::get('cardcase/group/{id}', ['as' => 'cardcase.group.show', 'uses' => 'Home\GroupController@show']);
    Route::put('cardcase/group/{id}', ['as' => 'cardcase.group.update', 'uses' => 'Home\GroupController@update']);
    Route::delete('cardcase/group/{id}', ['as' => 'cardcase.group.destroy', 'uses' => 'Home\GroupController@destroy']);
    Route::get('cardcase/group', ['as' => 'cardcase.group.index', 'uses' => 'Home\GroupController@index']);
    Route::post('cardcase/group', ['as' => 'cardcase.group.store', 'uses' => 'Home\GroupController@store']);

    /* 名片夹->粉丝 */

    /* 名片夹 */
    Route::post('cardcaseAjax/move/{id}', ['as' => 'cardcase.moveAjax', 'uses' => 'Home\CardcaseController@moveAjax']);
    Route::put('cardcaseAjax/move', ['as' => 'cardcase.moveAjax', 'uses' => 'Home\CardcaseController@moveAjax']);
    Route::post('cardcaseAjax/unfollow', ['as' => 'cardcase.unfollowAjax', 'uses' => 'Home\CardcaseController@unfollowAjax']);
    Route::get('cardcaseAjax/mp', ['as' => 'cardcase.mpAjax', 'uses' => 'Home\CardcaseController@mpAjax']); // 名片夹
    Route::get('cardcaseAjax/getFollower', ['as' => 'cardcase.getFollowerAjax', 'uses' => 'Home\CardcaseController@getFollowerAjax']);
    Route::get('cardcaseAjax', ['as' => 'cardcase.indexAjax', 'uses' => 'Home\CardcaseController@indexAjax']);

    Route::get('cardcase/fans/{type?}', ['as' => 'cardcase.fans', 'uses' => 'Home\CardcaseController@fans']);
    Route::get('cardcase/mp', ['as' => 'cardcase.mp', 'uses' => 'Home\CardcaseController@mp']); // 名片夹
//    Route::get('cardcase/move/{id}', ['as' => 'cardcase.move', 'uses' => 'Home\CardcaseController@move']);
    Route::post('cardcase/move/{user_id?}', ['as' => 'cardcase.move', 'uses' => 'Home\CardcaseController@move']);
    Route::get('cardcase/show/{type?}', ['as' => 'cardcase.show', 'uses' => 'Home\CardcaseController@show']);
    Route::get('cardcase/follow/{params}', ['as' => 'cardcase.follow', 'uses' => 'Home\CardcaseController@follow']);
    Route::post('cardcase/follow/{params}', ['as' => 'cardcase.follow', 'uses' => 'Home\CardcaseController@follow']);
    Route::get('cardcase/unfollow/{params}', ['as' => 'cardcase.unfollow', 'uses' => 'Home\CardcaseController@unfollow']);
    Route::post('cardcase/unfollow/{params?}', ['as' => 'cardcase.unfollow', 'uses' => 'Home\CardcaseController@unfollow']);
    Route::get('cardcase/showuser/{id}', ['as' => 'cardcase.showuser', 'uses' => 'Home\CardcaseController@showuser']);
    Route::delete('cardcase/batch', ['as' => 'cardcase.batchDestroy', 'uses' => 'Home\CardcaseController@batchDestroy']);
    Route::delete('cardcase/{id}', ['as' => 'cardcase.destroy', 'uses' => 'Home\CardcaseController@destroy']);
    Route::get('cardcase/{id}', ['as' => 'cardcase.ajaxshow', 'uses' => 'Home\CardcaseController@ajaxshow']); // 放到cardcase路由组的最后
    Route::get('cardcase', ['as' => 'cardcase.index', 'uses' => 'Home\CardcaseController@index']); // 关注列表

    /* 名片圈 */
    Route::post('circleAjax/join', ['as' => 'circle.joinAjax', 'uses' => 'Home\CircleController@joinAjax']);
    Route::get('circleAjax/{id}', ['as' => 'circle.showAjax', 'uses' => 'Home\CircleController@showAjax']);
    Route::post('circleAjax', ['as' => 'circle.storeAjax', 'uses' => 'Home\CircleController@storeAjax']);
    Route::get('circleAjax', ['as' => 'circle.ajaxIndex', 'uses' => 'Home\CircleController@ajaxIndex']);
    Route::delete('circle/quit/{id?}', ['as' => 'circle.quit', 'uses' => 'Home\CircleController@quit']);
    Route::post('circle/join/{id?}', ['as' => 'circle.join', 'uses' => 'Home\CircleController@join']);
    Route::resource('circle', 'Home\CircleController');

    /* 模板中心 */
    Route::get('template/type/{type?}', ['as' => 'template.index', 'uses' => 'Home\TemplateController@index']);
    Route::match(['get', 'post'], 'template/change/{params}', ['as' => 'template.change', 'uses' => 'Home\TemplateController@change']);
    Route::get('template/mobile-change', ['as' => 'template.mindex', 'uses' => 'Home\TemplateController@mindex']);
    Route::get('template/com-template', ['as' => 'template.comtemplate', 'uses' => 'Home\TemplateController@comtemplate']);
    Route::match(['get', 'post'], 'template/change-u/{params}', ['as' => 'template.change-u', 'uses' => 'Home\TemplateController@uchange']);
    Route::match(['get', 'post'], 'template/change-e/{params}', ['as' => 'template.change-e', 'uses' => 'Home\TemplateController@echange']);
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

Route::group(['prefix' => 'mpmanager', 'middleware' => 'auth:admin'], function () {

    /* 首页 */
    Route::get('/', ['as' => 'mpmanager', function () {
        return redirect()->route('mpmanager.index');
    }]);
    Route::get('index', ['as' => 'mpmanager.index', 'uses' => 'Admin\IndexController@index']);

    /* 用户管理 */
    Route::group(['prefix' => 'user'], function () {
        Route::delete('batch', ['as' => 'mpmanager.user.batchDestroy', 'uses' => 'Admin\UserController@batchDestroy']);
        Route::post('{id}/binding', ['as' => 'mpmanager.user.binding', 'uses' => 'Admin\UserController@binding']);
        Route::get('{id}/refresh', ['as' => 'mpmanager.user.refresh', 'uses' => 'Admin\UserController@refresh']);
//        Route::delete('{id}/binding', ['as' => 'mpmanager.user.unbinding', 'uses' => 'Admin\UserController@unbinding']);
    });
    Route::resource('user', 'Admin\UserController');

    /* 名片夹管理 */
    Route::group(['prefix' => 'user_cardcase'], function () {
        Route::match(['get', 'post'], 'set', ['as' => 'mpmanager.cardcase.set', 'uses' => 'Admin\CardcaseController@setTag']);
    });
    Route::resource('user_cardcase', 'Admin\CardcaseController');
    /* 群管理 */
    Route::resource('user_group', 'Admin\GroupController');

    /* 标签管理 */
    Route::delete('user_tag/batch', ['as' => 'mpmanager.tag.batchDestroy', 'uses' => 'Admin\TagController@batchDestroy']);
    Route::resource('user_tag', 'Admin\TagController');

    /* 圈子 */
    Route::delete('user_circle/batch', ['as' => 'mpmanager.circle.batchDestroy', 'uses' => 'Admin\CircleController@batchDestroy']);
    Route::resource('user_circle', 'Admin\CircleController');

    /* 公司管理 */
    Route::group(['prefix' => 'company'], function () {
        Route::delete('batch', ['as' => 'mpmanager.company.batchDestroy', 'uses' => 'Admin\CompanyController@batchDestroy']);
        Route::get('{id}/verified', ['as' => 'mpmanager.company.verified', 'uses' => 'Admin\CompanyController@getVerified']);
        Route::post('{id}/verified', ['as' => 'mpmanager.company.postVerified', 'uses' => 'Admin\CompanyController@postVerified']);
        Route::delete('{id}/unbinding', ['as' => 'mpmanager.company.unbinding', 'uses' => 'Admin\CompanyController@unbinding']);
        Route::post('{id}/login', ['as' => 'mpmanager.company.login', 'uses' => 'Admin\CompanyController@loginByCompany']);
    });
    Route::resource('company', 'Admin\CompanyController');

    /* 部门管理 */
    Route::delete('company_department/batch', ['as' => 'mpmanager.department.batchDestroy', 'uses' => 'Admin\DepartmentController@batchDestroy']);
    Route::resource('company_department', 'Admin\DepartmentController');

    /* 员工管理 */
    Route::get('company_employee/exportExcel/{type?}', ['as' => 'mpmanager.employee.exportExcel', 'uses' => 'Admin\EmployeeController@exportExcel']);
    Route::delete('company_employee/trash/batch', ['as' => 'mpmanager.employee.batchDestroy', 'uses' => 'Admin\EmployeeController@batchDestroy']);
    Route::resource('company_employee/trash', 'Admin\EmployeeController');

    Route::delete('company_employee/batch', ['as' => 'mpmanager.employee.batchDestroy', 'uses' => 'Admin\EmployeeController@batchDestroy']);
    Route::delete('company_employee/{id}/unbinding', ['as' => 'mpmanager.employee.unbinding', 'uses' => 'Admin\EmployeeController@unbinding']);
    Route::post('company_employee/{id}/recover', ['as' => 'mpmanager.employee.recover', 'uses' => 'Admin\EmployeeController@recover']);
    Route::resource('company_employee', 'Admin\EmployeeController');

    /* 职位管理 */
    Route::group(['prefix' => 'company_position'], function () {
        Route::delete('batch', ['as' => 'mpmanager.position.batchDestroy', 'uses' => 'Admin\PositionController@batchDestroy']);
    });
    Route::resource('company_position', 'Admin\PositionController');

    /* 产品管理 */
    Route::group(['prefix' => 'company_product'], function () {
        Route::delete('batch', ['as' => 'mpmanager.product.batchDestroy', 'uses' => 'Admin\ProductController@batchDestroy']);
    });
    Route::resource('company_product', 'Admin\ProductController');

    /* 模板管理 */
    Route::group(['prefix' => 'template'], function () {
        Route::delete('batch', ['as' => 'mpmanager.template.batchDestroy', 'uses' => 'Admin\TemplateController@batchDestroy']);
    });
    Route::resource('template', 'Admin\TemplateController');

    /* 标签管理 */
    Route::resource('template_tag', 'Admin\TagController');

    /* 客服管理 */
    Route::resource('manager', 'Admin\ManagerController');
    Route::group(['prefix' => 'manager'], function () {
        Route::get('{id}/role', ['as' => 'mpmanager.manager.role', 'uses' => 'Admin\ManagerController@getRole']);
        Route::post('{id}/role', ['as' => 'mpmanager.manager.setRole', 'uses' => 'Admin\ManagerController@postRole']);
        Route::get('{id}/permission', ['as' => 'mpmanager.manager.permission', 'uses' => 'Admin\ManagerController@getPermission']);
        Route::post('{id}/permission', ['as' => 'mpmanager.manager.setPermission', 'uses' => 'Admin\ManagerController@postPermission']);
    });

    /* 设置 */
    Route::resource('setting', 'Admin\SettingController');
    Route::group(['prefix' => 'setting'], function () {
        Route::any('/safety', ['as' => 'mpmanager.setting.safety', 'uses' => 'Admin\SettingController@safety']);
        Route::any('/person', ['as' => 'mpmanager.setting.person', 'uses' => 'Admin\SettingController@person']);
    });

});


