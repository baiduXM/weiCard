<?php
/*
 * 全局变量设定
 * 读取config('global.xxx')
 */
return [

    /* 网站全局变量 */
    'website' => [
        'product_name' => '微名片', // 项目名
        'super_admin' => 'admin', // 超级管理员默认名字
    ],

    /* ajax返回信息 */
    'ajax' => [
        'err' => '',
        'msg' => '',
        'data' => array(),
    ],


    /* 信息代码 */
    'msg' => [

        /* 用户绑定员工 */
        100 => '绑定成功',
        101 => '绑定失败 - 代码无效',
        102 => '绑定失败 - 找不到公司信息',
        103 => '绑定失败 - 找不到员工信息',
        104 => '绑定失败 - 员工已绑定用户',
        105 => '绑定失败 - 公司已绑定用户',
        106 => '绑定失败 - 用户不存在',
        107 => '绑定失败 - 用户已关联公司',
        108 => '绑定失败 - 绑定码不完整，未包含员工信息',
        109 => '绑定失败 - 您已经绑定员工，不能重复绑定',

        /* 用户解绑员工 */
        200 => '解绑成功',
        201 => '解绑失败 - 未绑定公司',
        202 => '解绑失败 - 未绑定员工',

        /* 用户解绑员工 */
        300 => '添加成功',
        301 => '添加失败 - ',

        /* 用户解绑员工 */
        400 => '删除成功',
        401 => '删除失败 - 员工已绑定用户',

        /* 用户解绑员工 */
        500 => '修改成功',
        501 => '修改失败 - ',

        /* 用户解绑员工 */
        600 => '查找成功',
        601 => '查找失败 - ',

        /* 名片夹 收藏/取消收藏 */
        700 => '收藏成功',
        701 => '收藏失败 - 无法收藏自己名片',
        702 => '收藏失败 - 已添加到名片夹中，不要重复添加',
        750 => '取消收藏',
        751 => '取消收藏失败 - ',

        /* 上传文件 */
        800 => '上传成功',
        801 => '上传失败 - 格式错误',
        802 => '上传失败 - 文件为空',

    ],


];