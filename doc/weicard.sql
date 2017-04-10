/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : weicard

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-04-10 17:37:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wc_card
-- ----------------------------
DROP TABLE IF EXISTS `wc_card`;
CREATE TABLE `wc_card` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '所属人id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名片别名',
  `template_id` int(10) unsigned DEFAULT NULL COMMENT '模板id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='名片表';

-- ----------------------------
-- Records of wc_card
-- ----------------------------

-- ----------------------------
-- Table structure for wc_companies
-- ----------------------------
DROP TABLE IF EXISTS `wc_companies`;
CREATE TABLE `wc_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '公司名',
  `code` varchar(255) DEFAULT NULL COMMENT '公司代码',
  `logo` varchar(255) DEFAULT NULL COMMENT '公司logo',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `email` varchar(255) DEFAULT NULL COMMENT '公司邮箱',
  `telephone` varchar(255) DEFAULT NULL COMMENT '公司电话',
  `description` varchar(255) DEFAULT NULL COMMENT '公司描述',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '注册人id',
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT '审核者id',
  `status` tinyint(4) unsigned DEFAULT '0' COMMENT '状态，0-认证中，1-认证通过，2-认证失败，3-资料变更',
  `is_active` tinyint(4) DEFAULT NULL COMMENT '是否可用，0-停用，1-可用',
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL COMMENT '认证时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_code_unique` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of wc_companies
-- ----------------------------
INSERT INTO `wc_companies` VALUES ('10', '公司', 'gongsi ', null, null, null, null, null, '19', '0', '0', null, '2017-04-10 16:42:25', '2017-04-10 14:10:49', null, null);
INSERT INTO `wc_companies` VALUES ('11', '你好', '你好', 'uploads/company/????/img1491622311.jpg', null, null, null, null, '18', '0', '0', null, '2017-04-10 16:36:08', '2017-04-08 11:31:51', null, null);
INSERT INTO `wc_companies` VALUES ('12', 'aer', 'a', null, null, null, null, null, '18', '1', '0', null, '2017-04-10 16:36:06', '2017-04-10 10:09:27', null, null);
INSERT INTO `wc_companies` VALUES ('13', 'aerx', 'ab', null, null, null, null, null, '18', '1', '0', null, '2017-04-10 16:36:06', '2017-04-10 10:09:52', null, null);
INSERT INTO `wc_companies` VALUES ('15', 'asdf', 'aqwer', null, null, null, null, null, '13', null, '0', null, '2017-04-10 16:59:19', '2017-04-10 16:59:19', null, null);

-- ----------------------------
-- Table structure for wc_contacts
-- ----------------------------
DROP TABLE IF EXISTS `wc_contacts`;
CREATE TABLE `wc_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '所属收藏人',
  `follow_id` int(10) unsigned NOT NULL COMMENT '关注者id',
  `type` tinyint(4) NOT NULL COMMENT '类型，1-用户，2-员工',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名称呼',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称备注',
  `telephone` varchar(255) DEFAULT NULL COMMENT '座机',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `group` varchar(255) DEFAULT NULL COMMENT '分组',
  `company` varchar(255) DEFAULT NULL COMMENT '公司',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `follow_id_and_type_unique` (`follow_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通讯录';

-- ----------------------------
-- Records of wc_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for wc_departments
-- ----------------------------
DROP TABLE IF EXISTS `wc_departments`;
CREATE TABLE `wc_departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL COMMENT '所属公司id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属上级部门',
  `employee_id` int(10) unsigned NOT NULL COMMENT '部门主管',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门名字',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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
  `company_id` int(10) unsigned NOT NULL COMMENT '公司id',
  `department_id` int(10) unsigned NOT NULL COMMENT '部门id',
  `number` int(10) unsigned NOT NULL COMMENT '工号',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名称呼',
  `title` varchar(255) DEFAULT NULL COMMENT '职位头衔',
  `telephone` varchar(255) DEFAULT NULL COMMENT '座机',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_number_unique` (`number`,`company_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of wc_employees
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of wc_managers
-- ----------------------------
INSERT INTO `wc_managers` VALUES ('1', 'admin', null, null, '$2y$10$mo/nyRnfB8nMia3Tix5kkeSoEVAsdC9.y/2xYfZjnUo9/3ZRaGlMq', 'w8yGlKULvF0HMsgfzSK672KR7XmaaTByaKqvQCiBLKdpd65E5oWMFVaCl9U1', null, '0', '1', '2017-04-06 09:41:44', '2017-04-07 17:10:18', null);

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
-- Table structure for wc_templates
-- ----------------------------
DROP TABLE IF EXISTS `wc_templates`;
CREATE TABLE `wc_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uploader_id` int(10) unsigned DEFAULT NULL COMMENT '上传者id',
  `code` varchar(255) DEFAULT NULL COMMENT '模板代码',
  `name` varchar(255) DEFAULT NULL COMMENT '模板名',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `templates_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of wc_templates
-- ----------------------------

-- ----------------------------
-- Table structure for wc_template_user
-- ----------------------------
DROP TABLE IF EXISTS `wc_template_user`;
CREATE TABLE `wc_template_user` (
  `template_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`user_id`),
  KEY `template_user_user_id_foreign` (`user_id`),
  CONSTRAINT `template_user_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `wc_templates` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `template_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='模板-用户';

-- ----------------------------
-- Records of wc_template_user
-- ----------------------------

-- ----------------------------
-- Table structure for wc_users
-- ----------------------------
DROP TABLE IF EXISTS `wc_users`;
CREATE TABLE `wc_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `remember_token` varchar(100) DEFAULT NULL COMMENT '记住我',
  `sex` tinyint(4) unsigned DEFAULT NULL COMMENT '性别，0-未知，1-男，2-女',
  `age` tinyint(4) unsigned DEFAULT NULL COMMENT '年龄',
  `title` varchar(30) DEFAULT NULL COMMENT '头衔',
  `nickname` varchar(30) DEFAULT NULL COMMENT '昵称',
  `avatar` text COMMENT '头像',
  `description` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `is_active` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否可用，0-停用，1-可用',
  `is_admin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否管理员：0-否，1-是',
  `company_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联公司id',
  `employee_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联雇员id',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_unique` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of wc_users
-- ----------------------------
INSERT INTO `wc_users` VALUES ('18', 'guess', null, null, '$2y$10$oA0Ah6vqIwYt.m5UZvYn/OfjYSED/sVOFh4x3hNkr15tevEQvifcK', 'GLmtZZDvCNwln3iy7KGBKpzE6bLeuTorlgXCvkYNAqGFOmXGbLso61a0ip7L', null, null, null, '游客', null, null, '1', '0', '13', '0', '2017-03-27 14:39:42', '2017-04-10 10:09:52', null);
INSERT INTO `wc_users` VALUES ('19', 'ceshi', null, null, '$2y$10$4lgswUeyGCEpRaXqh6BM3eDVWPSzauX7WYXMOj1A8BLCxAULbM.2i', null, null, null, null, '测试', null, null, '0', '0', '0', '0', '2017-03-28 11:12:34', '2017-03-28 11:12:34', null);
INSERT INTO `wc_users` VALUES ('20', 'test', null, null, '$2y$10$ibiqR4kkpnjGc807D22F8.J723J8AITS81sIcKc1DP3z3yhTlcA7.', null, null, null, null, null, 'uploads/user/guess/img1491616924.png', null, '0', '0', '0', '0', '2017-04-08 09:52:47', '2017-04-08 10:02:04', null);
