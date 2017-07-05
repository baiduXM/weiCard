/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : weicard

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-07-05 18:01:14
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `wc_cardcases_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wc_cardcases_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `wc_groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='名片夹';

-- ----------------------------
-- Records of wc_cardcases
-- ----------------------------
INSERT INTO `wc_cardcases` VALUES ('28', '41', null, '29', 'App\\Models\\Employee', null, '2017-06-20 15:22:18', '2017-06-28 15:22:00');
INSERT INTO `wc_cardcases` VALUES ('30', '40', '40', '41', 'App\\Models\\User', null, '2017-06-19 15:22:18', '2017-06-29 11:22:19');
INSERT INTO `wc_cardcases` VALUES ('32', '40', '39', '29', 'App\\Models\\Employee', null, '2017-06-20 15:22:18', '2017-06-28 18:43:08');
INSERT INTO `wc_cardcases` VALUES ('33', '61', null, '29', 'App\\Models\\Employee', null, '2017-06-20 15:22:18', '2017-06-28 15:22:00');
INSERT INTO `wc_cardcases` VALUES ('34', '61', null, '40', 'App\\Models\\User', null, '2017-06-20 15:22:18', '2017-06-28 15:22:00');
INSERT INTO `wc_cardcases` VALUES ('35', '40', null, '61', 'App\\Models\\User', null, '2017-05-20 15:22:18', '2017-06-29 11:22:10');
INSERT INTO `wc_cardcases` VALUES ('36', '52', null, '61', 'App\\Models\\User', null, '2017-06-20 15:22:18', '2017-06-28 15:22:00');
INSERT INTO `wc_cardcases` VALUES ('38', '61', null, '52', 'App\\Models\\User', null, '2017-06-20 15:22:18', '2017-06-28 15:22:00');
INSERT INTO `wc_cardcases` VALUES ('41', '62', null, '29', 'App\\Models\\Employee', null, '2017-06-20 15:22:18', '2017-06-28 15:22:00');
INSERT INTO `wc_cardcases` VALUES ('43', '41', null, '61', 'App\\Models\\User', null, '2017-06-20 15:22:18', '2017-06-28 15:22:00');
INSERT INTO `wc_cardcases` VALUES ('46', '52', null, '41', 'App\\Models\\User', null, '2017-06-20 15:22:18', '2017-06-28 15:22:00');
INSERT INTO `wc_cardcases` VALUES ('49', '42', null, '41', 'App\\Models\\User', null, '2017-06-26 16:46:03', '2017-06-28 15:22:00');

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
  `status` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '状态，0-待审核，1-审核通过，2-审核失败',
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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of wc_companies
-- ----------------------------
INSERT INTO `wc_companies` VALUES ('39', '40', 'strong', '强壮十分1', 'uploads/company/strong/img1496627224.jpg', '软件园二期观日路', 'http://www.12t.cn', 'admin@strong.com', '0592-22223333', '十分强壮的公司', '1', null, '1', '2017-05-05 15:14:30', '2017-07-05 17:54:48', '2017-06-05 09:48:40', null, '118.189635', '24.491177', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('40', '41', 'ceshi', '厦门易尔通网络科技有限公司', 'uploads/company/ceshi/img1495796223.png', '厦门市思明区软件园二期观日路36号201单元', 'http://www.12t.cn', 'tousu@xm12t.com', '0592-3503777', '2005年，易尔通被百度授权建立了厦门地区“百度厦门营销服务中心”，该服务中心为厦门地区的百度客户提供专业的服务。2007年11月，百度正式授权易尔通为福建漳州、龙岩地区核心代理。\r\n目前我们的客户服务中心为厦门、泉州、漳州、龙岩及周边地区的百度客户在“咨询服务”、“开户服务”、“关键字管理 ”到“效果跟踪报告”方面提供服务。让客户充分体验产品加上专业的服务才能在网络推广中获得效益。', '1', null, '1', '2017-05-05 16:33:53', '2017-05-27 17:42:20', '2017-05-27 17:42:20', null, '118.191713', '24.490425', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('41', null, 'ABC', 'ABC', null, null, 'http://www.12t.cn', null, null, null, '1', null, '1', '2017-05-09 08:58:59', '2017-05-09 10:09:13', '2017-05-09 08:58:59', null, '118.189635', '24.491177', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('42', '46', 'cpforest001', '公司森林001', 'uploads/company/cpforest001/img1494291962.png', null, 'http://www.12t.cn', null, null, null, '1', null, '1', '2017-05-09 09:06:02', '2017-07-05 17:52:20', '2017-05-09 09:06:02', null, '118.189635', '24.491177', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('43', null, 'COMPANY1', 'COMPANY', null, null, 'http://www.12t.cn', null, null, null, '1', null, '1', '2017-05-09 09:40:06', '2017-05-09 09:49:36', '2017-05-09 09:40:05', null, '118.189635', '24.491177', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('44', '69', 'gongsiceshi', '公司测试', 'uploads/company/gongsiceshi/img1496298504.jpg', null, 'http://www.12t.cn', null, null, null, '1', null, null, '2017-05-25 09:45:49', '2017-06-01 14:28:24', '2017-05-25 09:45:57', null, '118.189635', '24.491177', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('45', '61', 'test', '测试公司', 'uploads/company/test/img1495864577.png', '厦门市思明区软件园二期观日路36号201单元 ', 'http://www.12t.cn', 'xxxxxxxx1@qq.com', '3500001', '测试公司简介--测试公司简介--测试公司简介--测试公司简介--测试公司简介--测试公司简介', '1', null, null, '2017-05-27 13:56:17', '2017-05-27 14:07:01', '2017-05-27 13:56:54', null, '118.191054', '24.49056', '100', null, null, null, null);
INSERT INTO `wc_companies` VALUES ('46', '71', 'xm12t', '厦门12t', null, null, null, null, null, null, '1', null, '1', '2017-06-29 14:21:40', '2017-06-29 14:32:55', '2017-06-29 14:29:24', null, '118.189635', '24.491177', '100', null, null, null, null);

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
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `wc_departments_company_id` FOREIGN KEY (`company_id`) REFERENCES `wc_companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wc_departments_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `wc_employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部门表';

-- ----------------------------
-- Records of wc_departments
-- ----------------------------
INSERT INTO `wc_departments` VALUES ('21', '46', '0', '总经理室', '856', null, '2017-06-29 16:08:01', '2017-06-29 16:08:01');
INSERT INTO `wc_departments` VALUES ('22', '46', '0', '搜索事业部', null, null, '2017-06-29 16:08:01', '2017-06-29 16:08:01');
INSERT INTO `wc_departments` VALUES ('23', '46', '0', '技术运营中心', null, null, '2017-06-29 16:08:01', '2017-06-29 16:08:01');
INSERT INTO `wc_departments` VALUES ('24', '46', '0', '销售运营部', null, null, '2017-06-29 16:08:01', '2017-06-29 16:08:01');
INSERT INTO `wc_departments` VALUES ('25', '46', '0', '运营支持中心', null, null, '2017-06-29 17:12:12', '2017-06-29 17:12:12');
INSERT INTO `wc_departments` VALUES ('26', '46', '0', '品牌中心', null, null, '2017-06-29 17:12:13', '2017-06-29 17:12:13');
INSERT INTO `wc_departments` VALUES ('27', '46', '0', '财务部', null, null, '2017-06-29 17:12:13', '2017-06-29 17:12:13');
INSERT INTO `wc_departments` VALUES ('28', '46', '0', '金融产品中心', null, null, '2017-06-29 17:12:13', '2017-06-29 17:12:13');
INSERT INTO `wc_departments` VALUES ('29', '46', '0', '创新中心', null, null, '2017-06-29 17:12:13', '2017-06-29 17:12:13');
INSERT INTO `wc_departments` VALUES ('30', '46', '0', '滴滴事业部', null, null, '2017-06-29 17:12:13', '2017-06-29 17:12:13');
INSERT INTO `wc_departments` VALUES ('31', '46', '0', '客服运营部', null, null, '2017-06-29 18:00:15', '2017-06-29 18:00:15');
INSERT INTO `wc_departments` VALUES ('32', '46', '0', '人力行政中心', null, null, '2017-06-29 18:00:15', '2017-06-29 18:00:15');
INSERT INTO `wc_departments` VALUES ('69', '39', '0', '总经理室', null, null, '2017-06-29 19:02:21', '2017-06-29 19:02:21');
INSERT INTO `wc_departments` VALUES ('70', '39', '0', '客服运营部', '30', null, '2017-06-29 19:02:21', '2017-06-29 19:02:21');
INSERT INTO `wc_departments` VALUES ('71', '39', '0', '搜索事业部', null, null, '2017-06-29 19:02:21', '2017-06-29 19:02:21');
INSERT INTO `wc_departments` VALUES ('72', '39', '0', '运营支持中心', null, null, '2017-06-29 19:02:21', '2017-07-04 16:54:57');
INSERT INTO `wc_departments` VALUES ('73', '39', '0', '品牌中心', null, null, '2017-06-29 19:02:21', '2017-06-29 19:02:21');
INSERT INTO `wc_departments` VALUES ('74', '39', '0', '财务部', null, null, '2017-06-29 19:02:21', '2017-06-29 19:02:21');
INSERT INTO `wc_departments` VALUES ('75', '39', '0', '人力行政中心', null, null, '2017-06-29 19:02:21', '2017-06-29 19:02:21');
INSERT INTO `wc_departments` VALUES ('76', '39', '0', '技术运营中心', null, null, '2017-06-29 19:02:21', '2017-06-29 19:02:21');
INSERT INTO `wc_departments` VALUES ('77', '39', '0', '销售运营部', null, null, '2017-06-29 19:02:21', '2017-06-29 19:02:21');
INSERT INTO `wc_departments` VALUES ('78', '39', '0', '金融产品中心', null, null, '2017-06-29 19:02:21', '2017-06-29 19:02:21');
INSERT INTO `wc_departments` VALUES ('79', '39', '0', '市场部', null, null, '2017-06-29 19:02:21', '2017-06-29 19:02:21');
INSERT INTO `wc_departments` VALUES ('80', '39', '0', '创新中心', null, null, '2017-06-29 19:02:21', '2017-06-29 19:02:21');
INSERT INTO `wc_departments` VALUES ('81', '39', '0', '滴滴事业部', null, null, '2017-06-29 19:02:22', '2017-06-29 19:02:22');
INSERT INTO `wc_departments` VALUES ('82', '39', '0', '测试部门', null, null, '2017-07-04 16:56:13', '2017-07-04 16:56:13');

-- ----------------------------
-- Table structure for wc_dp2out
-- ----------------------------
DROP TABLE IF EXISTS `wc_dp2out`;
CREATE TABLE `wc_dp2out` (
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对外称呼'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of wc_dp2out
-- ----------------------------
INSERT INTO `wc_dp2out` VALUES ('总经理室', '总经理', '董事长');
INSERT INTO `wc_dp2out` VALUES ('总经理室', '副总经理', '副董事长');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '搜索销售事业部总经理', '事业部总经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '泉州总经理', '泉州区域总经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '漳州总经理', '漳州区域总经理 ');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '龙岩代理总经理', '龙岩区域总经理 ');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '运营支持总监', '漳龙区域运营支持总监');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售运营部总监', '销售总监');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '大区经理', '销售运营部区域总监');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '高级商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售助理', '营销总监助理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '直通车专员', '直通车专员');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '高级商务经理', '滴滴事业部总监');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '高级商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '滴滴助理', '滴滴助理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '总监', '运营总监');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '大区经理', '运营区域经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服主管', '客服主管');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服专员');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '经理助理', '运营助理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员（实习生）', '实习生 不印制名片');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '大区经理', '增值产品区域经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '产品专员');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '大区经理', '负责人');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '大区经理', '网盟经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '网盟经理', '维护部经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '产品经理', '产品经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '美工主管');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '美工主管', '网盟专员');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服主管', '客服主管');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '网盟专员', '网盟专员');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服专员');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '美工', '美工');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '大区经理', '金融产品总监');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '运营专员', '运营专员');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '风控专员', '风控专员');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '营销顾问', '营销顾问');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '销售工程师', '大客户总监');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '技术运营总监', '事业部总经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '高级商务经理', '高级商务经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '经理', '部门经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客户经理', '策划经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '策划专员', '高级策划');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '技术部经理', '技术部经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '程序组主管', '程序组主管');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '设计组主管', '设计组主管');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '程序员', '程序员');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '设计师', '设计师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '经理', '部门经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', 'BD经理', 'BD经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '设计部经理', '设计部经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '设计主管', '设计主管');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '前端工程师', '前端工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '前端工程师实习生', '实习生 不印制名片');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '设计师', '设计师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '研发经理', '研发经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '研发主管', '研发主管');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '产品经理', '产品经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', 'PHP程序员', 'PHP程序员');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', 'NET程序员', 'NET程序员');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '测试专员', '测试专员');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '大区经理', '网站客服区域经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '定单客服', '定单客服');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '定单控制组主管', '定单控制组主管');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '信息编辑组主管', '信息编辑组主管');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '质控主管', '质控主管');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客服主管', '客服主管');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '代理主管', '代理主管');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '基础组主管', '基础组主管');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓主管', '客拓主管');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '网站主管', '网站主管');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客服专员', '客服专员');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '定单专员', '定单专员');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '维护专员', '维护专员');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓专员', '客拓专员');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '网站客服', '网站客服');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客服大区助理', '客服大区助理');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '总监', '运营支持总监');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '风控监察经理', '风控监察部经理');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '风控监察专员', '风控监察专员');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '数据分析员', '数据分析员');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '分公司接口人', '运营支持助理');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '质控经理', '质控经理');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '直通车审核专员', '直通车审核专员');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '质控专员', '质控专员');
INSERT INTO `wc_dp2out` VALUES ('市场部', '市场经理', '市场总监');
INSERT INTO `wc_dp2out` VALUES ('市场部', '市场主管', '市场经理');
INSERT INTO `wc_dp2out` VALUES ('市场部', '市场专员', '市场主管');
INSERT INTO `wc_dp2out` VALUES ('市场部', '市场助理', '市场专员');
INSERT INTO `wc_dp2out` VALUES ('采购部', '采购主管', '采购经理');
INSERT INTO `wc_dp2out` VALUES ('财务部', '总监', '财务总监');
INSERT INTO `wc_dp2out` VALUES ('财务部', '财务经理', '财务经理');
INSERT INTO `wc_dp2out` VALUES ('财务部', '财务主管', '财务主管');
INSERT INTO `wc_dp2out` VALUES ('财务部', '主办会计', '主办会计');
INSERT INTO `wc_dp2out` VALUES ('财务部', '会计', '会计');
INSERT INTO `wc_dp2out` VALUES ('财务部', '财务专员', '财务专员');
INSERT INTO `wc_dp2out` VALUES ('财务部', '出纳专员', '出纳专员');
INSERT INTO `wc_dp2out` VALUES ('财务部', '财务支持', '财务支持');
INSERT INTO `wc_dp2out` VALUES ('创新中心', '总监', '创新中心总监');
INSERT INTO `wc_dp2out` VALUES ('创新中心', '经理', '创新中心经理');
INSERT INTO `wc_dp2out` VALUES ('创新中心', '项目专员', '项目专员');
INSERT INTO `wc_dp2out` VALUES ('创新中心', '公共关系专员', '公共关系专员');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '人力行政总监', '人力行政总监');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '人力行政经理', '人力行政经理');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '人力行政部主管', '人力行政主管');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '招聘主管', '招聘主管');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '行政主管', '行政主管');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '薪酬绩效主管', '薪酬绩效主管');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '招聘专员', '招聘专员');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '行政专员', '行政专员');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '薪酬绩效专员', '薪酬绩效专员');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '网络管理员', '网络管理员');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '行政司机', '行政司机');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '行政专员（兼会计）', '行政专员');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '培训经理', '培训经理');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '培训主管', '培训主管');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '培训专员', '培训专员');

