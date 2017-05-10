<?php

/*
 * 定义面包屑
 */
/* =====后台===== */

/* 后台首页 */
Breadcrumbs::register('admin', function ($breadcrumbs) {
    $breadcrumbs->push("首页", route('admin.index'));
});

/* 用户组 */
Breadcrumbs::register('admin.user', function ($breadcrumbs) {
    $breadcrumbs->parent('admin');
    $breadcrumbs->push('用户列表', route('admin.user.index'));
});

/* 公司组 */
Breadcrumbs::register('admin.company', function ($breadcrumbs) {
    $breadcrumbs->parent('admin');
    $breadcrumbs->push('公司列表', route('admin.company.index'));
});

/* 模板组 */
Breadcrumbs::register('admin.template', function ($breadcrumbs) {
    $breadcrumbs->parent('admin');
    $breadcrumbs->push('模板列表', route('admin.template.index'));
});

/* =====前台===== */

/* 我的公司 */
Breadcrumbs::register('company', function ($breadcrumbs) {
    $breadcrumbs->push('我的公司', route('company.index'));
});
