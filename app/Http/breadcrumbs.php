<?php

/**
 * 定义面包屑
 */
// 后台首页
Breadcrumbs::register('index', function ($breadcrumbs) {
    $breadcrumbs->push('后台首页', route('admin_user_index'));
});

// 后台首页 > 用户详情
Breadcrumbs::register('detail', function ($breadcrumbs, $id) {
    $breadcrumbs->parent('index');
    $breadcrumbs->push('用户详情', route('admin_user_delete', $id));
});