/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : weicard

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-05-24 18:58:20
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='名片夹';

-- ----------------------------
-- Records of wc_cardcases
-- ----------------------------
INSERT INTO `wc_cardcases` VALUES ('2', '40', '30', 'App\\Models\\Employee', 'ag');
INSERT INTO `wc_cardcases` VALUES ('8', '40', '41', 'App\\Models\\User', null);
INSERT INTO `wc_cardcases` VALUES ('9', '41', '31', 'App\\Models\\Employee', null);
INSERT INTO `wc_cardcases` VALUES ('10', '42', '30', 'App\\Models\\Employee', null);
INSERT INTO `wc_cardcases` VALUES ('11', '40', '28', 'App\\Models\\Employee', null);
INSERT INTO `wc_cardcases` VALUES ('12', '40', '32', 'App\\Models\\Employee', null);
INSERT INTO `wc_cardcases` VALUES ('13', '40', '34', 'App\\Models\\Employee', null);

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
  `coordinate_lng` varchar(255) DEFAULT '118.189635' COMMENT '坐标（经度）',
  `coordinate_lat` varchar(255) DEFAULT '24.491177' COMMENT '坐标（纬度）',
  `url` varchar(255) DEFAULT NULL COMMENT '公司网址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_name_unique` (`name`) USING BTREE,
  KEY `wc_companies_user_id` (`user_id`),
  KEY `wc_companies_manager_id` (`manager_id`),
  CONSTRAINT `wc_companies_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `wc_managers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `wc_companies_user_id` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of wc_companies
