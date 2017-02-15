/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : weicard

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-02-13 16:43:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wc_administrators
-- ----------------------------
DROP TABLE IF EXISTS `wc_administrators`;
CREATE TABLE `wc_administrators` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `privilege` tinyint(4) NOT NULL COMMENT '权限，1-超级管理员，2-主管，3-客服',
  `remember_token` varchar(100) DEFAULT NULL COMMENT '？记住登录',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Table structure for wc_companies
-- ----------------------------
DROP TABLE IF EXISTS `wc_companies`;
CREATE TABLE `wc_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '公司名',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `telephone` varchar(255) NOT NULL COMMENT '公司电话',
  `description` varchar(255) DEFAULT NULL COMMENT '公司描述',
  `code` varchar(255) DEFAULT NULL COMMENT '公司代码（唯一）',
  `admission` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否认证，0-未认证，1-认证中，2-认证通过',
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
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '所属收藏人',
  `compellation` varchar(255) DEFAULT NULL COMMENT '姓名称呼',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称备注',
  `telephone` varchar(255) DEFAULT NULL COMMENT '座机',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `group` varchar(255) DEFAULT NULL COMMENT '分组',
  `company` varchar(255) DEFAULT NULL COMMENT '公司',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通讯录';

-- ----------------------------
-- Table structure for wc_employees
-- ----------------------------
DROP TABLE IF EXISTS `wc_employees`;
CREATE TABLE `wc_employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL COMMENT '公司id',
  `number` int(10) unsigned NOT NULL COMMENT '工号',
  `compellation` varchar(255) DEFAULT NULL COMMENT '姓名称呼',
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
-- Table structure for wc_migrations
-- ----------------------------
DROP TABLE IF EXISTS `wc_migrations`;
CREATE TABLE `wc_migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Table structure for wc_users
-- ----------------------------
DROP TABLE IF EXISTS `wc_users`;
CREATE TABLE `wc_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `remember_token` varchar(100) DEFAULT NULL COMMENT '？记住登录',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `role` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '角色，1-用户，2-公司',
  `compellation` varchar(255) DEFAULT NULL COMMENT '姓名称呼',
  `description` varchar(255) DEFAULT NULL COMMENT '个人描述',
  `sex` tinyint(4) DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `employee_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表（客户）';
