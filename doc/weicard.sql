/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : weicard

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-02-18 10:41:22
*/

SET FOREIGN_KEY_CHECKS=0;

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
-- Records of wc_companies
-- ----------------------------

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
-- Records of wc_contacts
-- ----------------------------

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
-- Records of wc_employees
-- ----------------------------

-- ----------------------------
-- Table structure for wc_managers
-- ----------------------------
DROP TABLE IF EXISTS `wc_managers`;
CREATE TABLE `wc_managers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `remember_token` varchar(100) DEFAULT NULL COMMENT '？记住登录',
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `permission` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '权限，0-客服，1-超级管理员',
  `is_active` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否激活，0-失效，1-活动',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manager_name_unique` (`name`) USING BTREE,
  UNIQUE KEY `manager_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `manager_mobile_unique` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of wc_managers
-- ----------------------------
INSERT INTO `wc_managers` VALUES ('1', 'admin', 'admin@qq.com', '$2y$10$9U49izPVoTZWT1fmvvlldeZfY.wKga5bDrHhKmqDlG5TDsPN3pYmy', 'xawm4hKByx6sZ2YcTgUynwEPucI24g76DxqLVvObmlns9zyUxRqkvyPj2wzJ', null, null, '1', '1', '2017-02-17 11:40:47', '2017-02-17 16:43:23');
INSERT INTO `wc_managers` VALUES ('29', 'waypdc', '527031738@qq.com', '$2y$10$lL3ZVoDziejtCCFxJkwt2OF2FbgnBHi00wwm7Tbdc.zslFKGcXLKC', null, null, null, '0', '1', '2017-02-17 15:03:12', '2017-02-17 15:03:12');
INSERT INTO `wc_managers` VALUES ('30', 'Hsieh', '461075252@qq.com', '$2y$10$EwoLfWwWD2AF/PDCK5JDsujC3Iu0FgRmscwkhLPLZ4fjBBsMmOd7u', null, null, null, '0', '1', '2017-02-17 16:43:48', '2017-02-17 16:43:48');

-- ----------------------------
-- Table structure for wc_migrations
-- ----------------------------
DROP TABLE IF EXISTS `wc_migrations`;
CREATE TABLE `wc_migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wc_migrations
-- ----------------------------
INSERT INTO `wc_migrations` VALUES ('2014_10_12_000000_create_users_table', '1');
INSERT INTO `wc_migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');

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
-- Records of wc_password_resets
-- ----------------------------
INSERT INTO `wc_password_resets` VALUES ('461075252@qq.com', '3dbaf1fd3520537389bbf22d7c156da68e65d4710e3d10e8374842daf1e0ca5f', '2017-02-11 09:16:43');

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
-- Records of wc_templates
-- ----------------------------

-- ----------------------------
-- Table structure for wc_users
-- ----------------------------
DROP TABLE IF EXISTS `wc_users`;
CREATE TABLE `wc_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `remember_token` varchar(100) DEFAULT NULL COMMENT '记住我',
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户表（客户）';

-- ----------------------------
-- Records of wc_users
-- ----------------------------
INSERT INTO `wc_users` VALUES ('9', 'home', 'home@qq.com', '$2y$10$D7jpTekKplDShiHw3zYtNOjxrLYKNy/nQeLpENKbk0UukQw1wN3je', 'WEBHYjthM0K0fJNJtDhkBi4F0BaZv9ehZDdgo3bfms7b18VX7cut3qK0lAOt', null, '1', null, null, null, null, '0', '0', '2017-02-17 11:38:14', '2017-02-17 15:08:25');