-- ----------------------------
INSERT INTO `wc_companies` VALUES ('39', '40', 'strong', '强壮十分', 'uploads/company/strong/img1493977093.png', '软件园二期观日路', 'http://www.strong.com', 'admin@strong.com', '0592-22223333', '十分强壮的公司', '1', null, '1', '2017-05-05 15:14:30', '2017-05-23 11:20:35', '2017-05-05 17:38:24', null, '118.189635', '24.491177', null);
INSERT INTO `wc_companies` VALUES ('40', '41', 'yet', 'aaa', 'uploads/company/yet/img1494828849.png', 'aa', 'http://www.baidu.com', '2247@qq.com', 'aa', 'aa', '1', null, '1', '2017-05-05 16:33:53', '2017-05-15 14:14:57', '2017-05-15 14:14:57', null, '118.189635', '24.491177', null);
INSERT INTO `wc_companies` VALUES ('41', '43', 'ABC', 'ABC', null, null, null, null, null, null, '1', null, '1', '2017-05-09 08:58:59', '2017-05-09 10:09:13', '2017-05-09 08:58:59', null, '118.189635', '24.491177', null);
INSERT INTO `wc_companies` VALUES ('42', '44', 'cpforest001', '公司森林001', 'uploads/company/cpforest001/img1494291962.png', null, null, null, null, null, '1', null, '1', '2017-05-09 09:06:02', '2017-05-09 09:08:49', '2017-05-09 09:06:02', null, '118.189635', '24.491177', null);
INSERT INTO `wc_companies` VALUES ('44', '47', 'xm', '易尔通', 'uploads/company/xm/img1494818381.png', '软件园', null, null, '5999999', '12t', '1', null, '1', '2017-05-15 11:18:13', '2017-05-15 11:29:00', '2017-05-15 11:26:21', null, '118.189635', '24.491177', null);
INSERT INTO `wc_companies` VALUES ('46', '50', 'ccc', 'ccc', null, null, null, null, null, null, '1', null, '1', '2017-05-15 14:44:42', '2017-05-16 13:44:58', '2017-05-15 14:44:42', null, '118.189635', '24.491177', null);
INSERT INTO `wc_companies` VALUES ('47', '51', 'asdf', '测试绑定', null, null, null, null, null, null, '1', null, '1', '2017-05-19 15:38:43', '2017-05-22 17:40:26', '2017-05-19 15:38:43', null, '118.189635', '24.491177', null);

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
  `mobile` varchar(255) DEFAULT NULL COMMENT '手机',
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
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of wc_employees
-- ----------------------------
INSERT INTO `wc_employees` VALUES ('28', '39', null, null, '40', 'S00002', '测试员', null, null, '0592-43124111', '2017-05-05 16:34:10', '2017-05-23 11:20:36', null);
INSERT INTO `wc_employees` VALUES ('29', '40', null, null, '41', 'Y00001', 'gg', null, null, null, '2017-05-05 16:35:33', '2017-05-09 09:45:06', null);
INSERT INTO `wc_employees` VALUES ('30', '39', null, null, null, 'S00001', '谢大琦', null, null, '464132749', '2017-05-05 17:17:49', '2017-05-22 11:27:18', null);
INSERT INTO `wc_employees` VALUES ('32', '39', null, null, null, 'S8946313', '阿斯蒂芬111', 'uploads/employee/S8946313/img1494041632.jpg', null, null, '2017-05-05 19:22:05', '2017-05-06 11:33:52', null);
INSERT INTO `wc_employees` VALUES ('33', '40', null, null, null, 'Y123115', 'DAG1', 'uploads/employee/Y123115/img1493983631.jpg', null, null, '2017-05-05 19:27:11', '2017-05-05 19:27:54', null);
INSERT INTO `wc_employees` VALUES ('34', '39', null, null, '42', 'S127486', '前台添加', null, null, null, '2017-05-05 19:30:23', '2017-05-08 11:39:55', null);
INSERT INTO `wc_employees` VALUES ('38', '39', null, null, null, 'asdf111', 'asdg', null, null, null, '2017-05-06 11:04:58', '2017-05-06 11:04:58', null);
INSERT INTO `wc_employees` VALUES ('39', '39', null, null, null, 'zcx134', 'dsaf', null, null, null, '2017-05-06 11:08:33', '2017-05-06 11:08:33', null);
INSERT INTO `wc_employees` VALUES ('40', '39', null, null, null, 'config', 'config', null, null, null, '2017-05-06 11:10:25', '2017-05-06 11:10:25', null);
INSERT INTO `wc_employees` VALUES ('41', '39', null, null, null, 'test444', 'tset444', 'uploads/employee/test444/img1494040298.gif', null, null, '2017-05-06 11:11:38', '2017-05-06 11:11:38', null);
INSERT INTO `wc_employees` VALUES ('42', '39', null, null, null, 'L986', '124asd', 'uploads/employee/L986/img1494040402.gif', null, null, '2017-05-06 11:13:22', '2017-05-06 11:13:22', null);
INSERT INTO `wc_employees` VALUES ('43', '41', null, null, '43', 'A00001', 'AAA', null, null, null, '2017-05-09 09:00:01', '2017-05-09 10:09:13', null);
INSERT INTO `wc_employees` VALUES ('44', '40', null, null, null, 'A1111', '1', null, null, '1', '2017-05-09 09:06:40', '2017-05-09 09:06:40', null);
INSERT INTO `wc_employees` VALUES ('45', '42', null, null, '44', 'C00001', '我的用户名森林001', null, null, null, '2017-05-09 09:08:49', '2017-05-09 09:08:49', null);
INSERT INTO `wc_employees` VALUES ('46', '42', null, null, null, 'C00002', '我的用户森林002', 'uploads/employee/C00002/img1494292189.jpg', null, '05925555555', '2017-05-09 09:09:49', '2017-05-09 09:09:49', null);
INSERT INTO `wc_employees` VALUES ('47', '42', null, null, null, 'C00003', '员工', null, null, null, '2017-05-09 09:17:08', '2017-05-09 09:17:08', null);
INSERT INTO `wc_employees` VALUES ('48', '40', null, null, null, 'a111', '1', null, null, null, '2017-05-09 09:33:25', '2017-05-09 09:33:25', null);
INSERT INTO `wc_employees` VALUES ('50', '41', null, null, null, 'A2212', '12212', null, null, null, '2017-05-09 10:15:04', '2017-05-09 10:15:04', null);
INSERT INTO `wc_employees` VALUES ('51', '42', null, null, '46', 'C0003', '第三个员工', null, null, null, '2017-05-09 16:36:05', '2017-05-09 16:40:44', null);
INSERT INTO `wc_employees` VALUES ('54', '44', null, null, '47', 'X00001', 'gaohan', null, null, null, '2017-05-15 11:29:00', '2017-05-15 11:29:00', null);
INSERT INTO `wc_employees` VALUES ('55', '44', null, null, '48', 'gao1', '11', null, null, null, '2017-05-15 11:30:58', '2017-05-15 11:36:31', null);
INSERT INTO `wc_employees` VALUES ('56', '44', null, null, null, 'x1111', '1user', null, null, null, '2017-05-15 13:48:30', '2017-05-15 14:43:59', null);
INSERT INTO `wc_employees` VALUES ('57', '40', null, null, null, 'C0002', '22', null, null, null, '2017-05-15 14:15:59', '2017-05-15 14:15:59', null);
INSERT INTO `wc_employees` VALUES ('59', '46', null, null, '50', 'C00001', 'abb', null, null, null, '2017-05-16 13:44:58', '2017-05-16 13:44:58', null);
INSERT INTO `wc_employees` VALUES ('60', '40', null, null, null, 'S1', 'ABC', null, null, null, '2017-05-16 14:00:56', '2017-05-16 14:00:56', null);
INSERT INTO `wc_employees` VALUES ('61', '47', null, null, '51', 'A00001', 'asdf', null, null, null, '2017-05-22 17:40:26', '2017-05-22 17:40:26', null);
INSERT INTO `wc_employees` VALUES ('62', '47', null, null, null, 'deed', 'frgg', 'uploads/employee/deed/img1495503530.png', null, null, '2017-05-23 09:38:50', '2017-05-23 09:38:50', null);
INSERT INTO `wc_employees` VALUES ('63', '47', null, null, null, 'vffv', 'vfvf', 'uploads/employee/vffv/img1495617080.png', null, null, '2017-05-24 17:11:20', '2017-05-24 17:11:20', null);

