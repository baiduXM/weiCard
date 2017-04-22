<?php
/*
 * 全局变量设定
 * 读取config('global.xxx')
 */
return [

    'website' => [
        'product_name' => '微名片', // 项目名
        'super_admin' => 'admin', // 超级管理员默认名字
    ],

    'msg' => [
        100 => '绑定成功',
        101 => '绑定失败 - 代码无效',
        102 => '绑定失败 - 找不到公司信息',
        103 => '绑定失败 - 找不到员工信息',
        104 => '绑定失败 - 员工已绑定用户',
        105 => '绑定失败 - 公司已绑定用户',
        106 => '绑定失败 - 用户不存在',
        107 => '绑定失败 - 用户已关联公司',
        108 => '绑定失败 - 绑定码不完整，未包含员工信息',
        200 => '解绑成功',
        201 => '解绑失败 - 未绑定公司',
        202 => '解绑失败 - 未绑定员工',

    ],


];