-- ----------------------------
-- Table structure for wc_employees
-- ----------------------------
DROP TABLE IF EXISTS `wc_employees`;
CREATE TABLE `wc_employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '公司ID',
  `department_id` int(10) unsigned DEFAULT NULL COMMENT '部门ID',
  `position_id` int(10) unsigned DEFAULT NULL COMMENT '职位ID',
  `positions` varchar(255) DEFAULT NULL COMMENT '职位名称',
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
) ENGINE=InnoDB AUTO_INCREMENT=1201 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of wc_employees
-- ----------------------------
INSERT INTO `wc_employees` VALUES ('29', '40', null, '11', null, '41', 'Y00001', '高涵', null, 'gaohan@xm12t.com', '13656555555', '0592-0592123', '2017-05-05 16:35:33', '2017-06-02 09:14:35', null);
INSERT INTO `wc_employees` VALUES ('30', '39', '70', '185', '客服经理', '40', 'S00001', '谢大琦', null, null, '18768104513', '464132749', '2017-05-05 17:17:49', '2017-07-04 09:14:17', null);
INSERT INTO `wc_employees` VALUES ('33', '40', null, null, null, '42', 'Y123115', 'DAG1', 'uploads/employee/Y123115/img1493983631.jpg', null, null, null, '2017-05-05 19:27:11', '2017-07-05 15:16:08', null);
INSERT INTO `wc_employees` VALUES ('43', '41', null, null, null, null, 'A00001', 'AAA', null, null, null, null, '2017-05-09 09:00:01', '2017-05-09 10:09:13', null);
INSERT INTO `wc_employees` VALUES ('44', '40', null, null, null, null, 'A1111', '1', null, null, null, '1', '2017-05-09 09:06:40', '2017-05-09 09:06:40', null);
INSERT INTO `wc_employees` VALUES ('45', '42', null, null, null, null, 'C00001', '我的用户名森林001', null, null, null, null, '2017-05-09 09:08:49', '2017-07-05 17:59:47', null);
INSERT INTO `wc_employees` VALUES ('46', '42', null, null, null, null, 'C00002', '我的用户森林002', 'uploads/employee/C00002/img1494292189.jpg', null, null, '05925555555', '2017-05-09 09:09:49', '2017-05-09 09:09:49', null);
INSERT INTO `wc_employees` VALUES ('47', '42', null, null, null, null, 'C00003', '员工', null, null, null, null, '2017-05-09 09:17:08', '2017-05-09 09:17:08', null);
INSERT INTO `wc_employees` VALUES ('48', '40', null, null, null, null, 'a111', '1', null, null, null, null, '2017-05-09 09:33:25', '2017-05-09 09:33:25', null);
INSERT INTO `wc_employees` VALUES ('49', '43', null, null, null, null, 'C00001', 'USER1', null, null, null, null, '2017-05-09 09:40:17', '2017-05-09 09:49:36', null);
INSERT INTO `wc_employees` VALUES ('50', '41', null, null, null, null, 'A2212', '12212', null, null, null, null, '2017-05-09 10:15:04', '2017-05-09 10:15:04', null);
INSERT INTO `wc_employees` VALUES ('51', '42', null, null, null, '46', 'C0003', '第三个员工', null, null, null, null, '2017-05-09 16:36:05', '2017-05-09 16:40:44', null);
INSERT INTO `wc_employees` VALUES ('52', '44', null, null, null, '69', 'G00001', 'asdf', 'uploads/employee/G00001/img1496298481.png', null, null, null, '2017-05-25 09:46:09', '2017-06-01 14:28:01', null);
INSERT INTO `wc_employees` VALUES ('53', '45', null, '9', null, '61', 't00001', '开发人员', null, '525252525@qq.com', '13696955724', '7070707', '2017-05-27 13:57:48', '2017-06-01 17:23:33', null);
INSERT INTO `wc_employees` VALUES ('54', '45', null, '9', null, null, 't00002', '测试', 'uploads/employee/t00002/img1496365763.jpg', '12132312@qq.com', '13696969877', '0592-0592122', '2017-06-02 09:09:06', '2017-06-02 09:09:23', null);
INSERT INTO `wc_employees` VALUES ('148', '46', null, null, null, '71', 'xm12t001', 'abc', null, null, null, null, '2017-06-29 14:32:05', '2017-06-29 14:32:55', null);
INSERT INTO `wc_employees` VALUES ('856', '46', '21', null, null, null, '12t001', '牛宏翔', null, 'niu@12t.cn', '13860423411', '3503999', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('857', '46', '21', '26', null, null, '12t002', '朱凯民', null, 'zhu@12t.cn', '13606060050', '3503888', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('858', '46', null, null, null, null, '12txm002', '宋宇红', null, 'cs@12t.cn', '13459032306', '3503266', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('859', '46', '22', null, null, null, '12txm003', '赖爱华', null, 'aiwa@12t.cn', '13599540060', '3503777', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('860', '46', null, '27', null, null, '12txm219', '许国忠', null, 'xugzh@12t.cn', '13696906006', '3503333', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('861', '46', '25', '27', null, null, '12txm004', '王煜', null, 'cs1@12t.cn', '13806021412', '3503166', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('862', '46', '26', '28', null, null, '12txm006', '叶其煌', null, 'yeqh@12t.cn', '13850090199', '3503355', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('863', '46', null, null, null, null, '12txm011', '叶艳丽', null, 'cs12@12t.cn', '15259250114', '3503228', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('864', '46', null, null, null, null, '12txm012', '陈顺艺', null, 'cs11@12t.cn', '15980779522', '3503117', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('865', '46', '27', '29', null, null, '12txm013', '古淑敏', null, 'cs6@12t.cn', '13400658506', '3503566', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('866', '46', null, '30', null, null, '12txm014', '蔡秀娟', null, 'caixj@12t.cn', '3503618', '3503618', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('867', '46', '23', '31', null, null, '12txm021', '许雪炎', null, 'xuxy@12t.cn', '13606098429', '3503337', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('868', '46', null, null, null, null, '12txm023', '冯乔芳', null, 'cs4@12t.cn', '13950181406', '3503209', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('869', '46', '23', '27', null, null, '12txm026', '温华园', null, 'wenhy@12t.cn', '13666085526', '3503555', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('870', '46', '25', '32', null, null, '12txm028', '蔡丽燕', null, 'cs5@12t.cn', '18750209686', '3503276', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('871', '46', '24', '33', null, null, '12txm029', '苏勇填', null, 'suchen@12t.cn', '18906035211', '3503007', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('872', '46', null, null, null, null, '12txm030', '曾云图', null, 'cs17@12t.cn', '15060760757', '3503147', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('873', '46', '26', '34', null, null, '12txm031', '杨丹凤', null, 'yangdf@12t.cn', '15859245649', '3503004', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('874', '46', null, null, null, null, '12txm033', '叶文玲', null, 'cs20@12t.cn', '13625014527', '3503171', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('875', '46', '23', '35', null, null, '12txm034', '林志业', null, 'linzhy@xm12t.com', '13860430930', '3503680', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('876', '46', null, '36', null, null, '12txm043', '吴晓燕', null, 'cs24@12t.cn', '13400671062', '3503161', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('877', '46', '26', '28', null, null, '12txm046', '林锦珠', null, 'linjz@12t.cn', '15259250112', '3503100', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('878', '46', null, '36', null, null, '12txm051', '郑薇', null, 'cs22@12t.cn', '18205960073', '3503164', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('879', '46', '24', null, null, null, '12txm054', '陈伟平', null, 'chenwp@12t.cn', '13774651497', '3503085', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('880', '46', '24', '37', null, null, '12txm064', '吴茂林', null, 'wuml@12t.cn', '18250848084', '3503039', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('881', '46', null, '36', null, null, '12txm065', '苏雅玲', null, 'cs32@12t.cn', '15980938135', '3503214', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('882', '46', '23', '38', null, null, '12txm066', '林跃煌', null, 'linyh@xm12t.com', '13625010991', '3503336', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('883', '46', null, '36', null, null, '12txm079', '萧海华', null, 'cs25@12t.cn', '13459019395', '3503310', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('884', '46', null, '39', null, null, '12txm083', '胡晓坤', null, 'cs21@12t.cn', '15260211052', '3503283', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('885', '46', null, '39', null, null, '12txm098', '杨晶晶', null, 'cs26@12t.cn', '15860727940', '3503190', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('886', '46', null, null, null, null, '12txm099', '肖丽媛', null, 'cs33@12t.cn', '15960804450', '3503207', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('887', '46', null, '40', null, null, '12txm106', '黄紫超', null, 'cs35@12t.cn', '13600912969', '3503185', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('888', '46', '24', null, null, null, '12txm116', '林春强', null, 'linchq@xm12t.com', '15859245176', '3503128', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('889', '46', '23', '38', null, null, '12txm120', '吴桂月', null, 'wugy@xm12t.com', '15860737645', '3503319', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('890', '46', '23', null, null, null, '12txm126', '刘晓露', null, 'liuxl@xm12t.com', '13779989640', '3503788', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('891', '46', null, '41', null, null, '12txm157', '陈娉婷', null, 'chenpt@xm12t.com', '15980831214', '3503249', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('892', '46', '25', '42', null, null, '12txm158', '张燕玲', null, 'cs41@12t.cn', '13959234243', '3503239', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('893', '46', null, '39', null, null, '12txm162', '王婷婷', null, 'cs40@12t.cn', '18750212146', '3503157', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('894', '46', '25', '42', null, null, '12txm173', '殷莹', null, 'cs44@xm12t.com', '18759298534', '3503131', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('895', '46', '27', '43', null, null, '12txm202', '林小燕', null, 'linxy@12t.cn', '13459218581', '3503688', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('896', '46', null, null, null, null, '12txm154', '何薇莉', null, 'cs48@xm12t.com', '13779993827', '3503280', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('897', '46', null, '39', null, null, '12txm190', '叶玲', null, 'yeling@xm12t.com', '15959220762', '3503191', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('898', '46', null, '39', null, null, '12txm271', '方秋燕', null, 'cs65@xm12t.com', '15260228154', '3503162', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('899', '46', null, '44', null, null, '12txm272', '丁洁', null, 'cs69@xm12t.com', '15960384685', '3503170', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('900', '46', '26', '28', null, null, '12txm286', '伍金海', null, 'wujh@xm12t.com', '15959206290', '3503014', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('901', '46', '27', '45', null, null, '12txm287', '朱叶', null, 'zhuye@12t.cn', '15960206750', '3503588', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('902', '46', '28', null, null, null, '12txm317', '庄明俊', null, 'zhuangmingjun@xm12t.com', '13666096675', '3503248', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('903', '46', null, '46', null, null, '12txm349', '刘真真', null, 'cs77@xm12t.com', '18965192148', '3503281', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('904', '46', '23', '47', null, null, '12txm356', '李傲威', null, 'liaw@xm12t.com', '13606926361', '3503070', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('905', '46', null, '39', null, null, '12txm376', '李丹凤', null, 'cs14@12t.cn', '15980921132', '3503163', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('906', '46', null, '39', null, null, '12txm383', '陈雅玲', null, 'cs81@xm12t.com', '13696984057', '3503182', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('907', '46', '24', '33', null, null, '12txm393', '李春华', null, 'lich@xm12t.com', '15860715680', '3503027', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('908', '46', '27', '45', null, null, '12txm397', '施英英', null, 'shiyy@12t.cn', '13656030069', '3503688', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('909', '46', null, '48', null, null, '12txm424', '李瑞瑾', null, 'cs88@xm12t.com', '15259261503', '3503159', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('910', '46', '25', '49', null, null, '12txm452', '谢志强', null, 'xiezq@xm12t.com', '18689876560', '3503132', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('911', '46', null, '39', null, null, '12txm473', '葛晓丹', null, 'cs83@xm12t.com', '18650170762', '3503167', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('912', '46', null, '36', null, null, '12txm500', '朱惠敏', null, 'cs92@xm12t.com', '15960278173', '3503206', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('913', '46', null, '39', null, null, '12txm502', '陈东御', null, 'cs94@xm12t.com', '15805941596', '3503186', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('914', '46', '23', '38', null, null, '12txm509', '吴治毅', null, 'wuzy@xm12t.com', '18965824221', '3503343', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('915', '46', null, '36', null, null, '12txm523', '叶惠', null, 'cs93@xm12t.com', '18205925851', '3503215', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('916', '46', '25', '42', null, null, '12txm554', '唐燕平', null, 'cs104@xm12t.com', '18965809140', '3503262', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('917', '46', '24', '37', null, null, '12txm557', '王伟', null, 'wangwei@xm12t.com', '13774660045', '3503059', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('918', '46', '24', '37', null, null, '12txm576', '王晓亮1', null, 'wangxl@xm12t.com', '13459243275', '3503030', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('919', '46', null, '39', null, null, '12txm593', '庄秋菊', null, 'zhuangqj@xm12t.com', '15980770137', '3503197', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('920', '46', '23', '38', null, null, '12txm609', '温琴锋', null, 'wenqf@xm12t.com', '15980934561', '3503298', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('921', '46', '25', '50', null, null, '12txm703', '肖连峰', null, 'xiaolf@xm12t.com', '18659288826', '3503271', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('922', '46', null, '27', null, null, '12txm721', '陈谦', null, 'chenq@xm12t.com', '18650806005', '3503177', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('923', '46', null, '39', null, null, '12txm779', '周莉莉', null, 'zhoulili@xm12t.com', '13799276841', '3753743', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('924', '46', null, '36', null, null, '12txm781', '罗秀才', null, 'luoxiucai@xm12t.com', '15859183502', '3503184', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('925', '46', '23', null, null, null, '12txm782', '许警锋', null, 'xujingfeng@xm12t.com', '15280223151', '3503551', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('926', '46', null, '39', null, null, '12txm790', '林丹', null, 'lindan@xm12t.com', '15959389579', '3503218', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('927', '46', null, '39', null, null, '12txm792', '林旭芬', null, 'linxf@xm12t.com', '15260811568', '3503212', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('928', '46', '24', '37', null, null, '12txm796', '孙洛瑛', null, 'sunluoying@xm12t.com', '13695009693', '3503087', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('929', '46', null, '39', null, null, '12txm800', '叶姗姗', null, 'yeshanshan@xm12t.com', '15060139207', '3503174', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('930', '46', '24', null, null, null, '12txm832', '胡茜', null, 'huxi@xm12t.com', '18649668046', '3503115', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('931', '46', null, null, null, null, '12txm835', '李月芙', null, 'liyuefu@xm12t.com', '13950194871', '3503219', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('932', '46', null, '39', null, null, '12txm838', '陈巧云', null, 'chenqiaoyun@xm12t.com', '18559779800', '3503233', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('933', '46', '25', '51', null, null, '12txm872', '林燕华', null, 'linyanhua@xm12t.com', '13646029093', '3503114', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('934', '46', null, '52', null, null, '12txm873', '兰晓连', null, 'lanxl@xm12t.com', '15980834500', '3503252', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('935', '46', '24', '33', null, null, '12txm875', '王晓亮2', null, 'wangxiaoliang@xm12t.com', '15959355064', '3503237', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('936', '46', '23', '47', null, null, '12txm909', '林国协', null, 'linguoxie@xm12t.com', '13799260381', '3503558', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('937', '46', null, '39', null, null, '12txm933', '林晓珺', null, 'linxiaojun@xm12t.com', '15080019869', '3503200', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('938', '46', '24', '53', null, null, '12txm947', '何玉芳', null, 'faq@12t.cn', '15980950659', '3503388', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('939', '46', '25', '50', null, null, '12txm957', '王德发', null, 'wangdefa@xm12t.com', '15805931840', '3503272', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('940', '46', null, '36', null, null, '12txm962', '杨靖', null, 'yangjing@xm12t.com', '18250150639', '3503125', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('941', '46', '25', '42', null, null, '12txm981', '王晓露', null, 'wangxiaolu@xm12t.com', '13696937717', '3503238', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('942', '46', null, '39', null, null, '12txm1005', '叶晓欢', null, 'yexiaohuan@xm12t.com', '18030137801', '3503286', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('943', '46', null, '54', null, null, '12txm1016', '郑华', null, 'zhenghua@xm12t.com', '15059893596', '3503263', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('944', '46', '24', null, null, null, '12txm1021', '张路生', null, 'zhanglusheng@xm12t.com', '15080314851', '3503024', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('945', '46', '24', '33', null, null, '12txm1031', '刘纯伟', null, 'liuchunwei@xm12t.com', '13696992479', '3503020', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('946', '46', '25', '55', null, null, '12txm1044', '王忠忠', null, 'wangzhongzhong@xm12t.com', '18559655269', '3503320', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('947', '46', null, '39', null, null, '12txm1058', '萧月梅', null, 'xiaoyuemei@xm12t.com', '13959238510', '3503570', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('948', '46', '24', null, null, null, '12txm1064', '林景山', null, 'linjingshan@xm12t.com', '18250845345', '3503015', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('949', '46', '24', null, null, null, '12txm1081', '杨超', null, 'yangchao@xm12t.com', '13606923960', '3503066', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('950', '46', null, '56', null, null, '12txm1100', '周项委', null, 'zhouxiangwei@xm12t.com', '13720882900', '3503245', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('951', '46', null, '39', null, null, '12txm1115', '苏晓敏', null, 'suxiaomin@xm12t.com', '18259224881', '3503192', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('952', '46', null, '57', null, null, '12txm1133', '陈燕红', null, 'chenyanhong@xm12t.com', '18205940116', '3503060', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('953', '46', '23', null, null, null, '12txm1178', '彭丁超', null, 'pengdingchao@xm12t.com', '13696955724', '3503505', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('954', '46', '24', '37', null, null, '12txm1181', '郑景景', null, 'zhengjingjing@xm12t.com', '13101435755', '3503069', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('955', '46', '23', '47', null, null, '12txm1188', '曾佳敏', null, 'zengjiamin@xm12t.com', '18650493308', '3503093', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('956', '46', null, null, null, null, '12txm1201', '蔡莉娟', null, 'cailijuan@xm12t.com', '13806046019', '暂无', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('957', '46', null, '39', null, null, '12txm1211', '吴林英', null, 'wulinying@xm12t.com', '18150104501', '3503176', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('958', '46', '23', '38', null, null, '12txm1218', '庄凤麒', null, 'zhuangfengqi@xm12t.com', '15060667810', '3503003', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('959', '46', '26', '28', null, null, '12txm1224', '潘静', null, 'panjing@xm12t.com', '18695600089', '3503026', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('960', '46', null, '58', null, null, '12txm1225', '郭良燕', null, 'guoliangyan@xm12t.com', '18605929697', '3503000', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('961', '46', '23', '38', null, null, '12txm1273', '詹建美', null, 'zhanjianmei@xm12t.com', '13959272108', '3503575', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('962', '46', '24', null, null, null, '12txm1276', '叶晓强', null, 'yexiaoqiang@xm12t.com', '15260228322', '3503133', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('963', '46', '23', '28', null, null, '12txm1280', '张志谋', null, 'zhangzhimou@xm12t.com', '15860783104', '3503305', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('964', '46', null, '59', null, null, '12txm1284', '陈婧', null, 'chenjing@12t.cn', '15980833793', '3503599', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('965', '46', null, '36', null, null, '12txm1285', '黄锦华', null, 'huangjinhua@xm12t.com', '13606057365', '3503168', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('966', '46', '24', null, null, null, '12txm1290', '林洁', null, 'linjie@xm12t.com', '18659848091', '3503076', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('967', '46', null, '60', null, null, '12txm1306', '费吓娥', null, 'feixiae@xm12t.com', '15280671042', '3503151', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('968', '46', '24', null, null, null, '12txm1324', '连祖', null, 'lianzu@xm12t.com', '18659282264', '3503051', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('969', '46', '24', null, null, null, '12txm1331', '谌晓芳', null, 'chenxiaofang@xm12t.com', '18605971143', '3503063', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('970', '46', null, '36', null, null, '12txm1335', '钟竹轩', null, 'zhongzhuxuan@xm12t.com', '13385928316', '3503213', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('971', '46', '24', '33', null, null, '12txm1336', '帅莹', null, 'shuaiying@xm12t.com', '15979168090', '3503062', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('972', '46', '24', '37', null, null, '12txm1340', '蒋铃溪', null, 'jianglingxi@xm12t.com', '18850335545', '3503160', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('973', '46', '24', '37', null, null, '12txm1352', '潘彬', null, 'panbin@xm12t.com', '18059231115', '3503061\n', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('974', '46', '24', '37', null, null, '12txm1361', '毛冬荣', null, 'maodongrong@xm12t.com', '18850313778', '3503005', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('975', '46', null, '39', null, null, '12txm1374', '曾清桦', null, 'zengqinghua@xm12t.com', '13599913485', '3503291', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('976', '46', null, '39', null, null, '12txm1381', '黄锦丽', null, 'huangjinli@xm12t.com', '18359105925', '3503369', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('977', '46', null, '61', null, null, '12txm1382', '卢新文', null, 'luxinwen@xm12t.com', '13696956261', '3503299', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('978', '46', null, '39', null, null, '12txm1386', '谢仁杰', null, 'xierenjie@xm12t.com', '13696988947', '3503148', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('979', '46', '23', '47', null, null, '12txm1394', '刘松琼', null, 'liusongqiong@xm12t.com', '18850348235', '3503520', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('980', '46', '24', '33', null, null, '12txm1398', '黄旋', null, 'huangxuan@xm12t.com', '18459266624', '3503088', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('981', '46', null, '39', null, null, '12txm1423', '黄翠苹', null, 'huangcuiping@xm12t.com', '15606972990', '3503193', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('982', '46', null, '39', null, null, '12txm1437', '吴雪红', null, 'wuxuehong@xm12t.com', '18046050367', '3503073', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('983', '46', null, '39', null, null, '12txm1442', '代玉', null, 'daiyu@xm12t.com', '18758589868', '3503231', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('984', '46', null, '39', null, null, '12txm1443', '赖育琴', null, 'laiyuqin@xm12t.com', '18950169736\n', '3503210', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('985', '46', null, '39', null, null, '12txm1445', '陈美芳', null, 'chenmeifang@xm12t.com', '18250895002', '3503183', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('986', '46', '23', null, null, null, '12txm1448', '黄艺凤', null, 'huangyifeng@xm12t.com', '18359205220', '3503511', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('987', '46', '25', '42', null, null, '12txm1452', '吴鸿盛', null, 'wuhongsheng@xm12t.com', '15859210928', '3503277', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('988', '46', '24', null, null, null, '12txm1456', '陈星', null, 'chenxing@xm12t.com', '15880540857', '3503086', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('989', '46', '24', '37', null, null, '12txm584', '林培榕', null, 'linpeirong@xm12t.com', '13400606819', '3503079', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('990', '46', '23', '62', null, null, '12txm1467', '蒋丽洪', null, 'jianglihong@xm12t.com', '15280105956', '3503548', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('991', '46', null, '52', null, null, '12txm1470', '卓小玲', null, 'zhuoxiaoling@xm12t.com', '18250161173', '3503129', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('992', '46', '24', '33', null, null, '12txm1486', '李锦坤', null, 'lijinkun@xm12t.com', '13599525182', '3503121', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('993', '46', '23', '47', null, null, '12txm1515', '谢林林', null, 'xielinlin@xm12t.com', '15394455811', '3503065', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('994', '46', '24', null, null, null, '12txm1529', '余文', null, 'yuwen@xm12t.com', '18359195309', '3503315', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('995', '46', null, '52', null, null, '12txm1532', '陈泽龙', null, 'chenzelong@xm12t.com', '15160304886', '3503268', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('996', '46', '23', '63', null, null, '12txm1536', '陈静', null, 'chenjing@xm12t.com', '18250890507', '3503530', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('997', '46', '23', '63', null, null, '12txm1539', '石菊英', null, 'shijuying@xm12t.com', '13606050126', '3503541', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('998', '46', '23', '64', null, null, '12txm1553', '郑春桂', null, 'zhengchungui@xm12t.com', '18050121392', '3503524', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('999', '46', '24', null, null, null, '12txm1554', '周清标', null, 'zhouqingbiao@xm12t.com', '15280403389', '3503137', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1000', '46', null, '65', null, null, '12txm1577', '郑雄伟', null, 'zhengxiongwei@xm12t.com', '13400622193', '3503259', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1001', '46', null, '39', null, null, '12txm1586', '陈沅', null, 'chenyuan@xm12t.com', '18106961476', '3503165', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1002', '46', '23', '47', null, null, '12txm1587', '兰晓玲', null, 'lanxiaoling@xm12t.com', '18046311916', '3503230', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1003', '46', null, '39', null, null, '12txm1618', '陈玉云', null, 'chenyuyun@xm12t.com', '18674769125', '3503269', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1004', '46', null, '39', null, null, '12txm1619', '林少津', null, 'linshaojin@xm12t.com', '18950313364', '3503223', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1005', '46', null, '39', null, null, '12txm1623', '朱丽珊', null, 'zhulishan@xm12t.com', '18750015503', '3503194', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1006', '46', '24', null, null, null, '12txm1629', '郭芬萍', null, 'guofenping@xm12t.com', '18059292416', '3503138', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1007', '46', '23', null, null, null, '12txm1636', '刘燕岚', null, 'liuyanlan@xm12t.com', '15806047132', '3503554', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1008', '46', null, '39', null, null, '12txm1638', '陈睿', null, 'chenrui@xm12t.com', '15259289652', '3503301', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1009', '46', '23', '66', null, null, '12txm1641', '张珂珂', null, 'zhangkeke@xm12t.com', '18859206409', '3503523', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1010', '46', null, '67', null, null, '12txm1648', '徐庆玲', null, 'xuqingling@xm12t.com', '18850227537', '3503120', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1011', '46', '29', '38', null, null, '12txm1649', '彭英', null, 'pengying@xm12t.com', '13906000547', '3503188', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1012', '46', null, '39', null, null, '12txm1654', '张燕红', null, 'zhangyanhong@xm12t.com', '15960293485', '3503274', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1013', '46', null, '68', null, null, '12txm1655', '陈献萍', null, 'chenxianping@xm12t.com', '15160086332', '3503208', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1014', '46', '24', '33', null, null, '12txm1661', '彭凌玲', null, 'penglingling@xm12t.com', '15959213948', '3503058', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1015', '46', '24', null, null, null, '12txm1667', '徐燕美', null, 'xuyanmei@xm12t.com', '15060352679', '3503110', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1016', '46', null, '39', null, null, '12txm1674', '蔡燕云', null, 'caiyanyun@xm12t.com', '15805000725', '3503292', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1017', '46', '24', null, null, null, '12txm1679', '曹健', null, 'caojian@xm12t.com', '18030261783', '3503084', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1018', '46', null, '39', null, null, '12txm1682', '刘珏', null, 'liujue@xm12t.com', '18359262134', '3503290', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1019', '46', '24', null, null, null, '12txm1683', '方君鸿', null, 'fangjunhong@xm12t.com', '15959215073', '3503103', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1020', '46', null, '36', null, null, '12txm1688', '赖春连', null, 'laichunlian@xm12t.com', '15080318037', '3503136', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1021', '46', null, '39', null, null, '12txm1698', '黄阿娟', null, 'huangajuan@xm12t.com', '18859212283', '3503038', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1022', '46', '26', '69', null, null, '12txm1709', '康温棋', null, 'kangwenqi@xm12t.com', '13860106495', '3503302', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1023', '46', '24', null, null, null, '12txm1724', '谢斌', null, 'xiebin@xm12t.com', '18078322094', '3503327', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1024', '46', '24', '33', null, null, '12txm1725', '刘敏', null, 'liumin@xm12t.com', '15004300563', '3503331', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1025', '46', null, '39', null, null, '12txm1727', '江媚', null, 'jiangmei@xm12t.com', '18039793305', '3503225', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1026', '46', null, '39', null, null, '12txm1728', '郑晓红', null, 'zhengxiaohong@xm12t.com', '13110853305', '3503178', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1027', '46', '23', '63', null, null, '12txm1729', '刘荣连', null, 'liuronglian@xm12t.com', '18649799802', '3503569', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1028', '46', '24', '33', null, null, '12txm1730', '陈小燕', null, 'chenxiaoyan@xm12t.com', '17750091801', '3503074', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1029', '46', null, '39', null, null, '12txm1737', '林华卿', null, 'linhuaqing@xm12t.com', '13599670991', '3503285', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1030', '46', '24', '70', null, null, '12txm1750', '陈运南', null, 'chenyunnan@xm12t.com', '18750658056', '3503124', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1031', '46', '23', '63', null, null, '12txm1761', '蔡雅惠', null, 'caiyahui@xm12t.com', '18559253730', '3503335', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1032', '46', '24', null, null, null, '12txm1763', '吴启建', null, 'wuqijian@xm12t.com', '18850014291', '3503089', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1033', '46', null, '52', null, null, '12txm1766', '朱丽仙', null, 'zhulixian@xm12t.com', '13998436071', '3503181', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1034', '46', '23', null, null, null, '12txm1767', '谢琦翔', null, 'xieqixiang@xm12t.com', '18450104513', '3503513', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1035', '46', '23', '71', null, null, '12txm1771', '佟鹏', null, 'tongpeng@xm12t.com', '13055391183', '3503325', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1036', '46', null, '52', null, null, '12txm1782', '方啊茹', null, 'fangaru@xm12t.com', '18606934113', '3503155', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1037', '46', null, '72', null, null, '12txm1783', '苏玉婷', null, 'cs64@xm12t.com', '15060537356', '3503288', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1038', '46', '23', '73', null, null, '12txm1788', '孙笑迎春', null, 'sunxiaoyingchun@xm12t.com', '13959238648', '3503966', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1039', '46', '25', '74', null, null, '12txm1793', '徐志磊', null, 'xuzhilei@xm12t.com', '15759563262', '3503216', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1040', '46', '27', '45', null, null, '12txm1797', '黄燕真', null, 'huangyanzhen@xm12t.com', '13850084630', '3503688', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1041', '46', '24', null, null, null, '12txm1799', '戴明德', null, 'daimingde@xm12t.com', '18359204295', '3503374', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1042', '46', '23', null, null, null, '12txm1808', '徐淑端', null, 'xushuduan@xm12t.com', '13400605001', '3503557', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1043', '46', '30', '33', null, null, '12txm1814', '金杰', null, 'jinjie@xm12t.com', '18959231204', '3503169', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1044', '46', null, '75', null, null, '12txm1821', '马惠珠', null, 'mahuizhu@xm12t.com', '13424163262', '3753745', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1045', '46', null, null, null, null, '12txm1823', '林晓梅', null, 'linxiaomei@xm12t.com', '13599851823', '3503113', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1046', '46', null, '39', null, null, '12txm1825', '杨艳秀', null, 'yangyanxiu@xm12t.com', '18120755054', '3503250', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1047', '46', '25', '42', null, null, '12txm1827', '汤小芳', null, 'tangxiaofang@xm12t.com', '15059383115', '3503347', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1048', '46', '25', '42', null, null, '12txm1828', '石德玲', null, 'shideling@xm12t.com', '18965823083', '3503240', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1049', '46', null, '39', null, null, '12txm1829', '欧丽丽', null, 'oulili@xm12t.com', '15080332342', '3503072', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1050', '46', null, '39', null, null, '12txm1831', '李婷婷', null, 'litingting@xm12t.com', '15750768902', '3503278', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1051', '46', null, '39', null, null, '12txm1837', '蔡钰滢', null, 'caiyuying@xm12t.com', '15159879499', '3503229', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1052', '46', null, '76', null, null, '12txm1842', '蔡艺蓉', null, 'caiyirong@xm12t.com', '18850313890', '3503035', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1053', '46', null, null, null, null, '12txm1846', '林芳芳', null, 'linfangfang@xm12t.com', '13696960317', '3503251', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1054', '46', '23', null, null, null, '12txm1851', '陈丹', null, 'chendan@xm12t.com', '18759732195', '暂无', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1055', '46', null, '39', null, null, '12txm1852', '刘舒琪', null, 'liushuqi@xm12t.com', '13647090181', '3503260', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1056', '46', null, '39', null, null, '12txm1854', '丘梦婷', null, 'qiumengting@xm12t.com', '15080558116', '3503217', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1057', '46', '27', '27', null, null, '12txm1855', '顾晓琳', null, 'guxl@12t.cn', '13600959180', '3503532', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1058', '46', '27', '45', null, null, '12txm1856', '王俊娴', null, 'wangjunxian@xm12t.com', '18859671995', '3503515', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1059', '46', '23', '31', null, null, '12txm1860', '许传武', null, 'xuchuanwu@xm12t.com', '13400691209', '3503504', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1060', '46', '23', '63', null, null, '12txm1865', '黄艾', null, 'huangai@xm12t.com', '18705923160', '3503326', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1061', '46', '23', '77', null, null, '12txm1869', '陈晓雄', null, 'chenxiaoxiong@xm12t.com', '15105993543', '3503106', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1062', '46', '30', '37', null, null, '12txm1877', '刘明伟', null, 'liumingwei@xm12t.com', '18876417164', '3503766', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1063', '46', '28', '33', null, null, '12txm1881', '牛璐', null, 'niulu@xm12t.com', '18250813511', '3503078', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1064', '46', '23', '63', null, null, '12txm1884', '许彩洪', null, 'xucaihong@xm12t.com', '13645004456', '3503531', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1065', '46', null, '39', null, null, '12txm1886', '陈心阳', null, 'chenxinyang@xm12t.com', '15396615189', '3503101', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1066', '46', '25', '55', null, null, '12txm1887', '张琪', null, 'zhangqi@xm12t.com', '15659994491', '3503273', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1067', '46', '30', '78', null, null, '12txm1893', '李惠丽', null, 'lihuili@xm12t.com', '15006059663', '3503376', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1068', '46', '23', '66', null, null, '12txm1901', '张杰华', null, 'zhangjiehua@xm12t.com', '15980761413', '3503311', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1069', '46', '27', '79', null, null, '12txm1910', '林燕如', null, 'linyanru@xm12t.com', '13515966469', '3503512', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1070', '46', '23', '31', null, null, '12txm1912', '江妍', null, 'jiangyan@xm12t.com', '18094159556', '3503509', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1071', '46', null, '39', null, null, '12txm1914', '江金燕', null, 'jiangjinyan@xm12t.com', '15980894550', '3503227', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1072', '46', '29', '80', null, null, '12txm1915', '任心茹', null, 'renxinru@xm12t.com', '18876338169', '3503180', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1073', '46', '23', '71', null, null, '12txm1924', '王珠珠', null, 'wangzhuzhu@xm12t.com', '13959270870', '3503318', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1074', '46', '23', '71', null, null, '12txm1925', '卢霜霜', null, 'lushuangshuang@xm12t.com', '15750898447', '3503540', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1075', '46', '23', '71', null, null, '12txm1926', '苏俊丽', null, 'sujunli@xm12t.com', '15565712636', '3503156', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1076', '46', null, '39', null, null, '12txm1933', '杨新新', null, 'yangxinxin@xm12t.com', '13055717200', '3503198', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1077', '46', '24', null, null, null, '12txm1939', '丘连珍', null, 'qiulianzhen@xm12t.com', '18359926128', '3503340', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1078', '46', '23', '63', null, null, '12txm1940', '王蓉', null, 'wangrong@xm12t.com', '15060751931', '3503316', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1079', '46', '23', '81', null, null, '12txm1947', '彭晓婷', null, 'pengxiaoting@xm12t.com', '13067029418', '暂无', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1080', '46', '24', '33', null, null, '12txm865', '陈成健', null, 'chencj@xm12t.com', '13960494512', '3503064', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1081', '46', '23', '77', null, null, '12txm1970', '叶威威', null, 'yeweiwei@xm12t.com', '18760636513', '3503303', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1082', '46', '25', '55', null, null, '12txm1973', '苏丽珍', null, 'sulizhen@xm12t.com', '13646071723', '3503312', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1083', '46', '23', '63', null, null, '12txm1976', '叶幼玲', null, 'yeyouling@xm12t.com', '18059190180', '3503091', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1084', '46', '23', '63', null, null, '12txm1977', '熊欣洁', null, 'xiongxinjie@xm12t.com', '18750253629', '3503516', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1085', '46', null, '39', null, null, '12txm1980', '纪荣裕', null, 'jirongyu@xm12t.com', '15659675010', '3503158', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1086', '46', null, '39', null, null, '12txm1984', '叶凤婷', null, 'yefengting@xm12t.com', '15759588036', '3503221', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1087', '46', '24', '70', null, null, '12txm1988', '黄熙淼', null, 'huangximiao@xm12t.com', '15059456662', '3503043', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1088', '46', null, '39', null, null, '12txm1990', '何艺丹', null, 'heyidan@xm12t.com', '18459206366', '3503141', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1089', '46', null, '39', null, null, '12txm1991', '陈美珍', null, 'chenmeizhen@xm12t.com', '13959268065', '3503127', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1090', '46', '24', null, null, null, '12txm1993', '陈俊龄', null, 'chenjunling@xm12t.com', '15606976709', '3503034', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1091', '46', null, '39', null, null, '12txm1996', '陈小丽', null, 'chenxiaoli@xm12t.com', '18506923676', '3503284', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1092', '46', '27', '79', null, null, '12txm1997', '夏丹琴', null, 'xiadanqin@xm12t.com', '15260226231', '3503050', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1093', '46', '23', '77', null, null, '12txm2002', '艾华', null, 'aihua@xm12t.com', '15880772833', '3503297', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1094', '46', '23', '71', null, null, '12txm2004', '林姈婷', null, 'linlingting@xm12t.com', '15859506993', '3503329', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1095', '46', null, '39', null, null, '12txm2010', '林燕华2', null, 'linyanhua2@xm12t.com', '15060782712', '3503260', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1096', '46', '27', '79', null, null, '12txm2011', '李欣雅', null, 'lixinya@xm12t.com', '13950811823', '3503688', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1097', '46', '23', '63', null, null, '12txm2012', '张佳', null, 'zhangjia@xm12t.com', '13600904109', '3503528', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1098', '46', '29', '27', null, null, '12txm2015', '郑添天', null, 'zhengtt@12t.cn', '18650118511', '暂无', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1099', '46', null, '41', null, null, '12txm2017', '黄霜月', null, 'huangshuangyue@xm12t.com', '14700063087', '3503666', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1100', '46', '23', '63', null, null, '12txm2021', '陈玉米', null, 'chenyumi@xm12t.com', '15280279440', '3503140', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1101', '46', '23', '77', null, null, '12txm2023', '何炜', null, 'hewei@xm12t.com', '15606005066', '3503253', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1102', '46', '23', '62', null, null, '12txm2038', '江小凤', null, 'jiangxiaofeng@xm12t.com', '15880691014', '暂无', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1103', '46', null, '39', null, null, '12txm2042', '王晓娟', null, 'wangxiaojuan@xm12t.com', '18950149936', '3503243', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1104', '46', '24', null, null, null, '12txm2046', '王嘉林', null, 'wangjialin@xm12t.com', '15005094980', '3503017', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1105', '46', '30', null, null, null, '12txm2048', '吴小玲', null, 'wuxiaoling@xm12t.com', '18046056257', '3503032', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1106', '46', null, '39', null, null, '12txm2049', '王会芹', null, 'wanghuiqin@xm12t.com', '13400779656', '3503322', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1107', '46', null, '39', null, null, '12txm2053', '温玉锋', null, 'wenyufeng@xm12t.com', '18250815017', '3503289', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1108', '46', '24', null, null, null, '12txm2054', '刘斌', null, 'liubin@xm12t.com', '18877235115', '3503344', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1109', '46', '28', '82', null, null, '12txm2056', '彭敏', null, 'pengmin@xm12t.com', '18259481378', '3503116', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1110', '46', '23', '63', null, null, '12txm2058', '陈映雪', null, 'chenyingxue@xm12t.com', '18750912481', '3503324', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1111', '46', '24', '70', null, null, '12txm2059', '蒋玉柏', null, 'jiangyubai@xm12t.com', '18695677738', '3503018', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1112', '46', '24', null, null, null, '12txm2064', '杨慧玲', null, 'yanghuiling@xm12t.com', '18146141184', '3503010', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1113', '46', '24', null, null, null, '12txm2065', '吴培坤', null, 'wupeikun@xm12t.com', '13774813963', '3503145', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1114', '46', null, '83', null, null, '12txm1702', '梁晓云', null, 'liangxiaoyun@xm12t.com', '18206057031', '3503636', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1115', '46', null, '76', null, null, '12txm2069', '魏颖莹', null, 'weiyingying@xm12t.com', '15260818801', '3503399', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1116', '46', '28', '84', null, null, '12txm2070', '龚鹏', null, 'gongpeng@xm12t.com', '15659282978', '3503208', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1117', '46', null, '76', null, null, '12txm2072', '陈钟', null, 'chenzhong@xm12t.com', '15060332220', '3503426', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1118', '46', '27', '85', null, null, '12txm2073', '吴亚洲', null, 'wuyazhou@xm12t.com', '18850104595', '3503988', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1119', '46', null, '56', null, null, '12txm2074', '蓝毅湖', null, 'lanyihu@xm12t.com', '18006011063', '3503257', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1120', '46', '28', null, null, null, '12txm2075', '赖国城', null, 'laiguocheng@xm12t.com', '15859236704', '3503097', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1121', '46', '23', null, null, null, '12txm2076', '傅福汉', null, 'fufuhan@xm12t.com', '15959450472', '3503503', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1122', '46', '27', '85', null, null, '12txm2077', '李幼茶', null, 'liyoucha@xm12t.com', '18860115551', '3503306', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1123', '46', null, '39', null, null, '12txm2079', '杨云霞', null, 'yangyunxia@xm12t.com', '13959243071', '3503175', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1124', '46', '24', '70', null, null, '12txm2082', '许水旺', null, 'xushuiwang@xm12t.com', '18750576691', '3503107', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1125', '46', null, '86', null, null, '12txm2085', '江钺', null, 'jiangyue@xm12t.com', '18150935421', '3503247', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1126', '46', '24', null, null, null, '12txm2087', '王凯', null, 'wangkai@xm12t.com', '18278360920', '35030399', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1127', '46', null, '86', null, null, '12txm2088', '陈美蕊', null, 'chenmeirui@xm12t.com', '18250775031', '3503139', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1128', '46', '24', null, null, null, '12txm2089', '李恩临', null, 'lienlin@xm12t.com', '18650805217', '3503741', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1129', '46', '23', null, null, null, '12txm2090', '陈超', null, 'chenchao@xm12t.com', '18159412257', '3503501', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1130', '46', null, '39', null, null, '12txm2093', '吴玉洁', null, 'wuyujie@xm12t.com', '18850567765', '3503234', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1131', '46', null, '39', null, null, '12txm2094', '王征', null, 'wangzheng@xm12t.com', '15617726131', '3503021', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1132', '46', '24', '70', null, null, '12txm2095', '孙祥祥', null, 'sunxiangxiang@xm12t.com', '13559492563', '3503293', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1133', '46', '24', '70', null, null, '12txm2098', '林小燕2', null, 'linxiaoyan@xm12t.com', '13860466845', '3503134', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1134', '46', '23', null, null, null, '12txm2100', '钟翎', null, 'zhongling@xm12t.com', '18250822878', '暂无', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1135', '46', '24', null, null, null, '12txm1744', '温联升', null, 'wenliansheng@xm12t.com', '13395058397', '3503102', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1136', '46', '23', '62', null, null, '12txm2105', '王平', null, 'wangping@xm12t.com', '15871655519', '暂无', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1137', '46', '23', null, null, null, '12txm2109', '许婷', null, 'xuting@xm12t.com', '17750594807', '3503552', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1138', '46', null, '39', null, null, '12txm2110', '吴晨霞', null, 'wuchenxia@xm12t.com', '18350990706', '3503189', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1139', '46', null, '52', null, null, '12txm2116', '邓琳珊', null, 'denglinshan@xm12t.com', '13559243226', '3503060', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1140', '46', '27', '87', null, null, '12txm2119', '代素娥', null, 'daisue@xm12t.com', '17706028501', '3503050', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1141', '46', null, '39', null, null, '12txm2122', '王慧玲', null, 'wanghuiling@xm12t.com', '15859510675', '3503236', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1142', '46', null, '39', null, null, '12txm2126', '郑秀东', null, 'zhengxiudong@xm12t.com', '18960045275', '3503235', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1143', '46', '23', null, null, null, '12txm2129', '程章鹏', null, 'chengzhangpeng@xm12t.com', '18250716915', '3503513', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1144', '46', '25', '42', null, null, '12txm2131', '卢宏野', null, 'luhongye@xm12t.com', '15750842176', '3503179', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1145', '46', '23', '46', null, null, '12txm2132', '陈杰', null, 'chenjie@xm12t.com', '13055208817', '3503501', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1146', '46', '23', '63', null, null, '12txm2134', '林秋白', null, 'linqiubai@xm12t.com', '15905083607', '暂无', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1147', '46', '23', '88', null, null, '12txm2133', '高涵', null, 'gaohan@xm12t.com', '15559082075', '3503506', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1148', '46', null, '36', null, null, '12txm2140', '林晓东', null, 'linxiaodong@xm12t.com', '17717067995', '3503153\n', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1149', '46', '23', '66', null, null, '12txm2142', '陈兆伟', null, 'chenzhaowei@xm12t.com', '13255036582', '3503311', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1150', '46', null, '39', null, null, '12txm2146', '徐莉', null, 'xuli@xm12t.com', '13850048691', '3503173', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1151', '46', null, '39', null, null, '12txm2149', '熊琳', null, 'xionglin@xm12t.com', '15750751269', '3503146', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1152', '46', '23', '77', null, null, '12txm2153', '林汉斌2', null, 'linhanbin@xm12t.com', '15160009645', '3503341', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1153', '46', '23', '77', null, null, '12txm2152', '游达山', null, 'youdashan@xm12t.com', '18050164604', '3503295', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1154', '46', '24', null, null, null, '12txm2154', '陈槐山', null, 'chenhuaishan@xm12t.com', '18860042265', '3504538', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1155', '46', null, '65', null, null, '12txm2156', '陈涛', null, 'chentao@xm12t.com', '15606007918', '暂无', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1156', '46', '28', null, null, null, '12txm2161', '丁鑫', null, 'dingxin@xm12t.com', '15060747205', '3503313', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1157', '46', null, '39', null, null, '12txm2164', '谢芳', null, 'xiefang@xm12t.com', '15377993762', '3503284', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1158', '46', null, '39', null, null, '12txm2166', '张佳雯', null, 'zhangjiawen@xm12t.com', '17750597092', '3503281', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1159', '46', null, '39', null, null, '12txm2167', '林嘉馨', null, 'linjiaxin@xm12t.com', '15159287403', '3503281', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1160', '46', null, null, null, null, '12txm2168', '王建平', null, 'wangjianping@xm12t.com ', '13906029330', '3503002', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1161', '46', null, '39', null, null, '12txm2170', '陈培城', null, 'chenpeicheng@xm12t.com', '17750041232', '3503077', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1162', '46', null, '39', null, null, '12txm2172', '邱雅丽', null, 'qiuyali@xm12t.com', '13395050096', '3503073', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1163', '46', '23', '77', null, null, '12txm2173', '彭伟', null, 'pengwei@xm12t.com', '15750717757', '3503025', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1164', '46', null, '39', null, null, '12txm2174', '郑美梨', null, 'zhengmeili@xm12t.com', '13732256824', '3503205', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1165', '46', '24', null, null, null, '12txm2175', '郑龙杰', null, 'zhenglongjie@xm12t.com', '15957995035', null, '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1166', '46', null, '39', null, null, '12txm2176', '黄臻宇', null, 'huangzhenyu@xm12t.com', '13850133122', '3764598', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1167', '46', '24', null, null, null, '12txm2180', '叶健', null, 'yejian@xm12t.com', '13599699064', '3503144', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1168', '46', null, '39', null, null, '12txm2184', '黄文煌', null, 'huangwenhuang@xm12t.com', '18876309927', '3503006', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1169', '46', null, '39', null, null, '12txm2183', '朱雅静', null, 'zhuyajing@xm12t.com', '13063150332', '3503330', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1170', '46', '24', null, null, null, '12txm2185', '杨林', null, 'yanglin@xm12t.com', '15280290740', '暂无', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1171', '46', '23', null, null, null, '12txm2188', '许福生', null, 'xufusheng@xm12t.com', '13860432107', '暂无', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1172', '46', '26', '77', null, null, '12txm2186', '车玲', null, 'cheling@xm12t.com', '13666034886', '3503075', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1173', '46', '24', null, null, null, '12txm2189', '林立鹏', null, 'linlipeng@xm12t.com', '13023913951', '3503046', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1174', '46', '27', '89', null, null, '12txm2190', '李倩', null, 'liqian@xm12t.com', '15860740693', '3503510', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1175', '46', '24', null, null, null, '12txm2187', '苏云东', null, 'suyundong@xm12t.com', '18659437014', '3503559', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1176', '46', '23', '90', null, null, '12txm2192', '李树', null, 'lishu@xm12t.com', '18259265202', '3503552', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1177', '46', '26', '39', null, null, '12txm1439', '吴双燕', null, 'wushuangyan@xm12t.com', '18606927436', '3503096', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1178', '46', null, '39', null, null, '12txm2193', '栗静坪', null, 'lijingping@xm12t.com', '17605080693', '3503031', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1179', '46', null, '39', null, null, '12txm2194', '何艺敏', null, 'heyimin@xm12t.com', '13459016162', '3503019', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1180', '46', null, '39', null, null, '12txm2195', '林俊', null, 'linjun@xm12t.com', '18120758578', '3503284', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1181', '46', null, '91', null, null, '12txm2196', '蔡敏晨', null, 'caiminchen@xm12t.com', '13861877036', '3503518', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1182', '46', null, '39', null, null, '12txm2197', '王伟宏', null, 'wangweihong@xm12t.com', '18259091027', '3503330', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1183', '46', '25', '42', null, null, '12txm2198', '陈铭', null, 'chenming@xm12t.com', '15359222527', '3503259', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1184', '46', '24', null, null, null, '12txm2199', '陈加伟', null, 'chenjiawei@xm12t.com', '13255029802', '3503028', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1185', '46', '24', null, null, null, '12txm2200', '林海滨', null, 'linhaibin@xm12t.com', '13400655319', '3503069', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1186', '46', '24', null, null, null, '12txm2201', '陈文玉', null, 'chenwenyu@xm12t.com', '13559896077', '3503195', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1187', '46', null, '76', null, null, '12txm2203', '张云欣', null, 'zhangyunxin@xm12t.com', '15359131064', '3503399', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1188', '46', '24', null, null, null, '12txm2204', '陈鹏飞', null, 'chenpengfei@xm12t.com', '15829007813', '3503043', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1189', '46', '24', null, null, null, '12txm2206', '陈锦伦', null, 'chenjinlun@xm12t.com', '18659278307', '3753740', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1190', '46', '23', '71', null, null, '12txm2205', '邱伟鹏', null, 'qiuweipeng@xm12t.com', '14700061917', '3503312', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1191', '46', '24', null, null, null, '12txm2207', '谢朦冰', null, 'xiemengbing@xm12t.com', '18064448231', '3503338', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1192', '46', '24', null, null, null, '12txm2208', '林爱义', null, 'linaiyi@xm12t.com', '18150166581', '3503279', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1193', '46', '24', null, null, null, '12txm2210', '莫湖月', null, 'mohuyue@xm12t.com', '18613958133', '3503241', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1194', '46', null, '76', null, null, '12txm2209', '徐云云', null, 'xuyunyun@xm12t.com', '18649721427', '3757745', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1195', '46', null, null, null, null, '12txm2215', '肖凯', null, 'xiaokai@xm12t.com', '15159013161', '3503399', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1196', '46', null, null, null, null, '12txm2213', '赵玮', null, 'zhaowei@xm12t.com', '15396235119', '3503000', '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1197', '46', '23', null, null, null, '12txm2214', '陈艺红', null, 'chenyihong@xm12t.com', '13950139011', null, '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1198', '46', null, '39', null, null, '12txm2211', '严俊杰', null, 'yanjunjie@xm12t.com', '18860132012', null, '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1199', '46', '23', '71', null, null, '12txm2212', '庄荣杰', null, 'zhuangrongjie@xm12t.com', '15105960339', null, '2017-06-29 17:14:24', null, null);
INSERT INTO `wc_employees` VALUES ('1200', '39', '72', null, '你好', null, 'xm12t', 'xqx', null, null, '13012345678', null, '2017-07-04 10:31:52', '2017-07-04 10:31:52', null);

-- ----------------------------
-- Table structure for wc_groups
-- ----------------------------
DROP TABLE IF EXISTS `wc_groups`;
CREATE TABLE `wc_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '所属用户',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分组名',
  `order` tinyint(4) unsigned NOT NULL COMMENT '排序，默认分组为0，<0在之前，>0在之后',
  PRIMARY KEY (`id`),
  KEY `uesr_id` (`user_id`),
  CONSTRAINT `wc_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='名片夹分组 - 个人';

-- ----------------------------
-- Records of wc_groups
-- ----------------------------
INSERT INTO `wc_groups` VALUES ('1', '41', '测试群', '0');
INSERT INTO `wc_groups` VALUES ('17', '42', '123', '0');
INSERT INTO `wc_groups` VALUES ('39', '40', '测试组', '0');
INSERT INTO `wc_groups` VALUES ('40', '40', 'Hello', '2');
INSERT INTO `wc_groups` VALUES ('41', '40', '同事', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='职位表';

-- ----------------------------
-- Records of wc_positions
-- ----------------------------
INSERT INTO `wc_positions` VALUES ('6', '44', '总裁', '1', '1');
INSERT INTO `wc_positions` VALUES ('7', '44', '员工', '0', '3');
INSERT INTO `wc_positions` VALUES ('8', '44', '经理', '0', '2');
INSERT INTO `wc_positions` VALUES ('9', '45', '开发人员', '0', '3');
INSERT INTO `wc_positions` VALUES ('10', '44', '总监', '0', '2');
INSERT INTO `wc_positions` VALUES ('11', '40', '测试专员', '0', '5');
INSERT INTO `wc_positions` VALUES ('13', '44', '你好', '0', '2');
INSERT INTO `wc_positions` VALUES ('14', '44', '你也好', '1', '2');
INSERT INTO `wc_positions` VALUES ('26', '46', '副总经理', '0', null);
INSERT INTO `wc_positions` VALUES ('27', '46', '总监', '0', null);
INSERT INTO `wc_positions` VALUES ('28', '46', '客户经理', '0', null);
INSERT INTO `wc_positions` VALUES ('29', '46', '财务专员', '0', null);
INSERT INTO `wc_positions` VALUES ('30', '46', '采购主管', '0', null);
INSERT INTO `wc_positions` VALUES ('31', '46', 'NET程序员', '0', null);
INSERT INTO `wc_positions` VALUES ('32', '46', '风控监察经理', '0', null);
INSERT INTO `wc_positions` VALUES ('33', '46', '商务经理', '0', null);
INSERT INTO `wc_positions` VALUES ('34', '46', '品牌产品经理', '0', null);
INSERT INTO `wc_positions` VALUES ('35', '46', '研发主管', '0', null);
INSERT INTO `wc_positions` VALUES ('36', '46', '客服经理', '0', null);
INSERT INTO `wc_positions` VALUES ('37', '46', '销售主管', '0', null);
INSERT INTO `wc_positions` VALUES ('38', '46', '经理', '0', null);
INSERT INTO `wc_positions` VALUES ('39', '46', '客服专员', '0', null);
INSERT INTO `wc_positions` VALUES ('40', '46', '美工主管', '0', null);
INSERT INTO `wc_positions` VALUES ('41', '46', '行政专员', '0', null);
INSERT INTO `wc_positions` VALUES ('42', '46', '风控监察专员', '0', null);
INSERT INTO `wc_positions` VALUES ('43', '46', '财务经理', '0', null);
INSERT INTO `wc_positions` VALUES ('44', '46', '网盟经理', '0', null);
INSERT INTO `wc_positions` VALUES ('45', '46', '财务支持', '0', null);
INSERT INTO `wc_positions` VALUES ('46', '46', '产品经理', '0', null);
INSERT INTO `wc_positions` VALUES ('47', '46', '主管', '0', null);
INSERT INTO `wc_positions` VALUES ('48', '46', '网盟专员', '0', null);
INSERT INTO `wc_positions` VALUES ('49', '46', '质控经理', '0', null);
INSERT INTO `wc_positions` VALUES ('50', '46', '数据分析员', '0', null);
INSERT INTO `wc_positions` VALUES ('51', '46', '分公司接口人', '0', null);
INSERT INTO `wc_positions` VALUES ('52', '46', '培训专员', '0', null);
INSERT INTO `wc_positions` VALUES ('53', '46', '销售助理', '0', null);
INSERT INTO `wc_positions` VALUES ('54', '46', '市场经理', '0', null);
INSERT INTO `wc_positions` VALUES ('55', '46', '质控专员', '0', null);
INSERT INTO `wc_positions` VALUES ('56', '46', '网络管理员', '0', null);
INSERT INTO `wc_positions` VALUES ('57', '46', '培训部经理', '0', null);
INSERT INTO `wc_positions` VALUES ('58', '46', '市场主管', '0', null);
INSERT INTO `wc_positions` VALUES ('59', '46', '人力行政经理', '0', null);
INSERT INTO `wc_positions` VALUES ('60', '46', '客服主管', '0', null);
INSERT INTO `wc_positions` VALUES ('61', '46', '薪酬绩效主管', '0', null);
INSERT INTO `wc_positions` VALUES ('62', '46', '前端工程师', '0', null);
INSERT INTO `wc_positions` VALUES ('63', '46', '网站客服', '0', null);
INSERT INTO `wc_positions` VALUES ('64', '46', '代理主管', '0', null);
INSERT INTO `wc_positions` VALUES ('65', '46', '行政司机', '0', null);
INSERT INTO `wc_positions` VALUES ('66', '46', 'BD经理', '0', null);
INSERT INTO `wc_positions` VALUES ('67', '46', '市场助理', '0', null);
INSERT INTO `wc_positions` VALUES ('68', '46', '产品专员', '0', null);
INSERT INTO `wc_positions` VALUES ('69', '46', '渠道专员', '0', null);
INSERT INTO `wc_positions` VALUES ('70', '46', '直通车专员', '0', null);
INSERT INTO `wc_positions` VALUES ('71', '46', '客拓专员', '0', null);
INSERT INTO `wc_positions` VALUES ('72', '46', '经理助理', '0', null);
INSERT INTO `wc_positions` VALUES ('73', '46', '客服大区助理', '0', null);
INSERT INTO `wc_positions` VALUES ('74', '46', '直通车审核专员', '0', null);
INSERT INTO `wc_positions` VALUES ('75', '46', '招聘主管', '0', null);
INSERT INTO `wc_positions` VALUES ('76', '46', '招聘专员', '0', null);
INSERT INTO `wc_positions` VALUES ('77', '46', '策划专员', '0', null);
INSERT INTO `wc_positions` VALUES ('78', '46', '滴滴助理', '0', null);
INSERT INTO `wc_positions` VALUES ('79', '46', '会计', '0', null);
INSERT INTO `wc_positions` VALUES ('80', '46', '项目专员', '0', null);
INSERT INTO `wc_positions` VALUES ('81', '46', '前端工程师实习生', '0', null);
INSERT INTO `wc_positions` VALUES ('82', '46', '运营专员', '0', null);
INSERT INTO `wc_positions` VALUES ('83', '46', '行政主管', '0', null);
INSERT INTO `wc_positions` VALUES ('84', '46', '风控专员', '0', null);
INSERT INTO `wc_positions` VALUES ('85', '46', '出纳专员', '0', null);
INSERT INTO `wc_positions` VALUES ('86', '46', '薪酬绩效专员', '0', null);
INSERT INTO `wc_positions` VALUES ('87', '46', '财务主管', '0', null);
INSERT INTO `wc_positions` VALUES ('88', '46', '测试专员', '0', null);
INSERT INTO `wc_positions` VALUES ('89', '46', '主办会计', '0', null);
INSERT INTO `wc_positions` VALUES ('90', '46', '设计主管', '0', null);
INSERT INTO `wc_positions` VALUES ('91', '46', '客服专员（实习生）', '0', null);
INSERT INTO `wc_positions` VALUES ('92', '46', '总经理', '0', null);
INSERT INTO `wc_positions` VALUES ('93', '46', '大区经理', '0', null);
INSERT INTO `wc_positions` VALUES ('94', '46', '搜索销售事业部总经理', '0', null);
INSERT INTO `wc_positions` VALUES ('95', '46', '美工', '0', null);
INSERT INTO `wc_positions` VALUES ('96', '46', '设计师', '0', null);
INSERT INTO `wc_positions` VALUES ('97', '46', '营销顾问', '0', null);
INSERT INTO `wc_positions` VALUES ('98', '46', 'PHP程序员', '0', null);
INSERT INTO `wc_positions` VALUES ('99', '46', '招聘助理（实习生）', '0', null);
INSERT INTO `wc_positions` VALUES ('100', '46', '市场专员', '0', null);
INSERT INTO `wc_positions` VALUES ('101', '46', '定单专员', '0', null);
INSERT INTO `wc_positions` VALUES ('172', '39', '总经理', '0', null);
INSERT INTO `wc_positions` VALUES ('173', '39', '副总经理', '0', null);
INSERT INTO `wc_positions` VALUES ('174', '39', '大区经理', '0', null);
INSERT INTO `wc_positions` VALUES ('175', '39', '搜索销售事业部总经理', '0', null);
INSERT INTO `wc_positions` VALUES ('176', '39', '总监', '0', null);
INSERT INTO `wc_positions` VALUES ('177', '39', '客户经理', '0', null);
INSERT INTO `wc_positions` VALUES ('178', '39', '财务专员', '0', null);
INSERT INTO `wc_positions` VALUES ('179', '39', '采购主管', '0', null);
INSERT INTO `wc_positions` VALUES ('180', '39', 'NET程序员', '0', null);
INSERT INTO `wc_positions` VALUES ('181', '39', '风控监察经理', '0', null);
INSERT INTO `wc_positions` VALUES ('182', '39', '商务经理', '0', null);
INSERT INTO `wc_positions` VALUES ('183', '39', '品牌产品经理', '0', null);
INSERT INTO `wc_positions` VALUES ('184', '39', '研发主管', '0', null);
INSERT INTO `wc_positions` VALUES ('185', '39', '客服经理', '0', null);
INSERT INTO `wc_positions` VALUES ('186', '39', '销售主管', '0', null);
INSERT INTO `wc_positions` VALUES ('187', '39', '经理', '0', null);
INSERT INTO `wc_positions` VALUES ('188', '39', '客服专员', '0', null);
INSERT INTO `wc_positions` VALUES ('189', '39', '美工主管', '0', null);
INSERT INTO `wc_positions` VALUES ('190', '39', '行政专员', '0', null);
INSERT INTO `wc_positions` VALUES ('191', '39', '风控监察专员', '0', null);
INSERT INTO `wc_positions` VALUES ('192', '39', '财务经理', '0', null);
INSERT INTO `wc_positions` VALUES ('193', '39', '美工', '0', null);
INSERT INTO `wc_positions` VALUES ('194', '39', '网盟经理', '0', null);
INSERT INTO `wc_positions` VALUES ('195', '39', '财务支持', '0', null);
INSERT INTO `wc_positions` VALUES ('196', '39', '产品经理', '0', null);
INSERT INTO `wc_positions` VALUES ('197', '39', '主管', '0', null);
INSERT INTO `wc_positions` VALUES ('198', '39', '网盟专员', '0', null);
INSERT INTO `wc_positions` VALUES ('199', '39', '质控经理', '0', null);
INSERT INTO `wc_positions` VALUES ('200', '39', '数据分析员', '0', null);
INSERT INTO `wc_positions` VALUES ('201', '39', '设计师', '0', null);
INSERT INTO `wc_positions` VALUES ('202', '39', '分公司接口人', '0', null);
INSERT INTO `wc_positions` VALUES ('203', '39', '培训专员', '0', null);
INSERT INTO `wc_positions` VALUES ('204', '39', '销售助理', '0', null);
INSERT INTO `wc_positions` VALUES ('205', '39', '市场经理', '0', null);
INSERT INTO `wc_positions` VALUES ('206', '39', '营销顾问', '0', null);
INSERT INTO `wc_positions` VALUES ('207', '39', '质控专员', '0', null);
INSERT INTO `wc_positions` VALUES ('208', '39', '网络管理员', '0', null);
INSERT INTO `wc_positions` VALUES ('209', '39', '培训部经理', '0', null);
INSERT INTO `wc_positions` VALUES ('210', '39', 'PHP程序员', '0', null);
INSERT INTO `wc_positions` VALUES ('211', '39', '市场主管', '0', null);
INSERT INTO `wc_positions` VALUES ('212', '39', '人力行政经理', '0', null);
INSERT INTO `wc_positions` VALUES ('213', '39', '客服主管', '0', null);
INSERT INTO `wc_positions` VALUES ('214', '39', '薪酬绩效主管', '0', null);
INSERT INTO `wc_positions` VALUES ('215', '39', '前端工程师', '0', null);
INSERT INTO `wc_positions` VALUES ('216', '39', '网站客服', '0', null);
INSERT INTO `wc_positions` VALUES ('217', '39', '代理主管', '0', null);
INSERT INTO `wc_positions` VALUES ('218', '39', '行政司机', '0', null);
INSERT INTO `wc_positions` VALUES ('219', '39', 'BD经理', '0', null);
INSERT INTO `wc_positions` VALUES ('220', '39', '市场助理', '0', null);
INSERT INTO `wc_positions` VALUES ('221', '39', '产品专员', '0', null);
INSERT INTO `wc_positions` VALUES ('222', '39', '渠道专员', '0', null);
INSERT INTO `wc_positions` VALUES ('223', '39', '直通车专员', '0', null);
INSERT INTO `wc_positions` VALUES ('224', '39', '客拓专员', '0', null);
INSERT INTO `wc_positions` VALUES ('225', '39', '经理助理', '0', null);
INSERT INTO `wc_positions` VALUES ('226', '39', '客服大区助理', '0', null);
INSERT INTO `wc_positions` VALUES ('227', '39', '直通车审核专员', '0', null);
INSERT INTO `wc_positions` VALUES ('228', '39', '招聘主管', '0', null);
INSERT INTO `wc_positions` VALUES ('229', '39', '市场专员', '0', null);
INSERT INTO `wc_positions` VALUES ('230', '39', '招聘专员', '0', null);
INSERT INTO `wc_positions` VALUES ('231', '39', '策划专员', '0', null);
INSERT INTO `wc_positions` VALUES ('232', '39', '滴滴助理', '0', null);
INSERT INTO `wc_positions` VALUES ('233', '39', '会计', '0', null);
INSERT INTO `wc_positions` VALUES ('234', '39', '项目专员', '0', null);
INSERT INTO `wc_positions` VALUES ('235', '39', '前端工程师实习生', '0', null);
INSERT INTO `wc_positions` VALUES ('236', '39', '运营专员', '0', null);
INSERT INTO `wc_positions` VALUES ('237', '39', '行政主管', '0', null);
INSERT INTO `wc_positions` VALUES ('238', '39', '风控专员', '0', null);
INSERT INTO `wc_positions` VALUES ('239', '39', '出纳专员', '0', null);
INSERT INTO `wc_positions` VALUES ('240', '39', '薪酬绩效专员', '0', null);
INSERT INTO `wc_positions` VALUES ('241', '39', '定单专员', '0', null);
INSERT INTO `wc_positions` VALUES ('242', '39', '财务主管', '0', null);
INSERT INTO `wc_positions` VALUES ('243', '39', '测试专员', '0', null);
INSERT INTO `wc_positions` VALUES ('244', '39', '主办会计', '0', null);
INSERT INTO `wc_positions` VALUES ('245', '39', '设计主管', '0', null);
INSERT INTO `wc_positions` VALUES ('246', '39', '客服专员（实习生）', '0', null);
INSERT INTO `wc_positions` VALUES ('247', '39', '招聘助理（实习生）', '0', null);

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
INSERT INTO `wc_template_useable` VALUES ('10', '40', 'App\\Models\\User');

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
INSERT INTO `wc_token` VALUES ('gBezeuSOjkqzwz4f1-qsCH-fTEOvPiqmpRDf52YXDogTXL7OUfyyeuabOvFUKYyGuMoUOcVoV0ucl5aouSgQllio0E-ev-avyDPP0hWiexV1ldjsz9VN8dSZeaBzRc4hRVQiAHAMQL', '300', '1499220830');
INSERT INTO `wc_token` VALUES ('fwGOQNBumC5ISuKmt5_QKG3fyYGHWT3tfFg-Czsa2D_ltH23QxT7Sd260sDqSsdz9wQruIxgZS0l9f1UxebIYh-lp4O7SHr654qvLf0-UjS_ph11N8gttfz6dJ0lpR9vPJHfAIAUOM', '300', '1499221114');
INSERT INTO `wc_token` VALUES ('fwGOQNBumC5ISuKmt5_QKG3fyYGHWT3tfFg-Czsa2D_MBlv7_bnM_BkXwyUs9eUASXupZnbb0zNQDoqndsXkbhmwQc_Z07XVvUs-fwKRXyeHPS9k2HZdrcdfFAL2hNk2JGAfAIAOLF', '300', '1499221114');
INSERT INTO `wc_token` VALUES ('fwGOQNBumC5ISuKmt5_QKG3fyYGHWT3tfFg-Czsa2D8O_p4JbO0lfFP0PN_x8AEFLBkZEmQAGw_rLT8-6Ga-5FW8jXNs8PahFnF8t3ZbeH6ACNMyZTokp7VfrpBjlMj4BWTfAIAUPM', '300', '1499221122');
INSERT INTO `wc_token` VALUES ('fwGOQNBumC5ISuKmt5_QKG3fyYGHWT3tfFg-Czsa2D9Ke3X0WJG-05Uh-Bn73vcWwYJl97fiQ-bdJ4Ifa71-0TtcukSQOuABt63OE-Dp0Y5lTe8lifP7Dj_wao2ZmQqHNMGfAIAXWQ', '300', '1499221122');

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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of wc_users
-- ----------------------------
INSERT INTO `wc_users` VALUES ('40', 'Hsieh', '1195015834@qq.com', '18450104513', null, '$2y$10$EpikY0DGXqrc1WYSSgZE1.Qja4l.L7W7C6B5hmZGQxYf2oYLmmBL2', 'BCdg0hVZ8S07ht8e42KNbimZw1HOevUZyRGpluX0MlagopP5pIX3YFqp8BzU', '谢大琦', 'uploads/user/Hsieh/img1496388406.gif', null, null, '1', '2017 NBA 总冠军 克利夫兰 骑士', '1', 'oruQl1R-dyRj_O8yvnQhlj2SHT60', '2017-05-05 15:32:50', '2017-07-05 16:37:42', null);
INSERT INTO `wc_users` VALUES ('41', 'gh', '345@qq.com', '13881111245', null, '$2y$10$O9lVJi2sqmGYFwtJEC/k4OSw.Zq.iwD7WYZv6i.3YZl1UOXpu.P7e', 'egHHsr3zPOH3XDUcdAxcW1L7g9nSWQoGui0SKrFxdGpU8f5Fo0B3oW5GKAAR', '高涵', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5ZbBiaJjwNDRyUv1uuTJaC8Luz4YqvcR3fa5FdELDiaLsBqSyg4TYicDtlIVmSpqufgsbYpoN5wlmatydXJlrSH5l2/0', 'asdfghjk', null, '2', 'gg', '1', 'oruQl1Y6Z36gxIfNw0ArkLi3ChHI', '2017-05-05 16:31:48', '2017-05-31 16:51:31', null);
INSERT INTO `wc_users` VALUES ('42', 'test', 'test@qq.com', '13812345678', null, '$2y$10$qtqFzvlgolbgHaGP9WMlT.vtlrE5Sv2o/KIWDNcHAt4zPKWqoNfhC', 'ixfqdsO7wKfOztDb2efJnGo2CmlkzuXjmogRBSJHmq2szdkCVQIMOBv3TiPL', '测试专用号', 'uploads/user/test/img1494214725.png', null, null, '0', null, '1', null, '2017-05-08 11:38:45', '2017-06-30 15:02:49', null);
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
INSERT INTO `wc_users` VALUES ('71', 'xm12t', null, null, null, '$2y$10$pY23MDBBSPeHBSpfnMZL3epGbci87bQOhKK7.crtSR2TcPTy.U.wO', 'r0QS367jeSWjzmObl6wrr9KHxlSsGf7rV9MFFFx2DwweWJiQexzoq5gDfq27', '易尔通', null, null, null, '0', null, '1', null, '2017-06-29 14:29:47', '2017-07-05 09:59:07', null);
