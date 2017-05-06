/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : weicard

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-05-06 13:06:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wc_cardcases
-- ----------------------------
DROP TABLE IF EXISTS `wc_cardcases`;
CREATE TABLE `wc_cardcases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '所属收藏人',
  `follower_id` int(10) unsigned DEFAULT NULL COMMENT '关注者id',
  `follower_type` varchar(30) DEFAULT NULL COMMENT '模型类名，例App\\Models\\User',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `wc_cardcases_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='名片夹';

-- ----------------------------
-- Records of wc_cardcases
-- ----------------------------
INSERT INTO `wc_cardcases` VALUES ('2', '40', '30', 'App\\Models\\Employee', 'ag');
INSERT INTO `wc_cardcases` VALUES ('7', '40', '28', 'App\\Models\\Employee', null);
INSERT INTO `wc_cardcases` VALUES ('8', '40', '41', 'App\\Models\\User', null);
INSERT INTO `wc_cardcases` VALUES ('9', '40', '31', 'App\\Models\\Employee', null);

-- ----------------------------
-- Table structure for wc_companies
-- ----------------------------
DROP TABLE IF EXISTS `wc_companies`;
CREATE TABLE `wc_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '创始人id',
  `name` varchar(255) DEFAULT NULL COMMENT '公司名',
  `display_name` varchar(255) DEFAULT NULL COMMENT '中文名称',
  `logo` varchar(255) DEFAULT NULL COMMENT '公司logo',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `homepage` varchar(255) DEFAULT NULL COMMENT '主页',
  `email` varchar(255) DEFAULT NULL COMMENT '公司邮箱',
  `telephone` varchar(255) DEFAULT NULL COMMENT '公司电话',
  `description` varchar(255) DEFAULT NULL COMMENT '公司描述',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态，0-待审核，1-审核通过，2-审核失败',
  `reason` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT '审核者id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL COMMENT '认证时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_name_unique` (`name`) USING BTREE,
  KEY `wc_companies_user_id` (`user_id`),
  KEY `wc_companies_manager_id` (`manager_id`),
  CONSTRAINT `wc_companies_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `wc_managers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `wc_companies_user_id` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of wc_companies
-- ----------------------------
INSERT INTO `wc_companies` VALUES ('39', '40', 'strong', '强壮十分', 'uploads/company/strong/img1493977093.png', '软件园二期观日路', 'http://www.strong.com', 'admin@strong.com', '0592-22223333', '十分强壮的公司', '1', null, '1', '2017-05-05 15:14:30', '2017-05-06 13:02:47', '2017-05-05 17:38:24', null);
INSERT INTO `wc_companies` VALUES ('40', '41', 'yet', 'aaa', null, 'aa', 'http://www.baidu.com', '2247@qq.com', 'aa', 'aa', '1', null, '1', '2017-05-05 16:33:53', '2017-05-05 16:35:33', '2017-05-05 16:34:58', null);

-- ----------------------------
-- Table structure for wc_departments
-- ----------------------------
DROP TABLE IF EXISTS `wc_departments`;
CREATE TABLE `wc_departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '所属公司id',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属上级部门',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门名字',
  PRIMARY KEY (`id`),
  KEY `wc_departments_company_id` (`company_id`),
  CONSTRAINT `wc_departments_company_id` FOREIGN KEY (`company_id`) REFERENCES `wc_companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部门表';

-- ----------------------------
-- Records of wc_departments
-- ----------------------------

