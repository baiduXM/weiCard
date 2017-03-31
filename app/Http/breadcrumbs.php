<?php

/**
 * 定义面包屑
 */

// 后台首页
Breadcrumbs::register('admin', function ($breadcrumbs) {
    $breadcrumbs->push("首页", route('admin'));
});

//// 首页 > 用户列表 > 添加用户
//Breadcrumbs::register('admin.user.create', function ($breadcrumbs) {
//    $breadcrumbs->parent('admin.user');
//    $breadcrumbs->push('添加用户', route('admin.user.create'));
//});
//
//// 首页 > 用户列表 > 用户详情
//Breadcrumbs::register('admin.user.show', function ($breadcrumbs, $id) {
//    $breadcrumbs->parent('admin.user');
//    $breadcrumbs->push('用户详情', route('admin.user.show', $id));
//});


