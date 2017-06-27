/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : weicard

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-06-27 20:12:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wc_cardcases
-- ----------------------------
DROP TABLE IF EXISTS `wc_cardcases`;
CREATE TABLE `wc_cardcases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '所属收藏人',
  `group_id` int(10) unsigned DEFAULT NULL COMMENT '所在分组',
  `follower_id` int(10) unsigned DEFAULT NULL COMMENT '关注者id',
  `follower_type` varchar(30) DEFAULT NULL COMMENT '模型类名，例App\\Models\\User',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `wc_cardcases_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wc_cardcases_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `wc_groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='名片夹';

-- ----------------------------
-- Records of wc_cardcases
-- ----------------------------
INSERT INTO `wc_cardcases` VALUES ('28', '41', null, '29', 'App\\Models\\Employee', null, '2017-06-20 15:22:18', null);
INSERT INTO `wc_cardcases` VALUES ('30', '40', '36', '41', 'App\\Models\\User', null, '2017-06-19 15:22:18', null);
INSERT INTO `wc_cardcases` VALUES ('32', '40', null, '29', 'App\\Models\\Employee', null, '2017-06-20 15:22:18', null);
INSERT INTO `wc_cardcases` VALUES ('33', '61', null, '29', 'App\\Models\\Employee', null, '2017-06-20 15:22:18', null);
INSERT INTO `wc_cardcases` VALUES ('34', '61', null, '40', 'App\\Models\\User', null, '2017-06-20 15:22:18', null);
INSERT INTO `wc_cardcases` VALUES ('35', '40', null, '61', 'App\\Models\\User', null, '2017-05-20 15:22:18', null);
INSERT INTO `wc_cardcases` VALUES ('36', '52', null, '61', 'App\\Models\\User', null, '2017-06-20 15:22:18', null);
INSERT INTO `wc_cardcases` VALUES ('38', '61', null, '52', 'App\\Models\\User', null, '2017-06-20 15:22:18', null);
INSERT INTO `wc_cardcases` VALUES ('41', '62', null, '29', 'App\\Models\\Employee', null, '2017-06-20 15:22:18', null);
INSERT INTO `wc_cardcases` VALUES ('43', '41', null, '61', 'App\\Models\\User', null, '2017-06-20 15:22:18', null);
INSERT INTO `wc_cardcases` VALUES ('46', '52', null, '41', 'App\\Models\\User', null, '2017-06-20 15:22:18', null);
INSERT INTO `wc_cardcases` VALUES ('48', '40', null, '53', 'App\\Models\\Employee', null, '2017-06-06 15:22:18', null);
INSERT INTO `wc_cardcases` VALUES ('49', '42', null, '41', 'App\\Models\\User', null, '2017-06-26 16:46:03', '16:46:03');

-- ----------------------------
-- Table structure for wc_circles
-- ----------------------------
DROP TABLE IF EXISTS `wc_circles`;
CREATE TABLE `wc_circles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '圈子名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='圈子';

-- ----------------------------
-- Records of wc_circles
-- ----------------------------

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
  `limit` varchar(255) DEFAULT '' COMMENT '员工人数上线',
  `is_profilelink` int(10) DEFAULT NULL COMMENT '公司简介外链开关，0为关，1为开',
  `profilelink` varchar(255) DEFAULT NULL,
  `is_productlink` int(10) DEFAULT NULL,
  `productlink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_name_unique` (`name`) USING BTREE,
  KEY `wc_companies_user_id` (`user_id`),
  KEY `wc_companies_manager_id` (`manager_id`),
  CONSTRAINT `wc_companies_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `wc_managers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `wc_companies_user_id` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of wc_companies
