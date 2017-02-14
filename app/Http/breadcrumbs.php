<?php

/**
 * 定义面包屑
 */

// 首页
Breadcrumbs::register('admin', function ($breadcrumbs) {
    $breadcrumbs->push("首页", route('admin'));
});
// 首页 > 用户列表
Breadcrumbs::register('user', function ($breadcrumbs) {
    $breadcrumbs->parent('admin');
    $breadcrumbs->push('用户列表', route('admin_user_index'));
});

// 首页 > 用户列表 > 用户详情
Breadcrumbs::register('detail', function ($breadcrumbs, $id) {
    $breadcrumbs->parent('user');
    $breadcrumbs->push('用户详情', route('admin_user_detail', $id));
});

// 首页 > 用户列表 > 修改用户
Breadcrumbs::register('update', function ($breadcrumbs, $id) {
    $breadcrumbs->parent('user');
    $breadcrumbs->push('修改用户', route('admin_user_update', $id));
});

// 首页 > 用户列表 > 添加用户
Breadcrumbs::register('create', function ($breadcrumbs) {
    $breadcrumbs->parent('user');
    $breadcrumbs->push('添加用户', route('admin_user_create'));
});

// 首页 > 用户列表 > 添加用户
Breadcrumbs::register('member', function ($breadcrumbs) {
    $breadcrumbs->parent('admin');
    $breadcrumbs->push('客服列表', route('admin_member_index'));
});