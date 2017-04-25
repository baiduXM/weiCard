/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : weicard

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-04-25 20:00:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wc_companies
-- ----------------------------
DROP TABLE IF EXISTS `wc_companies`;
CREATE TABLE `wc_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '创始人id',
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT '审核者id',
  `name` varchar(255) DEFAULT NULL COMMENT '公司名',
  `display_name` varchar(255) DEFAULT NULL COMMENT '显示名',
  `logo` varchar(255) DEFAULT NULL COMMENT '公司logo',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `email` varchar(255) DEFAULT NULL COMMENT '公司邮箱',
  `telephone` varchar(255) DEFAULT NULL COMMENT '公司电话',
  `description` varchar(255) DEFAULT NULL COMMENT '公司描述',
  `status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '状态，0-待审核，1-审核通过，2-审核失败',
  `reason` varchar(255) DEFAULT NULL COMMENT '审核失败原因',
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of wc_companies
-- ----------------------------
INSERT INTO `wc_companies` VALUES ('27', '29', '1', 'work', '工作室', 'uploads/company/work/img1493021559.gif', null, null, null, null, '1', null, '2017-04-15 10:26:02', '2017-04-24 18:45:25', '2017-04-24 18:45:25', null);
INSERT INTO `wc_companies` VALUES ('30', null, '1', 'adsg', 'adsg', null, null, null, null, null, '1', null, '2017-04-19 16:13:32', '2017-04-22 11:26:24', '2017-04-19 17:16:46', null);
INSERT INTO `wc_companies` VALUES ('31', '33', '1', 'watashi', 'わたし', null, 'sa', null, null, 'わたし', '1', null, '2017-04-19 16:16:29', '2017-04-25 15:32:26', '2017-04-19 17:14:36', null);
INSERT INTO `wc_companies` VALUES ('32', null, '1', 'xm12t', '厦门易尔通网络科技有限公司', 'uploads/company/xm12t/img1493110917.png', '厦门软件园二期观日路30号', 'linyapiii@xm12t.com', '0592-999999', '网站建设。', '1', null, '2017-04-25 17:01:57', '2017-04-25 17:01:57', '2017-04-25 17:01:57', null);

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
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属上级部门',
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '所属公司id',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门名字',
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '显示名称',
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
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户ID',
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '公司ID',
  `department_id` int(10) unsigned DEFAULT NULL COMMENT '部门ID',
  `number` varchar(255) DEFAULT NULL COMMENT '工号',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `title` varchar(255) DEFAULT NULL COMMENT '职位头衔',
  `mobile` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL COMMENT '座机',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wc_employees_company_id` (`company_id`),
  KEY `wc_employees_user_id` (`user_id`),
  KEY `wc_employees_department_id` (`department_id`),
  CONSTRAINT `wc_employees_company_id` FOREIGN KEY (`company_id`) REFERENCES `wc_companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wc_employees_department_id` FOREIGN KEY (`department_id`) REFERENCES `wc_departments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `wc_employees_user_id` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of wc_employees