-- ----------------------------
INSERT INTO `wc_companies` VALUES ('39', '40', 'strong', '强壮十分', 'uploads/company/strong/img1496627224.jpg', '软件园二期观日路', 'http://www.12t.cn', 'admin@strong.com', '0592-22223333', '十分强壮的公司', '1', null, '1', '2017-05-05 15:14:30', '2017-06-05 09:48:40', '2017-06-05 09:48:40', null, '118.189635', '24.491177', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('40', '41', 'ceshi', '厦门易尔通网络科技有限公司', 'uploads/company/ceshi/img1495796223.png', '厦门市思明区软件园二期观日路36号201单元', 'http://www.12t.cn', 'tousu@xm12t.com', '0592-3503777', '2005年，易尔通被百度授权建立了厦门地区“百度厦门营销服务中心”，该服务中心为厦门地区的百度客户提供专业的服务。2007年11月，百度正式授权易尔通为福建漳州、龙岩地区核心代理。\r\n目前我们的客户服务中心为厦门、泉州、漳州、龙岩及周边地区的百度客户在“咨询服务”、“开户服务”、“关键字管理 ”到“效果跟踪报告”方面提供服务。让客户充分体验产品加上专业的服务才能在网络推广中获得效益。', '1', null, '1', '2017-05-05 16:33:53', '2017-05-27 17:42:20', '2017-05-27 17:42:20', null, '118.191713', '24.490425', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('41', null, 'ABC', 'ABC', null, null, 'http://www.12t.cn', null, null, null, '1', null, '1', '2017-05-09 08:58:59', '2017-05-09 10:09:13', '2017-05-09 08:58:59', null, '118.189635', '24.491177', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('42', '44', 'cpforest001', '公司森林001', 'uploads/company/cpforest001/img1494291962.png', null, 'http://www.12t.cn', null, null, null, '1', null, '1', '2017-05-09 09:06:02', '2017-05-09 09:08:49', '2017-05-09 09:06:02', null, '118.189635', '24.491177', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('43', null, 'COMPANY1', 'COMPANY', null, null, 'http://www.12t.cn', null, null, null, '1', null, '1', '2017-05-09 09:40:06', '2017-05-09 09:49:36', '2017-05-09 09:40:05', null, '118.189635', '24.491177', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('44', '69', 'gongsiceshi', '公司测试', 'uploads/company/gongsiceshi/img1496298504.jpg', null, 'http://www.12t.cn', null, null, null, '0', null, null, '2017-05-25 09:45:49', '2017-06-01 14:28:24', '2017-05-25 09:45:57', null, '118.189635', '24.491177', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('45', '61', 'test', '测试公司', 'uploads/company/test/img1495864577.png', '厦门市思明区软件园二期观日路36号201单元 ', 'http://www.12t.cn', 'xxxxxxxx1@qq.com', '3500001', '测试公司简介--测试公司简介--测试公司简介--测试公司简介--测试公司简介--测试公司简介', '0', null, null, '2017-05-27 13:56:17', '2017-05-27 14:07:01', '2017-05-27 13:56:54', null, '118.191054', '24.49056', '100', null, null, null, null);

-- ----------------------------
-- Table structure for wc_departments
-- ----------------------------
DROP TABLE IF EXISTS `wc_departments`;
CREATE TABLE `wc_departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '所属公司id',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '所属上级部门',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门名字',
  `employee_id` int(10) unsigned DEFAULT NULL COMMENT '部门负责人',
  `is_open` tinyint(4) unsigned DEFAULT NULL COMMENT '是否全公司查看',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
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
  `nickname` varchar(255) DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) DEFAULT NULL COMMENT '员工头像',
  `email` varchar(255) DEFAULT NULL COMMENT '工作邮箱',
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
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of wc_employees
-- ----------------------------
INSERT INTO `wc_employees` VALUES ('28', '39', null, null, '40', 'S00002', '测试员', null, null, null, '0592-43124111', '2017-05-05 16:34:10', '2017-06-01 14:02:26', null);
INSERT INTO `wc_employees` VALUES ('29', '40', null, '11', '41', 'Y00001', '高涵', null, 'gaohan@xm12t.com', '13656555555', '0592-0592123', '2017-05-05 16:35:33', '2017-06-02 09:14:35', null);
INSERT INTO `wc_employees` VALUES ('30', '39', null, null, null, 'S00001', '谢大琦', null, null, '18450104513', '464132749', '2017-05-05 17:17:49', '2017-05-27 10:49:24', null);
INSERT INTO `wc_employees` VALUES ('32', '39', null, null, null, 'S8946313', '阿斯蒂芬111', 'uploads/employee/S8946313/img1494041632.jpg', null, null, null, '2017-05-05 19:22:05', '2017-05-22 16:20:19', null);
INSERT INTO `wc_employees` VALUES ('33', '40', null, null, null, 'Y123115', 'DAG1', 'uploads/employee/Y123115/img1493983631.jpg', null, null, null, '2017-05-05 19:27:11', '2017-05-05 19:27:54', null);
INSERT INTO `wc_employees` VALUES ('34', '39', null, null, '42', 'S127486', '前台添加', null, null, null, null, '2017-05-05 19:30:23', '2017-05-08 11:39:55', null);
INSERT INTO `wc_employees` VALUES ('38', '39', null, null, null, 'asdf111', 'asdg', null, null, null, null, '2017-05-06 11:04:58', '2017-05-16 14:20:00', null);
INSERT INTO `wc_employees` VALUES ('39', '39', null, null, null, 'zcx134', 'dsaf', null, null, null, null, '2017-05-06 11:08:33', '2017-05-06 11:08:33', null);
INSERT INTO `wc_employees` VALUES ('40', '39', null, null, null, 'config', 'config', null, null, null, null, '2017-05-06 11:10:25', '2017-05-06 11:10:25', null);
INSERT INTO `wc_employees` VALUES ('41', '39', null, null, null, 'test444', 'tset444', 'uploads/employee/test444/img1494040298.gif', null, null, null, '2017-05-06 11:11:38', '2017-05-06 11:11:38', null);
INSERT INTO `wc_employees` VALUES ('42', '39', null, null, null, 'L986', '124asd', 'uploads/employee/L986/img1494040402.gif', null, null, null, '2017-05-06 11:13:22', '2017-05-06 11:13:22', null);
INSERT INTO `wc_employees` VALUES ('43', '41', null, null, null, 'A00001', 'AAA', null, null, null, null, '2017-05-09 09:00:01', '2017-05-09 10:09:13', null);
INSERT INTO `wc_employees` VALUES ('44', '40', null, null, null, 'A1111', '1', null, null, null, '1', '2017-05-09 09:06:40', '2017-05-09 09:06:40', null);
INSERT INTO `wc_employees` VALUES ('45', '42', null, null, '44', 'C00001', '我的用户名森林001', null, null, null, null, '2017-05-09 09:08:49', '2017-05-09 09:08:49', null);
INSERT INTO `wc_employees` VALUES ('46', '42', null, null, null, 'C00002', '我的用户森林002', 'uploads/employee/C00002/img1494292189.jpg', null, null, '05925555555', '2017-05-09 09:09:49', '2017-05-09 09:09:49', null);
INSERT INTO `wc_employees` VALUES ('47', '42', null, null, null, 'C00003', '员工', null, null, null, null, '2017-05-09 09:17:08', '2017-05-09 09:17:08', null);
INSERT INTO `wc_employees` VALUES ('48', '40', null, null, null, 'a111', '1', null, null, null, null, '2017-05-09 09:33:25', '2017-05-09 09:33:25', null);
INSERT INTO `wc_employees` VALUES ('49', '43', null, null, null, 'C00001', 'USER1', null, null, null, null, '2017-05-09 09:40:17', '2017-05-09 09:49:36', null);
INSERT INTO `wc_employees` VALUES ('50', '41', null, null, null, 'A2212', '12212', null, null, null, null, '2017-05-09 10:15:04', '2017-05-09 10:15:04', null);
INSERT INTO `wc_employees` VALUES ('51', '42', null, null, '46', 'C0003', '第三个员工', null, null, null, null, '2017-05-09 16:36:05', '2017-05-09 16:40:44', null);
INSERT INTO `wc_employees` VALUES ('52', '44', null, null, '69', 'G00001', 'asdf', 'uploads/employee/G00001/img1496298481.png', null, null, null, '2017-05-25 09:46:09', '2017-06-01 14:28:01', null);
INSERT INTO `wc_employees` VALUES ('53', '45', null, '9', '61', 't00001', '开发人员', null, '525252525@qq.com', '13696955724', '7070707', '2017-05-27 13:57:48', '2017-06-01 17:23:33', null);
INSERT INTO `wc_employees` VALUES ('54', '45', null, '9', null, 't00002', '测试', 'uploads/employee/t00002/img1496365763.jpg', '12132312@qq.com', '13696969877', '0592-0592122', '2017-06-02 09:09:06', '2017-06-02 09:09:23', null);
INSERT INTO `wc_employees` VALUES ('55', '39', null, null, null, 'abc123', 'abc123', 'uploads/employee/abc123/img1496365941.gif', null, null, null, '2017-06-02 09:12:21', '2017-06-02 09:12:21', null);
INSERT INTO `wc_employees` VALUES ('56', '39', null, null, null, 'adsf', 'asdcs', null, null, null, null, '2017-06-05 09:22:53', '2017-06-05 09:22:53', null);
INSERT INTO `wc_employees` VALUES ('104', '39', null, null, null, '0001', '万大锤', null, 'abc@qq.com', '13012345678', '0592-3548145', null, null, null);
INSERT INTO `wc_employees` VALUES ('133', '39', null, null, null, '0010', '周惹发', null, 'abc@qq.com', '13012345678', '0592-3548154', '2017-06-06 16:04:47', null, null);
INSERT INTO `wc_employees` VALUES ('138', '39', null, null, null, 'AA0001', '万大锤', null, 'abc@qq.com', '13012345678', '0592-3548145', '2017-06-07 10:20:45', null, null);
INSERT INTO `wc_employees` VALUES ('139', '39', null, null, null, 'AA0010', '周惹发', null, 'abc@qq.com', '13012345678', '0592-3548154', '2017-06-07 10:20:45', null, null);
INSERT INTO `wc_employees` VALUES ('140', '39', null, null, null, '0002', '谢大脚', null, 'abc@qq.com', '13012345678', '0592-3548146', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('141', '39', null, null, null, '0003', '梧田淑', null, 'abc@qq.com', '13012345678', '0592-3548147', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('142', '39', null, null, null, '0004', '李世民', null, 'abc@qq.com', '13012345678', '0592-3548148', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('143', '39', null, null, null, '0005', '士力架', null, 'abc@qq.com', '13012345678', '0592-3548149', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('144', '39', null, null, null, '0006', '田大炜', null, 'abc@qq.com', '13012345678', '0592-3548150', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('145', '39', null, null, null, '0007', '李小二', null, 'abc@qq.com', '13012345678', '0592-3548151', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('146', '39', null, null, null, '0008', '赵晓娥', null, 'abc@qq.com', '13012345678', '0592-3548152', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('147', '39', null, null, null, '0009', '王大庆', null, 'abc@qq.com', '13012345678', '0592-3548153', '2017-06-07 14:28:42', null, null);

-- ----------------------------
-- Table structure for wc_groups
-- ----------------------------
DROP TABLE IF EXISTS `wc_groups`;
CREATE TABLE `wc_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '所属用户',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分组名',
  `order` tinyint(4) NOT NULL COMMENT '排序，默认分组为0，<0在之前，>0在之后',
  PRIMARY KEY (`id`),
  KEY `uesr_id` (`user_id`),
  CONSTRAINT `wc_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='名片夹分组 - 个人';

-- ----------------------------
-- Records of wc_groups
-- ----------------------------
INSERT INTO `wc_groups` VALUES ('1', '41', '测试群', '0');
INSERT INTO `wc_groups` VALUES ('17', '42', '123', '0');
INSERT INTO `wc_groups` VALUES ('36', '40', '同事', '0');

-- ----------------------------
-- Table structure for wc_icons
-- ----------------------------
DROP TABLE IF EXISTS `wc_icons`;
CREATE TABLE `wc_icons` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'icon id',
  `icon_name` varchar(255) DEFAULT NULL COMMENT 'icon名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wc_icons
-- ----------------------------
INSERT INTO `wc_icons` VALUES ('1', '&#xe645');
INSERT INTO `wc_icons` VALUES ('2', '&#xe63a');
INSERT INTO `wc_icons` VALUES ('3', '&#xe623');
INSERT INTO `wc_icons` VALUES ('4', '&#xe838');
INSERT INTO `wc_icons` VALUES ('5', '&#xe644');
INSERT INTO `wc_icons` VALUES ('6', '&#xe608');
INSERT INTO `wc_icons` VALUES ('7', '&#xe66c');
INSERT INTO `wc_icons` VALUES ('8', '&#xe657');
INSERT INTO `wc_icons` VALUES ('9', '&#xe664');
INSERT INTO `wc_icons` VALUES ('10', '&#xe6cb');
INSERT INTO `wc_icons` VALUES ('11', '&#xe714');
INSERT INTO `wc_icons` VALUES ('12', '&#xe654');
INSERT INTO `wc_icons` VALUES ('13', '&#xe602');
INSERT INTO `wc_icons` VALUES ('14', '&#xe661');

-- ----------------------------
-- Table structure for wc_links
-- ----------------------------
DROP TABLE IF EXISTS `wc_links`;
CREATE TABLE `wc_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微链接id',
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '所属公司id',
  `link_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '微链接名称',
  `link_url` varchar(255) DEFAULT NULL COMMENT '微链接网址',
  `link_img` varchar(255) DEFAULT NULL COMMENT '微链接图标',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `delete_at` timestamp NULL DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`),
  CONSTRAINT `wc_links_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `wc_companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='产品表';

-- ----------------------------
-- Records of wc_links
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of wc_managers
-- ----------------------------
INSERT INTO `wc_managers` VALUES ('1', 'admin', null, null, '$2y$10$mo/nyRnfB8nMia3Tix5kkeSoEVAsdC9.y/2xYfZjnUo9/3ZRaGlMq', 'rOCVHEvZ62itz4AvYjOuNnENkMcZBXlLghcIIc7MVj9rIz9vQGqXqKviBdLT', null, '1', '1', '2017-04-06 09:41:44', '2017-06-21 17:39:16', null);
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '公司ID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职位名',
  `is_only` tinyint(4) unsigned NOT NULL COMMENT '是否唯一，0-不唯一，1-唯一',
  `level` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wc_positions_company_id` (`company_id`),
  CONSTRAINT `wc_positions_company_id` FOREIGN KEY (`company_id`) REFERENCES `wc_companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='职位表';

-- ----------------------------
-- Records of wc_positions
-- ----------------------------
INSERT INTO `wc_positions` VALUES ('3', '39', '经理', '1', '1');
INSERT INTO `wc_positions` VALUES ('6', '44', '总裁', '1', '1');
INSERT INTO `wc_positions` VALUES ('7', '44', '员工', '0', '3');
INSERT INTO `wc_positions` VALUES ('8', '44', '经理', '0', '2');
INSERT INTO `wc_positions` VALUES ('9', '45', '开发人员', '0', '3');
INSERT INTO `wc_positions` VALUES ('10', '44', '总监', '0', '2');
INSERT INTO `wc_positions` VALUES ('11', '40', '测试专员', '0', '5');
INSERT INTO `wc_positions` VALUES ('12', '39', 'CEO', '0', '1');
INSERT INTO `wc_positions` VALUES ('13', '44', '你好', '0', '2');
INSERT INTO `wc_positions` VALUES ('14', '44', '你也好', '1', '2');

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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1 COMMENT='产品表';

-- ----------------------------
-- Records of wc_products
-- ----------------------------
INSERT INTO `wc_products` VALUES ('37', '40', 'E推', 'http://www.gbpen.com', 'uploads/company/12t/products/img1495796101.png', '2017-05-26 18:55:01', '2017-05-27 17:28:33', null);
INSERT INTO `wc_products` VALUES ('67', '40', 'E', 'http://www.gbpen.com', 'uploads/company/ceshi/products/img1495877356.jpg', '2017-05-27 17:29:16', '2017-05-27 17:29:16', null);
INSERT INTO `wc_products` VALUES ('124', '40', 'Ee', 'http://www.gbpen.com', 'uploads/company/ceshi/products/img1495877610.jpg', '2017-05-27 17:33:30', '2017-05-27 17:33:30', null);
INSERT INTO `wc_products` VALUES ('126', '40', '3', 'http://www.gbpen.com', 'uploads/company/ceshi/products/img1495877630.jpg', '2017-05-27 17:33:50', '2017-05-27 17:33:50', null);
INSERT INTO `wc_products` VALUES ('127', '40', '4', 'http://www.gbpen.com', 'uploads/company/ceshi/products/img1495877641.jpg', '2017-05-27 17:34:01', '2017-05-27 17:34:01', null);
INSERT INTO `wc_products` VALUES ('128', '40', '5', 'http://www.gbpen.com', 'uploads/company/ceshi/products/img1495877657.jpg', '2017-05-27 17:34:17', '2017-05-27 17:34:17', null);
INSERT INTO `wc_products` VALUES ('130', '44', 'test', 'http://www.baidu.com', 'uploads/company/gongsiceshi/products/img1496188132.png', '2017-05-31 07:48:52', '2017-05-31 07:48:52', null);
INSERT INTO `wc_products` VALUES ('131', '44', 'test', 'http://www.baidu.com', 'uploads/company/gongsiceshi/products/img1496188604.png', '2017-05-31 07:56:44', '2017-05-31 07:56:44', null);
INSERT INTO `wc_products` VALUES ('133', '44', 'fr', 'http://www.baidu.com', 'uploads/company/gongsiceshi/products/img1496221689.jpg', '2017-05-31 17:08:09', '2017-05-31 17:08:09', null);
INSERT INTO `wc_products` VALUES ('134', '44', '4', 'http://www.baidu.com', null, '2017-06-01 08:27:17', '2017-06-01 08:27:17', null);
INSERT INTO `wc_products` VALUES ('135', '44', 'dede', 'http://www.baidu.com', null, '2017-06-01 11:12:07', '2017-06-01 11:12:07', null);
INSERT INTO `wc_products` VALUES ('136', '44', 'edc', 'http://www.baidu.com', null, '2017-06-01 11:18:39', '2017-06-01 11:18:39', null);
INSERT INTO `wc_products` VALUES ('137', '44', 'adef', 'http://www.baidu.com', 'uploads/company/1496298465/products/img1496298465.png', '2017-06-01 14:27:36', '2017-06-01 14:27:45', null);
INSERT INTO `wc_products` VALUES ('138', '39', 'test', 'http://baidu.com', 'uploads/company/strong/products/img1496628666.jpg', '2017-06-05 09:24:06', '2017-06-05 10:11:06', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='标签';

-- ----------------------------
-- Records of wc_tags
-- ----------------------------
INSERT INTO `wc_tags` VALUES ('1', '40', 'ljk');
INSERT INTO `wc_tags` VALUES ('2', '40', 'ljk·');

-- ----------------------------
-- Table structure for wc_templates
-- ----------------------------
DROP TABLE IF EXISTS `wc_templates`;
CREATE TABLE `wc_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT '上传者id',
  `name` varchar(255) DEFAULT NULL COMMENT '模板名',
  `type` tinyint(4) unsigned DEFAULT NULL COMMENT '使用范围，0-全部，1-个人，2-公司',
  `file` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL COMMENT '模板中文',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `templates_name_unique` (`name`) USING BTREE,
  KEY `wc_templates_manager_id` (`manager_id`),
  CONSTRAINT `wc_templates_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `wc_managers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of wc_templates
-- ----------------------------
INSERT INTO `wc_templates` VALUES ('10', '1', 'W0001MCN01', '1', 'templates/W0001MCN01', '个人模板', '2017-06-02 15:31:51', '2017-06-02 15:38:35');
INSERT INTO `wc_templates` VALUES ('12', '1', 'W0002MCN01', '1', 'templates/W0002MCN01', '个人模板2', '2017-06-02 15:39:22', '2017-06-02 15:39:22');
INSERT INTO `wc_templates` VALUES ('13', '1', 'W0003MCN01', '2', 'templates/W0003MCN01', '企业模板', '2017-06-02 15:39:48', '2017-06-02 15:39:48');

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
INSERT INTO `wc_template_useable` VALUES ('13', '39', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('12', '40', 'App\\Models\\User');

-- ----------------------------
-- Table structure for wc_token
-- ----------------------------
DROP TABLE IF EXISTS `wc_token`;
CREATE TABLE `wc_token` (
  `access_token` varchar(255) DEFAULT NULL COMMENT 'access_token',
  `expires_in` varchar(255) DEFAULT NULL COMMENT 'token有效时间',
  `update_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wc_token
-- ----------------------------
INSERT INTO `wc_token` VALUES ('vlgYnaRwSQ3QPKxP1aAuskNeBwAXX5eiQH55OPENV8T0KcOMaDyA0lSKfb-jD1N-A_xhxN6MCQ-LltWtz2VQUT7KAFoIwK61zbrVqUqJq1n6nO5uzi3dQMgdT3ERIuadOHHhAAAIBB', '300', '1498524255');
INSERT INTO `wc_token` VALUES ('vlgYnaRwSQ3QPKxP1aAuskNeBwAXX5eiQH55OPENV8T0KcOMaDyA0lSKfb-jD1N-A_xhxN6MCQ-LltWtz2VQUT7KAFoIwK61zbrVqUqJq1n6nO5uzi3dQMgdT3ERIuadOHHhAAAIBB', '300', '1498524255');

-- ----------------------------
-- Table structure for wc_users
-- ----------------------------
DROP TABLE IF EXISTS `wc_users`;
CREATE TABLE `wc_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(11) DEFAULT NULL COMMENT '手机',
  `fax` varchar(30) DEFAULT NULL COMMENT '传真',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `remember_token` varchar(100) DEFAULT NULL COMMENT '记住我',
  `nickname` varchar(30) DEFAULT NULL COMMENT '昵称中文姓名',
  `avatar` text COMMENT '头像',
  `address` text COMMENT '地址',
  `homepage` varchar(255) DEFAULT NULL COMMENT '个人网址',
  `sex` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '性别，0-未知，1-男，2-女',
  `description` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `is_active` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否可用，0-停用，1-可用',
  `oauth_weixin` varchar(255) DEFAULT NULL COMMENT '第三方授权微信(unionID)',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_mobile_unique` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of wc_users
-- ----------------------------
INSERT INTO `wc_users` VALUES ('40', 'Hsieh', '1195015834@qq.com', '18450104513', null, '$2y$10$EpikY0DGXqrc1WYSSgZE1.Qja4l.L7W7C6B5hmZGQxYf2oYLmmBL2', 'KgrP79oH24PFlXyyxGT3YE5wsrrbpJErHIEdqq9nG3WmJ3eHaZXwCH62vFpS', '谢大琦', 'uploads/user/Hsieh/img1496388406.gif', null, null, '1', '2017 NBA 总冠军 克利夫兰 骑士', '1', 'oruQl1R-dyRj_O8yvnQhlj2SHT60', '2017-05-05 15:32:50', '2017-06-23 09:54:39', null);
INSERT INTO `wc_users` VALUES ('41', 'gh', '345@qq.com', '13881111245', null, '$2y$10$O9lVJi2sqmGYFwtJEC/k4OSw.Zq.iwD7WYZv6i.3YZl1UOXpu.P7e', 'egHHsr3zPOH3XDUcdAxcW1L7g9nSWQoGui0SKrFxdGpU8f5Fo0B3oW5GKAAR', '高涵', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5ZbBiaJjwNDRyUv1uuTJaC8Luz4YqvcR3fa5FdELDiaLsBqSyg4TYicDtlIVmSpqufgsbYpoN5wlmatydXJlrSH5l2/0', 'asdfghjk', null, '2', 'gg', '1', 'oruQl1Y6Z36gxIfNw0ArkLi3ChHI', '2017-05-05 16:31:48', '2017-05-31 16:51:31', null);
INSERT INTO `wc_users` VALUES ('42', 'test', 'test@qq.com', '13812345678', null, '$2y$10$qtqFzvlgolbgHaGP9WMlT.vtlrE5Sv2o/KIWDNcHAt4zPKWqoNfhC', 'CqCiIjoyJ3VkQLNTgCy3tagGNaJK7uXqVq5A3AYF8BJqWMVYcrOapR90ig2z', '测试专用号', 'uploads/user/test/img1494214725.png', null, null, '0', null, '1', null, '2017-05-08 11:38:45', '2017-06-23 14:50:13', null);
INSERT INTO `wc_users` VALUES ('44', 'userforest001', '164252855@qq.com', '18259175011', null, '$2y$10$EE6LZ.oxqU5QpWOkZtn7ieqiNq90fhDIUuK7R5piDdd4ldxzmfMBO', 'LumxHygeodOvO0vFeGabfRD9pjhohgecQgyqGmkDO1vKGZzEiZpyMaw88YgN', '我的用户名森林001', 'uploads/user/userforest001/img1494291905.jpg', null, null, '2', '森林001', '1', null, '2017-05-09 09:05:05', '2017-05-09 16:39:55', null);
INSERT INTO `wc_users` VALUES ('46', 'adduser', '111111@qq.com', '13232323240', null, '$2y$10$umnPHmZvmQIallDcFFLY3eVcq83XC.c7YKkuEiRDp.c3dZD7Cfww.', '7cakrASYfgcsurUD8B4dwHizlBAGEF4xlxwWnfjE4bL1NXDpJLiIuiv4Vfwx', '添加用户', 'uploads/user/adduser/img1494320404.jpg', null, null, '0', '001', '1', null, '2017-05-09 16:39:35', '2017-05-09 17:22:30', null);
INSERT INTO `wc_users` VALUES ('49', 'oruQl1TX8KYlfxEHSK806Wympyk4', null, null, null, '', null, 'X、H', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBLkTDAYtiavWrTW2KfXhFjuooevpVYbbPkQyicFNVmwrNZGakd9mseXIAORZApfQuWnk8f0fRrbmNg/0', null, null, '1', null, '1', 'oruQl1TX8KYlfxEHSK806Wympyk4', '2017-05-12 19:08:01', '2017-05-12 19:08:01', null);
INSERT INTO `wc_users` VALUES ('50', 'oruQl1TKTP7KP6RjZqJkS2Wvr_iA', null, null, null, '', 'MmOUbSA9tKnPl6Vi3d3tXdK2EJVRERu7zr3FeC0fJ2BOkJwbWn7Ogwy6zgAC', '桑树', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5ZbBiaJjwNDRyUv1uuTJaC8Luz4YqvcR3fa5FdELDiaLsBqSyg4TYicDtlIVmSpqufgsbYpoN5wlmatydXJlrSH5l2/0', null, null, '1', null, '1', 'oruQl1TKTP7KP6RjZqJkS2Wvr_iA', '2017-05-13 00:52:09', '2017-05-13 00:53:34', null);
INSERT INTO `wc_users` VALUES ('52', 'oruQl1VpTvnKeGmmA0dC8KPrHPzY', '111@qq.com', '13055208817', null, '', null, '陈杰', 'http://wx.qlogo.cn/mmopen/Jiavz9UrH80libDvR2Yic12kgyntKzNUYrNHnSyribMKaa1YiaytPckaunsEHHicl6kHPTvaQxeOdQ9tZSm99aIibzDKQ/0', '软件园二期望海路19号', null, '1', 'where there is a will , there is a way-jackychan', '1', 'oruQl1VpTvnKeGmmA0dC8KPrHPzY', '2017-05-15 10:07:58', '2017-05-27 15:16:55', null);
INSERT INTO `wc_users` VALUES ('61', 'oruQl1XAFK_yc6VCSATDnJwSIvDE', '527031738@QQ.com', '13696955724', null, '', 'dNXZW84xFTzf44Bg2DbK4p0mJLnCbkZbqXJGt8R2IYFAKHFnByEVpPZ2Rppb', '维了王', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIDp88vOQiawpPEyvlHo9nzM1lhSBmmC9uh4MmTjvsBe5N6ibDp8l9kvkuxMxlj9ZxwSUzefDTShJ3Q/0', '厦门', null, '1', '厦门易尔通', '1', 'oruQl1XAFK_yc6VCSATDnJwSIvDE', '2017-05-19 11:04:32', '2017-05-31 09:26:39', null);
INSERT INTO `wc_users` VALUES ('62', 'oruQl1TMWRsEd_LcV4Zrd4sVqsbA', 'wenhuay@12t.cn', '13666085526', null, '', null, 'WHY.SKY', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8bued0PicZIXfE82CAtliaibsuml4yoyKZscibpL0iaAEvLmW4HzaeJQddLTxzRho8owD6eJGn77L3SRmIVhz/0', '软件园二期', null, '2', null, '1', 'oruQl1TMWRsEd_LcV4Zrd4sVqsbA', '2017-05-22 11:33:25', '2017-05-27 16:53:02', null);
INSERT INTO `wc_users` VALUES ('63', 'oruQl1ZZAcOxdPOBXzKk09xrwpl0', null, null, null, '', null, '王大锤', 'http://wx.qlogo.cn/mmopen/5HkCBulJjD3mSGQ4NBCibiaXsLibVjicNLgXA82RWQYAmm7SAQliaX9XEakiaodzsFkdnh68cJeUvQ7GGoiaSdpjS5v9Iu2VB0NwPQQ/0', null, null, '1', null, '1', 'oruQl1ZZAcOxdPOBXzKk09xrwpl0', '2017-05-22 20:29:03', '2017-05-22 20:29:03', null);
INSERT INTO `wc_users` VALUES ('64', 'oruQl1ffYOU3LcTIPlCqnE5SDoqM', null, null, null, '', null, '百度罗秋龙', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQ43MiaXxWmzdVt6rrozKRAopOwFBg6h1GR71AYrSGSWCVvgvSOt0bI8GAMr5D0Eo6AcicKSHKjAKc3/0', null, null, '1', null, '1', 'oruQl1ffYOU3LcTIPlCqnE5SDoqM', '2017-05-23 09:38:55', '2017-05-23 09:38:55', null);
INSERT INTO `wc_users` VALUES ('65', 'oruQl1TEpTmdPslK_xlM4Josq6jY', null, null, null, '', null, '翔着咯', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q2ttraDQhibPchFjN3mib5ulIKbfMeiataG4Zx5QEWgCusEoI1ARHCKicdSvEQSPxI8iaBkn9FI7Y4dPk/0', null, null, '1', null, '1', 'oruQl1TEpTmdPslK_xlM4Josq6jY', '2017-05-23 11:00:06', '2017-05-23 11:00:06', null);
INSERT INTO `wc_users` VALUES ('66', 'oruQl1TfHCMVhdEvD5CPrSEbK8x0', null, null, null, '', null, '百度&逗逗', 'http://wx.qlogo.cn/mmopen/vuuV6iaddibEqUapZMLk7AvBWTGtJicmgQkDE6qPfqzn7EeAYE1PFFhyRrF8OK4R3phBnsgQIiczERqu1yWum3Q3fvbS8xvGdcsq/0', null, null, '2', null, '1', 'oruQl1TfHCMVhdEvD5CPrSEbK8x0', '2017-05-24 10:04:09', '2017-05-24 10:04:09', null);
INSERT INTO `wc_users` VALUES ('68', 'oruQl1Uzz7r3ls6YT_kcB8rvPmBU', '55@85.com', '13112345678', null, '', null, '快乐一家人', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc04PGjdyQICjLEk5CR6oVP1DALAWzdfswvTMU1IuhHARN7iabOfH7PyFlUWWP8DKuSWGmOL4oGykK/0', '5555', null, '1', '8569', '1', 'oruQl1Uzz7r3ls6YT_kcB8rvPmBU', '2017-05-24 10:12:12', '2017-06-01 13:58:50', null);
INSERT INTO `wc_users` VALUES ('69', 'asdf', null, null, null, '$2y$10$a/ZDTkOSse284ti/2m1Kq.4YFrW6jjKGECxC8v52vmVItsdmPkfL6', 'DNPxRuoFu4dFX4p2tamL3HOTXRkPkTgTvF9dwr5s6TJIwiYdiDLrLNx4ySjy', 'xsxs', null, null, null, '0', null, '1', null, '2017-05-25 09:44:54', '2017-06-01 11:12:47', null);
INSERT INTO `wc_users` VALUES ('70', 'oruQl1TWzPaS_-Dwjayi_OGKIH1Y', null, null, null, '', null, '陳超', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc2JXKz2EmpaFxZOhALAeBNws6jo0ck772LI1s4N9KzYtwfdoZ6fnhPPBgKBYicoFjWThZ7oHkaiaKT/0', null, null, '0', null, '1', 'oruQl1TWzPaS_-Dwjayi_OGKIH1Y', '2017-06-02 10:09:15', '2017-06-02 10:09:15', null);
