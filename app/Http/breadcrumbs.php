<?php

/**
 * 定义面包屑
 */

// 首页
Breadcrumbs::register('admin', function ($breadcrumbs) {
    $breadcrumbs->push("首页", route('admin'));
});

// 首页 > 用户列表
Breadcrumbs::register('admin.user', function ($breadcrumbs) {
    $breadcrumbs->parent('admin');
    $breadcrumbs->push('用户列表', route('admin.user'));
});

// 首页 > 用户列表 > 用户详情
Breadcrumbs::register('admin.user.detail', function ($breadcrumbs, $id) {
    $breadcrumbs->parent('admin.user');
    $breadcrumbs->push('用户详情', route('admin.user.detail', $id));
});

// 首页 > 用户列表 > 修改用户
Breadcrumbs::register('admin.user.update', function ($breadcrumbs, $id) {
    $breadcrumbs->parent('admin.user');
    $breadcrumbs->push('修改用户', route('admin.user.update', $id));
});

// 首页 > 用户列表 > 添加用户
Breadcrumbs::register('admin.user.create', function ($breadcrumbs) {
    $breadcrumbs->parent('admin.user');
    $breadcrumbs->push('添加用户', route('admin.user.create'));
});

// 首页 > 客服列表
Breadcrumbs::register('admin.manager', function ($breadcrumbs) {
    $breadcrumbs->parent('admin');
    $breadcrumbs->push('客服列表', route('admin.manager'));
});

//// 首页 > 角色管理
//Breadcrumbs::register('admin.role', function ($breadcrumbs) {
//    $breadcrumbs->parent('admin');
//    $breadcrumbs->push('角色管理', route('admin.role.index'));
//});
//// 首页 > 角色管理 > 添加角色
//Breadcrumbs::register('admin.role.create', function ($breadcrumbs) {
//    $breadcrumbs->parent('admin.role');
//    $breadcrumbs->push('添加角色', route('admin.role.create'));
//});
//// 首页 > 角色管理 > 角色详情
//Breadcrumbs::register('admin.role.show', function ($breadcrumbs, $id) {
//    $breadcrumbs->parent('admin.role');
//    $breadcrumbs->push('角色详情', route('admin.role.show', $id));
//});
//// 首页 > 角色管理 > 编辑角色
//Breadcrumbs::register('admin.role.edit', function ($breadcrumbs, $id) {
//    $breadcrumbs->parent('admin.role');
//    $breadcrumbs->push('编辑角色', route('admin.role.edit', $id));
//});