<?php

/*
 * 定义面包屑
 */

/* 后台首页 */
Breadcrumbs::register('admin', function ($breadcrumbs) {
    $breadcrumbs->push("首页", route('admin.index'));
});

/* 我的公司 */
Breadcrumbs::register('company', function ($breadcrumbs) {
    $breadcrumbs->push('我的公司', route('company.index'));
});