-- ----------------------------
-- Table structure for wc_employees
-- ----------------------------
DROP TABLE IF EXISTS `wc_employees`;
CREATE TABLE `wc_employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '公司ID',
  `department_id` int(10) unsigned DEFAULT NULL COMMENT '部门ID',
  `position_id` int(10) unsigned DEFAULT NULL COMMENT '职位ID',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  `number` varchar(255) DEFAULT NULL COMMENT '工号',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) DEFAULT NULL COMMENT '员工头像',
  `telephone` varchar(255) DEFAULT NULL COMMENT '座机',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`),
  KEY `wc_employees_company_id` (`company_id`),
  KEY `wc_employees_user_id` (`user_id`),
  KEY `wc_employees_department_id` (`department_id`),
  KEY `position_id` (`position_id`),
  CONSTRAINT `wc_employees_company_id` FOREIGN KEY (`company_id`) REFERENCES `wc_companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wc_employees_department_id` FOREIGN KEY (`department_id`) REFERENCES `wc_departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `wc_employees_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `wc_positions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `wc_employees_user_id` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of wc_employees
-- ----------------------------
INSERT INTO `wc_employees` VALUES ('28', '39', null, null, '41', 'S00002', '测试员', null, '0592-43124111', '2017-05-05 16:34:10', '2017-05-06 11:37:31', null);
INSERT INTO `wc_employees` VALUES ('29', '40', null, null, '41', 'Y00001', 'gg', null, null, '2017-05-05 16:35:33', '2017-05-05 16:35:33', null);
INSERT INTO `wc_employees` VALUES ('30', '39', null, null, '40', 'S00001', '谢大琦', null, '464132749', '2017-05-05 17:17:49', '2017-05-06 13:02:47', null);
INSERT INTO `wc_employees` VALUES ('32', '39', null, null, null, 'S8946313', '阿斯蒂芬111', 'uploads/employee/S8946313/img1494041632.jpg', null, '2017-05-05 19:22:05', '2017-05-06 11:33:52', null);
INSERT INTO `wc_employees` VALUES ('33', '40', null, null, null, 'Y123115', 'DAG1', 'uploads/employee/Y123115/img1493983631.jpg', null, '2017-05-05 19:27:11', '2017-05-05 19:27:54', null);
INSERT INTO `wc_employees` VALUES ('34', '39', null, null, null, 'S127486', '前台添加', null, null, '2017-05-05 19:30:23', '2017-05-05 19:30:23', null);
INSERT INTO `wc_employees` VALUES ('38', '39', null, null, null, 'asdf111', 'asdg', null, null, '2017-05-06 11:04:58', '2017-05-06 11:04:58', null);
INSERT INTO `wc_employees` VALUES ('39', '39', null, null, null, 'zcx134', 'dsaf', null, null, '2017-05-06 11:08:33', '2017-05-06 11:08:33', null);
INSERT INTO `wc_employees` VALUES ('40', '39', null, null, null, 'config', 'config', null, null, '2017-05-06 11:10:25', '2017-05-06 11:10:25', null);
INSERT INTO `wc_employees` VALUES ('41', '39', null, null, null, 'test444', 'tset444', 'uploads/employee/test444/img1494040298.gif', null, '2017-05-06 11:11:38', '2017-05-06 11:11:38', null);
INSERT INTO `wc_employees` VALUES ('42', '39', null, null, null, 'L986', '124asd', 'uploads/employee/L986/img1494040402.gif', null, '2017-05-06 11:13:22', '2017-05-06 11:13:22', null);
INSERT INTO `wc_employees` VALUES ('43', '39', null, null, null, 'afsd', '123sdaf', null, null, '2017-05-06 11:30:15', '2017-05-06 11:30:15', null);

-- ----------------------------
-- Table structure for wc_managers
-- ----------------------------
DROP TABLE IF EXISTS `wc_managers`;
CREATE TABLE `wc_managers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `remember_token` varchar(100) DEFAULT NULL COMMENT '？记住登录',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `is_super` tinyint(4) unsigned NOT NULL COMMENT '是否超级管理员，0-否，1-是',
  `is_active` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否激活，0-失效，1-活动',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manager_name_unique` (`name`) USING BTREE,
  UNIQUE KEY `manager_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `manager_mobile_unique` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of wc_managers
-- ----------------------------
INSERT INTO `wc_managers` VALUES ('1', 'admin', null, null, '$2y$10$mo/nyRnfB8nMia3Tix5kkeSoEVAsdC9.y/2xYfZjnUo9/3ZRaGlMq', 'IGzaC4BSiKbBrO6mdk4YDjtABumPxkkH0t7Zf6DZssJ0FdZImkLVxfCSDTQU', null, '1', '1', '2017-04-06 09:41:44', '2017-05-04 19:25:22', null);
INSERT INTO `wc_managers` VALUES ('2', 'cchenjei', null, null, '$2y$10$KFyJWwsMnb5017PDqutg9.6wGJ/Kj5UYktvwyCw8SwcXNyc/SOrtO', null, null, '0', '1', '2017-04-15 12:09:16', '2017-04-26 14:52:42', null);
INSERT INTO `wc_managers` VALUES ('3', 'linyaping', null, null, '$2y$10$2CUHsAJZRia7yxoFDx0LIusw9nJvrO1UIGVux25oL9irSfXs2OBYa', 'bFNu6mqbIwSlwo59LUKWpIg1fF77lNDPyVrFVHb5ufthNT0aoR3kFlO2zTvs', '林雅呀', '1', '1', '2017-04-26 14:25:01', '2017-04-27 18:18:31', null);
INSERT INTO `wc_managers` VALUES ('4', 'user', null, null, '$2y$10$vNEiuYi4LOiqR1U3S9xLYeIz6GRQJ/d3c0dcs2WQLsy6aRvtGXMr2', 'QYFMZQkZa06z6RLabsV0BzvKIFp36Xjr4tXgAlsEJWW6sBIXBZGKFlbRPd6x', null, '1', '1', '2017-04-27 18:17:54', '2017-04-27 18:24:37', null);
INSERT INTO `wc_managers` VALUES ('5', 'username', '1523@qq.com', '13111111111', '$2y$10$pOUtEYAi8lX1MNN2Nhb8juFz6GPL6izEkotWCswEO9KV.sx.wiLfq', null, 'afa', '0', '1', '2017-04-27 18:21:43', '2017-04-27 18:21:43', null);

-- ----------------------------
-- Table structure for wc_migrations
-- ----------------------------
DROP TABLE IF EXISTS `wc_migrations`;
CREATE TABLE `wc_migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='laravel 数据迁移表';

