<?php

/*
 * 定义面包屑
 */
/* =====后台===== */

/* 后台首页 */
Breadcrumbs::register('mpmanager', function ($breadcrumbs) {
    $breadcrumbs->push("首页", route('mpmanager.index'));
});

/* 用户组 */
Breadcrumbs::register('mpmanager.user', function ($breadcrumbs) {
    $breadcrumbs->parent('mpmanager');
    $breadcrumbs->push('用户列表', route('mpmanager.user.index'));
});

/* 公司组 */
Breadcrumbs::register('mpmanager.company', function ($breadcrumbs) {
    $breadcrumbs->parent('mpmanager');
    $breadcrumbs->push('公司列表', route('mpmanager.company.index'));
});

/* 模板组 */
Breadcrumbs::register('mpmanager.template', function ($breadcrumbs) {
    $breadcrumbs->parent('mpmanager');
    $breadcrumbs->push('模板列表', route('mpmanager.template.index'));
});

/* =====前台===== */

/* 我的公司 */
Breadcrumbs::register('company', function ($breadcrumbs) {
    $breadcrumbs->push('我的公司', route('company.index'));
});