-- ----------------------------
-- Table structure for wc_group
-- ----------------------------
DROP TABLE IF EXISTS `wc_group`;
CREATE TABLE `wc_group` (
  `id` int(10) unsigned NOT NULL,
  `uesr_id` int(10) unsigned DEFAULT NULL COMMENT '群主',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '群名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '群公告',
  PRIMARY KEY (`id`),
  KEY `uesr_id` (`uesr_id`),
  CONSTRAINT `wc_group_ibfk_1` FOREIGN KEY (`uesr_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='名片群';

-- ----------------------------
-- Records of wc_group
-- ----------------------------

-- ----------------------------
-- Table structure for wc_group_user
-- ----------------------------
DROP TABLE IF EXISTS `wc_group_user`;
CREATE TABLE `wc_group_user` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `wc_group_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wc_group_user_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `wc_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='名片群-用户 关系表（多对多）';

-- ----------------------------
-- Records of wc_group_user
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of wc_managers
-- ----------------------------
INSERT INTO `wc_managers` VALUES ('1', 'admin', null, null, '$2y$10$mo/nyRnfB8nMia3Tix5kkeSoEVAsdC9.y/2xYfZjnUo9/3ZRaGlMq', 'VufBnva31psLRhAco2gdheio6LkP2jTgmiRH8cgZmkG3ExaPlhM5FKFy6OgS', null, '1', '1', '2017-04-06 09:41:44', '2017-05-22 14:10:58', null);
INSERT INTO `wc_managers` VALUES ('2', 'cchenjei', null, null, '$2y$10$KFyJWwsMnb5017PDqutg9.6wGJ/Kj5UYktvwyCw8SwcXNyc/SOrtO', null, null, '0', '1', '2017-04-15 12:09:16', '2017-04-26 14:52:42', null);
INSERT INTO `wc_managers` VALUES ('3', 'linyaping', null, null, '$2y$10$2CUHsAJZRia7yxoFDx0LIusw9nJvrO1UIGVux25oL9irSfXs2OBYa', 'bFNu6mqbIwSlwo59LUKWpIg1fF77lNDPyVrFVHb5ufthNT0aoR3kFlO2zTvs', '林雅呀', '1', '1', '2017-04-26 14:25:01', '2017-04-27 18:18:31', null);
INSERT INTO `wc_managers` VALUES ('4', 'user', null, null, '$2y$10$vNEiuYi4LOiqR1U3S9xLYeIz6GRQJ/d3c0dcs2WQLsy6aRvtGXMr2', 'QYFMZQkZa06z6RLabsV0BzvKIFp36Xjr4tXgAlsEJWW6sBIXBZGKFlbRPd6x', null, '1', '1', '2017-04-27 18:17:54', '2017-04-27 18:24:37', null);
INSERT INTO `wc_managers` VALUES ('5', 'username', '1523@qq.com', '13111111111', '$2y$10$pOUtEYAi8lX1MNN2Nhb8juFz6GPL6izEkotWCswEO9KV.sx.wiLfq', null, 'afa', '0', '1', '2017-04-27 18:21:43', '2017-04-27 18:21:43', null);
INSERT INTO `wc_managers` VALUES ('6', 'gh1234', null, null, '$2y$10$g.KQHmsMw90iVqWldrM8LOf9o8cgWGR36DzUQ73ShFY2WTJe7U1Fa', 'w7K9N4V443NEBOc0gShLvQm6qY2ksjKYMqaYGMp1PlDUXc0woNC0H32Eg8R9', null, '0', '1', '2017-05-15 10:30:03', '2017-05-16 13:52:34', null);
INSERT INTO `wc_managers` VALUES ('7', 'test1', '359824500@qq.com', '13958582828', '$2y$10$s68nITa229WFg5VornvGheoDDnPjzYxTXr0L0vR1smtphVS58lsFS', null, '111', '1', '1', '2017-05-15 13:54:30', '2017-05-15 14:00:19', null);
INSERT INTO `wc_managers` VALUES ('8', 'regtest', null, null, '$2y$10$mVVo4rYd3uD5F15u5y5W4eAKlMX7EfC/xNlSyVHpxDytjdyhY3o0i', 'emaSTZcNuApdgMPCaZJF4TZWcq027rDrrjmbXTcqZZDuCik72DPDQqxtk0Fo', null, '0', '0', '2017-05-18 13:40:40', '2017-05-18 14:47:26', null);
INSERT INTO `wc_managers` VALUES ('9', 'abctest', null, null, '$2y$10$NrcPrqed43clR6XgtvYcAehlOk8Y6s5ePK//Co38bbCVHfwYMMElS', 'np4jR3Cf3Nz6bTgw8Yp0OvoNAzlEtKnXs2ObZSBFu4IrvKZFCXHLZpkh7bD4', null, '0', '1', '2017-05-18 15:08:24', '2017-05-22 14:11:26', null);

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
-- Table structure for wc_products
-- ----------------------------
DROP TABLE IF EXISTS `wc_products`;
CREATE TABLE `wc_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '所属公司id',
  `product_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品名',
  `product_url` varchar(255) DEFAULT NULL COMMENT '产品链接',
  `product_img` varchar(255) DEFAULT NULL COMMENT '产品图片',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_at` timestamp NULL DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `wc_products_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `wc_companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COMMENT='产品表';

-- ----------------------------
-- Records of wc_products
-- ----------------------------
INSERT INTO `wc_products` VALUES ('1', null, 'asdf', 'asdf', null, '2017-05-23 09:22:01', '2017-05-23 09:22:01', null);
INSERT INTO `wc_products` VALUES ('2', null, 'frfrfrrrrrrrrrr', 'frfrfr44444', null, '2017-05-24 17:24:25', '2017-05-24 17:24:25', '2017-05-24 17:24:25');
INSERT INTO `wc_products` VALUES ('3', null, 'rfrf', 'rrfeer', null, '2017-05-23 09:32:09', '2017-05-23 09:32:09', null);
INSERT INTO `wc_products` VALUES ('4', null, 'frj', 'jjj', null, '2017-05-23 09:33:11', '2017-05-23 09:33:11', null);
INSERT INTO `wc_products` VALUES ('6', null, 'yhy', 'hyyhy', null, '2017-05-23 09:39:44', '2017-05-23 09:39:44', null);
INSERT INTO `wc_products` VALUES ('8', null, 'kjuhh', 'fffff', null, '2017-05-23 11:00:24', '2017-05-23 11:00:24', null);
INSERT INTO `wc_products` VALUES ('9', null, 'jht', 'fffffhyj', null, '2017-05-23 11:01:37', '2017-05-23 11:01:37', null);
INSERT INTO `wc_products` VALUES ('10', null, 'ffjk', 'jhyhyy', null, '2017-05-23 11:25:17', '2017-05-23 11:25:17', null);
INSERT INTO `wc_products` VALUES ('11', null, 'kjyhgf', 'gtrfd', null, '2017-05-23 11:26:10', '2017-05-23 11:26:10', null);
INSERT INTO `wc_products` VALUES ('12', null, 'xed', 'dedede', null, '2017-05-23 11:31:35', '2017-05-23 11:31:35', null);
INSERT INTO `wc_products` VALUES ('15', null, 'deed', 'gggg', null, '2017-05-23 15:07:58', '2017-05-23 15:07:58', null);
INSERT INTO `wc_products` VALUES ('16', null, '反而份儿饭 ', 'ewedewde', null, '2017-05-23 15:10:02', '2017-05-23 15:10:02', '2017-05-23 15:10:02');
INSERT INTO `wc_products` VALUES ('17', null, 'frrff', 'erergerg', null, '2017-05-23 15:26:12', '2017-05-23 15:26:12', null);
INSERT INTO `wc_products` VALUES ('18', null, 'cdeded', 'wdwdw', null, '2017-05-23 15:51:21', '2017-05-23 15:51:21', null);
INSERT INTO `wc_products` VALUES ('20', null, 'deded', 'dede', null, '2017-05-23 16:51:42', '2017-05-23 16:51:42', null);
INSERT INTO `wc_products` VALUES ('21', null, 'frefr', 'rfre', null, '2017-05-23 16:54:15', '2017-05-23 16:54:15', null);
INSERT INTO `wc_products` VALUES ('22', null, '12', '1', null, '2017-05-24 16:51:43', '2017-05-24 16:51:43', '2017-05-24 16:51:43');
INSERT INTO `wc_products` VALUES ('25', null, 'errrrrfrf111', 'tertreter', null, '2017-05-24 17:25:12', '2017-05-24 17:25:12', '2017-05-24 17:25:12');
INSERT INTO `wc_products` VALUES ('26', null, '123', '3123', null, '2017-05-24 18:21:42', '2017-05-24 18:21:42', null);
INSERT INTO `wc_products` VALUES ('27', null, 'sadt', '123sadf', '0', '2017-05-24 18:24:10', '2017-05-24 18:24:10', null);
INSERT INTO `wc_products` VALUES ('28', null, '123', '123', '0', '2017-05-24 18:31:20', '2017-05-24 18:31:20', null);
INSERT INTO `wc_products` VALUES ('29', '39', '1234', '142', 'uploads/company/strong/products/img1495621934.png', '2017-05-24 18:32:14', '2017-05-24 18:32:14', null);
INSERT INTO `wc_products` VALUES ('30', '39', 'sdaf', 'sdaf', 'uploads/company/strong/products/img1495622296.png', '2017-05-24 18:38:17', '2017-05-24 18:38:17', null);
INSERT INTO `wc_products` VALUES ('31', '47', '564548', '555656', 'uploads/company/asdf/products/img1495622608.jpg', '2017-05-24 18:43:28', '2017-05-24 18:43:28', null);
INSERT INTO `wc_products` VALUES ('32', '39', 'hhug', '45645', 'uploads/company/1495622702/products/img1495622702.jpg', '2017-05-24 18:45:02', '2017-05-24 18:45:02', null);

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
  `name` varchar(255) DEFAULT NULL COMMENT '模板名',
  `file` varchar(255) DEFAULT NULL,
  `type` tinyint(4) unsigned DEFAULT NULL COMMENT '使用范围，0-全部，1-个人，2-公司',
  `display_name` varchar(255) DEFAULT NULL COMMENT '模板中文',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `templates_name_unique` (`name`) USING BTREE,
  KEY `wc_templates_manager_id` (`manager_id`),
  CONSTRAINT `wc_templates_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `wc_managers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of wc_templates
-- ----------------------------
INSERT INTO `wc_templates` VALUES ('6', '1', 'W0001', 'templates/W0001', '1', '个人模板001', '2017-05-24 14:09:02', '2017-05-24 14:09:02');
INSERT INTO `wc_templates` VALUES ('12', '1', 'W0002', 'templates/W0002', '1', '个人模板002', '2017-05-24 17:34:16', '2017-05-24 17:34:16');
INSERT INTO `wc_templates` VALUES ('14', '1', 'W00011', 'templates/W0001', '0', '个人模板001', '2017-05-24 14:09:02', '2017-05-24 14:09:02');
INSERT INTO `wc_templates` VALUES ('15', '1', 'W00021', 'templates/W0002', '2', '个人模板002', '2017-05-24 17:34:16', '2017-05-24 17:34:16');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='模板使用 关系表（多对多、多态）';

-- ----------------------------
-- Records of wc_template_useable
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
  `nickname` varchar(30) DEFAULT NULL COMMENT '昵称中文姓名',
  `avatar` text COMMENT '头像',
  `sex` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '性别，0-未知，1-男，2-女',
  `description` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `oauth_weixin` varchar(255) DEFAULT NULL COMMENT '第三方授权微信',
  `is_active` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否可用，0-停用，1-可用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_unique` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of wc_users
-- ----------------------------
INSERT INTO `wc_users` VALUES ('40', 'Hsieh', '1195015834@qq.com', null, '$2y$10$EpikY0DGXqrc1WYSSgZE1.Qja4l.L7W7C6B5hmZGQxYf2oYLmmBL2', 'ebFHXWB9bd8Spklni0nKboMUb6z1jUbFALbOcKbI6CGZMhXIXulPaxXhOVey', '谢大琦', 'uploads/user/Hsieh/img1494553180.jpg', '1', '2017 NBA 总冠军 克利夫兰 骑士', null, '1', '2017-05-05 15:32:50', '2017-05-23 10:05:22', null);
INSERT INTO `wc_users` VALUES ('41', 'gh', '611@qq.com', '15555555555', '$2y$10$w88R0ECBTZvyWOK0ygQDm.Of/Dz3OypRBLVDVBX71TB54fDjalklK', 'Iqq7WnKlpQCprHTX6cdnQVwnj3nv0XAhnYcomsScu7tf66y9NQAqjzjGfUbH', 'gg', 'uploads/user/gh/img1494832088.png', '2', 'gg', null, '1', '2017-05-05 16:31:48', '2017-05-15 15:21:34', null);
INSERT INTO `wc_users` VALUES ('42', 'test', 'test@qq.com', null, '$2y$10$qtqFzvlgolbgHaGP9WMlT.vtlrE5Sv2o/KIWDNcHAt4zPKWqoNfhC', null, '测试专用号', 'uploads/user/test/img1494214725.png', '0', null, null, '1', '2017-05-08 11:38:45', '2017-05-08 11:38:45', null);
INSERT INTO `wc_users` VALUES ('43', 'AAA', null, null, '$2y$10$SkCKlwnn9JbfAdRP8MXtaeRvJS2FppSA3mpCd1Oxt/CkHmxIhYkF2', null, null, null, '0', null, null, '1', '2017-05-09 08:59:40', '2017-05-09 08:59:40', null);
INSERT INTO `wc_users` VALUES ('44', 'userforest001', '164252855@qq.com', '18259175011', '$2y$10$EE6LZ.oxqU5QpWOkZtn7ieqiNq90fhDIUuK7R5piDdd4ldxzmfMBO', 'LumxHygeodOvO0vFeGabfRD9pjhohgecQgyqGmkDO1vKGZzEiZpyMaw88YgN', '我的用户名森林001', 'uploads/user/userforest001/img1494291905.jpg', '2', '森林001', null, '1', '2017-05-09 09:05:05', '2017-05-09 16:39:55', null);
INSERT INTO `wc_users` VALUES ('46', 'adduser', '111111@qq.com', '13232323240', '$2y$10$umnPHmZvmQIallDcFFLY3eVcq83XC.c7YKkuEiRDp.c3dZD7Cfww.', '7cakrASYfgcsurUD8B4dwHizlBAGEF4xlxwWnfjE4bL1NXDpJLiIuiv4Vfwx', '添加用户', 'uploads/user/adduser/img1494320404.jpg', '0', '001', null, '1', '2017-05-09 16:39:35', '2017-05-09 17:22:30', null);
INSERT INTO `wc_users` VALUES ('47', 'gaohan', null, null, '$2y$10$MCg9vR7B6AXtZXF8oayoqewCewnDRhwk1wfrVG14k.2SOH/0vkaOC', null, null, null, '0', null, null, '1', '2017-05-15 11:00:12', '2017-05-15 11:00:12', null);
INSERT INTO `wc_users` VALUES ('48', 'gaohan1', null, null, '$2y$10$Mx/dTs26fmRX2MER0HYaq.GmPUhu43m/jaq1dWqiJ0OgTolHP98ou', null, null, null, '0', null, null, '1', '2017-05-15 11:29:55', '2017-05-15 11:29:55', null);
INSERT INTO `wc_users` VALUES ('49', 'user', null, null, '$2y$10$XwtUuIj.HuA4CZjMzHak2OkWtzeS.OFysz9CJx8N.TP3mv2008iWG', null, null, null, '0', null, null, '1', '2017-05-15 13:51:00', '2017-05-15 13:51:00', null);
INSERT INTO `wc_users` VALUES ('50', 'abb', null, null, '$2y$10$6VLOAG0TmcpE0bngpiQdwed.QmooMCs/5sL0aUHQdz494y0BnNCk2', null, null, null, '0', null, null, '1', '2017-05-16 13:44:17', '2017-05-16 13:44:17', null);
INSERT INTO `wc_users` VALUES ('51', 'asdf', null, null, '$2y$10$8T.K28cl5si57HVh2iTP4ewz6k/Wy7jO93I/wFCWGK7nOpOU2cKoG', null, null, null, '1', null, null, '1', '2017-05-19 14:52:59', '2017-05-19 14:52:59', null);