-- ----------------------------
INSERT INTO `wc_employees` VALUES ('2', null, '27', null, 'A00001', '老王', '创始人', null, null, null, '2017-04-20 15:00:12', '2017-04-24 19:28:56');
INSERT INTO `wc_employees` VALUES ('3', '28', '27', null, 'W00001', '老赵', '创始人', null, null, null, '2017-04-20 15:00:32', '2017-04-24 19:36:01');
INSERT INTO `wc_employees` VALUES ('5', '33', '31', null, 'W00001', '老李', '创始人', null, null, null, '2017-04-22 09:53:20', '2017-04-25 15:32:26');
INSERT INTO `wc_employees` VALUES ('6', '29', '27', null, 'W00002', '老孙', 'test', null, null, null, '2017-04-24 14:08:33', '2017-04-24 19:36:20');
INSERT INTO `wc_employees` VALUES ('7', null, '27', null, 'A10001', '阿旺', null, null, null, null, '2017-04-25 19:06:31', '2017-04-25 19:06:31');
INSERT INTO `wc_employees` VALUES ('8', null, '27', null, 'ads', 'asd', null, null, null, null, '2017-04-25 19:23:02', '2017-04-25 19:23:02');
INSERT INTO `wc_employees` VALUES ('9', null, '27', null, 'ads1', 'asd', null, null, null, null, '2017-04-25 19:24:41', '2017-04-25 19:24:41');
INSERT INTO `wc_employees` VALUES ('10', null, '27', null, 'QWER', '阿斯蒂芬', null, null, null, null, '2017-04-25 19:25:27', '2017-04-25 19:25:27');
INSERT INTO `wc_employees` VALUES ('11', null, '27', null, 'cxz', 'zcxv', null, null, null, null, '2017-04-25 19:28:30', '2017-04-25 19:28:30');
INSERT INTO `wc_employees` VALUES ('12', null, '27', null, 'cxzvg', 're', null, null, null, null, '2017-04-25 19:29:20', '2017-04-25 19:29:20');
INSERT INTO `wc_employees` VALUES ('13', null, '27', null, 'cxzvh', 'wqer', null, null, null, null, '2017-04-25 19:30:51', '2017-04-25 19:30:51');
INSERT INTO `wc_employees` VALUES ('14', null, '27', null, 'q54q', 'nihao', null, null, null, null, '2017-04-25 19:31:49', '2017-04-25 19:31:49');
INSERT INTO `wc_employees` VALUES ('15', null, '27', null, 'gq56', 'sdag', null, null, null, null, '2017-04-25 19:38:14', '2017-04-25 19:38:14');
INSERT INTO `wc_employees` VALUES ('16', null, '27', null, 'hb671a', 'dasf', null, null, null, null, '2017-04-25 19:39:27', '2017-04-25 19:39:27');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of wc_managers
-- ----------------------------
INSERT INTO `wc_managers` VALUES ('1', 'admin', null, null, '$2y$10$mo/nyRnfB8nMia3Tix5kkeSoEVAsdC9.y/2xYfZjnUo9/3ZRaGlMq', 'lOHERVSqeNwBON8EZgOBmr7jLHS2b2ckNIaQsf82ifxCyD9BD3kFsJPQUhq0', null, '1', '1', '2017-04-06 09:41:44', '2017-04-25 17:13:04', null);
INSERT INTO `wc_managers` VALUES ('2', 'cchenjei', null, null, '$2y$10$KFyJWwsMnb5017PDqutg9.6wGJ/Kj5UYktvwyCw8SwcXNyc/SOrtO', null, null, '0', '1', '2017-04-15 12:09:16', '2017-04-15 12:09:16', null);

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
  `useable_type` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '使用者类型，模型名',
  KEY `template_user_user_id_foreign` (`useable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='模板-使用者-使用者类型 关系表';

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
  `realname` varchar(30) DEFAULT NULL COMMENT '真实姓名',
  `nickname` varchar(30) DEFAULT NULL COMMENT '昵称',
  `avatar` text COMMENT '头像',
  `sex` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '性别，0-未知，1-男，2-女',
  `age` tinyint(4) unsigned DEFAULT NULL COMMENT '年龄',
  `description` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `is_active` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否可用，0-停用，1-可用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_unique` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of wc_users
-- ----------------------------
INSERT INTO `wc_users` VALUES ('27', 'cchenjei', null, null, '$2y$10$QCroeRuZdaElsObl2aPuKOg33NUnD2F7j1lK9BP.TqaBqNU3WM0ou', null, null, null, null, '0', null, null, '1', '2017-04-15 12:10:38', '2017-04-15 12:10:38', null);
INSERT INTO `wc_users` VALUES ('28', 'test', null, null, '$2y$10$m/oE/naGmLdgch8lYBF1c.JzaIdV6ArVj03Z1CPybFluCNW62otfy', 'kngZr0JhQoiv3IlJ0F54CMzZ0rU2LdJxdKChMnhIr1MFvvcU4geFonX7h6ca', null, null, null, '0', null, null, '1', '2017-04-17 14:27:15', '2017-04-22 11:25:10', null);
INSERT INTO `wc_users` VALUES ('29', 'Hsieh', '1195015834@qq.com', '18768104513', '$2y$10$DomPZsfw6Aj6BQKiP1I/LuMTAjaFaEBQ5RC2tVqPM0Y7LhXiUVrgq', null, null, '谢大琦', 'uploads/user/Hsieh/img1493024987.png', '0', null, '', '1', '2017-04-19 11:02:58', '2017-04-24 17:11:50', null);
INSERT INTO `wc_users` VALUES ('31', 'abc', null, null, '$2y$10$XYXAp6te03UQe7wUHJhCaO.a2GsFUBEi4MjJdjukfeCMJ2KGoxTAO', null, null, null, null, '0', null, null, '1', '2017-04-19 16:08:29', '2017-04-19 16:08:29', null);
INSERT INTO `wc_users` VALUES ('33', 'pdc', null, null, '$2y$10$hQHtT7AfW6ixZ7RR2oBnfepAdCTmrMlz2dkjcMYIBGZVmK1nvGqrK', 'urHkMdWaqFa4GjuWibZIqga5cfspRZ7Kn5DgSCbkRaR3NWAoUNhfLhzVLJ9B', null, null, null, '0', null, null, '1', '2017-04-25 15:32:02', '2017-04-25 15:56:27', null);
INSERT INTO `wc_users` VALUES ('34', 'test001', '212121@qq.com', '18259175000', '$2y$10$Eu2KlafvRAP77RgOfsI6tekpebb5lX0hn4kMrIBkRH.dIY8B0yA.W', null, null, '测试001', 'uploads/user/test001/img1493110136.jpg', '2', '25', '好！', '0', '2017-04-25 16:48:56', '2017-04-25 16:48:56', null);

-- ----------------------------
-- Table structure for wc_user_follow
-- ----------------------------
DROP TABLE IF EXISTS `wc_user_follow`;
CREATE TABLE `wc_user_follow` (
  `user_id` int(10) unsigned NOT NULL,
  `follow_id` int(10) unsigned DEFAULT NULL COMMENT '关注用户ID',
  KEY `user_id` (`user_id`),
  KEY `follow_id` (`follow_id`),
  CONSTRAINT `wc_user_follow_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wc_user_follow_ibfk_2` FOREIGN KEY (`follow_id`) REFERENCES `wc_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wc_user_follow
-- ----------------------------