-- ----------------------------
-- Records of wc_migrations
-- ----------------------------
INSERT INTO `wc_migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `wc_migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `wc_migrations` VALUES ('2017_02_16_141731_create_admins_table', '2');
INSERT INTO `wc_migrations` VALUES ('2017_02_20_100427_entrust_setup_tables', '2');

-- ----------------------------
-- Table structure for wc_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `wc_password_resets`;
CREATE TABLE `wc_password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='laravel 密码重置';

-- ----------------------------
-- Records of wc_password_resets
-- ----------------------------
INSERT INTO `wc_password_resets` VALUES ('admin@admin.com', '75e6c48287ddc1a1fd78477d20878a102d08b8959cedacc0aa72dc3d0cf1ea42', '2017-03-17 09:16:36');
INSERT INTO `wc_password_resets` VALUES ('461075252@qq.com', '18cfe973d1d09b0cd14d33e2a40420901d6809aa70015aadef08d3e3cc2750c4', '2017-03-17 12:10:08');
INSERT INTO `wc_password_resets` VALUES ('xieqixiang@xm12t.com', 'f528610247f1ff787e0b4b1e6554d4ba0b6633d9e123501818541b2f186466a0', '2017-03-18 09:31:38');

-- ----------------------------
-- Table structure for wc_positions
-- ----------------------------
DROP TABLE IF EXISTS `wc_positions`;
CREATE TABLE `wc_positions` (
  `id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '公司ID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职位名',
  `is_only` tinyint(4) unsigned DEFAULT NULL COMMENT '是否唯一，0-不唯一，1-唯一',
  PRIMARY KEY (`id`),
  KEY `wc_positions_company_id` (`company_id`),
  CONSTRAINT `wc_positions_company_id` FOREIGN KEY (`company_id`) REFERENCES `wc_companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='职位表';

-- ----------------------------
-- Records of wc_positions
-- ----------------------------

-- ----------------------------
-- Table structure for wc_taggables
-- ----------------------------
DROP TABLE IF EXISTS `wc_taggables`;
CREATE TABLE `wc_taggables` (
  `tag_id` int(10) unsigned DEFAULT NULL,
  `taggable_id` int(10) unsigned DEFAULT NULL COMMENT '标签所属ID',
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模型类名，例App\\Models\\Tag',
  KEY `wc_cardcase_tag_tag_id` (`tag_id`),
  CONSTRAINT `wc_cardcase_tag_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `wc_tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='标签 关系表（多对多、多态）';

-- ----------------------------
-- Records of wc_taggables
-- ----------------------------

-- ----------------------------
-- Table structure for wc_tags
-- ----------------------------
DROP TABLE IF EXISTS `wc_tags`;
CREATE TABLE `wc_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户ID，为空为后台模板标签',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分组名',
  PRIMARY KEY (`id`),
  KEY `wc_group_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `wc_tags_user_id` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='标签';

-- ----------------------------
-- Records of wc_tags
-- ----------------------------

-- ----------------------------
-- Table structure for wc_templates
-- ----------------------------
DROP TABLE IF EXISTS `wc_templates`;
CREATE TABLE `wc_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT '上传者id',
  `code` varchar(255) DEFAULT NULL COMMENT '模板编码',
  `name` varchar(255) DEFAULT NULL COMMENT '模板名',
  `display_name` varchar(255) DEFAULT NULL COMMENT '模板中文',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `templates_name_unique` (`name`) USING BTREE,
  KEY `wc_templates_manager_id` (`manager_id`),
  CONSTRAINT `wc_templates_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `wc_managers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of wc_templates
