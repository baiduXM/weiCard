/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : weicard

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-03-18 12:03:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wc_companies
-- ----------------------------
DROP TABLE IF EXISTS `wc_companies`;
CREATE TABLE `wc_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '公司名',
  `logo` varchar(255) DEFAULT NULL COMMENT '公司logo',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `telephone` varchar(255) NOT NULL COMMENT '公司电话',
  `description` varchar(255) DEFAULT NULL COMMENT '公司描述',
  `code` varchar(255) DEFAULT NULL COMMENT '公司代码（唯一）',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态，0-认证中，1-认证通过，2-认证失败',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_code_unique` (`code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';

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
-- Table structure for wc_managers
-- ----------------------------
DROP TABLE IF EXISTS `wc_managers`;
CREATE TABLE `wc_managers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `remember_token` varchar(100) DEFAULT NULL COMMENT '？记住登录',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `description` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `is_super` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否是超级管理员',
  `is_active` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否激活，0-停用，1-活动',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manager_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `manager_name_unique` (`name`) USING BTREE,
  UNIQUE KEY `manager_mobile_unique` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Table structure for wc_migrations
-- ----------------------------
DROP TABLE IF EXISTS `wc_migrations`;
CREATE TABLE `wc_migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='laravel 数据迁移表';

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
-- Table structure for wc_permissions
-- ----------------------------
DROP TABLE IF EXISTS `wc_permissions`;
CREATE TABLE `wc_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '权限的唯一名称',
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '可读的权限名称',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '权限的详细描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限表';

-- ----------------------------
-- Table structure for wc_permission_role
-- ----------------------------
DROP TABLE IF EXISTS `wc_permission_role`;
CREATE TABLE `wc_permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `wc_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `wc_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='权限-角色';

-- ----------------------------
-- Table structure for wc_roles
-- ----------------------------
DROP TABLE IF EXISTS `wc_roles`;
CREATE TABLE `wc_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT '角色唯一名称',
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '可读的角色名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色的详细描述',
  `type` tinyint(4) unsigned DEFAULT '0' COMMENT '角色类型，0-前台角色(users表)，1-后台角色(managers表)',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Table structure for wc_role_user
-- ----------------------------
DROP TABLE IF EXISTS `wc_role_user`;
CREATE TABLE `wc_role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `wc_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='角色-用户';

-- ----------------------------
-- Table structure for wc_templates
-- ----------------------------
DROP TABLE IF EXISTS `wc_templates`;
CREATE TABLE `wc_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '模板名',
  `administrator_id` int(10) unsigned DEFAULT NULL COMMENT '上传者id',
  `code` varchar(255) DEFAULT NULL COMMENT '模板代码',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `templates_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模板表';

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
-- Table structure for wc_users
-- ----------------------------
DROP TABLE IF EXISTS `wc_users`;
CREATE TABLE `wc_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `remember_token` varchar(100) DEFAULT NULL COMMENT '记住我',
  `sex` tinyint(4) unsigned DEFAULT NULL COMMENT '性别，0-未知，1-男，2-女',
  `age` tinyint(4) unsigned DEFAULT NULL COMMENT '年龄',
  `nickname` varchar(255) DEFAULT NULL COMMENT '姓名称呼',
  `avatar` text COMMENT '头像',
  `description` varchar(255) DEFAULT NULL COMMENT '个人描述',
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='用户表';