-- ----------------------------
INSERT INTO `wc_templates` VALUES ('1', '1', 'W0001PCN01', 'ceshi', '测试模板', null, null);

-- ----------------------------
-- Table structure for wc_template_useable
-- ----------------------------
DROP TABLE IF EXISTS `wc_template_useable`;
CREATE TABLE `wc_template_useable` (
  `template_id` int(10) unsigned DEFAULT NULL COMMENT '模板ID',
  `useable_id` int(10) unsigned DEFAULT NULL COMMENT '使用者ID',
  `useable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '模型类名',
  KEY `template_user_user_id_foreign` (`useable_id`),
  KEY `wc_template_useable_ibfk_1` (`template_id`),
  CONSTRAINT `wc_template_useable_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `wc_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='模板 关系表（多对多、多态）';

-- ----------------------------
-- Records of wc_template_useable
-- ----------------------------

-- ----------------------------
-- Table structure for wc_users
-- ----------------------------
DROP TABLE IF EXISTS `wc_users`;
CREATE TABLE `wc_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `remember_token` varchar(100) DEFAULT NULL COMMENT '记住我',
  `nickname` varchar(30) DEFAULT NULL COMMENT '昵称中文姓名',
  `avatar` text COMMENT '头像',
  `sex` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '性别，0-未知，1-男，2-女',
  `description` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `is_active` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否可用，0-停用，1-可用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_unique` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of wc_users
-- ----------------------------
INSERT INTO `wc_users` VALUES ('40', 'Hsieh', '1195015834@qq.com', '18450104513', '$2y$10$EpikY0DGXqrc1WYSSgZE1.Qja4l.L7W7C6B5hmZGQxYf2oYLmmBL2', null, '谢大琦', 'uploads/user/Hsieh/img1493969570.jpg', '1', '2017 NBA 总冠军 克利夫兰 骑士', '1', '2017-05-05 15:32:50', '2017-05-05 15:40:12', null);
INSERT INTO `wc_users` VALUES ('41', 'gh', '611@qq.com', '15555555555', '$2y$10$O9lVJi2sqmGYFwtJEC/k4OSw.Zq.iwD7WYZv6i.3YZl1UOXpu.P7e', 'S105ZUxITgMh0W7F7LXbupO1uUoTh4xZFI24hhimxin2mBfCuKsUiP9VBQ7N', 'gg', null, '2', 'gg', '1', '2017-05-05 16:31:48', '2017-05-05 16:40:41', null);
