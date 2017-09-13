/*
Navicat MySQL Data Transfer

Source Server         : G名片-182.61.41.4
Source Server Version : 50505
Source Host           : 182.61.41.4:3306
Source Database       : weicard

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-08-22 16:09:14
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
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8 COMMENT='名片夹';

-- ----------------------------
-- Records of wc_cardcases
-- ----------------------------
INSERT INTO `wc_cardcases` VALUES ('33', '61', null, '29', 'App\\Models\\Employee', null, null, null);
INSERT INTO `wc_cardcases` VALUES ('34', '61', null, '40', 'App\\Models\\User', null, null, null);
INSERT INTO `wc_cardcases` VALUES ('36', '52', '27', '61', 'App\\Models\\User', null, null, '2017-06-28 18:54:18');
INSERT INTO `wc_cardcases` VALUES ('38', '61', null, '52', 'App\\Models\\User', null, null, null);
INSERT INTO `wc_cardcases` VALUES ('41', '62', null, '29', 'App\\Models\\Employee', null, null, '2017-06-29 13:58:58');
INSERT INTO `wc_cardcases` VALUES ('49', '68', null, '53', 'App\\Models\\Employee', null, '2017-06-26 16:39:38', '2017-06-28 16:39:38');
INSERT INTO `wc_cardcases` VALUES ('51', '68', null, '28', 'App\\Models\\Employee', null, '2017-06-26 17:01:06', '2017-06-28 17:01:06');
INSERT INTO `wc_cardcases` VALUES ('52', '52', '28', '29', 'App\\Models\\Employee', null, '2017-06-26 17:42:35', '2017-07-04 13:49:01');
INSERT INTO `wc_cardcases` VALUES ('53', '75', null, '29', 'App\\Models\\Employee', null, '2017-06-27 16:23:36', '2017-06-28 16:23:36');
INSERT INTO `wc_cardcases` VALUES ('61', '71', '6', '29', 'App\\Models\\Employee', null, '2017-06-28 09:41:40', '2017-07-08 09:08:12');
INSERT INTO `wc_cardcases` VALUES ('63', '76', null, '29', 'App\\Models\\Employee', null, '2017-06-28 18:50:06', '2017-06-28 18:50:06');
INSERT INTO `wc_cardcases` VALUES ('65', '77', '9', '28', 'App\\Models\\Employee', null, '2017-06-29 10:44:48', '2017-06-29 10:45:20');
INSERT INTO `wc_cardcases` VALUES ('68', '52', '29', '53', 'App\\Models\\Employee', null, '2017-06-30 10:36:39', '2017-07-04 13:49:07');
INSERT INTO `wc_cardcases` VALUES ('69', '79', null, '29', 'App\\Models\\Employee', null, '2017-06-30 14:12:20', '2017-06-30 14:12:20');
INSERT INTO `wc_cardcases` VALUES ('70', '80', null, '1940', 'App\\Models\\Employee', null, '2017-07-01 12:10:11', '2017-07-01 12:10:11');
INSERT INTO `wc_cardcases` VALUES ('73', '75', null, '53', 'App\\Models\\Employee', null, '2017-07-04 09:03:39', '2017-07-04 09:03:39');
INSERT INTO `wc_cardcases` VALUES ('74', '71', '8', '53', 'App\\Models\\Employee', null, '2017-07-04 09:28:49', '2017-07-08 09:08:05');
INSERT INTO `wc_cardcases` VALUES ('75', '62', null, '2083', 'App\\Models\\Employee', null, '2017-07-04 16:19:22', '2017-07-04 16:19:22');
INSERT INTO `wc_cardcases` VALUES ('76', '90', null, '1895', 'App\\Models\\Employee', null, '2017-07-04 16:20:47', '2017-07-04 16:20:47');
INSERT INTO `wc_cardcases` VALUES ('77', '71', '7', '61', 'App\\Models\\User', null, '2017-07-04 17:37:56', '2017-07-08 09:08:21');
INSERT INTO `wc_cardcases` VALUES ('78', '70', null, '61', 'App\\Models\\User', null, '2017-07-04 17:54:50', '2017-07-04 17:54:50');
INSERT INTO `wc_cardcases` VALUES ('79', '61', null, '70', 'App\\Models\\User', null, '2017-07-04 17:58:28', '2017-07-04 17:58:28');
INSERT INTO `wc_cardcases` VALUES ('80', '98', null, '2160', 'App\\Models\\Employee', null, '2017-07-05 09:51:39', '2017-07-05 09:51:39');
INSERT INTO `wc_cardcases` VALUES ('81', '95', null, '2022', 'App\\Models\\Employee', null, '2017-07-05 09:54:01', '2017-07-05 09:54:01');
INSERT INTO `wc_cardcases` VALUES ('83', '66', null, '2087', 'App\\Models\\Employee', null, '2017-07-05 11:06:01', '2017-07-05 11:06:01');
INSERT INTO `wc_cardcases` VALUES ('84', '114', null, '2160', 'App\\Models\\Employee', null, '2017-07-05 19:33:36', '2017-07-05 19:33:36');
INSERT INTO `wc_cardcases` VALUES ('85', '89', null, '29', 'App\\Models\\Employee', null, '2017-07-07 15:56:40', '2017-07-07 15:56:40');
INSERT INTO `wc_cardcases` VALUES ('86', '62', null, '1901', 'App\\Models\\Employee', null, '2017-07-07 16:24:38', '2017-07-07 16:24:38');
INSERT INTO `wc_cardcases` VALUES ('87', '124', null, '1901', 'App\\Models\\Employee', null, '2017-07-07 16:36:57', '2017-07-07 16:36:57');
INSERT INTO `wc_cardcases` VALUES ('88', '109', null, '2107', 'App\\Models\\Employee', null, '2017-07-07 17:41:36', '2017-07-07 17:41:36');
INSERT INTO `wc_cardcases` VALUES ('89', '66', null, '2107', 'App\\Models\\Employee', null, '2017-07-07 21:24:24', '2017-07-07 21:24:24');
INSERT INTO `wc_cardcases` VALUES ('90', '62', null, '1987', 'App\\Models\\Employee', null, '2017-07-07 21:38:34', '2017-07-07 21:38:34');
INSERT INTO `wc_cardcases` VALUES ('91', '71', null, '1901', 'App\\Models\\Employee', null, '2017-07-07 21:57:55', '2017-07-07 21:57:55');
INSERT INTO `wc_cardcases` VALUES ('92', '176', null, '1901', 'App\\Models\\Employee', null, '2017-07-10 15:20:09', '2017-07-10 15:20:09');
INSERT INTO `wc_cardcases` VALUES ('93', '62', null, '1885', 'App\\Models\\Employee', null, '2017-07-10 15:25:11', '2017-07-10 15:25:11');
INSERT INTO `wc_cardcases` VALUES ('94', '62', null, '1916', 'App\\Models\\Employee', null, '2017-07-10 15:35:34', '2017-07-10 15:35:34');
INSERT INTO `wc_cardcases` VALUES ('96', '102', null, '29', 'App\\Models\\Employee', null, '2017-07-10 16:32:31', '2017-07-10 16:32:31');
INSERT INTO `wc_cardcases` VALUES ('97', '190', null, '215', 'App\\Models\\User', null, '2017-07-10 16:37:45', '2017-07-10 16:37:45');
INSERT INTO `wc_cardcases` VALUES ('100', '147', null, '220', 'App\\Models\\User', null, '2017-07-10 17:05:45', '2017-07-10 17:05:45');
INSERT INTO `wc_cardcases` VALUES ('101', '147', null, '2161', 'App\\Models\\Employee', null, '2017-07-10 17:06:07', '2017-07-10 17:06:07');
INSERT INTO `wc_cardcases` VALUES ('102', '132', null, '2087', 'App\\Models\\Employee', null, '2017-07-10 17:19:20', '2017-07-10 17:19:20');
INSERT INTO `wc_cardcases` VALUES ('104', '62', null, '237', 'App\\Models\\User', null, '2017-07-10 18:09:53', '2017-07-10 18:09:53');
INSERT INTO `wc_cardcases` VALUES ('105', '232', null, '1895', 'App\\Models\\Employee', null, '2017-07-10 18:20:53', '2017-07-10 18:20:53');
INSERT INTO `wc_cardcases` VALUES ('106', '141', null, '1885', 'App\\Models\\Employee', null, '2017-07-10 18:21:39', '2017-07-10 18:21:39');
INSERT INTO `wc_cardcases` VALUES ('108', '140', null, '2087', 'App\\Models\\Employee', null, '2017-07-10 20:39:41', '2017-07-10 20:39:41');
INSERT INTO `wc_cardcases` VALUES ('109', '75', null, '2087', 'App\\Models\\Employee', null, '2017-07-10 23:14:55', '2017-07-10 23:14:55');
INSERT INTO `wc_cardcases` VALUES ('110', '121', null, '2260', 'App\\Models\\Employee', null, '2017-07-11 17:31:06', '2017-07-11 17:31:06');
INSERT INTO `wc_cardcases` VALUES ('111', '68', null, '2586', 'App\\Models\\Employee', null, '2017-07-12 14:41:59', '2017-07-12 14:41:59');
INSERT INTO `wc_cardcases` VALUES ('112', '198', '36', '190', 'App\\Models\\User', null, '2017-07-13 12:50:31', '2017-07-13 12:51:04');
INSERT INTO `wc_cardcases` VALUES ('113', '198', '36', '285', 'App\\Models\\User', null, '2017-07-13 12:51:27', '2017-07-13 12:51:35');
INSERT INTO `wc_cardcases` VALUES ('114', '198', '36', '152', 'App\\Models\\User', null, '2017-07-13 12:54:07', '2017-07-13 12:54:16');
INSERT INTO `wc_cardcases` VALUES ('115', '293', null, '152', 'App\\Models\\User', null, '2017-07-13 13:26:48', '2017-07-13 13:26:48');
INSERT INTO `wc_cardcases` VALUES ('116', '252', null, '298', 'App\\Models\\User', null, '2017-07-13 16:07:50', '2017-07-13 16:07:50');
INSERT INTO `wc_cardcases` VALUES ('117', '261', null, '2861', 'App\\Models\\Employee', null, '2017-07-13 16:23:23', '2017-07-13 16:23:23');
INSERT INTO `wc_cardcases` VALUES ('118', '261', null, '2839', 'App\\Models\\Employee', null, '2017-07-13 16:24:20', '2017-07-13 16:24:20');
INSERT INTO `wc_cardcases` VALUES ('119', '261', null, '2785', 'App\\Models\\Employee', null, '2017-07-13 17:37:13', '2017-07-13 17:37:13');
INSERT INTO `wc_cardcases` VALUES ('120', '242', null, '331', 'App\\Models\\User', null, '2017-07-13 19:10:34', '2017-07-13 19:10:34');
INSERT INTO `wc_cardcases` VALUES ('121', '242', null, '222', 'App\\Models\\User', null, '2017-07-13 19:11:21', '2017-07-13 19:11:21');
INSERT INTO `wc_cardcases` VALUES ('122', '313', null, '298', 'App\\Models\\User', null, '2017-07-13 20:31:07', '2017-07-13 20:31:07');
INSERT INTO `wc_cardcases` VALUES ('123', '343', null, '2415', 'App\\Models\\Employee', null, '2017-07-14 10:32:29', '2017-07-14 10:32:29');
INSERT INTO `wc_cardcases` VALUES ('124', '261', null, '2401', 'App\\Models\\Employee', null, '2017-07-14 10:33:13', '2017-07-14 10:33:13');
INSERT INTO `wc_cardcases` VALUES ('125', '261', null, '2428', 'App\\Models\\Employee', null, '2017-07-14 10:39:46', '2017-07-14 10:39:46');
INSERT INTO `wc_cardcases` VALUES ('126', '325', null, '2415', 'App\\Models\\Employee', null, '2017-07-14 10:41:22', '2017-07-14 10:41:22');
INSERT INTO `wc_cardcases` VALUES ('127', '261', null, '2408', 'App\\Models\\Employee', null, '2017-07-14 10:50:08', '2017-07-14 10:50:08');
INSERT INTO `wc_cardcases` VALUES ('128', '261', null, '2433', 'App\\Models\\Employee', null, '2017-07-14 11:03:18', '2017-07-14 11:03:18');
INSERT INTO `wc_cardcases` VALUES ('129', '181', null, '29', 'App\\Models\\Employee', null, '2017-07-14 11:25:59', '2017-07-14 11:25:59');
INSERT INTO `wc_cardcases` VALUES ('130', '135', null, '285', 'App\\Models\\User', null, '2017-07-14 15:26:41', '2017-07-14 15:26:41');
INSERT INTO `wc_cardcases` VALUES ('131', '341', null, '2440', 'App\\Models\\Employee', null, '2017-07-14 21:45:54', '2017-07-14 21:45:54');
INSERT INTO `wc_cardcases` VALUES ('132', '341', null, '320', 'App\\Models\\User', null, '2017-07-15 07:55:23', '2017-07-15 07:55:23');
INSERT INTO `wc_cardcases` VALUES ('133', '261', null, '2449', 'App\\Models\\Employee', null, '2017-07-15 11:19:24', '2017-07-15 11:19:24');
INSERT INTO `wc_cardcases` VALUES ('134', '345', null, '370', 'App\\Models\\User', null, '2017-07-17 00:01:56', '2017-07-17 00:01:56');
INSERT INTO `wc_cardcases` VALUES ('135', '346', null, '2415', 'App\\Models\\Employee', null, '2017-07-18 11:39:33', '2017-07-18 11:39:33');
INSERT INTO `wc_cardcases` VALUES ('136', '261', null, '2405', 'App\\Models\\Employee', null, '2017-07-18 15:47:44', '2017-07-18 15:47:44');
INSERT INTO `wc_cardcases` VALUES ('137', '261', null, '2915', 'App\\Models\\Employee', null, '2017-07-18 16:05:00', '2017-07-18 16:05:00');
INSERT INTO `wc_cardcases` VALUES ('138', '261', null, '2963', 'App\\Models\\Employee', null, '2017-07-18 16:28:03', '2017-07-18 16:28:03');
INSERT INTO `wc_cardcases` VALUES ('139', '271', '40', '2521', 'App\\Models\\Employee', null, '2017-07-19 11:25:55', '2017-07-19 11:35:28');
INSERT INTO `wc_cardcases` VALUES ('140', '64', null, '2536', 'App\\Models\\Employee', null, '2017-07-19 11:26:54', '2017-07-19 11:26:54');
INSERT INTO `wc_cardcases` VALUES ('141', '261', null, '2961', 'App\\Models\\Employee', null, '2017-07-19 11:27:13', '2017-07-19 11:27:13');
INSERT INTO `wc_cardcases` VALUES ('142', '271', '40', '2535', 'App\\Models\\Employee', null, '2017-07-19 11:27:39', '2017-07-19 11:35:37');
INSERT INTO `wc_cardcases` VALUES ('143', '64', null, '2507', 'App\\Models\\Employee', null, '2017-07-19 11:27:49', '2017-07-19 11:27:49');
INSERT INTO `wc_cardcases` VALUES ('144', '289', null, '2521', 'App\\Models\\Employee', null, '2017-07-19 11:28:26', '2017-07-19 11:28:26');
INSERT INTO `wc_cardcases` VALUES ('145', '109', null, '2506', 'App\\Models\\Employee', null, '2017-07-19 11:31:24', '2017-07-19 11:31:24');
INSERT INTO `wc_cardcases` VALUES ('146', '405', null, '2536', 'App\\Models\\Employee', null, '2017-07-19 11:32:57', '2017-07-19 11:32:57');
INSERT INTO `wc_cardcases` VALUES ('147', '152', null, '2507', 'App\\Models\\Employee', null, '2017-07-19 11:53:53', '2017-07-19 11:53:53');
INSERT INTO `wc_cardcases` VALUES ('148', '289', null, '152', 'App\\Models\\User', null, '2017-07-19 11:56:08', '2017-07-19 11:56:08');
INSERT INTO `wc_cardcases` VALUES ('149', '85', '41', '83', 'App\\Models\\User', null, '2017-07-19 14:23:15', '2017-07-20 11:34:24');
INSERT INTO `wc_cardcases` VALUES ('150', '459', null, '462', 'App\\Models\\User', null, '2017-07-20 10:58:59', '2017-07-20 10:58:59');
INSERT INTO `wc_cardcases` VALUES ('151', '461', null, '424', 'App\\Models\\User', null, '2017-07-20 11:04:16', '2017-07-20 11:04:16');
INSERT INTO `wc_cardcases` VALUES ('152', '465', null, '2570', 'App\\Models\\Employee', null, '2017-07-20 11:27:25', '2017-07-20 11:27:25');
INSERT INTO `wc_cardcases` VALUES ('153', '468', null, '2599', 'App\\Models\\Employee', null, '2017-07-20 11:50:44', '2017-07-20 11:50:44');
INSERT INTO `wc_cardcases` VALUES ('154', '471', null, '2574', 'App\\Models\\Employee', null, '2017-07-20 11:52:14', '2017-07-20 11:52:14');
INSERT INTO `wc_cardcases` VALUES ('155', '468', null, '2562', 'App\\Models\\Employee', null, '2017-07-20 11:53:07', '2017-07-20 11:53:07');
INSERT INTO `wc_cardcases` VALUES ('156', '472', null, '2562', 'App\\Models\\Employee', null, '2017-07-20 12:03:30', '2017-07-20 12:03:30');
INSERT INTO `wc_cardcases` VALUES ('157', '173', null, '2570', 'App\\Models\\Employee', null, '2017-07-20 17:15:54', '2017-07-20 17:15:54');
INSERT INTO `wc_cardcases` VALUES ('158', '255', null, '251', 'App\\Models\\User', null, '2017-07-21 08:45:22', '2017-07-21 08:45:22');
INSERT INTO `wc_cardcases` VALUES ('159', '135', null, '2759', 'App\\Models\\Employee', null, '2017-07-21 09:17:28', '2017-07-21 09:17:28');
INSERT INTO `wc_cardcases` VALUES ('160', '255', null, '2602', 'App\\Models\\Employee', null, '2017-07-21 09:20:50', '2017-07-21 09:20:50');
INSERT INTO `wc_cardcases` VALUES ('161', '128', null, '2631', 'App\\Models\\Employee', null, '2017-07-21 09:20:53', '2017-07-21 09:20:53');
INSERT INTO `wc_cardcases` VALUES ('162', '135', null, '2746', 'App\\Models\\Employee', null, '2017-07-21 09:21:51', '2017-07-21 09:21:51');
INSERT INTO `wc_cardcases` VALUES ('163', '537', null, '2602', 'App\\Models\\Employee', null, '2017-07-21 09:35:24', '2017-07-21 09:35:24');
INSERT INTO `wc_cardcases` VALUES ('164', '548', null, '2720', 'App\\Models\\Employee', null, '2017-07-21 10:16:25', '2017-07-21 10:16:25');
INSERT INTO `wc_cardcases` VALUES ('165', '85', null, '2723', 'App\\Models\\Employee', null, '2017-07-21 10:36:03', '2017-07-21 10:36:03');
INSERT INTO `wc_cardcases` VALUES ('166', '127', null, '2719', 'App\\Models\\Employee', null, '2017-07-21 12:42:17', '2017-07-21 12:42:17');
INSERT INTO `wc_cardcases` VALUES ('167', '552', null, '226', 'App\\Models\\User', null, '2017-07-21 14:17:32', '2017-07-21 14:17:32');
INSERT INTO `wc_cardcases` VALUES ('168', '552', null, '548', 'App\\Models\\User', null, '2017-07-21 14:18:41', '2017-07-21 14:18:41');
INSERT INTO `wc_cardcases` VALUES ('169', '553', null, '2608', 'App\\Models\\Employee', null, '2017-07-21 14:23:11', '2017-07-21 14:23:11');
INSERT INTO `wc_cardcases` VALUES ('170', '553', null, '548', 'App\\Models\\User', null, '2017-07-21 14:23:26', '2017-07-21 14:23:26');
INSERT INTO `wc_cardcases` VALUES ('171', '520', null, '2744', 'App\\Models\\Employee', null, '2017-07-21 16:47:28', '2017-07-21 16:47:28');
INSERT INTO `wc_cardcases` VALUES ('172', '603', null, '297', 'App\\Models\\User', null, '2017-07-23 17:19:18', '2017-07-23 17:19:18');
INSERT INTO `wc_cardcases` VALUES ('173', '66', null, '1916', 'App\\Models\\Employee', null, '2017-07-24 11:33:28', '2017-07-24 11:33:28');
INSERT INTO `wc_cardcases` VALUES ('174', '110', null, '1916', 'App\\Models\\Employee', null, '2017-07-24 11:33:50', '2017-07-24 11:33:50');
INSERT INTO `wc_cardcases` VALUES ('175', '109', null, '2087', 'App\\Models\\Employee', null, '2017-07-24 11:39:21', '2017-07-24 11:39:21');
INSERT INTO `wc_cardcases` VALUES ('176', '110', null, '604', 'App\\Models\\User', null, '2017-07-24 11:40:16', '2017-07-24 11:40:16');
INSERT INTO `wc_cardcases` VALUES ('177', '109', null, '2165', 'App\\Models\\Employee', null, '2017-07-24 11:40:56', '2017-07-24 11:40:56');
INSERT INTO `wc_cardcases` VALUES ('178', '376', null, '375', 'App\\Models\\User', null, '2017-07-24 14:42:14', '2017-07-24 14:42:14');
INSERT INTO `wc_cardcases` VALUES ('179', '375', null, '376', 'App\\Models\\User', null, '2017-07-24 14:43:27', '2017-07-24 14:43:27');
INSERT INTO `wc_cardcases` VALUES ('180', '151', null, '2285', 'App\\Models\\Employee', null, '2017-07-24 17:46:10', '2017-07-24 17:46:10');
INSERT INTO `wc_cardcases` VALUES ('181', '212', null, '1905', 'App\\Models\\Employee', null, '2017-07-24 17:54:22', '2017-07-24 17:54:22');
INSERT INTO `wc_cardcases` VALUES ('182', '124', null, '1916', 'App\\Models\\Employee', null, '2017-07-24 19:37:45', '2017-07-24 19:37:45');
INSERT INTO `wc_cardcases` VALUES ('183', '62', null, '2107', 'App\\Models\\Employee', null, '2017-07-24 20:02:08', '2017-07-24 20:02:08');
INSERT INTO `wc_cardcases` VALUES ('184', '71', null, '1916', 'App\\Models\\Employee', null, '2017-07-24 20:02:38', '2017-07-24 20:02:38');
INSERT INTO `wc_cardcases` VALUES ('187', '372', null, '2500', 'App\\Models\\Employee', null, '2017-07-25 14:54:21', '2017-07-25 14:54:21');
INSERT INTO `wc_cardcases` VALUES ('188', '628', null, '2499', 'App\\Models\\Employee', null, '2017-07-25 15:26:45', '2017-07-25 15:26:45');
INSERT INTO `wc_cardcases` VALUES ('189', '342', null, '645', 'App\\Models\\User', null, '2017-07-25 16:07:55', '2017-07-25 16:07:55');
INSERT INTO `wc_cardcases` VALUES ('190', '332', null, '2453', 'App\\Models\\Employee', null, '2017-07-25 17:36:01', '2017-07-25 17:36:01');
INSERT INTO `wc_cardcases` VALUES ('191', '262', '35', '1895', 'App\\Models\\Employee', null, '2017-07-25 18:01:48', '2017-07-25 23:03:25');
INSERT INTO `wc_cardcases` VALUES ('192', '642', null, '649', 'App\\Models\\User', null, '2017-07-25 18:40:02', '2017-07-25 18:40:02');
INSERT INTO `wc_cardcases` VALUES ('193', '640', null, '649', 'App\\Models\\User', null, '2017-07-25 18:45:33', '2017-07-25 18:45:33');
INSERT INTO `wc_cardcases` VALUES ('194', '242', null, '314', 'App\\Models\\User', null, '2017-07-25 20:07:51', '2017-07-25 20:07:51');
INSERT INTO `wc_cardcases` VALUES ('196', '616', null, '2087', 'App\\Models\\Employee', null, '2017-07-26 16:13:06', '2017-07-26 16:13:06');
INSERT INTO `wc_cardcases` VALUES ('197', '590', null, '676', 'App\\Models\\User', null, '2017-07-26 16:22:01', '2017-07-26 16:22:01');
INSERT INTO `wc_cardcases` VALUES ('198', '679', null, '74', 'App\\Models\\User', null, '2017-07-26 16:23:20', '2017-07-26 16:23:20');
INSERT INTO `wc_cardcases` VALUES ('199', '698', null, '1902', 'App\\Models\\Employee', null, '2017-07-26 16:35:38', '2017-07-26 16:35:38');
INSERT INTO `wc_cardcases` VALUES ('201', '793', null, '791', 'App\\Models\\User', null, '2017-07-27 14:25:57', '2017-07-27 14:25:57');
INSERT INTO `wc_cardcases` VALUES ('202', '797', null, '1950', 'App\\Models\\Employee', null, '2017-07-27 16:22:34', '2017-07-27 16:22:34');
INSERT INTO `wc_cardcases` VALUES ('203', '721', '49', '2117', 'App\\Models\\Employee', null, '2017-07-27 16:23:16', '2017-07-27 16:25:06');
INSERT INTO `wc_cardcases` VALUES ('204', '661', null, '3197', 'App\\Models\\Employee', null, '2017-08-01 16:04:04', '2017-08-01 16:04:04');
INSERT INTO `wc_cardcases` VALUES ('205', '661', null, '851', 'App\\Models\\User', null, '2017-08-01 16:04:30', '2017-08-01 16:04:30');
INSERT INTO `wc_cardcases` VALUES ('206', '61', null, '3125', 'App\\Models\\Employee', null, '2017-08-02 15:57:12', '2017-08-02 15:57:12');
INSERT INTO `wc_cardcases` VALUES ('207', '52', null, '3124', 'App\\Models\\Employee', null, '2017-08-02 17:04:48', '2017-08-02 17:04:48');
INSERT INTO `wc_cardcases` VALUES ('208', '121', null, '3069', 'App\\Models\\Employee', null, '2017-08-03 15:14:32', '2017-08-03 15:14:32');
INSERT INTO `wc_cardcases` VALUES ('209', '40', '56', '2096', 'App\\Models\\Employee', null, '2017-08-04 15:55:07', '2017-08-19 10:34:42');
INSERT INTO `wc_cardcases` VALUES ('210', '898', null, '3133', 'App\\Models\\Employee', null, '2017-08-07 08:41:11', '2017-08-07 08:41:11');
INSERT INTO `wc_cardcases` VALUES ('211', '907', null, '3129', 'App\\Models\\Employee', null, '2017-08-07 08:55:51', '2017-08-07 08:55:51');
INSERT INTO `wc_cardcases` VALUES ('212', '721', null, '2031', 'App\\Models\\Employee', null, '2017-08-07 11:22:32', '2017-08-07 11:22:32');
INSERT INTO `wc_cardcases` VALUES ('213', '932', null, '1950', 'App\\Models\\Employee', null, '2017-08-07 11:23:34', '2017-08-07 11:23:34');
INSERT INTO `wc_cardcases` VALUES ('214', '657', null, '3234', 'App\\Models\\Employee', null, '2017-08-07 17:58:42', '2017-08-07 17:58:42');
INSERT INTO `wc_cardcases` VALUES ('215', '730', null, '976', 'App\\Models\\User', null, '2017-08-08 08:47:37', '2017-08-08 08:47:37');
INSERT INTO `wc_cardcases` VALUES ('216', '109', null, '1895', 'App\\Models\\Employee', null, '2017-08-09 14:51:54', '2017-08-09 14:51:54');
INSERT INTO `wc_cardcases` VALUES ('217', '52', null, '3133', 'App\\Models\\Employee', null, '2017-08-10 15:59:33', '2017-08-10 15:59:33');
INSERT INTO `wc_cardcases` VALUES ('218', '566', null, '3132', 'App\\Models\\Employee', null, '2017-08-10 16:41:43', '2017-08-10 16:41:43');
INSERT INTO `wc_cardcases` VALUES ('219', '507', null, '2667', 'App\\Models\\Employee', null, '2017-08-10 16:43:06', '2017-08-10 16:43:06');
INSERT INTO `wc_cardcases` VALUES ('220', '109', null, '3217', 'App\\Models\\Employee', null, '2017-08-11 14:59:44', '2017-08-11 14:59:44');
INSERT INTO `wc_cardcases` VALUES ('221', '208', null, '2284', 'App\\Models\\Employee', null, '2017-08-17 20:38:10', '2017-08-17 20:38:10');
INSERT INTO `wc_cardcases` VALUES ('222', '84', null, '2035', 'App\\Models\\Employee', null, '2017-08-18 10:27:15', '2017-08-18 10:27:15');
INSERT INTO `wc_cardcases` VALUES ('223', '396', null, '3138', 'App\\Models\\Employee', null, '2017-08-22 09:51:09', '2017-08-22 09:51:09');
INSERT INTO `wc_cardcases` VALUES ('224', '938', null, '2952', 'App\\Models\\Employee', null, '2017-08-22 09:57:01', '2017-08-22 09:57:01');

-- ----------------------------
-- Table structure for wc_cardcase_company
-- ----------------------------
DROP TABLE IF EXISTS `wc_cardcase_company`;
CREATE TABLE `wc_cardcase_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '公司ID',
  `follower_id` int(10) unsigned DEFAULT NULL COMMENT '收藏的员工名片ID',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='公司 名片夹';

-- ----------------------------
-- Records of wc_cardcase_company
-- ----------------------------
INSERT INTO `wc_cardcase_company` VALUES ('3', '54', '2453', '胡钰广->员工离职名片移交', '2017-07-28 17:11:11', null);
INSERT INTO `wc_cardcase_company` VALUES ('4', '54', '2499', '赖庆城->员工离职名片移交', '2017-08-01 17:13:15', null);

-- ----------------------------
-- Table structure for wc_circles
-- ----------------------------
DROP TABLE IF EXISTS `wc_circles`;
CREATE TABLE `wc_circles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '创建者ID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '圈子名',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `qrcode_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '二维码图片保存路径',
  `limit` int(10) unsigned NOT NULL COMMENT '人数限制',
  `expired_time` timestamp NULL DEFAULT NULL COMMENT '有效期',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `wc_circles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='圈子';

-- ----------------------------
-- Records of wc_circles
-- ----------------------------
INSERT INTO `wc_circles` VALUES ('16', '121', '圈', null, 'uploads/circle/qrcode1501572081.png', '0', '2017-08-04 15:21:21', '2017-08-01 15:21:21', '2017-08-01 15:24:43', '2017-08-01 15:24:43');
INSERT INTO `wc_circles` VALUES ('17', '121', '圈1', null, 'uploads/circle/qrcode1501572294.png', '30', '2017-08-08 15:24:54', '2017-08-01 15:24:54', '2017-08-08 15:57:04', '2017-08-08 15:57:04');
INSERT INTO `wc_circles` VALUES ('18', '121', '会议', null, 'uploads/circle/qrcode1501573705.png', '0', null, '2017-08-01 15:48:25', '2017-08-01 17:24:46', '2017-08-01 17:24:46');
INSERT INTO `wc_circles` VALUES ('19', '40', 'hhhhh', null, 'uploads/circle/qrcode1501579531.png', '30', '2017-08-04 17:25:31', '2017-08-01 17:25:31', '2017-08-04 17:25:41', '2017-08-04 17:25:41');
INSERT INTO `wc_circles` VALUES ('20', '121', '圈1', null, 'uploads/circle/qrcode1501666266.png', '0', null, '2017-08-02 17:31:06', '2017-08-02 17:31:06', null);
INSERT INTO `wc_circles` VALUES ('21', '656', 'a', null, 'uploads/circle/qrcode1501744431.png', '0', null, '2017-08-03 15:13:51', '2017-08-03 15:13:51', null);
INSERT INTO `wc_circles` VALUES ('22', '68', 'aaa', null, 'uploads/circle/qrcode1501836542.png', '30', '2017-08-07 16:49:02', '2017-08-04 16:49:02', '2017-08-07 17:11:15', '2017-08-07 17:11:15');
INSERT INTO `wc_circles` VALUES ('23', '68', 'hhh', null, 'uploads/circle/qrcode1501836554.png', '30', '2017-08-07 16:49:14', '2017-08-04 16:49:14', '2017-08-04 17:22:08', '2017-08-04 17:22:08');
INSERT INTO `wc_circles` VALUES ('24', '40', '记录去', null, 'uploads/circle/qrcode1501837115.png', '0', null, '2017-08-04 16:58:35', '2017-08-04 16:58:35', null);
INSERT INTO `wc_circles` VALUES ('25', '679', '吐了咯人快', null, 'uploads/circle/qrcode1501837181.png', '0', null, '2017-08-04 16:59:41', '2017-08-04 16:59:41', null);
INSERT INTO `wc_circles` VALUES ('26', '40', '姑姑你', null, 'uploads/circle/qrcode1501838477.png', '0', null, '2017-08-04 17:21:17', '2017-08-09 15:22:08', '2017-08-09 15:22:08');
INSERT INTO `wc_circles` VALUES ('27', '68', 'hhh', null, 'uploads/circle/qrcode1501838546.png', '30', '2017-08-07 17:22:26', '2017-08-04 17:22:26', '2017-08-07 17:23:14', '2017-08-07 17:23:14');
INSERT INTO `wc_circles` VALUES ('28', '679', '阿里啦咯啦', null, 'uploads/circle/qrcode1501838548.png', '30', '2017-08-11 17:22:28', '2017-08-04 17:22:28', '2017-08-11 17:35:14', '2017-08-11 17:35:14');
INSERT INTO `wc_circles` VALUES ('29', '40', '兔兔中', null, 'uploads/circle/qrcode1501838579.png', '0', null, '2017-08-04 17:22:59', '2017-08-04 17:22:59', null);
INSERT INTO `wc_circles` VALUES ('30', '52', '嗨喽', null, 'uploads/circle/qrcode1501839401.png', '30', '2017-08-07 17:36:41', '2017-08-04 17:36:41', '2017-08-07 17:39:02', '2017-08-07 17:39:02');
INSERT INTO `wc_circles` VALUES ('31', '52', '看了看', null, 'uploads/circle/qrcode1501839410.png', '30', '2017-08-07 17:36:50', '2017-08-04 17:36:50', '2017-08-07 14:01:19', '2017-08-07 14:01:19');
INSERT INTO `wc_circles` VALUES ('32', '62', '管理群', null, 'uploads/circle/qrcode1502018280.png', '100', '2017-08-13 19:18:00', '2017-08-06 19:18:00', '2017-08-07 14:31:53', '2017-08-07 14:31:53');
INSERT INTO `wc_circles` VALUES ('33', '52', '龙岩', null, 'uploads/circle/qrcode1502085691.png', '30', '2017-08-10 14:01:31', '2017-08-07 14:01:31', '2017-08-10 15:56:57', '2017-08-10 15:56:57');
INSERT INTO `wc_circles` VALUES ('34', '616', '哈哈哈', null, 'uploads/circle/qrcode1502087989.png', '30', '2017-08-10 14:39:49', '2017-08-07 14:39:49', '2017-08-10 15:56:57', '2017-08-10 15:56:57');
INSERT INTO `wc_circles` VALUES ('35', '52', '默默无闻', null, 'uploads/circle/qrcode1502246369.png', '30', '2017-08-12 10:39:29', '2017-08-09 10:39:29', '2017-08-12 11:10:50', '2017-08-12 11:10:50');
INSERT INTO `wc_circles` VALUES ('36', '52', '看看咯', null, 'uploads/circle/qrcode1502246418.png', '30', '2017-08-16 10:40:18', '2017-08-09 10:40:18', '2017-08-09 15:20:32', '2017-08-09 15:20:32');
INSERT INTO `wc_circles` VALUES ('37', '109', '樱桃真好吃', null, 'uploads/circle/qrcode1502261429.png', '30', '2017-08-12 14:50:29', '2017-08-09 14:50:29', '2017-08-12 15:24:36', '2017-08-12 15:24:36');
INSERT INTO `wc_circles` VALUES ('38', '52', '得得得', null, 'uploads/circle/qrcode1502263649.png', '30', '2017-08-16 15:27:29', '2017-08-09 15:27:29', '2017-08-16 15:30:38', '2017-08-16 15:30:38');
INSERT INTO `wc_circles` VALUES ('39', '52', '图腾柱', null, 'uploads/circle/qrcode1502263873.png', '100', '2017-08-12 15:31:13', '2017-08-09 15:31:13', '2017-08-13 16:31:06', '2017-08-13 16:31:06');
INSERT INTO `wc_circles` VALUES ('40', '52', '呃呃呃呃', null, 'uploads/circle/qrcode1502263884.png', '30', '2017-08-16 15:31:24', '2017-08-09 15:31:24', '2017-08-16 15:55:07', '2017-08-16 15:55:07');
INSERT INTO `wc_circles` VALUES ('41', '52', '哈哈', null, 'uploads/circle/qrcode1502264041.png', '30', '2017-08-16 15:34:01', '2017-08-09 15:34:01', '2017-08-16 15:55:07', '2017-08-16 15:55:07');
INSERT INTO `wc_circles` VALUES ('42', '52', '快乐旅途因为我', null, 'uploads/circle/qrcode1502264052.png', '30', '2017-08-16 15:34:12', '2017-08-09 15:34:12', '2017-08-16 15:55:07', '2017-08-16 15:55:07');
INSERT INTO `wc_circles` VALUES ('43', '61', '测试', null, 'uploads/circle/qrcode1502270177.png', '100', '2017-08-16 17:16:17', '2017-08-09 17:16:17', '2017-08-17 10:57:25', '2017-08-17 10:57:25');
INSERT INTO `wc_circles` VALUES ('44', '52', '浓浓', null, 'uploads/circle/qrcode1502351830.png', '100', '2017-08-13 15:57:10', '2017-08-10 15:57:10', '2017-08-13 16:31:06', '2017-08-13 16:31:06');
INSERT INTO `wc_circles` VALUES ('45', '44', '圈', null, 'uploads/circle/qrcode1502356594.png', '0', null, '2017-08-10 17:16:34', '2017-08-10 17:16:34', null);
INSERT INTO `wc_circles` VALUES ('46', '44', '111', null, 'uploads/circle/qrcode1502356606.png', '0', null, '2017-08-10 17:16:46', '2017-08-10 17:16:46', null);
INSERT INTO `wc_circles` VALUES ('47', '44', '圈2', null, 'uploads/circle/qrcode1502413405.png', '0', null, '2017-08-11 09:03:25', '2017-08-11 09:03:25', null);
INSERT INTO `wc_circles` VALUES ('48', '261', '易瑞通', null, 'uploads/circle/qrcode1502522718.png', '0', null, '2017-08-12 15:25:18', '2017-08-12 15:25:18', null);
INSERT INTO `wc_circles` VALUES ('49', '52', '里咯', null, 'uploads/circle/qrcode1502697169.png', '100', '2017-08-21 15:52:49', '2017-08-14 15:52:49', '2017-08-21 16:36:04', '2017-08-21 16:36:04');
INSERT INTO `wc_circles` VALUES ('50', '52', '看空', null, 'uploads/circle/qrcode1502698622.png', '100', '2017-08-17 16:17:02', '2017-08-14 16:17:02', '2017-08-17 17:07:09', '2017-08-17 17:07:09');
INSERT INTO `wc_circles` VALUES ('51', '52', '监控吗', null, 'uploads/circle/qrcode1502701431.png', '100', '2017-08-17 17:03:51', '2017-08-14 17:03:51', '2017-08-17 17:07:09', '2017-08-17 17:07:09');
INSERT INTO `wc_circles` VALUES ('52', '52', '考虑考虑', null, 'uploads/circle/qrcode1502701441.png', '30', '2017-08-21 17:04:01', '2017-08-14 17:04:01', '2017-08-21 17:07:25', '2017-08-21 17:07:25');
INSERT INTO `wc_circles` VALUES ('53', '71', 'gd', null, 'uploads/circle/qrcode1502763610.png', '100', '2017-08-22 10:20:10', '2017-08-15 10:20:10', '2017-08-22 10:39:40', '2017-08-22 10:39:40');
INSERT INTO `wc_circles` VALUES ('54', '71', 'bzhjzbn', null, 'uploads/circle/qrcode1502765975.png', '100', '2017-08-22 10:59:35', '2017-08-15 10:59:35', '2017-08-22 11:15:09', '2017-08-22 11:15:09');
INSERT INTO `wc_circles` VALUES ('55', '66', '公司', null, 'uploads/circle/qrcode1502870128.png', '30', '2017-08-23 15:55:28', '2017-08-16 15:55:28', '2017-08-16 15:55:28', null);
INSERT INTO `wc_circles` VALUES ('56', '61', '测试', null, 'uploads/circle/qrcode1503367620.png', '0', null, '2017-08-22 10:07:00', '2017-08-22 10:07:00', null);

-- ----------------------------
-- Table structure for wc_circle_user
-- ----------------------------
DROP TABLE IF EXISTS `wc_circle_user`;
CREATE TABLE `wc_circle_user` (
  `user_id` int(10) unsigned DEFAULT NULL,
  `circle_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL COMMENT '关注时间',
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `wc_circle_user_ibfk_1` (`user_id`),
  KEY `wc_circle_user_ibfk_2` (`circle_id`),
  CONSTRAINT `wc_circle_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wc_circle_user_ibfk_2` FOREIGN KEY (`circle_id`) REFERENCES `wc_circles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='圈子 - 用户 关联表\r\n';

-- ----------------------------
-- Records of wc_circle_user
-- ----------------------------
INSERT INTO `wc_circle_user` VALUES ('121', '16', null, null);
INSERT INTO `wc_circle_user` VALUES ('121', '18', null, null);
INSERT INTO `wc_circle_user` VALUES ('40', '19', null, null);
INSERT INTO `wc_circle_user` VALUES ('121', '20', null, null);
INSERT INTO `wc_circle_user` VALUES ('656', '21', null, null);
INSERT INTO `wc_circle_user` VALUES ('679', '19', null, null);
INSERT INTO `wc_circle_user` VALUES ('68', '22', null, null);
INSERT INTO `wc_circle_user` VALUES ('68', '23', null, null);
INSERT INTO `wc_circle_user` VALUES ('62', '22', null, null);
INSERT INTO `wc_circle_user` VALUES ('40', '24', null, null);
INSERT INTO `wc_circle_user` VALUES ('679', '25', null, null);
INSERT INTO `wc_circle_user` VALUES ('40', '26', null, null);
INSERT INTO `wc_circle_user` VALUES ('68', '27', null, null);
INSERT INTO `wc_circle_user` VALUES ('679', '28', null, null);
INSERT INTO `wc_circle_user` VALUES ('40', '29', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '30', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '31', null, null);
INSERT INTO `wc_circle_user` VALUES ('62', '32', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '33', null, null);
INSERT INTO `wc_circle_user` VALUES ('616', '34', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '35', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '36', null, null);
INSERT INTO `wc_circle_user` VALUES ('76', '36', null, null);
INSERT INTO `wc_circle_user` VALUES ('40', '36', null, null);
INSERT INTO `wc_circle_user` VALUES ('109', '37', null, null);
INSERT INTO `wc_circle_user` VALUES ('62', '37', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '38', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '39', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '40', null, null);
INSERT INTO `wc_circle_user` VALUES ('76', '33', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '41', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '42', null, null);
INSERT INTO `wc_circle_user` VALUES ('61', '43', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '44', null, null);
INSERT INTO `wc_circle_user` VALUES ('44', '45', null, null);
INSERT INTO `wc_circle_user` VALUES ('44', '46', null, null);
INSERT INTO `wc_circle_user` VALUES ('121', '45', null, null);
INSERT INTO `wc_circle_user` VALUES ('44', '47', null, null);
INSERT INTO `wc_circle_user` VALUES ('261', '48', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '49', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '50', null, null);
INSERT INTO `wc_circle_user` VALUES ('40', '41', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '51', null, null);
INSERT INTO `wc_circle_user` VALUES ('52', '52', null, null);
INSERT INTO `wc_circle_user` VALUES ('71', '53', null, null);
INSERT INTO `wc_circle_user` VALUES ('71', '54', null, null);
INSERT INTO `wc_circle_user` VALUES ('66', '55', null, null);
INSERT INTO `wc_circle_user` VALUES ('61', '56', '2017-08-22 10:07:00', '2017-08-22 10:07:00');

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
  `limit` int(255) DEFAULT '100' COMMENT '员工人数上线',
  `is_profilelink` tinyint(10) DEFAULT NULL COMMENT '公司简介外链开关，0为关，1为开',
  `profilelink` varchar(255) DEFAULT NULL COMMENT '公司简介外链',
  `is_productlink` tinyint(10) DEFAULT NULL COMMENT '公司产品外链开关，0为关，1为开',
  `productlink` varchar(255) DEFAULT NULL,
  `is_person` tinyint(10) unsigned zerofill DEFAULT '0000000000' COMMENT '员工名片展示 0-开；1-关',
  `comment` varchar(255) DEFAULT NULL COMMENT '公司备注',
  `service_area` varchar(255) DEFAULT NULL COMMENT '服务范围',
  `registered_capital` varchar(255) DEFAULT NULL COMMENT '注册资本',
  `registered_number` varchar(255) DEFAULT NULL COMMENT '工商注册号',
  `taxpayer_number` varchar(255) DEFAULT NULL COMMENT '纳税人识别号',
  `des_classifyname` varchar(255) DEFAULT '关于我们' COMMENT '公司简介栏目名',
  `pro_classifyname` varchar(255) DEFAULT '产品服务' COMMENT '公司产品栏目名',
  `nav_classifyname` varchar(255) DEFAULT '导航' COMMENT '导航栏目名',
  `share_classifyname` varchar(255) DEFAULT '分享' COMMENT '分享栏目名',
  `per_classifyname` varchar(255) DEFAULT '个人信息' COMMENT '个人信息栏目名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `companies_name_unique` (`name`) USING BTREE,
  KEY `wc_companies_user_id` (`user_id`),
  KEY `wc_companies_manager_id` (`manager_id`),
  CONSTRAINT `wc_companies_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `wc_managers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `wc_companies_user_id` FOREIGN KEY (`user_id`) REFERENCES `wc_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of wc_companies
-- ----------------------------
INSERT INTO `wc_companies` VALUES ('39', '40', 'strong', '强壮十分', 'uploads/company/strong/img1496627224.jpg', '软件园二期观日路', 'http://www.12t.cn', 'admin@strong.com', '0592-22223333', '十分强壮的公司', '1', null, '1', '2017-05-05 15:14:30', '2017-08-02 14:14:21', '2017-06-05 09:48:40', null, '118.189635', '24.491177', '100', null, null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('40', '118', '12t', '厦门易尔通网络科技有限公司', 'uploads/company/ceshi/img1498636104.png', '厦门市思明区软件园二期观日路36号201单元', 'http://www.12t.cn', 'tousu@xm12t.com', '0592-3503777', '2005年，易尔通被百度授权建立了厦门地区“百度厦门营销服务中心”，该服务中心为厦门地区的百度客户提供专业的服务。2007年11月，百度正式授权易尔通为福建漳州、龙岩地区核心代理。\r\n目前我们的客户服务中心为厦门、泉州、漳州、龙岩及周边地区的百度客户在“咨询服务”、“开户服务”、“关键字管理 ”到“效果跟踪报告”方面提供服务。让客户充分体验产品加上专业的服务才能在网络推广中获得效益。', '0', null, null, '2017-05-05 16:33:53', '2017-08-11 15:36:59', '2017-07-05 09:47:33', null, '118.191713', '24.490425', '100', '1', 'http://www.12t.cn/about.html', '1', 'http://www.12t.cn', '0000000000', '百度厦门/泉州/漳州/龙岩地区服务中心', '计算机网络技术服务；计算机应用软件销售与开发；广告设计、制作、代理、发布。', '5000万人民币', '350203200021797', '91350200769281008D', '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('41', null, 'ABC', 'ABC', null, null, 'http://www.12t.cn', null, null, null, '1', null, '1', '2017-05-09 08:58:59', '2017-05-09 10:09:13', '2017-05-09 08:58:59', null, '118.189635', '24.491177', '100', null, null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('42', '44', 'cpforest001', '公司森林001', 'uploads/company/cpforest001/img1494291962.png', null, 'http://www.12t.cn', null, null, null, '1', null, '1', '2017-05-09 09:06:02', '2017-05-09 09:08:49', '2017-05-09 09:06:02', null, '118.189635', '24.491177', '100', null, null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('43', null, 'COMPANY1', 'COMPANY', null, null, 'http://www.12t.cn', null, null, null, '1', null, '1', '2017-05-09 09:40:06', '2017-05-09 09:49:36', '2017-05-09 09:40:05', null, '118.189635', '24.491177', '100', null, null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('44', null, 'gongsiceshi', '公司测试', 'uploads/company/gongsiceshi/img1496298504.jpg', null, 'http://www.12t.cn', null, null, null, '1', null, '1', '2017-05-25 09:45:49', '2017-06-29 18:51:42', '2017-06-29 18:51:42', null, '118.189635', '24.491177', '100', '0', null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('45', '61', 'test', '试测试测试测试测试测试测试公司', 'uploads/company/test/img1495864577.png', '厦门市思明区软件园二期观日路36号201单元 ', 'http://www.12t.cn', 'xxxxxxxx1@qq.com', '0592-3500000', '测试公司简介--测试公司简介--测试公司简介--测试公司简介--测试公司简介--测试公司简介', '0', null, null, '2017-05-27 13:56:17', '2017-08-11 15:29:13', '2017-05-27 13:56:54', null, '118.191054', '24.49056', '100', '0', 'https://www.baidu.com', '1', 'https://www.baidu.com/', '0000000000', '百度厦门/泉州/漳州/龙岩地区服务中心', '计算机网络技术服务；计算机应用软件销售与开发；广告设计、制作、代理、发布。', '5000万人民币', '350203200021797', '91350200769281008D', '关于我们1', '产品服务2', '导航4', '分享3', '个人信息5');
INSERT INTO `wc_companies` VALUES ('46', null, 'xm12t', '厦门易尔通', null, null, null, null, null, null, '1', null, '1', '2017-06-29 10:17:48', '2017-06-29 10:21:28', '2017-06-29 10:21:28', null, '118.189635', '24.491177', '100', null, null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('47', null, 'A123', 'A公司', 'uploads/company/A123/img1498718137.png', '厦门市思明区软件园二期观日路36号201单元', 'http://www.baidu.com', '104836658@qq.com', '13959272108', null, '1', null, '1', '2017-06-29 14:24:02', '2017-07-05 10:37:50', '2017-06-29 14:54:47', null, '118.19023', '24.491025', '100', '1', 'http://www.gbpen.com/', null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('48', '198', 'zz12t', '漳州市易尔通网络科技有限公司', 'uploads/company/zz12t/img1498793437.png', '漳州市龙文区建元东路2号碧湖万达广场六楼', 'http://www.zz12t.cn/', 'zz@xm12t.com', '0596-6166987', '漳州易尔通网络科技有限公司成立于2010年，是漳州地区唯一指定百度推广服务核心代理商，主营网站制作、网站策划、百度商业产品推广、百度贴吧运营等服务，同时配备SEM管理软件、400电话等服务，为当地企业提供一整理套的网络营销解决方案。总部位于厦门，是厦门、泉州、漳州、龙岩地区百度营销服务中心。', '0', null, null, '2017-06-29 15:09:38', '2017-07-12 15:11:10', '2017-06-29 15:09:54', null, '117.684138', '24.503278', '250', '1', 'http://www.zz12t.cn/html/page_about.html', '1', 'http://www.zz12t.cn/html/page_business_26.html', '0000000000', '有限责任公司', '计算机网络技术服务、计算机软件维护', '壹佰万圆整', '91350603557599575U', null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('49', '854', 'ly12t', '龙岩市易尔通网络科技有限公司', 'uploads/company/ly12t/img1498792435.png', '龙岩商务运营中心商会大厦C栋5层 ', 'http://ly12t.cn/', 'ly@xm12t.com', '0597-5306520', '2005年，易尔通被百度授权建立了厦门地区“百度厦门营销服务中心”，该服务中心为厦门地区的百度客户提供专业的服务。2007年11月，百度正式授权易尔通为福建漳州、龙岩地区核心代理。', '0', null, null, '2017-06-29 15:14:35', '2017-08-07 15:45:04', '2017-06-29 15:14:41', null, '117.027545', '25.080157', '250', '1', 'http://www.ly12t.cn/About-1-27.html', '1', 'http://www.ly12t.cn/About-2-22.html', '0000000000', null, '信息系统集成服务（互联网系统集成除外）：计算机软件开发与销售；国内各类广告设计、制作代理、发布。（依法须经批准的项目，经相关部门批准后方可开展经营活动）', '叁佰万圆整', '91350800091385734F', null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('50', '269', 'qz12t', '厦门易尔通网络科技有限公司泉州分公司', 'uploads/company/ceshi/img1498636104.png', '泉州市丰泽区少林路仁风工业区亚特大厦4楼 ', 'http://www.12t.cn/', 'shuwg@12t.cn', '18959985912', '百度泉州营销服务中心--厦门易尔通网络科技有限公司（泉州分公司）。 2005年，易尔通被百度授权建立了厦门地区“百度客户销售服务中心”，该服务中心为厦门地区的百度客户提供专业的服务。2007年11月，百度正式授权易尔通为福建漳州、龙岩地区核心代理。 目前我们的客户服务中心为厦门、泉州、漳州、龙岩及周边地区的百度客户在“咨询服务”、“开户服务”、“关键字管理 ”到“效果跟踪报告”方面提供服务。让客户充分体验产品加上专业的服务才能在网络推广中获得效益。', '0', null, null, '2017-06-29 15:16:25', '2017-07-12 14:55:16', '2017-06-29 15:16:38', null, '118.613873', '24.926312', '250', '0', 'http://www.12t.cn/', '1', 'http://www.12t.cn', '0000000000', '百度厦门/泉州/漳州/龙岩地区服务中心', '计算机网络技术服务；计算机应用软件销售与开发；广告设计、制作、代理、发布。', '5000万人民币', '350203200021797', null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('51', null, 'kousiro', 'kousiro', null, null, null, null, null, null, '1', null, '1', '2017-06-29 19:05:44', '2017-06-29 19:06:10', '2017-06-29 19:06:10', null, '118.189635', '24.491177', '250', null, null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('52', '121', 'test12t', '厦门易尔通G名片', 'uploads/company/52/img1501662732.jpg', '厦门市思明区软件园二期观日路36号201单元', 'http://www.12t.cn', 'tousu@xm12t.com', '0592-3503777', '厦门易尔通网络科技有限公司于2005年4月13日成立，是百度公司授权厦门、漳州、泉州、龙岩、惠州、汕头、汕尾、潮州的总代理。业务范围有百度大搜、百度糯米、百度外卖、百度贴吧、百度直通车、百度创新中心、百度营销大学；十倍狂飙突进的发展速度，赢得了光辉历程，业绩突破数亿元，已成功地打造成为闽南、闽西、粤东三大区域互联网龙头企业。', '0', null, null, '2017-07-06 09:05:31', '2017-08-10 10:10:13', null, null, '118.191641', '24.490438', '100', '0', 'http://www.12t.cn/about.html', '0', 'http://www.baidu.com/', '0000000000', '百度厦门/泉州/漳州/龙岩地区服务中心', '计算机网络技术服务；计算机应用软件销售与开发；广告设计、制作、代理、发布。', '5000万人民币', '5115313515AGNJ', null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('54', '261', 'hzyrt', '惠州易瑞通网络科技有限公司', 'uploads/company/54/img1499933734.png', '惠州易瑞通网络科技有限公司', 'http://m.ydbaidu.net', null, '07525702166 ', '2016年易瑞通被百度授权建立了粤东地区“百度粤东营销服务中心”，该服务中心为粤东地区的百度客户提供专业的服务。百度授权易瑞通为惠州、汕头、潮州、揭阳、汕尾 、梅州六大地区核心代理。 ', '0', null, null, '2017-07-11 10:44:08', '2017-07-13 16:35:08', null, null, '114.422199', '23.074031', '100', '0', null, null, null, '0000000000', null, '目前我们的客户服务中心为惠州、汕头、潮州、揭阳、汕尾 、梅州及周边地区的百度客户在“咨询服务”、“开户服务”、“关键字管理 ”到“效果跟踪报告”方面提供服务。让客户充分体验产品加上专业的服务才能在网络推广中获得效益。同时客户对服务更高质量的要求易瑞通客户服务中心再推出“网站建设服务”、 “ 网站优化服务 ”、“ 关键字效果分析服务 ” 到 “ 企业网络推广综合报告服务 ”一系列专业服务 ，保证让客户能从网络上获得最佳产品、品牌推广效果，让大量客户从网络中带来了前所未有的经济效益', null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('55', '273', 'mzyrt', '梅州易瑞通网络科技有限公司', 'uploads/company/mzyrt/img1499928449.jpg', '梅州市梅江区彬芳大道中鸿兴创意园', 'http://m.ydbaidu.net/', null, null, null, '0', null, null, '2017-07-11 10:44:28', '2017-07-13 14:56:40', null, null, '116.1373', '24.289711', '100', '0', null, '0', 'http://www.12t.cn', '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('56', '274', 'czyrt', '潮州易瑞通网络科技有限公司', 'uploads/company/56/img1499934641.png', '潮州易瑞通网络科技有限公司', 'http://www.ydbaidu.net', null, '0768-2863555', '2016年易瑞通被百度授权建立了粤东地区“百度粤东营销服务中心”，该服务中心为粤东地区的百度客户提供专业的服务。百度授权易瑞通为惠州、汕头、潮州、揭阳、汕尾 、梅州六大地区核心代理。\r\n目前我们的客户服务中心为惠州、汕头、潮州、揭阳、汕尾 、梅州及周边地区的百度客户在“咨询服务”、“开户服务”、“关键字管理 ”到“效果跟踪报告”方面提供服务。让客户充分体验产品加上专业的服务才能在网络推广中获得效益。\r\n\r\n', '0', null, null, '2017-07-11 10:44:51', '2017-07-15 11:43:17', null, null, '116.619767', '23.674425', '100', '0', null, '0', null, '0000000000', null, '计算机网络技术研发及咨询服务；计算机应用软件销售及开发；广告设计、制作、代理、发布；网页设计等。', null, null, null, '关于我们', '产品', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('57', '272', 'styrt', '汕头市易瑞通网络科技有限公司', 'uploads/company/57/img1499994477.png', '广东省汕头市金平区利鸿基中心大厦20层', 'http://www.ydbaidu.net/', null, '0754-89927111', null, '0', null, null, '2017-07-11 10:45:10', '2017-07-14 10:26:50', null, null, '116.687532', '23.358716', '100', '0', null, '1', 'http://www.12t.cn', '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('58', '82', 'xmsx', '厦门手信科技有限公司', null, null, null, null, null, null, '0', null, null, '2017-07-12 10:37:03', '2017-07-13 17:18:52', null, null, '118.189635', '24.491177', '100', '0', null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('59', '379', 'stnuomi', '汕头糯米', 'uploads/company/59/img1500362817.jpg', '汕头市龙湖长平路91号中源大厦1302室', 'http://m.ydbaidu.net/', null, '0754-86940578', '2016年易瑞通被百度授权建立了粤东地区“百度粤东营销服务中心”，该服务中心为粤东地区的百度客户提供专业的服务。百度授权易瑞通为惠州、汕头、潮州、揭阳、汕尾 、梅州六大地区核心代理。', '0', null, null, '2017-07-18 14:11:21', '2017-07-18 16:03:15', null, null, '116.721652', '23.368098', '100', '0', null, null, null, '0000000000', null, '目前我们的客户服务中心为惠州、汕头、潮州、揭阳、汕尾 、梅州及周边地区的百度客户在“咨询服务”、“开户服务”、“关键字管理 ”到“效果跟踪报告”方面提供服务。让客户充分体验产品加上专业的服务才能在网络推广中获得效益。同时客户对服务更高质量的要求易瑞通客户服务中心再推出“网站建设服务”、 “ 网站优化服务 ”、“ 关键字效果分析服务 ” 到 “ 企业网络推广综合报告服务 ”一系列专业服务 ，保证让客户能从网络上获得最佳产品、品牌推广效果，让大量客户从网络中带来了前所未有的经济效益', null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('60', '381', 'jynuomi', '揭阳糯米', 'uploads/company/60/img1500365985.jpg', '普宁市赤华北路御景城三期对面百得厨卫四楼', null, null, '0663-2768070', '百度糯米是百度公司旗下连接本地生活服务的平台，是百度三大O2O产品之一。其前身是人人旗下的糯米网。原糯米网在2010年6月23日上线，2014年3月6日正式更名为百度糯米。百度糯米汇集美食、电影、酒店、休闲娱乐、旅游、到家服务等众多生活服务的相关产品，并先后接入百度外卖、去哪儿网资源，一站式解决吃喝玩乐相关的所有问题，逐渐完善了百度糯米O2O的生态布局。', '0', null, null, '2017-07-18 14:11:52', '2017-07-20 15:57:30', null, null, '116.172278', '23.317151', '100', '0', null, '0', null, '0000000000', null, '1.百度糯米\r\n2. 百度地图\r\n3. 百度推广\r\n4.百度信息流 ', null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('61', '392', 'swnuomi', '汕尾糯米', 'uploads/company/61/img1500429627.jpg', '汕尾市城区鸿景园', null, null, null, null, '0', null, null, '2017-07-18 14:12:29', '2017-07-19 10:00:27', null, null, '115.380376', '22.782883', '100', '0', null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('62', '656', '12t12', '易尔通12', null, null, null, null, null, null, '1', null, '6', '2017-07-26 09:15:18', '2017-07-26 11:25:43', null, null, '118.189635', '24.491177', '100', null, null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('63', null, 'aaa1', '啊1', null, null, null, null, null, null, '1', null, '6', '2017-07-26 09:59:03', '2017-07-26 09:59:03', null, null, '118.189635', '24.491177', '100', null, null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('64', null, '111', '111', null, null, null, null, null, null, '1', null, '1', '2017-07-26 11:20:02', '2017-07-26 11:20:02', null, null, '118.189635', '24.491177', '100', null, null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('65', '664', 'abc123', '演示', null, '软件园二期', 'http://www.gbpen.com', null, null, null, '0', null, null, '2017-07-26 14:05:36', '2017-07-26 14:25:16', null, null, '118.188412', '24.494751', '100', '1', 'http://www.baidu.com', null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('66', '792', 'dianzi123', '厦门天宇电子科技有限公司', 'uploads/company/66/img1501554213.png', '厦门市软件园二期观日路36号楼201', null, null, null, '厦门易尔通网络科技有限公司于2005年4月13日成立，是百度公司授权厦门、漳州、泉州、龙岩、惠州、汕头、汕尾、潮州的总代理。业务范围有百度大搜、百度糯米、百度外卖、百度贴吧、百度直通车、百度创新中心、百度营销大学；十倍狂飙突进的发展速度，赢得了光辉历程，业绩突破数亿元，已成功地打造成为闽南、闽西、粤东三大区域互联网龙头企业。', '0', null, null, '2017-07-27 14:04:18', '2017-08-01 16:18:27', null, null, '118.190217', '24.491067', '100', '1', 'http://www.12t.cn/about.html', '1', 'http://www.12t.cn/', '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('67', '843', 'jlcw11', '厦门金立财务管理有限公司', 'uploads/company/67/img1501297006.jpg', '软件园二期观日路30号楼', 'http://www.xmjlcaiwu.com', '1247856@qq.com', '0592-3503230', '具有多年的财务代理、公司注册经验.公司拥有专业知识丰富的工作人员。具有丰富的记帐经验和处理实际问题的能力，全面应用财务软件 处理帐务。', '0', null, null, '2017-07-29 10:33:26', '2017-07-29 11:30:29', null, null, '118.189635', '24.491177', '100', '0', null, '0', null, '0000000000', null, '代理记账、税审报告、验资', '100万', null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('68', '845', 'hefeng123', '和风园艺', 'uploads/company/68/img1501551059.jpg', '厦门思明区软件园二期观日路36号', 'http://www.12t.cn/', null, null, '和风园艺主营小庭院园艺设计、公园景观园艺设计、花卉销售等', '0', null, null, '2017-08-01 09:22:17', '2017-08-07 17:35:41', null, null, '118.191362', '24.490416', '100', '0', null, null, null, '0000000000', null, '小庭院园艺设计、公园景观园艺设计、花卉销售', null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('69', '846', 'xmyrg', '厦门悠然谷生态农业有限公司', 'uploads/company/69/img1501551916.jpg', '厦门万石山', null, '111222333@qq.com', '0592-1324567', '厦门悠然谷生态农业有限公司是一座建在森林公园内的生态农庄。野鸡、獾等野生动物在此出没，6000多亩原始次生林是它们的天堂。在玉米成熟的季节，野猪还会不请自来的造访。这里森林覆盖率在85%以上，空气清新、纯净，是天然氧吧。在这个森林公园里放养的山黑猪、藏香猪、绒山羊、华北柴鸡和白鹅，吃野生的虫子、草籽，喝自然渗出的山泉水。谷内散落的几块耕地，种植玉米、黄豆、花生、葵花，完全按生态方法种植，不打农药、不施化肥。', '0', null, null, '2017-08-01 09:22:55', '2017-08-01 11:00:50', null, null, '118.100573', '24.451948', '100', '0', null, null, null, '0000000000', null, '农庄主要的产品包括：\r\n动物认养：藏香猪、山黑猪、绒山羊、白鹅；\r\n散养禽蛋类：柴公鸡，贵妃鸡，柴鸡蛋，贵妃鸡蛋；\r\n散养畜肉类：藏香猪肉，山猪肉，绒山羊肉；\r\n有机杂粮类：有机玉米、黄豆、花生、葵花、小杂粮；\r\n有机食用油：花生油、葵花籽油；\r\n接待类：食宿接待，采摘，钓鱼，休闲观光，农活体验。', '1000万元', '130400400000000', null, '公司简介', '产品服务', '地图', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('70', '847', 'xmeshidai', '厦门e时代装潢工程有限公司', 'uploads/company/70/img1501555013.png', null, null, null, null, '厦门e时代装潢工程有限公司专注于建筑装潢装饰领域，主要业务涵盖公共建筑与住宅精装修施工、设计与咨询服务,幕墙设计与安装,智能化、机电安装，园林绿化，软装陈设，新型材料与软件研发等领域', '0', null, null, '2017-08-01 09:27:32', '2017-08-01 10:37:56', null, null, '118.189635', '24.491177', '100', '0', null, null, null, '0000000000', null, '公共建筑与住宅精装修施工、设计与咨询服务,幕墙设计与安装,智能化、机电安装，园林绿化，软装陈设，新型材料与软件研发', null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('71', '848', 'xmwqyj', '厦门望谦教育', 'uploads/company/71/img1501557040.jpg', '厦门市思明区软件园二期观日路36号201单元', 'http://www.12t.cn/', '2853962268@qq.com', '0592-3503966 ', '百度厦门营销服务中心--厦门易尔通网络科技有限公司\r\n网站建设服务\r\n\r\n依托百度品牌的易尔通网站建设服务，继续秉承“帮助客户获得更多新客户！”的服务宗旨，为您提供专业的网站设计制作、符合百度搜索习惯的网站整体策划建设。网站制作过程充分考虑网民的浏览习惯和网站自身的推广宣传功能，为企业建设优势的电子商务基础平台。同时，稳定的设计人员和维护团队为企业建站的后期服务提供了有力保证，让您不用再为找不到原先服务的网络公司而担忧！', '1', null, '11', '2017-08-01 09:39:23', '2017-08-01 11:14:00', null, null, '118.189635', '24.491177', '100', null, null, '0', 'https://www.baidu.com/', '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('72', '849', 'xmtywl', '厦门兴东峰物流有限公司', 'uploads/company/72/img1502173269.jpg', '厦门集美区灌口中路49号之（9-14）', 'http://xdfexpress.n02.5067.org/', null, '13850069491', '厦门兴东峰物流有限公司于2010年10月成立，公司注册资本为318万元整，总公司位于厦门，分别在西安、兰州、西宁、银川、乌鲁木齐、拉萨设立分公司。我司主要承运厦门至西北各省市（陕西、甘肃、宁夏、新疆、西藏等辐射全境）零担或整车箱车平板等专线运输。', '0', null, null, '2017-08-01 10:31:06', '2017-08-08 14:21:09', null, null, '118.01906', '24.61149', '100', '0', 'http://xdfexpress.n02.5067.org/', '1', 'http://xdfexpress.n02.5067.org/', '0000000000', null, '厦门兴东峰物流有限公司于2010年10月成立，公司注册资本为318万元整，总公司位于厦门，分别在西安、兰州、西宁、银川、乌鲁木齐、拉萨设立分公司。我司主要承运厦门至西北各省市（陕西、甘肃、宁夏、新疆、西藏等辐射全境）零担或整车箱车平板等专线运输。', null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('73', '851', 'xmgwplc', '厦门光沃自动化设备有限公司', 'uploads/company/73/img1501574371.png', '厦门市思明区嘉禾路293号宝达大厦1003', 'http://www.xmgwplc.com/', '3151326358@qq.com', '0592-5709821', '厦门光沃自动化设备有限公司是一家专业从事大型进口系统（集散式控制系统、可编程控制器、冗余容错控制系统、机器人系统）备件销售。', '0', null, null, '2017-08-01 15:07:46', '2017-08-01 15:59:31', null, null, '118.132038', '24.492663', '100', '0', null, '1', 'http://www.xmgwplc.com/category/30467.html', '0000000000', '厦门光沃自动化设备有限公司', '主营：世界知名品牌的PLC 、DCS 系统备件', '厦门光沃自动化设备有限公司', '32189896', null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('74', '966', 'xmzhongyun1', '厦门众耘财务咨询有限公司', 'uploads/company/74/img1502176379.jpg', '厦门湖里区殿前一路光彩青年创业园229室', 'http://www.xmzhongyun.com', '1398073635@qq.com', '13774695953', '厦门众耘财务咨询有限公司是经厦门市工商行政管理局批准设立的，致力于打造财税一条龙服务的平台，服务的项目有：公司注册、财税代理、公司变更、许可证办理等等，成立于2016年。公司拥有一批资深的中、高级会计师等专业人才，大家秉着“耕耘有道，众创辉煌”的经营理念，为广大新老客户提供优良的财税整体解决方案，欢迎大家光临指导。\r\n\r\n我们经营理念：\r\n耕耘有道，众创辉煌\r\n我们的使命：\r\n为客户提供最专业的财税服务！\r\n我们的价值观：\r\n专业 诚信 高效 成功 ', '0', null, null, '2017-08-07 16:27:15', '2017-08-08 15:12:59', null, null, '118.189635', '24.491177', '100', '0', null, '0', null, '0000000000', null, '公司注册、财税代理、公司变更、许可证办理', null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('75', '967', 'xmhthjc', '厦门海腾辉建材有限公司', 'uploads/company/75/img1502176693.jpg', '厦门市湖里区枋湖北二路562号二楼', 'http://www.xmhthjc.com/', '524203729@qq.com', '0592-5557834', '厦门海腾辉建材有限公司成立于2007年，本公司是一家地板系统研发、生产、销售、工程设计、施工为一体的现代化高新科技企业。', '0', null, null, '2017-08-07 17:00:44', '2017-08-08 15:18:13', null, null, '118.15656', '24.527459', '100', '0', null, '1', 'http://www.xmhthjc.com/category/33199.html', '0000000000', null, null, null, null, null, '关于我们', '产品服务', '地图导航', '名片分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('76', '968', 'yufudianzi', '惠州市宇富电子科技有限公司', 'uploads/company/76/img1502177692.png', '惠州市博罗县石湾镇明月一路645号', 'http://yufudianzi.com/', null, '0752-6919870', '惠州市宇富电子科技有限公司致力于成长为行业的优秀厂商，以产品的良好性能、高可靠性及追求卓越的工艺水平提供符合客户要求的高品质环保产品，通过贯彻公司的品质方针和环境方针来达到”零次品”的的目标，贯彻和实施品质环境方针过程，积极运用定期的内部监查和管理评审及各种改善活动，促进品质环境体系的不断改善，确保公司的品质环境体系能持续发展。', '0', null, null, '2017-08-07 17:03:22', '2017-08-08 15:34:52', null, null, '113.870723', '23.134248', '100', '0', null, '1', 'http://yufudianzi.n02.5067.org/category/48433.html', '0000000000', null, '专门设计生产各种贴片电感、线圈的制造商，产品主要应用于液晶电视、笔记本电脑、小型通信设备、PDA、CTV、VTR、DVD、音响、通讯及各种办公设备和仪器，并可以根据客户要求设计开发非标线圈。', null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('77', '971', 'qzlongshida', '泉州市隆事达装饰工程有限公司', 'uploads/company/77/img1502176743.png', '泉州市洛江区禾洋工业区A栋', null, null, '0595-22187306', '泉州市隆事达装饰工程有限公司是一家从事办公高隔，办公隔断桌，卫生间隔断，集设计、开发、生产及销售安装为一体的社会导向企业，目前其产品结构正朝多元化发展，主要承接各类商务写字楼，机关办公楼、学校，医院等公用卫生间及浴房隔断的安装业务。\r\n\r\n\r\n销售多款隔断专用配件及板材，下述产品是泉州总代理：304铝蜂窝板，抗倍特复合板，一代抗倍特，二代抗倍特，PVC板，竹纤板，防潮板等。', '0', null, null, '2017-08-07 17:30:06', '2017-08-08 15:19:03', null, null, '118.635154', '25.032955', '100', '0', null, null, null, '0000000000', null, '商务写字楼，机关办公楼、学校，医院等', null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('78', '970', 'cyshuichan', '惠州市惠城区诚誉水产养殖场', 'uploads/company/78/img1502099348.jpg', null, 'http://cyshuichan.com/', '635299200@qq.com', '15768465168', '惠州市惠城区诚誉水产养殖场（惠州鱼苗场）本基地是集优质良种鱼苗繁殖和技术推广以及成品鱼高效养殖于一身的渔业企业。\r\n在养殖户肯定和大力支持下，公司基地不断发展壮大现已在惠州拥有繁育和培育基地，鱼苗品种齐全供货稳定。\r\n本基地长期培育繁殖供应各类淡水鱼苗，培育鱼苗有：罗非鱼苗，良种鲫鱼苗，本地塘鲺苗，黄颡鱼苗，鸭嘴鱼苗，台湾泥鳅苗，白鲳鱼苗，斑点叉尾鮰鱼苗，丁贵鱼苗，光倒刺鲃鱼苗，大囗鲶鱼苗，和龟鳖类等各种名优水产种苗。规格齐全，批发零售，欢迎各界朋友莅临参观、指导和业务洽谈。', '0', null, null, '2017-08-07 17:31:10', '2017-08-07 17:49:08', null, null, '118.189635', '24.491177', '100', '0', 'http://cyshuichan.com/category/40594.html', null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('79', '973', 'yisheng123', '漳浦亿晟绿化苗木有限公司', 'uploads/company/79/img1502099957.jpg', '福建省漳州市漳浦县沙西镇高林村', 'http://zpysmm.n02.5067.org/', null, '15859666567', '漳浦县沙西镇常青园艺场，是一家以种植及销售为一体的企业，经过多年努力经营。积累了一批长期客户，形成了产，供，销为一体的完整体系。产品畅销国内外各大市场，公司的诚信，实力及产品的质量获得了业界的认可。公司位于中国福建省漳浦县“榕树盆景之乡”--沙西镇。公司秉着诚信第一，客户至上，合作共赢的经营理念。欢迎各界朋友莅临参观、指导和业务洽谈。 ', '0', null, null, '2017-08-07 17:35:26', '2017-08-07 18:07:55', null, null, '117.583937', '23.935248', '100', '0', null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('80', '972', 'zz51coloraround', '漳州龙文土形生教育咨询有限责任公司', 'uploads/company/80/img1502100059.png', '漳州万达金街1幢D034/D035商铺', 'http://zztltq.n02.5067.org/', '26207544@qq.com', '0596－2166615', '涂来涂去 ( COLOR AROUND)以培养创造力为首的九大潜能为宗旨，为中国1-12岁儿童设计了永不重复的多元化创意艺术课程，在实践过程中最大程度上保护童心、激发创想、探索发现、培养潜力。\r\n\r\n涂来涂去品牌来自北美，是漳州目前唯一引进一线品牌的少儿创意美术中心，总部在上海，涂来涂去漳州国际少儿创意美术中心漳州校区300平米强势进驻漳州新商业腹地漳州万达金街！是首档少儿情绪与心智管理创意美术学习交流体验中心。\r\n', '0', null, null, '2017-08-07 17:38:14', '2017-08-07 18:00:59', null, null, '117.684264', '24.503175', '100', '0', null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('81', null, 'lxl123', '厦门易尔通公司', null, null, null, null, null, null, '1', null, '7', '2017-08-16 10:10:25', '2017-08-16 10:10:25', null, null, '118.189635', '24.491177', '100', null, null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('82', '1003', 'lxl456', '龙岩分公司', null, null, null, null, null, null, '1', null, '7', '2017-08-16 10:36:02', '2017-08-16 10:38:16', null, null, '118.189635', '24.491177', '100', null, null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');
INSERT INTO `wc_companies` VALUES ('83', '993', '139', '秋名山老司机', null, null, null, null, null, null, '1', null, '1', '2017-08-16 15:56:02', '2017-08-16 15:58:08', null, null, '118.189635', '24.491177', '100', null, null, null, null, '0000000000', null, null, null, null, null, '关于我们', '产品服务', '导航', '分享', '个人信息');

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
) ENGINE=InnoDB AUTO_INCREMENT=296 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部门表';

-- ----------------------------
-- Records of wc_departments
-- ----------------------------
INSERT INTO `wc_departments` VALUES ('80', '40', '0', '总经理室', null, null, '2017-06-29 19:16:03', '2017-06-29 19:16:03');
INSERT INTO `wc_departments` VALUES ('81', '40', '0', '客服运营部', '1983', null, '2017-06-29 19:16:03', '2017-07-07 09:44:47');
INSERT INTO `wc_departments` VALUES ('82', '40', '0', '搜索事业部', '1885', null, '2017-06-29 19:16:03', '2017-07-07 09:52:44');
INSERT INTO `wc_departments` VALUES ('83', '40', '0', '运营支持中心', '1887', null, '2017-06-29 19:16:03', '2017-07-07 09:44:59');
INSERT INTO `wc_departments` VALUES ('84', '40', '0', '品牌中心', '1899', null, '2017-06-29 19:16:03', '2017-07-07 09:54:44');
INSERT INTO `wc_departments` VALUES ('85', '40', '0', '财务部', '2083', null, '2017-06-29 19:16:03', '2017-07-07 09:46:12');
INSERT INTO `wc_departments` VALUES ('86', '40', '0', '人力行政中心', '1948', null, '2017-06-29 19:16:03', '2017-07-07 09:46:32');
INSERT INTO `wc_departments` VALUES ('87', '40', '0', '技术运营中心', '2064', null, '2017-06-29 19:16:03', '2017-07-07 09:45:20');
INSERT INTO `wc_departments` VALUES ('88', '40', '0', '销售运营部', '1964', null, '2017-06-29 19:16:03', '2017-07-11 13:57:10');
INSERT INTO `wc_departments` VALUES ('89', '40', '0', '金融产品中心', '1928', null, '2017-06-29 19:16:03', '2017-07-07 09:50:45');
INSERT INTO `wc_departments` VALUES ('90', '40', '0', '市场部', '1969', null, '2017-06-29 19:16:03', '2017-07-07 09:45:29');
INSERT INTO `wc_departments` VALUES ('91', '40', '0', '创新中心', '2124', null, '2017-06-29 19:16:03', '2017-07-07 09:49:13');
INSERT INTO `wc_departments` VALUES ('92', '40', '0', '滴滴事业部', '2093', null, '2017-06-29 19:16:03', '2017-07-07 09:45:39');
INSERT INTO `wc_departments` VALUES ('93', '52', '0', '部门A', '2229', null, '2017-07-06 10:57:52', '2017-07-11 17:32:32');
INSERT INTO `wc_departments` VALUES ('94', '52', '0', '部门B', '2271', null, '2017-07-06 10:58:03', '2017-07-08 11:23:51');
INSERT INTO `wc_departments` VALUES ('95', '52', '0', '部门C', null, null, '2017-07-06 10:58:15', '2017-07-06 10:58:15');
INSERT INTO `wc_departments` VALUES ('98', '52', '0', '部门d', null, null, '2017-07-06 15:01:55', '2017-07-06 15:01:55');
INSERT INTO `wc_departments` VALUES ('99', '52', '0', 's', '2271', null, '2017-07-08 11:24:21', '2017-07-08 11:25:01');
INSERT INTO `wc_departments` VALUES ('100', '54', '0', '销售运营部', '2396', null, '2017-07-11 17:38:41', '2017-07-12 08:34:55');
INSERT INTO `wc_departments` VALUES ('101', '54', '0', '行政组', '2397', null, '2017-07-11 17:38:41', '2017-07-12 08:35:16');
INSERT INTO `wc_departments` VALUES ('102', '54', '0', '招聘组', '2398', null, '2017-07-11 17:38:41', '2017-07-12 08:35:28');
INSERT INTO `wc_departments` VALUES ('103', '54', '0', '一区', '2399', null, '2017-07-11 17:38:41', '2017-07-12 08:35:41');
INSERT INTO `wc_departments` VALUES ('104', '54', '0', '一区一部', '2400', null, '2017-07-11 17:38:41', '2017-07-12 08:36:05');
INSERT INTO `wc_departments` VALUES ('105', '54', '0', '一区二部', '2401', null, '2017-07-11 17:38:41', '2017-07-12 08:37:15');
INSERT INTO `wc_departments` VALUES ('106', '54', '0', '一区信息流部', '2402', null, '2017-07-11 17:38:41', '2017-07-12 08:37:27');
INSERT INTO `wc_departments` VALUES ('107', '54', '0', '二区', '2403', null, '2017-07-11 17:38:41', '2017-07-12 08:37:51');
INSERT INTO `wc_departments` VALUES ('108', '54', '0', '客服运营部', '2404', null, '2017-07-11 17:38:41', '2017-07-12 08:38:05');
INSERT INTO `wc_departments` VALUES ('109', '54', '0', '市场部', '2407', null, '2017-07-11 17:38:41', '2017-07-12 08:38:14');
INSERT INTO `wc_departments` VALUES ('110', '54', '0', '二区一部', '2408', null, '2017-07-11 17:38:41', '2017-07-12 08:38:24');
INSERT INTO `wc_departments` VALUES ('111', '54', '0', '质控部', '2413', null, '2017-07-11 17:38:41', '2017-07-12 08:38:34');
INSERT INTO `wc_departments` VALUES ('112', '54', '0', '二区二部', '2421', null, '2017-07-11 17:38:41', '2017-07-12 08:38:46');
INSERT INTO `wc_departments` VALUES ('113', '54', '0', '二区三部', '2418', null, '2017-07-11 17:38:41', '2017-07-12 08:38:57');
INSERT INTO `wc_departments` VALUES ('114', '54', '0', '培训部', '2423', null, '2017-07-11 17:38:41', '2017-07-12 08:37:05');
INSERT INTO `wc_departments` VALUES ('115', '54', '0', '一区三部', '2428', null, '2017-07-11 17:38:41', '2017-07-12 08:39:15');
INSERT INTO `wc_departments` VALUES ('116', '54', '0', '二区信息流部', '2425', null, '2017-07-11 17:38:41', '2017-07-12 08:39:31');
INSERT INTO `wc_departments` VALUES ('117', '54', '0', '财务部', '2427', null, '2017-07-11 17:38:41', '2017-07-12 08:39:45');
INSERT INTO `wc_departments` VALUES ('118', '54', '0', '二区四部', '2433', null, '2017-07-11 17:38:41', '2017-07-12 08:39:59');
INSERT INTO `wc_departments` VALUES ('119', '54', '0', '一区四部', '2434', null, '2017-07-11 17:38:41', '2017-07-12 08:40:15');
INSERT INTO `wc_departments` VALUES ('120', '54', '0', '人力行政部', '2437', null, '2017-07-11 17:38:41', '2017-07-12 08:40:34');
INSERT INTO `wc_departments` VALUES ('121', '54', '0', '薪酬绩效组', '2438', null, '2017-07-11 17:38:41', '2017-07-12 08:40:48');
INSERT INTO `wc_departments` VALUES ('126', '50', '0', '财务部', '2615', null, '2017-07-12 10:40:53', '2017-07-12 14:01:10');
INSERT INTO `wc_departments` VALUES ('127', '50', '0', '市场部', '2617', null, '2017-07-12 10:41:01', '2017-07-12 14:01:18');
INSERT INTO `wc_departments` VALUES ('128', '48', '0', '销售运营部', '2508', null, '2017-07-12 12:42:59', '2017-07-12 13:56:58');
INSERT INTO `wc_departments` VALUES ('129', '48', '0', '技术运营中心', '2531', null, '2017-07-12 12:42:59', '2017-07-12 13:57:06');
INSERT INTO `wc_departments` VALUES ('130', '48', '0', '客服运营部', '2537', null, '2017-07-12 12:42:59', '2017-07-12 13:57:14');
INSERT INTO `wc_departments` VALUES ('131', '48', '0', '运营支持部', '2554', null, '2017-07-12 12:42:59', '2017-07-12 13:57:22');
INSERT INTO `wc_departments` VALUES ('132', '48', '0', '财务部', '2555', null, '2017-07-12 12:42:59', '2017-07-12 13:57:28');
INSERT INTO `wc_departments` VALUES ('133', '48', '0', '市场部', '2556', null, '2017-07-12 12:42:59', '2017-07-12 13:57:36');
INSERT INTO `wc_departments` VALUES ('134', '48', '0', '人力行政中心', '2558', null, '2017-07-12 12:42:59', '2017-07-12 13:57:43');
INSERT INTO `wc_departments` VALUES ('136', '49', '0', '客拓四组', '2561', null, '2017-07-12 13:39:18', '2017-07-12 14:38:20');
INSERT INTO `wc_departments` VALUES ('137', '49', '0', '信息组', '2562', null, '2017-07-12 13:39:18', '2017-07-12 14:38:30');
INSERT INTO `wc_departments` VALUES ('139', '49', '0', '龙岩二部', '2564', null, '2017-07-12 13:39:18', '2017-07-12 14:39:02');
INSERT INTO `wc_departments` VALUES ('140', '49', '0', '龙岩一部', '2575', null, '2017-07-12 13:39:18', '2017-07-12 14:39:13');
INSERT INTO `wc_departments` VALUES ('141', '49', '0', '漳龙大区', '2576', null, '2017-07-12 13:39:18', '2017-07-12 14:39:29');
INSERT INTO `wc_departments` VALUES ('142', '49', '0', '定单控制组', '2574', null, '2017-07-12 13:39:18', '2017-07-12 14:39:41');
INSERT INTO `wc_departments` VALUES ('143', '49', '0', '行政组', '2568', null, '2017-07-12 13:39:18', '2017-08-10 14:26:31');
INSERT INTO `wc_departments` VALUES ('144', '49', '0', '龙岩三部', '2569', null, '2017-07-12 13:39:18', '2017-07-12 14:40:22');
INSERT INTO `wc_departments` VALUES ('145', '49', '0', '龙岩营业区', '2570', null, '2017-07-12 13:39:18', '2017-07-12 14:40:31');
INSERT INTO `wc_departments` VALUES ('146', '49', '0', '培训部', '2571', null, '2017-07-12 13:39:18', '2017-07-12 14:40:40');
INSERT INTO `wc_departments` VALUES ('147', '49', '0', '龙岩四部', '2580', null, '2017-07-12 13:39:18', '2017-07-12 14:40:49');
INSERT INTO `wc_departments` VALUES ('148', '49', '0', '市场部', '2583', null, '2017-07-12 13:39:18', '2017-07-12 14:39:15');
INSERT INTO `wc_departments` VALUES ('149', '49', '0', '招聘组', '2584', null, '2017-07-12 13:39:18', '2017-07-12 14:39:08');
INSERT INTO `wc_departments` VALUES ('150', '49', '0', '财务部', '2600', null, '2017-07-12 13:39:18', '2017-07-12 14:39:00');
INSERT INTO `wc_departments` VALUES ('152', '50', '0', '销售运营部', '2601', null, '2017-07-12 13:52:53', '2017-07-12 14:01:27');
INSERT INTO `wc_departments` VALUES ('153', '50', '0', '运营支持中心', '2613', null, '2017-07-12 13:52:53', '2017-07-12 14:01:37');
INSERT INTO `wc_departments` VALUES ('154', '50', '0', '人力行政中心', '2619', null, '2017-07-12 13:52:53', '2017-07-12 14:01:51');
INSERT INTO `wc_departments` VALUES ('155', '50', '0', '技术运营中心', '2636', null, '2017-07-12 13:52:53', '2017-07-12 14:02:00');
INSERT INTO `wc_departments` VALUES ('156', '50', '0', '客服运营部', '2675', null, '2017-07-12 13:52:53', '2017-07-12 14:02:09');
INSERT INTO `wc_departments` VALUES ('157', '50', '0', '金融产品中心', '2712', null, '2017-07-12 13:52:53', '2017-07-12 14:02:15');
INSERT INTO `wc_departments` VALUES ('158', '57', '0', '人力行政中心', '2783', null, '2017-07-12 16:24:01', '2017-07-12 16:46:23');
INSERT INTO `wc_departments` VALUES ('159', '57', '0', '销售运营部一区', '2792', null, '2017-07-12 16:24:01', '2017-07-12 16:46:32');
INSERT INTO `wc_departments` VALUES ('160', '57', '0', '财务部', '2787', null, '2017-07-12 16:24:01', '2017-07-12 16:46:51');
INSERT INTO `wc_departments` VALUES ('161', '57', '0', '市场部', '2789', null, '2017-07-12 16:24:01', '2017-07-12 16:46:59');
INSERT INTO `wc_departments` VALUES ('162', '57', '0', '技术运营部', '2801', null, '2017-07-12 16:24:01', '2017-07-12 16:47:07');
INSERT INTO `wc_departments` VALUES ('163', '57', '0', '客户服务中心', '2813', null, '2017-07-12 16:24:01', '2017-07-12 16:47:15');
INSERT INTO `wc_departments` VALUES ('172', '57', '0', '销售运营部二区', '2786', null, '2017-07-12 16:36:40', '2017-07-12 16:47:36');
INSERT INTO `wc_departments` VALUES ('173', '56', '0', '人力行政部', null, null, '2017-07-12 17:16:11', '2017-07-12 17:16:11');
INSERT INTO `wc_departments` VALUES ('174', '56', '0', '销售运营部', null, null, '2017-07-12 17:16:11', '2017-07-12 17:16:11');
INSERT INTO `wc_departments` VALUES ('175', '56', '0', '市场部', null, null, '2017-07-12 17:16:11', '2017-07-12 17:16:11');
INSERT INTO `wc_departments` VALUES ('177', '54', '0', '总经办', null, null, '2017-07-13 10:38:10', '2017-07-13 10:38:10');
INSERT INTO `wc_departments` VALUES ('178', '58', '0', '创新中心', null, null, '2017-07-13 17:20:07', '2017-07-13 17:20:07');
INSERT INTO `wc_departments` VALUES ('179', '58', '0', '项目部', null, null, '2017-07-13 17:20:50', '2017-07-13 17:20:50');
INSERT INTO `wc_departments` VALUES ('180', '58', '0', '运营部', null, null, '2017-07-13 17:21:00', '2017-07-13 17:21:00');
INSERT INTO `wc_departments` VALUES ('181', '55', '0', '糯米事业部', '2900', null, '2017-07-18 15:00:20', '2017-07-18 15:00:41');
INSERT INTO `wc_departments` VALUES ('185', '55', '0', '销售运营部', '2838', null, '2017-07-18 15:16:39', '2017-07-18 15:22:13');
INSERT INTO `wc_departments` VALUES ('186', '55', '0', '人力行政中心', null, null, '2017-07-18 15:16:39', '2017-07-18 15:16:39');
INSERT INTO `wc_departments` VALUES ('187', '55', '0', '市场部', null, null, '2017-07-18 15:16:39', '2017-07-18 15:16:39');
INSERT INTO `wc_departments` VALUES ('188', '59', '0', '销售部', null, null, '2017-07-18 15:29:33', '2017-07-18 15:29:33');
INSERT INTO `wc_departments` VALUES ('189', '54', '0', '糯米事业部', null, null, '2017-07-18 15:33:41', '2017-07-18 15:33:41');
INSERT INTO `wc_departments` VALUES ('190', '59', '0', '人力行政部', null, null, '2017-07-18 15:39:00', '2017-07-18 15:39:00');
INSERT INTO `wc_departments` VALUES ('191', '59', '0', '运营部', null, null, '2017-07-18 15:39:00', '2017-07-18 15:39:00');
INSERT INTO `wc_departments` VALUES ('192', '60', '0', '人力行政部', null, null, '2017-07-18 16:06:33', '2017-07-18 16:10:27');
INSERT INTO `wc_departments` VALUES ('193', '60', '0', '销售运营部', '2962', null, '2017-07-18 16:06:52', '2017-07-18 16:14:57');
INSERT INTO `wc_departments` VALUES ('195', '60', '0', '运营部', null, null, '2017-07-18 16:07:54', '2017-07-18 16:07:54');
INSERT INTO `wc_departments` VALUES ('197', '56', '0', '糯米事业部', null, null, '2017-07-18 17:10:12', '2017-07-18 17:10:12');
INSERT INTO `wc_departments` VALUES ('204', '61', '0', '销售运营部', '3014', null, '2017-07-19 09:28:56', '2017-07-19 09:32:48');
INSERT INTO `wc_departments` VALUES ('205', '61', '0', '人力行政中心', '3010', null, '2017-07-19 09:28:56', '2017-07-19 09:32:31');
INSERT INTO `wc_departments` VALUES ('206', '61', '0', '运营中心', '3011', null, '2017-07-19 09:28:56', '2017-07-19 09:32:39');
INSERT INTO `wc_departments` VALUES ('207', '40', '0', null, null, null, '2017-07-25 11:18:28', '2017-07-25 11:18:28');
INSERT INTO `wc_departments` VALUES ('208', '62', '0', '订单部', null, null, '2017-07-26 09:16:08', '2017-07-26 09:16:08');
INSERT INTO `wc_departments` VALUES ('209', '62', '0', '客服部', null, null, '2017-07-26 09:16:17', '2017-07-26 09:16:17');
INSERT INTO `wc_departments` VALUES ('210', '62', '0', '技术部', null, null, '2017-07-26 09:16:28', '2017-07-26 09:16:28');
INSERT INTO `wc_departments` VALUES ('211', '62', '0', '部门A', null, null, '2017-07-26 09:27:20', '2017-07-26 09:27:20');
INSERT INTO `wc_departments` VALUES ('212', '62', '0', '部门B', null, null, '2017-07-26 09:27:20', '2017-07-26 09:27:20');
INSERT INTO `wc_departments` VALUES ('215', '63', '0', '客服', null, null, '2017-07-26 10:01:55', '2017-07-26 10:01:55');
INSERT INTO `wc_departments` VALUES ('216', '63', '0', '订单', null, null, '2017-07-26 10:02:03', '2017-07-26 10:02:03');
INSERT INTO `wc_departments` VALUES ('217', '65', '0', '部门A', '3081', null, '2017-07-26 14:14:34', '2017-07-26 14:26:58');
INSERT INTO `wc_departments` VALUES ('218', '65', '0', '部门B', null, null, '2017-07-26 14:14:34', '2017-07-26 14:14:34');
INSERT INTO `wc_departments` VALUES ('219', '65', '0', null, null, null, '2017-07-26 14:14:34', '2017-07-26 14:14:34');
INSERT INTO `wc_departments` VALUES ('220', '65', '0', '技术', null, null, '2017-07-26 14:26:02', '2017-07-26 14:26:02');
INSERT INTO `wc_departments` VALUES ('223', '67', '0', '定单部', null, null, '2017-07-29 11:06:16', '2017-07-29 11:06:16');
INSERT INTO `wc_departments` VALUES ('224', '67', '0', '客服部', null, null, '2017-07-29 11:06:16', '2017-07-29 11:06:16');
INSERT INTO `wc_departments` VALUES ('225', '67', '0', '技术部', null, null, '2017-07-29 11:06:16', '2017-07-29 11:06:16');
INSERT INTO `wc_departments` VALUES ('226', '67', '0', null, null, null, '2017-07-29 11:06:16', '2017-07-29 11:06:16');
INSERT INTO `wc_departments` VALUES ('227', '52', '0', '部门D', null, null, '2017-07-31 10:41:54', '2017-07-31 10:41:54');
INSERT INTO `wc_departments` VALUES ('228', '52', '0', '部门E', null, null, '2017-07-31 10:41:54', '2017-07-31 10:41:54');
INSERT INTO `wc_departments` VALUES ('229', '52', '0', '部门F', null, null, '2017-07-31 10:41:54', '2017-07-31 10:41:54');
INSERT INTO `wc_departments` VALUES ('234', '71', '0', '主任部', null, null, '2017-08-01 09:49:22', '2017-08-01 09:49:22');
INSERT INTO `wc_departments` VALUES ('235', '71', '0', '教育部', null, null, '2017-08-01 09:50:12', '2017-08-01 09:50:12');
INSERT INTO `wc_departments` VALUES ('236', '71', '0', '行政部', null, null, '2017-08-01 09:50:29', '2017-08-01 09:50:29');
INSERT INTO `wc_departments` VALUES ('237', '68', '0', '销售部', null, null, '2017-08-01 10:03:16', '2017-08-01 10:03:16');
INSERT INTO `wc_departments` VALUES ('238', '68', '0', '设计部', null, null, '2017-08-01 10:03:16', '2017-08-01 10:03:16');
INSERT INTO `wc_departments` VALUES ('239', '68', '0', '市场部', null, null, '2017-08-01 10:03:16', '2017-08-01 10:03:16');
INSERT INTO `wc_departments` VALUES ('240', '70', '0', '部门A', null, null, '2017-08-01 10:09:43', '2017-08-01 10:09:43');
INSERT INTO `wc_departments` VALUES ('241', '70', '0', '部门B', null, null, '2017-08-01 10:09:43', '2017-08-01 10:09:43');
INSERT INTO `wc_departments` VALUES ('242', '70', '0', null, null, null, '2017-08-01 10:09:43', '2017-08-01 10:09:43');
INSERT INTO `wc_departments` VALUES ('243', '66', '0', '销售部', '3187', null, '2017-08-01 10:43:14', '2017-08-01 15:12:43');
INSERT INTO `wc_departments` VALUES ('244', '66', '0', '设计部', '3190', null, '2017-08-01 10:43:14', '2017-08-01 15:12:50');
INSERT INTO `wc_departments` VALUES ('245', '66', '0', '市场部', '3194', null, '2017-08-01 10:43:14', '2017-08-01 15:12:57');
INSERT INTO `wc_departments` VALUES ('246', '66', '0', null, null, null, '2017-08-01 10:43:14', '2017-08-01 10:43:14');
INSERT INTO `wc_departments` VALUES ('247', '69', '0', '董事会', null, null, '2017-08-01 10:43:42', '2017-08-01 10:43:42');
INSERT INTO `wc_departments` VALUES ('248', '69', '0', '采购组', null, null, '2017-08-01 10:43:42', '2017-08-01 10:43:42');
INSERT INTO `wc_departments` VALUES ('249', '69', '0', '种植组', null, null, '2017-08-01 10:43:42', '2017-08-01 10:43:42');
INSERT INTO `wc_departments` VALUES ('250', '69', '0', '运输组', null, null, '2017-08-01 10:43:42', '2017-08-01 10:43:42');
INSERT INTO `wc_departments` VALUES ('251', '69', '0', null, null, null, '2017-08-01 10:43:42', '2017-08-01 10:43:42');
INSERT INTO `wc_departments` VALUES ('253', '72', '0', '客服部', null, null, '2017-08-01 10:49:34', '2017-08-01 10:49:34');
INSERT INTO `wc_departments` VALUES ('255', '72', '0', '财务部', null, null, '2017-08-01 10:49:34', '2017-08-01 10:49:34');
INSERT INTO `wc_departments` VALUES ('256', '72', '0', '行政部', null, null, '2017-08-01 10:49:34', '2017-08-01 10:49:34');
INSERT INTO `wc_departments` VALUES ('257', '72', '0', '渠道部', null, null, '2017-08-01 10:49:34', '2017-08-01 10:49:34');
INSERT INTO `wc_departments` VALUES ('259', '71', '0', null, null, null, '2017-08-01 10:56:19', '2017-08-01 10:56:19');
INSERT INTO `wc_departments` VALUES ('260', '52', '0', '销售部', null, null, '2017-08-01 10:59:16', '2017-08-01 10:59:16');
INSERT INTO `wc_departments` VALUES ('261', '52', '0', '设计部', null, null, '2017-08-01 10:59:16', '2017-08-01 10:59:16');
INSERT INTO `wc_departments` VALUES ('262', '52', '0', '市场部', null, null, '2017-08-01 10:59:16', '2017-08-01 10:59:16');
INSERT INTO `wc_departments` VALUES ('263', '52', '0', null, null, null, '2017-08-01 10:59:16', '2017-08-01 10:59:16');
INSERT INTO `wc_departments` VALUES ('264', '73', '0', '部门A', null, null, '2017-08-01 15:16:52', '2017-08-01 15:16:52');
INSERT INTO `wc_departments` VALUES ('265', '73', '0', '部门B', null, null, '2017-08-01 15:16:52', '2017-08-01 15:16:52');
INSERT INTO `wc_departments` VALUES ('266', '73', '0', '部门C', null, null, '2017-08-01 15:16:52', '2017-08-01 15:16:52');
INSERT INTO `wc_departments` VALUES ('267', '73', '0', null, null, null, '2017-08-01 15:16:52', '2017-08-01 15:16:52');
INSERT INTO `wc_departments` VALUES ('268', '75', '0', '部门A', null, null, '2017-08-07 17:18:18', '2017-08-07 17:18:18');
INSERT INTO `wc_departments` VALUES ('269', '75', '0', null, null, null, '2017-08-07 17:18:18', '2017-08-07 17:18:18');
INSERT INTO `wc_departments` VALUES ('270', '76', '0', '业务部', null, null, '2017-08-07 17:24:03', '2017-08-07 17:24:03');
INSERT INTO `wc_departments` VALUES ('271', '76', '0', '采购部', null, null, '2017-08-07 17:24:03', '2017-08-07 17:24:03');
INSERT INTO `wc_departments` VALUES ('272', '76', '0', '生产部', null, null, '2017-08-07 17:24:03', '2017-08-07 17:24:03');
INSERT INTO `wc_departments` VALUES ('273', '76', '0', null, null, null, '2017-08-07 17:24:03', '2017-08-07 17:24:03');
INSERT INTO `wc_departments` VALUES ('274', '72', '0', '搬运部', null, null, '2017-08-07 17:36:09', '2017-08-07 17:36:09');
INSERT INTO `wc_departments` VALUES ('275', '80', '0', '总经理', null, null, '2017-08-07 17:42:32', '2017-08-07 17:44:10');
INSERT INTO `wc_departments` VALUES ('276', '80', '0', null, null, null, '2017-08-07 17:42:32', '2017-08-07 17:42:32');
INSERT INTO `wc_departments` VALUES ('277', '78', '0', '销售部', null, null, '2017-08-07 17:44:18', '2017-08-07 17:44:18');
INSERT INTO `wc_departments` VALUES ('278', '78', '0', null, null, null, '2017-08-07 17:44:18', '2017-08-07 17:44:18');
INSERT INTO `wc_departments` VALUES ('279', '79', '0', '销售部', null, null, '2017-08-07 17:48:42', '2017-08-07 17:48:42');
INSERT INTO `wc_departments` VALUES ('284', '77', '0', '部门A', null, null, '2017-08-07 17:58:54', '2017-08-07 17:58:54');
INSERT INTO `wc_departments` VALUES ('285', '77', '0', null, null, null, '2017-08-07 17:58:54', '2017-08-07 17:58:54');
INSERT INTO `wc_departments` VALUES ('287', '82', '0', '部门A', null, null, '2017-08-16 10:42:30', '2017-08-16 10:42:30');
INSERT INTO `wc_departments` VALUES ('288', '82', '0', '部门B', null, null, '2017-08-16 10:42:30', '2017-08-16 10:42:30');
INSERT INTO `wc_departments` VALUES ('289', '82', '0', '部门C', null, null, '2017-08-16 10:42:30', '2017-08-16 10:42:30');
INSERT INTO `wc_departments` VALUES ('290', '82', '0', null, null, null, '2017-08-16 10:42:30', '2017-08-16 10:42:30');
INSERT INTO `wc_departments` VALUES ('291', '83', '0', '部门A', null, null, '2017-08-16 16:06:55', '2017-08-16 16:06:55');
INSERT INTO `wc_departments` VALUES ('292', '83', '0', '部门B', null, null, '2017-08-16 16:06:55', '2017-08-16 16:06:55');
INSERT INTO `wc_departments` VALUES ('293', '83', '0', '部门C', null, null, '2017-08-16 16:06:55', '2017-08-16 16:06:55');
INSERT INTO `wc_departments` VALUES ('294', '83', '0', null, null, null, '2017-08-16 16:06:55', '2017-08-16 16:06:55');
INSERT INTO `wc_departments` VALUES ('295', '83', '0', '部门D', null, null, '2017-08-16 16:20:52', '2017-08-16 16:20:52');

-- ----------------------------
-- Table structure for wc_dp2out
-- ----------------------------
DROP TABLE IF EXISTS `wc_dp2out`;
CREATE TABLE `wc_dp2out` (
  `department` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `external` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '对外称呼'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='12t对内职称转对外职称';

-- ----------------------------
-- Records of wc_dp2out
-- ----------------------------
INSERT INTO `wc_dp2out` VALUES ('财务部', '财务经理', '财务经理');
INSERT INTO `wc_dp2out` VALUES ('财务部', '财务支持', '财务');
INSERT INTO `wc_dp2out` VALUES ('财务部', '财务主管', '会计');
INSERT INTO `wc_dp2out` VALUES ('财务部', '财务专员', '财务');
INSERT INTO `wc_dp2out` VALUES ('财务部', '出纳专员', '出纳');
INSERT INTO `wc_dp2out` VALUES ('财务部', '会计', '会计');
INSERT INTO `wc_dp2out` VALUES ('财务部', '主办会计', '会计');
INSERT INTO `wc_dp2out` VALUES ('财务部', '总监', '财务总监');
INSERT INTO `wc_dp2out` VALUES ('创新中心', '公共关系专员', '公共关系专员');
INSERT INTO `wc_dp2out` VALUES ('创新中心', '行政经理', '行政经理');
INSERT INTO `wc_dp2out` VALUES ('创新中心', '经理', '项目经理');
INSERT INTO `wc_dp2out` VALUES ('创新中心', '项目专员', '总经理助理');
INSERT INTO `wc_dp2out` VALUES ('创新中心', '运营助理（实习生）', '总经理助理');
INSERT INTO `wc_dp2out` VALUES ('创新中心', '总监', '运营总监');
INSERT INTO `wc_dp2out` VALUES ('滴滴事业部', '滴滴助理', '客服主管');
INSERT INTO `wc_dp2out` VALUES ('滴滴事业部', '高级商务经理', '滴滴事业部经理');
INSERT INTO `wc_dp2out` VALUES ('滴滴事业部', '商务经理', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('滴滴事业部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客户经理', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '策划专员', '策划经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '策划专员', '策划经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '策划专员（实习生）', '策划经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '策划专员', '策划经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '经理', '大区经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '高级商务经理', '策划经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '程序员', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '程序组主管', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '技术部经理', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '设计师', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '设计组主管', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '总监', '事业部总经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', 'BD经理', 'BD经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '经理', '渠道经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '前端工程师', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '前端工程师实习生', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '经理', '技术总监');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '前端工程师', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '设计师', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '设计主管', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '主管', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '定单专员', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '网站客服', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '信息编辑组主管', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '主管', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '定单专员', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '网站客服', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '主管', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '主管', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客服专员', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '网站客服', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '网站客服', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '定单客服', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '经理', '大区经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓主管', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '主管', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '主管', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓主管', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓主管', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '大区经理', '客服总监');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '大区经理', '客服总监');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客服大区助理', '总监助理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '经理', '大区经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '代理主管', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '基础组主管', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '网站客服', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客服主管', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '网站客服', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '维护专员', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '质控主管', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '主管', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '客拓专员', '客户支持');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '测试专员', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', 'NET程序员', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', 'PHP程序员', '技术工程师');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '产品经理', '产品经理');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '经理', '技术总监');
INSERT INTO `wc_dp2out` VALUES ('技术运营中心', '研发主管', '项目主管');
INSERT INTO `wc_dp2out` VALUES ('金融产品中心', '大区经理', '金融事业部经理');
INSERT INTO `wc_dp2out` VALUES ('金融产品中心', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('金融产品中心', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('金融产品中心', '风控专员', '风控监察');
INSERT INTO `wc_dp2out` VALUES ('金融产品中心', '运营专员', '运营助理');
INSERT INTO `wc_dp2out` VALUES ('所属一级部门', '职务', '对外');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '大区经理', '客服大区经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '大区经理', '客服大区经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服主管', '客服主管');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '经理助理', '总经理助理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '总监', '事业部总经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '维护部经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '产品经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '产品专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服主管', '客服主管');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '美工', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '美工主管', '客服主管');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '网盟经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '网盟专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '大区经理', '客服大区经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服经理', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('客服运营部', '客服专员', '客服');
INSERT INTO `wc_dp2out` VALUES ('品牌中心', '品牌产品经理', '品牌产品经理');
INSERT INTO `wc_dp2out` VALUES ('品牌中心', '策划专员', '策划经理');
INSERT INTO `wc_dp2out` VALUES ('品牌中心', '客服专员', '客服经理');
INSERT INTO `wc_dp2out` VALUES ('品牌中心', '客户经理', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '培训专员', '培训师');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '培训部经理', '培训部经理');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '培训主管', '高级培训师');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '培训专员', '培训师');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '培训专员', '培训师');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '培训专员', '培训师');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '培训专员', '培训师');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '采购主管', '采购经理');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '行政司机', '行政司机');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '行政主管', '高级行政助理');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '行政专员', '行政助理');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '行政专员（兼会计）', '行政助理');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '司机', '行政司机');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '网络管理员', '网络工程师');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '人力行政经理', '人力行政经理');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '薪酬绩效专员', '薪酬绩效专员');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '人力行政部主管', '人事主管');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '薪酬绩效主管', '薪酬福利主管');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '薪酬绩效专员', '薪酬绩效专员');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '招聘主管', '招聘主管');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '招聘助理（实习生）', '招聘助理（实习生）');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '招聘专员', '招聘专员');
INSERT INTO `wc_dp2out` VALUES ('人力行政中心', '总监', '人力行政总监');
INSERT INTO `wc_dp2out` VALUES ('所属一级部门', '职务', '对外');
INSERT INTO `wc_dp2out` VALUES ('市场部', '市场经理', '市场总监');
INSERT INTO `wc_dp2out` VALUES ('市场部', '市场主管', '市场经理');
INSERT INTO `wc_dp2out` VALUES ('市场部', '市场助理', '总监助理');
INSERT INTO `wc_dp2out` VALUES ('市场部', '市场专员', '市场主管');
INSERT INTO `wc_dp2out` VALUES ('搜索事业部', '搜索销售事业部总经理', '搜索销售事业部总经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售工程师', '销售工程师');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '大区经理', '销售总监');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '大区经理', '销售总监');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '直通车专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '直通车专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '直通车专员', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '大区经理', '大区经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '大区经理', '大区经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '大区经理', '大区经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '大区经理', '大区经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '大区经理', '大区经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '代理总经理', '总经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售助理', '总经理助理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售助理', '总经理助理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售助理', '总经理助理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售助理', '总经理助理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售总监', '销售总监');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '运营总监', '运营总监');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '总经理', '总经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '大区经理', '销售总监');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售工程师', '销售工程师');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售主管', '大客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '总经理', '总经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '商务经理', '商务经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '营销顾问', '客户经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售运营部总监', '事业部经理');
INSERT INTO `wc_dp2out` VALUES ('销售运营部', '销售助理', '总经理助理');
INSERT INTO `wc_dp2out` VALUES ('所属一级部门', '职务', '对外');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '风控监察经理', '风控监察经理');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '风控监察专员', '风控监察专员');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '数据分析员', '数据分析师');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '总监', '运营支持总监');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '分公司接口人', '质控助理');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '直通车审核专员', '质控专员');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '质控经理', '质控经理');
INSERT INTO `wc_dp2out` VALUES ('运营支持中心', '质控专员', '质控专员');
INSERT INTO `wc_dp2out` VALUES ('总经理室', '副总经理', '副总经理');
INSERT INTO `wc_dp2out` VALUES ('总经理室', '总经理', '总经理');
INSERT INTO `wc_dp2out` VALUES (null, null, '大客户经理');

-- ----------------------------
-- Table structure for wc_employees
-- ----------------------------
DROP TABLE IF EXISTS `wc_employees`;
CREATE TABLE `wc_employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '公司ID',
  `templategroup_id` int(10) DEFAULT NULL COMMENT '模板组id',
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
) ENGINE=InnoDB AUTO_INCREMENT=3271 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of wc_employees
-- ----------------------------
INSERT INTO `wc_employees` VALUES ('28', '39', null, null, null, null, null, 'S00002', '测试员', null, null, null, '0592-43124111', '2017-05-05 16:34:10', '2017-06-29 17:28:32', null);
INSERT INTO `wc_employees` VALUES ('29', '40', null, '87', '395', '技术工程师', null, 'Y00001', '高涵', null, 'gaohan@xm12t.com', null, '0592-0592123', '2017-05-05 16:35:33', '2017-07-14 17:10:04', '2017-07-14 17:10:04');
INSERT INTO `wc_employees` VALUES ('30', '39', null, null, null, null, '40', 'S00001', '谢大琦', null, null, '18768104513', '464132749', '2017-05-05 17:17:49', '2017-08-01 15:59:36', null);
INSERT INTO `wc_employees` VALUES ('32', '39', null, null, null, null, null, 'S8946313', '阿斯蒂芬111', 'uploads/employee/S8946313/img1494041632.jpg', null, null, null, '2017-05-05 19:22:05', '2017-05-22 16:20:19', null);
INSERT INTO `wc_employees` VALUES ('34', '39', null, null, null, null, '42', 'S127486', '前台添加', null, null, null, null, '2017-05-05 19:30:23', '2017-05-08 11:39:55', null);
INSERT INTO `wc_employees` VALUES ('38', '39', null, null, null, null, null, 'asdf111', 'asdg', null, null, null, null, '2017-05-06 11:04:58', '2017-05-16 14:20:00', null);
INSERT INTO `wc_employees` VALUES ('39', '39', null, null, null, null, null, 'zcx134', 'dsaf', null, null, null, null, '2017-05-06 11:08:33', '2017-05-06 11:08:33', null);
INSERT INTO `wc_employees` VALUES ('40', '39', null, null, null, null, null, 'config', 'config', null, null, null, null, '2017-05-06 11:10:25', '2017-05-06 11:10:25', null);
INSERT INTO `wc_employees` VALUES ('41', '39', null, null, null, null, null, 'test444', 'tset444', 'uploads/employee/test444/img1494040298.gif', null, null, null, '2017-05-06 11:11:38', '2017-05-06 11:11:38', null);
INSERT INTO `wc_employees` VALUES ('42', '39', null, null, null, null, null, 'L986', '124asd', 'uploads/employee/L986/img1494040402.gif', null, null, null, '2017-05-06 11:13:22', '2017-05-06 11:13:22', null);
INSERT INTO `wc_employees` VALUES ('43', '41', null, null, null, null, null, 'A00001', 'AAA', null, null, null, null, '2017-05-09 09:00:01', '2017-05-09 10:09:13', null);
INSERT INTO `wc_employees` VALUES ('45', '42', null, null, null, null, '44', 'C00001', '我的用户名森林001', null, null, null, null, '2017-05-09 09:08:49', '2017-05-09 09:08:49', null);
INSERT INTO `wc_employees` VALUES ('46', '42', null, null, null, null, null, 'C00002', '我的用户森林002', 'uploads/employee/C00002/img1494292189.jpg', null, null, '05925555555', '2017-05-09 09:09:49', '2017-05-09 09:09:49', null);
INSERT INTO `wc_employees` VALUES ('47', '42', null, null, null, null, null, 'C00003', '员工', null, null, null, null, '2017-05-09 09:17:08', '2017-05-09 09:17:08', null);
INSERT INTO `wc_employees` VALUES ('49', '43', null, null, null, null, null, 'C00001', 'USER1', null, null, null, null, '2017-05-09 09:40:17', '2017-05-09 09:49:36', null);
INSERT INTO `wc_employees` VALUES ('50', '41', null, null, null, null, null, 'A2212', '12212', null, null, null, null, '2017-05-09 10:15:04', '2017-05-09 10:15:04', null);
INSERT INTO `wc_employees` VALUES ('51', '42', null, null, null, null, '46', 'C0003', '第三个员工', 'uploads/company/42/employees/C0003/img1502414257.jpg', null, null, null, '2017-05-09 16:36:05', '2017-08-11 09:17:37', null);
INSERT INTO `wc_employees` VALUES ('53', '45', null, null, '9', null, '61', 't00001', '开发人员', null, '525252525@qq.com', '05927080387', '7070707', '2017-05-27 13:57:48', '2017-07-24 14:24:55', null);
INSERT INTO `wc_employees` VALUES ('54', '45', null, null, '9', null, null, 't00002', '测试', 'uploads/company/45/employees/t00002/img1499930930.png', '12132312@qq.com', '13696969877', '0592-0592122', '2017-06-02 09:09:06', '2017-07-13 15:28:50', null);
INSERT INTO `wc_employees` VALUES ('55', '39', null, null, null, null, null, 'abc123', 'abc123', 'uploads/employee/abc123/img1496365941.gif', null, null, null, '2017-06-02 09:12:21', '2017-06-02 09:12:21', null);
INSERT INTO `wc_employees` VALUES ('56', '39', null, null, null, null, null, 'adsf', 'asdcs', null, null, null, null, '2017-06-05 09:22:53', '2017-06-05 09:22:53', null);
INSERT INTO `wc_employees` VALUES ('104', '39', null, null, null, null, null, '0001', '万大锤', null, 'abc@qq.com', '13012345678', '0592-3548145', null, null, null);
INSERT INTO `wc_employees` VALUES ('133', '39', null, null, null, null, null, '0010', '周惹发', null, 'abc@qq.com', '13012345678', '0592-3548154', '2017-06-06 16:04:47', null, null);
INSERT INTO `wc_employees` VALUES ('138', '39', null, null, null, null, null, 'AA0001', '万大锤', null, 'abc@qq.com', '13012345678', '0592-3548145', '2017-06-07 10:20:45', null, null);
INSERT INTO `wc_employees` VALUES ('139', '39', null, null, null, null, null, 'AA0010', '周惹发', null, 'abc@qq.com', '13012345678', '0592-3548154', '2017-06-07 10:20:45', null, null);
INSERT INTO `wc_employees` VALUES ('140', '39', null, null, null, null, null, '0002', '谢大脚', null, 'abc@qq.com', '13012345678', '0592-3548146', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('141', '39', null, null, null, null, null, '0003', '梧田淑', null, 'abc@qq.com', '13012345678', '0592-3548147', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('142', '39', null, null, null, null, null, '0004', '李世民', null, 'abc@qq.com', '13012345678', '0592-3548148', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('143', '39', null, null, null, null, null, '0005', '士力架', null, 'abc@qq.com', '13012345678', '0592-3548149', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('144', '39', null, null, null, null, null, '0006', '田大炜', null, 'abc@qq.com', '13012345678', '0592-3548150', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('145', '39', null, null, null, null, null, '0007', '李小二', null, 'abc@qq.com', '13012345678', '0592-3548151', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('146', '39', null, null, null, null, null, '0008', '赵晓娥', null, 'abc@qq.com', '13012345678', '0592-3548152', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('147', '39', null, null, null, null, null, '0009', '王大庆', null, 'abc@qq.com', '13012345678', '0592-3548153', '2017-06-07 14:28:42', null, null);
INSERT INTO `wc_employees` VALUES ('149', '46', null, null, '17', null, null, 'a001', '一个测试', 'uploads/company/xm12t/employees/a001/img1498703228.jpg', null, null, '0592-3503506', '2017-06-29 10:27:08', '2017-06-29 10:27:08', null);
INSERT INTO `wc_employees` VALUES ('151', '47', null, null, '18', null, null, 'a01', 'aaa', null, null, null, null, '2017-06-29 14:25:41', '2017-07-05 10:37:50', null);
INSERT INTO `wc_employees` VALUES ('152', '47', null, null, '18', null, null, 'A100', 'aaa', 'uploads/company/A123/employees/A100/img1498718271.png', null, null, '0592-3503506', '2017-06-29 14:37:51', '2017-06-29 14:37:51', null);
INSERT INTO `wc_employees` VALUES ('158', '49', null, null, null, null, null, 'a01', '1', null, null, null, null, '2017-06-29 15:15:13', '2017-08-16 10:12:21', '2017-08-16 10:12:21');
INSERT INTO `wc_employees` VALUES ('159', '50', null, null, '409', null, null, 'a01', '1', null, null, null, null, '2017-06-29 15:17:03', '2017-07-12 10:38:54', '2017-07-12 10:38:54');
INSERT INTO `wc_employees` VALUES ('160', '44', null, null, '6', null, null, 'a465443c', 'cc', null, null, null, null, '2017-06-29 15:30:16', '2017-06-29 17:53:42', null);
INSERT INTO `wc_employees` VALUES ('1193', '51', null, null, null, null, null, 'a455353453453', 'cc', null, null, null, null, '2017-06-29 19:06:32', '2017-06-29 19:06:32', null);
INSERT INTO `wc_employees` VALUES ('1882', '40', null, '80', '324', '总经理', '238', '12t001', '牛宏翔', null, 'niu@12t.cn', '13860423411', '3503999', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1883', '40', null, '80', '325', '副总经理', null, '12t002', '朱凯民', null, 'zhu@12t.cn', '13606060050', '3503888', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1884', '40', null, '81', '326', '客服大区经理', '706', '12txm002', '宋宇红', null, 'cs@12t.cn', '13459032306', '3503266', '2017-06-29 19:16:03', '2017-07-26 16:29:33', null);
INSERT INTO `wc_employees` VALUES ('1885', '40', null, '82', '327', '搜索销售事业部总经理', '147', '12txm003', '赖爱华', null, 'aiwa@12t.cn', '13599540060', '3503777', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1886', '40', null, '81', '328', '事业部总经理', '175', '12txm219', '许国忠', null, 'xugzh@12t.cn', '13696906006', '3503333', '2017-06-29 19:16:03', '2017-07-26 16:22:54', null);
INSERT INTO `wc_employees` VALUES ('1887', '40', null, '83', '328', '运营支持总监', '691', '12txm004', '王煜', null, 'cs1@12t.cn', '13806021412', '3503166', '2017-06-29 19:16:03', '2017-07-26 16:22:40', null);
INSERT INTO `wc_employees` VALUES ('1888', '40', null, '84', '329', '大客户经理', null, '12txm006', '叶其煌', null, 'yeqh@12t.cn', '13850090199', '3503355', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1889', '40', null, '81', '326', '客服大区经理', null, '12txm011', '叶艳丽', null, 'cs12@12t.cn', '15259250114', '3503228', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1890', '40', null, '81', '326', '客服大区经理', '178', '12txm012', '陈顺艺', null, 'cs11@12t.cn', '15980779522', '3503117', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1891', '40', null, '85', '330', '财务', '686', '12txm013', '古淑敏', null, 'cs6@12t.cn', '13400658506', '3503566', '2017-06-29 19:16:03', '2017-08-22 15:05:30', null);
INSERT INTO `wc_employees` VALUES ('1892', '40', null, '86', '331', '采购经理', null, '12txm014', '蔡秀娟', null, 'caixj@12t.cn', '3503618', '3503618', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1893', '40', null, '87', '332', '技术工程师', '677', '12txm021', '许雪炎', null, 'xuxy@12t.cn', '13606098429', '3503337', '2017-06-29 19:16:03', '2017-07-26 16:15:36', null);
INSERT INTO `wc_employees` VALUES ('1894', '40', null, '81', '326', '客服大区经理', null, '12txm023', '冯乔芳', null, 'cs4@12t.cn', '13950181406', '3503209', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1895', '40', null, '87', '328', '事业部总经理', '62', '12txm026', '温华园', null, 'wenhy@12t.cn', '13666085526', '3503555', '2017-06-29 19:16:03', '2017-07-07 08:33:52', null);
INSERT INTO `wc_employees` VALUES ('1896', '40', null, '83', '333', '风控监察经理', '974', '12txm028', '蔡丽燕', null, 'cs5@12t.cn', '18750209686', '3503276', '2017-06-29 19:16:03', '2017-08-07 17:47:17', null);
INSERT INTO `wc_employees` VALUES ('1897', '40', null, '88', '334', '商务经理', '177', '12txm029', '苏晨', null, 'suchen@12t.cn', '18906035211', '3503007', '2017-06-29 19:16:03', '2017-07-26 17:23:29', null);
INSERT INTO `wc_employees` VALUES ('1898', '40', null, '81', '326', '客服大区经理', '697', '12txm030', '曾云图', null, 'cs17@12t.cn', '15060760757', '3503147', '2017-06-29 19:16:03', '2017-07-26 16:28:06', null);
INSERT INTO `wc_employees` VALUES ('1899', '40', null, '84', '335', '品牌产品经理', '693', '12txm031', '杨丹凤', null, 'yangdf@12t.cn', '15859245649', '3503004', '2017-06-29 19:16:03', '2017-08-07 09:15:44', null);
INSERT INTO `wc_employees` VALUES ('1900', '40', null, '81', '326', '客服大区经理', '696', '12txm033', '叶文玲', null, 'cs20@12t.cn', '13625014527', '3503171', '2017-06-29 19:16:03', '2017-07-26 16:26:04', null);
INSERT INTO `wc_employees` VALUES ('1901', '40', null, '87', '336', '项目主管', '78', '12txm034', '林志业', null, 'linzhy@xm12t.com', '13860430930', '3503680', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1902', '40', null, '81', '337', '客服经理', '700', '12txm043', '吴晓燕', null, 'cs24@12t.cn', '13400671062', '3503161', '2017-06-29 19:16:03', '2017-07-26 16:27:23', null);
INSERT INTO `wc_employees` VALUES ('1903', '40', null, '84', '329', '大客户经理', '160', '12txm046', '林锦珠', null, 'linjz@12t.cn', '15259250112', '3503100', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1904', '40', null, '81', '337', '客服经理', '802', '12txm051', '郑薇', null, 'cs22@12t.cn', '18205960073', '3503164', '2017-06-29 19:16:03', '2017-07-27 16:40:42', null);
INSERT INTO `wc_employees` VALUES ('1905', '40', null, '88', '326', '销售总监', '607', '12txm054', '陈伟平', null, 'chenwp@12t.cn', '13774651497', '3503085', '2017-06-29 19:16:03', '2017-07-24 17:51:34', null);
INSERT INTO `wc_employees` VALUES ('1906', '40', null, '88', '338', '大客户经理', '982', '12txm064', '吴茂林', null, 'wuml@12t.cn', '18250848084', '3503039', '2017-06-29 19:16:03', '2017-08-22 14:47:43', null);
INSERT INTO `wc_employees` VALUES ('1907', '40', null, '81', '337', '客服经理', null, '12txm065', '苏雅玲', null, 'cs32@12t.cn', '15980938135', '3503214', '2017-06-29 19:16:03', '2017-07-04 09:38:06', null);
INSERT INTO `wc_employees` VALUES ('1908', '40', null, '87', '339', '大区经理', '79', '12txm066', '林跃煌', null, 'linyh@xm12t.com', '13625010991', '3503336', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1909', '40', null, '81', '337', '客服经理', null, '12txm079', '萧海华', null, 'cs25@12t.cn', null, '3503310', '2017-06-29 19:16:03', '2017-07-14 15:14:30', '2017-07-14 15:14:30');
INSERT INTO `wc_employees` VALUES ('1910', '40', null, '81', '340', '客服', '909', '12txm083', '胡晓坤', null, 'cs21@12t.cn', '15260211052', '3503283', '2017-06-29 19:16:03', '2017-08-07 09:16:33', null);
INSERT INTO `wc_employees` VALUES ('1911', '40', null, '81', '340', '客服', null, '12txm098', '杨晶晶', null, 'cs26@12t.cn', '15860727940', '3503190', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1912', '40', null, '81', '326', '客服大区经理', '690', '12txm099', '肖丽媛', null, 'cs33@12t.cn', '15960804450', '3503207', '2017-06-29 19:16:03', '2017-07-26 16:22:44', null);
INSERT INTO `wc_employees` VALUES ('1913', '40', null, '81', '341', '客服主管', null, '12txm106', '黄紫超', null, 'cs35@12t.cn', '13600912969', '3503185', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1914', '40', null, '88', '326', '销售总监', '1016', '12txm116', '林春强', null, 'linchq@xm12t.com', '15859245176', '3503128', '2017-06-29 19:16:03', '2017-08-17 13:48:03', null);
INSERT INTO `wc_employees` VALUES ('1915', '40', null, '87', '339', '大区经理', '176', '12txm120', '吴桂月', null, 'wugy@xm12t.com', '15860737645', '3503319', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1916', '40', null, '87', '326', '客服总监', '109', '12txm126', '刘晓露', null, 'liuxl@xm12t.com', '13779989640', '3503788', '2017-06-29 19:16:03', '2017-08-22 11:42:48', null);
INSERT INTO `wc_employees` VALUES ('1917', '40', null, '86', '342', '行政助理', '118', '12txm157', '陈娉婷', null, 'chenpt@xm12t.com', '15980831214', '3503249', '2017-06-29 19:16:03', '2017-07-13 16:02:19', null);
INSERT INTO `wc_employees` VALUES ('1918', '40', null, '83', '343', '风控监察专员', '866', '12txm158', '张燕玲', null, 'cs41@12t.cn', '13959234243', '3503239', '2017-06-29 19:16:03', '2017-08-22 14:53:26', null);
INSERT INTO `wc_employees` VALUES ('1919', '40', null, '81', '340', '客服', null, '12txm162', '王婷婷', null, 'cs40@12t.cn', null, '3503157', '2017-06-29 19:16:03', '2017-07-14 15:14:00', '2017-07-14 15:14:00');
INSERT INTO `wc_employees` VALUES ('1920', '40', null, '83', '343', '风控监察专员', '1071', '12txm173', '殷莹', null, 'cs44@xm12t.com', '18759298534', '3503131', '2017-06-29 19:16:03', '2017-08-22 14:46:36', null);
INSERT INTO `wc_employees` VALUES ('1921', '40', null, '85', '344', '财务经理', '123', '12txm202', '林小燕', null, 'linxy@12t.cn', '13459218581', '3503688', '2017-06-29 19:16:03', '2017-07-14 08:59:01', null);
INSERT INTO `wc_employees` VALUES ('1922', '40', null, '81', '345', '客服', null, '12txm154', '何薇莉', null, 'cs48@xm12t.com', '13779993827', '3503280', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1923', '40', null, '81', '340', '客服', '1066', '12txm190', '叶玲', null, 'yeling@xm12t.com', '15959220762', '3503191', '2017-06-29 19:16:03', '2017-08-22 14:39:09', null);
INSERT INTO `wc_employees` VALUES ('1924', '40', null, '81', '340', '客服', '687', '12txm271', '方秋燕', null, 'cs65@xm12t.com', '15260228154', '3503162', '2017-06-29 19:16:03', '2017-07-26 16:51:37', null);
INSERT INTO `wc_employees` VALUES ('1925', '40', null, '81', '346', '客服经理', '898', '12txm272', '丁洁', null, 'cs69@xm12t.com', '15960384685', '3503170', '2017-06-29 19:16:03', '2017-08-17 10:55:34', null);
INSERT INTO `wc_employees` VALUES ('1926', '40', null, '84', '329', '大客户经理', null, '12txm286', '伍金海', null, 'wujh@xm12t.com', null, '3503014', '2017-06-29 19:16:03', '2017-08-09 10:33:45', '2017-08-09 10:33:45');
INSERT INTO `wc_employees` VALUES ('1927', '40', null, '85', '347', '财务', '836', '12txm287', '朱叶', null, 'zhuye@12t.cn', '15960206750', '3503588', '2017-06-29 19:16:03', '2017-07-29 09:44:43', null);
INSERT INTO `wc_employees` VALUES ('1928', '40', null, '89', '326', '金融事业部经理', null, '12txm317', '庄明俊', null, 'zhuangmingjun@xm12t.com', '13666096675', '3503248', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1929', '40', null, '81', '348', '客服经理', null, '12txm349', '刘真真', null, 'cs77@xm12t.com', '18965192148', '3503281', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1930', '40', null, '87', '349', '技术工程师', '263', '12txm356', '李傲威', null, 'liaw@xm12t.com', '13606926361', '3503070', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1931', '40', null, '81', '340', '客服', '715', '12txm376', '李丹凤', null, 'cs14@12t.cn', '15980921132', '3503163', '2017-06-29 19:16:03', '2017-07-26 16:31:40', null);
INSERT INTO `wc_employees` VALUES ('1932', '40', null, '81', '340', '客服', null, '12txm383', '陈雅玲', null, 'cs81@xm12t.com', '13696984057', '3503182', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1933', '40', null, '88', '334', '商务经理', '200', '12txm393', '李春华', null, 'lich@xm12t.com', '15860715680', '3503027', '2017-06-29 19:16:03', '2017-08-22 15:10:50', null);
INSERT INTO `wc_employees` VALUES ('1934', '40', null, '85', '347', '财务', '340', '12txm397', '施英英', null, 'shiyy@12t.cn', '13656030069', '3503688', '2017-06-29 19:16:03', '2017-08-22 14:59:50', null);
INSERT INTO `wc_employees` VALUES ('1935', '40', null, '81', '350', '客服', '1082', '12txm424', '李瑞瑾', null, 'cs88@xm12t.com', '15259261503', '3503159', '2017-06-29 19:16:03', '2017-08-22 15:06:23', null);
INSERT INTO `wc_employees` VALUES ('1936', '40', null, '83', '351', '质控经理', '832', '12txm452', '谢志强', null, 'xiezq@xm12t.com', '18689876560', '3503132', '2017-06-29 19:16:03', '2017-07-29 09:47:06', null);
INSERT INTO `wc_employees` VALUES ('1937', '40', null, '81', '340', '客服', null, '12txm473', '葛晓丹', null, 'cs83@xm12t.com', '18650170762', '3503167', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1938', '40', null, '81', '337', '客服经理', '709', '12txm500', '朱惠敏', null, 'cs92@xm12t.com', '15960278173', '3503206', '2017-06-29 19:16:03', '2017-07-26 16:30:38', null);
INSERT INTO `wc_employees` VALUES ('1939', '40', null, '81', '340', '客服', null, '12txm502', '陈东御', null, 'cs94@xm12t.com', '15805941596', '3503186', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1940', '40', null, '87', '339', '大区经理', '68', '12txm509', '吴治毅', null, 'wuzy@xm12t.com', '18965824221', '3503343', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1941', '40', null, '81', '337', '客服经理', '703', '12txm523', '叶惠', null, 'cs93@xm12t.com', '18205925851', '3503215', '2017-06-29 19:16:03', '2017-07-26 16:27:40', null);
INSERT INTO `wc_employees` VALUES ('1942', '40', null, '83', '343', '风控监察专员', '1074', '12txm554', '唐燕平', null, 'cs104@xm12t.com', '18965809140', '3503262', '2017-06-29 19:16:03', '2017-08-22 14:49:29', null);
INSERT INTO `wc_employees` VALUES ('1943', '40', null, '88', '338', '大客户经理', '179', '12txm557', '王伟', null, 'wangwei@xm12t.com', '13774660045', '3503059', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1944', '40', null, '88', '338', '大客户经理', '611', '12txm576', '王晓亮1', null, 'wangxl@xm12t.com', '13459243275', '3503030', '2017-06-29 19:16:03', '2017-07-24 17:41:21', null);
INSERT INTO `wc_employees` VALUES ('1945', '40', null, '81', '340', '客服', '719', '12txm593', '庄秋菊', null, 'zhuangqj@xm12t.com', '15980770137', '3503197', '2017-06-29 19:16:03', '2017-07-26 16:34:00', null);
INSERT INTO `wc_employees` VALUES ('1946', '40', null, '87', '339', '大区经理', '616', '12txm609', '温琴锋', null, 'wenqf@xm12t.com', '15980934561', '3503298', '2017-06-29 19:16:03', '2017-07-25 09:08:12', null);
INSERT INTO `wc_employees` VALUES ('1947', '40', null, '83', '352', '数据分析师', '841', '12txm703', '肖连峰', null, 'xiaolf@xm12t.com', '18659288826', '3503271', '2017-06-29 19:16:03', '2017-07-29 09:46:31', null);
INSERT INTO `wc_employees` VALUES ('1948', '40', null, '86', '328', '人力行政总监', null, '12txm721', '陈谦', null, 'chenq@xm12t.com', '18650806005', '3503177', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1949', '40', null, '81', '340', '客服', '713', '12txm779', '周莉莉', null, 'zhoulili@xm12t.com', '13799276841', '3753743', '2017-06-29 19:16:03', '2017-07-26 16:31:43', null);
INSERT INTO `wc_employees` VALUES ('1950', '40', null, '81', '337', '客服经理', '721', '12txm781', '罗秀才', null, 'luoxiucai@xm12t.com', '15859183502', '3503184', '2017-06-29 19:16:03', '2017-07-26 16:45:36', null);
INSERT INTO `wc_employees` VALUES ('1951', '40', null, '87', '353', '技术工程师', '668', '12txm782', '许警锋', null, 'xujingfeng@xm12t.com', '15280223151', '3503551', '2017-06-29 19:16:03', '2017-07-26 16:19:11', null);
INSERT INTO `wc_employees` VALUES ('1952', '40', null, '81', '340', '客服', '729', '12txm790', '林丹', null, 'lindan@xm12t.com', '15959389579', '3503218', '2017-06-29 19:16:03', '2017-07-26 16:43:25', null);
INSERT INTO `wc_employees` VALUES ('1953', '40', null, '81', '340', '客服', '718', '12txm792', '林旭芬', null, 'linxf@xm12t.com', '15260811568', '3503212', '2017-06-29 19:16:03', '2017-07-26 16:33:29', null);
INSERT INTO `wc_employees` VALUES ('1954', '40', null, '88', '338', '大客户经理', null, '12txm796', '孙洛瑛', null, 'sunluoying@xm12t.com', '13695009693', '3503087', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1955', '40', null, '81', '340', '客服', '863', '12txm800', '叶姗姗', null, 'yeshanshan@xm12t.com', '15060139207', '3503174', '2017-06-29 19:16:03', '2017-08-05 10:48:53', null);
INSERT INTO `wc_employees` VALUES ('1956', '40', null, '88', '326', '销售总监', '154', '12txm832', '胡茜', null, 'huxi@xm12t.com', '18649668046', '3503115', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1957', '40', null, '81', '345', '客服', null, '12txm835', '李月芙', null, 'liyuefu@xm12t.com', '13950194871', '3503219', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1958', '40', null, '81', '340', '客服', '914', '12txm838', '陈巧云', null, 'chenqiaoyun@xm12t.com', '18559779800', '3503233', '2017-06-29 19:16:03', '2017-08-07 09:14:55', null);
INSERT INTO `wc_employees` VALUES ('1959', '40', null, '83', '354', '质控助理', '840', '12txm872', '林燕华', null, 'linyanhua@xm12t.com', '13646029093', '3503114', '2017-06-29 19:16:03', '2017-07-29 09:46:29', null);
INSERT INTO `wc_employees` VALUES ('1960', '40', null, '86', '355', '培训师', null, '12txm873', '兰晓连', null, 'lanxl@xm12t.com', '15980834500', '3503252', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1961', '40', null, '88', '334', '商务经理', '610', '12txm875', '王晓亮2', null, 'wangxiaoliang@xm12t.com', '15959355064', '3503237', '2017-06-29 19:16:03', '2017-08-22 14:46:29', null);
INSERT INTO `wc_employees` VALUES ('1962', '40', null, '87', '349', '技术工程师', '71', '12txm909', '林国协', null, 'linguoxie@xm12t.com', '13799260381', '3503558', '2017-06-29 19:16:03', '2017-07-18 17:03:13', null);
INSERT INTO `wc_employees` VALUES ('1963', '40', null, '81', '340', '客服', '803', '12txm933', '林晓珺', null, 'linxiaojun@xm12t.com', '15080019869', '3503200', '2017-06-29 19:16:03', '2017-07-27 16:40:42', null);
INSERT INTO `wc_employees` VALUES ('1964', '40', null, '88', '356', '总经理助理', '224', '12txm947', '何玉芳', null, 'faq@12t.cn', '15980950659', '3503388', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1965', '40', null, '83', '352', '数据分析师', '1069', '12txm957', '王德发', null, 'wangdefa@xm12t.com', '15805931840', '3503272', '2017-06-29 19:16:03', '2017-08-22 14:50:17', null);
INSERT INTO `wc_employees` VALUES ('1966', '40', null, '81', '337', '客服经理', null, '12txm962', '杨靖', null, 'yangjing@xm12t.com', '18250150639', '3503125', '2017-06-29 19:16:03', '2017-07-04 09:38:06', null);
INSERT INTO `wc_employees` VALUES ('1967', '40', null, '83', '343', '风控监察专员', '869', '12txm981', '王晓露', null, 'wangxiaolu@xm12t.com', '13696937717', '3503238', '2017-06-29 19:16:03', '2017-08-05 11:10:33', null);
INSERT INTO `wc_employees` VALUES ('1968', '40', null, '81', '340', '客服', '701', '12txm1005', '叶晓欢', null, 'yexiaohuan@xm12t.com', '18030137801', '3503286', '2017-06-29 19:16:03', '2017-07-26 16:27:15', null);
INSERT INTO `wc_employees` VALUES ('1969', '40', null, '90', '357', '市场总监', '930', '12txm1016', '郑华', null, 'zhenghua@xm12t.com', '15059893596', '3503263', '2017-06-29 19:16:03', '2017-08-22 14:31:22', null);
INSERT INTO `wc_employees` VALUES ('1970', '40', null, '88', '358', '客户经理', null, '12txm1021', '张路生', null, 'zhanglusheng@xm12t.com', null, '3503024', '2017-06-29 19:16:03', '2017-07-14 15:10:27', '2017-07-14 15:10:27');
INSERT INTO `wc_employees` VALUES ('1971', '40', null, '88', '334', '商务经理', '168', '12txm1031', '刘纯伟', null, 'liuchunwei@xm12t.com', '13696992479', '3503020', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1972', '40', null, '83', '359', '质控专员', '1070', '12txm1044', '王忠忠', null, 'wangzhongzhong@xm12t.com', '18559655269', '3503320', '2017-06-29 19:16:03', '2017-08-22 14:46:35', null);
INSERT INTO `wc_employees` VALUES ('1973', '40', null, '81', '340', '客服', '695', '12txm1058', '萧月梅', null, 'xiaoyuemei@xm12t.com', '13959238510', '3503570', '2017-06-29 19:16:03', '2017-07-26 16:26:46', null);
INSERT INTO `wc_employees` VALUES ('1974', '40', null, '88', '358', '客户经理', '201', '12txm1064', '林景山', null, 'linjingshan@xm12t.com', '18250845345', '3503015', '2017-06-29 19:16:03', '2017-08-22 15:14:39', null);
INSERT INTO `wc_employees` VALUES ('1975', '40', null, '88', '358', '客户经理', null, '12txm1081', '杨超', null, 'yangchao@xm12t.com', '13606923960', '3503066', '2017-06-29 19:16:03', '2017-07-04 09:38:06', null);
INSERT INTO `wc_employees` VALUES ('1976', '40', null, '86', '360', '网络工程师', '896', '12txm1100', '周项委', null, 'zhouxiangwei@xm12t.com', '13720882900', '3503245', '2017-06-29 19:16:03', '2017-08-07 08:38:32', null);
INSERT INTO `wc_employees` VALUES ('1977', '40', null, '81', '340', '客服', null, '12txm1115', '苏晓敏', null, 'suxiaomin@xm12t.com', '18259224881', '3503192', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1978', '40', null, '86', '361', '培训部经理', '105', '12txm1133', '陈燕红', null, 'chenyanhong@xm12t.com', '18205940116', '3503060', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1979', '40', null, '87', '362', '技术工程师', null, '12txm1178', '彭丁超', null, 'pengdingchao@xm12t.com', '13696955724', '3503505', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1980', '40', null, '88', '338', '大客户经理', '720', '12txm1181', '郑景景', null, 'zhengjingjing@xm12t.com', '13101435755', '3503069', '2017-06-29 19:16:03', '2017-07-26 16:34:13', null);
INSERT INTO `wc_employees` VALUES ('1981', '40', null, '87', '349', '客服', '659', '12txm1188', '曾佳敏', null, 'zengjiamin@xm12t.com', '18650493308', '3503093', '2017-06-29 19:16:03', '2017-07-26 15:51:53', null);
INSERT INTO `wc_employees` VALUES ('1982', '40', null, '81', '345', '客服', '865', '12txm1201', '蔡莉娟', null, 'cailijuan@xm12t.com', '13806046019', '暂无', '2017-06-29 19:16:03', '2017-08-17 10:28:40', null);
INSERT INTO `wc_employees` VALUES ('1983', '40', null, '81', '340', '客服', null, '12txm1211', '吴林英', null, 'wulinying@xm12t.com', null, '3503176', '2017-06-29 19:16:03', '2017-08-02 10:28:00', '2017-08-02 10:28:00');
INSERT INTO `wc_employees` VALUES ('1984', '40', null, '87', '339', '大区经理', '124', '12txm1218', '庄凤麒', null, 'zhuangfengqi@xm12t.com', '15060667810', '3503003', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1985', '40', null, '84', '329', '大客户经理', null, '12txm1224', '潘静', null, 'panjing@xm12t.com', null, '3503026', '2017-06-29 19:16:03', '2017-07-14 15:11:58', '2017-07-14 15:11:58');
INSERT INTO `wc_employees` VALUES ('1986', '40', null, '90', '363', '市场经理', null, '12txm1225', '郭良燕', null, 'guoliangyan@xm12t.com', null, '3503000', '2017-06-29 19:16:03', '2017-07-14 15:13:31', '2017-07-14 15:13:31');
INSERT INTO `wc_employees` VALUES ('1987', '40', null, '87', '339', '大区经理', '66', '12txm1273', '詹建美', null, 'zhanjianmei@xm12t.com', '13959272108', '3503575', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1988', '40', null, '88', '358', '客户经理', '183', '12txm1276', '叶晓强', null, 'yexiaoqiang@xm12t.com', '15260228322', '3503133', '2017-06-29 19:16:03', '2017-08-05 10:55:42', null);
INSERT INTO `wc_employees` VALUES ('1989', '40', null, '87', '329', '客户经理', '111', '12txm1280', '张志谋', null, 'zhangzhimou@xm12t.com', '15860783104', '3503305', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1990', '40', null, '86', '364', '人力行政经理', '187', '12txm1284', '陈婧', null, 'chenjing@12t.cn', '15980833793', '3503599', '2017-06-29 19:16:03', '2017-07-10 15:30:51', null);
INSERT INTO `wc_employees` VALUES ('1991', '40', null, '81', '337', '客服经理', null, '12txm1285', '黄锦华', null, 'huangjinhua@xm12t.com', '13606057365', '3503168', '2017-06-29 19:16:03', '2017-07-04 09:38:06', null);
INSERT INTO `wc_employees` VALUES ('1992', '40', null, '88', '358', '客户经理', null, '12txm1290', '林洁', null, 'linjie@xm12t.com', '18659848091', '3503076', '2017-06-29 19:16:03', '2017-07-04 09:38:06', null);
INSERT INTO `wc_employees` VALUES ('1993', '40', null, '81', '365', '客服主管', null, '12txm1306', '费吓娥', null, 'feixiae@xm12t.com', '15280671042', '3503151', '2017-06-29 19:16:03', '2017-07-04 09:38:06', null);
INSERT INTO `wc_employees` VALUES ('1994', '40', null, '88', '358', '客户经理', '157', '12txm1324', '连祖', null, 'lianzu@xm12t.com', '18659282264', '3503051', '2017-06-29 19:16:03', '2017-07-10 15:07:46', null);
INSERT INTO `wc_employees` VALUES ('1995', '40', null, '88', '358', '客户经理', '248', '12txm1331', '谌晓芳', null, 'chenxiaofang@xm12t.com', '18605971143', '3503063', '2017-06-29 19:16:03', '2017-07-10 18:49:52', null);
INSERT INTO `wc_employees` VALUES ('1996', '40', null, '81', '337', '客服经理', '728', '12txm1335', '钟竹轩', null, 'zhongzhuxuan@xm12t.com', '13385928316', '3503213', '2017-06-29 19:16:03', '2017-08-22 15:00:47', null);
INSERT INTO `wc_employees` VALUES ('1997', '40', null, '88', '334', '商务经理', '234', '12txm1336', '帅莹', null, 'shuaiying@xm12t.com', '15979168090', '3503062', '2017-06-29 19:16:03', '2017-07-24 17:43:13', null);
INSERT INTO `wc_employees` VALUES ('1998', '40', null, '88', '338', '大客户经理', '141', '12txm1340', '蒋铃溪', null, 'jianglingxi@xm12t.com', '18850335545', '3503160', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('1999', '40', null, '88', '338', '大客户经理', '688', '12txm1352', '潘彬', null, 'panbin@xm12t.com', '18059231115', '3503061\n', '2017-06-29 19:16:03', '2017-07-26 16:20:15', null);
INSERT INTO `wc_employees` VALUES ('2000', '40', null, '88', '338', '大客户经理', '245', '12txm1361', '毛冬荣', null, 'maodongrong@xm12t.com', '18850313778', '3503005', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2001', '40', null, '81', '340', '客服', '1022', '12txm1374', '曾清桦', null, 'zengqinghua@xm12t.com', '13599913485', '3503291', '2017-06-29 19:16:03', '2017-08-17 15:59:10', null);
INSERT INTO `wc_employees` VALUES ('2002', '40', null, '81', '340', '客服', null, '12txm1381', '黄锦丽', null, 'huangjinli@xm12t.com', '18359105925', '3503369', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2003', '40', null, '86', '366', '薪酬福利主管', '627', '12txm1382', '卢新文', null, 'luxinwen@xm12t.com', '13696956261', '3503299', '2017-06-29 19:16:03', '2017-07-26 16:25:54', null);
INSERT INTO `wc_employees` VALUES ('2004', '40', null, '81', '340', '客服', null, '12txm1386', '谢仁杰', null, 'xierenjie@xm12t.com', '13696988947', '3503148', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2005', '40', null, '87', '349', '技术工程师', '122', '12txm1394', '刘松琼', null, 'liusongqiong@xm12t.com', '18850348235', '3503520', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2006', '40', null, '88', '334', '商务经理', null, '12txm1398', '黄旋', null, 'huangxuan@xm12t.com', '18459266624', '3503088', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2007', '40', null, '81', '340', '客服', null, '12txm1423', '黄翠苹', null, 'huangcuiping@xm12t.com', '15606972990', '3503193', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2008', '40', null, '81', '340', '客服', '246', '12txm1437', '吴雪红', null, 'wuxuehong@xm12t.com', '18046050367', '3503073', '2017-06-29 19:16:03', '2017-08-05 11:33:59', null);
INSERT INTO `wc_employees` VALUES ('2009', '40', null, '81', '340', '客服', '707', '12txm1442', '代玉', null, 'daiyu@xm12t.com', '18758589868', '3503231', '2017-06-29 19:16:03', '2017-08-22 15:16:15', null);
INSERT INTO `wc_employees` VALUES ('2010', '40', null, '81', '340', '客服', '714', '12txm1443', '赖育琴', null, 'laiyuqin@xm12t.com', '18950169736', '3503210', '2017-06-29 19:16:03', '2017-08-05 10:35:53', null);
INSERT INTO `wc_employees` VALUES ('2011', '40', null, '81', '340', '客服', null, '12txm1445', '陈美芳', null, 'chenmeifang@xm12t.com', '18250895002', '3503183', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2012', '40', null, '87', '362', '技术工程师', '158', '12txm1448', '黄艺凤', null, 'huangyifeng@xm12t.com', '15006037339', '3503511', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2013', '40', null, '83', '343', '风控监察专员', '879', '12txm1452', '吴鸿盛', null, 'wuhongsheng@xm12t.com', '15859210928', '3503277', '2017-06-29 19:16:03', '2017-08-22 14:46:09', null);
INSERT INTO `wc_employees` VALUES ('2014', '40', null, '88', '358', '客户经理', null, '12txm1456', '陈星', null, 'chenxing@xm12t.com', '15880540857', '3503086', '2017-06-29 19:16:03', '2017-07-04 09:38:06', null);
INSERT INTO `wc_employees` VALUES ('2015', '40', null, '88', '338', '大客户经理', '205', '12txm584', '林培榕', null, 'linpeirong@xm12t.com', '13400606819', '3503079', '2017-06-29 19:16:03', '2017-08-17 12:38:54', null);
INSERT INTO `wc_employees` VALUES ('2016', '40', null, '87', '367', '技术工程师', null, '12txm1467', '蒋丽洪', null, 'jianglihong@xm12t.com', null, '3503548', '2017-06-29 19:16:03', '2017-07-25 11:11:38', '2017-07-25 11:11:38');
INSERT INTO `wc_employees` VALUES ('2017', '40', null, '86', '355', '培训师', '929', '12txm1470', '卓小玲', null, 'zhuoxiaoling@xm12t.com', '18250161173', '3503129', '2017-06-29 19:16:03', '2017-08-22 15:44:02', null);
INSERT INTO `wc_employees` VALUES ('2018', '40', null, '88', '334', '商务经理', null, '12txm1486', '李锦坤', null, 'lijinkun@xm12t.com', '13599525182', '3503121', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2019', '40', null, '87', '349', '技术工程师', null, '12txm1515', '谢林林', null, 'xielinlin@xm12t.com', '15394455811', '3503065', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2020', '40', null, '88', '358', '客户经理', '212', '12txm1529', '余文', null, 'yuwen@xm12t.com', '18359195309', '3503315', '2017-06-29 19:16:03', '2017-07-10 16:39:14', null);
INSERT INTO `wc_employees` VALUES ('2021', '40', null, '86', '355', '培训师', '125', '12txm1532', '陈泽龙', null, 'chenzelong@xm12t.com', '15160304886', '3503268', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2022', '40', null, '87', '368', '客户支持', '662', '12txm1536', '陈静', null, 'chenjing@xm12t.com', '18250890507', '3503530', '2017-06-29 19:16:03', '2017-07-26 15:24:01', null);
INSERT INTO `wc_employees` VALUES ('2023', '40', null, '87', '368', '客户支持', '665', '12txm1539', '石菊英', null, 'shijuying@xm12t.com', '13606050126', '3503541', '2017-06-29 19:16:03', '2017-07-26 15:24:22', null);
INSERT INTO `wc_employees` VALUES ('2024', '40', null, '87', '369', '客户支持', null, '12txm1553', '郑春桂', null, 'zhengchungui@xm12t.com', '18050121392', '3503524', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2025', '40', null, '88', '358', '客户经理', '219', '12txm1554', '周清标', null, 'zhouqingbiao@xm12t.com', '15280403389', '3503137', '2017-06-29 19:16:03', '2017-07-10 16:36:25', null);
INSERT INTO `wc_employees` VALUES ('2026', '40', null, '86', '370', '行政司机', null, '12txm1577', '郑雄伟', null, 'zhengxiongwei@xm12t.com', '13400622193', '3503259', '2017-06-29 19:16:03', '2017-07-04 09:38:06', null);
INSERT INTO `wc_employees` VALUES ('2027', '40', null, '81', '340', '客服', '800', '12txm1586', '陈沅', null, 'chenyuan@xm12t.com', '18106961476', '3503165', '2017-06-29 19:16:03', '2017-07-27 16:40:31', null);
INSERT INTO `wc_employees` VALUES ('2028', '40', null, '87', '349', '客服', '658', '12txm1587', '兰晓玲', null, 'lanxiaoling@xm12t.com', '18046311916', '3503230', '2017-06-29 19:16:03', '2017-07-26 15:17:43', null);
INSERT INTO `wc_employees` VALUES ('2029', '40', null, '81', '340', '客服', '810', '12txm1618', '陈玉云', null, 'chenyuyun@xm12t.com', '18674769125', '3503269', '2017-06-29 19:16:03', '2017-07-27 16:42:42', null);
INSERT INTO `wc_employees` VALUES ('2030', '40', null, '81', '340', '客服', null, '12txm1619', '林少津', null, 'linshaojin@xm12t.com', '18950313364', '3503223', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2031', '40', null, '81', '340', '客服', '932', '12txm1623', '朱丽珊', null, 'zhulishan@xm12t.com', '18750015503', '3503194', '2017-06-29 19:16:03', '2017-08-07 11:21:25', null);
INSERT INTO `wc_employees` VALUES ('2032', '40', null, '88', '358', '客户经理', '250', '12txm1629', '郭芬萍', null, 'guofenping@xm12t.com', '18059292416', '3503138', '2017-06-29 19:16:03', '2017-07-10 19:14:35', null);
INSERT INTO `wc_employees` VALUES ('2033', '40', null, '87', '353', '技术工程师', '684', '12txm1636', '刘燕岚', null, 'liuyanlan@xm12t.com', '15806047132', '3503554', '2017-06-29 19:16:03', '2017-07-26 16:18:23', null);
INSERT INTO `wc_employees` VALUES ('2034', '40', null, '81', '340', '客服', '723', '12txm1638', '陈睿', null, 'chenrui@xm12t.com', '15259289652', '3503301', '2017-06-29 19:16:03', '2017-07-26 16:36:38', null);
INSERT INTO `wc_employees` VALUES ('2035', '40', null, '87', '371', 'BD经理', '85', '12txm1641', '张珂珂', null, 'zhangkeke@xm12t.com', '18859206409', '3503523', '2017-06-29 19:16:03', '2017-07-19 14:00:36', null);
INSERT INTO `wc_employees` VALUES ('2036', '40', null, '90', '372', '总监助理', '833', '12txm1648', '徐庆玲', null, 'xuqingling@xm12t.com', '18850227537', '3503120', '2017-06-29 19:16:03', '2017-07-29 09:43:55', null);
INSERT INTO `wc_employees` VALUES ('2037', '40', null, '91', '339', '项目经理', null, '12txm1649', '彭英', null, 'pengying@xm12t.com', null, '3503188', '2017-06-29 19:16:03', '2017-07-14 14:57:13', '2017-07-14 14:57:13');
INSERT INTO `wc_employees` VALUES ('2038', '40', null, '81', '340', '客服', '815', '12txm1654', '张燕红', null, 'zhangyanhong@xm12t.com', '15960293485', '3503274', '2017-06-29 19:16:03', '2017-08-22 15:30:55', null);
INSERT INTO `wc_employees` VALUES ('2039', '40', null, '81', '373', '客服', null, '12txm1655', '陈献萍', null, 'chenxianping@xm12t.com', '15160086332', '3503208', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2040', '40', null, '88', '334', '商务经理', '236', '12txm1661', '彭凌玲', null, 'penglingling@xm12t.com', '15959213948', '3503058', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2041', '40', null, '88', '358', '客户经理', '195', '12txm1667', '徐燕美', null, 'xuyanmei@xm12t.com', '15060352679', '3503110', '2017-06-29 19:16:03', '2017-07-26 16:16:03', null);
INSERT INTO `wc_employees` VALUES ('2042', '40', null, '81', '340', '客服', null, '12txm1674', '蔡燕云', null, 'caiyanyun@xm12t.com', '15805000725', '3503292', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2043', '40', null, '88', '358', '客户经理', '185', '12txm1679', '曹健', null, 'caojian@xm12t.com', '18030261783', '3503084', '2017-06-29 19:16:03', '2017-07-10 16:43:22', null);
INSERT INTO `wc_employees` VALUES ('2044', '40', null, '81', '340', '客服', '630', '12txm1682', '刘珏', null, 'liujue@xm12t.com', '18359262134', '3503290', '2017-06-29 19:16:03', '2017-07-26 16:34:10', null);
INSERT INTO `wc_employees` VALUES ('2045', '40', null, '88', '358', '客户经理', '206', '12txm1683', '方君鸿', null, 'fangjunhong@xm12t.com', '15959215073', '3503103', '2017-06-29 19:16:03', '2017-08-05 13:49:21', null);
INSERT INTO `wc_employees` VALUES ('2046', '40', null, '81', '337', '客服经理', '689', '12txm1688', '赖春连', null, 'laichunlian@xm12t.com', '15080318037', '3503136', '2017-06-29 19:16:03', '2017-07-26 16:24:00', null);
INSERT INTO `wc_employees` VALUES ('2047', '40', null, '81', '340', '客服', '921', '12txm1698', '黄阿娟', null, 'huangajuan@xm12t.com', '18859212283', '3503038', '2017-06-29 19:16:03', '2017-08-07 09:36:17', null);
INSERT INTO `wc_employees` VALUES ('2048', '40', null, '84', '374', null, null, '12txm1709', '康温棋', null, 'kangwenqi@xm12t.com', null, '3503302', '2017-06-29 19:16:03', '2017-07-14 15:11:42', '2017-07-14 15:11:42');
INSERT INTO `wc_employees` VALUES ('2049', '40', null, '88', '358', '客户经理', null, '12txm1724', '谢斌', null, 'xiebin@xm12t.com', '18078322094', '3503327', '2017-06-29 19:16:03', '2017-07-04 09:38:07', null);
INSERT INTO `wc_employees` VALUES ('2050', '40', null, '88', '334', '商务经理', null, '12txm1725', '刘敏', null, 'liumin@xm12t.com', null, '3503331', '2017-06-29 19:16:03', '2017-08-02 10:28:18', '2017-08-02 10:28:18');
INSERT INTO `wc_employees` VALUES ('2051', '40', null, '81', '340', '客服', '808', '12txm1727', '江媚', null, 'jiangmei@xm12t.com', '18039793305', '3503225', '2017-06-29 19:16:03', '2017-07-27 16:42:55', null);
INSERT INTO `wc_employees` VALUES ('2052', '40', null, '81', '340', '客服', null, '12txm1728', '郑晓红', null, 'zhengxiaohong@xm12t.com', null, '3503178', '2017-06-29 19:16:03', '2017-07-14 15:12:55', '2017-07-14 15:12:55');
INSERT INTO `wc_employees` VALUES ('2053', '40', null, '87', '368', '客户支持', '660', '12txm1729', '刘荣连', null, 'liuronglian@xm12t.com', '18649799802', '3503569', '2017-06-29 19:16:03', '2017-07-26 15:24:04', null);
INSERT INTO `wc_employees` VALUES ('2054', '40', null, '88', '334', '商务经理', '251', '12txm1730', '陈小燕', null, 'chenxiaoyan@xm12t.com', '17750091801', '3503074', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2055', '40', null, '81', '340', '客服', '203', '12txm1737', '林华卿', null, 'linhuaqing@xm12t.com', '13599670991', '3503285', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2056', '40', null, '88', '375', '客户经理', '220', '12txm1750', '陈运南', null, 'chenyunnan@xm12t.com', '18750658056', '3503124', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2057', '40', null, '87', '368', '客户支持', '661', '12txm1761', '蔡雅惠', null, 'caiyahui@xm12t.com', '18559253730', '3503335', '2017-06-29 19:16:03', '2017-07-26 15:23:56', null);
INSERT INTO `wc_employees` VALUES ('2058', '40', null, '88', '358', '客户经理', '151', '12txm1763', '吴启建', null, 'wuqijian@xm12t.com', '18850014291', '3503089', '2017-06-29 19:16:03', '2017-07-10 16:35:43', null);
INSERT INTO `wc_employees` VALUES ('2059', '40', null, '86', '355', '培训师', null, '12txm1766', '朱丽仙', null, 'zhulixian@xm12t.com', '13998436071', '3503181', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2060', '40', null, '87', '362', '技术工程师', null, '12txm1767', '谢琦翔', null, 'xieqixiang@xm12t.com', '18450104513', '3503513', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2061', '40', null, '87', '376', '客户经理', null, '12txm1771', '佟鹏', null, 'tongpeng@xm12t.com', '13055391183', '3503325', '2017-06-29 19:16:03', '2017-07-13 16:02:20', null);
INSERT INTO `wc_employees` VALUES ('2062', '40', null, '86', '355', '培训师', '210', '12txm1782', '方啊茹', null, 'fangaru@xm12t.com', '18606934113', '3503155', '2017-06-29 19:16:03', '2017-07-24 17:45:14', null);
INSERT INTO `wc_employees` VALUES ('2063', '40', null, '81', '377', '总经理助理', null, '12txm1783', '苏玉婷', null, 'cs64@xm12t.com', '15060537356', '3503288', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2064', '40', null, '87', '378', '总监助理', '126', '12txm1788', '孙笑迎春', null, 'sunxiaoyingchun@xm12t.com', '13959238648', '3503966', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2065', '40', null, '83', '379', '质控专员', '1075', '12txm1793', '徐志磊', null, 'xuzhilei@xm12t.com', '15759563262', '3503216', '2017-06-29 19:16:03', '2017-08-22 14:50:08', null);
INSERT INTO `wc_employees` VALUES ('2066', '40', null, '85', '347', '财务', '491', '12txm1797', '黄燕真', null, 'huangyanzhen@xm12t.com', '13850084630', '3503688', '2017-06-29 19:16:03', '2017-08-22 15:00:43', null);
INSERT INTO `wc_employees` VALUES ('2067', '40', null, '88', '358', '客户经理', null, '12txm1799', '戴明德', null, 'daimingde@xm12t.com', null, '3503374', '2017-06-29 19:16:03', '2017-08-02 10:27:38', '2017-08-02 10:27:38');
INSERT INTO `wc_employees` VALUES ('2068', '40', null, '87', '353', '技术工程师', '72', '12txm1808', '徐淑端', null, 'xushuduan@xm12t.com', '13400605001', '3503557', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2069', '40', null, '92', '334', '大客户经理', '868', '12txm1814', '金杰', null, 'jinjie@xm12t.com', '18959231204', '3503169', '2017-06-29 19:16:03', '2017-08-07 08:51:11', null);
INSERT INTO `wc_employees` VALUES ('2070', '40', null, '86', '380', '招聘主管', null, '12txm1821', '马惠珠', null, 'mahuizhu@xm12t.com', null, '3753745', '2017-06-29 19:16:03', '2017-07-14 15:11:00', '2017-07-14 15:11:00');
INSERT INTO `wc_employees` VALUES ('2071', '40', null, '90', '381', '市场主管', '702', '12txm1823', '林晓梅', null, 'linxiaomei@xm12t.com', '13599851823', '3503113', '2017-06-29 19:16:03', '2017-07-26 16:28:40', null);
INSERT INTO `wc_employees` VALUES ('2072', '40', null, '81', '340', '客服', null, '12txm1825', '杨艳秀', null, 'yangyanxiu@xm12t.com', '18120755054', '3503250', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2073', '40', null, '83', '343', '风控监察专员', '704', '12txm1827', '汤小芳', null, 'tangxiaofang@xm12t.com', '15059383115', '3503347', '2017-06-29 19:16:03', '2017-07-26 16:28:17', null);
INSERT INTO `wc_employees` VALUES ('2074', '40', null, '83', '343', '风控监察专员', '699', '12txm1828', '石德玲', null, 'shideling@xm12t.com', '18965823083', '3503240', '2017-06-29 19:16:03', '2017-07-26 16:27:01', null);
INSERT INTO `wc_employees` VALUES ('2075', '40', null, '81', '340', '客服', null, '12txm1829', '欧丽丽', null, 'oulili@xm12t.com', '15080332342', '3503072', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2076', '40', null, '81', '340', '客服', '710', '12txm1831', '李婷婷', null, 'litingting@xm12t.com', '15750768902', '3503278', '2017-06-29 19:16:03', '2017-07-26 16:30:53', null);
INSERT INTO `wc_employees` VALUES ('2077', '40', null, '81', '340', '客服', null, '12txm1837', '蔡钰滢', null, 'caiyuying@xm12t.com', null, '3503229', '2017-06-29 19:16:03', '2017-07-14 15:11:14', '2017-07-14 15:11:14');
INSERT INTO `wc_employees` VALUES ('2078', '40', null, '86', '382', '招聘专员', '1061', '12txm1842', '蔡艺蓉', null, 'caiyirong@xm12t.com', '18850313890', '3503035', '2017-06-29 19:16:03', '2017-08-22 14:23:04', null);
INSERT INTO `wc_employees` VALUES ('2079', '40', null, '90', '381', '市场主管', '1062', '12txm1846', '林芳芳', null, 'linfangfang@xm12t.com', '13696960317', '3503251', '2017-06-29 19:16:03', '2017-08-22 14:32:40', null);
INSERT INTO `wc_employees` VALUES ('2080', '40', null, '87', '353', '技术工程师', '89', '12txm1851', '陈丹', null, 'chendan@xm12t.com', '18759732195', '暂无', '2017-06-29 19:16:03', '2017-07-26 16:18:53', null);
INSERT INTO `wc_employees` VALUES ('2081', '40', null, '81', '340', '客服', null, '12txm1852', '刘舒琪', null, 'liushuqi@xm12t.com', null, '3503260', '2017-06-29 19:16:03', '2017-07-14 15:09:31', '2017-07-14 15:09:31');
INSERT INTO `wc_employees` VALUES ('2082', '40', null, '81', '340', '客服', '857', '12txm1854', '丘梦婷', null, 'qiumengting@xm12t.com', '15080558116', '3503217', '2017-06-29 19:16:03', '2017-08-05 10:01:21', null);
INSERT INTO `wc_employees` VALUES ('2083', '40', null, '85', '328', '财务总监', '928', '12txm1855', '顾晓琳', null, 'guxl@12t.cn', '13600959180', '3503532', '2017-06-29 19:16:03', '2017-08-07 15:58:05', null);
INSERT INTO `wc_employees` VALUES ('2084', '40', null, '85', '347', '财务', '492', '12txm1856', '王俊娴', null, 'wangjunxian@xm12t.com', '18859671995', '3503515', '2017-06-29 19:16:03', '2017-08-22 15:04:18', null);
INSERT INTO `wc_employees` VALUES ('2085', '40', null, '87', '332', '技术工程师', '74', '12txm1860', '许传武', null, 'xuchuanwu@xm12t.com', '13400691209', '3503504', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2086', '40', null, '87', '368', '客户支持', '186', '12txm1865', '黄艾', null, 'huangai@xm12t.com', '18705923160', '3503326', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2087', '40', null, '87', '383', '策划经理', '888', '12txm1869', '陈晓雄', null, 'chenxiaoxiong@xm12t.com', '15105993543', '3503106', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2088', '40', null, '92', '338', null, null, '12txm1877', '刘明伟', null, 'liumingwei@xm12t.com', null, '3503766', '2017-06-29 19:16:03', '2017-07-14 15:10:46', '2017-07-14 15:10:46');
INSERT INTO `wc_employees` VALUES ('2089', '40', null, '89', '334', '商务经理', null, '12txm1881', '牛璐', null, 'niulu@xm12t.com', '18250813511', '3503078', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2090', '40', null, '87', '368', '客户支持', '712', '12txm1884', '许彩洪', null, 'xucaihong@xm12t.com', '13645004456', '3503531', '2017-06-29 19:16:03', '2017-07-26 16:31:13', null);
INSERT INTO `wc_employees` VALUES ('2091', '40', null, '81', '340', '客服', '817', '12txm1886', '陈心阳', null, 'chenxinyang@xm12t.com', '15396615189', '3503101', '2017-06-29 19:16:03', '2017-07-27 16:50:50', null);
INSERT INTO `wc_employees` VALUES ('2092', '40', null, '83', '359', '质控专员', '1072', '12txm1887', '张琪', null, 'zhangqi@xm12t.com', '15659994491', '3503273', '2017-06-29 19:16:03', '2017-08-22 14:56:38', null);
INSERT INTO `wc_employees` VALUES ('2093', '40', null, '92', '384', '客服主管', '862', '12txm1893', '李惠丽', null, 'lihuili@xm12t.com', '15006059663', '3503376', '2017-06-29 19:16:03', '2017-08-22 15:33:26', null);
INSERT INTO `wc_employees` VALUES ('2094', '40', null, '87', '371', 'BD经理', '83', '12txm1901', '张杰华', null, 'zhangjiehua@xm12t.com', '15980761413', '3503311', '2017-06-29 19:16:03', '2017-07-26 16:45:58', null);
INSERT INTO `wc_employees` VALUES ('2095', '40', null, '85', '385', '会计', '839', '12txm1910', '林燕如', null, 'linyanru@xm12t.com', '13515966469', '3503512', '2017-06-29 19:16:03', '2017-07-29 09:44:49', null);
INSERT INTO `wc_employees` VALUES ('2096', '40', null, '87', '332', '技术工程师', '679', '12txm1912', '江妍', null, 'jiangyan@xm12t.com', '18094159556', '3503509', '2017-06-29 19:16:03', '2017-07-26 16:16:23', null);
INSERT INTO `wc_employees` VALUES ('2097', '40', null, '81', '340', '客服', null, '12txm1914', '江金燕', null, 'jiangjinyan@xm12t.com', null, '3503227', '2017-06-29 19:16:03', '2017-07-14 15:12:12', '2017-07-14 15:12:12');
INSERT INTO `wc_employees` VALUES ('2098', '40', null, '91', '386', '总经理助理', null, '12txm1915', '任心茹', null, 'renxinru@xm12t.com', null, '3503180', '2017-06-29 19:16:03', '2017-07-14 14:57:38', '2017-07-14 14:57:38');
INSERT INTO `wc_employees` VALUES ('2099', '40', null, '87', '376', '客户经理', '199', '12txm1924', '王珠珠', null, 'wangzhuzhu@xm12t.com', '13959270870', '3503318', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2100', '40', null, '87', '376', '客户经理', null, '12txm1925', '卢霜霜', null, 'lushuangshuang@xm12t.com', null, '3503540', '2017-06-29 19:16:03', '2017-07-14 15:10:00', '2017-07-14 15:10:00');
INSERT INTO `wc_employees` VALUES ('2101', '40', null, '87', '376', '客户经理', '258', '12txm1926', '苏俊丽', null, 'sujunli@xm12t.com', '15565712636', '3503156', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2102', '40', null, '81', '340', '客服', '812', '12txm1933', '杨新新', null, 'yangxinxin@xm12t.com', '13055717200', '3503198', '2017-06-29 19:16:03', '2017-07-27 16:43:00', null);
INSERT INTO `wc_employees` VALUES ('2103', '40', null, '88', '358', '客户经理', '726', '12txm1939', '丘连珍', null, 'qiulianzhen@xm12t.com', '18359926128', '3503340', '2017-06-29 19:16:03', '2017-07-26 16:39:58', null);
INSERT INTO `wc_employees` VALUES ('2104', '40', null, '87', '368', '客户支持', '189', '12txm1940', '王蓉', null, 'wangrong@xm12t.com', '15060751931', '3503316', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2105', '40', null, '87', '387', '技术工程师', '144', '12txm1947', '彭晓婷', null, 'pengxiaoting@xm12t.com', '13067029418', '暂无', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2106', '40', null, '88', '334', '商务经理', '215', '12txm865', '陈成健', null, 'chencj@xm12t.com', '13960494512', '3503064', '2017-06-29 19:16:03', '2017-08-05 11:29:31', null);
INSERT INTO `wc_employees` VALUES ('2107', '40', null, '87', '383', '策划经理', '132', '12txm1970', '叶威威', null, 'yeweiwei@xm12t.com', '18760636513', '3503303', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2108', '40', null, '83', '359', '质控专员', '685', '12txm1973', '苏丽珍', null, 'sulizhen@xm12t.com', '13646071723', '3503312', '2017-06-29 19:16:03', '2017-07-26 16:26:02', null);
INSERT INTO `wc_employees` VALUES ('2109', '40', null, '87', '368', '客户支持', '159', '12txm1976', '叶幼玲', null, 'yeyouling@xm12t.com', '18059190180', '3503091', '2017-06-29 19:16:03', '2017-07-29 09:44:58', null);
INSERT INTO `wc_employees` VALUES ('2110', '40', null, '87', '368', '客户支持', '191', '12txm1977', '熊欣洁', null, 'xiongxinjie@xm12t.com', '18750253629', '3503516', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2111', '40', null, '81', '340', '客服', null, '12txm1980', '纪荣裕', null, 'jirongyu@xm12t.com', '15659675010', '3503158', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2112', '40', null, '81', '340', '客服', null, '12txm1984', '叶凤婷', null, 'yefengting@xm12t.com', '15759588036', '3503221', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2113', '40', null, '88', '375', '客户经理', null, '12txm1988', '黄熙淼', null, 'huangximiao@xm12t.com', null, '3503043', '2017-06-29 19:16:03', '2017-08-02 10:28:55', '2017-08-02 10:28:55');
INSERT INTO `wc_employees` VALUES ('2114', '40', null, '81', '340', '客服', null, '12txm1990', '何艺丹', null, 'heyidan@xm12t.com', '18459206366', '3503141', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2115', '40', null, '81', '340', '客服', null, '12txm1991', '陈美珍', null, 'chenmeizhen@xm12t.com', '13959268065', '3503127', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2116', '40', null, '88', '358', '客户经理', '1073', '12txm1993', '陈俊龄', null, 'chenjunling@xm12t.com', '15606976709', '3503034', '2017-06-29 19:16:03', '2017-08-22 14:47:04', null);
INSERT INTO `wc_employees` VALUES ('2117', '40', null, '81', '340', '客服', '797', '12txm1996', '陈小丽', null, 'chenxiaoli@xm12t.com', '18506923676', '3503284', '2017-06-29 19:16:03', '2017-07-27 16:21:31', null);
INSERT INTO `wc_employees` VALUES ('2118', '40', null, '85', '385', '会计', '838', '12txm1997', '夏丹琴', null, 'xiadanqin@xm12t.com', '15260226231', '3503050', '2017-06-29 19:16:03', '2017-07-29 09:44:42', null);
INSERT INTO `wc_employees` VALUES ('2119', '40', null, '87', '383', '策划经理', '858', '12txm2002', '艾华', null, 'aihua@xm12t.com', '15880772833', '3503297', '2017-06-29 19:16:03', '2017-08-05 10:10:55', null);
INSERT INTO `wc_employees` VALUES ('2120', '40', null, '87', '376', '客户经理', '136', '12txm2004', '林姈婷', null, 'linlingting@xm12t.com', '15859506993', '3503329', '2017-06-29 19:16:03', '2017-08-05 10:13:40', null);
INSERT INTO `wc_employees` VALUES ('2121', '40', null, '81', '340', '客服', '731', '12txm2010', '林燕华2', null, 'linyanhua2@xm12t.com', '18059869261', '3503260', '2017-06-29 19:16:03', '2017-08-05 11:33:01', null);
INSERT INTO `wc_employees` VALUES ('2122', '40', null, '85', '385', '会计', null, '12txm2011', '李欣雅', null, 'lixinya@xm12t.com', '13950811823', '3503688', '2017-06-29 19:16:03', '2017-07-04 09:38:07', null);
INSERT INTO `wc_employees` VALUES ('2123', '40', null, '87', '368', '客户支持', null, '12txm2012', '张佳', null, 'zhangjia@xm12t.com', '13600904109', '3503528', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2124', '40', null, '91', '328', '运营总监', null, '12txm2015', '郑添天', null, 'zhengtt@12t.cn', null, null, '2017-06-29 19:16:03', '2017-07-14 14:57:26', '2017-07-14 14:57:26');
INSERT INTO `wc_employees` VALUES ('2125', '40', null, '86', '342', '行政助理', '666', '12txm2017', '黄霜月', null, 'huangshuangyue@xm12t.com', '14700063087', '3503666', '2017-06-29 19:16:03', '2017-07-26 15:36:33', null);
INSERT INTO `wc_employees` VALUES ('2126', '40', null, '87', '368', '客户支持', '842', '12txm2021', '陈玉米', null, 'chenyumi@xm12t.com', '15280279440', '3503140', '2017-06-29 19:16:03', '2017-07-29 09:46:22', null);
INSERT INTO `wc_employees` VALUES ('2127', '40', null, '87', '383', '策划经理', '694', '12txm2023', '何炜', null, 'hewei@xm12t.com', '15606005066', '3503253', '2017-06-29 19:16:03', '2017-07-26 16:25:58', null);
INSERT INTO `wc_employees` VALUES ('2128', '40', null, '87', '367', '技术工程师', '73', '12txm2038', '江小凤', null, 'jiangxiaofeng@xm12t.com', '15880691014', '暂无', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2129', '40', null, '81', '340', '客服', '978', '12txm2042', '王晓娟', null, 'wangxiaojuan@xm12t.com', '18950149936', '3503243', '2017-06-29 19:16:03', '2017-08-08 15:18:32', null);
INSERT INTO `wc_employees` VALUES ('2130', '40', null, '88', '358', '客户经理', null, '12txm2046', '王嘉林', null, 'wangjialin@xm12t.com', null, '3503017', '2017-06-29 19:16:03', '2017-07-14 15:12:41', '2017-07-14 15:12:41');
INSERT INTO `wc_employees` VALUES ('2131', '40', null, '92', '358', '客户经理', null, '12txm2048', '吴小玲', null, 'wuxiaoling@xm12t.com', '18046056257', '3503032', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2132', '40', null, '81', '340', '客服', '783', '12txm2049', '王会芹', null, 'wanghuiqin@xm12t.com', '13400779656', '3503322', '2017-06-29 19:16:03', '2017-08-05 10:11:03', null);
INSERT INTO `wc_employees` VALUES ('2133', '40', null, '81', '340', '客服', '927', '12txm2053', '温玉锋', null, 'wenyufeng@xm12t.com', '18250815017', '3503289', '2017-06-29 19:16:03', '2017-08-17 10:33:01', null);
INSERT INTO `wc_employees` VALUES ('2134', '40', null, '88', '358', '客户经理', null, '12txm2054', '刘斌', null, 'liubin@xm12t.com', null, '3503344', '2017-06-29 19:16:03', '2017-08-02 10:30:18', '2017-08-02 10:30:18');
INSERT INTO `wc_employees` VALUES ('2135', '40', null, '89', '388', '运营助理', null, '12txm2056', '彭敏', null, 'pengmin@xm12t.com', '18259481378', '3503116', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2136', '40', null, '87', '368', '客户支持', '657', '12txm2058', '陈映雪', null, 'chenyingxue@xm12t.com', '18750912481', '3503324', '2017-06-29 19:16:03', '2017-07-26 15:24:33', null);
INSERT INTO `wc_employees` VALUES ('2137', '40', null, '88', '375', '客户经理', '618', '12txm2059', '蒋玉柏', null, 'jiangyubai@xm12t.com', '18695677738', '3503018', '2017-06-29 19:16:03', '2017-07-24 17:43:58', null);
INSERT INTO `wc_employees` VALUES ('2138', '40', null, '88', '358', '客户经理', '209', '12txm2064', '杨慧玲', null, 'yanghuiling@xm12t.com', '18146141184', '3503010', '2017-06-29 19:16:03', '2017-08-17 14:00:12', null);
INSERT INTO `wc_employees` VALUES ('2139', '40', null, '88', '358', '客户经理', null, '12txm2065', '吴培坤', null, 'wupeikun@xm12t.com', null, '3503145', '2017-06-29 19:16:03', '2017-08-02 10:28:40', '2017-08-02 10:28:40');
INSERT INTO `wc_employees` VALUES ('2140', '40', null, '86', '389', '高级行政助理', '134', '12txm1702', '梁晓云', null, 'liangxiaoyun@xm12t.com', '18206057031', '3503636', '2017-06-29 19:16:03', '2017-07-26 16:25:55', null);
INSERT INTO `wc_employees` VALUES ('2141', '40', null, '86', '382', '招聘专员', null, '12txm2069', '魏颖莹', null, 'weiyingying@xm12t.com', null, '3503399', '2017-06-29 19:16:03', '2017-07-14 15:14:17', '2017-07-14 15:14:17');
INSERT INTO `wc_employees` VALUES ('2142', '40', null, '89', '390', '风控监察', '730', '12txm2070', '龚鹏', null, 'gongpeng@xm12t.com', '15659282978', '3503208', '2017-06-29 19:16:03', '2017-07-26 16:44:08', null);
INSERT INTO `wc_employees` VALUES ('2143', '40', null, '86', '382', '招聘专员', '1060', '12txm2072', '陈钟', null, 'chenzhong@xm12t.com', '15060332220', '3503426', '2017-06-29 19:16:03', '2017-08-22 14:22:00', null);
INSERT INTO `wc_employees` VALUES ('2144', '40', null, '85', '391', '出纳', '488', '12txm2073', '吴亚洲', null, 'wuyazhou@xm12t.com', '18850104595', '3503988', '2017-06-29 19:16:03', '2017-07-29 09:45:02', null);
INSERT INTO `wc_employees` VALUES ('2145', '40', null, '86', '360', '网络工程师', null, '12txm2074', '蓝毅湖', null, 'lanyihu@xm12t.com', '18006011063', '3503257', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2146', '40', null, '89', '358', '客户经理', '259', '12txm2075', '赖国城', null, 'laiguocheng@xm12t.com', '15859236704', '3503097', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2147', '40', null, '87', '362', '技术工程师', '683', '12txm2076', '傅福汉', null, 'fufuhan@xm12t.com', '15959450472', '3503503', '2017-06-29 19:16:03', '2017-07-26 16:17:01', null);
INSERT INTO `wc_employees` VALUES ('2148', '40', null, '85', '391', '出纳', '489', '12txm2077', '李幼茶', null, 'liyoucha@xm12t.com', '18860115551', '3503306', '2017-06-29 19:16:03', '2017-07-20 15:51:48', null);
INSERT INTO `wc_employees` VALUES ('2149', '40', null, '81', '340', '客服', '698', '12txm2079', '杨云霞', null, 'yangyunxia@xm12t.com', '13959243071', '3503175', '2017-06-29 19:16:03', '2017-07-26 16:27:18', null);
INSERT INTO `wc_employees` VALUES ('2150', '40', null, '88', '375', '客户经理', '167', '12txm2082', '许水旺', null, 'xushuiwang@xm12t.com', '18750576691', '3503107', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2151', '40', null, '86', '392', '薪酬绩效专员', '667', '12txm2085', '江钺', null, 'jiangyue@xm12t.com', '18150935421', '3503247', '2017-06-29 19:16:03', '2017-07-26 16:24:10', null);
INSERT INTO `wc_employees` VALUES ('2152', '40', null, '88', '358', '客户经理', '216', '12txm2087', '王凯', null, 'wangkai@xm12t.com', '18278360920', '35030399', '2017-06-29 19:16:03', '2017-07-24 17:40:59', null);
INSERT INTO `wc_employees` VALUES ('2153', '40', null, '86', '392', '薪酬绩效专员', '735', '12txm2088', '陈美蕊', null, 'chenmeirui@xm12t.com', '18250775031', '3503139', '2017-06-29 19:16:03', '2017-07-26 16:52:08', null);
INSERT INTO `wc_employees` VALUES ('2154', '40', null, '88', '358', '客户经理', '163', '12txm2089', '李恩临', null, 'lienlin@xm12t.com', '18650805217', '3503741', '2017-06-29 19:16:03', '2017-07-26 16:27:19', null);
INSERT INTO `wc_employees` VALUES ('2155', '40', null, '87', '362', '技术工程师', '70', '12txm2090', '陈超', null, 'chenchao@xm12t.com', '18159412257', '3503501', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2156', '40', null, '81', '340', '客服', '809', '12txm2093', '吴玉洁', null, 'wuyujie@xm12t.com', '18850567765', '3503234', '2017-06-29 19:16:03', '2017-08-05 10:03:02', null);
INSERT INTO `wc_employees` VALUES ('2157', '40', null, '81', '340', '客服', null, '12txm2094', '王征', null, 'wangzheng@xm12t.com', '15617726131', '3503021', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2158', '40', null, '88', '375', '客户经理', '174', '12txm2095', '孙祥祥', null, 'sunxiangxiang@xm12t.com', '13559492563', '3503293', '2017-06-29 19:16:03', '2017-07-24 17:47:56', null);
INSERT INTO `wc_employees` VALUES ('2159', '40', null, '88', '375', '客户经理', '239', '12txm2098', '林小燕2', null, 'linxiaoyan@xm12t.com', '13860466845', '3503134', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2160', '40', null, '87', '393', '客户支持', '663', '12txm2100', '钟翎', null, 'zhongling@xm12t.com', '18250822878', '暂无', '2017-06-29 19:16:03', '2017-07-26 15:23:58', null);
INSERT INTO `wc_employees` VALUES ('2161', '40', null, '88', '358', '客户经理', '196', '12txm1744', '温联升', null, 'wenliansheng@xm12t.com', '13395058397', '3503102', '2017-06-29 19:16:03', '2017-07-10 16:39:37', null);
INSERT INTO `wc_employees` VALUES ('2162', '40', null, '87', '367', '技术工程师', '137', '12txm2105', '王平', null, 'wangping@xm12t.com', '15871655519', '暂无', '2017-06-29 19:16:03', '2017-08-17 11:33:11', null);
INSERT INTO `wc_employees` VALUES ('2163', '40', null, '87', '353', '技术工程师', '680', '12txm2109', '许婷', null, 'xuting@xm12t.com', '17750594807', '3503552', '2017-06-29 19:16:03', '2017-08-17 11:29:10', null);
INSERT INTO `wc_employees` VALUES ('2164', '40', null, '81', '340', '客服', '806', '12txm2110', '吴晨霞', null, 'wuchenxia@xm12t.com', '18350990706', '3503189', '2017-06-29 19:16:03', '2017-07-27 16:41:28', null);
INSERT INTO `wc_employees` VALUES ('2165', '40', null, '86', '355', '培训师', '110', '12txm2116', '邓琳珊', null, 'denglinshan@xm12t.com', '13559243226', '3503060', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2166', '40', null, '85', '394', '会计', '493', '12txm2119', '代素娥', null, 'daisue@xm12t.com', '17706028501', '3503050', '2017-06-29 19:16:03', '2017-07-20 15:54:05', null);
INSERT INTO `wc_employees` VALUES ('2167', '40', null, '81', '340', '客服', '253', '12txm2122', '王慧玲', null, 'wanghuiling@xm12t.com', '15859510675', '3503236', '2017-06-29 19:16:03', '2017-07-27 16:40:45', null);
INSERT INTO `wc_employees` VALUES ('2168', '40', null, '81', '340', '客服', '669', '12txm2126', '郑秀东', null, 'zhengxiudong@xm12t.com', '18960045275', '3503235', '2017-06-29 19:16:03', '2017-07-26 16:22:44', null);
INSERT INTO `wc_employees` VALUES ('2169', '40', null, '87', '362', '技术工程师', '75', '12txm2129', '程章鹏', null, 'chengzhangpeng@xm12t.com', '18250716915', '3503513', '2017-06-29 19:16:03', '2017-07-26 16:17:28', null);
INSERT INTO `wc_employees` VALUES ('2170', '40', null, '83', '343', '风控监察专员', '837', '12txm2131', '卢宏野', null, 'luhongye@xm12t.com', '15750842176', '3503179', '2017-06-29 19:16:03', '2017-07-29 09:44:10', null);
INSERT INTO `wc_employees` VALUES ('2171', '40', null, '87', '348', '产品经理', '52', '12txm2132', '陈杰', null, 'chenjie@xm12t.com', '13055208817', '3503501', '2017-06-29 19:16:03', '2017-07-04 09:38:08', null);
INSERT INTO `wc_employees` VALUES ('2172', '40', null, '87', '368', '客户支持', '835', '12txm2134', '林秋白', null, 'linqiubai@xm12t.com', '15905083607', '暂无', '2017-06-29 19:16:03', '2017-07-29 09:43:45', null);
INSERT INTO `wc_employees` VALUES ('2173', '40', null, '87', '395', '技术工程师', null, '12txm2133', '高涵', null, 'gaohan@xm12t.com', '15559082075', '3503506', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2174', '40', null, '81', '337', '客服经理', null, '12txm2140', '林晓东', null, 'linxiaodong@xm12t.com', '17717067995', '3503153\n', '2017-06-29 19:16:03', '2017-07-04 09:38:08', null);
INSERT INTO `wc_employees` VALUES ('2175', '40', null, '87', '371', 'BD经理', '84', '12txm2142', '陈兆伟', null, 'chenzhaowei@xm12t.com', '13255036582', '3503311', '2017-06-29 19:16:03', '2017-07-26 16:22:40', null);
INSERT INTO `wc_employees` VALUES ('2176', '40', null, '81', '340', '客服', null, '12txm2146', '徐莉', null, 'xuli@xm12t.com', '13850048691', '3503173', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2177', '40', null, '81', '340', '客服', '919', '12txm2149', '熊琳', null, 'xionglin@xm12t.com', '15750751269', '3503146', '2017-06-29 19:16:03', '2017-08-17 11:44:32', null);
INSERT INTO `wc_employees` VALUES ('2178', '40', null, '87', '383', '策划经理', '608', '12txm2153', '林汉斌', null, 'linhanbin@xm12t.com', '15160009645', '3503341', '2017-06-29 19:16:03', '2017-07-24 17:38:04', null);
INSERT INTO `wc_employees` VALUES ('2179', '40', null, '87', '383', '策划经理', '182', '12txm2152', '游达山', null, 'youdashan@xm12t.com', '18050164604', '3503295', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2180', '40', null, '88', '358', '客户经理', '171', '12txm2154', '陈槐山', null, 'chenhuaishan@xm12t.com', '18860042265', '3504538', '2017-06-29 19:16:03', '2017-07-10 16:36:23', null);
INSERT INTO `wc_employees` VALUES ('2181', '40', null, '86', '370', '行政司机', null, '12txm2156', '陈涛', null, 'chentao@xm12t.com', '15606007918', '暂无', '2017-06-29 19:16:03', '2017-07-04 09:38:08', null);
INSERT INTO `wc_employees` VALUES ('2182', '40', null, '89', '358', '客户经理', null, '12txm2161', '丁鑫', null, 'dingxin@xm12t.com', '15060747205', '3503313', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2183', '40', null, '81', '340', '客服', '722', '12txm2164', '谢芳', null, 'xiefang@xm12t.com', '15377993762', '3503284', '2017-06-29 19:16:03', '2017-07-26 16:40:42', null);
INSERT INTO `wc_employees` VALUES ('2184', '40', null, '88', '340', '客户经理', '910', '12txm2166', '张佳雯', null, 'zhangjiawen@xm12t.com', '17750597092', '3503281', '2017-06-29 19:16:03', '2017-08-17 10:46:48', null);
INSERT INTO `wc_employees` VALUES ('2185', '40', null, '81', '340', '客服', '736', '12txm2167', '林嘉馨', null, 'linjiaxin@xm12t.com', '15159287403', '3503281', '2017-06-29 19:16:03', '2017-07-26 16:52:06', null);
INSERT INTO `wc_employees` VALUES ('2186', '40', null, '81', '326', '客服大区经理', '166', '12txm2168', '王建平', null, 'wangjianping@xm12t.com ', '13906029330', '3503002', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2187', '40', null, '81', '340', '客服', '799', '12txm2170', '陈培城', null, 'chenpeicheng@xm12t.com', '17750041232', '3503077', '2017-06-29 19:16:03', '2017-07-27 16:40:39', null);
INSERT INTO `wc_employees` VALUES ('2188', '40', null, '81', '340', '客服', '727', '12txm2172', '邱雅丽', null, 'qiuyali@xm12t.com', '13395050096', '3503073', '2017-06-29 19:16:03', '2017-07-26 16:42:40', null);
INSERT INTO `wc_employees` VALUES ('2189', '40', null, '87', '383', '策划经理', '170', '12txm2173', '彭伟', null, 'pengwei@xm12t.com', '15750717757', '3503025', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2190', '40', null, '81', '340', '客服', null, '12txm2174', '郑美梨', null, 'zhengmeili@xm12t.com', '13732256824', '3503205', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2191', '40', null, '88', '358', '客户经理', '617', '12txm2175', '郑龙杰', null, 'zhenglongjie@xm12t.com', '15985887595', null, '2017-06-29 19:16:03', '2017-08-05 11:52:58', null);
INSERT INTO `wc_employees` VALUES ('2192', '40', null, '81', '340', '客服', null, '12txm2176', '黄臻宇', null, 'huangzhenyu@xm12t.com', '13850133122', '3764598', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2193', '40', null, '88', '358', '客户经理', '221', '12txm2180', '叶健', null, 'yejian@xm12t.com', '13599699064', '3503144', '2017-06-29 19:16:03', '2017-07-10 16:37:01', null);
INSERT INTO `wc_employees` VALUES ('2194', '40', null, '81', '340', '客服', '724', '12txm2184', '黄文煌', null, 'huangwenhuang@xm12t.com', '18876309927', '3503006', '2017-06-29 19:16:03', '2017-07-26 16:37:36', null);
INSERT INTO `wc_employees` VALUES ('2195', '40', null, '81', '340', '客服', '705', '12txm2183', '朱雅静', null, 'zhuyajing@xm12t.com', '13063150332', '3503330', '2017-06-29 19:16:03', '2017-07-26 16:28:40', null);
INSERT INTO `wc_employees` VALUES ('2196', '40', null, '88', '358', '客户经理', '162', '12txm2185', '杨林', null, 'yanglin@xm12t.com', '15280290740', '暂无', '2017-06-29 19:16:03', '2017-07-10 20:49:21', null);
INSERT INTO `wc_employees` VALUES ('2197', '40', null, '87', '362', '技术工程师', '77', '12txm2188', '许福生', null, 'xufusheng@xm12t.com', '13860432107', '暂无', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2198', '40', null, '84', '383', '策划经理', null, '12txm2186', '车玲', null, 'cheling@xm12t.com', '13666034886', '3503075', '2017-06-29 19:16:03', '2017-07-13 16:02:21', null);
INSERT INTO `wc_employees` VALUES ('2199', '40', null, '88', '358', '客户经理', null, '12txm2189', '林立鹏', null, 'linlipeng@xm12t.com', '13023913951', '3503046', '2017-06-29 19:16:03', '2017-07-04 09:38:08', null);
INSERT INTO `wc_employees` VALUES ('2200', '40', null, '85', '396', '会计', '834', '12txm2190', '李倩', null, 'liqian@xm12t.com', '15860740693', '3503510', '2017-06-29 19:16:03', '2017-07-29 09:43:52', null);
INSERT INTO `wc_employees` VALUES ('2201', '40', null, '88', '358', '客户经理', null, '12txm2187', '苏云东', null, 'suyundong@xm12t.com', null, '3503559', '2017-06-29 19:16:03', '2017-07-14 15:12:29', '2017-07-14 15:12:29');
INSERT INTO `wc_employees` VALUES ('2202', '40', null, '87', '397', '技术工程师', '80', '12txm2192', '李树', null, 'lishu@xm12t.com', '18259265202', '3503552', '2017-06-29 19:16:03', '2017-08-01 15:54:47', null);
INSERT INTO `wc_employees` VALUES ('2203', '40', null, '84', '340', '客服经理', '870', '12txm1439', '吴双燕', null, 'wushuangyan@xm12t.com', '18606927436', '3503096', '2017-06-29 19:16:03', '2017-08-05 11:21:26', null);
INSERT INTO `wc_employees` VALUES ('2204', '40', null, '81', '340', '客服', '197', '12txm2193', '栗静坪', null, 'lijingping@xm12t.com', '17605080693', '3503031', '2017-06-29 19:16:03', '2017-07-26 16:29:40', null);
INSERT INTO `wc_employees` VALUES ('2205', '40', null, '81', '340', '客服', '875', '12txm2194', '何艺敏', null, 'heyimin@xm12t.com', '13459016162', '3503019', '2017-06-29 19:16:03', '2017-08-05 11:34:08', null);
INSERT INTO `wc_employees` VALUES ('2206', '40', null, '81', '340', '客服', '798', '12txm2195', '林俊', null, 'linjun@xm12t.com', '18120758578', '3503284', '2017-06-29 19:16:03', '2017-07-27 16:40:38', null);
INSERT INTO `wc_employees` VALUES ('2207', '40', null, '81', '398', '实习生 不印制名片', null, '12txm2196', '蔡敏晨', null, 'caiminchen@xm12t.com', null, '3503518', '2017-06-29 19:16:03', '2017-07-14 15:13:10', '2017-07-14 15:13:10');
INSERT INTO `wc_employees` VALUES ('2208', '40', null, '81', '340', '客服', '1080', '12txm2197', '王伟宏', null, 'wangweihong@xm12t.com', '18259091027', '3503330', '2017-06-29 19:16:03', '2017-08-22 14:57:26', null);
INSERT INTO `wc_employees` VALUES ('2209', '40', null, '83', '343', '风控监察专员', '674', '12txm2198', '陈铭', null, 'chenming@xm12t.com', '15359222527', '3503259', '2017-06-29 19:16:03', '2017-07-26 16:25:11', null);
INSERT INTO `wc_employees` VALUES ('2210', '40', null, '88', '358', '客户经理', '613', '12txm2199', '陈加伟', null, 'chenjiawei@xm12t.com', '13255029802', '3503028', '2017-06-29 19:16:03', '2017-07-24 17:50:19', null);
INSERT INTO `wc_employees` VALUES ('2211', '40', null, '88', '358', '客户经理', '149', '12txm2200', '林海滨', null, 'linhaibin@xm12t.com', '13400655319', '3503069', '2017-06-29 19:16:03', '2017-07-10 15:05:38', null);
INSERT INTO `wc_employees` VALUES ('2212', '40', null, '88', '358', '客户经理', '207', '12txm2201', '陈文玉', null, 'chenwenyu@xm12t.com', '13559896077', '3503195', '2017-06-29 19:16:03', '2017-08-05 11:40:14', null);
INSERT INTO `wc_employees` VALUES ('2213', '40', null, '86', '382', '招聘专员', '861', '12txm2203', '张云欣', null, 'zhangyunxin@xm12t.com', '15359131064', '3503399', '2017-06-29 19:16:03', '2017-08-05 10:16:50', null);
INSERT INTO `wc_employees` VALUES ('2214', '40', null, '88', '358', '客户经理', null, '12txm2204', '陈鹏飞', null, 'chenpengfei@xm12t.com', null, '3503043', '2017-06-29 19:16:03', '2017-08-02 10:30:47', '2017-08-02 10:30:47');
INSERT INTO `wc_employees` VALUES ('2215', '40', null, '88', '358', '客户经理', null, '12txm2206', '陈锦伦', null, 'chenjinlun@xm12t.com', null, '3753740', '2017-06-29 19:16:03', '2017-07-14 15:11:27', '2017-07-14 15:11:27');
INSERT INTO `wc_employees` VALUES ('2216', '40', null, '87', '376', '客户经理', null, '12txm2205', '邱伟鹏', null, 'qiuweipeng@xm12t.com', '14700061917', '3503312', '2017-06-29 19:16:03', '2017-07-13 16:02:22', null);
INSERT INTO `wc_employees` VALUES ('2217', '40', null, '88', '358', '客户经理', null, '12txm2207', '谢朦冰', null, 'xiemengbing@xm12t.com', null, '3503338', '2017-06-29 19:16:03', '2017-08-02 10:31:07', '2017-08-02 10:31:07');
INSERT INTO `wc_employees` VALUES ('2218', '40', null, '88', '358', '客户经理', '612', '12txm2208', '林爱义', null, 'linaiyi@xm12t.com', '18150166581', '3503279', '2017-06-29 19:16:03', '2017-07-24 17:45:48', null);
INSERT INTO `wc_employees` VALUES ('2219', '40', null, '88', '358', '客户经理', null, '12txm2210', '莫湖月', null, 'mohuyue@xm12t.com', '18613958133', '3503241', '2017-06-29 19:16:03', '2017-07-04 09:38:08', null);
INSERT INTO `wc_employees` VALUES ('2220', '40', null, '86', '382', '招聘专员', null, '12txm2209', '徐云云', null, 'xuyunyun@xm12t.com', '18649721427', '3757745', '2017-06-29 19:16:03', '2017-07-04 09:38:08', null);
INSERT INTO `wc_employees` VALUES ('2221', '40', null, '86', '399', '招聘助理（实习生）', null, '12txm2215', '肖凯', null, 'xiaokai@xm12t.com', '15159013161', '3503399', '2017-06-29 19:16:03', '2017-07-13 16:02:22', null);
INSERT INTO `wc_employees` VALUES ('2222', '40', null, '90', '381', '市场主管', '830', '12txm2213', '赵玮', null, 'zhaowei@xm12t.com', '15396235119', '3503000', '2017-06-29 19:16:03', '2017-07-29 09:43:44', null);
INSERT INTO `wc_employees` VALUES ('2223', '40', null, '87', '393', '客户支持', null, '12txm2214', '陈艺红', null, 'chenyihong@xm12t.com', null, null, '2017-06-29 19:16:03', '2017-07-14 15:13:47', '2017-07-14 15:13:47');
INSERT INTO `wc_employees` VALUES ('2224', '40', null, '81', '340', '客服', '855', '12txm2211', '严俊杰', null, 'yanjunjie@xm12t.com', '18860132012', null, '2017-06-29 19:16:03', '2017-08-05 09:58:25', null);
INSERT INTO `wc_employees` VALUES ('2225', '40', null, '87', '376', '客户经理', '156', '12txm2212', '庄荣杰', null, 'zhuangrongjie@xm12t.com', '15105960339', null, '2017-06-29 19:16:03', '2017-07-13 16:02:22', null);
INSERT INTO `wc_employees` VALUES ('2228', '51', null, null, '410', null, null, 'd333', 'dddd', null, null, null, null, '2017-07-06 10:45:03', '2017-07-06 10:45:03', null);
INSERT INTO `wc_employees` VALUES ('2229', '52', null, '93', '413', 'aaa', '121', 'a1', 'gh', null, null, '13555558888', null, '2017-07-06 10:45:56', '2017-08-07 15:36:51', null);
INSERT INTO `wc_employees` VALUES ('2260', '52', '21', '93', null, '经理', null, '12txm001', '员工1', null, 'text@xm12t.com', null, '1234567', '2017-07-06 14:59:07', '2017-07-26 16:07:47', '2017-07-26 16:07:47');
INSERT INTO `wc_employees` VALUES ('2261', '52', '20', '93', null, '主管', null, '12txm002', '员工2', null, 'text@xm13t.com', null, '1234568', '2017-07-06 14:59:07', '2017-07-26 16:08:10', '2017-07-26 16:08:10');
INSERT INTO `wc_employees` VALUES ('2262', '52', '26', '93', null, '助理', null, '12txm003', '员工3', null, 'text@xm14t.com', null, '1234569', '2017-07-06 14:59:07', '2017-07-26 16:08:06', '2017-07-26 16:08:06');
INSERT INTO `wc_employees` VALUES ('2263', '52', '23', '94', null, '经理', null, '12txm004', '员工4', null, 'text@xm15t.com', null, '1234570', '2017-07-06 14:59:07', '2017-07-26 16:08:13', '2017-07-26 16:08:13');
INSERT INTO `wc_employees` VALUES ('2264', '52', '24', '94', null, '主管', null, '12txm005', '员工5', null, 'text@xm16t.com', null, '1234571', '2017-07-06 14:59:07', '2017-07-31 10:35:58', '2017-07-31 10:35:58');
INSERT INTO `wc_employees` VALUES ('2265', '52', null, '94', null, '助理', null, '12txm006', '员工6', null, 'text@xm17t.com', null, '1234572', '2017-07-06 14:59:07', '2017-07-31 10:36:01', '2017-07-31 10:36:01');
INSERT INTO `wc_employees` VALUES ('2266', '52', null, '94', null, '实习生', null, '12txm007', '员工7', null, 'text@xm18t.com', null, '05921234567', '2017-07-06 14:59:07', '2017-07-31 10:36:04', '2017-07-31 10:36:04');
INSERT INTO `wc_employees` VALUES ('2267', '52', null, '95', null, '经理', null, '12txm008', '员工8', null, 'text@xm19t.com', null, '05921234567', '2017-07-06 14:59:07', '2017-07-31 10:36:07', '2017-07-31 10:36:07');
INSERT INTO `wc_employees` VALUES ('2268', '52', null, '95', null, '主管', null, '12txm009', '员工9', null, 'text@xm20t.com', null, '05921234567', '2017-07-06 14:59:07', '2017-07-31 10:36:09', '2017-07-31 10:36:09');
INSERT INTO `wc_employees` VALUES ('2269', '52', null, '95', null, '助理', null, '12txm010', '员工10', null, 'text@xm21t.com', null, '05921234567', '2017-07-06 14:59:07', '2017-07-31 10:36:11', '2017-07-31 10:36:11');
INSERT INTO `wc_employees` VALUES ('2270', '52', null, '98', null, '经理', null, 'a11', '员1', null, 'tes@xm12t.com', null, '1234533', '2017-07-06 15:01:55', '2017-07-31 10:36:13', '2017-07-31 10:36:13');
INSERT INTO `wc_employees` VALUES ('2271', '52', null, '99', null, '员工', null, 'a2', 'xx', null, null, null, null, '2017-07-06 15:11:02', '2017-07-31 10:36:16', '2017-07-31 10:36:16');
INSERT INTO `wc_employees` VALUES ('2272', '40', null, '91', null, '运营助理（实习生）', null, '12txm2217', '黄涛', null, 'huangtao@xm12t.com', null, null, '2017-07-07 15:12:08', '2017-07-14 14:57:47', '2017-07-14 14:57:47');
INSERT INTO `wc_employees` VALUES ('2273', '40', null, '91', null, '行政经理', null, '12txm2216', '周艺', null, 'zhouyi@xm12t.com', null, null, '2017-07-07 15:12:08', '2017-07-14 14:56:57', '2017-07-14 14:56:57');
INSERT INTO `wc_employees` VALUES ('2274', '40', null, '90', null, '市场主管', '1064', '12txm2222', '陈叶基', null, 'chenyeiji@xm12t.com', '15501887109', null, '2017-07-07 15:12:08', '2017-08-22 14:38:05', null);
INSERT INTO `wc_employees` VALUES ('2275', '40', null, '87', null, '定单专员', '831', '12txm2221', '邵文婷', null, 'shaowenting@xm12t.com', '15029725999', '3503335', '2017-07-07 15:12:08', '2017-07-29 09:42:54', null);
INSERT INTO `wc_employees` VALUES ('2276', '40', null, '89', null, '客户经理', '939', '12txm2219', '陈霖霏', null, 'chenlinfei@xm12t.com', '13860149223', '3503261', '2017-07-07 15:12:08', '2017-08-20 21:41:07', null);
INSERT INTO `wc_employees` VALUES ('2277', '40', null, '88', null, '客户经理', '202', '12txm2227', '苏婷', null, 'suting@xm12t.com', '15711556258', '3503242', '2017-07-07 15:12:08', '2017-07-14 15:03:12', null);
INSERT INTO `wc_employees` VALUES ('2278', '40', null, '87', null, '客户经理', '778', '12txm2220', '林土墙', null, 'lintuqiang@xm12t.com', '15985814122', '3503052', '2017-07-07 15:12:08', '2017-08-03 10:59:48', null);
INSERT INTO `wc_employees` VALUES ('2279', '40', null, '88', null, '客户经理', null, '12txm2225', '曹妙雪', null, 'caomiaoxue@xm12t.com', null, '3503077', '2017-07-07 15:12:08', '2017-08-02 10:29:48', '2017-08-02 10:29:48');
INSERT INTO `wc_employees` VALUES ('2280', '40', null, '88', null, '客户经理', '351', '12txm2226', '李凯琦', null, 'likaiqi@xm12t.com', '18759637520', '3503135', '2017-07-07 15:12:08', '2017-08-17 17:26:30', null);
INSERT INTO `wc_employees` VALUES ('2281', '40', null, '88', null, '客户经理', null, '12txm2224', '张志勇', null, 'zhangzhiyong@xm12.com', null, '3753740', '2017-07-07 15:12:08', '2017-08-09 10:32:46', '2017-08-09 10:32:46');
INSERT INTO `wc_employees` VALUES ('2282', '40', null, '88', null, '营销顾问', null, '12txm2223', '林友恩', null, 'linyouen@xm12t.com', null, '3503016', '2017-07-07 15:12:08', '2017-07-25 11:10:35', '2017-07-25 11:10:35');
INSERT INTO `wc_employees` VALUES ('2283', '40', null, '88', null, '客户经理', '1007', '12txm2228', '李嘉玲', null, 'lijialing@xm12t.com', '18094175207', '3503567', '2017-07-07 15:12:08', '2017-08-17 10:59:26', null);
INSERT INTO `wc_employees` VALUES ('2284', '40', null, '88', null, '客户经理', '821', '12txm2229', '卢燕文', null, 'luyanwen@xm12t.com', '18094171382', '3503012', '2017-07-07 15:12:08', '2017-08-17 19:04:17', null);
INSERT INTO `wc_employees` VALUES ('2285', '40', null, '88', null, '客户经理', '208', '12txm2230', '查金辉', null, 'chajinhui@xm12t.com', '17379217090', '3503338', '2017-07-07 15:12:08', '2017-08-02 15:03:15', null);
INSERT INTO `wc_employees` VALUES ('2396', '54', null, '100', null, '销售运营总监', null, 'YDHZ0001', '江仁海', null, 'jiangrh@ydbaidu.net', '15959216810', '07525702166', '2017-07-11 17:40:09', '2017-07-13 15:02:25', null);
INSERT INTO `wc_employees` VALUES ('2397', '54', null, '101', null, '行政主管', '1057', 'YDHZ0002', '胡志强', null, 'huzhq@ydbaidu.net', '18029500936', '07525703975', '2017-07-11 17:40:09', '2017-08-22 13:58:54', null);
INSERT INTO `wc_employees` VALUES ('2398', '54', null, '102', null, '招聘主管', '1055', 'YDHZ0003', '李淑芳', null, 'lishf@ydbaidu.net', '13413006419', '07525703906', '2017-07-11 17:40:09', '2017-08-22 14:20:43', null);
INSERT INTO `wc_employees` VALUES ('2399', '54', null, '103', null, '资深大区经理', null, 'YDHZ0004', '赖后新', null, 'laihx@ydbaidu.net', '15880263612', '07525703909', '2017-07-11 17:40:09', null, null);
INSERT INTO `wc_employees` VALUES ('2400', '54', null, '104', null, '资深商务经理', '311', 'YDHZ0005', '陈绍琼', null, 'chenshq@ydbaidu.net', '13799196686', '07525703918', '2017-07-11 17:40:09', '2017-07-13 15:12:40', null);
INSERT INTO `wc_employees` VALUES ('2401', '54', null, '105', null, '高级商务经理', '343', 'YDHZ0006', '林待有', null, 'lindy@ydbaidu.net', '18050017758', '07525703919', '2017-07-11 17:40:09', '2017-07-14 10:30:00', null);
INSERT INTO `wc_employees` VALUES ('2402', '54', null, '106', null, '商务经理', '645', 'YDHZ0007', '刘康伟', null, 'liukw@ydbaidu.net', '13580984951', '07525703920', '2017-07-11 17:40:09', '2017-07-25 15:18:05', null);
INSERT INTO `wc_employees` VALUES ('2403', '54', null, '112', null, '资深大区经理', '308', 'YDHZ0010', '胡凯', null, 'hukai@ydbaidu.net', '13696995245', '07525703900', '2017-07-11 17:40:09', '2017-07-13 15:02:16', null);
INSERT INTO `wc_employees` VALUES ('2404', '54', null, '108', null, '客服经理', '1025', 'YDHZ0013', '唐丽敏', null, 'tanglm@ydbaidu.net', '18205940894', '07525703901', '2017-07-11 17:40:09', '2017-08-22 10:37:58', null);
INSERT INTO `wc_employees` VALUES ('2405', '54', null, '108', null, '百度客服', '897', 'YDHZ0015', '杨文英', null, 'yangwy@ydbaidu.net', '15812560915', '07525703907', '2017-07-11 17:40:09', '2017-08-22 14:06:07', null);
INSERT INTO `wc_employees` VALUES ('2406', '54', null, '104', null, '高级营销顾问', '315', 'YDHZ0016', '甘小园', null, 'ganxy@ydbaidu.net', '15217598627', '07525703910', '2017-07-11 17:40:09', '2017-07-13 15:17:43', null);
INSERT INTO `wc_employees` VALUES ('2407', '54', null, '109', null, '市场经理', '639', 'YDHZ0017', '曾俊杰', null, 'zengjj@ydbaidu.net', '18559757868', '07525703903', '2017-07-11 17:40:09', '2017-07-25 11:16:11', null);
INSERT INTO `wc_employees` VALUES ('2408', '54', null, '110', null, '商务经理', '341', 'YDHZ0018', '贺梅珏', null, 'hemeiyu@ydbaidu.net', '13428015525', '07525703912', '2017-07-11 17:40:09', '2017-07-14 09:45:45', null);
INSERT INTO `wc_employees` VALUES ('2409', '54', null, '107', null, '品牌大客户经理', '892', 'YDHZ0019', '余亿冲', null, 'yuyichong@ydbaidu.net', '18675234293', '07525703914', '2017-07-11 17:40:09', '2017-08-07 08:23:13', null);
INSERT INTO `wc_employees` VALUES ('2410', '54', null, '104', null, '品牌大客户经理', '307', 'YDHZ0020', '苏成', null, 'sucheng@ydbaidu.net', '13428012102', '07525703917', '2017-07-11 17:40:09', '2017-07-13 15:00:14', null);
INSERT INTO `wc_employees` VALUES ('2411', '54', null, '109', null, '市场专员', '320', 'YDHZ0021', '肖璇', null, 'xiaox@ydbaidu.net', '15521303963', '07525703905', '2017-07-11 17:40:09', '2017-08-22 15:13:03', null);
INSERT INTO `wc_employees` VALUES ('2412', '54', null, '111', null, '质控专员', '895', 'YDHZ0022', '冯钰荃', null, 'fengyq@ydbaidu.net', '15976119791', '07525703974', '2017-07-11 17:40:09', '2017-08-18 08:24:34', null);
INSERT INTO `wc_employees` VALUES ('2413', '54', null, '111', null, '质控主管', '902', 'YDHZ0023', '黄钰洲', null, 'huangyzh@ydbaidu.net', '18948269991', '07525702325', '2017-07-11 17:40:09', '2017-08-07 08:46:02', null);
INSERT INTO `wc_employees` VALUES ('2414', '54', null, '112', null, '营销顾问', '371', 'YDHZ0025', '李彬', null, 'libin@ydbaidu.net', '15766901485', '07525703961', '2017-07-11 17:40:09', '2017-07-17 11:35:25', null);
INSERT INTO `wc_employees` VALUES ('2415', '54', null, '101', null, '网络管理员', '261', 'YDHZ0026', '陈达平', null, 'chendp@ydbaidu.net', '18318908522', '07525702362', '2017-07-11 17:40:09', '2017-07-12 08:41:19', null);
INSERT INTO `wc_employees` VALUES ('2416', '54', null, '100', null, '销售助理', '317', 'YDHZ0028', '余唯', null, 'faq@ydbaidu.net', '13825494792', '07525755666', '2017-07-11 17:40:09', '2017-07-13 15:20:00', null);
INSERT INTO `wc_employees` VALUES ('2417', '54', null, '108', null, '百度客服', '1027', 'YDHZ0030', '刘颖华', null, 'liuyh@ydbaidu.net', '15018874321', '07525703908', '2017-07-11 17:40:09', '2017-08-17 17:35:20', null);
INSERT INTO `wc_employees` VALUES ('2418', '54', null, '113', null, '高级商务经理', '252', 'YDHZ0031', '周华乐', null, 'zhouhl@ydbaidu.net', '13160700916', '07525703944', '2017-07-11 17:40:09', '2017-07-13 15:54:34', null);
INSERT INTO `wc_employees` VALUES ('2419', '54', null, '101', null, '行政专员', '1058', 'YDHZ0032', '骆美君', null, 'luomj@ydbaidu.net', '13631922465', '07525703984', '2017-07-11 17:40:09', '2017-08-22 14:01:43', null);
INSERT INTO `wc_employees` VALUES ('2420', '54', null, '102', null, '招聘专员', '279', 'YDHZ0033', '黄海燕', null, 'huanghy@ydbaidu.net', '18823648786', '07525703933', '2017-07-11 17:40:09', '2017-08-22 11:35:23', null);
INSERT INTO `wc_employees` VALUES ('2421', '54', null, '112', null, '商务经理', '359', 'YDHZ0034', '王松文', null, 'wangww@ydbaidu.net', '15820740575', '07525703962', '2017-07-11 17:40:09', '2017-07-17 11:27:22', null);
INSERT INTO `wc_employees` VALUES ('2422', '54', null, '108', null, '客服主管', '1021', 'YDHZ0036', '杨帆', null, 'yangfan@ydbaidu.net', '13074839698', '07525703928', '2017-07-11 17:40:09', '2017-08-17 15:45:54', null);
INSERT INTO `wc_employees` VALUES ('2423', '54', null, '114', null, '培训主管', null, 'YDHZ0037', '杨威', null, 'yangwei@ydbaidu.net', '15345020515', '07525703931', '2017-07-11 17:40:09', null, null);
INSERT INTO `wc_employees` VALUES ('2424', '54', null, '115', null, '高级营销顾问', '652', 'YDHZ0039', '林晓怡', null, 'linxy@ydbaidu.net', '18312267794', '07525702336', '2017-07-11 17:40:09', '2017-08-22 15:07:40', null);
INSERT INTO `wc_employees` VALUES ('2425', '54', null, '116', null, '商务经理', '619', 'YDHZ0043', '谭冬', null, 'tandong@ydbaidu.net', '15819883889', '07525703932', '2017-07-11 17:40:09', '2017-07-24 18:23:29', null);
INSERT INTO `wc_employees` VALUES ('2426', '54', null, '104', null, '营销顾问', '313', 'YDHZ0046', '林建伸', null, 'linjs@ydbaidu.net', '13790777494', '07525703976', '2017-07-11 17:40:09', '2017-07-13 15:17:25', null);
INSERT INTO `wc_employees` VALUES ('2427', '54', null, '117', null, '财务主管', '969', 'YDHZ0047', '李丽琼', null, 'lilq@ydbaidu.net', '13794587019', '07525703981', '2017-07-11 17:40:09', '2017-08-22 11:05:57', null);
INSERT INTO `wc_employees` VALUES ('2428', '54', null, '115', null, '高级商务经理', '325', 'YDHZ0048', '廖雨雁', null, 'liaoyy@ydbaidu.net', '15768858289', '07525702350', '2017-07-11 17:40:09', '2017-07-14 10:37:41', null);
INSERT INTO `wc_employees` VALUES ('2429', '54', null, '113', null, '大客户经理', '636', 'YDHZ0050', '林鸿玲', null, 'linhl@ydbaidu.net', '13246128727', '07525703952', '2017-07-11 17:40:09', '2017-07-25 14:53:02', null);
INSERT INTO `wc_employees` VALUES ('2430', '54', null, '109', null, '市场主管', '1065', 'YDHZ0051', '许文发', null, 'xuwf@ydbaidu.net', '13059533652', '07525703987', '2017-07-11 17:40:09', '2017-08-22 14:37:44', null);
INSERT INTO `wc_employees` VALUES ('2431', '54', null, '108', null, '百度客服', '924', 'YDHZ0052', '谢文彩', null, 'xiewc@ydbaidu.net', '13790770063', '07525703989', '2017-07-11 17:40:09', '2017-08-22 10:36:23', null);
INSERT INTO `wc_employees` VALUES ('2432', '54', null, '102', null, '招聘专员', '319', 'YDHZ0053', '卢静', null, 'lujing@ydbaidu.net', '13725055852', '07525702361', '2017-07-11 17:40:09', '2017-07-13 16:04:14', null);
INSERT INTO `wc_employees` VALUES ('2433', '54', null, '118', null, '高级商务经理', '345', 'YDHZ0059', '陈建富', null, 'chenjf@ydbaidu.net', '15759201120', '07525703964', '2017-07-11 17:40:09', '2017-07-14 10:59:31', null);
INSERT INTO `wc_employees` VALUES ('2434', '54', null, '119', null, '商务经理', '298', 'YDHZ0064', '吴正贤', null, 'wuzhx@ydbaidu.net', '18316699156', '07525703922', '2017-07-11 17:40:09', '2017-07-13 14:47:18', null);
INSERT INTO `wc_employees` VALUES ('2435', '54', null, '113', null, '营销顾问', null, 'YDHZ0065', '李洁文', null, 'lijw@ydbaidu.net', '15767952205', '07525703951', '2017-07-11 17:40:09', null, null);
INSERT INTO `wc_employees` VALUES ('2436', '54', null, '111', null, '质控专员', '901', 'YDHZ0067', '陈雨佳', null, 'chenyj@ydbaidu.net', '13257529422', '07525703992', '2017-07-11 17:40:09', '2017-08-07 08:45:42', null);
INSERT INTO `wc_employees` VALUES ('2437', '54', null, '120', null, '人力行政经理', null, 'YDHZ0075', '黄超', null, 'huangchao@ydbaidu.net', '13902276646', '07525702346', '2017-07-11 17:40:09', null, null);
INSERT INTO `wc_employees` VALUES ('2438', '54', null, '121', null, '薪酬绩效主管', '915', 'YDHZ0076', '罗晓珍', null, 'luoxzh@ydbaidu.net', '13433421560', '07525703993', '2017-07-11 17:40:09', '2017-08-22 11:15:06', null);
INSERT INTO `wc_employees` VALUES ('2439', '54', null, '108', null, '百度客服', '1033', 'YDHZ0078', '彭昊', null, 'penghao@ydbaidu.net', '18688307545', '07525703990', '2017-07-11 17:40:09', '2017-08-17 17:40:37', null);
INSERT INTO `wc_employees` VALUES ('2440', '54', null, '110', null, '高级营销顾问', '295', 'YDHZ0079', '郑慧敏', null, 'zhenghm@ydbaidu.net', '15919388166', '07525703956', '2017-07-11 17:40:09', '2017-07-13 14:17:09', null);
INSERT INTO `wc_employees` VALUES ('2441', '54', null, '104', null, '高级营销顾问', '304', 'YDHZ0081', '刘淑婷', null, 'liusht@ydbaidu.net', '15016077342', '07525703983', '2017-07-11 17:40:09', '2017-07-13 14:52:15', null);
INSERT INTO `wc_employees` VALUES ('2442', '54', null, '119', null, '营销顾问', '601', 'YDHZ0083', '彭天生', null, 'pengtsh@ydbaidu.net', '13430161470', '07525703904', '2017-07-11 17:40:09', '2017-08-17 15:34:56', null);
INSERT INTO `wc_employees` VALUES ('2443', '54', null, '119', null, '营销顾问', '998', 'YDHZ0084', '练显涛', null, 'lianxt@ydbaidu.net', '15976118851', '07525703924', '2017-07-11 17:40:09', '2017-08-16 10:01:05', null);
INSERT INTO `wc_employees` VALUES ('2444', '54', null, '118', null, '高级营销顾问', '742', 'YDHZ0086', '袁培培', null, 'yuanpp@ydbaidu.net', '13413048488', '07525703954', '2017-07-11 17:40:09', '2017-08-22 15:09:11', null);
INSERT INTO `wc_employees` VALUES ('2445', '54', null, '118', null, '营销顾问', '329', 'YDHZ0092', '范健航', null, 'fanjh@ydbaidu.net', '18826483354', '07525703948', '2017-07-11 17:40:09', '2017-07-14 08:02:49', null);
INSERT INTO `wc_employees` VALUES ('2446', '54', null, '108', null, '百度客服', '749', 'YDHZ0099', '陆珊', null, 'lushan@ydbaidu.net', '18978143344', '07525702343', '2017-07-11 17:40:09', '2017-08-17 17:47:07', null);
INSERT INTO `wc_employees` VALUES ('2447', '54', null, '118', null, '营销顾问', null, 'YDHZ0100', '张浩宏', null, 'zhanghh@ydbaidu.net', null, '07525703960', '2017-07-11 17:40:09', '2017-08-09 17:18:47', '2017-08-09 17:18:47');
INSERT INTO `wc_employees` VALUES ('2448', '54', null, '115', null, '营销顾问', '360', 'YDHZ0104', '邱碧云', null, 'qiuby@ydbaidu.net', '13413143283', '07525703915', '2017-07-11 17:40:09', '2017-07-22 18:22:52', null);
INSERT INTO `wc_employees` VALUES ('2449', '54', null, '121', null, '薪酬事务专员', '362', 'YDHZ0106', '林冰儿', null, 'linbe@ydbaidu.net', '15113211401', '07525703330', '2017-07-11 17:40:09', '2017-07-15 11:12:31', null);
INSERT INTO `wc_employees` VALUES ('2450', '54', null, '108', null, '百度客服', '1032', 'YDHZ0113', '黄嘉丽', null, 'huangjl@ydbaidu.net', '15992695951', '07525702340', '2017-07-11 17:40:09', '2017-08-17 17:37:23', null);
INSERT INTO `wc_employees` VALUES ('2451', '54', null, '104', null, '营销顾问', null, 'YDHZ0116', '卢竹青', null, 'luzhq@ydbaidu.net', '15217805191', '07525702332', '2017-07-11 17:40:09', null, null);
INSERT INTO `wc_employees` VALUES ('2452', '54', null, '118', null, '营销顾问', null, 'YDHZ0118', '黄柏畅', null, 'huangbch@ydbaidu.net', null, '07525703942', '2017-07-11 17:40:09', '2017-07-14 14:32:17', '2017-07-14 14:32:17');
INSERT INTO `wc_employees` VALUES ('2453', '54', null, '105', null, '客户经理', '643', 'YDHZ0123', '庄宗裕', null, 'zhuangzy@ydbaidu.net', '13829043888', '07525703927', '2017-07-11 17:40:09', '2017-07-25 15:55:10', null);
INSERT INTO `wc_employees` VALUES ('2454', '54', null, '104', null, '营销顾问', '314', 'YDHZ0124', '屈晓花', null, 'quxh@ydbaidu.net', '15007520714', '07525703925', '2017-07-11 17:40:09', '2017-07-13 15:17:31', null);
INSERT INTO `wc_employees` VALUES ('2455', '54', null, '114', null, '培训专员', '276', 'YDHZ0131', '林玉婷', null, 'linyt@ydbaidu.net', '13798450985', '07525702357', '2017-07-11 17:40:09', '2017-07-13 10:21:51', null);
INSERT INTO `wc_employees` VALUES ('2456', '54', null, '108', null, '百度客服', '1034', 'YDHZ0135', '易文洁', null, 'yiwj@ydbaidu.net', '18573155641', '07525702339', '2017-07-11 17:40:09', '2017-08-17 17:42:07', null);
INSERT INTO `wc_employees` VALUES ('2457', '54', null, '108', null, '百度客服', '318', 'YDHZ0136', '许惠茹', null, 'xuhr@ydbaidu.net', '15819879938', '07525703991', '2017-07-11 17:40:09', '2017-07-13 15:37:59', null);
INSERT INTO `wc_employees` VALUES ('2458', '54', null, '108', null, '百度客服', '1031', 'YDHZ0137', '黄玲怡', null, 'huanglingyi@ydbaidu.net', '13719628553', '07525703995', '2017-07-11 17:40:09', '2017-08-17 17:36:22', null);
INSERT INTO `wc_employees` VALUES ('2459', '54', null, '106', null, '营销顾问', '740', 'YDHZ0140', '陈淑琴', null, 'chenshuqin@ydbaidu.net', '18312168163', '07525753878', '2017-07-11 17:40:09', '2017-08-17 16:29:52', null);
INSERT INTO `wc_employees` VALUES ('2460', '54', null, '109', null, '市场专员', '265', 'YDHZ0141', '黎文浩', null, 'liwh@ydbaidu.net', '13143050483', '07525702353', '2017-07-11 17:40:09', '2017-07-12 08:52:31', null);
INSERT INTO `wc_employees` VALUES ('2461', '54', null, '113', null, '营销顾问', null, 'YDHZ0142', '林小慧', null, 'linxh@ydbaidu.net', null, '07525703955', '2017-07-11 17:40:09', '2017-07-31 18:06:45', '2017-07-31 18:06:45');
INSERT INTO `wc_employees` VALUES ('2462', '54', null, '115', null, '营销顾问', null, 'YDHZ0144', '翟欣瑜', null, 'zhaixy@ydbaidu.net', null, '07525703946', '2017-07-11 17:40:09', '2017-07-31 18:05:42', '2017-07-31 18:05:42');
INSERT INTO `wc_employees` VALUES ('2463', '54', null, '118', null, '营销顾问', null, 'YDHZ0147', '文静', null, 'wenjing@ydbaidu.net', '13286252575', '07525703950', '2017-07-11 17:40:09', '2017-08-03 09:47:50', null);
INSERT INTO `wc_employees` VALUES ('2464', '54', null, '108', null, '百度客服', '923', 'YDHZ0148', '夏丐', null, 'xiagai@ydbaidu.net', '13794070858', '07525703990', '2017-07-11 17:40:09', '2017-08-07 09:39:43', null);
INSERT INTO `wc_employees` VALUES ('2465', '54', null, '109', null, '新媒体运营专员', null, 'YDHZ0149', '张家仪', null, 'zhangjy@ydbaidu.net', '13560397340', '07525702342', '2017-07-11 17:40:09', null, null);
INSERT INTO `wc_employees` VALUES ('2466', '54', null, '189', null, '糯米客服', '442', 'YDHZ0152', '严瑾瑜', null, 'yanjy@ydbaidu.net', '15766562390', null, '2017-07-11 17:40:09', '2017-08-01 17:19:44', null);
INSERT INTO `wc_employees` VALUES ('2467', '54', null, '112', null, '营销顾问', '306', 'YDHZ0154', '陈耿', null, 'chengeng@ydbaidu.net', '15920142791', '07525703970', '2017-07-11 17:40:09', '2017-07-17 11:32:41', null);
INSERT INTO `wc_employees` VALUES ('2468', '54', null, '114', null, '培训专员', '278', 'YDHZ0157', '郑喜斌', null, 'zhengxb@ydbaidu.net', '15626060708', '07525702334', '2017-07-11 17:40:09', '2017-07-13 10:48:58', null);
INSERT INTO `wc_employees` VALUES ('2469', '54', null, '105', null, '营销顾问', '334', 'YDHZ0160', '许志飞', null, 'xuzhf@ydbaidu.net', '15823195617', '07525703957', '2017-07-11 17:40:09', '2017-07-13 19:13:48', null);
INSERT INTO `wc_employees` VALUES ('2470', '54', null, '114', null, '培训专员', null, 'YDHZ0163', '钟可柔', null, 'zhongkr@ydbaidu.net', null, '07525702321', '2017-07-11 17:40:09', '2017-07-31 18:05:26', '2017-07-31 18:05:26');
INSERT INTO `wc_employees` VALUES ('2471', '54', null, '104', null, '营销顾问', null, 'YDHZ0164', '叶钰妤', null, 'yeyy@ydbaidu.net', '18826247534', '07525703935', '2017-07-11 17:40:09', '2017-07-13 15:05:54', null);
INSERT INTO `wc_employees` VALUES ('2472', '54', null, '108', null, '百度客服', '1026', 'YDHZ0168', '陈梅英', null, 'chenmy@ydbaidu.net', '13246560087', '07525703998', '2017-07-11 17:40:09', '2017-08-22 10:40:06', null);
INSERT INTO `wc_employees` VALUES ('2473', '54', null, '108', null, '百度客服', null, 'YDHZ0169', '卢双婷', null, 'lusht@ydbaidu.net', '18272658817', '07525703982', '2017-07-11 17:40:09', null, null);
INSERT INTO `wc_employees` VALUES ('2474', '54', null, '105', null, '营销顾问', null, 'YDHZ0170', '林丽娜', null, 'linln@ydbaidu.net', '15521374245', '07525703921', '2017-07-11 17:40:09', null, null);
INSERT INTO `wc_employees` VALUES ('2475', '54', null, '112', null, '营销顾问', '1091', 'YDHZ0171', '赖丛', null, 'laicong@ydbaidu.net', '15766211915', '07525703969', '2017-07-11 17:40:09', '2017-08-22 15:30:39', null);
INSERT INTO `wc_employees` VALUES ('2476', '54', null, '108', null, '百度客服', null, 'YDHZ0172', '刘莉', null, 'liuli@ydbaidu.net', '18688327891', '07525702351', '2017-07-11 17:40:09', null, null);
INSERT INTO `wc_employees` VALUES ('2477', '54', null, '110', null, '营销顾问', '296', 'YDHZ0173', '韦胜青', null, 'weishq@ydbaidu.net', '15859159510', '07525703937', '2017-07-11 17:40:09', '2017-07-13 17:48:13', null);
INSERT INTO `wc_employees` VALUES ('2478', '54', null, '119', null, '营销顾问', '1020', 'YDHZ0174', '华振渲', null, 'huazhx@ydbaidu.net', '13640089578', '07525752943', '2017-07-11 17:40:09', '2017-08-22 15:40:35', null);
INSERT INTO `wc_employees` VALUES ('2479', '54', null, '110', null, '营销顾问', null, 'YDHZ0177', '蔡智重', null, 'caizhzh@ydbaidu.net', '15217814787', '07525702356', '2017-07-11 17:40:09', '2017-07-13 15:03:19', null);
INSERT INTO `wc_employees` VALUES ('2480', '54', null, '108', null, '百度客服', '301', 'YDHZ0178', '陈俊珊', null, 'chenjsh@ydbaidu.net', '15767354734', '07525702327', '2017-07-11 17:40:09', '2017-07-13 14:50:39', null);
INSERT INTO `wc_employees` VALUES ('2481', '54', null, '117', null, '出纳', '1051', 'YDHZ0181', '孙利梅', null, 'sunlm@ydbaidu.net', '13480582726', '07525703985', '2017-07-11 17:40:09', '2017-08-22 11:00:28', null);
INSERT INTO `wc_employees` VALUES ('2482', '54', null, '104', null, '营销顾问', null, 'YDHZ0182', '麦雪晴', null, 'maixq@ydbaidu.net', '18407582489', '07525703959', '2017-07-11 17:40:09', '2017-07-13 15:06:04', null);
INSERT INTO `wc_employees` VALUES ('2483', '54', null, '108', null, '百度客服', '1030', 'YDHZ0185', '蔡青青', null, 'caiqq@ydbaidu.net', '18302176509', '07525703996', '2017-07-11 17:40:09', '2017-08-17 17:45:42', null);
INSERT INTO `wc_employees` VALUES ('2484', '54', null, '108', null, '百度客服', '1035', 'YDHZ0187', '陈梦婷', null, 'chenmt@ydbaidu.net', '15766598048', '07525703982', '2017-07-11 17:40:09', '2017-08-17 17:44:32', null);
INSERT INTO `wc_employees` VALUES ('2485', '54', null, '104', null, '营销顾问', '316', 'YDHZ0188', '苏晖海', null, 'suhh@ydbaidu.net', '18878224228', '07525703930', '2017-07-11 17:40:09', '2017-07-13 15:18:47', null);
INSERT INTO `wc_employees` VALUES ('2486', '54', null, '118', null, '营销顾问', null, 'YDHZ0189', '黎嘉成', null, 'lijch@ydbaidu.net', '15816461449', '07525703950', '2017-07-11 17:40:09', null, null);
INSERT INTO `wc_employees` VALUES ('2487', '54', null, '108', null, '百度客服', '635', 'YDHZ0190', '孟欣', null, 'mengxin@ydbaidu.net', '18666205174', null, '2017-07-11 17:40:09', '2017-08-03 10:22:02', null);
INSERT INTO `wc_employees` VALUES ('2488', '54', null, '108', null, '平面设计专员', '1053', 'YDHZ0191', '金蛮蛮', null, 'jinmm@ydbaidu.net', '15119015723', '07525703928', '2017-07-11 17:40:09', '2017-08-22 11:20:03', null);
INSERT INTO `wc_employees` VALUES ('2489', '54', null, '108', null, '百度客服', '1028', 'YDHZ0192', '欧阳浈', null, 'ouyangzhen@ydbaidu.net', '15625030782', '07525702351', '2017-07-11 17:40:09', '2017-08-17 17:42:08', null);
INSERT INTO `wc_employees` VALUES ('2490', '54', null, '113', null, '高级营销顾问', '651', 'YDHZ0193', '李雪', null, 'lixue@ydbaidu.net', '13480580532', '07525703972', '2017-07-11 17:40:09', '2017-07-25 18:51:33', null);
INSERT INTO `wc_employees` VALUES ('2491', '54', null, '101', null, '行政司机', null, 'YDHZ0194', '赖志海', null, 'laizhh@ydbaidu.net', '13825458990', '07525702327', '2017-07-11 17:40:09', null, null);
INSERT INTO `wc_employees` VALUES ('2492', '54', null, '106', null, '营销顾问', '620', 'YDHZ0196', '杜慧君', null, 'duhj@ydbaidu.net', '15976230047', '07525703986', '2017-07-11 17:40:09', '2017-07-24 19:50:53', null);
INSERT INTO `wc_employees` VALUES ('2493', '54', null, '108', null, '客服数据专员', '393', 'YDHZ0198', '黄游娜', null, 'huangyn@ydbaidu.net', '13822074641', '07525702327', '2017-07-11 17:40:09', '2017-07-19 09:09:44', null);
INSERT INTO `wc_employees` VALUES ('2494', '54', null, '115', null, '营销顾问', null, 'YDHZ0201', '刘凯', null, 'liukai@ydbaidu.net', null, '07525703902', '2017-07-11 17:40:09', '2017-07-27 08:49:51', '2017-07-27 08:49:51');
INSERT INTO `wc_employees` VALUES ('2495', '54', null, '116', null, '营销顾问', '641', 'YDHZ0202', '朱涛', null, 'zhutao@ydbaidu.net', '13923796201', '07525703913', '2017-07-11 17:40:09', '2017-07-25 14:48:20', null);
INSERT INTO `wc_employees` VALUES ('2496', '54', null, '108', null, '百度客服', '1050', 'YDHZ0203', '李小楷', null, 'lixk@ydbaidu.net', '15768619250', '07525703998', '2017-07-11 17:40:09', '2017-08-22 10:41:02', null);
INSERT INTO `wc_employees` VALUES ('2497', '54', null, '106', null, '营销顾问', null, 'YDHZ0204', '谢桂胜', null, 'xiegsh@ydbaidu.net', '15767974847', '07525703958', '2017-07-11 17:40:09', '2017-07-13 15:05:05', null);
INSERT INTO `wc_employees` VALUES ('2498', '54', null, '108', null, '百度客服', '1044', 'YDHZ0206', '周巧燕', null, 'zhouqy@ydbaidu.net', '13680795280', '07525703989', '2017-07-11 17:40:09', '2017-08-21 08:49:45', null);
INSERT INTO `wc_employees` VALUES ('2499', '54', null, '116', null, '营销顾问', '361', 'YDHZ0207', '李亮亮', null, 'liliangliang@ydbaidu.net', '15767454577', '07525703936', '2017-07-11 17:40:09', '2017-07-25 14:48:55', null);
INSERT INTO `wc_employees` VALUES ('2500', '54', null, '105', null, '营销顾问', '357', 'YDHZ0208', '刘雅玲', null, 'liuyl@ydbaidu.net', '15766954559', '07525702331', '2017-07-11 17:40:09', '2017-07-14 18:34:41', null);
INSERT INTO `wc_employees` VALUES ('2501', '54', null, '110', null, '营销顾问', null, 'YDHZ0209', '邓文聪', null, 'dengwc@ydbaidu.net', '13202320863', '07525703945', '2017-07-11 17:40:09', '2017-07-13 15:04:24', null);
INSERT INTO `wc_employees` VALUES ('2502', '54', null, '116', null, '营销顾问', null, 'YDHZ0211', '李云峰', null, 'liyf@ydbaidu.net', null, '07525752691', '2017-07-11 17:40:09', '2017-07-17 16:46:46', '2017-07-17 16:46:46');
INSERT INTO `wc_employees` VALUES ('2503', '54', null, '115', null, '营销顾问', null, 'YDHZ0212', '伍行勇', null, 'wuxy@ydbaidu.net', null, '07525706001', '2017-07-11 17:40:09', '2017-07-14 10:02:58', '2017-07-14 10:02:58');
INSERT INTO `wc_employees` VALUES ('2504', '54', null, '119', null, '营销顾问', null, 'YDHZ0213', '胡钰广', null, 'huyg@ydbaidu.net', null, '07525703930', '2017-07-11 17:40:09', '2017-07-28 17:11:11', '2017-07-28 17:11:11');
INSERT INTO `wc_employees` VALUES ('2505', '54', null, '105', null, '营销顾问', '342', 'YDHZ0214', '王涵', null, 'wanghan@ydbaidu.net', '15768653944', '07525702331', '2017-07-11 17:40:09', '2017-07-14 10:26:10', null);
INSERT INTO `wc_employees` VALUES ('2506', '48', null, '128', null, '总经理', '405', '12tzz407', '施君', null, 'shijun@xm12t.com', '18701904918', '05966166987', '2017-07-12 12:42:59', '2017-07-19 11:23:15', null);
INSERT INTO `wc_employees` VALUES ('2507', '48', null, '128', null, '总经理助理', '289', '12tzz228', '赖婉艺', null, 'laiwanyi@xm12t.com', '15960628337', '05966166522', '2017-07-12 12:42:59', '2017-07-19 11:25:19', null);
INSERT INTO `wc_employees` VALUES ('2508', '48', null, '128', null, '事业部经理', '145', '12tzz002', '纪亚娇', null, 'jiyj@12t.cn', '13906946160', '05966166859', '2017-07-12 12:42:59', '2017-07-27 09:39:25', null);
INSERT INTO `wc_employees` VALUES ('2509', '48', null, '128', null, '销售工程师', '148', '12tzz054', '魏婷霞', null, 'weitx@xm12t.com', '18760353822', '05966166277', '2017-07-12 12:42:59', '2017-08-05 09:59:53', null);
INSERT INTO `wc_employees` VALUES ('2510', '48', null, '128', null, '销售工程师', null, '12tzz122', '黄勋桀', null, 'huangxunjie@xm12t.com', null, '05966166779', '2017-07-12 12:42:59', '2017-08-03 10:56:30', '2017-08-03 10:56:30');
INSERT INTO `wc_employees` VALUES ('2511', '48', null, '128', null, '商务经理', '164', '12tzz309', '陈文祥', null, 'chenwenxiang@xm12t.com', '15159265657', '05966166307', '2017-07-12 12:42:59', '2017-08-07 10:01:23', null);
INSERT INTO `wc_employees` VALUES ('2512', '48', null, '128', null, '客户经理', null, '12tzz318', '蓝志海', null, 'lanzhihai@xm12t.com', '15659822208', '05966166877', '2017-07-12 12:42:59', null, null);
INSERT INTO `wc_employees` VALUES ('2513', '48', null, '128', null, '客户经理', '288', '12tzz374', '游其钱', null, 'youqiqian@xm12t.com', '18759619892', '05966155311', '2017-07-12 12:42:59', '2017-07-27 09:35:02', null);
INSERT INTO `wc_employees` VALUES ('2514', '48', null, '128', null, '客户经理', '293', '12tzz399', '王浩', null, 'wanghao@xm12t.com', '15059680284', '05966155022', '2017-07-12 12:42:59', '2017-07-19 11:46:18', null);
INSERT INTO `wc_employees` VALUES ('2515', '48', null, '128', null, '客户经理', null, '12tzz403', '李伟坤', null, 'liweikun2@xm12t.com', null, '05966166397', '2017-07-12 12:42:59', '2017-08-03 10:58:02', '2017-08-03 10:58:02');
INSERT INTO `wc_employees` VALUES ('2516', '48', null, '128', null, '客户经理', '356', '12tzz417', '柯裕慧', null, 'keyuhui@xm12t.com', '15280629904', '05966155311', '2017-07-12 12:42:59', '2017-07-26 16:17:26', null);
INSERT INTO `wc_employees` VALUES ('2517', '48', null, '128', null, '客户经理', '407', '12tzz420', '林晓敏', null, 'linxiaomin@xm12t.com', '18094042073', '05966166900', '2017-07-12 12:42:59', '2017-07-19 11:33:48', null);
INSERT INTO `wc_employees` VALUES ('2518', '48', null, '128', null, '客户经理', null, '12tzz422', '李施玲', null, 'lishiling@xm12t.com', null, '05966166025', '2017-07-12 12:42:59', '2017-08-03 10:58:41', '2017-08-03 10:58:41');
INSERT INTO `wc_employees` VALUES ('2519', '48', null, '128', null, '商务经理', '292', '12tzz015', '李秀惠', null, 'lixh@xm12t.com', '15159652244', '05966166787', '2017-07-12 12:42:59', '2017-07-27 09:34:54', null);
INSERT INTO `wc_employees` VALUES ('2520', '48', null, '128', null, '大客户经理', '188', '12tzz225', '卢志锋', null, 'luzhifeng@xm12t.com', '18659688471', '05966155005', '2017-07-12 12:42:59', '2017-07-27 09:27:07', null);
INSERT INTO `wc_employees` VALUES ('2521', '48', null, '128', null, '大客户经理', '64', '12tzz289', '罗秋龙', null, 'luoqiulong@xm12t.com', '15006015782', '05966166300', '2017-07-12 12:42:59', '2017-07-19 11:24:21', null);
INSERT INTO `wc_employees` VALUES ('2522', '48', null, '128', null, '客户经理', '404', '12tzz393', '何水德', null, 'heshuide@xm12t.com', '15806012011', '05966166356', '2017-07-12 12:42:59', '2017-07-19 11:52:45', null);
INSERT INTO `wc_employees` VALUES ('2523', '48', null, '128', null, '客户经理', '406', '12tzz395', '洪永裕', null, 'hongyongyu@xm12t.com', '15659696591', '05966166395', '2017-07-12 12:42:59', '2017-07-19 11:59:29', null);
INSERT INTO `wc_employees` VALUES ('2524', '48', null, '128', null, '客户经理', '294', '12tzz415', '陈长华', null, 'chenchanghua@xm12t.com', '13799717187', '05966166521', '2017-07-12 12:42:59', '2017-07-26 17:35:55', null);
INSERT INTO `wc_employees` VALUES ('2525', '48', null, '128', null, '客户经理', null, '12tzz423', '赖永惠', null, 'laiyonghui@xm12t.com', null, '05966166856', '2017-07-12 12:42:59', '2017-08-03 10:58:48', '2017-08-03 10:58:48');
INSERT INTO `wc_employees` VALUES ('2526', '48', null, '128', null, '商务经理', '152', '12tzz314', '尹欢欢', null, 'yinhuanhuan@xm12t.com', '13599659573', '05966166921', '2017-07-12 12:42:59', '2017-07-19 11:43:53', null);
INSERT INTO `wc_employees` VALUES ('2527', '48', null, '128', null, '客户经理', '286', '12tzz410', '吴燕彬', null, 'wuyanbin@xm12t.com', '18965182350', '05966166367', '2017-07-12 12:42:59', '2017-07-19 11:31:04', null);
INSERT INTO `wc_employees` VALUES ('2528', '48', null, '128', null, '客户经理', '420', '12tzz418', '吴炉国', null, 'wuluguo@xm12t.com', '18050709936', '05966166238', '2017-07-12 12:42:59', '2017-07-27 09:29:32', null);
INSERT INTO `wc_employees` VALUES ('2529', '48', null, '128', null, '客户经理', '290', '12tzz421', '许志鹏', null, 'xuzhipeng@xm12t.com', '13695911616', '05966166391', '2017-07-12 12:42:59', '2017-07-27 09:31:18', null);
INSERT INTO `wc_employees` VALUES ('2530', '48', null, '128', null, '客户经理', '411', '12tzz424', '钟森强', null, 'zhongsanqiang@xm12t.com', '15260072091', '05966166393', '2017-07-12 12:42:59', '2017-08-05 09:47:16', null);
INSERT INTO `wc_employees` VALUES ('2531', '48', null, '129', null, '客户经理', '280', '12tzz045', '许艺娟', null, 'xuyijuan@xm12t.com', '13062401829', '05966155290', '2017-07-12 12:42:59', '2017-07-27 08:58:40', null);
INSERT INTO `wc_employees` VALUES ('2532', '48', null, '129', null, '客户经理', '284', '12tzz140', '周惠民', null, 'zhouhuimin@xm12t.com', '17750151106', '05966166620', '2017-07-12 12:42:59', '2017-07-19 11:47:33', null);
INSERT INTO `wc_employees` VALUES ('2533', '48', null, '129', null, '客户支持', '408', '12tzz345', '邱惠蓉', null, 'qiuhuirong@xm12t.com', '18850236602', '05966166327', '2017-07-12 12:42:59', '2017-07-19 11:36:16', null);
INSERT INTO `wc_employees` VALUES ('2534', '48', null, '129', null, '客户经理', '275', '12tzz284', '张宇芬', null, 'zhangyufen@xm12t.com', '18050671871', '05966155272', '2017-07-12 12:42:59', '2017-07-27 09:27:52', null);
INSERT INTO `wc_employees` VALUES ('2535', '48', null, '129', null, '客户支持', '287', '12tzz406', '谢彩娟', null, 'xiecaijuan@xm12t.com', '15695960882', '05966166151', '2017-07-12 12:42:59', '2017-07-19 11:27:07', null);
INSERT INTO `wc_employees` VALUES ('2536', '48', null, '129', null, '技术工程师', '271', '12tzz254', '郑荆霖', null, 'zhengjinglin@xm12t.com', '18250852052', '05966166800', '2017-07-12 12:42:59', '2017-07-12 12:59:18', null);
INSERT INTO `wc_employees` VALUES ('2537', '48', null, '130', null, '客服经理', '748', '12txm062', '黄婷婷', null, 'huangtingting@xm12t.com', '15959446090', '05966155321', '2017-07-12 12:42:59', '2017-07-27 09:52:35', null);
INSERT INTO `wc_employees` VALUES ('2538', '48', null, '130', null, '客服', null, '12txm608', '林惠兰', null, 'linhl@xm12t.com', '15605960128', '05966166901', '2017-07-12 12:42:59', null, null);
INSERT INTO `wc_employees` VALUES ('2539', '48', null, '130', null, '客服', '416', '12tzz185', '李任飘', null, 'lirenpiao@xm12t.com', '18359192543', '05966166098', '2017-07-12 12:42:59', '2017-07-27 09:37:45', null);
INSERT INTO `wc_employees` VALUES ('2540', '48', null, '130', null, '客服', '765', '12txm817', '黄淑丽', null, 'huangshuli@xm12t.com', '18259636034', '05966155167', '2017-07-12 12:42:59', '2017-07-27 09:26:58', null);
INSERT INTO `wc_employees` VALUES ('2541', '48', null, '130', null, '客服', '412', '12tzz236', '陈燕秀', null, 'chenyanxiu@xm12t.com', '18859610599', '05966166076', '2017-07-12 12:42:59', '2017-07-19 11:39:00', null);
INSERT INTO `wc_employees` VALUES ('2542', '48', null, '130', null, '客服', null, '12tzz135', '谢友萍', null, 'xieyouping@xm12t.com', '13806901517', '05966166062', '2017-07-12 12:42:59', null, null);
INSERT INTO `wc_employees` VALUES ('2543', '48', null, '130', null, '客服', null, '12tzz229', '洪宏', null, 'honghong@xm12t.com', '15880408497', '05966166096', '2017-07-12 12:42:59', null, null);
INSERT INTO `wc_employees` VALUES ('2544', '48', null, '130', null, '客服', '414', '12tzz327', '吴四玲', null, 'wusiling@xm12t.com', '18859673818', '05966166923', '2017-07-12 12:42:59', '2017-08-01 09:14:59', null);
INSERT INTO `wc_employees` VALUES ('2545', '48', null, '130', null, '客服', '421', '12tzz292', '游瑞凤', null, 'youruifeng@xm12t.com', '15060502979', '05966166370', '2017-07-12 12:42:59', '2017-07-27 09:27:23', null);
INSERT INTO `wc_employees` VALUES ('2546', '48', null, '130', null, '客服', '786', '12tzz360', '陈俊华', null, 'chenjunhua@xm12t.com', '18876311893', '05966155305', '2017-07-12 12:42:59', '2017-07-27 09:28:49', null);
INSERT INTO `wc_employees` VALUES ('2547', '48', null, '130', null, '客服', '418', '12tzz354', '连海珠', null, 'lianhaizhu@xm12t.com', '15006031803', '05966166371', '2017-07-12 12:42:59', '2017-07-19 11:53:48', null);
INSERT INTO `wc_employees` VALUES ('2548', '48', null, '130', null, '客服', '788', '12tzz359', '邱玲玲', null, 'qiulingling@xm12t.com', '15892029006', '05966166560', '2017-07-12 12:42:59', '2017-07-27 09:55:51', null);
INSERT INTO `wc_employees` VALUES ('2549', '48', null, '130', null, '客服', '785', '12tzz375', '毛君', null, ' maojun@xm12t.com', '14760020920', '05966166096 ', '2017-07-12 12:42:59', '2017-07-27 09:26:25', null);
INSERT INTO `wc_employees` VALUES ('2550', '48', null, '130', null, '客服', '784', '12tzz384', '林锦文', null, 'linjinwen@xm12t.com', '15705903519', '05966166771', '2017-07-12 12:42:59', '2017-07-27 09:26:06', null);
INSERT INTO `wc_employees` VALUES ('2551', '48', null, '130', null, '客服', '413', '12tzz405', '黄淑玲', null, 'huangshuling@xm12t.com', '13159170196', '05966166856', '2017-07-12 12:42:59', '2017-07-27 09:27:37', null);
INSERT INTO `wc_employees` VALUES ('2552', '48', null, '130', null, '客服', '415', '12tzz408', '林尔佳', null, ' linerjia@xm12t.com', '18850203011', '05966166287', '2017-07-12 12:42:59', '2017-07-19 11:44:08', null);
INSERT INTO `wc_employees` VALUES ('2553', '48', null, '129', null, '质控专员', '759', '12tzz119', '张婉津', null, 'zhangwanjin@xm12t.com', '15605968178', '05966155310', '2017-07-12 12:42:59', '2017-07-26 17:31:05', null);
INSERT INTO `wc_employees` VALUES ('2554', '48', null, '131', null, '运营支持总监', '190', '12txm005', '钟桃英', null, 'zhongty@12t.cn', '13515958815', '05966166655', '2017-07-12 12:42:59', '2017-07-19 11:31:14', null);
INSERT INTO `wc_employees` VALUES ('2555', '48', null, '132', null, '出纳', '410', '12tzz142', '陈晓慧', null, 'chenxiaohui@xm12t.com', '15259658548', '05966155301', '2017-07-12 12:42:59', '2017-07-19 11:31:04', null);
INSERT INTO `wc_employees` VALUES ('2556', '48', null, '133', null, '市场主管', '732', '12tzz326', '游晓迪', null, 'youxiaodi@xm12t.com', '13960181213', '05966166361', '2017-07-12 12:42:59', '2017-07-26 16:44:10', null);
INSERT INTO `wc_employees` VALUES ('2557', '48', null, '134', null, '培训师', null, '12tzz092', '吴燕', null, 'wuy@xm12t.com', '18965222180', '05966166373', '2017-07-12 12:42:59', null, null);
INSERT INTO `wc_employees` VALUES ('2558', '48', null, '134', null, '高级行政助理', '198', '12tzz086', '黄娟娟', null, 'huangjj@xm12t.com', '18760605927', '05966166399', '2017-07-12 12:42:59', '2017-07-12 14:03:21', null);
INSERT INTO `wc_employees` VALUES ('2559', '48', null, '134', null, '人事专员', null, '12tzz262', '吴毅娟', null, 'wuyijuan@xm12t.com', '18850588101', '05966166363', '2017-07-12 12:42:59', null, null);
INSERT INTO `wc_employees` VALUES ('2560', '48', null, '134', null, '招聘专员', '422', '12tzz425', '卢雅君', null, 'luyajun@xm12t.com', '13799047847', '05966166558', '2017-07-12 12:42:59', '2017-07-19 12:14:00', null);
INSERT INTO `wc_employees` VALUES ('2561', '49', null, '136', null, '客服经理', '283', '12tly137', '戴寿花', null, 'daishouhua@xm12t.com ', '15960333511', '5381510', '2017-07-12 13:39:18', '2017-07-13 11:21:01', null);
INSERT INTO `wc_employees` VALUES ('2562', '49', null, '137', null, '客户支持', '471', '12tly153', '曾雪琴', null, 'zengxueqin@xm12t.com', '18850849533', '5311056', '2017-07-12 13:39:18', '2017-07-20 11:48:10', null);
INSERT INTO `wc_employees` VALUES ('2563', '49', null, '149', null, '招聘专员', '214', '12tly162', '谢露华', null, 'xieluhua@xm12t.com', '18359336051', '5311129', '2017-07-12 13:39:18', '2017-07-26 17:05:26', null);
INSERT INTO `wc_employees` VALUES ('2564', '49', null, '139', null, '商务经理', '180', '12tly198', '刘建川', null, 'liujianchuan@xm12t.com ', '15159092519', '5306593', '2017-07-12 13:39:18', '2017-07-20 11:49:26', null);
INSERT INTO `wc_employees` VALUES ('2565', '49', null, '140', null, '客户经理', '672', '12tly181', '吴钰龙', null, 'wuyulong@xm12t.com', '13515915751', '5311081', '2017-07-12 13:39:18', '2017-07-26 16:12:04', null);
INSERT INTO `wc_employees` VALUES ('2566', '49', null, '141', null, '客服', null, '12tly254', '朱晓婷', null, 'zhuxiaoting@xm12t.com', '15759221855', '5320682', '2017-07-12 13:39:18', '2017-07-12 14:54:21', null);
INSERT INTO `wc_employees` VALUES ('2567', '49', null, '142', null, '客户支持', '474', '12tly256', '邱赠萍', null, 'qiuzengping@xm12t.com', '18350202780', '5311063', '2017-07-12 13:39:18', '2017-07-20 11:49:11', null);
INSERT INTO `wc_employees` VALUES ('2568', '49', null, '143', null, '行政专员', '854', '12tly260', '谢红英', null, 'xiehongying@xm12t.com', '18650851910', '5312169', '2017-07-12 13:39:18', '2017-08-08 08:32:35', null);
INSERT INTO `wc_employees` VALUES ('2569', '49', null, '144', null, '商务经理', '675', '12tly261', '郑桦东', null, 'zhenghuadong@xm12t.com', '18650881567', '5311612', '2017-07-12 13:39:18', '2017-07-27 08:59:24', null);
INSERT INTO `wc_employees` VALUES ('2570', '49', null, '145', null, '龙岩总经理', '146', '12tly265', '魏奕强', null, 'weiyq@xm12t.com', '15006002942', '5312256', '2017-07-12 13:39:18', '2017-07-14 10:15:29', null);
INSERT INTO `wc_employees` VALUES ('2571', '49', null, '146', null, '高级培训师', '463', '12tly125', '陈秀梅', null, 'chenxiumei@xm12t.com', '15080284209', '5311619', '2017-07-12 13:39:18', '2017-07-26 16:13:20', null);
INSERT INTO `wc_employees` VALUES ('2572', '49', null, '141', null, '客服', '750', '12tly272', '邹晓琴', null, 'zouxiaoqin@xm12t.com', '18396305612', '5311581', '2017-07-12 13:39:18', '2017-07-26 17:29:06', null);
INSERT INTO `wc_employees` VALUES ('2573', '49', null, '140', null, '大客户经理', '231', '12tly293', '陈浩', null, 'chenhao@xm12t.com', '18760012469', '5311569', '2017-07-12 13:39:18', '2017-07-20 11:48:09', null);
INSERT INTO `wc_employees` VALUES ('2574', '49', null, '142', null, '客户支持', '468', '12tly295', '丘金花', null, 'qiujinhua@xm12t.com', '18030381985', '5320853', '2017-07-12 13:39:18', '2017-07-20 11:46:26', null);
INSERT INTO `wc_employees` VALUES ('2575', '49', null, '140', null, '商务经理', '181', '12tly303', '张鸿发', null, 'zhanghongfa@xm12t.com', '18359349683', '5312261', '2017-07-12 13:39:18', '2017-07-20 11:47:02', null);
INSERT INTO `wc_employees` VALUES ('2576', '49', null, '141', null, '客服', null, '12tly305', '廖淑云', null, 'liaoshuyun@xm12t.com', '18680861014', '5306580', '2017-07-12 13:39:18', '2017-07-12 14:09:44', null);
INSERT INTO `wc_employees` VALUES ('2577', '49', null, '136', null, '客户经理', '469', '12tly321', '林晨茜', null, 'linchenxi@xm12t.com', '13685969218', '5312393', '2017-07-12 13:39:18', '2017-07-20 11:48:05', null);
INSERT INTO `wc_employees` VALUES ('2578', '49', null, '141', null, '客服', '844', '12tly336', '张欢', null, 'zhanghuan@xm12t.com', '18359316330', '5311563', '2017-07-12 13:39:18', '2017-08-22 15:09:27', null);
INSERT INTO `wc_employees` VALUES ('2579', '49', null, '141', null, '客服', '716', '12tly337', '张建梅', null, 'zhangjianmei@xm12t.com', '18059204179', '5311613', '2017-07-12 13:39:18', '2017-07-26 17:29:51', null);
INSERT INTO `wc_employees` VALUES ('2580', '49', null, '147', null, '商务经理', '173', '12tly346', '潘国标', null, 'panguobiao@xm12t.com', '18250111992', '5311260', '2017-07-12 13:39:18', '2017-08-08 09:26:21', null);
INSERT INTO `wc_employees` VALUES ('2581', '49', null, '147', null, '客户经理', '268', '12tly351', '赖海平', null, 'laihaiping@xm12t.com', '13695010801', '5312519', '2017-07-12 13:39:18', '2017-07-26 17:37:22', null);
INSERT INTO `wc_employees` VALUES ('2582', '49', null, '136', null, '客户经理', '466', '12tly357', '林秀余', null, 'linxiuyu@xm12t.com', '15960897183', '5312390', '2017-07-12 13:39:18', '2017-07-20 11:47:11', null);
INSERT INTO `wc_employees` VALUES ('2583', '49', null, '148', null, '市场经理', '942', '12tly365', '吴永平', null, 'wuyongping@xm12t.com', '18039889011', '5312113', '2017-07-12 13:39:18', '2017-08-22 14:56:56', null);
INSERT INTO `wc_employees` VALUES ('2584', '49', null, '149', null, '招聘主管', '464', '12tly367', '陈丽红', null, 'chenlihong@xm12t.com', '13599320016', '5382991', '2017-07-12 13:39:18', '2017-08-07 08:55:20', null);
INSERT INTO `wc_employees` VALUES ('2585', '49', null, '139', null, '营销顾问', '473', '12tly381', '张斌', null, 'zhangbin@xm12t.com', '15880684018', '5311821', '2017-07-12 13:39:18', '2017-07-20 11:48:32', null);
INSERT INTO `wc_employees` VALUES ('2586', '49', null, '143', null, '行政助理', null, '12tly383', '陈淑华', null, 'chenshuhua@xm12t.com', null, '5312169', '2017-07-12 13:39:18', '2017-08-07 15:52:22', '2017-08-07 15:52:22');
INSERT INTO `wc_employees` VALUES ('2587', '49', null, '141', null, '客服', '755', '12txm1739', '何卫红', null, 'heweihong@xm12t.com', '18396144903', '5306573', '2017-07-12 13:39:18', '2017-07-26 17:30:12', null);
INSERT INTO `wc_employees` VALUES ('2588', '49', null, '144', null, '客户经理', '230', '12tly388', '龚晓辉', null, 'gongxiaohui@xm12t.com', '18859065675', '5382993', '2017-07-12 13:39:18', '2017-08-07 09:12:06', null);
INSERT INTO `wc_employees` VALUES ('2589', '49', null, '147', null, '客户经理', '227', '12tly392', '兰樟根', null, 'lanzhanggen@xm12t.com', '18659778847', '5306520', '2017-07-12 13:39:18', '2017-07-20 11:48:57', null);
INSERT INTO `wc_employees` VALUES ('2590', '49', null, '144', null, '客户经理', '229', '12tly396', '刘健鑫', null, 'liujianxin@xm12t.com', '18350118197', '5312269', '2017-07-12 13:39:18', '2017-07-20 11:46:34', null);
INSERT INTO `wc_employees` VALUES ('2591', '49', null, '147', null, '客户经理', '681', '12tly397', '魏重阳', null, 'weichongyang@xm12t.com', '18950896884', '5311502', '2017-07-12 13:39:18', '2017-07-26 16:24:07', null);
INSERT INTO `wc_employees` VALUES ('2592', '49', null, '140', null, '客户经理', '267', '12tly398', '苏松浩', null, 'susonghao@xm12t.com', '18650882050', '5381509', '2017-07-12 13:39:18', '2017-07-21 10:38:51', null);
INSERT INTO `wc_employees` VALUES ('2593', '49', null, '139', null, '客户经理', '217', '12tly400', '郑朝源', null, 'zhengchaoyuan@xm12t.com', '18006078721', '5312508', '2017-07-12 13:39:18', '2017-07-20 11:47:44', null);
INSERT INTO `wc_employees` VALUES ('2594', '49', null, '139', null, '客户经理', '476', '12tly401', '苏尔善', null, 'suershan@xm12t.com', '18705778853', '5311085', '2017-07-12 13:39:18', '2017-07-20 11:50:14', null);
INSERT INTO `wc_employees` VALUES ('2595', '49', null, '139', null, '客户经理', '192', '12tly402', '阮伟懿', null, 'ruanweiyi@xm12t.com', '13358527710', '5311821', '2017-07-12 13:39:18', '2017-07-20 11:49:34', null);
INSERT INTO `wc_employees` VALUES ('2596', '49', null, '140', null, '客户经理', '475', '12tly403', '胡倩倩', null, 'huqianqian@xm12t.com', '13015602836', '5312361', '2017-07-12 13:39:18', '2017-07-20 11:48:34', null);
INSERT INTO `wc_employees` VALUES ('2597', '49', null, '144', null, '客户经理', '228', '12tly406', '江金龙', null, 'jiangjinlong@xm12t.com', '13599330673', '5311832', '2017-07-12 13:39:18', '2017-07-20 11:46:55', null);
INSERT INTO `wc_employees` VALUES ('2598', '49', null, '147', null, '客户经理', '240', '12tly408', '詹泽梅', null, 'zhanzemei@xm12t.com', '18760053818', '5382995', '2017-07-12 13:39:18', '2017-07-26 16:24:56', null);
INSERT INTO `wc_employees` VALUES ('2599', '49', null, '136', null, '客户经理', '472', '12tly409', '刘晓倩', null, 'liuxiaoqian@xm12t.com', '18650838300', '5382999', '2017-07-12 13:39:18', '2017-07-20 11:48:11', null);
INSERT INTO `wc_employees` VALUES ('2600', '49', null, '150', null, '会计', '894', '12tly410', '张菊清', null, 'zhangjuqing@xm12t.com', '13860283004', '5318360', '2017-07-12 13:39:18', '2017-08-17 10:31:16', null);
INSERT INTO `wc_employees` VALUES ('2601', '50', null, '152', null, '总经理', '964', '12t', '苏文革', null, 'shuwg@12t.cn', '18959985912', '0595-28037712', '2017-07-12 13:52:53', '2017-08-07 16:42:41', null);
INSERT INTO `wc_employees` VALUES ('2602', '50', null, '152', null, '销售总监', '135', 'qz050', '林月德', null, 'linyd@12t.cn', '13808524119', '0595-28067905', '2017-07-12 13:52:53', '2017-07-14 15:27:02', null);
INSERT INTO `wc_employees` VALUES ('2603', '50', null, '152', null, '销售总监', '860', 'qz052', '陈浩', null, 'chenh@12t.cn', '18959985919', '0595-28037758', '2017-07-12 13:52:53', '2017-08-22 14:33:06', null);
INSERT INTO `wc_employees` VALUES ('2604', '50', null, '152', null, '销售总监', '671', 'qz194', '陈自力', null, 'chenzl@xm12t.com', '15959959179', '0595-28037726', '2017-07-12 13:52:53', '2017-08-07 16:40:26', null);
INSERT INTO `wc_employees` VALUES ('2605', '50', null, '152', null, '销售总监', '477', 'qz073', '钟马海金', null, 'zhongmhj@xm12t.com', '15260366709', '0595-28037807', '2017-07-12 13:52:53', '2017-07-21 13:44:38', null);
INSERT INTO `wc_employees` VALUES ('2606', '50', null, '152', null, '销售总监', '499', 'qz068', '黄佳明', null, 'huangjiaming@xm12t.com', '18359113793', null, '2017-07-12 13:52:53', '2017-07-21 13:44:46', null);
INSERT INTO `wc_employees` VALUES ('2607', '50', null, '152', null, '大区总监', '524', 'qz028', '魏志隆', null, 'weizhl@12t.cn', '13506029213', '0595-28067902', '2017-07-12 13:52:53', '2017-07-21 09:25:27', null);
INSERT INTO `wc_employees` VALUES ('2608', '50', null, '152', null, '大区总监', '548', 'jj005', '纪清江', null, 'jiqj@xm12t.com', '13959975053', '0595-82682807', '2017-07-12 13:52:53', '2017-07-21 10:24:49', null);
INSERT INTO `wc_employees` VALUES ('2609', '50', null, '152', null, '总经理助理', '1089', 'qz167', '傅培婷', null, 'fupt@xm12t.com', '15294555626', '0595-28037771', '2017-07-12 13:52:53', '2017-08-22 15:17:30', null);
INSERT INTO `wc_employees` VALUES ('2610', '50', null, '152', null, '总经理助理', '951', 'qz146', '陈少华', null, 'qzxszl@xm12t.com', '13599746578', null, '2017-07-12 13:52:53', '2017-08-07 15:56:20', null);
INSERT INTO `wc_employees` VALUES ('2611', '50', null, '152', null, '总经理助理', null, 'jj022', '陈晓玲', null, 'chenxiaoling@xm12t.com', null, '0595-82682735', '2017-07-12 13:52:53', '2017-07-26 17:29:11', '2017-07-26 17:29:11');
INSERT INTO `wc_employees` VALUES ('2612', '50', null, '153', null, '质控专员', '873', 'qz597', '张敏', null, 'zhangmin@xm12t.com', '15880709921', '0595-28912687', '2017-07-12 13:52:53', '2017-08-07 15:52:04', null);
INSERT INTO `wc_employees` VALUES ('2613', '50', null, '153', null, '质控专员', '948', 'qz599', '李菲', null, 'lifei@xm12t.com', '13559532937', '0595-28095029', '2017-07-12 13:52:53', '2017-08-07 15:53:54', null);
INSERT INTO `wc_employees` VALUES ('2614', '50', null, '153', null, '质控专员', '577', 'qz613', '林清清', null, 'linqingqing@xm12t.com', '15060612383', '0595-28913832', '2017-07-12 13:52:53', '2017-08-07 16:26:53', null);
INSERT INTO `wc_employees` VALUES ('2615', '50', null, '126', null, '会计', '859', 'qz574', '蔡立平', null, 'cailp@12t.cn', '13599222331', '0595-28037784', '2017-07-12 13:52:53', '2017-08-07 15:55:47', null);
INSERT INTO `wc_employees` VALUES ('2616', '50', null, '126', null, '出纳', '953', 'qz425', '陈燕平', null, 'chenyanping@xm12t.com', '15060879852', '0595-28037770', '2017-07-12 13:52:53', '2017-08-07 16:05:09', null);
INSERT INTO `wc_employees` VALUES ('2617', '50', null, '127', null, '市场经理', '764', 'qz007', '曾玉宽', null, 'zengyk@xm12t.com', '15159773383', '0595-28912675', '2017-07-12 13:52:53', '2017-07-26 17:31:37', null);
INSERT INTO `wc_employees` VALUES ('2618', '50', null, '127', null, '市场主管', '531', 'qz468', '庄汉荣', null, 'zhuanghanrong@xm12t.com', '15659431840', '0595-28093305', '2017-07-12 13:52:53', '2017-07-21 09:19:38', null);
INSERT INTO `wc_employees` VALUES ('2619', '50', null, '154', null, '人事主管', '769', 'qz164', '林美珠', null, 'hrzg@xm12t.com', '15259509752', '0595-28938927', '2017-07-12 13:52:53', '2017-07-26 17:35:13', null);
INSERT INTO `wc_employees` VALUES ('2620', '50', null, '154', null, '薪酬绩效专员', '771', 'qz362', '陈美灵', null, 'jxzy@xm12t.com', '15805003319', '0595-28095015', '2017-07-12 13:52:53', '2017-07-26 17:35:04', null);
INSERT INTO `wc_employees` VALUES ('2621', '50', null, '154', null, '高级行政助理', '269', 'qz361', '柯琳芳', null, 'qzxz@xm12t.com', '13015875575', '0595-28037752', '2017-07-12 13:52:53', '2017-07-12 15:38:13', null);
INSERT INTO `wc_employees` VALUES ('2622', '50', null, '154', null, '行政助理', '581', 'qz419', '林莉莉', null, 'linlili@xm12t.com', '18005072278', '0595-28068039', '2017-07-12 13:52:53', '2017-08-05 11:26:53', null);
INSERT INTO `wc_employees` VALUES ('2623', '50', null, '154', null, '行政助理', '1077', 'jj006', '黄美晨', null, 'jinjiangxz@xm12t.com', '15059510459', '0595-82682806', '2017-07-12 13:52:53', '2017-08-22 14:54:18', null);
INSERT INTO `wc_employees` VALUES ('2624', '50', null, '154', null, '网络工程师', '1014', 'qz175', '李秋', null, 'wgzy@xm12t.com', '13799479993', null, '2017-07-12 13:52:53', '2017-08-17 11:21:03', null);
INSERT INTO `wc_employees` VALUES ('2625', '50', null, '154', null, '司机', '992', 'qz372', '吴章来', null, '0', '15260883956', null, '2017-07-12 13:52:53', '2017-08-11 09:20:04', null);
INSERT INTO `wc_employees` VALUES ('2626', '50', null, '154', null, '招聘主管', '773', 'qz295', '曾明华', null, 'zhaopinzhuguan@xm12t.com', '13505023016', '0595-28095170', '2017-07-12 13:52:53', '2017-07-26 17:35:41', null);
INSERT INTO `wc_employees` VALUES ('2627', '50', null, '154', null, '招聘专员', '580', 'qz091', '林志峰', null, 'linzhifeng@xm12t.com', '15080441214', '0595-28095126', '2017-07-12 13:52:53', '2017-08-07 16:03:45', null);
INSERT INTO `wc_employees` VALUES ('2628', '50', null, '154', null, '招聘专员', '960', 'qz195', '刘巧妹', null, 'zhaopinerhao@xm12t.com', '18750559635', '0595-28095105', '2017-07-12 13:52:53', '2017-08-07 16:12:18', null);
INSERT INTO `wc_employees` VALUES ('2629', '50', null, '154', null, '招聘专员', '563', 'qz351', '陈小玲', null, 'zhaopinyihao@xm12t.com', '15259595895', '0595-28915129', '2017-07-12 13:52:53', '2017-07-26 17:33:19', null);
INSERT INTO `wc_employees` VALUES ('2630', '50', null, '154', null, '招聘专员', '956', 'jj032', '叶英娇', null, 'yeyingjiao@xm12t.com', '15906060013', '0595-82682802', '2017-07-12 13:52:53', '2017-08-07 16:05:13', null);
INSERT INTO `wc_employees` VALUES ('2631', '50', null, '154', null, '高级培训师', '496', 'qz271', '王彩红', null, 'wangcaihong@xm12t.com', '18676773972', null, '2017-07-12 13:52:53', '2017-07-21 09:10:57', null);
INSERT INTO `wc_employees` VALUES ('2632', '50', null, '154', null, '培训师', '127', 'qz059', '张淑云', null, 'zhangshuyun@xm12t.com', '18876200426', null, '2017-07-12 13:52:53', '2017-07-13 11:18:17', null);
INSERT INTO `wc_employees` VALUES ('2633', '50', null, '154', null, '培训师', '129', 'qz358', '黄丽丽', null, 'huanglili1@xm12t.com', '15080409909', '0595-28091379', '2017-07-12 13:52:53', '2017-07-26 17:30:43', null);
INSERT INTO `wc_employees` VALUES ('2634', '50', null, '154', null, '培训师', '128', 'qz371', '谢雯雯', null, 'xiewenwen@xm12t.com', '15906061498', null, '2017-07-12 13:52:53', '2017-07-21 09:16:07', null);
INSERT INTO `wc_employees` VALUES ('2635', '50', null, '154', null, '培训师', '582', 'jj014', '洪美玲', null, 'hongmeiling@xm12t.com', '13600750650', '0595-82682819', '2017-07-12 13:52:53', '2017-07-21 14:18:35', null);
INSERT INTO `wc_employees` VALUES ('2636', '50', null, '155', null, '大区经理', '282', 'qz046', '陈菊梅', null, 'chenjm@12t.cn', '13850745895', '0595-28092826', '2017-07-12 13:52:53', '2017-07-21 13:10:22', null);
INSERT INTO `wc_employees` VALUES ('2637', '50', null, '155', null, '客户经理', '955', 'qz044', '黄小青', null, 'huangxq@xm12t.com', '15559585886', '0595-28095036', '2017-07-12 13:52:53', '2017-08-07 16:04:42', null);
INSERT INTO `wc_employees` VALUES ('2638', '50', null, '155', null, '客服专员', '776', 'qz003', '陈宝华', null, 'chenbh@xm12t.com', '13860778902', '0595-28092782', '2017-07-12 13:52:53', '2017-08-07 16:04:43', null);
INSERT INTO `wc_employees` VALUES ('2639', '50', null, '155', null, '客服专员', '1063', 'qz535', '林美春', null, 'linmeichun@xm12t.com', '13960399981', '0595-28091562', '2017-07-12 13:52:53', '2017-08-22 14:44:11', null);
INSERT INTO `wc_employees` VALUES ('2640', '50', null, '155', null, '客服专员', '754', 'qz102', '程晓田', null, 'chengxiaotian@xm12t.com', '15880759433', '0595-28092673', '2017-07-12 13:52:53', '2017-08-10 16:52:22', null);
INSERT INTO `wc_employees` VALUES ('2641', '50', null, '155', null, '客服专员', '957', 'qz104', '曾玉清', null, 'zengyuqing@xm12t.com', '15060876839', '0595-28092557', '2017-07-12 13:52:53', '2017-08-07 16:08:18', null);
INSERT INTO `wc_employees` VALUES ('2642', '50', null, '155', null, '客服专员', '986', 'qz446', '陈佳莉', null, 'chenjiali@xm12t.com', '18959899366', '0595-28092622', '2017-07-12 13:52:53', '2017-08-10 16:36:06', null);
INSERT INTO `wc_employees` VALUES ('2643', '50', null, '155', null, '客服专员', '571', 'qz459', '邓秋玲', null, 'dengqiuling@xm12t.com', '15959573645', null, '2017-07-12 13:52:53', '2017-08-10 16:58:55', null);
INSERT INTO `wc_employees` VALUES ('2644', '50', null, '155', null, '客服专员', '509', 'qz123', '丁晓平', null, 'dingxp@xm12t.com', '13788821820', '0595-28913026', '2017-07-12 13:52:53', '2017-07-21 09:17:27', null);
INSERT INTO `wc_employees` VALUES ('2645', '50', null, '155', null, '客户支持', '575', 'qz067', '林婵媛', null, 'linchanyuan@xm12t.com', '15905997971', '0595-28091373', '2017-07-12 13:52:53', '2017-07-26 17:31:53', null);
INSERT INTO `wc_employees` VALUES ('2646', '50', null, '155', null, '客户支持', '959', 'qz284', '陈增鸿', null, 'chenzenghong@xm12t.com', '15260795028', '0595-28091327', '2017-07-12 13:52:53', '2017-08-07 16:07:40', null);
INSERT INTO `wc_employees` VALUES ('2647', '50', null, '155', null, '客户支持', '757', 'qz538', '陈婉茹', null, 'chenwanru@xm12t.com', '13459551303', '无', '2017-07-12 13:52:53', '2017-07-26 17:31:05', null);
INSERT INTO `wc_employees` VALUES ('2648', '50', null, '155', null, '客户支持', '753', 'qz081', '张洋洋', null, 'zhangyangyang@xm12t.com', '18759493083', '0595-28091063', '2017-07-12 13:52:53', '2017-07-26 17:30:05', null);
INSERT INTO `wc_employees` VALUES ('2649', '50', null, '155', null, '客户支持', '568', 'qz171', '朱巧艺', null, 'zhuqiaoyi@xm12t.com', '15060810136', '0595-28092283', '2017-07-12 13:52:53', '2017-07-21 13:55:15', null);
INSERT INTO `wc_employees` VALUES ('2650', '50', null, '155', null, '客户支持', '758', 'qz340', '庄森榕', null, 'zhuangsenrong@xm12t.com', '15060870502', null, '2017-07-12 13:52:53', '2017-07-26 17:30:54', null);
INSERT INTO `wc_employees` VALUES ('2651', '50', null, '155', null, '客服专员', '752', 'qz372', '谢燕琴', null, 'xieyanqin@xm12t.com', '13959793187', null, '2017-07-12 13:52:53', '2017-08-07 16:04:38', null);
INSERT INTO `wc_employees` VALUES ('2652', '50', null, '155', null, '客户经理', '522', 'qz308', '张慧敏', null, 'zhanghm@xm12t.com', '15859784585', '0595-28092396', '2017-07-12 13:52:53', '2017-08-07 16:05:13', null);
INSERT INTO `wc_employees` VALUES ('2653', '50', null, '155', null, '客户经理', '518', 'qz230', '余静雯', null, 'yujingwen@xm12t.com', '15905098281', '0595-28092593', '2017-07-12 13:52:53', '2017-07-21 09:18:33', null);
INSERT INTO `wc_employees` VALUES ('2654', '50', null, '155', null, '客户经理', '527', 'qz255', '张秀花', null, 'zhangxiuhua@xm12t.com', '15160783565', '0595-28092512', '2017-07-12 13:52:53', '2017-07-21 09:19:03', null);
INSERT INTO `wc_employees` VALUES ('2655', '50', null, '155', null, '客户经理', '525', 'qz433', '许培丽', null, 'xupeili@xm12t.com', '15059596060', '0595-28092771', '2017-07-12 13:52:53', '2017-07-21 09:18:22', null);
INSERT INTO `wc_employees` VALUES ('2656', '50', null, '155', null, '客户经理', '487', 'qz511', '王鑫标', null, 'wangxinbiao@xm12t.com', '15160310695', '0595-28093302', '2017-07-12 13:52:53', '2017-08-07 16:05:23', null);
INSERT INTO `wc_employees` VALUES ('2657', '50', null, '155', null, '客户经理', '791', 'qz283', '敖丹', null, 'aodan@xm12t.com', '18859550040', '0595-28092536', '2017-07-12 13:52:53', '2017-08-10 16:29:42', null);
INSERT INTO `wc_employees` VALUES ('2658', '50', null, '155', null, '客户经理', '795', 'qz341', '郑素霞', null, 'zhengsuxia@xm12t.com', '13959890991', '0595-28092129', '2017-07-12 13:52:53', '2017-08-10 16:29:51', null);
INSERT INTO `wc_employees` VALUES ('2659', '50', null, '155', null, '客户经理', '590', 'jj030', '郑浪', null, 'zhenglang@xm12t.com', '18359887263', '0595-82682737', '2017-07-12 13:52:53', '2017-07-21 14:19:14', null);
INSERT INTO `wc_employees` VALUES ('2660', '50', null, '155', null, '客户经理', '589', 'jj021', '张燕萍', null, 'zhangyanping@xm12t.com', '18850258721', '0595-82682750', '2017-07-12 13:52:53', '2017-07-21 14:18:55', null);
INSERT INTO `wc_employees` VALUES ('2661', '50', null, '155', null, '技术经理', '281', 'qz060', '辛联锋', null, 'xinlf@12t.cn', '18105056605', '0595-28092873', '2017-07-12 13:52:53', '2017-07-13 11:17:27', null);
INSERT INTO `wc_employees` VALUES ('2662', '50', null, '155', null, '技术工程师', '988', 'qz122', '陈潇潇', null, 'chenxx@xm12t.com', '15159823532', '0595-28091902', '2017-07-12 13:52:53', '2017-08-10 16:37:07', null);
INSERT INTO `wc_employees` VALUES ('2663', '50', null, '155', null, '技术工程师', '566', 'qz039', '吴梅丽', null, 'wuml@xm12t.com', '18959723579', null, '2017-07-12 13:52:53', '2017-08-10 16:41:02', null);
INSERT INTO `wc_employees` VALUES ('2664', '50', null, '155', null, '技术工程师', null, 'qz357', '辛坚雄', null, 'xinjianxiong@xm12t.com', null, null, '2017-07-12 13:52:53', '2017-08-07 16:06:31', '2017-08-07 16:06:31');
INSERT INTO `wc_employees` VALUES ('2665', '50', null, '155', null, '技术工程师', '559', 'qz312', '李淑霞', null, 'lishuxia@xm12t.com', '18965798760', null, '2017-07-12 13:52:53', '2017-08-22 15:00:51', null);
INSERT INTO `wc_employees` VALUES ('2666', '50', null, '155', null, '设计师', '507', 'qz440', '卢良艺', null, ' luliangyi@xm12t.com', '18065270037', null, '2017-07-12 13:52:53', '2017-07-21 09:18:38', null);
INSERT INTO `wc_employees` VALUES ('2667', '50', null, '155', null, '技术工程师', '578', 'qz455', '方兴家', null, 'fangxingjia@xm12t.com', '13599227307', null, '2017-07-12 13:52:53', '2017-08-10 16:39:23', null);
INSERT INTO `wc_employees` VALUES ('2668', '50', null, '155', null, '程序主管', '108', 'qz180', '施冬峰', null, 'shidf@xm12t.com', '15159823632', '0595-28092817', '2017-07-12 13:52:53', '2017-07-21 09:17:40', null);
INSERT INTO `wc_employees` VALUES ('2669', '50', null, '155', null, '技术工程师', '570', 'qz296', '潘志艺', null, 'panzhiyi@xm12t.com', '13626088216', '0595-28092817', '2017-07-12 13:52:53', '2017-08-10 16:55:28', null);
INSERT INTO `wc_employees` VALUES ('2670', '50', null, '155', null, '技术工程师', '501', 'qz307', '叶逢霖', null, 'yefenglin@xm12t.com', '17689353868', null, '2017-07-12 13:52:53', '2017-07-21 09:17:14', null);
INSERT INTO `wc_employees` VALUES ('2671', '50', null, '155', null, '技术工程师', '515', 'qz460', '黄志宏', null, 'huangzhihong@xm12t.com', '18960312200', null, '2017-07-12 13:52:53', '2017-08-10 17:07:40', null);
INSERT INTO `wc_employees` VALUES ('2672', '50', null, '155', null, '高级商务经理', '131', 'qz335', '刘杜灿', null, 'liudc@xm12t.com', '13459270739', '0595-28092261', '2017-07-12 13:52:53', '2017-07-13 11:16:10', null);
INSERT INTO `wc_employees` VALUES ('2673', '50', null, '155', null, '策划专员', null, 'qz465', '林国栋', null, 'linguodong@xm12t.com', null, '0595-28092722', '2017-07-12 13:52:53', '2017-07-21 13:12:51', '2017-07-21 13:12:51');
INSERT INTO `wc_employees` VALUES ('2674', '50', null, '155', null, '策划专员', null, 'qz464', '林晓斌', null, 'linxiaobin@xm12t.com', null, '0595-28092679', '2017-07-12 13:52:53', '2017-07-21 13:13:06', '2017-07-21 13:13:06');
INSERT INTO `wc_employees` VALUES ('2675', '50', null, '156', null, '客服总监', '762', 'qz333', '陈健', null, 'chenjian@xm12t.com', '13808520836', '0595-28091783', '2017-07-12 13:52:53', '2017-08-05 11:25:13', null);
INSERT INTO `wc_employees` VALUES ('2676', '50', null, '156', null, '客户经理', '576', 'qz522', '叶彩华', null, 'yecaihua@xm12t.com', '15959527009', '0595-28092386', '2017-07-12 13:52:53', '2017-08-07 16:00:06', null);
INSERT INTO `wc_employees` VALUES ('2677', '50', null, '156', null, '客户经理', '770', 'qz038', '洪荣堃', null, 'hongrongkun@xm12t.com', '15059709870', '0595-28093526', '2017-07-12 13:52:53', '2017-08-05 11:26:06', null);
INSERT INTO `wc_employees` VALUES ('2678', '50', null, '156', null, '客户经理', '947', 'qz605', '黄显嘉', null, 'huangxianjia@xm12t.com', '15280470148', '0595-28095039', '2017-07-12 13:52:53', '2017-08-07 15:55:31', null);
INSERT INTO `wc_employees` VALUES ('2679', '50', null, '156', null, '客户经理', '878', 'qz242', '张晓芸', null, 'zhangxiaoyun@xm12t.com', '18850748276', '0595-28095129', '2017-07-12 13:52:53', '2017-08-07 15:55:45', null);
INSERT INTO `wc_employees` VALUES ('2680', '50', null, '156', null, '客户经理', '876', 'qz289', '罗春振', null, 'luochunzhen@xm12t.com', '17706038741', '0595-28930625', '2017-07-12 13:52:53', '2017-08-07 15:55:32', null);
INSERT INTO `wc_employees` VALUES ('2681', '50', null, '156', null, '客户经理', '767', 'qz388', '施桂兰', null, 'shiguilan@xm12t.com', '18750944751', '0595-28037800', '2017-07-12 13:52:53', '2017-08-10 16:51:40', null);
INSERT INTO `wc_employees` VALUES ('2682', '50', null, '156', null, '客户经理', '97', 'qz379', '李何', null, 'lihe@xm12t.com', '13159033307', null, '2017-07-12 13:52:53', '2017-08-10 16:50:53', null);
INSERT INTO `wc_employees` VALUES ('2683', '50', null, '156', null, '客户经理', '516', 'qz453', '张斌', null, 'zhangbin@xm12t.com', '18016614327', null, '2017-07-12 13:52:53', '2017-07-21 09:18:40', null);
INSERT INTO `wc_employees` VALUES ('2684', '50', null, '156', null, '客户经理', '950', 'qz466', '蔡佳燕', null, 'caijiayan@xm12t.com', '15985998426', null, '2017-07-12 13:52:53', '2017-08-07 15:55:29', null);
INSERT INTO `wc_employees` VALUES ('2685', '50', null, '156', null, '客户经理', '574', 'qz467', '陈伟鸿', null, 'chenweihong@xm12t.com', '15980479279', null, '2017-07-12 13:52:53', '2017-08-05 11:25:25', null);
INSERT INTO `wc_employees` VALUES ('2686', '50', null, '156', null, '客户经理', '881', 'qz396', '黄斌', null, 'huangbin@xm12t.com', '18650903987', '0595-28091762', '2017-07-12 13:52:53', '2017-08-05 11:33:32', null);
INSERT INTO `wc_employees` VALUES ('2687', '50', null, '156', null, '客户经理', '882', 'qz499', '许少鸣', null, 'xusm@xm12t.com', '18150995858', '0595-28090827', '2017-07-12 13:52:53', '2017-08-05 11:33:37', null);
INSERT INTO `wc_employees` VALUES ('2688', '50', null, '156', null, '客户经理', '823', 'xm1023', '雷丽文', null, 'leiliwen@xm12t.com', '15980205504', '0595-28095253', '2017-07-12 13:52:53', '2017-08-05 11:32:20', null);
INSERT INTO `wc_employees` VALUES ('2689', '50', null, '156', null, '客户经理', '931', 'qz257', '潘冥娆', null, 'panmingrao@xm12t.com', '15160338604', '0595-28915291', '2017-07-12 13:52:53', '2017-08-07 10:59:01', null);
INSERT INTO `wc_employees` VALUES ('2690', '50', null, '156', null, '客户经理', '913', 'qz515', '颜小南', null, 'yanxiaonan@xm12t.com', '13559375041', '0595-28093630', '2017-07-12 13:52:53', '2017-08-10 16:42:19', null);
INSERT INTO `wc_employees` VALUES ('2691', '50', null, '156', null, '客户经理', '877', 'qz523', '黄小瑜', null, 'huangxiaoyu@xm12t.com', '18559551483', '0595-28916282', '2017-07-12 13:52:53', '2017-08-10 16:40:23', null);
INSERT INTO `wc_employees` VALUES ('2692', '50', null, '156', null, '客户经理', '949', 'qz397', '王丽真', null, 'wanglizhen@xm12t.com', '15860289248', '0595-28916815', '2017-07-12 13:52:53', '2017-08-07 15:55:00', null);
INSERT INTO `wc_employees` VALUES ('2693', '50', null, '156', null, '客户经理', '768', 'qz327', '王智勇', null, 'wangzy@xm12t.com', '15980061165', '0595-28093975', '2017-07-12 13:52:53', '2017-08-10 16:58:26', null);
INSERT INTO `wc_employees` VALUES ('2694', '50', null, '156', null, '客户经理', '991', 'qz575', '张巧龙', null, 'zhangqiaolong@xm12t.com', '15980403773', '0595-28912980', '2017-07-12 13:52:53', '2017-08-10 16:50:00', null);
INSERT INTO `wc_employees` VALUES ('2695', '50', null, '156', null, '客户经理', '1092', 'qz152', '许珊珊', null, 'xushanshan@xm12t.com', '13506900291', '0595-28092787', '2017-07-12 13:52:53', '2017-08-22 15:53:12', null);
INSERT INTO `wc_employees` VALUES ('2696', '50', null, '156', null, '客户经理', '987', 'jj017', '温美霞', null, 'wenmeixia@xm12t.com', '18402017682', null, '2017-07-12 13:52:53', '2017-08-10 16:34:32', null);
INSERT INTO `wc_employees` VALUES ('2697', '50', null, '156', null, '客户经理', '561', 'qz587', '曾达威', null, 'zengdawei@xm12t.com', '15159596367', '0595-28913006', '2017-07-12 13:52:53', '2017-07-21 11:45:42', null);
INSERT INTO `wc_employees` VALUES ('2698', '50', null, '156', null, '客户经理', '880', 'qz319', '张婷婷', null, 'zhangtingting@xm12t.com', '13559500336', '0595-28938950', '2017-07-12 13:52:53', '2017-08-05 11:30:58', null);
INSERT INTO `wc_employees` VALUES ('2699', '50', null, '156', null, '客户经理', '569', 'qz369', '郑淑敏', null, 'zhengshumin@xm12t.com', '15859576886', '0595-28091732', '2017-07-12 13:52:53', '2017-07-21 14:15:01', null);
INSERT INTO `wc_employees` VALUES ('2700', '50', null, '156', null, '客户经理', '766', 'qz265', '李华', null, 'lihua@xm12t.com', '15805080630', '0595-28090593', '2017-07-12 13:52:53', '2017-08-05 11:28:36', null);
INSERT INTO `wc_employees` VALUES ('2701', '50', null, '156', null, '客户经理', '965', 'qz502', '许丽梅', null, 'xulm@xm12t.com', '15080351649', '0595-28095311', '2017-07-12 13:52:53', '2017-08-07 16:47:05', null);
INSERT INTO `wc_employees` VALUES ('2702', '50', null, '156', null, '客户经理', '763', 'qz589', '吴燕红', null, 'wuyanhong@xm12t.com', '18750904039', '0595-28167910', '2017-07-12 13:52:53', '2017-08-05 11:33:26', null);
INSERT INTO `wc_employees` VALUES ('2703', '50', null, '156', null, '客户经理', '772', 'qz524', '王小婷', null, 'wangxiaoting@xm12t.com', '15260788027', '0595-28092953', '2017-07-12 13:52:53', '2017-08-05 11:29:45', null);
INSERT INTO `wc_employees` VALUES ('2704', '50', null, '156', null, '客户经理', '871', 'qz317', '蔡碧华', null, 'caibihua@xm12t.com', '13506095491', '0595-28912621', '2017-07-12 13:52:53', '2017-08-05 11:32:39', null);
INSERT INTO `wc_employees` VALUES ('2705', '50', null, '156', null, '客户经理', '761', 'qz352', '黄圣伟', null, 'huangshengwei@xm12t.com', '15060602440', '0595-28932337', '2017-07-12 13:52:53', '2017-08-05 11:27:07', null);
INSERT INTO `wc_employees` VALUES ('2706', '50', null, '156', null, '客户经理', '775', 'qz313', '黄锴', null, 'huangkai@xm12t.com', '13860729043', '0595-28937067', '2017-07-12 13:52:53', '2017-08-05 11:25:18', null);
INSERT INTO `wc_employees` VALUES ('2707', '50', null, '156', null, '客户经理', '884', 'qz275', '林丽锋', null, 'linlifeng@xm12t.com', '15750967292', '0595-28093976', '2017-07-12 13:52:53', '2017-08-05 11:36:06', null);
INSERT INTO `wc_employees` VALUES ('2708', '50', null, '156', null, '客户经理', '780', 'qz298', '柯林星', null, 'kelinxing@xm12t.com', '15559192902', '0595-28915890', '2017-07-12 13:52:53', '2017-08-05 11:35:25', null);
INSERT INTO `wc_employees` VALUES ('2709', '50', null, '156', null, '客户经理', null, 'qz402', '蔡一铃', null, 'caiyiling@xm12t.com', null, '0595-28091253', '2017-07-12 13:52:53', '2017-08-07 15:52:43', '2017-08-07 15:52:43');
INSERT INTO `wc_employees` VALUES ('2710', '50', null, '156', null, '客户经理', '883', 'jj002', '李丹丹', null, 'lidandan@xm12t.com', '15860509692', '0595-82682808', '2017-07-12 13:52:53', '2017-08-05 11:34:41', null);
INSERT INTO `wc_employees` VALUES ('2711', '50', null, '156', null, '客户经理', '591', 'qz276', '林容容', null, 'linrongrong@xm12t.com', '18750539178', '0595-82682923', '2017-07-12 13:52:53', '2017-08-05 11:31:08', null);
INSERT INTO `wc_employees` VALUES ('2712', '50', null, '157', null, '金融专员', '549', 'qz417', '许平', null, 'xuping@xm12t.com', '18659827172', '0595-28095025', '2017-07-12 13:52:53', '2017-07-21 13:56:14', null);
INSERT INTO `wc_employees` VALUES ('2713', '50', null, '152', null, '商务经理', '150', 'qz516', '林生凑', null, 'linshengcou@xm12t.com', '15260182052', '0595-28067936', '2017-07-12 13:52:53', '2017-08-07 16:03:19', null);
INSERT INTO `wc_employees` VALUES ('2714', '50', null, '152', null, '大客户经理', '502', 'qz262', '曾端谊', null, 'zengduanyi@xm12t.com', '13636999093', '0595-28037792', '2017-07-12 13:52:53', '2017-07-21 09:17:20', null);
INSERT INTO `wc_employees` VALUES ('2715', '50', null, '152', null, '大客户经理', '506', 'qz263', '杨熙桐', null, 'yangxitong@xm12t.com', '18120878588', '0595-28068095', '2017-07-12 13:52:53', '2017-07-21 09:17:27', null);
INSERT INTO `wc_employees` VALUES ('2716', '50', null, '152', null, '大客户经理', '244', 'qz297', '雷锦辉', null, 'leijinhui@xm12t.com', '18065235735', '0595-28066879', '2017-07-12 13:52:53', '2017-07-21 09:38:35', null);
INSERT INTO `wc_employees` VALUES ('2717', '50', null, '152', null, '大客户经理', '565', 'qz413', '刘文振', null, 'liuwenzhen@xm12t.com', '18959751032', '0595-28068571', '2017-07-12 13:52:53', '2017-07-21 14:00:28', null);
INSERT INTO `wc_employees` VALUES ('2718', '50', null, '152', null, '商务经理', null, 'qz188', '肖淑英', null, 'xiaosy@12t.cn', '13960392253', '0595-28037753', '2017-07-12 13:52:53', null, null);
INSERT INTO `wc_employees` VALUES ('2719', '50', null, '152', null, '营销顾问', '539', 'qz431', '魏小兰', null, ' weixiaolan@xm12t.com', '13959790917', '0595-28037749', '2017-07-12 13:52:53', '2017-07-21 09:33:01', null);
INSERT INTO `wc_employees` VALUES ('2720', '50', null, '152', null, '商务经理', '535', 'qz010', '肖敏', null, 'xiaomin@12t.cn', '13599205385', '0595-28037747', '2017-07-12 13:52:53', '2017-07-21 10:12:18', null);
INSERT INTO `wc_employees` VALUES ('2721', '50', null, '152', null, '销售主管', '543', 'qz131', '杜思淮', null, 'dusihuai@xm12t.com', '18750591890', '0595-28068220', '2017-07-12 13:52:53', '2017-08-07 16:11:46', null);
INSERT INTO `wc_employees` VALUES ('2722', '50', null, '152', null, '大客户经理', '547', 'qz126', '刘锦彬', null, 'liujinbin@xm12t.com', '13599731741', '0595-28037731', '2017-07-12 13:52:53', '2017-07-21 09:42:10', null);
INSERT INTO `wc_employees` VALUES ('2723', '50', null, '152', null, '客户经理', '533', 'qz244', '尤金莲', null, 'youjinliang@xm12t.com', '15160770335', '0595-28037773', '2017-07-12 13:52:53', '2017-07-21 13:48:58', null);
INSERT INTO `wc_employees` VALUES ('2724', '50', null, '152', null, '营销顾问', '511', 'qz414', '钟晓虹', null, 'zhongxiaohong@xm12t.com', '13107866802', '0595-28037769', '2017-07-12 13:52:53', '2017-07-21 09:17:58', null);
INSERT INTO `wc_employees` VALUES ('2725', '50', null, '152', null, '商务经理', '498', 'qz176', '陈文枝', null, 'chenwenzhi@xm12t.com', '18359523913', '0595-28037738', '2017-07-12 13:52:53', '2017-07-21 13:47:05', null);
INSERT INTO `wc_employees` VALUES ('2726', '50', null, '152', null, '销售主管', '523', 'qz395', '陈斌', null, 'chenbin@xm12t.com', '18759968182', '0595-28067962', '2017-07-12 13:52:53', '2017-07-21 09:18:36', null);
INSERT INTO `wc_employees` VALUES ('2727', '50', null, '152', null, '客户经理', '514', 'qz394', '许剑锋', null, 'xujianfeng@xm12t.com', '15059768076', '0595-28980212', '2017-07-12 13:52:53', '2017-08-10 16:29:20', null);
INSERT INTO `wc_employees` VALUES ('2728', '50', null, '152', null, '客户经理', null, 'qz399', '郭泽昆', null, 'guozekun@xm12t.com', null, '0595-28068295', '2017-07-12 13:52:53', '2017-08-10 16:54:40', '2017-08-10 16:54:40');
INSERT INTO `wc_employees` VALUES ('2729', '50', null, '152', null, '商务经理', '544', 'qz338', '郭伟军', null, 'guowj@xm12t.com', '15159875553', '0595-28037723', '2017-07-12 13:52:53', '2017-07-21 13:55:00', null);
INSERT INTO `wc_employees` VALUES ('2730', '50', null, '152', null, '销售主管', '546', 'qz020', '苏丽云', null, 'suly@12t.cn', '15959872312', '0595-28037735', '2017-07-12 13:52:53', '2017-07-21 09:36:45', null);
INSERT INTO `wc_employees` VALUES ('2731', '50', null, '152', null, '客户经理', '517', 'qz287', '练权庆', null, 'lianquanqing@xm12t.com', '18065237697', '0595-28068263', '2017-07-12 13:52:53', '2017-07-21 13:48:33', null);
INSERT INTO `wc_employees` VALUES ('2732', '50', null, '152', null, '营销顾问', '255', 'qz356', '柯雄峰', null, 'kexiongfeng@xm12t.com', '18059996903', '0595-28037765', '2017-07-12 13:52:53', '2017-07-21 09:22:36', null);
INSERT INTO `wc_employees` VALUES ('2733', '50', null, '152', null, '营销顾问', '545', 'qz444', '田治钢', null, 'tianzhigang@xm12t.com', '15911593601', '0595-28068363', '2017-07-12 13:52:53', '2017-08-10 16:34:50', null);
INSERT INTO `wc_employees` VALUES ('2734', '50', null, '152', null, '商务经理', '505', 'qz190', '戴阿兰', null, 'daial@xm12t.com', '13788826814', '0595-28037713', '2017-07-12 13:52:53', '2017-07-21 09:18:29', null);
INSERT INTO `wc_employees` VALUES ('2735', '50', null, '152', null, '销售主管', '532', 'qz205', '黄培杉', null, 'huangpeishan@xm12t.com', '15396503781', '0595-28060213', '2017-07-12 13:52:53', '2017-07-21 09:21:07', null);
INSERT INTO `wc_employees` VALUES ('2736', '50', null, '152', null, '客户经理', '521', 'qz234', '梁芬', null, 'liangfen@xm12t.com', '15602453960', '0595-28068710', '2017-07-12 13:52:53', '2017-07-21 13:48:12', null);
INSERT INTO `wc_employees` VALUES ('2737', '50', null, '152', null, '客户经理', null, 'qz418', '洪俊龙', null, 'hongjunlong@xm12t.com', null, '0595-28037810', '2017-07-12 13:52:53', '2017-08-07 15:59:31', '2017-08-07 15:59:31');
INSERT INTO `wc_employees` VALUES ('2738', '50', null, '152', null, '客户经理', '508', 'qz435', '曾跃灿', null, 'zengyuecan@xm12t.com', '15159504123', '0595-28037785', '2017-07-12 13:52:53', '2017-07-21 13:49:13', null);
INSERT INTO `wc_employees` VALUES ('2739', '50', null, '152', null, '客户经理', '510', 'qz441', '徐武童', null, 'xuwutong@xm12t.com', '18350635516', '0595-28066825', '2017-07-12 13:52:53', '2017-07-21 13:50:15', null);
INSERT INTO `wc_employees` VALUES ('2740', '50', null, '152', null, '客户经理', '536', 'qz443', '张榕城', null, 'zhangrongcheng@xm12t.com', '15859563792', '0595-28068205', '2017-07-12 13:52:53', '2017-08-05 10:11:43', null);
INSERT INTO `wc_employees` VALUES ('2741', '50', null, '152', null, '商务经理', '990', 'qz078', '周世丽', null, 'zhousl@xm12t.com', '15060897107', '0595-28068052', '2017-07-12 13:52:53', '2017-08-10 16:50:03', null);
INSERT INTO `wc_employees` VALUES ('2742', '50', null, '152', null, '销售主管', '520', 'qz458', '林桂英', null, 'lingy@xm12t.com', '18759595631', '0595-28068092', '2017-07-12 13:52:53', '2017-07-21 09:18:05', null);
INSERT INTO `wc_employees` VALUES ('2743', '50', null, '152', null, '大客户经理', '172', 'qz134', '王心卫', null, 'wangxinwei@xm12t.com', '18396132966', '0595-28980213', '2017-07-12 13:52:53', '2017-08-05 11:24:35', null);
INSERT INTO `wc_employees` VALUES ('2744', '50', null, '152', null, '客户经理', '512', 'qz442', '蔡剑斌', null, 'caijianbin@xm12t.com', '15985929673', '0595-28037775', '2017-07-12 13:52:53', '2017-07-21 13:50:25', null);
INSERT INTO `wc_employees` VALUES ('2745', '50', null, '152', null, '商务经理', '598', 'qz454', '陈莹莹', null, 'chenyy@xm12t.com', '18750549066', '0595-28037772', '2017-07-12 13:52:53', '2017-08-10 16:42:39', null);
INSERT INTO `wc_employees` VALUES ('2746', '50', null, '152', null, '销售主管', '165', 'qz149', '魏婉婷', null, 'weiwanting@xm12t.com', '18060033553', '0595-28037736', '2017-07-12 13:52:53', '2017-07-21 09:17:52', null);
INSERT INTO `wc_employees` VALUES ('2747', '50', null, '152', null, '客户经理', '519', 'qz393', '黄国清', null, 'huangguoqing1@xm12t.com', '17605958021', '0595-28037730', '2017-07-12 13:52:53', '2017-08-07 16:04:03', null);
INSERT INTO `wc_employees` VALUES ('2748', '50', null, '152', null, '客户经理', null, 'qz438', '林建', null, 'linjian@xm12t.com', null, null, '2017-07-12 13:52:53', '2017-08-07 16:07:56', '2017-08-07 16:07:56');
INSERT INTO `wc_employees` VALUES ('2749', '50', null, '152', null, '客户经理', null, 'qz439', '翁皓轩', null, 'wenghaoxuan@xm12t.com', null, '0595-28037774', '2017-07-12 13:52:53', '2017-08-07 16:08:14', '2017-08-07 16:08:14');
INSERT INTO `wc_employees` VALUES ('2750', '50', null, '152', null, '营销顾问', '534', 'qz461', '杨少平', null, 'yangshaoping@xm12t.com', '18659516893', '0595-28037791', '2017-07-12 13:52:53', '2017-07-21 13:59:57', null);
INSERT INTO `wc_employees` VALUES ('2751', '50', null, '152', null, '商务经理', '638', 'qz018', '林福江', null, 'linfj@12t.cn', '13799864286', '0595-28067582', '2017-07-12 13:52:53', '2017-07-25 10:22:45', null);
INSERT INTO `wc_employees` VALUES ('2752', '50', null, '152', null, '销售主管', '204', 'qz474', '陈芳梅', null, 'chenfm@xm12t.com', '13489529755', '0595-28037754', '2017-07-12 13:52:53', '2017-07-21 09:22:11', null);
INSERT INTO `wc_employees` VALUES ('2753', '50', null, '152', null, '大客户经理', '874', 'qz556', '刘顺', null, 'liushun@xm12t.com', '15980327732', '0595-28067059', '2017-07-12 13:52:53', '2017-08-05 11:25:12', null);
INSERT INTO `wc_employees` VALUES ('2754', '50', null, '152', null, '客户经理', '954', 'qz323', '陈志鹏', null, 'chenzhipeng@xm12t.com', '18759503610', '0595-28037824', '2017-07-12 13:52:53', '2017-08-07 16:12:45', null);
INSERT INTO `wc_employees` VALUES ('2755', '50', null, '152', null, '客户经理', '169', 'qz390', '苏政高', null, 'suzhenggao@xm12t.com', '17859910633', '0595-28980224', '2017-07-12 13:52:53', '2017-08-07 16:12:15', null);
INSERT INTO `wc_employees` VALUES ('2756', '50', null, '152', null, '商务经理', null, 'qz111', '林新川', null, 'linxinchuan@xm12t.com', '15659056302', '0595-28066101', '2017-07-12 13:52:53', null, null);
INSERT INTO `wc_employees` VALUES ('2757', '50', null, '152', null, '客户经理', '243', 'qz243', '易淮英', null, 'yihuaiying@xm12t.com', '17750516569', '0595-28980227', '2017-07-12 13:52:53', '2017-07-21 13:16:11', null);
INSERT INTO `wc_employees` VALUES ('2758', '50', null, '152', null, '客户经理', '497', 'qz248', '上官上蕉', null, 'shangguanshangjiao@xm12t.com', '17750415143', '0595-28037797', '2017-07-12 13:52:53', '2017-07-21 13:16:22', null);
INSERT INTO `wc_employees` VALUES ('2759', '50', null, '152', null, '客户经理', '133', 'qz342', '余美华', null, 'yumeihua@xm12t.com', '15059557357', '0595-28067085', '2017-07-12 13:52:53', '2017-07-21 13:16:31', null);
INSERT INTO `wc_employees` VALUES ('2760', '50', null, '152', null, '客户经理', '541', 'qz378', '许伟军', null, 'xuweijun@xm12t.com', '18030142866', null, '2017-07-12 13:52:53', '2017-07-21 13:16:40', null);
INSERT INTO `wc_employees` VALUES ('2761', '50', null, '152', null, '客户经理', '538', 'qz403', '吴小婷', null, 'wuxiaoting@xm12t.com', '15906064793', '0595-28067329', '2017-07-12 13:52:53', '2017-07-21 13:15:42', null);
INSERT INTO `wc_employees` VALUES ('2762', '50', null, '152', null, '商务经理', '670', 'qz236', '黄海龙', null, 'huanghailong@xm12t.com', '18876261565', '0595-28037822', '2017-07-12 13:52:53', '2017-08-07 16:41:36', null);
INSERT INTO `wc_employees` VALUES ('2763', '50', null, '152', null, '客户经理', null, 'qz272', '陈凤霞', null, 'chenfengxia@xm12t.com', null, null, '2017-07-12 13:52:53', '2017-08-07 16:05:29', '2017-08-07 16:05:29');
INSERT INTO `wc_employees` VALUES ('2764', '50', null, '152', null, '销售主管', '235', 'qz314', '卢光海', null, 'luguanghai@xm12t.com', '18759977725', '0595-28037819', '2017-07-12 13:52:53', '2017-07-21 09:17:15', null);
INSERT INTO `wc_employees` VALUES ('2765', '50', null, '152', null, '客户经理', '579', 'qz416', '林赫', null, 'linhe@xm12t.com', '13505074956', '0595-28037815', '2017-07-12 13:52:53', '2017-08-10 16:29:17', null);
INSERT INTO `wc_employees` VALUES ('2766', '50', null, '152', null, '客户经理', '513', 'qz428', '陈嘉恒', null, 'chenjiaheng@xm12t.com', '18859294301', '0595-22798225', '2017-07-12 13:52:53', '2017-07-21 13:43:45', null);
INSERT INTO `wc_employees` VALUES ('2767', '50', null, '152', null, '客户经理', '573', 'qz427', '柯伟杰', null, 'keweijie@xm12t.com', '13107862185', '0595-28068269', '2017-07-12 13:52:53', '2017-08-07 16:02:45', null);
INSERT INTO `wc_employees` VALUES ('2768', '50', null, '152', null, '商务经理', '555', 'jj004', '黄种发', null, 'huangzhongfa@xm12t.com', '15759509203', '0595-82682821', '2017-07-12 13:52:53', '2017-08-10 16:42:07', null);
INSERT INTO `wc_employees` VALUES ('2769', '50', null, '152', null, '客户经理', '552', 'jj031', '郑盛王', null, 'zhengshengwang@xm12t.com', '15859576753', '0595-82682809', '2017-07-12 13:52:53', '2017-07-21 14:19:28', null);
INSERT INTO `wc_employees` VALUES ('2770', '50', null, '152', null, '客户经理', '989', 'jj003', '张志河', null, 'zhangzhihe@xm12t.com', '18459157318', '0595-82682732', '2017-07-12 13:52:53', '2017-08-10 16:59:27', null);
INSERT INTO `wc_employees` VALUES ('2771', '50', null, '152', null, '客户经理', '256', 'jj012', '郭海清', null, 'guohaiqing@xm12t.com', '15396527615', '0595-82682805', '2017-07-12 13:52:53', '2017-07-21 14:32:44', null);
INSERT INTO `wc_employees` VALUES ('2772', '50', null, '152', null, '客户经理', '587', 'jj011', '黄辉瑞', null, 'huanghuirui@xm12t.com', '13586961048', '0595-82682731', '2017-07-12 13:52:53', '2017-07-21 14:19:15', null);
INSERT INTO `wc_employees` VALUES ('2773', '50', null, '152', null, '客户经理', '553', 'jj015', '黄金城', null, 'huangjincheng@xm12t.com', '18160995760', '0595-82682830', '2017-07-12 13:52:53', '2017-07-21 14:18:33', null);
INSERT INTO `wc_employees` VALUES ('2774', '50', null, '152', null, '商务经理', '226', 'jj215', '章子华', null, 'zhangzh@xm12t.com', '15905097101', '0595-82682803', '2017-07-12 13:52:53', '2017-07-21 14:18:28', null);
INSERT INTO `wc_employees` VALUES ('2775', '50', null, '152', null, '销售主管', '583', 'jj008', '王永达', null, 'wangyongda@xm12t.com', '13123123113', '0595-82682804', '2017-07-12 13:52:53', '2017-07-21 14:18:31', null);
INSERT INTO `wc_employees` VALUES ('2776', '50', null, '152', null, '客户经理', null, 'jj016', '陈欣彤', null, 'chenxintong@xm12t.com', null, '0595-82682771', '2017-07-12 13:52:53', '2017-08-07 16:19:13', '2017-08-07 16:19:13');
INSERT INTO `wc_employees` VALUES ('2777', '50', null, '152', null, '客户经理', '585', 'jj019', '吴承汉', null, 'wuchenghan@xm12t.com', '15659555250', '0595-82682755', '2017-07-12 13:52:53', '2017-07-21 14:18:36', null);
INSERT INTO `wc_employees` VALUES ('2778', '50', null, '152', null, '客户经理', '588', 'jj013', '张小容', null, 'zhangxiaorong@xm12t.com', '15259513275', '0595-82682756', '2017-07-12 13:52:53', '2017-07-21 14:18:34', null);
INSERT INTO `wc_employees` VALUES ('2779', '50', null, '152', null, '商务经理', '584', 'jj007', '吴乙彬', null, 'wuyibin@xm12t.com', '15805995060', '0595-82682759', '2017-07-12 13:52:53', '2017-07-21 14:18:39', null);
INSERT INTO `wc_employees` VALUES ('2780', '50', null, '152', null, '客户经理', '958', 'jj023', '李炜坤', null, 'liweikun@xm12t.com', '13600702209', '0595-82682826', '2017-07-12 13:52:53', '2017-08-07 16:11:20', null);
INSERT INTO `wc_employees` VALUES ('2781', '50', null, '152', null, '客户经理', '593', 'jj026', '陈锦灵', null, 'chenjinling@xm12t.com', '15860572977', '0595-82682721', '2017-07-12 13:52:53', '2017-07-21 15:55:29', null);
INSERT INTO `wc_employees` VALUES ('2782', '50', null, '152', null, '客户经理', '564', 'jj010', '张志祥', null, 'zhangzhixiang@xm12t.com', '18559552276', '0595-82682757', '2017-07-12 13:52:53', '2017-07-21 14:17:15', null);
INSERT INTO `wc_employees` VALUES ('2783', '57', null, '158', null, '人力行\n政主管', '377', 'YDST0001', '吴建琦', null, 'wujianqi@ydbaidu.net', '18029500662', '89929772', '2017-07-12 16:24:01', '2017-07-18 11:39:54', null);
INSERT INTO `wc_employees` VALUES ('2784', '57', null, '158', null, '招聘专员', '378', 'YDST0002', '吴妙君', null, 'wumiaojun@ydbaidu.net', '13670301833', '89929779', '2017-07-12 16:24:01', '2017-07-18 11:40:13', null);
INSERT INTO `wc_employees` VALUES ('2785', '57', null, '158', null, '网络管理员', '272', 'YDST0003', '刘思博', null, 'liusibo@ydbaidu.net', '18688018478', null, '2017-07-12 16:24:01', '2017-07-12 17:11:58', null);
INSERT INTO `wc_employees` VALUES ('2786', '57', null, '172', null, '大区经理', '346', 'YDST0116', '林友忠', null, 'linyzh@ydbaidu.net', '15160079854', '89929786', '2017-07-12 16:24:01', '2017-07-18 11:42:33', null);
INSERT INTO `wc_employees` VALUES ('2787', '57', null, '160', null, '出纳', '455', 'YDST0006', '佘琅琅', null, 'shell@ydbaidu.net', '15989703584', '89929768', '2017-07-12 16:24:01', '2017-07-20 09:10:43', null);
INSERT INTO `wc_employees` VALUES ('2788', '57', null, '158', null, '培训主管', '934', 'YDST0007', '蔡旭麟', null, 'caixl@ydbaidu.net ', '18664973565', '89929782', '2017-07-12 16:24:01', '2017-08-07 11:26:48', null);
INSERT INTO `wc_employees` VALUES ('2789', '57', null, '161', null, '市场专员', null, 'YDST0009', '吴培禹', null, 'wupeiyu@ydbaidu.net', null, '89929780', '2017-07-12 16:24:01', '2017-08-22 15:15:47', '2017-08-22 15:15:47');
INSERT INTO `wc_employees` VALUES ('2790', '57', null, '158', null, '薪酬绩效专员', null, 'YDST0010', '魏立君', null, 'weilj@ydbaidu.net', '15989719768', '89929775', '2017-07-12 16:24:01', null, null);
INSERT INTO `wc_employees` VALUES ('2791', '57', null, '159', null, '营销顾问', '981', 'YDST0011', '李权', null, 'liquan@ydbaidu.net', '13794108979', '89929710', '2017-07-12 16:24:01', '2017-08-22 14:52:34', null);
INSERT INTO `wc_employees` VALUES ('2792', '57', null, '159', null, '大区经理', '1038', 'YDST0014', '何凯丰', null, 'hekf@ydbaidu.net', '15210527598', '89929723', '2017-07-12 16:24:01', '2017-08-18 12:00:12', null);
INSERT INTO `wc_employees` VALUES ('2793', '57', null, '159', null, '营销顾问', null, 'YDST0013', '邱立升', null, 'qiuls@ydbaidu.net', '13531188540', '89929760', '2017-07-12 16:24:01', null, null);
INSERT INTO `wc_employees` VALUES ('2794', '57', null, '158', null, '招聘专员', null, 'YDST0016', '李静仪', null, 'lijy@ydbaidu.net', '13411987106', '89929776', '2017-07-12 16:24:01', '2017-08-22 15:19:08', null);
INSERT INTO `wc_employees` VALUES ('2795', '57', null, '159', null, '资深商务经理', '1079', 'YDST0018', '林任鹏', null, 'linrp@ydbaidu.net', '18903043007', '89929755', '2017-07-12 16:24:01', '2017-08-22 15:03:43', null);
INSERT INTO `wc_employees` VALUES ('2796', '57', null, '172', null, '商务经理', '242', 'YDST0020', '李嘉广', null, 'lijg@ydbaidu.net', '13249548789', '89929727', '2017-07-12 16:24:01', '2017-07-24 21:26:19', null);
INSERT INTO `wc_employees` VALUES ('2797', '57', null, '172', null, '营销顾问', '303', 'YDST0025', '陈玉燕', null, 'chenyy@ydbaidu.net', '15817959339', '89929732', '2017-07-12 16:24:01', '2017-07-13 14:52:08', null);
INSERT INTO `wc_employees` VALUES ('2798', '57', null, '159', null, '高级商务经理', '1010', 'YDST0026', '刘权达', null, 'liuqd@ydbaidu.net', '13592829622', '89929733', '2017-07-12 16:24:01', '2017-08-16 16:25:51', null);
INSERT INTO `wc_employees` VALUES ('2799', '57', null, '158', null, '行政专员', '908', 'YDST0028', '林桂芬', null, 'lingf@ydbaidu.net', '13642220816', '89927111', '2017-07-12 16:24:01', '2017-08-07 09:01:10', null);
INSERT INTO `wc_employees` VALUES ('2800', '57', null, '172', null, '营销顾问', null, 'YDST0033', '李春阳', null, 'licy@ydbaidu.net', null, '89929735', '2017-07-12 16:24:01', '2017-07-20 15:29:23', '2017-07-20 15:29:23');
INSERT INTO `wc_employees` VALUES ('2801', '57', null, '162', null, '直通车专员', '906', 'YDST0036', '周爱玲', null, 'zhoual@ydbaidu.net', '13433858440', '89929781', '2017-07-12 16:24:01', '2017-08-07 08:52:34', null);
INSERT INTO `wc_employees` VALUES ('2802', '57', null, '159', null, '营销顾问', '352', 'YDST0037', '张宏昇', null, 'zhanghs@ydbaidu.net', '13926774523', '89929726', '2017-07-12 16:24:01', '2017-07-26 18:51:54', null);
INSERT INTO `wc_employees` VALUES ('2803', '57', null, '159', null, '高级营销顾问', '358', 'YDST0039', '曾丽萍', null, 'zenglp@ydbaidu.net', '13085763883', '89929751', '2017-07-12 16:24:01', '2017-08-07 09:49:24', null);
INSERT INTO `wc_employees` VALUES ('2804', '57', null, '172', null, '商务经理', '299', 'YDST0045', '纪耿毅', null, 'jigy@ydbaidu.net', '13509879821', '89929705', '2017-07-12 16:24:01', '2017-07-13 14:47:49', null);
INSERT INTO `wc_employees` VALUES ('2805', '57', null, '159', null, '营销顾问', '781', 'YDST0050', '林佑生', null, 'linys@ydbaidu.net', '17098993298', '89929750', '2017-07-12 16:24:01', '2017-08-22 15:30:23', null);
INSERT INTO `wc_employees` VALUES ('2806', '57', null, '159', null, '营销顾问', '483', 'YDST0053', '肖思思', null, 'xiaoss@ydbaidu.net', '15767068798', '89929731', '2017-07-12 16:24:01', '2017-08-22 14:52:47', null);
INSERT INTO `wc_employees` VALUES ('2807', '57', null, '159', null, '高级营销顾问', null, 'YDST0060', '陈丹霞', null, 'chendx@ydbaidu.net', null, '89929747', '2017-07-12 16:24:01', '2017-08-22 15:16:19', '2017-08-22 15:16:19');
INSERT INTO `wc_employees` VALUES ('2808', '57', null, '159', null, '营销顾问', null, 'YDST0061', '王晓贤', null, 'wangxiaoxian@ydbaidu.net', null, '89929745', '2017-07-12 16:24:01', '2017-08-03 10:57:09', '2017-08-03 10:57:09');
INSERT INTO `wc_employees` VALUES ('2809', '57', null, '159', null, '营销顾问', '485', 'YDST0062', '蔡海涛', null, 'caiht@ydbaidu.net', '15113118719', '89929722', '2017-07-12 16:24:01', '2017-07-20 14:52:38', null);
INSERT INTO `wc_employees` VALUES ('2810', '57', null, '172', null, '营销顾问', '1037', 'YDST0063', '彭晓娜', null, 'pengxn@ydbaidu.net', '13049066916', '89929746', '2017-07-12 16:24:01', '2017-08-18 11:16:34', null);
INSERT INTO `wc_employees` VALUES ('2811', '57', null, '172', null, '营销顾问', '1045', 'YDST0067', '王斯超', null, 'wangsc@ydbaidu.net', '13926797279', '89929753', '2017-07-12 16:24:01', '2017-08-21 10:41:55', null);
INSERT INTO `wc_employees` VALUES ('2812', '57', null, '172', null, '营销顾问', '1023', 'YDST0071', '黄晓丹', null, 'huangxd@ydbaidu.net', '15113099235', '89929748', '2017-07-12 16:24:01', '2017-08-17 15:59:39', null);
INSERT INTO `wc_employees` VALUES ('2813', '57', null, '163', null, '客服主管', null, 'YDST0076', '李丹媛', null, 'lidy@ydbaidu.net', '13450414206', '89929700', '2017-07-12 16:24:01', null, null);
INSERT INTO `wc_employees` VALUES ('2814', '57', null, '159', null, '营销顾问', null, 'YDST0074', '赵锦发', null, 'zhaojf@ydbaidu.net', null, '89929730', '2017-07-12 16:24:01', '2017-08-03 10:56:58', '2017-08-03 10:56:58');
INSERT INTO `wc_employees` VALUES ('2815', '57', null, '159', null, '营销顾问', '977', 'YDST0086', '辛思华', null, 'xinsh@ydbaidu.net', '18219083702', '89929756', '2017-07-12 16:24:01', '2017-08-16 10:07:54', null);
INSERT INTO `wc_employees` VALUES ('2816', '57', null, '159', null, '试用营销顾问', '1029', 'YDST0089', '方耿钦', null, 'fanggq@ydbaidu.net', '13750036586', '89929720', '2017-07-12 16:24:01', '2017-08-17 17:36:02', null);
INSERT INTO `wc_employees` VALUES ('2817', '57', null, '159', null, '试用营销顾问', '347', 'YDST0094', '李泽杰', null, 'lizj@ydbaidu.net', '13560245949', '89929752', '2017-07-12 16:24:01', '2017-07-20 14:49:20', null);
INSERT INTO `wc_employees` VALUES ('2818', '57', null, '159', null, '营销顾问', null, 'YDST0093', '余伟俊', null, 'yuwj@ydbaidu.net', '13592838523', '89929713', '2017-07-12 16:24:01', null, null);
INSERT INTO `wc_employees` VALUES ('2819', '57', null, '159', null, '营销顾问', '330', 'YDST0095', '黄毓', null, 'huangyu@ydbaidu.net', '18813402610', '89929723', '2017-07-12 16:24:01', '2017-07-13 18:16:07', null);
INSERT INTO `wc_employees` VALUES ('2820', '57', null, '172', null, '试用营销顾问', '790', 'YDST0099', '徐冰鑫', null, 'xubingxin@ydbaidu.net', '13226842129', '89929736', '2017-07-12 16:24:01', '2017-08-22 14:54:31', null);
INSERT INTO `wc_employees` VALUES ('2821', '57', null, '172', null, '试用营销顾问', '1078', 'YDST0100', '李泽楠', null, 'lizn@ydbaidu.net', '15811843264', '89929718', '2017-07-12 16:24:01', '2017-08-22 14:58:21', null);
INSERT INTO `wc_employees` VALUES ('2822', '57', null, '172', null, '试用营销顾问', '917', 'YDST0101', '李志伟', null, 'lizw@ydbaidu.net', '13005332588', '89929762', '2017-07-12 16:24:01', '2017-08-22 14:55:01', null);
INSERT INTO `wc_employees` VALUES ('2823', '57', null, '172', null, '试用营销顾问', '300', 'YDST0102', '李金明', null, 'lijm@ydbaidu.net', '13719915016', '89929758', '2017-07-12 16:24:01', '2017-07-13 14:50:16', null);
INSERT INTO `wc_employees` VALUES ('2824', '57', null, '172', null, '试用营销顾问', '331', 'YDST0104', '潘冠如', null, 'pangr@ydbaidu.net', '13531246349', '89929706', '2017-07-12 16:24:01', '2017-07-13 18:22:51', null);
INSERT INTO `wc_employees` VALUES ('2825', '57', null, '172', null, '试用营销顾问', '637', 'YDST0103', '林嘉茂', null, 'linjm@ydbaidu.net', '13592836783', '89929749', '2017-07-12 16:24:01', '2017-07-25 10:21:37', null);
INSERT INTO `wc_employees` VALUES ('2826', '57', null, '163', null, '客服专员', '918', 'YDST0107', '王慧', null, 'wanghui@ydbaidu.net', '13532952724', '89929701', '2017-07-12 16:24:01', '2017-08-22 11:24:38', null);
INSERT INTO `wc_employees` VALUES ('2827', '57', null, '172', null, '试用营销顾问', '631', 'YDST0108', '李钿', null, 'litian@ydbaidu.net', '13431460705', '89929715', '2017-07-12 16:24:01', '2017-07-25 09:19:06', null);
INSERT INTO `wc_employees` VALUES ('2828', '57', null, '158', null, '培训专员', '467', 'YDST0109', '肖乐曦', null, 'xiaolx@ydbaidu.net ', '13750472487', null, '2017-07-12 16:24:01', '2017-08-07 08:45:12', null);
INSERT INTO `wc_employees` VALUES ('2829', '57', null, '159', null, '试用营销顾问', null, 'YDST0110', '吴禹旭', null, 'wuyx@ydbaidu.net', '13417199933', '89929765', '2017-07-12 16:24:01', null, null);
INSERT INTO `wc_employees` VALUES ('2830', '57', null, '159', null, '试用营销顾问', null, 'YDST0112', '卢翰', null, 'luhan@ydbaidu.net', '13417067573', '89929717', '2017-07-12 16:24:01', '2017-08-03 11:15:18', null);
INSERT INTO `wc_employees` VALUES ('2831', '57', null, '159', null, '试用营销顾问', null, 'YDST0114', '陈丽端', null, 'chenld@ydbaidu.net', '15207543837', '89929712', '2017-07-12 16:24:01', null, null);
INSERT INTO `wc_employees` VALUES ('2832', '57', null, '172', null, '试用营销顾问', '495', 'YDST0115', '黄烙坤', null, 'huanglk@ydbaidu.net', '15913990079', '89929719', '2017-07-12 16:24:01', '2017-08-07 11:04:58', null);
INSERT INTO `wc_employees` VALUES ('2833', '57', null, '159', null, '试用营销顾问', null, 'YDST0117', '谢嘉隆', null, 'xiejl@ydbaidu.net', '18826752307', '89929738', '2017-07-12 16:24:01', null, null);
INSERT INTO `wc_employees` VALUES ('2834', '57', null, '172', null, '试用营销顾问', null, 'YDST0122', '郑泽斌', null, 'zhengzb@ydbaidu.net', null, null, '2017-07-12 16:24:01', '2017-08-03 11:15:49', '2017-08-03 11:15:49');
INSERT INTO `wc_employees` VALUES ('2835', '57', null, '172', null, '试用营销顾问', '480', 'YDST0123', '林晓庭', null, 'linxt@ydbaidu.net', '13415063260', '89929729', '2017-07-12 16:24:01', '2017-08-03 11:15:33', null);
INSERT INTO `wc_employees` VALUES ('2836', '57', null, '172', null, '实习营销顾问', '368', 'YDST0125', '黄晓燕', null, 'huangxy@ydbaidu.net', '17876160693', null, '2017-07-12 16:24:01', '2017-07-24 21:28:36', null);
INSERT INTO `wc_employees` VALUES ('2837', '57', null, '172', null, '实习营销顾问', null, 'YDST0126', '李俊辉', null, 'lijh@ydbaidu.net', null, null, '2017-07-12 16:24:01', '2017-08-03 10:58:47', '2017-08-03 10:58:47');
INSERT INTO `wc_employees` VALUES ('2838', '55', null, '185', null, '分公司总经理', '321', 'YDMZ0016', '郑泗珍', null, 'zhengszh@ydbaidu.net', '13959490124', '07538589099', '2017-07-12 16:35:55', '2017-07-18 15:17:57', null);
INSERT INTO `wc_employees` VALUES ('2839', '55', null, '186', null, '行政专员', '273', 'YDMZ0009', '林可欢', null, 'linkh@ydbaidu.net', '18319704543', '07538589068', '2017-07-12 16:35:55', '2017-07-18 15:18:32', null);
INSERT INTO `wc_employees` VALUES ('2840', '55', null, '186', null, '招聘专员', '1005', 'YDMZ0011', '钟立宇', null, 'zhongly@ydbaidu.net', '15766361520', '07538589166', '2017-07-12 16:35:55', '2017-08-16 10:50:49', null);
INSERT INTO `wc_employees` VALUES ('2841', '55', null, '186', null, '行政专员', '1004', 'YDMZ0012', '李金伶', null, 'lijinl@ydbaidu.net', '13823895224', '07538589000', '2017-07-12 16:35:55', '2017-08-16 11:27:09', null);
INSERT INTO `wc_employees` VALUES ('2842', '55', null, '186', null, '培训专员', '633', 'YDMZ0020', '沈映旋', null, 'shenyx@ydbaidu.net', '13823885499', '07538589069', '2017-07-12 16:35:55', '2017-08-16 10:54:36', null);
INSERT INTO `wc_employees` VALUES ('2843', '55', null, '185', null, '商务经理', '322', 'YDMZ0025', '刘仕望', null, 'liushw@ydbaidu.net', '13824557614', '07538589089', '2017-07-12 16:35:55', '2017-07-18 15:19:14', null);
INSERT INTO `wc_employees` VALUES ('2844', '55', null, '185', null, '商务经理', '309', 'YDMZ0027', '黄润红', null, 'huangrh@ydbaidu.net', '13750555457', '07538589090', '2017-07-12 16:35:55', '2017-07-18 15:19:25', null);
INSERT INTO `wc_employees` VALUES ('2845', '55', null, '185', null, '营销顾问', '440', 'YDMZ0043', '张立勇', null, 'zhangly@ydbaidu.net', '13727603136', '07538589083', '2017-07-12 16:35:55', '2017-07-19 15:58:31', null);
INSERT INTO `wc_employees` VALUES ('2846', '55', null, '185', null, '营销顾问', '558', 'YDMZ0047', '钟青', null, 'zhongqing@ydbaidu.net', '13450746359', '07538589066', '2017-07-12 16:35:55', '2017-07-21 10:51:43', null);
INSERT INTO `wc_employees` VALUES ('2847', '55', null, '185', null, '营销顾问', '373', 'YDMZ0048', '陈金岸', null, 'chenja@ydbaidu.net', '18475055430', '07538589082', '2017-07-12 16:35:55', '2017-07-18 15:19:52', null);
INSERT INTO `wc_employees` VALUES ('2848', '55', null, '185', null, '营销顾问', '312', 'YDMZ0055', '黄彩艺', null, 'huangcy@ydbaidu.net', '13750591130', '07538589080', '2017-07-12 16:35:55', '2017-07-19 15:12:00', null);
INSERT INTO `wc_employees` VALUES ('2849', '55', null, '187', null, '市场专员', '366', 'YDMZ0062', '李卓臻', null, 'lizhzh@ydbaidu.net', '13723697136', '07538589098', '2017-07-12 16:35:55', '2017-07-18 15:20:10', null);
INSERT INTO `wc_employees` VALUES ('2850', '55', null, '185', null, '营销顾问', null, 'YDMZ0067', '李嘉妮', null, 'lijn@ydbaidu.net', null, '07538589162', '2017-07-12 16:35:55', '2017-08-09 11:08:00', '2017-08-09 11:08:00');
INSERT INTO `wc_employees` VALUES ('2851', '55', null, '185', null, '营销顾问', '367', 'YDMZ0068', '古成威', null, 'guchw@ydbaidu.net', '15899984276', '07538589097', '2017-07-12 16:35:55', '2017-07-18 15:20:28', null);
INSERT INTO `wc_employees` VALUES ('2852', '55', null, '185', null, '营销顾问', '425', 'YDMZ0069', '陈文兰', null, 'chenwl@ydbaidu.net', '13750520571', '07538589081', '2017-07-12 16:35:55', '2017-07-19 15:15:38', null);
INSERT INTO `wc_employees` VALUES ('2853', '56', null, '173', null, '人力行政主管', '365', 'YDCZ0002', '郭晓红', null, 'guoxh@ydbaidu.net', '13631346713', '2863504', '2017-07-12 17:16:11', '2017-07-15 11:22:49', null);
INSERT INTO `wc_employees` VALUES ('2854', '56', null, '173', null, '招聘专员', '363', 'YDCZ0003', '陈湘毅', null, 'chenxy@ydbaidu.net', '18688056699', '2863503', '2017-07-12 17:16:11', '2017-07-15 11:17:22', null);
INSERT INTO `wc_employees` VALUES ('2855', '56', null, '173', null, '培训专员', '364', 'YDCZ0004', '曾桓', null, 'zenghuan@ydbaidu.net', '13828395121', '2863502', '2017-07-12 17:16:11', '2017-07-15 11:22:51', null);
INSERT INTO `wc_employees` VALUES ('2856', '56', null, '174', null, '大区经理', '323', 'YDCZ0001', '韦朝浦', null, 'weizhp@ydbaidu.net', '15017520396', '2863505', '2017-07-12 17:16:11', '2017-07-13 16:32:57', null);
INSERT INTO `wc_employees` VALUES ('2857', '56', null, '174', null, '商务经理', '1039', 'YDCZ0005', '蔡依柳', null, 'caiyl@ydbaidu.net', '13592940600', '2863500', '2017-07-12 17:16:11', '2017-08-22 16:08:22', null);
INSERT INTO `wc_employees` VALUES ('2858', '56', null, '174', null, '商务经理', null, 'YDCZ0006', '蔡春宜', null, 'caichy@ydbaidu.net', '13690014371', '2863538', '2017-07-12 17:16:11', null, null);
INSERT INTO `wc_employees` VALUES ('2859', '56', null, '174', null, '大客户经理', null, 'YDCZ0008', '郭洽良', null, 'guoql@ydbaidu.net', '13531511144', '2863506', '2017-07-12 17:16:11', '2017-07-20 10:31:29', null);
INSERT INTO `wc_employees` VALUES ('2860', '56', null, '175', null, '市场专员', '922', 'YDCZ0015', '邱培玮', null, 'qiupw@ydbaidu.net', '18676863303', '2863516', '2017-07-12 17:16:11', '2017-08-07 09:37:59', null);
INSERT INTO `wc_employees` VALUES ('2861', '56', null, '173', null, '行政专员', '274', 'YDCZ0020', '郑天琪', null, 'zhengtq@ydbaidu.net', '13727954260', '0768-2863555', '2017-07-12 17:16:11', '2017-07-13 15:31:36', null);
INSERT INTO `wc_employees` VALUES ('2862', '56', null, '174', null, '大客户经理', null, 'YDCZ0022', '陈泽杰', null, 'chenzj@ydbaidu.net', '15707680504', '2863511', '2017-07-12 17:16:11', null, null);
INSERT INTO `wc_employees` VALUES ('2863', '56', null, '174', null, '高级营销顾问', null, 'YDCZ0026', '陈琪', null, 'chenqi@ydbaidu.net', '18207687417', '2863519', '2017-07-12 17:16:11', null, null);
INSERT INTO `wc_employees` VALUES ('2864', '56', null, '174', null, '大客户经理', null, 'YDCZ0028', '吴驰', null, 'wuchi@ydbaidu.net', '15521092347', '2863517', '2017-07-12 17:16:11', '2017-07-20 10:30:53', null);
INSERT INTO `wc_employees` VALUES ('2865', '56', null, '174', null, '营销顾问', null, 'YDCZ0031', '江慧娟', null, 'jianghj@ydbaidu.net', '13553762965', '2863512', '2017-07-12 17:16:11', '2017-07-20 10:31:13', null);
INSERT INTO `wc_employees` VALUES ('2866', '56', null, '174', null, '高级营销顾问', '339', 'YDCZ0034', '傅炯楠', null, 'fujn@ydbaidu.net', '15013512713', '2863515', '2017-07-12 17:16:11', '2017-07-20 10:31:04', null);
INSERT INTO `wc_employees` VALUES ('2867', '56', null, '174', null, '营销顾问', null, 'YDCZ0052', '林麟', null, 'linlin@ydbaidu.net', '13715839730', '2863518', '2017-07-12 17:16:11', '2017-07-13 15:32:08', null);
INSERT INTO `wc_employees` VALUES ('2868', '56', null, '174', null, '营销顾问', '328', 'YDCZ0053', '郑思鸿', null, 'zhengsh@ydbaidu.net', '15814900309', '2863509', '2017-07-12 17:16:11', '2017-07-24 15:37:37', null);
INSERT INTO `wc_employees` VALUES ('2869', '56', null, '174', null, '营销顾问', '337', 'YDCZ0054', '蔡卓聪', null, 'caizhc@ydbaidu.net', '17088849962', '2863510', '2017-07-12 17:16:11', '2017-07-14 14:07:46', null);
INSERT INTO `wc_employees` VALUES ('2870', '56', null, '174', null, '营销顾问', '606', 'YDCZ0055', '许晓佳', null, 'xuxj@ydbaidu.net', '13829035999', '2863524', '2017-07-12 17:16:11', '2017-07-24 15:46:46', null);
INSERT INTO `wc_employees` VALUES ('2871', '56', null, '174', null, '营销顾问', '302', 'YDCZ0056', '丁铄澄', null, 'dingshch@ydbaidu.net', '13531585434', '2863522', '2017-07-12 17:16:11', '2017-07-24 15:00:57', null);
INSERT INTO `wc_employees` VALUES ('2873', '54', null, '177', null, '总经理', null, 'YD001', '彭昌华', null, 'pengchh@ydbaidu.net', '13599902100', null, '2017-07-13 10:39:01', '2017-07-13 10:41:05', null);
INSERT INTO `wc_employees` VALUES ('2874', '40', null, '87', null, '策划专员（实习生）', '130', '12txm2232', '陈建彬', null, 'chenjianbin@xm12t.com', '15159576198', '3503345', '2017-07-14 15:08:15', '2017-07-26 16:37:51', null);
INSERT INTO `wc_employees` VALUES ('2875', '40', null, '88', null, '客户经理', null, '12txm2231', '方毅鸿', null, 'fangyihong@xm12t.com', null, '3503017', '2017-07-14 15:08:15', '2017-08-15 10:48:11', '2017-08-15 10:48:11');
INSERT INTO `wc_employees` VALUES ('2876', '40', null, '81', null, '客服', null, '12txm2233', '邹超斌', null, 'zhouchaobin@xm12t.com', '17704627191', '3503252', '2017-07-14 15:08:15', '2017-08-02 15:00:59', null);
INSERT INTO `wc_employees` VALUES ('2877', '40', null, '87', null, '策划专员', null, '12txm2234', '游潮彬', null, 'youchaobin@xm12t.com', null, null, '2017-07-14 15:08:15', '2017-07-25 11:09:23', '2017-07-25 11:09:23');
INSERT INTO `wc_employees` VALUES ('2878', '40', null, '81', null, '客服', '711', '12txm2235', '张淑娟', null, 'zhangshujuan@xm12t.com', '13419519521', '3503178', '2017-07-14 15:08:15', '2017-08-02 15:00:52', null);
INSERT INTO `wc_employees` VALUES ('2879', '40', null, '89', null, '客户经理', null, '12txm2236', '苏菡', null, 'suhan@xm2t.com', '13695903944', '3503304', '2017-07-14 15:08:15', '2017-08-02 15:00:40', null);
INSERT INTO `wc_employees` VALUES ('2880', '40', null, '89', null, '客户经理', '692', '12txm2237', '陈玉燕', null, 'chenyuyan@xmm12.com', '13015882852', '3503190', '2017-07-14 15:08:15', '2017-08-02 15:02:23', null);
INSERT INTO `wc_employees` VALUES ('2881', '40', null, '88', null, '客户经理', '225', '12txm2238', '庄冬耀', null, 'zhuangdongyao@xm12t.com', '13276977703', '3503302', '2017-07-14 15:08:15', '2017-08-02 15:02:16', null);
INSERT INTO `wc_employees` VALUES ('2882', '54', null, '119', null, '营销顾问', null, 'YDHZ0215', '张琪', null, 'zhangqi@ydbadiu.net', '15217705155', null, '2017-07-15 11:23:30', '2017-07-15 11:23:30', null);
INSERT INTO `wc_employees` VALUES ('2883', '54', null, '110', null, '营销顾问', '348', 'YDHZ0216', '付绍婷', null, 'fusht@ydbaidu.net', '13437619721', null, '2017-07-15 11:24:15', '2017-07-26 10:49:27', null);
INSERT INTO `wc_employees` VALUES ('2884', '54', null, '112', null, '营销顾问', null, 'YDHZ0217', '林俊豪', null, 'linjh@ydbaidu.net', null, null, '2017-07-15 11:25:45', '2017-08-15 10:24:26', '2017-08-15 10:24:26');
INSERT INTO `wc_employees` VALUES ('2885', '54', null, '106', null, '营销顾问', '621', 'YDHZ0220', '马锐滨', null, 'marb@ydbaidu.net', '15767979528', null, '2017-07-15 11:26:58', '2017-08-17 17:06:17', null);
INSERT INTO `wc_employees` VALUES ('2886', '54', null, '113', null, '营销顾问', '640', 'YDHZ0221', '陈玮楠', null, 'chenwn@ydbaidu.net', '13680743144', null, '2017-07-15 11:27:43', '2017-07-25 18:52:05', null);
INSERT INTO `wc_employees` VALUES ('2887', '54', null, '118', null, '营销顾问', null, 'YDHZ0222', '曾慧', null, 'zenghui@ydbaidu.net', null, null, '2017-07-15 11:31:00', '2017-08-11 16:04:55', '2017-08-11 16:04:55');
INSERT INTO `wc_employees` VALUES ('2888', '54', null, '105', null, '营销顾问', null, 'YDHZ0223', '龙峰', null, 'longfeng@ydbaidu.net', null, null, '2017-07-15 11:31:54', '2017-07-29 16:05:22', '2017-07-29 16:05:22');
INSERT INTO `wc_employees` VALUES ('2889', '54', null, '119', null, '营销顾问', '372', 'YDHZ0224', '卓惠霞', null, 'zhuohx@ydbaidu.net', '13692726347', null, '2017-07-17 11:07:58', '2017-07-17 15:02:41', null);
INSERT INTO `wc_employees` VALUES ('2890', '54', null, '112', null, '营销顾问', null, 'YDHZ0225', '赵步赞', null, 'zhaobz@ydbaidu.net', null, null, '2017-07-17 11:13:01', '2017-07-29 14:26:37', '2017-07-29 14:26:37');
INSERT INTO `wc_employees` VALUES ('2891', '55', null, '185', null, '营销顾问', null, 'YDMZ0070', '杨继', null, 'yangji@ydbaidu.net', null, '07538589167', '2017-07-17 15:50:07', '2017-08-16 09:59:05', '2017-08-16 09:59:05');
INSERT INTO `wc_employees` VALUES ('2892', '55', null, '185', null, '营销顾问', null, 'YDMZ0071', '张天通', null, 'zhangtt@ydbaidu.net', null, '07538589095', '2017-07-17 15:50:07', '2017-07-21 16:26:07', '2017-07-21 16:26:07');
INSERT INTO `wc_employees` VALUES ('2893', '55', null, '185', null, '营销顾问', null, 'YDMZ0072', '陈颖', null, 'chenying@ydbaidu.net', null, '07538589086', '2017-07-17 15:50:07', '2017-08-09 11:07:47', '2017-08-09 11:07:47');
INSERT INTO `wc_employees` VALUES ('2894', '55', null, '185', null, '营销顾问', null, 'YDMZ0073', '朱旭', null, 'zhuxu@ydbaidu.net', null, '07538589085', '2017-07-17 15:50:07', '2017-07-26 17:19:57', '2017-07-26 17:19:57');
INSERT INTO `wc_employees` VALUES ('2895', '55', null, '185', null, '营销顾问', '450', 'YDMZ0074', '邱伟鑫', null, 'qiuwx@ydbaidu.net', '15919344122', '07538589165', '2017-07-17 15:50:07', '2017-07-19 16:23:02', null);
INSERT INTO `wc_employees` VALUES ('2896', '56', null, '174', null, '营销顾问', null, 'YDCZ0060', '陈景炜', null, 'chenjw@ydbaidu.net', null, '0768-2863507', '2017-07-18 11:12:02', '2017-08-14 17:08:24', '2017-08-14 17:08:24');
INSERT INTO `wc_employees` VALUES ('2897', '56', null, '174', null, '营销顾问', '375', 'YDCZ0061', '林洽', null, 'linqia@ydbaidu.net', '15992337880', '0768-2863513', '2017-07-18 11:13:21', '2017-07-20 09:44:04', null);
INSERT INTO `wc_employees` VALUES ('2898', '55', null, '181', null, '行政专员', '1009', 'MZNM001', '侯小凤', null, 'houxf@ydbaidu.net', '13823893031', '07538589163', '2017-07-18 15:00:20', '2017-08-16 16:07:24', null);
INSERT INTO `wc_employees` VALUES ('2899', '55', null, '181', null, '运营专员', '1006', 'MZNM002', '黄丽卿', null, 'huanglq@ydbaidu.net', '13823852101', '07538589161', '2017-07-18 15:00:20', '2017-08-16 10:52:39', null);
INSERT INTO `wc_employees` VALUES ('2900', '55', null, '181', null, '销售主管', '441', 'MZNM004', '黎崇智', null, 'lichzh@ydbaidu.net', '18475055277', '07538589093', '2017-07-18 15:00:20', '2017-07-19 16:03:24', null);
INSERT INTO `wc_employees` VALUES ('2901', '55', null, '181', null, '销售专员', '394', 'MZNM008', '李月蓉', null, 'liyr@ydbaidu.net', '18219056474', '07538589067', '2017-07-18 15:00:20', '2017-07-19 09:15:26', null);
INSERT INTO `wc_employees` VALUES ('2902', '55', null, '181', null, '销售专员', null, 'MZNM010', '林桦', null, 'linhua@ydbaidu.net', null, '07538589087', '2017-07-18 15:00:20', '2017-08-16 09:58:58', '2017-08-16 09:58:58');
INSERT INTO `wc_employees` VALUES ('2903', '55', null, '181', null, '销售专员', null, 'MZNM011', '梁嘉沛', null, 'liangjp@ydbaidu.net', null, '07538589169', '2017-07-18 15:00:20', '2017-08-16 09:59:01', '2017-08-16 09:59:01');
INSERT INTO `wc_employees` VALUES ('2915', '54', null, '189', null, '百度糯米-销售运营总监', '380', 'YDHZ0012', '王雄', null, 'wangxiong@ydbaidu.net', '13502283710', null, '2017-07-18 15:33:41', '2017-07-18 16:09:21', null);
INSERT INTO `wc_employees` VALUES ('2916', '54', null, '189', null, '销售主管', '426', 'YDHZ0035', '冯锦雁', null, 'fengjinyan@ydbaidu.net', '13075298618', null, '2017-07-18 15:33:41', '2017-07-19 15:16:54', null);
INSERT INTO `wc_employees` VALUES ('2917', '54', null, '189', null, '销售主管', '432', 'YDHZ0115', '钟亚钊', null, 'zhongyazhao@ydbaidu.net', '15768656215', null, '2017-07-18 15:33:41', '2017-07-19 15:39:01', null);
INSERT INTO `wc_employees` VALUES ('2918', '54', null, '189', null, '销售专员', null, 'YDHZ0122', '刘垚', null, 'liuyao@ydbaidu.net', '15768617124', null, '2017-07-18 15:33:41', null, null);
INSERT INTO `wc_employees` VALUES ('2919', '54', null, '189', null, '运营主管', '494', 'YDHZ17001', '池浩', null, 'chihao@ydbaidu.net', '15815385010', null, '2017-07-18 15:33:41', '2017-07-20 16:52:39', null);
INSERT INTO `wc_employees` VALUES ('2920', '54', null, '189', null, '城市经理', '439', 'YDHZ17002', '钟振鸣', null, 'zhongzhenming@ydbaidu.net', '13592739787', null, '2017-07-18 15:33:41', '2017-07-19 15:57:00', null);
INSERT INTO `wc_employees` VALUES ('2921', '54', null, '189', null, '摄编', '1088', 'YDHZ17004', '胡俊臣', null, 'hujunchen@ydbaidu.net', '15875226886', null, '2017-07-18 15:33:41', '2017-08-22 15:12:29', null);
INSERT INTO `wc_employees` VALUES ('2922', '54', null, '189', null, '运营专员', '1059', 'YDHZ17005', '李智威', null, 'Lizhiwei@ydbaidu.net', '13413170331', null, '2017-07-18 15:33:41', '2017-08-22 15:09:59', null);
INSERT INTO `wc_employees` VALUES ('2923', '54', null, '189', null, '销售主管', '454', 'YDHZ17006', '梁于建', null, 'liangyujian@ydbaidu.net', '15017570189', null, '2017-07-18 15:33:41', '2017-07-19 18:02:01', null);
INSERT INTO `wc_employees` VALUES ('2924', '54', null, '189', null, '运营专员', '911', 'YDHZ17008', '李莉', null, 'lili@ydbaidu.net', '15815441544', null, '2017-07-18 15:33:41', '2017-08-07 09:04:58', null);
INSERT INTO `wc_employees` VALUES ('2925', '54', null, '189', null, '运营专员', '390', 'YDHZ17009', '梁伟雄', null, 'liangwx@ydbaidu.net', '13726247148', null, '2017-07-18 15:33:41', '2017-07-19 08:49:06', null);
INSERT INTO `wc_employees` VALUES ('2926', '54', null, '189', null, '销售专员', '436', 'YDHZ17011', '张嘉炫', null, 'zhangjiaxuan@ydbaidu.net', '18998089018', null, '2017-07-18 15:33:41', '2017-07-19 15:45:22', null);
INSERT INTO `wc_employees` VALUES ('2927', '54', null, '189', null, '销售专员', '447', 'YDHZ17012', '黄兆琪', null, 'huangzhaoqi@ydbaidu.net', '18320200434', null, '2017-07-18 15:33:41', '2017-07-19 16:12:48', null);
INSERT INTO `wc_employees` VALUES ('2928', '54', null, '189', null, '销售专员', null, 'YDHZ17013', '熊彬斌', null, 'xiongbinbin@ydbaidu.net', '18033090086', null, '2017-07-18 15:33:41', null, null);
INSERT INTO `wc_employees` VALUES ('2929', '54', null, '189', null, '客服专员', null, 'YDHZ17014', '邓敏', null, 'dengmin@ydbaidu.net', '15820400253', null, '2017-07-18 15:33:41', null, null);
INSERT INTO `wc_employees` VALUES ('2930', '54', null, '189', null, '客服专员', '893', 'YDHZ17016', '徐晓凤', null, 'xuxiaofeng@ydbaidu.net', '17607527619', null, '2017-07-18 15:33:41', '2017-08-07 08:32:04', null);
INSERT INTO `wc_employees` VALUES ('2931', '54', null, '189', null, '销售专员', null, 'YDHZ17017', '石睿', null, 'shirui@ydbaidu.net', '13574371589', null, '2017-07-18 15:33:41', null, null);
INSERT INTO `wc_employees` VALUES ('2932', '54', null, '189', null, '销售专员', '449', 'YDHZ17023', '黄志锐', null, 'huangzhirui@ydbaidu.net', '15816467080', null, '2017-07-18 15:33:41', '2017-07-19 16:22:26', null);
INSERT INTO `wc_employees` VALUES ('2933', '54', null, '189', null, '销售专员', null, 'YDHZ17025', '张家胜', null, 'zhangjsh@ydbaidu.net', '15811905663', null, '2017-07-18 15:33:41', null, null);
INSERT INTO `wc_employees` VALUES ('2934', '54', null, '189', null, '销售专员', null, 'YDHZ17026', '李凝', null, 'lining@ydbaidu.net', null, null, '2017-07-18 15:33:41', '2017-07-31 18:06:01', '2017-07-31 18:06:01');
INSERT INTO `wc_employees` VALUES ('2935', '54', null, '189', null, '销售专员', null, 'YDHZ17028', '张延新', null, 'zhangyx@ydbaidu.net', null, null, '2017-07-18 15:33:41', '2017-08-07 16:06:38', '2017-08-07 16:06:38');
INSERT INTO `wc_employees` VALUES ('2936', '54', null, '189', null, '销售专员', '431', 'YDHZ17029', '林焕铭', null, 'linhm@ydbaidu.net', '18316906758', null, '2017-07-18 15:33:41', '2017-07-19 15:38:58', null);
INSERT INTO `wc_employees` VALUES ('2937', '54', null, '189', null, '销售专员', null, 'YDHZ17031', '张逸飞', null, 'zhangyf@ydbaidu.net', null, null, '2017-07-18 15:33:41', '2017-08-03 09:45:23', '2017-08-03 09:45:23');
INSERT INTO `wc_employees` VALUES ('2938', '54', null, '189', null, '销售专员', null, 'YDHZ17033', '郭宇健', null, 'guoyj@ydbaidu.net', null, null, '2017-07-18 15:33:41', '2017-07-31 18:05:51', '2017-07-31 18:05:51');
INSERT INTO `wc_employees` VALUES ('2939', '54', null, '189', null, '销售专员', '434', 'YDHZ17034', '廖淼沣', null, 'liaomf@ydbaidu.net', '13750520276', null, '2017-07-18 15:33:41', '2017-07-19 16:05:26', null);
INSERT INTO `wc_employees` VALUES ('2940', '54', null, '189', null, '销售专员', '451', 'YDHZ17035', '陈少宽', null, 'chenshk@ydbaidu.net', '15767354637', null, '2017-07-18 15:33:41', '2017-07-19 16:28:34', null);
INSERT INTO `wc_employees` VALUES ('2941', '59', null, '188', null, '城市经理', '397', '12txm001', '王钰颖', null, 'wangyuying@ydbaidu.net', '13750495226', '0754-86940578', '2017-07-18 15:38:41', '2017-08-22 09:45:18', null);
INSERT INTO `wc_employees` VALUES ('2942', '59', null, '188', null, '城市主管', '395', '12txm002', '李佳杰', null, 'lijiajie@ydbaidu.net', '13512757976', '0754-86940578', '2017-07-18 15:39:00', '2017-07-19 09:25:40', null);
INSERT INTO `wc_employees` VALUES ('2943', '59', null, '188', null, '城市主管', '396', '12txm003', '林煜', null, 'linyu@ydbaidu.net', '13676111604', '0754-86940578', '2017-07-18 15:39:00', '2017-08-22 09:55:19', null);
INSERT INTO `wc_employees` VALUES ('2944', '59', null, '188', null, '城市主管', '457', '12txm004', '纪鹏升', null, 'jipengsheng@ydbaidu.net', '15914760427', '0754-86940578', '2017-07-18 15:39:00', '2017-08-22 09:50:18', null);
INSERT INTO `wc_employees` VALUES ('2945', '59', null, '188', null, '客户经理', '936', '12txm005', '王思东', null, 'wangsidong@ydbaidu.net', '18923928300', '0754-86940578', '2017-07-18 15:39:00', '2017-08-22 09:53:11', null);
INSERT INTO `wc_employees` VALUES ('2946', '59', null, '188', null, '客户经理', '427', '12txm006', '袁梓豪', null, 'yuanzihao@ydbaidu.net', '13580234204', '0754-86940578', '2017-07-18 15:39:00', '2017-07-19 15:25:21', null);
INSERT INTO `wc_employees` VALUES ('2947', '59', null, '188', null, '客户经理', '458', '12txm007', '郭晓雪', null, 'guoxiaoxue@ydbaidu.net', '13411934332', '0754-86940578', '2017-07-18 15:39:00', '2017-07-20 09:47:04', null);
INSERT INTO `wc_employees` VALUES ('2948', '59', null, '188', null, '客户经理', '456', '12txm008', '陈鹏', null, 'chenpeng@ydbaidu.net', '13612363249', '0754-86940578', '2017-07-18 15:39:00', '2017-07-20 09:35:05', null);
INSERT INTO `wc_employees` VALUES ('2949', '59', null, '188', null, '客户经理', '460', '12txm009', '林楷', null, 'linkai@ydbaidu.net', '13502978745', '0754-86940578', '2017-07-18 15:39:00', '2017-07-20 10:37:03', null);
INSERT INTO `wc_employees` VALUES ('2950', '59', null, '188', null, '客户经理', '462', '12txm010', '洪顺潮', null, 'hongshunchao@ydbaidu.net', '13112562212', '0754-86940578', '2017-07-18 15:39:00', '2017-08-22 09:52:21', null);
INSERT INTO `wc_employees` VALUES ('2951', '59', null, '188', null, '客户经理', '424', '12txm011', '林佳龙', null, 'linjialong@ydbaidu.net', '13542848747', '0754-86940578', '2017-07-18 15:39:00', '2017-08-22 09:53:00', null);
INSERT INTO `wc_employees` VALUES ('2952', '59', null, '188', null, '客户经理', '459', '12txm012', '许怡雯', null, 'xuyiwen@ydbaidu.net', '13433884699', '0754-86940578', '2017-07-18 15:39:00', '2017-08-22 09:50:34', null);
INSERT INTO `wc_employees` VALUES ('2953', '59', null, '188', null, '客户经理', '461', '12txm013', '郑丽君', null, 'zhenglijun@ydbaidu.net', '15814855123', '0754-86940578', '2017-07-18 15:39:00', '2017-07-20 10:44:28', null);
INSERT INTO `wc_employees` VALUES ('2954', '59', null, '188', null, '客户经理', '937', '12txm014', '王灿杰', null, 'wangcanjie@ydbaidu.net', '13612352833', '0754-86940578', '2017-07-18 15:39:00', '2017-08-22 11:08:23', null);
INSERT INTO `wc_employees` VALUES ('2955', '59', null, '188', null, '客户经理', '938', '12txm015', '王建庆', null, 'wangjianqing@ydbaidu.net', '15322625606', '0754-86940578', '2017-07-18 15:39:00', '2017-08-22 09:59:11', null);
INSERT INTO `wc_employees` VALUES ('2956', '59', null, '190', null, '行政专员', '904', '12txm016', '胡仪', null, 'huyi@ydbaidu.net', '13794126391', '0754-86940578', '2017-07-18 15:39:00', '2017-08-22 10:01:44', null);
INSERT INTO `wc_employees` VALUES ('2957', '59', null, '191', null, '运营专员', '1048', '12txm017', '毛春燕', null, 'maochunyan@ydbaidu.net', '15989708100', '0754-86940578', '2017-07-18 15:39:00', '2017-08-22 09:57:00', null);
INSERT INTO `wc_employees` VALUES ('2958', '59', null, '191', null, '运营专员', '423', '12txm018', '朱玉琼', null, 'zhuyuqiong@ydbaidu.net', '15768205850', '0754-86940578', '2017-07-18 15:39:00', '2017-07-19 15:02:18', null);
INSERT INTO `wc_employees` VALUES ('2959', '59', null, '191', null, '摄编', '926', '12txm019', '蔡文德', null, 'caiwende@ydbaidu.net', '15815237612', '0754-86940578', '2017-07-18 15:39:00', '2017-08-07 10:20:17', null);
INSERT INTO `wc_employees` VALUES ('2960', '59', null, '191', null, '客服专员', '437', '12txm020', '黄珣', null, 'huangxun@ydbaidu.net', '18607545055', '0754-86940578', '2017-07-18 15:39:00', '2017-07-19 15:49:19', null);
INSERT INTO `wc_employees` VALUES ('2961', '59', null, '191', null, '美工', '379', '12txm021', '陈树敏', null, 'chenshumin@ydbaidu.net', '18664488984', '0754-86940578', '2017-07-18 15:39:00', '2017-07-18 15:42:56', null);
INSERT INTO `wc_employees` VALUES ('2962', '60', null, '193', null, '城市经理', '386', 'JYNM0001', '李志平', null, 'lizhp@ydbaidu.net', '13192939699', null, '2017-07-18 16:12:03', '2017-07-19 15:58:28', null);
INSERT INTO `wc_employees` VALUES ('2963', '60', null, '192', null, '行政专员', '381', 'JYNM0011', '陈倩倩', null, 'chenqq@ydbaidu.net', '13129543212', '0663-2768070', '2017-07-18 16:12:03', '2017-07-18 16:22:37', null);
INSERT INTO `wc_employees` VALUES ('2964', '60', null, '195', null, '运营专员', '383', 'JYNM0012', '陈晓玲', null, 'chenxl@ydbaidu.net', '13729431211', null, '2017-07-18 16:12:03', '2017-07-18 16:52:26', null);
INSERT INTO `wc_employees` VALUES ('2965', '60', null, '193', null, '销售专员', null, 'JYNM0013', '罗海滨', null, 'luohb@ydbaidu.net', null, '0663-2768041', '2017-07-18 16:12:03', '2017-07-19 16:24:44', '2017-07-19 16:24:44');
INSERT INTO `wc_employees` VALUES ('2966', '60', null, '193', null, '销售专员', null, 'JYNM0014', '潘鸿林', null, 'panhl@ydbaidu.net', '18688414788', '0663-2768002', '2017-07-18 16:12:03', null, null);
INSERT INTO `wc_employees` VALUES ('2967', '60', null, '193', null, '销售专员', null, 'JYNM0015', '苏凯辉', null, 'sukh@ydbaidu.net  ', '13750079491', '0663-2768001', '2017-07-18 16:12:03', null, null);
INSERT INTO `wc_employees` VALUES ('2968', '60', null, '195', null, '客服专员', '387', 'JYNM0016', '黄艾冰', null, 'huangab@ydbaidu.net', '13610356629', '0663-2768024', '2017-07-18 16:12:03', '2017-07-18 18:08:35', null);
INSERT INTO `wc_employees` VALUES ('2969', '60', null, '193', null, '销售专员', null, 'JYNM0017', '陈思茵', null, 'chensy@ydbaidu.net ', null, '0663-2768021', '2017-07-18 16:12:03', '2017-08-16 11:19:10', '2017-08-16 11:19:10');
INSERT INTO `wc_employees` VALUES ('2970', '60', null, '193', null, '销售专员', '385', 'JYNM0018', '赖安娜', null, 'laian@ydbaidu.net ', '15975193395', '0663-2768005', '2017-07-18 16:12:03', '2017-07-18 18:09:11', null);
INSERT INTO `wc_employees` VALUES ('2971', '60', null, '193', null, '销售专员', '388', 'JYNM0019', '赖楚纯', null, 'laicc@ydbaidu.net ', '18312218572', '0663-2768006', '2017-07-18 16:12:03', '2017-07-18 18:10:34', null);
INSERT INTO `wc_employees` VALUES ('2972', '60', null, '193', null, '销售专员', null, 'JYNM0020', '王耿彬', null, 'wanggb@ydbaidu.net', null, '0663-2768042', '2017-07-18 16:12:03', '2017-08-16 11:19:04', '2017-08-16 11:19:04');
INSERT INTO `wc_employees` VALUES ('2973', '56', null, '197', null, '城市经理', '433', 'CZNM0001', '陈思权', null, 'chensq@ydbaidu.net', '18948480809', '0768-2863550', '2017-07-18 17:10:12', '2017-07-19 15:40:57', null);
INSERT INTO `wc_employees` VALUES ('2974', '56', null, '197', null, '销售专员', '945', 'CZNM0003', '朱伟锐', null, 'zhuwr@ydbaidu.net', '13144466876', '0768-2863544', '2017-07-18 17:10:12', '2017-08-07 14:42:47', null);
INSERT INTO `wc_employees` VALUES ('2975', '56', null, '197', null, '运营专员', null, 'CZNM0004', '朱荣', null, 'zhurong@ydbaidu.net', '13715710314', '0768-2863526', '2017-07-18 17:10:12', null, null);
INSERT INTO `wc_employees` VALUES ('2976', '56', null, '197', null, '销售主管', '479', 'CZNM0005', '丁草嫚', null, 'dingcm@ydbaidu.net', '13690014865', '0768-2863545', '2017-07-18 17:10:12', '2017-08-07 11:10:59', null);
INSERT INTO `wc_employees` VALUES ('2977', '56', null, '197', null, '摄编', null, 'CZNM0008', '卢述杭', null, 'lushh@ydbaidu.net', '15812688464', '0768-2863549', '2017-07-18 17:10:12', null, null);
INSERT INTO `wc_employees` VALUES ('2978', '56', null, '197', null, '销售专员', '961', 'CZNM0009', '刘格锶', null, 'liugs@ydbaidu.net', '15218530844', '0768-2863546', '2017-07-18 17:10:12', '2017-08-22 15:20:38', null);
INSERT INTO `wc_employees` VALUES ('2979', '56', null, '197', null, '运营专员', '1054', 'CZNM0011', '林思岑', null, 'linsc@ydbaidu.net', '15994989206', '0768-2863528', '2017-07-18 17:10:12', '2017-08-22 11:44:42', null);
INSERT INTO `wc_employees` VALUES ('2980', '56', null, '197', null, '销售专员', '944', 'CZNM0013', '温建略', null, 'wenjl@ydbaidu.net', '13632020283', '0768-2863547', '2017-07-18 17:10:12', '2017-08-07 14:44:44', null);
INSERT INTO `wc_employees` VALUES ('2981', '56', null, '197', null, '客服专员', '1052', 'CZNM0014', '林少洁', null, 'linsj@ydbaidu.net', '13660270766', '0768-2863543', '2017-07-18 17:10:12', '2017-08-22 15:11:16', null);
INSERT INTO `wc_employees` VALUES ('2982', '56', null, '197', null, '销售专员', null, 'CZNM0015', '丁幼冰', null, 'dingyb@ydbaidu.net', null, '0678-2863529', '2017-07-18 17:10:12', '2017-07-31 09:51:37', '2017-07-31 09:51:37');
INSERT INTO `wc_employees` VALUES ('2983', '56', null, '197', null, '销售专员', '1086', 'CZNM0016', '丁奕浩', null, 'dingyh@ydbaidu.net', '13727921630', '0768-2863546', '2017-07-18 17:10:12', '2017-08-22 15:16:28', null);
INSERT INTO `wc_employees` VALUES ('3005', '61', null, '204', null, '销售主管', '391', 'SWNM0010', '苏章航', null, 'suzhh@ydbaidu.net', '13411060098', null, '2017-07-19 09:31:21', '2017-07-19 10:11:24', null);
INSERT INTO `wc_employees` VALUES ('3006', '61', null, '204', null, '销售专员', '401', 'SWNM0003', '徐炳强', null, 'xubq@ydbaidu.net', '13428208584', null, '2017-07-19 09:31:21', '2017-07-19 10:16:04', null);
INSERT INTO `wc_employees` VALUES ('3007', '61', null, '204', null, '销售主管', '336', 'SWNM0004', '陈泽霖', null, 'chenzl@ydbaidu.net', '18927961465', null, '2017-07-19 09:31:21', '2017-07-19 10:17:48', null);
INSERT INTO `wc_employees` VALUES ('3008', '61', null, '204', null, '销售专员', null, 'SWNM0014', '陈丽丽', null, 'chenll@ydbaidu.net', '13699893930', null, '2017-07-19 09:31:21', null, null);
INSERT INTO `wc_employees` VALUES ('3009', '61', null, '204', null, '销售专员', '402', 'SWNM0019', '刘发洋', null, 'liufy@ydbaidu.net', '13536487744', null, '2017-07-19 09:31:21', '2017-07-19 10:16:14', null);
INSERT INTO `wc_employees` VALUES ('3010', '61', null, '205', null, '行政专员', '392', 'SWNM0002', '方贤莹珠', null, 'fangxyz@ydbaidu.net', '13652998411', '0660-3259166', '2017-07-19 09:31:21', '2017-07-19 09:37:21', null);
INSERT INTO `wc_employees` VALUES ('3011', '61', null, '206', null, '运营专员', '403', 'SWNM0017', '钟美如', null, 'zhongmr@ydbaidu.net', '15019574101', null, '2017-07-19 09:31:21', '2017-07-19 10:20:16', null);
INSERT INTO `wc_employees` VALUES ('3012', '61', null, '206', null, '摄影编辑', '398', 'SWNM0005', '黄守威', null, 'huangsw@ydbaidu.net', '13242418520', null, '2017-07-19 09:31:21', '2017-07-19 10:16:43', null);
INSERT INTO `wc_employees` VALUES ('3013', '61', null, '206', null, '客服专员', '399', 'SWNM0018', '张小雁', null, 'pengxd@ydbaidu.net', '13680963314', null, '2017-07-19 09:31:21', '2017-07-19 10:11:53', null);
INSERT INTO `wc_employees` VALUES ('3014', '61', null, '204', null, '城市经理', '963', 'SWNM0001', '彭晓东', null, 'pengxd@ydbaidu.net', '13421500112', null, '2017-07-19 09:31:21', '2017-08-07 16:37:09', null);
INSERT INTO `wc_employees` VALUES ('3015', '61', null, '206', null, '客服专员', '400', 'SWNM0020', '李妙宇', null, 'limy@ydbaidu.net', '18219181199', null, '2017-07-19 09:31:21', '2017-07-19 10:11:10', null);
INSERT INTO `wc_employees` VALUES ('3016', '56', null, '174', null, '营销顾问', '443', 'YDCZ0062', '邱润佳', null, 'qiurj@ydbaidu.net', '15992371629', '2863514', '2017-07-19 15:35:01', '2017-07-24 15:29:11', null);
INSERT INTO `wc_employees` VALUES ('3017', '56', null, '174', null, '营销顾问', '444', 'YDCZ0063', '严泽琳', null, 'yanzl@ydbaidu.net', '13612442700', '2863520', '2017-07-19 15:36:00', '2017-07-20 11:44:11', null);
INSERT INTO `wc_employees` VALUES ('3018', '57', null, '172', null, '试用营销顾问', null, 'YDST0129', '许佳燕', null, 'xujy@ydbaidu.net', null, null, '2017-07-20 15:28:56', '2017-08-03 10:58:05', '2017-08-03 10:58:05');
INSERT INTO `wc_employees` VALUES ('3019', '49', null, '144', null, '客户经理', null, '12tly412', '陈鹏坤', null, 'chenkunpeng@xm12t.com', null, '5312101', '2017-07-21 09:02:58', '2017-08-16 10:12:01', '2017-08-16 10:12:01');
INSERT INTO `wc_employees` VALUES ('3020', '49', null, '139', null, '客户经理', '465', '12tly413', '郑金祥', null, 'zhengjinxiang@xm12t.com', '18650832058', '5312509', '2017-07-21 09:09:11', '2017-07-26 17:27:46', null);
INSERT INTO `wc_employees` VALUES ('3021', '45', '19', null, null, '财务部出纳', null, 't00003', '一二三', null, null, null, null, '2017-07-22 11:21:44', '2017-07-24 14:23:14', null);
INSERT INTO `wc_employees` VALUES ('3022', '54', null, '116', null, '营销顾问', null, 'YDHZ0226', '赖庆城', null, 'laiqch@ydbaidu.net', null, null, '2017-07-24 10:24:29', '2017-08-01 17:13:15', '2017-08-01 17:13:15');
INSERT INTO `wc_employees` VALUES ('3023', '55', null, '185', null, '营销顾问', '827', 'YDMZ0075', '李荣宏', null, 'lirh@ydbaidu.net', '13824570360', '07538589095', '2017-07-24 15:09:54', '2017-08-16 15:58:25', null);
INSERT INTO `wc_employees` VALUES ('3054', '40', null, '81', null, '客服', '805', '12txm2240', '周丽李', null, 'zhoulili2@xm12t.com', '15280637891', '3503282', '2017-07-25 11:18:28', '2017-08-02 14:59:34', null);
INSERT INTO `wc_employees` VALUES ('3055', '40', null, '88', null, '营销顾问', null, '12txm2242', '陈淑婷', null, 'chenshuting@xm12t.com', null, null, '2017-07-25 11:18:28', '2017-08-02 10:29:27', '2017-08-02 10:29:27');
INSERT INTO `wc_employees` VALUES ('3056', '40', null, '81', null, '客服专员', null, '12txm2241', '肖玉金', null, 'xiaoyujin@xm12t.com', null, '3503080', '2017-07-25 11:18:28', '2017-08-02 10:31:30', '2017-08-02 10:31:30');
INSERT INTO `wc_employees` VALUES ('3057', '40', null, '81', null, '客服', '804', '12txm2243', '刘美', null, 'liumei@xm12t.com', '15280218665', '3503225', '2017-07-25 11:18:28', '2017-08-02 14:59:42', null);
INSERT INTO `wc_employees` VALUES ('3058', '40', null, '81', null, '客服', null, '12txm2244', '陆斌强', null, 'lubinqiang@xm12t.com', null, '3503260', '2017-07-25 11:18:28', '2017-08-09 10:32:10', '2017-08-09 10:32:10');
INSERT INTO `wc_employees` VALUES ('3059', '40', null, '81', null, '客服', '801', '12txm2245', '金静茹', null, 'jinjingru@xm12t.com', '13666086759', '3503146', '2017-07-25 11:18:28', '2017-08-02 15:00:00', null);
INSERT INTO `wc_employees` VALUES ('3060', '40', null, '81', null, '客服专员', null, '12txm2246', '武南翔', null, 'wunanxiang@xm12t.com', null, '3503742', '2017-07-25 11:18:28', '2017-08-02 10:31:44', '2017-08-02 10:31:44');
INSERT INTO `wc_employees` VALUES ('3061', '40', null, '81', null, '客服', '739', '12txm2247', '张新朝', null, 'zhangxinchao@xm12t.com', '18750817726', '3503187', '2017-07-25 11:18:28', '2017-08-02 15:00:08', null);
INSERT INTO `wc_employees` VALUES ('3062', '40', null, '88', null, '客户经理', '615', '12txm2248', '陈燕冰', null, 'chenyanbing@xm12t.com', '13063030160', '3503123', '2017-07-25 11:18:28', '2017-08-02 15:00:19', null);
INSERT INTO `wc_employees` VALUES ('3063', '40', null, '87', null, '客户支持', '886', '12txm2249', '高曼曼', null, 'gaomanman@xm12t.com', '13860406442', '3503528', '2017-07-25 11:18:28', '2017-08-05 11:56:44', null);
INSERT INTO `wc_employees` VALUES ('3064', '55', null, '185', null, '营销顾问', null, 'YDMZ0076', '王耿华', null, 'wanggh@ydbaidu.net', null, '07538589168', '2017-07-25 14:21:56', '2017-07-26 09:17:37', '2017-07-26 09:17:37');
INSERT INTO `wc_employees` VALUES ('3065', '54', null, '118', null, '营销顾问', null, 'YDHZ0227', '黄锦乐', null, 'huangjinle@ydbaidu.net', null, null, '2017-07-25 15:16:11', '2017-07-28 16:59:45', '2017-07-28 16:59:45');
INSERT INTO `wc_employees` VALUES ('3066', '62', null, '208', null, null, null, 'a01', '111', null, null, null, null, '2017-07-26 09:18:56', '2017-07-26 09:20:32', null);
INSERT INTO `wc_employees` VALUES ('3067', '62', null, '211', null, '经理', null, '12txm001', '员工1', null, 'text@xm12t.com', '1345484554', '1234567', '2017-07-26 09:27:20', '2017-07-26 16:33:19', null);
INSERT INTO `wc_employees` VALUES ('3068', '62', null, '211', null, '主管', null, '12txm002', '员工2', null, 'text@xm13t.com', '1345484555', '1234568', '2017-07-26 09:27:20', '2017-07-26 09:50:12', null);
INSERT INTO `wc_employees` VALUES ('3069', '62', null, '211', null, '助理', '656', '12txm003', '员工3', null, 'text@xm14t.com', '1345484556', '1234569', '2017-07-26 09:27:20', '2017-07-26 11:27:26', null);
INSERT INTO `wc_employees` VALUES ('3070', '62', null, '212', null, '经理', null, '12txm004', '员工4', null, 'text@xm15t.com', '1345484557', '1234570', '2017-07-26 09:27:20', null, null);
INSERT INTO `wc_employees` VALUES ('3071', '62', null, '212', null, '主管', null, '12txm005', '员工5', null, 'text@xm16t.com', '1345484558', '1234571', '2017-07-26 09:27:20', null, null);
INSERT INTO `wc_employees` VALUES ('3072', '62', null, '212', null, '助理', null, '12txm006', '员工6', null, 'text@xm17t.com', '1345484559', '1234572', '2017-07-26 09:27:20', null, null);
INSERT INTO `wc_employees` VALUES ('3073', '62', null, '212', null, '实习生', null, '12txm007', '员工7', null, 'text@xm18t.com', '1345484560', '05921234567', '2017-07-26 09:27:20', null, null);
INSERT INTO `wc_employees` VALUES ('3074', '62', null, null, null, '经理', null, '12txm008', '员工8', null, 'text@xm19t.com', '1345484561', '05921234567', '2017-07-26 09:27:20', null, null);
INSERT INTO `wc_employees` VALUES ('3075', '62', null, null, null, '主管', null, '12txm009', '员工9', null, 'text@xm20t.com', '1345484562', '05921234567', '2017-07-26 09:27:20', null, null);
INSERT INTO `wc_employees` VALUES ('3076', '62', null, null, null, '助理', null, '12txm010', '员工10', null, 'text@xm21t.com', '1345484563', '05921234567', '2017-07-26 09:27:20', null, null);
INSERT INTO `wc_employees` VALUES ('3077', '63', null, null, null, null, null, '1a', 'a', null, null, null, null, '2017-07-26 11:16:15', '2017-07-26 11:16:15', null);
INSERT INTO `wc_employees` VALUES ('3078', '63', null, null, null, null, null, '12t1', 'aaa', null, null, null, null, '2017-07-26 11:16:42', '2017-07-26 11:16:42', null);
INSERT INTO `wc_employees` VALUES ('3079', '63', null, null, null, null, null, '11', 'dd ', null, null, null, null, '2017-07-26 11:19:24', '2017-07-26 11:19:24', null);
INSERT INTO `wc_employees` VALUES ('3080', '62', null, null, null, 'ss', null, 'ss', 'ss', null, null, null, null, '2017-07-26 11:19:38', '2017-07-26 11:19:38', null);
INSERT INTO `wc_employees` VALUES ('3081', '65', null, '217', null, '经理', '664', '12txm001', '员工1', null, 'text@xm12t.com', '13488880000', '1234567', '2017-07-26 14:14:34', '2017-07-26 14:16:48', null);
INSERT INTO `wc_employees` VALUES ('3082', '65', null, '217', null, '主管', null, '12txm002', '员工2', null, 'text@xm13t.com', '13488880001', '1234568', '2017-07-26 14:14:34', null, null);
INSERT INTO `wc_employees` VALUES ('3083', '65', null, '217', null, '助理', null, '12txm003', '员工3', null, 'text@xm14t.com', '13488880003', '1234569', '2017-07-26 14:14:34', null, null);
INSERT INTO `wc_employees` VALUES ('3084', '65', null, '218', null, '经理', null, '12txm004', '员工4', null, 'text@xm15t.com', '13488880004', '1234570', '2017-07-26 14:14:34', null, null);
INSERT INTO `wc_employees` VALUES ('3085', '65', null, '218', null, '主管', null, '12txm005', '员工5', null, 'text@xm16t.com', '13488880005', '1234571', '2017-07-26 14:14:34', null, null);
INSERT INTO `wc_employees` VALUES ('3086', '65', null, '218', null, '助理', null, '12txm006', '员工6', null, 'text@xm17t.com', '13488880006', '1234572', '2017-07-26 14:14:34', null, null);
INSERT INTO `wc_employees` VALUES ('3087', '65', null, '218', null, '实习生', null, '12txm007', '员工7', null, 'text@xm18t.com', null, '05921234567', '2017-07-26 14:14:34', '2017-07-26 14:15:37', null);
INSERT INTO `wc_employees` VALUES ('3088', '52', null, '93', null, '经理', null, 'a01', '员工1', null, 'text@xm1t.com', null, '1234567', '2017-07-26 16:09:35', '2017-07-26 16:12:19', '2017-07-26 16:12:19');
INSERT INTO `wc_employees` VALUES ('3089', '52', null, '93', null, '主管', null, 'a02', '员工2', null, 'text@xm2t.com', null, '1234568', '2017-07-26 16:09:35', '2017-07-26 16:12:48', '2017-07-26 16:12:48');
INSERT INTO `wc_employees` VALUES ('3090', '52', null, '94', null, '经理', null, 'a03', '员工3', null, 'text@xm3t.com', null, '1234570', '2017-07-26 16:09:35', '2017-07-26 16:12:35', '2017-07-26 16:12:35');
INSERT INTO `wc_employees` VALUES ('3091', '52', null, '94', null, '主管', null, 'a04', '员工4', null, 'text@xm4t.com', null, '1234571', '2017-07-26 16:09:35', '2017-07-26 16:12:29', '2017-07-26 16:12:29');
INSERT INTO `wc_employees` VALUES ('3092', '52', null, '95', null, '主管', null, 'a05', '员工5', null, 'text@xm5t.com', null, '05921234567', '2017-07-26 16:09:35', '2017-07-26 16:12:27', '2017-07-26 16:12:27');
INSERT INTO `wc_employees` VALUES ('3093', '52', null, '95', null, '助理', null, 'a06', '员工6', null, 'text@xm6t.com', null, '05921234567', '2017-07-26 16:09:35', '2017-07-26 16:12:24', '2017-07-26 16:12:24');
INSERT INTO `wc_employees` VALUES ('3094', '48', null, '128', null, '客户经理', '787', '12tzz426', '陈健中', null, 'chenjianzhong@xm12t.com', '13709355481', '0596-6166033', '2017-07-27 09:22:47', '2017-08-05 09:46:50', null);
INSERT INTO `wc_employees` VALUES ('3095', '48', null, '132', null, '会计', '634', '12tzz427', '洪梦如', null, 'hongmengru@xm12t.com', '18759690130', '0596-6166629', '2017-07-27 09:24:18', '2017-08-05 09:56:23', null);
INSERT INTO `wc_employees` VALUES ('3096', '48', null, '129', null, '客户经理', null, '12tzz428', '张娇燕', null, 'zhangjiaoyan@xm12t.com', null, '0596-6166653', '2017-07-27 09:25:29', '2017-08-03 13:44:51', '2017-08-03 13:44:51');
INSERT INTO `wc_employees` VALUES ('3097', '54', null, '115', null, '营销顾问', null, 'YDHZ0228', '欧阳俊', null, 'ouyangjun@ydbaidu.net', '13533220331', null, '2017-07-27 14:24:08', '2017-07-27 14:24:08', null);
INSERT INTO `wc_employees` VALUES ('3098', '54', null, '115', null, '营销顾问', null, 'YDHZ0229', '唐彧兵', null, 'tangyb@ydbaidu.net', null, null, '2017-07-27 14:24:58', '2017-08-03 09:45:10', '2017-08-03 09:45:10');
INSERT INTO `wc_employees` VALUES ('3099', '54', null, '119', null, '营销顾问', null, 'YDHZ0230', '周德怀', null, 'zhoudh@ydbaidu.net', null, null, '2017-07-27 14:25:41', '2017-08-07 15:35:09', '2017-08-07 15:35:09');
INSERT INTO `wc_employees` VALUES ('3100', '54', null, '105', null, '营销顾问', '1084', 'YDHZ0231', '李智杰', null, 'lizhj@ydbaidu.net', '15914546241', null, '2017-07-28 17:07:40', '2017-08-22 15:08:14', null);
INSERT INTO `wc_employees` VALUES ('3101', '67', null, '223', null, '主管', '843', '12txm001', '兰晓', null, 'text@xm12t.com', '13812345678', '05921586325', '2017-07-29 11:06:16', '2017-07-29 11:14:02', null);
INSERT INTO `wc_employees` VALUES ('3102', '67', null, '223', null, '经理', null, '12txm002', '刘晨', null, 'text@xm13t.com', '13912345689', '05924578925', '2017-07-29 11:06:16', null, null);
INSERT INTO `wc_employees` VALUES ('3103', '67', null, '223', null, '助理', null, '12txm003', '蔡洪', null, 'text@xm14t.com', '13812025678', '05925748925', '2017-07-29 11:06:16', null, null);
INSERT INTO `wc_employees` VALUES ('3104', '67', null, '224', null, '客服', null, '12txm004', '张洁', null, 'text@xm15t.com', '13912347851', '05928588925', '2017-07-29 11:06:16', null, null);
INSERT INTO `wc_employees` VALUES ('3105', '67', null, '224', null, '主管', null, '12txm005', '石光辉', null, 'text@xm16t.com', '13812345678', '05924578989', '2017-07-29 11:06:16', null, null);
INSERT INTO `wc_employees` VALUES ('3106', '67', null, '224', null, '售后', null, '12txm006', '程伟', null, 'text@xm17t.com', '13917851222', '05924325245', '2017-07-29 11:06:16', null, null);
INSERT INTO `wc_employees` VALUES ('3107', '67', null, '224', null, '实习生', null, '12txm007', '金一兴', null, 'text@xm18t.com', '13825874522', '05929874567', '2017-07-29 11:06:16', null, null);
INSERT INTO `wc_employees` VALUES ('3108', '67', null, '225', null, '技术', null, '12txm008', '邱梅丽', null, 'text@xm19t.com', '18912785678', '05922356544', '2017-07-29 11:06:16', null, null);
INSERT INTO `wc_employees` VALUES ('3109', '67', null, '225', null, '网管', null, '12txm009', '曾小文', null, 'text@xm20t.com', '18245895542', '05924578122', '2017-07-29 11:06:16', null, null);
INSERT INTO `wc_employees` VALUES ('3110', '67', null, '225', null, '美工', null, '12txm010', '蔡可人', null, 'text@xm21t.com', '13912345678', '05929523367', '2017-07-29 11:06:16', null, null);
INSERT INTO `wc_employees` VALUES ('3111', '54', null, '115', null, '营销顾问', null, 'YDHZ0232', '邱伯通', null, 'qiubt@ydbaidu.net', null, null, '2017-07-31 09:11:06', '2017-08-09 17:18:56', '2017-08-09 17:18:56');
INSERT INTO `wc_employees` VALUES ('3112', '56', null, '197', null, '销售专员', '1083', 'CZNM0017', '林玉敏', null, 'linym@ydbaidu.net', '15218859845', '0768-2863544', '2017-07-31 09:51:19', '2017-08-22 15:07:32', null);
INSERT INTO `wc_employees` VALUES ('3113', '52', null, '227', null, '经理', null, '12txm011', '员工11', null, 'tousu@xm12t.com', null, '0592-3503777', '2017-07-31 10:41:54', '2017-07-31 10:42:12', '2017-07-31 10:42:12');
INSERT INTO `wc_employees` VALUES ('3114', '52', null, '227', null, '主管', null, '12txm012', '员工12', null, 'tousu@xm12t.com', null, '0592-3503777', '2017-07-31 10:41:54', '2017-07-31 10:42:15', '2017-07-31 10:42:15');
INSERT INTO `wc_employees` VALUES ('3115', '52', null, '227', null, '助理', null, '12txm013', '员工13', null, 'tousu@xm12t.com', null, '0592-3503777', '2017-07-31 10:41:54', '2017-07-31 10:42:18', '2017-07-31 10:42:18');
INSERT INTO `wc_employees` VALUES ('3116', '52', null, '228', null, '经理', null, '12txm014', '员工14', null, 'tousu@xm12t.com', null, '0592-3503777', '2017-07-31 10:41:54', '2017-07-31 10:42:21', '2017-07-31 10:42:21');
INSERT INTO `wc_employees` VALUES ('3117', '52', null, '228', null, '主管', null, '12txm015', '员工15', null, 'tousu@xm12t.com', null, '0592-3503777', '2017-07-31 10:41:54', '2017-07-31 10:42:23', '2017-07-31 10:42:23');
INSERT INTO `wc_employees` VALUES ('3118', '52', null, '228', null, '助理', null, '12txm016', '员工16', null, 'tousu@xm12t.com', null, '0592-3503777', '2017-07-31 10:41:54', '2017-07-31 10:42:25', '2017-07-31 10:42:25');
INSERT INTO `wc_employees` VALUES ('3119', '52', null, '229', null, '实习生', null, '12txm017', '员工17', null, 'tousu@xm12t.com', null, '0592-3503777', '2017-07-31 10:41:54', '2017-07-31 10:42:28', '2017-07-31 10:42:28');
INSERT INTO `wc_employees` VALUES ('3120', '52', null, '229', null, '经理', null, '12txm018', '员工18', null, 'tousu@xm12t.com', null, '0592-3503777', '2017-07-31 10:41:54', '2017-07-31 10:42:30', '2017-07-31 10:42:30');
INSERT INTO `wc_employees` VALUES ('3121', '52', null, '229', null, '主管', null, '12txm019', '员工19', null, 'tousu@xm12t.com', null, '0592-3503777', '2017-07-31 10:41:54', '2017-07-31 10:42:32', '2017-07-31 10:42:32');
INSERT INTO `wc_employees` VALUES ('3122', '52', null, '229', null, '主管', null, '12txm020', '员工20', null, 'tousu@xm12t.com', null, '0592-3503777', '2017-07-31 10:41:54', '2017-07-31 10:42:34', '2017-07-31 10:42:34');
INSERT INTO `wc_employees` VALUES ('3123', '52', null, '93', null, '经理', null, '12tcs001', '员工1', 'uploads/company/52/employees/12tcs001/img1502335685.jpg', 'tousu@xm12t.com1', '13811111111', '0592-3503777', '2017-07-31 10:43:06', '2017-08-10 11:28:05', null);
INSERT INTO `wc_employees` VALUES ('3124', '52', '20', '93', null, '主管', null, '12tcs002', '员工2', 'uploads/company/52/employees/12tcs002/img1502335578.jpg', 'tousu@xm12t.com2', '13811111112', '0592-3503777', '2017-07-31 10:43:06', '2017-08-10 11:26:18', null);
INSERT INTO `wc_employees` VALUES ('3125', '52', '21', '93', null, '助理', null, '12tcs003', '员工3', 'uploads/company/52/employees/12tcs003/img1502335708.jpg', 'tousu@xm12t.com3', '13811111113', '0592-3503777', '2017-07-31 10:43:06', '2017-08-10 11:28:28', null);
INSERT INTO `wc_employees` VALUES ('3126', '52', '22', '94', null, '经理', null, '12tcs004', '员工4', 'uploads/company/52/employees/12tcs004/img1502335725.jpg', 'tousu@xm12t.com4', '13811111114', '0592-3503777', '2017-07-31 10:43:06', '2017-08-10 11:28:45', null);
INSERT INTO `wc_employees` VALUES ('3127', '52', '23', '94', null, '主管', null, '12tcs005', '员工5', null, 'tousu@xm12t.com5', '13811111115', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 10:48:37', null);
INSERT INTO `wc_employees` VALUES ('3128', '52', '24', '94', null, '助理', null, '12tcs006', '员工6', null, 'tousu@xm12t.com6', '13811111116', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 10:48:52', null);
INSERT INTO `wc_employees` VALUES ('3129', '52', '25', '94', null, '实习生', null, '12tcs007', '员工7', null, 'tousu@xm12t.com7', '13811111117', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 10:49:09', null);
INSERT INTO `wc_employees` VALUES ('3130', '52', '26', '95', null, '经理', null, '12tcs008', '员工8', null, 'tousu@xm12t.com8', '13811111118', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 10:49:20', null);
INSERT INTO `wc_employees` VALUES ('3131', '52', '27', '95', null, '主管', null, '12tcs009', '员工9', null, 'tousu@xm12t.com9', '13811111119', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 10:49:32', null);
INSERT INTO `wc_employees` VALUES ('3132', '52', '28', '95', null, '助理', null, '12tcs010', '员工10', null, 'tousu@xm12t.com10', '13811111110', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 10:49:48', null);
INSERT INTO `wc_employees` VALUES ('3133', '52', '29', '227', null, '经理', null, '12tcs011', '员工11', null, 'tousu@xm12t.com11', '13811111121', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 10:50:09', null);
INSERT INTO `wc_employees` VALUES ('3134', '52', '30', '227', null, '主管', null, '12tcs012', '员工12', null, 'tousu@xm12t.com12', '13811111122', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 10:50:27', null);
INSERT INTO `wc_employees` VALUES ('3135', '52', '31', '227', null, '助理', null, '12tcs013', '员工13', null, 'tousu@xm12t.com13', '13811111123', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 10:50:38', null);
INSERT INTO `wc_employees` VALUES ('3136', '52', '32', '228', null, '经理', null, '12tcs014', '员工14', null, 'tousu@xm12t.com14', '13811111124', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 10:50:48', null);
INSERT INTO `wc_employees` VALUES ('3137', '52', '33', '228', null, '主管', null, '12tcs015', '员工15', null, 'tousu@xm12t.com15', '13811111125', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 10:51:01', null);
INSERT INTO `wc_employees` VALUES ('3138', '52', '34', '228', null, '助理', null, '12tcs016', '员工16', null, 'tousu@xm12t.com16', '13811111126', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 10:51:16', null);
INSERT INTO `wc_employees` VALUES ('3139', '52', '35', '229', null, '实习生', null, '12tcs017', '员工17', null, 'tousu@xm12t.com17', '13811111127', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 17:30:14', null);
INSERT INTO `wc_employees` VALUES ('3140', '52', '36', '229', null, '经理', null, '12tcs018', '员工18', null, 'tousu@xm12t.com18', '13811111128', '0592-3503777', '2017-07-31 10:43:06', '2017-07-31 17:30:24', null);
INSERT INTO `wc_employees` VALUES ('3141', '52', null, '229', null, '主管', null, '12tcs019', '员工19', null, 'tousu@xm12t.com', '13811111129', '0592-3503777', '2017-07-31 10:43:06', null, null);
INSERT INTO `wc_employees` VALUES ('3142', '52', null, '229', null, '主管', null, '12tcs020', '员工20', null, 'tousu@xm12t.com', '13811111130', '0592-3503777', '2017-07-31 10:43:06', null, null);
INSERT INTO `wc_employees` VALUES ('3143', '68', null, '237', null, '经理', '845', 'hefeng001', '陈和风', 'uploads/company/68/employees/hefeng001/img1501554704.jpg', 'text@xm12t.com', '13812345671', '1324567', '2017-08-01 10:03:16', '2017-08-01 10:31:44', null);
INSERT INTO `wc_employees` VALUES ('3144', '68', null, '237', null, '主管', null, 'hefeng002', '员工2', null, 'text@xm13t.com', '13912345672', '1324568', '2017-08-01 10:03:16', null, null);
INSERT INTO `wc_employees` VALUES ('3145', '68', null, '237', null, '助理', null, 'hefeng003', '员工3', null, 'text@xm14t.com', '13812345673', '1324562', '2017-08-01 10:03:16', null, null);
INSERT INTO `wc_employees` VALUES ('3146', '68', null, '238', null, '经理', null, 'hefeng004', '员工4', null, 'text@xm15t.com', '13912345674', '1324561', '2017-08-01 10:03:16', null, null);
INSERT INTO `wc_employees` VALUES ('3147', '68', null, '238', null, '主管', null, 'hefeng005', '员工5', null, 'text@xm16t.com', '13812345675', '1324563', '2017-08-01 10:03:16', null, null);
INSERT INTO `wc_employees` VALUES ('3148', '68', null, '238', null, '助理', null, 'hefeng006', '员工6', null, 'text@xm17t.com', '13912345676', '1324565', '2017-08-01 10:03:16', null, null);
INSERT INTO `wc_employees` VALUES ('3149', '68', null, '238', null, '实习生', null, 'hefeng007', '员工7', null, 'text@xm18t.com', '13812345677', '05921334567', '2017-08-01 10:03:16', null, null);
INSERT INTO `wc_employees` VALUES ('3150', '68', null, '239', null, '主管', null, 'hefeng009', '员工9', null, 'text@xm20t.com', '13812345679', '05921434567', '2017-08-01 10:03:16', null, null);
INSERT INTO `wc_employees` VALUES ('3151', '68', null, '239', null, '助理', null, 'hefeng010', '员工10', null, 'text@xm21t.com', '13912345670', '05921534567', '2017-08-01 10:03:16', null, null);
INSERT INTO `wc_employees` VALUES ('3152', '70', null, '240', null, '经理', '847', 'xmesd001', '张三', 'uploads/company/70/employees/xmesd001/img1501555468.png', 'zhangsan@163.com', '13706050126', '0592-3503220', '2017-08-01 10:09:43', '2017-08-01 10:44:28', null);
INSERT INTO `wc_employees` VALUES ('3153', '70', null, '240', null, '主管', null, 'xmesd002', '李四', null, 'lisi@163.com', '13706050127', '0592-3503225', '2017-08-01 10:09:43', null, null);
INSERT INTO `wc_employees` VALUES ('3154', '70', null, '240', null, '助理', null, 'xmesd003', '杨洋', null, 'yangyang@163.com', '13706050128', '0592-3503221', '2017-08-01 10:09:43', null, null);
INSERT INTO `wc_employees` VALUES ('3155', '70', null, '241', null, '经理', null, 'xmesd004', '杨琳', null, 'yanglin@163.com', '13706050134', '0592-3503222', '2017-08-01 10:09:43', null, null);
INSERT INTO `wc_employees` VALUES ('3156', '70', null, '241', null, '主管', null, 'xmesd005', '周毅', null, 'zhouyi@163.com', '13706050135', '0592-3503223', '2017-08-01 10:09:43', null, null);
INSERT INTO `wc_employees` VALUES ('3157', '69', null, '247', null, '董事长', '846', '001', '钟帅', null, '111222333@qq.com', '18200000000', '1324567', '2017-08-01 10:43:42', '2017-08-01 10:44:54', null);
INSERT INTO `wc_employees` VALUES ('3158', '69', null, '248', null, '经理', null, '002', '赵一', null, '111222334@qq.com', '18200000001', '1324568', '2017-08-01 10:43:42', null, null);
INSERT INTO `wc_employees` VALUES ('3159', '69', null, '248', null, '主管', null, '003', '钱二', null, '111222335@qq.com', '18200000002', '1324569', '2017-08-01 10:43:42', null, null);
INSERT INTO `wc_employees` VALUES ('3160', '69', null, '248', null, '助理', null, '004', '孙三', null, '111222336@qq.com', '18200000003', '1324570', '2017-08-01 10:43:42', null, null);
INSERT INTO `wc_employees` VALUES ('3161', '69', null, '249', null, '经理', null, '005', '李四', null, '111222337@qq.com', '18200000004', '1324571', '2017-08-01 10:43:42', null, null);
INSERT INTO `wc_employees` VALUES ('3162', '69', null, '249', null, '主管', null, '006', '周五', null, '111222338@qq.com', '18200000005', '1324572', '2017-08-01 10:43:42', null, null);
INSERT INTO `wc_employees` VALUES ('3163', '69', null, '249', null, '助理', null, '007', '吴六', null, '111222339@qq.com', '18200000006', '1324573', '2017-08-01 10:43:42', null, null);
INSERT INTO `wc_employees` VALUES ('3164', '69', null, '250', null, '经理', null, '008', '郑七', null, '111222340@qq.com', '18200000007', '1324574', '2017-08-01 10:43:42', null, null);
INSERT INTO `wc_employees` VALUES ('3165', '69', null, '250', null, '主管', null, '009', '王八', null, '111222341@qq.com', '18200000008', '1324575', '2017-08-01 10:43:42', null, null);
INSERT INTO `wc_employees` VALUES ('3166', '69', null, '250', null, '助理', null, '010', '张九', null, '111222342@qq.com', '18200000009', '1324576', '2017-08-01 10:43:42', null, null);
INSERT INTO `wc_employees` VALUES ('3167', '71', null, '234', null, '主管', null, '12txm002', '员工2', null, 'text@xm13t.com', null, '1234568', '2017-08-01 10:45:54', '2017-08-01 10:47:05', '2017-08-01 10:47:05');
INSERT INTO `wc_employees` VALUES ('3168', '71', null, '235', null, '经理', null, '12txm004', '员工4', null, 'text@xm15t.com', null, '1234570', '2017-08-01 10:45:54', '2017-08-01 10:47:08', '2017-08-01 10:47:08');
INSERT INTO `wc_employees` VALUES ('3169', '71', null, '235', null, '助理', null, '12txm006', '员工6', null, 'text@xm17t.com', null, '1234572', '2017-08-01 10:45:54', '2017-08-01 10:47:11', '2017-08-01 10:47:11');
INSERT INTO `wc_employees` VALUES ('3170', '71', null, '236', null, '助理', null, '12txm010', '员工10', null, 'text@xm21t.com', null, '05921234567', '2017-08-01 10:45:54', '2017-08-01 10:47:15', '2017-08-01 10:47:15');
INSERT INTO `wc_employees` VALUES ('3171', '72', null, '253', null, '经理', null, '12txm010', '赵晓红', null, 'f21@qq.com', null, '05923503010', '2017-08-01 10:49:34', '2017-08-07 17:35:36', '2017-08-07 17:35:36');
INSERT INTO `wc_employees` VALUES ('3172', '72', null, null, null, '主管', null, '12txm011', '陈通', null, 'f22@qq.com', null, '05923503011', '2017-08-01 10:49:34', '2017-08-07 17:35:40', '2017-08-07 17:35:40');
INSERT INTO `wc_employees` VALUES ('3173', '72', null, '255', null, '助理', null, '12txm012', '刘成', null, 'f23@qq.com', null, '05923503012', '2017-08-01 10:49:34', '2017-08-07 17:35:43', '2017-08-07 17:35:43');
INSERT INTO `wc_employees` VALUES ('3174', '72', null, '256', null, '经理', null, '12txm013', '曾叶', null, 'f24@qq.com', null, '05923503013', '2017-08-01 10:49:34', '2017-08-07 17:35:46', '2017-08-07 17:35:46');
INSERT INTO `wc_employees` VALUES ('3175', '72', null, '257', null, '主管', null, '12txm014', '蔡纪', null, 'f25@qq.com', null, '05923503014', '2017-08-01 10:49:34', '2017-08-07 17:35:51', '2017-08-07 17:35:51');
INSERT INTO `wc_employees` VALUES ('3176', '72', null, '253', null, '助理', null, '12txm015', '蓝同', null, 'f26@qq.com', null, '05923503015', '2017-08-01 10:49:34', '2017-08-07 17:35:54', '2017-08-07 17:35:54');
INSERT INTO `wc_employees` VALUES ('3177', '72', null, null, null, '实习生', null, '12txm016', '郑站', null, 'f27@qq.com', null, '05923503016', '2017-08-01 10:49:34', '2017-08-07 17:35:57', '2017-08-07 17:35:57');
INSERT INTO `wc_employees` VALUES ('3178', '72', null, '255', null, '经理', null, '12txm017', '苏单', null, 'f28@qq.com', null, '05923503017', '2017-08-01 10:49:34', '2017-08-07 17:35:59', '2017-08-07 17:35:59');
INSERT INTO `wc_employees` VALUES ('3179', '72', null, '256', null, '主管', null, '12txm018', '陈颜', null, 'f29@qq.com', null, '05923503018', '2017-08-01 10:49:34', '2017-08-07 17:36:02', '2017-08-07 17:36:02');
INSERT INTO `wc_employees` VALUES ('3180', '72', null, '257', null, '助理', null, '12txm019', '江以', null, 'f30@qq.com', null, '05923503019', '2017-08-01 10:49:34', '2017-08-07 17:36:04', '2017-08-07 17:36:04');
INSERT INTO `wc_employees` VALUES ('3181', '71', null, '234', null, '主管', '848', '12t002', '员工2', null, 'text@xm13t.com', '13812345672', '2234568', '2017-08-01 10:56:19', '2017-08-01 10:58:38', null);
INSERT INTO `wc_employees` VALUES ('3182', '71', null, '235', null, '经理', null, '12t004', '员工4', null, 'text@xm15t.com', '13812345674', '2234570', '2017-08-01 10:56:19', null, null);
INSERT INTO `wc_employees` VALUES ('3183', '71', null, '235', null, '助理', null, '12t006', '员工6', null, 'text@xm17t.com', '13812345676', '2234572', '2017-08-01 10:56:19', null, null);
INSERT INTO `wc_employees` VALUES ('3184', '71', null, '236', null, '助理', null, '12t010', '员工10', null, 'text@xm21t.com', '13812345670', '05921234566', '2017-08-01 10:56:19', null, null);
INSERT INTO `wc_employees` VALUES ('3185', '52', null, '93', null, '经理', null, 'a001', '员工1', null, 'text@xm12t.com', null, '1234567', '2017-08-01 11:06:22', '2017-08-01 11:06:31', '2017-08-01 11:06:31');
INSERT INTO `wc_employees` VALUES ('3186', '52', null, '93', null, '主管', null, 'b002', '员工2', null, 'text@xm13t.com', null, '1234568', '2017-08-01 11:06:22', '2017-08-01 11:06:35', '2017-08-01 11:06:35');
INSERT INTO `wc_employees` VALUES ('3187', '66', '37', '243', null, '经理', '792', 'hefeng001', '大宝', 'uploads/company/66/employees/hefeng001/img1501575815.gif', 'zjm@xm12t.com', '12325645101', '05921334567', '2017-08-01 15:05:27', '2017-08-01 16:23:35', null);
INSERT INTO `wc_employees` VALUES ('3188', '66', '38', '243', null, '主管', null, 'hefeng002', '二宝', null, 'zjm@xm13t.com', '13232120256', '05921334567', '2017-08-01 15:05:27', '2017-08-01 16:04:44', null);
INSERT INTO `wc_employees` VALUES ('3189', '66', '40', '243', null, '助理', null, 'hefeng003', '三宝', null, 'zjm@xm14t.com', '17894265103', '05921434567', '2017-08-01 15:05:27', '2017-08-01 16:04:53', null);
INSERT INTO `wc_employees` VALUES ('3190', '66', '37', '244', null, '经理', null, 'hefeng004', '大豆', null, 'zjm@xm15t.com', '19842603121', '05921534567', '2017-08-01 15:05:27', '2017-08-01 16:05:01', null);
INSERT INTO `wc_employees` VALUES ('3191', '66', '38', '244', null, '主管', null, 'hefeng005', '二度', null, 'zjm@xm16t.com', '14647214865', '05923698745', '2017-08-01 15:05:27', '2017-08-01 16:05:11', null);
INSERT INTO `wc_employees` VALUES ('3192', '66', '40', '244', null, '助理', null, 'hefeng006', '三七', null, 'zjm@xm17t.com', '16548521235', '05921549656', '2017-08-01 15:05:27', '2017-08-01 16:05:20', null);
INSERT INTO `wc_employees` VALUES ('3193', '66', '40', '244', null, '实习生', null, 'hefeng007', '四期', null, 'zjm@xm18t.com', '10212641685', '05921254893', '2017-08-01 15:05:27', '2017-08-01 16:05:31', null);
INSERT INTO `wc_employees` VALUES ('3194', '66', '37', '245', null, '经理', null, 'hefeng008', '大鹏', null, 'zjm@xm19t.com', '16564489422', '05927892461', '2017-08-01 15:05:27', '2017-08-01 16:05:44', null);
INSERT INTO `wc_employees` VALUES ('3195', '66', '38', '245', null, '主管', null, 'hefeng009', '小熊', null, 'zjm@xm20t.com', '13698989725', '05923122321', '2017-08-01 15:05:27', '2017-08-01 16:05:51', null);
INSERT INTO `wc_employees` VALUES ('3196', '66', '40', '245', null, '助理', null, 'hefeng010', '忠忠', null, 'zjm@xm21t.com', '13252020250', '05927894213', '2017-08-01 15:05:27', '2017-08-01 16:05:58', null);
INSERT INTO `wc_employees` VALUES ('3197', '73', null, '264', null, '经理', '851', '12txm001', '欧阳', null, null, '13548923463', '1234567', '2017-08-01 15:16:52', '2017-08-01 16:21:31', null);
INSERT INTO `wc_employees` VALUES ('3198', '73', null, '264', null, '助理', null, '12txm003', '员工3', null, 'text@xm14t.com', '18652333139', '1234569', '2017-08-01 15:16:52', null, null);
INSERT INTO `wc_employees` VALUES ('3199', '73', null, '265', null, '经理', null, '12txm004', '员工4', null, 'text@xm15t.com', '15795233946', '1234570', '2017-08-01 15:16:52', null, null);
INSERT INTO `wc_employees` VALUES ('3200', '73', null, '265', null, '主管', null, '12txm005', '员工5', null, 'text@xm16t.com', '13269745632', '1234571', '2017-08-01 15:16:52', null, null);
INSERT INTO `wc_employees` VALUES ('3201', '73', null, '266', null, '主管', null, '12txm009', '员工9', null, 'text@xm20t.com', '13812345931', '05921234567', '2017-08-01 15:16:52', null, null);
INSERT INTO `wc_employees` VALUES ('3202', '73', null, '266', null, '助理', null, '12txm010', '员工10', null, 'text@xm21t.com', '13916547678', '05921234567', '2017-08-01 15:16:52', null, null);
INSERT INTO `wc_employees` VALUES ('3204', '40', null, '81', null, '产品经理', null, '12txm201', '罗丹丹', null, 'luodandan@xm12t.com', '15805910865', '3503176', '2017-08-02 10:23:51', '2017-08-03 11:35:42', null);
INSERT INTO `wc_employees` VALUES ('3205', '40', null, '81', null, '客服', '856', '12txm2252', '梁烨', null, 'liangyei@xm12t.com', '18750903203', '3503081', '2017-08-02 10:23:51', '2017-08-05 10:11:19', null);
INSERT INTO `wc_employees` VALUES ('3206', '39', null, null, null, null, null, 'gag1', 'hahaha', null, null, null, null, '2017-08-02 14:16:10', '2017-08-02 14:16:10', null);
INSERT INTO `wc_employees` VALUES ('3207', '40', null, '88', null, '客户经理', null, '12txm2250', '陈城', null, 'chencheng@xm12t.com', '18020722031', '3503356', '2017-08-02 14:41:21', null, null);
INSERT INTO `wc_employees` VALUES ('3208', '54', null, '116', null, '营销顾问', '946', 'YDHZ0233', '黄林烽', null, 'huanglf@ydbaidu.net', '13680775864', null, '2017-08-03 10:33:47', '2017-08-07 15:47:45', null);
INSERT INTO `wc_employees` VALUES ('3209', '54', null, '113', null, '营销顾问', '920', 'YHDZ0234', '李宗阳', null, 'lizy@ydbaidu.net', '13169671085', null, '2017-08-03 10:54:56', '2017-08-17 15:44:26', null);
INSERT INTO `wc_employees` VALUES ('3210', '57', null, '172', null, '营销顾问', '624', 'YDST0127', '李涵', null, 'lihan@ydbaidu.net', '13025324765', '89928709', '2017-08-03 11:10:08', '2017-08-09 10:12:55', null);
INSERT INTO `wc_employees` VALUES ('3211', '57', null, '172', null, '试用营销顾问', '985', 'YDST0128', '陈鑫浩', null, 'chenxh@ydbaidu.net', '15918770696', '89929707', '2017-08-03 11:11:40', '2017-08-22 15:09:28', null);
INSERT INTO `wc_employees` VALUES ('3212', '57', null, '172', null, '客服专员', '779', 'YDST0130', '林珊凤', null, 'linsf@ydbaidu.net', '13670465535', '89929702', '2017-08-03 11:13:09', '2017-08-22 15:49:47', null);
INSERT INTO `wc_employees` VALUES ('3213', '54', null, '189', null, '营销顾问', null, 'YDHZ170037', '叶思发', null, 'yesf@ydbaidu.net', '13192822565', null, '2017-08-04 11:29:48', '2017-08-04 11:29:48', null);
INSERT INTO `wc_employees` VALUES ('3214', '54', null, '189', null, '营销顾问', null, 'YDHZ170038', '翟玉莹', null, 'zhaiyy@ydbaidu.net', '13437682806', null, '2017-08-04 11:30:25', '2017-08-04 11:30:25', null);
INSERT INTO `wc_employees` VALUES ('3215', '71', null, '259', null, null, null, '1', '兰经理', null, null, null, null, '2017-08-07 16:31:53', '2017-08-07 16:45:46', '2017-08-07 16:45:46');
INSERT INTO `wc_employees` VALUES ('3216', '74', null, null, null, null, null, 'abbc', 'asdfa', null, null, null, null, '2017-08-07 16:44:40', '2017-08-07 16:45:50', '2017-08-07 16:45:50');
INSERT INTO `wc_employees` VALUES ('3217', '74', null, null, null, '总经理', '966', '1', '兰红利', 'uploads/company/74/employees/1/img1502176452.jpg', '1398073635@qq.com', '13774695953', null, '2017-08-07 16:48:40', '2017-08-08 15:14:12', null);
INSERT INTO `wc_employees` VALUES ('3218', '75', null, '268', null, '经理', '967', 'xmhthjc001', '张祖海', 'uploads/company/75/employees/xmhthjc001/img1502097682.png', '524203729@qq.com', '15860791302', '0592-5557834', '2017-08-07 17:18:18', '2017-08-09 10:24:32', null);
INSERT INTO `wc_employees` VALUES ('3219', '76', '41', '270', null, '经理', '968', 'hefeng001', '郭淼波', 'uploads/company/76/employees/hefeng001/img1502098858.png', null, '13809690502', '07526919870', '2017-08-07 17:24:03', '2017-08-07 17:42:25', null);
INSERT INTO `wc_employees` VALUES ('3220', '76', '42', '271', null, '主任', null, 'hefeng002', '白丽燕', 'uploads/company/76/employees/hefeng002/img1502098974.png', null, '13809691242', null, '2017-08-07 17:24:03', '2017-08-07 17:42:54', null);
INSERT INTO `wc_employees` VALUES ('3221', '76', '43', '272', null, '经理', null, 'hefeng003', '陈亮', 'uploads/company/76/employees/hefeng003/img1502098964.png', null, '13266064848', null, '2017-08-07 17:24:03', '2017-08-07 17:42:44', null);
INSERT INTO `wc_employees` VALUES ('3222', '72', null, '274', null, '搬运工', null, '010', '张连城', null, 'f21@qq.com', '13859921461', '05923503010', '2017-08-07 17:36:09', null, null);
INSERT INTO `wc_employees` VALUES ('3223', '72', null, '253', null, '客服', null, '011', '林静宇 ', null, 'f22@qq.com', '18759255778', '05923503011', '2017-08-07 17:36:09', null, null);
INSERT INTO `wc_employees` VALUES ('3224', '72', null, '257', null, '调度', null, '012', '林建辉', 'uploads/company/72/employees/012/img1502101328.png', 'f23@qq.com', '13850065459', '05923503012', '2017-08-07 17:36:09', '2017-08-07 18:22:08', null);
INSERT INTO `wc_employees` VALUES ('3225', '72', null, '255', null, '财务', '849', '013', '林玉媛', null, 'f24@qq.com', '13850069491', '05923503013', '2017-08-07 17:36:09', '2017-08-07 17:36:32', null);
INSERT INTO `wc_employees` VALUES ('3226', '72', null, '256', null, '司机', null, '014', '朱大勇', null, 'f25@qq.com', '13960192736', '05923503014', '2017-08-07 17:36:09', null, null);
INSERT INTO `wc_employees` VALUES ('3227', '72', null, '253', null, '前台', null, '015', '朱秀月 ', null, 'f26@qq.com', '15985853309', '05923503015', '2017-08-07 17:36:09', null, null);
INSERT INTO `wc_employees` VALUES ('3228', '72', null, '256', null, '厨师', null, '016', '颜珠清 ', null, 'f27@qq.com', '15859637235', '05923503016', '2017-08-07 17:36:09', null, null);
INSERT INTO `wc_employees` VALUES ('3229', '72', null, '253', null, '客服', null, '017', '朱倩兰', null, 'f28@qq.com', '1377996126', '05923503017', '2017-08-07 17:36:09', null, null);
INSERT INTO `wc_employees` VALUES ('3230', '72', null, '253', null, '客服', null, '018', '林美丹', null, 'f29@qq.com', '13324559166', '05923503018', '2017-08-07 17:36:09', null, null);
INSERT INTO `wc_employees` VALUES ('3231', '72', null, '253', null, '客服', null, '019', '林美碧 ', null, 'f30@qq.com', '15960376277', '05923503019', '2017-08-07 17:36:09', null, null);
INSERT INTO `wc_employees` VALUES ('3232', '80', null, '275', null, '中心经理', '972', '001', '林来华', null, '26207544@qq.com', '13605051690', '0596－2166615', '2017-08-07 17:42:31', '2017-08-07 17:45:29', null);
INSERT INTO `wc_employees` VALUES ('3233', '78', null, '277', null, '老板', '970', '001', '袁冰', null, '635299200@xm12t.com', '15768465168', '13640236128', '2017-08-07 17:44:18', '2017-08-07 17:44:35', null);
INSERT INTO `wc_employees` VALUES ('3234', '79', null, '279', null, '经理', '973', 'yisheng001', '李小辉', 'uploads/company/79/employees/yisheng001/img1502099541.jpg', null, '15859666567', null, '2017-08-07 17:50:22', '2017-08-07 17:54:11', null);
INSERT INTO `wc_employees` VALUES ('3235', '77', null, '284', null, '经理', '971', 'qzlsd001', '李忠华', null, 'qzlongshida@163.com', '15880266603', '0595-22187306', '2017-08-07 17:58:54', '2017-08-07 17:59:12', null);
INSERT INTO `wc_employees` VALUES ('3236', '75', null, '268', null, '业务员', null, 'xmhthjc002', '陈晓霞', null, null, '13806061261', null, '2017-08-09 10:27:19', null, null);
INSERT INTO `wc_employees` VALUES ('3237', '75', null, '268', null, '业务员', null, 'xmhthjc003', '陈良聪', null, null, '13459866008', null, '2017-08-09 10:27:19', null, null);
INSERT INTO `wc_employees` VALUES ('3238', '75', null, '268', null, '业务员', null, 'xmhthjc004', '陈婷', null, null, '15805957829', null, '2017-08-09 10:27:19', null, null);
INSERT INTO `wc_employees` VALUES ('3239', '75', null, '268', null, '业务员', null, 'xmhthjc005', '张美泉', null, null, '18950042221', null, '2017-08-09 10:27:19', null, null);
INSERT INTO `wc_employees` VALUES ('3240', '40', null, '87', null, '客户经理', '995', '12txm2255', '叶晓铃', null, 'yexiaoling@xm12t.com', '18322826745', '3503312', '2017-08-09 10:44:04', '2017-08-17 17:26:26', null);
INSERT INTO `wc_employees` VALUES ('3241', '40', null, '88', null, '客户经理', null, '12txm2254', '王天禹', null, 'wangtianyu@xm12t.com', '13666057262', '3503014', '2017-08-09 10:44:04', '2017-08-15 10:55:33', null);
INSERT INTO `wc_employees` VALUES ('3242', '55', null, '185', null, '营销顾问', null, 'YDMZ0078', '林钊楠', null, 'linzhn@ydbaidu.net', null, '07538589085', '2017-08-09 11:10:05', '2017-08-16 09:58:38', '2017-08-16 09:58:38');
INSERT INTO `wc_employees` VALUES ('3243', '55', null, '185', null, '营销顾问', null, 'YDMZ0079', '杨佳伟', null, 'yangjw@ydbaidu.net', null, '07538589165', '2017-08-09 11:11:04', '2017-08-16 09:58:34', '2017-08-16 09:58:34');
INSERT INTO `wc_employees` VALUES ('3244', '54', null, '110', null, '营销顾问', null, 'YHDZ0235', '张培忠', null, 'zhangpzh@ydbaidu.net', '13825452775', null, '2017-08-10 10:18:28', '2017-08-10 10:18:28', null);
INSERT INTO `wc_employees` VALUES ('3245', '54', null, '119', null, '营销顾问', null, 'YHDZ0236', '陈世昌', null, 'chenshch@ydbaidu.net', '15768855687', null, '2017-08-14 09:21:02', '2017-08-14 09:21:02', null);
INSERT INTO `wc_employees` VALUES ('3246', '54', null, '115', null, '营销顾问', null, 'YHDZ0237', '林梦佳', null, 'linmj@ydbaidu.net', '15768656198', null, '2017-08-14 09:21:59', '2017-08-14 09:21:59', null);
INSERT INTO `wc_employees` VALUES ('3247', '56', null, '197', null, '销售专员', '1087', 'CZNM0018', '陈楚君', null, 'chenchj@ydbaidu.net', '15992398921', null, '2017-08-14 17:09:50', '2017-08-22 15:14:11', null);
INSERT INTO `wc_employees` VALUES ('3248', '54', null, '112', null, '营销顾问', null, 'YDHZ0238', '王志棋', null, 'wangzhq@ydbaidu.net', '13143095661', null, '2017-08-15 10:36:54', '2017-08-15 10:36:54', null);
INSERT INTO `wc_employees` VALUES ('3249', '54', null, '189', null, '营销顾问', null, 'YDHZ170039', '陶嘉富', null, 'taojf@ydbaidu.net', '15976121880', null, '2017-08-15 10:37:41', '2017-08-15 10:37:51', null);
INSERT INTO `wc_employees` VALUES ('3250', '40', null, '81', null, '客服', '1013', '12txm2256', '林志勇', null, ' linzhiyong@xm12t.com', '13003998017', '3503518', '2017-08-15 10:56:14', '2017-08-17 11:20:56', null);
INSERT INTO `wc_employees` VALUES ('3251', '40', null, '87', null, '技术工程师', null, '12txm2257', '叶新能', null, 'yexinneng@xm12t.com', '18344935868', '3503514', '2017-08-15 10:56:14', '2017-08-16 15:53:14', null);
INSERT INTO `wc_employees` VALUES ('3252', '40', null, '81', null, '客服', '1041', '12txm2258', '沈仪宣', null, 'shenyixuan@xm12t.com', '18030305429', null, '2017-08-15 10:56:14', '2017-08-19 09:13:26', null);
INSERT INTO `wc_employees` VALUES ('3253', '82', null, '287', null, '经理', '1003', '12txm001', '员工1', null, 'text@xm12t.com', '18046438361', '1234567', '2017-08-16 10:42:30', '2017-08-16 10:43:37', null);
INSERT INTO `wc_employees` VALUES ('3254', '83', null, '291', null, '经理', '993', '12txm0012', '员工1', null, 'text@xm12t.com', '13812345644', '1234567', '2017-08-16 16:06:55', '2017-08-16 16:10:10', null);
INSERT INTO `wc_employees` VALUES ('3255', '83', null, '291', null, '主管', null, '12txm0023', '员工2', null, 'text@xm13t.com', '13912345625', '1234568', '2017-08-16 16:06:55', null, null);
INSERT INTO `wc_employees` VALUES ('3256', '83', null, '292', null, '经理', null, '12txm0045', '员工4', null, 'text@xm15t.com', '13912345665', '1234570', '2017-08-16 16:06:55', null, null);
INSERT INTO `wc_employees` VALUES ('3257', '83', null, '292', null, '主管', null, '12txm0056', '员工5', null, 'text@xm16t.com', '13812345655', '1234571', '2017-08-16 16:06:55', null, null);
INSERT INTO `wc_employees` VALUES ('3258', '83', null, '292', null, '助理', null, '12txm0067', '员工6', null, 'text@xm17t.com', '1391234555', '1234572', '2017-08-16 16:06:55', null, null);
INSERT INTO `wc_employees` VALUES ('3259', '83', null, '292', null, '实习生', null, '12txm0078', '员工7', null, 'text@xm18t.com', '13812345655', '05921234567', '2017-08-16 16:06:55', null, null);
INSERT INTO `wc_employees` VALUES ('3260', '83', null, '293', null, '经理', null, '12txm0086', '员工8', null, 'text@xm19t.com', '13912345677', '05921234567', '2017-08-16 16:06:55', null, null);
INSERT INTO `wc_employees` VALUES ('3261', '83', null, '293', null, '主管', null, '12txm0099', '员工9', null, 'text@xm20t.com', '13812345653', '05921234567', '2017-08-16 16:06:55', null, null);
INSERT INTO `wc_employees` VALUES ('3262', '83', null, '293', null, '助理', null, '12txm011', '员工10', null, 'text@xm21t.com', '13912345699', '05921234567', '2017-08-16 16:06:55', null, null);
INSERT INTO `wc_employees` VALUES ('3263', '54', null, '189', null, '营销顾问', null, 'YDHZ170040', '李鸿标', null, 'lihb@ydbaidu.net', '15217832142', null, '2017-08-17 10:43:08', '2017-08-17 10:43:08', null);
INSERT INTO `wc_employees` VALUES ('3264', '54', null, '119', null, '营销顾问', null, 'YDHZ0239', '叶文锋', null, 'yewf@ydbaidu.net', null, null, '2017-08-17 10:43:47', '2017-08-22 14:52:08', '2017-08-22 14:52:08');
INSERT INTO `wc_employees` VALUES ('3265', '54', null, '108', null, '百度客服', null, 'YDHZ0240', '谭志娃', null, 'tanzhw@ydbaidu.net', '13502235480', null, '2017-08-17 10:44:33', '2017-08-17 10:44:33', null);
INSERT INTO `wc_employees` VALUES ('3266', '55', null, '185', null, '营销顾问', '1056', 'YDMZ0081', '廖国达', null, 'liaogd@ydbaidu.net', '13570846800', '0753-8589167', '2017-08-21 16:09:21', '2017-08-22 11:34:24', null);
INSERT INTO `wc_employees` VALUES ('3267', '57', null, '161', null, '市场专员', null, 'YDST0131', '肖亿童', null, 'xiaoyt@ydbaidu.net', '15875477293', '89929780', '2017-08-22 15:15:03', '2017-08-22 15:15:03', null);
INSERT INTO `wc_employees` VALUES ('3268', '57', null, '159', null, '试用营销顾问', null, 'YDST0132', '姚沐龙', null, 'yaoml@ydbaidu.net', '13676106456', '89929745', '2017-08-22 15:17:44', '2017-08-22 15:17:44', null);
INSERT INTO `wc_employees` VALUES ('3269', '56', null, '174', null, '营销顾问', null, 'YDCZ0066', '林佳', null, 'linjia@ydbaidu.net', '18676802552', null, '2017-08-22 16:06:09', '2017-08-22 16:06:09', null);
INSERT INTO `wc_employees` VALUES ('3270', '56', null, '174', null, '营销顾问', null, 'YDCZ0067', '魏培勇', null, 'weipy@ydbaidu.net', '15207687210', null, '2017-08-22 16:07:08', '2017-08-22 16:07:08', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='名片夹分组 - 个人';

-- ----------------------------
-- Records of wc_groups
-- ----------------------------
INSERT INTO `wc_groups` VALUES ('5', '81', 'ddd', '0');
INSERT INTO `wc_groups` VALUES ('6', '71', '你好', '0');
INSERT INTO `wc_groups` VALUES ('7', '71', '我好', '0');
INSERT INTO `wc_groups` VALUES ('8', '71', '大家好', '0');
INSERT INTO `wc_groups` VALUES ('9', '77', '测试', '0');
INSERT INTO `wc_groups` VALUES ('12', '62', '十一', '0');
INSERT INTO `wc_groups` VALUES ('27', '52', '公司同事', '0');
INSERT INTO `wc_groups` VALUES ('28', '52', '家人朋友', '0');
INSERT INTO `wc_groups` VALUES ('29', '52', '高中同学', '0');
INSERT INTO `wc_groups` VALUES ('30', '52', '大学同学', '0');
INSERT INTO `wc_groups` VALUES ('31', '52', '初中同学', '0');
INSERT INTO `wc_groups` VALUES ('32', '66', '詹', '0');
INSERT INTO `wc_groups` VALUES ('33', '109', '客户列表', '0');
INSERT INTO `wc_groups` VALUES ('34', '140', '公司', '0');
INSERT INTO `wc_groups` VALUES ('35', '262', '干活', '0');
INSERT INTO `wc_groups` VALUES ('36', '198', '百度漳州营销服务中心', '0');
INSERT INTO `wc_groups` VALUES ('37', '288', '游其钱', '0');
INSERT INTO `wc_groups` VALUES ('39', '355', 'Xbb', '0');
INSERT INTO `wc_groups` VALUES ('40', '271', '漳州百度', '0');
INSERT INTO `wc_groups` VALUES ('41', '85', '福建同事', '0');
INSERT INTO `wc_groups` VALUES ('42', '85', '粤东同事', '0');
INSERT INTO `wc_groups` VALUES ('43', '108', '公司同事', '0');
INSERT INTO `wc_groups` VALUES ('44', '552', '敏', '0');
INSERT INTO `wc_groups` VALUES ('45', '338', '客户', '0');
INSERT INTO `wc_groups` VALUES ('46', '151', '同事', '0');
INSERT INTO `wc_groups` VALUES ('47', '52', '部门同事', '0');
INSERT INTO `wc_groups` VALUES ('49', '721', '12t同事', '0');
INSERT INTO `wc_groups` VALUES ('50', '737', '客户', '0');
INSERT INTO `wc_groups` VALUES ('51', '1020', '同事', '0');
INSERT INTO `wc_groups` VALUES ('52', '76', '阿啦啦啦啦', '0');
INSERT INTO `wc_groups` VALUES ('53', '76', '啦啦啦啦了', '0');
INSERT INTO `wc_groups` VALUES ('54', '76', '快乐旅途', '0');
INSERT INTO `wc_groups` VALUES ('55', '76', '骷髅头', '0');
INSERT INTO `wc_groups` VALUES ('56', '40', '哈哈哈', '0');

-- ----------------------------
-- Table structure for wc_icons
-- ----------------------------
DROP TABLE IF EXISTS `wc_icons`;
CREATE TABLE `wc_icons` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'icon id',
  `icon_name` varchar(255) DEFAULT NULL COMMENT 'icon名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

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
INSERT INTO `wc_icons` VALUES ('15', '&#xe633');
INSERT INTO `wc_icons` VALUES ('16', '&#xe653');
INSERT INTO `wc_icons` VALUES ('17', '&#xe615');
INSERT INTO `wc_icons` VALUES ('18', '&#xe729');
INSERT INTO `wc_icons` VALUES ('19', '&#xe725');
INSERT INTO `wc_icons` VALUES ('20', '&#xe71f');
INSERT INTO `wc_icons` VALUES ('21', '&#xe71d');
INSERT INTO `wc_icons` VALUES ('22', '&#xe71a');
INSERT INTO `wc_icons` VALUES ('23', '&#xe712');
INSERT INTO `wc_icons` VALUES ('24', '&#xe709');
INSERT INTO `wc_icons` VALUES ('25', '&#xe708');
INSERT INTO `wc_icons` VALUES ('26', '&#xe6fb');
INSERT INTO `wc_icons` VALUES ('27', '&#xe6f5');
INSERT INTO `wc_icons` VALUES ('28', '&#xe6ea');
INSERT INTO `wc_icons` VALUES ('29', '&#xe6e7');
INSERT INTO `wc_icons` VALUES ('30', '&#xe6e2');
INSERT INTO `wc_icons` VALUES ('31', '&#xe6e0');

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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1 COMMENT='产品表';

-- ----------------------------
-- Records of wc_links
-- ----------------------------
INSERT INTO `wc_links` VALUES ('63', '45', '百度推广', 'http://www.12t.cn/tg_zhuanti.html', '&#xe623', '2017-06-22 16:38:07', '2017-06-22 16:38:07', null);
INSERT INTO `wc_links` VALUES ('64', '45', 'G宝盆', 'http://www.12t.cn/tg_wzjs.html#gbp', '&#xe654', '2017-06-22 16:38:26', '2017-06-22 16:38:26', null);
INSERT INTO `wc_links` VALUES ('65', '45', '12Tshop', 'http://www.12t.cn/tg_wzjs.html#tg_pro2', '&#xe602', '2017-06-22 16:38:48', '2017-06-22 16:38:48', null);
INSERT INTO `wc_links` VALUES ('66', '45', 'E推', 'http://www.gbpen.com/activity.php', '&#xe661', '2017-06-22 16:39:07', '2017-06-22 16:39:07', null);
INSERT INTO `wc_links` VALUES ('67', '39', '655665', 'http://mp.gbpen.com/company/link', '&#xe654', '2017-06-22 17:02:36', '2017-06-22 17:02:36', null);
INSERT INTO `wc_links` VALUES ('68', '40', '百度推广', 'http://www.12t.cn/tg_zhuanti.html', '&#xe623', '2017-06-24 11:34:09', '2017-06-24 11:34:09', null);
INSERT INTO `wc_links` VALUES ('69', '40', 'G宝盆', 'http://www.gbpen.com/index.php', '&#xe654', '2017-06-24 11:34:24', '2017-06-26 17:02:03', null);
INSERT INTO `wc_links` VALUES ('70', '40', '12Tshop', 'http://www.12tshop.com', '&#xe602', '2017-06-24 11:34:42', '2017-06-26 17:01:08', null);
INSERT INTO `wc_links` VALUES ('71', '40', 'E推', 'http://www.gbpen.com/ETui.php?show=1', '&#xe661', '2017-06-24 11:34:59', '2017-06-26 17:01:39', null);
INSERT INTO `wc_links` VALUES ('73', '47', ' 电话', 'http://www.gbpen.com/article.php?m=3', '&#xe644', '2017-06-29 14:46:52', '2017-06-29 14:46:52', null);
INSERT INTO `wc_links` VALUES ('74', '47', '地图', 'http://www.gbpen.com/article.php?m=3', '&#xe6cb', '2017-06-29 14:47:14', '2017-06-29 14:47:14', null);
INSERT INTO `wc_links` VALUES ('75', '47', '淘宝', 'http://www.gbpen.com/article.php?m=3', '&#xe602', '2017-06-29 14:47:41', '2017-06-29 14:47:41', null);
INSERT INTO `wc_links` VALUES ('76', '48', 'E推', 'http://www.gbpen.com/ETui.php?show=1', '&#xe608', '2017-06-30 11:27:01', '2017-06-30 11:27:01', null);
INSERT INTO `wc_links` VALUES ('77', '48', '商城', 'http://12tshop.com/cn/index', '&#xe602', '2017-06-30 11:27:35', '2017-06-30 11:27:35', null);
INSERT INTO `wc_links` VALUES ('78', '48', 'G宝盆', 'http://www.gbpen.com/templateShow.php', '&#xe615', '2017-06-30 11:28:12', '2017-06-30 11:28:12', null);
INSERT INTO `wc_links` VALUES ('79', '48', '定制站', 'http://diy.12t.cn/', '&#xe633', '2017-06-30 11:29:11', '2017-06-30 11:29:11', null);
INSERT INTO `wc_links` VALUES ('80', '49', '统一平台', 'http://www.gbpen.com/', '&#xe654', '2017-06-30 14:37:18', '2017-06-30 14:37:18', null);
INSERT INTO `wc_links` VALUES ('81', '49', '百度推广', 'http://www.12t.cn/', '&#xe623', '2017-06-30 14:37:54', '2017-06-30 14:37:54', null);
INSERT INTO `wc_links` VALUES ('82', '49', '12tshop', 'http://www.12tshop.com/', '&#xe602', '2017-06-30 15:48:46', '2017-06-30 15:48:46', null);
INSERT INTO `wc_links` VALUES ('83', '49', 'E推', 'http://www.gbpen.com/ETui.php?show=1', '&#xe661', '2017-06-30 15:54:04', '2017-06-30 15:54:04', null);
INSERT INTO `wc_links` VALUES ('84', '52', '官网', 'http://www.12t.cn', '&#xe623', '2017-07-06 11:01:44', '2017-07-06 11:01:44', null);
INSERT INTO `wc_links` VALUES ('85', '50', '百度推广', 'http://www.12t.cn/tg_zhuanti.htm', '&#xe623', '2017-07-12 15:02:36', '2017-07-12 15:03:49', null);
INSERT INTO `wc_links` VALUES ('86', '50', 'G宝盆', 'http://www.gbpen.com', '&#xe654', '2017-07-12 15:04:26', '2017-07-12 15:05:24', null);
INSERT INTO `wc_links` VALUES ('87', '50', '12Tshop', 'http://www.12tshop.com', '&#xe602', '2017-07-12 15:05:10', '2017-07-12 15:05:10', null);
INSERT INTO `wc_links` VALUES ('88', '50', 'E推', 'http://www.gbpen.com/ETui.php?show=1', '&#xe661', '2017-07-12 15:06:28', '2017-07-12 15:06:28', null);
INSERT INTO `wc_links` VALUES ('92', '54', '百度推广', 'http://m.ydbaidu.net/list-3-1.html', '&#xe645', '2017-07-14 15:46:32', '2017-07-14 15:51:18', null);
INSERT INTO `wc_links` VALUES ('93', '54', '百度信息流', 'http://www.ydbaidu.net/xxl/', '&#xe645', '2017-07-14 15:46:49', '2017-07-14 15:46:49', null);
INSERT INTO `wc_links` VALUES ('94', '54', 'G宝盆统一平台', 'http://www.gbpen.com/', '&#xe645', '2017-07-14 15:48:11', '2017-07-14 15:48:11', null);
INSERT INTO `wc_links` VALUES ('95', '54', '商城', 'http://www.12tshop.com/', '&#xe645', '2017-07-14 15:48:26', '2017-07-14 15:48:26', null);
INSERT INTO `wc_links` VALUES ('96', '54', 'E推', 'http://www.gbpen.com/ETui.php?show=1', '&#xe645', '2017-07-14 15:48:38', '2017-07-14 15:48:38', null);
INSERT INTO `wc_links` VALUES ('97', '54', '百度本地直通车', 'http://www.ydbaidu.net/page-ztc', '&#xe645', '2017-07-14 15:49:05', '2017-07-14 15:49:05', null);
INSERT INTO `wc_links` VALUES ('98', '55', '百度信息流', 'http://www.ydbaidu.net/xxl/', '&#xe623', '2017-07-21 10:42:09', '2017-07-21 10:42:09', null);
INSERT INTO `wc_links` VALUES ('99', '55', '百度推广', 'http://m.ydbaidu.net/list-3-1.html', '&#xe623', '2017-07-21 10:43:15', '2017-07-21 10:43:15', null);
INSERT INTO `wc_links` VALUES ('100', '55', 'G宝盆统一平台', 'http://www.gbpen.com/', '&#xe654', '2017-07-21 10:43:38', '2017-07-21 10:43:56', null);
INSERT INTO `wc_links` VALUES ('101', '55', '网站商城', 'http://www.12tshop.com/', '&#xe602', '2017-07-21 10:44:38', '2017-07-21 10:47:33', null);
INSERT INTO `wc_links` VALUES ('102', '55', 'E推', 'http://www.gbpen.com/ETui.php?show=1', '&#xe661', '2017-07-21 10:45:02', '2017-07-21 10:45:02', null);
INSERT INTO `wc_links` VALUES ('103', '55', '百度本地直通车', 'http://www.ydbaidu.net/page-ztc', '&#xe653', '2017-07-21 10:45:36', '2017-07-21 10:45:36', null);
INSERT INTO `wc_links` VALUES ('104', '65', '微店', 'http://www.baidu.com', '&#xe602', '2017-07-26 14:41:36', '2017-07-26 14:41:57', null);
INSERT INTO `wc_links` VALUES ('105', '72', '百度', 'https://www.baidu.com/', '&#xe623', '2017-08-01 11:05:25', '2017-08-01 11:05:25', null);
INSERT INTO `wc_links` VALUES ('106', '72', 'G宝盆', 'http://gbpen.com/', '&#xe654', '2017-08-01 11:05:55', '2017-08-01 11:05:55', null);
INSERT INTO `wc_links` VALUES ('107', '72', 'E推', 'http://gbpen.com/ETui.php?show=1', '&#xe661', '2017-08-01 11:06:21', '2017-08-01 11:06:21', null);
INSERT INTO `wc_links` VALUES ('108', '72', '商城', 'http://12tshop.com/', '&#xe602', '2017-08-01 11:11:22', '2017-08-01 11:11:22', null);
INSERT INTO `wc_links` VALUES ('109', '73', '百度', 'http://www.baidu.com', '&#xe623', '2017-08-01 15:54:05', '2017-08-01 15:54:05', null);
INSERT INTO `wc_links` VALUES ('110', '73', '火狐', 'http://www.firefox.com.cn/', '&#xe6cb', '2017-08-01 15:54:42', '2017-08-01 16:05:23', null);
INSERT INTO `wc_links` VALUES ('111', '66', '百度', 'https://www.baidu.com/?tn=78040160_26_pg&ch=1', '&#xe623', '2017-08-01 15:59:41', '2017-08-01 15:59:41', null);
INSERT INTO `wc_links` VALUES ('112', '66', 'G宝盆', 'http://gbpen.com/', '&#xe654', '2017-08-01 16:00:11', '2017-08-01 16:00:11', null);
INSERT INTO `wc_links` VALUES ('113', '66', 'E推', 'http://gbpen.com/ETui.php?show=1', '&#xe661', '2017-08-01 16:00:42', '2017-08-01 16:00:42', null);
INSERT INTO `wc_links` VALUES ('114', '66', '12t商城', 'http://12tshop.com/', '&#xe653', '2017-08-01 16:01:14', '2017-08-01 16:01:14', null);
INSERT INTO `wc_links` VALUES ('115', '73', '腾讯', 'http://finance.qq.com/', '&#xe664', '2017-08-01 16:17:17', '2017-08-01 16:20:07', null);
INSERT INTO `wc_links` VALUES ('116', '73', '官网', 'http://www.12t.cn', '&#xe645', '2017-08-01 16:17:39', '2017-08-01 16:19:38', null);
INSERT INTO `wc_links` VALUES ('117', '52', '聚宝盆', 'http://www.gbpen.com', '&#xe654', '2017-08-03 16:40:30', '2017-08-03 16:40:30', null);
INSERT INTO `wc_links` VALUES ('118', '75', '百度', 'https://www.baidu.com/', '&#xe623', '2017-08-07 17:11:57', '2017-08-07 17:11:57', null);
INSERT INTO `wc_links` VALUES ('119', '75', '易尔通', 'http://www.12t.cn/', '&#xe645', '2017-08-07 17:12:26', '2017-08-07 17:12:26', null);
INSERT INTO `wc_links` VALUES ('120', '75', 'G宝盆', 'http://gbpen.gz01.bdysite.com/templateShow.php', '&#xe6cb', '2017-08-07 17:13:09', '2017-08-07 17:13:09', null);
INSERT INTO `wc_links` VALUES ('121', '75', '推广', 'http://www.12t.cn/tg_zhuanti.html', '&#xe664', '2017-08-07 17:26:04', '2017-08-07 17:26:04', null);
INSERT INTO `wc_links` VALUES ('125', '76', '官网', 'http://yufudianzi.n02.5067.org/', '&#xe714', '2017-08-07 17:50:04', '2017-08-07 17:50:04', null);
INSERT INTO `wc_links` VALUES ('126', '76', '在线咨询', 'http://yufudianzi.n02.5067.org/category/48434.html', '&#xe71f', '2017-08-07 17:50:34', '2017-08-07 17:50:34', null);
INSERT INTO `wc_links` VALUES ('127', '76', '联系方式', 'http://yufudianzi.n02.5067.org/category/48435.html', '&#xe644', '2017-08-07 17:50:51', '2017-08-07 17:50:51', null);
INSERT INTO `wc_links` VALUES ('129', '78', '关于我们', 'http://cyshuichan.com/category/40594.html', '&#xe645', '2017-08-07 17:59:16', '2017-08-07 17:59:16', null);
INSERT INTO `wc_links` VALUES ('130', '78', '产品中心', 'http://cyshuichan.com/category/40596.html', '&#xe71a', '2017-08-07 17:59:55', '2017-08-07 17:59:55', null);
INSERT INTO `wc_links` VALUES ('131', '78', '意见反馈', 'http://cyshuichan.com/category/40597.html', '&#xe657', '2017-08-07 18:00:12', '2017-08-07 18:00:12', null);
INSERT INTO `wc_links` VALUES ('132', '78', '联系我们', 'http://cyshuichan.com/category/40598.html', '&#xe644', '2017-08-07 18:00:31', '2017-08-07 18:00:31', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of wc_managers
-- ----------------------------
INSERT INTO `wc_managers` VALUES ('1', 'admin', null, null, '$2y$10$otsHArtetKUAW9yKyVtYHeaFUFXXfl1C4uGyBrbobZ73xxGz8jWqS', 'rQkFGgHIwNScq267hsiOwMtV1NWcviI8FY9gGSKmaO1T1Wk1nGGTVAOos88o', null, '1', '1', '2017-04-06 09:41:44', '2017-08-22 15:52:10', null);
INSERT INTO `wc_managers` VALUES ('2', 'cchenjei', null, null, '$2y$10$KFyJWwsMnb5017PDqutg9.6wGJ/Kj5UYktvwyCw8SwcXNyc/SOrtO', null, null, '0', '1', '2017-04-15 12:09:16', '2017-04-26 14:52:42', null);
INSERT INTO `wc_managers` VALUES ('3', 'linyaping', null, null, '$2y$10$2CUHsAJZRia7yxoFDx0LIusw9nJvrO1UIGVux25oL9irSfXs2OBYa', 'bFNu6mqbIwSlwo59LUKWpIg1fF77lNDPyVrFVHb5ufthNT0aoR3kFlO2zTvs', '林雅呀', '1', '1', '2017-04-26 14:25:01', '2017-04-27 18:18:31', null);
INSERT INTO `wc_managers` VALUES ('4', 'user', null, null, '$2y$10$vNEiuYi4LOiqR1U3S9xLYeIz6GRQJ/d3c0dcs2WQLsy6aRvtGXMr2', 'QYFMZQkZa06z6RLabsV0BzvKIFp36Xjr4tXgAlsEJWW6sBIXBZGKFlbRPd6x', null, '1', '1', '2017-04-27 18:17:54', '2017-04-27 18:24:37', null);
INSERT INTO `wc_managers` VALUES ('5', 'username', '1523@qq.com', '13111111111', '$2y$10$pOUtEYAi8lX1MNN2Nhb8juFz6GPL6izEkotWCswEO9KV.sx.wiLfq', null, 'afa', '0', '1', '2017-04-27 18:21:43', '2017-04-27 18:21:43', null);
INSERT INTO `wc_managers` VALUES ('6', 'dingdan1', null, null, '$2y$10$0HbMyJdMov9dKDf0RmdvUu7bBW6CNgolRnAHltOzifUnunSB6EkLu', 'pNLBLZ8WFGDijVbLTBRZ3JZfIzZ4VXcBXPwuOC4OTkdgdAqRsIUKCgjAjYnT', null, '1', '1', '2017-07-26 09:14:00', '2017-07-26 10:16:41', null);
INSERT INTO `wc_managers` VALUES ('7', 'lanxiaoling', null, null, '$2y$10$6W5KVnqMZnrCxup1XM3qberLRnZcUaNMAHYj9cBMRRtiDgtSYz5Ji', 'Lg8WsMAJnOHGxBMIySajkwr4p2D1hpeMW5BIVYYgLG2E4uGdLpa2LTOqrrNC', null, '1', '1', '2017-07-26 15:24:12', '2017-07-29 11:51:34', null);
INSERT INTO `wc_managers` VALUES ('8', 'zengjiamin', null, null, '$2y$10$qjW7z8dngk2ienUzhMr3SeTC.wyxzcCK2begH4vgOCq6P8egDv60e', 'We7SqoAFhn08DKuHRBK99FFdsbG7jKtklxly9exWEXd6us0C4uquJoH4W2cP', null, '0', '1', '2017-07-26 15:24:43', '2017-07-26 15:41:00', null);
INSERT INTO `wc_managers` VALUES ('9', 'shijuying', null, null, '$2y$10$QGqXn/Nl6AjFzxaDOxESZ.CZbUw3xgWjqkZwZNQsBCncg86/mMawK', '1VW8n5U7CbPwdn3xyJZuiJMqfD48NFeHi0Aeg1yZmmY1qeqAHKibgLRtoYJN', null, '0', '1', '2017-07-26 15:41:40', '2017-08-01 09:22:58', null);
INSERT INTO `wc_managers` VALUES ('10', 'chenyingxue', null, null, '$2y$10$hiamOQVBWbETDVH.10KgdOq3AEFj.UNLyCaYpwD0tI2.IONjkPL7K', 'UG2MXVL1GmZOiijLPOJZ8hKrnbnyJdMjVB25XOIJK6NqqHMP3u424oFEvkVD', null, '0', '1', '2017-07-26 15:41:56', '2017-08-01 08:53:13', null);
INSERT INTO `wc_managers` VALUES ('11', 'liuronglian', null, null, '$2y$10$JhSlAO68EjiJnBACnU72zuoqszjeBvc5.U0DSmU2ZWUmJSVgMSskO', null, null, '0', '1', '2017-07-26 15:42:14', '2017-07-26 15:42:14', null);
INSERT INTO `wc_managers` VALUES ('12', 'caiyahui', null, null, '$2y$10$K56bKVzuYToAyvdj7gZqgOvrmZxfQu.Zyt3xMzhBC0LBCA2/M7B/O', 'rDpG1QFGId5FebOK33khgtdrV3kqiZPkqUMNR0brGUOQpgGa5eIsff0UuMpU', null, '0', '1', '2017-07-26 15:42:30', '2017-08-01 14:40:43', null);
INSERT INTO `wc_managers` VALUES ('13', 'shaowenting', null, null, '$2y$10$a0fqacUiwuc30D/n2hxrDORXD0myjbSZ3nbWBMbefpXz2cAPh8xFC', null, null, '0', '1', '2017-07-26 15:42:43', '2017-07-26 15:42:43', null);
INSERT INTO `wc_managers` VALUES ('14', 'chenjing', null, null, '$2y$10$apcsypW9fU2xYxCByfrzG.xZt2F5IpavS0.ZPqUWbp7lODqU0GynO', '7d41IDiodDV2pR4bD9d792J1BU54KDLeJr7pft6XWhb2GLlwFsfMvuu1bATy', null, '0', '1', '2017-07-26 15:43:08', '2017-08-07 18:09:03', null);
INSERT INTO `wc_managers` VALUES ('15', 'zhongling', null, null, '$2y$10$VcG87hspKj1jIYO0QANM5uM5p6.Kdhh.btcpWkvVUjBzKcSvTUp4C', 'BjK0lmpgAeSFOezh35QBLISdSKqvJWKtK7uQyebBI7ZCNMSkDK1VwKlMfpjC', null, '0', '1', '2017-07-26 15:43:22', '2017-08-01 08:55:06', null);
INSERT INTO `wc_managers` VALUES ('16', 'qiuhuirong', null, null, '$2y$10$rPKSFY/x4gWh6x48N7Hw3Ox3PbT6XpUv.zHoq5XtzFqEmHP1Isafu', null, null, '0', '1', '2017-07-26 15:43:34', '2017-07-26 15:43:34', null);
INSERT INTO `wc_managers` VALUES ('17', 'qiujinhua', null, null, '$2y$10$N/gPs4KQH7agTLrzxxd.YepIQtYUqIWWq86ORsaSmnp13OONpB8qO', 'Q7HUPfPWHGwopEXCmvGry7LuVbSUEbP4YNoquTsZEogKzvHho1V0WnQpiaQn', null, '0', '1', '2017-07-26 15:43:48', '2017-08-01 08:51:26', null);
INSERT INTO `wc_managers` VALUES ('18', 'qiuzengping', null, null, '$2y$10$yNFlcyM7mcknBs0.tWxekec9QYRGl0gBE08zoK71nmpfrgh2crwse', '7sslAKgZKfiEVlh2SYQmYbWKT862EZOutn8ZrhIcxDfQIkiC3qcr97ZeiMh1', null, '0', '1', '2017-07-26 15:44:01', '2017-08-01 08:51:34', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=414 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='职位表';

-- ----------------------------
-- Records of wc_positions
-- ----------------------------
INSERT INTO `wc_positions` VALUES ('6', '44', '总裁', '1', '1');
INSERT INTO `wc_positions` VALUES ('7', '44', '员工', '0', '3');
INSERT INTO `wc_positions` VALUES ('8', '44', '经理', '0', '2');
INSERT INTO `wc_positions` VALUES ('9', '45', '开发人员', '0', '3');
INSERT INTO `wc_positions` VALUES ('10', '44', '总监', '0', '2');
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
INSERT INTO `wc_positions` VALUES ('324', '40', '总经理', '0', null);
INSERT INTO `wc_positions` VALUES ('325', '40', '副总经理', '0', null);
INSERT INTO `wc_positions` VALUES ('326', '40', '大区经理', '0', null);
INSERT INTO `wc_positions` VALUES ('327', '40', '搜索销售事业部总经理', '0', null);
INSERT INTO `wc_positions` VALUES ('328', '40', '总监', '0', null);
INSERT INTO `wc_positions` VALUES ('329', '40', '客户经理', '0', null);
INSERT INTO `wc_positions` VALUES ('330', '40', '财务专员', '0', null);
INSERT INTO `wc_positions` VALUES ('331', '40', '采购主管', '0', null);
INSERT INTO `wc_positions` VALUES ('332', '40', 'NET程序员', '0', null);
INSERT INTO `wc_positions` VALUES ('333', '40', '风控监察经理', '0', null);
INSERT INTO `wc_positions` VALUES ('334', '40', '商务经理', '0', null);
INSERT INTO `wc_positions` VALUES ('335', '40', '品牌产品经理', '0', null);
INSERT INTO `wc_positions` VALUES ('336', '40', '研发主管', '0', null);
INSERT INTO `wc_positions` VALUES ('337', '40', '客服经理', '0', null);
INSERT INTO `wc_positions` VALUES ('338', '40', '销售主管', '0', null);
INSERT INTO `wc_positions` VALUES ('339', '40', '经理', '0', null);
INSERT INTO `wc_positions` VALUES ('340', '40', '客服专员', '0', null);
INSERT INTO `wc_positions` VALUES ('341', '40', '美工主管', '0', null);
INSERT INTO `wc_positions` VALUES ('342', '40', '行政专员', '0', null);
INSERT INTO `wc_positions` VALUES ('343', '40', '风控监察专员', '0', null);
INSERT INTO `wc_positions` VALUES ('344', '40', '财务经理', '0', null);
INSERT INTO `wc_positions` VALUES ('345', '40', '美工', '0', null);
INSERT INTO `wc_positions` VALUES ('346', '40', '网盟经理', '0', null);
INSERT INTO `wc_positions` VALUES ('347', '40', '财务支持', '0', null);
INSERT INTO `wc_positions` VALUES ('348', '40', '产品经理', '0', null);
INSERT INTO `wc_positions` VALUES ('349', '40', '主管', '0', null);
INSERT INTO `wc_positions` VALUES ('350', '40', '网盟专员', '0', null);
INSERT INTO `wc_positions` VALUES ('351', '40', '质控经理', '0', null);
INSERT INTO `wc_positions` VALUES ('352', '40', '数据分析员', '0', null);
INSERT INTO `wc_positions` VALUES ('353', '40', '设计师', '0', null);
INSERT INTO `wc_positions` VALUES ('354', '40', '分公司接口人', '0', null);
INSERT INTO `wc_positions` VALUES ('355', '40', '培训专员', '0', null);
INSERT INTO `wc_positions` VALUES ('356', '40', '销售助理', '0', null);
INSERT INTO `wc_positions` VALUES ('357', '40', '市场经理', '0', null);
INSERT INTO `wc_positions` VALUES ('358', '40', '营销顾问', '0', null);
INSERT INTO `wc_positions` VALUES ('359', '40', '质控专员', '0', null);
INSERT INTO `wc_positions` VALUES ('360', '40', '网络管理员', '0', null);
INSERT INTO `wc_positions` VALUES ('361', '40', '培训部经理', '0', null);
INSERT INTO `wc_positions` VALUES ('362', '40', 'PHP程序员', '0', null);
INSERT INTO `wc_positions` VALUES ('363', '40', '市场主管', '0', null);
INSERT INTO `wc_positions` VALUES ('364', '40', '人力行政经理', '0', null);
INSERT INTO `wc_positions` VALUES ('365', '40', '客服主管', '0', null);
INSERT INTO `wc_positions` VALUES ('366', '40', '薪酬绩效主管', '0', null);
INSERT INTO `wc_positions` VALUES ('367', '40', '前端工程师', '0', null);
INSERT INTO `wc_positions` VALUES ('368', '40', '网站客服', '0', null);
INSERT INTO `wc_positions` VALUES ('369', '40', '代理主管', '0', null);
INSERT INTO `wc_positions` VALUES ('370', '40', '行政司机', '0', null);
INSERT INTO `wc_positions` VALUES ('371', '40', 'BD经理', '0', null);
INSERT INTO `wc_positions` VALUES ('372', '40', '市场助理', '0', null);
INSERT INTO `wc_positions` VALUES ('373', '40', '产品专员', '0', null);
INSERT INTO `wc_positions` VALUES ('374', '40', '渠道专员', '0', null);
INSERT INTO `wc_positions` VALUES ('375', '40', '直通车专员', '0', null);
INSERT INTO `wc_positions` VALUES ('376', '40', '客拓专员', '0', null);
INSERT INTO `wc_positions` VALUES ('377', '40', '经理助理', '0', null);
INSERT INTO `wc_positions` VALUES ('378', '40', '客服大区助理', '0', null);
INSERT INTO `wc_positions` VALUES ('379', '40', '直通车审核专员', '0', null);
INSERT INTO `wc_positions` VALUES ('380', '40', '招聘主管', '0', null);
INSERT INTO `wc_positions` VALUES ('381', '40', '市场专员', '0', null);
INSERT INTO `wc_positions` VALUES ('382', '40', '招聘专员', '0', null);
INSERT INTO `wc_positions` VALUES ('383', '40', '策划专员', '0', null);
INSERT INTO `wc_positions` VALUES ('384', '40', '滴滴助理', '0', null);
INSERT INTO `wc_positions` VALUES ('385', '40', '会计', '0', null);
INSERT INTO `wc_positions` VALUES ('386', '40', '项目专员', '0', null);
INSERT INTO `wc_positions` VALUES ('387', '40', '前端工程师实习生', '0', null);
INSERT INTO `wc_positions` VALUES ('388', '40', '运营专员', '0', null);
INSERT INTO `wc_positions` VALUES ('389', '40', '行政主管', '0', null);
INSERT INTO `wc_positions` VALUES ('390', '40', '风控专员', '0', null);
INSERT INTO `wc_positions` VALUES ('391', '40', '出纳专员', '0', null);
INSERT INTO `wc_positions` VALUES ('392', '40', '薪酬绩效专员', '0', null);
INSERT INTO `wc_positions` VALUES ('393', '40', '定单专员', '0', null);
INSERT INTO `wc_positions` VALUES ('394', '40', '财务主管', '0', null);
INSERT INTO `wc_positions` VALUES ('395', '40', '测试专员', '0', null);
INSERT INTO `wc_positions` VALUES ('396', '40', '主办会计', '0', null);
INSERT INTO `wc_positions` VALUES ('397', '40', '设计主管', '0', null);
INSERT INTO `wc_positions` VALUES ('398', '40', '客服专员（实习生）', '0', null);
INSERT INTO `wc_positions` VALUES ('399', '40', '招聘助理（实习生）', '0', null);
INSERT INTO `wc_positions` VALUES ('402', '48', '经理', '0', '1');
INSERT INTO `wc_positions` VALUES ('403', '48', '主管', '0', '2');
INSERT INTO `wc_positions` VALUES ('404', '48', '高级员工', '0', '3');
INSERT INTO `wc_positions` VALUES ('405', '49', '董事长', '1', '0');
INSERT INTO `wc_positions` VALUES ('406', '49', '总经理', '1', '1');
INSERT INTO `wc_positions` VALUES ('407', '49', '总监', '0', '2');
INSERT INTO `wc_positions` VALUES ('408', '49', '经理', '0', '3');
INSERT INTO `wc_positions` VALUES ('409', '50', '经理', '0', '5');
INSERT INTO `wc_positions` VALUES ('410', '51', '总监', '0', null);
INSERT INTO `wc_positions` VALUES ('412', '40', '运营经理', '0', null);
INSERT INTO `wc_positions` VALUES ('413', '52', '经理', '0', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1 COMMENT='产品表';

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
INSERT INTO `wc_products` VALUES ('139', '45', '测试', 'http://www.12t.cn/', 'uploads/company/test/products/img1498121088.jpg', '2017-06-22 16:44:48', '2017-06-22 16:44:48', null);
INSERT INTO `wc_products` VALUES ('140', '45', '测试2', 'http://www.12t.cn/', 'uploads/company/test/products/img1498121109.png', '2017-06-22 16:45:09', '2017-06-22 16:45:09', null);
INSERT INTO `wc_products` VALUES ('141', '45', '测试3', 'http://www.12t.cn/', 'uploads/company/test/products/img1498121149.png', '2017-06-22 16:45:49', '2017-06-22 16:45:49', null);
INSERT INTO `wc_products` VALUES ('142', '47', '1', 'http://www.gbpen.com/article.php?m=3', 'uploads/company/A123/products/img1498719663.jpg', '2017-06-29 14:43:57', '2017-06-29 15:01:03', null);
INSERT INTO `wc_products` VALUES ('143', '47', '2', 'http://www.gbpen.com/article.php?m=3', 'uploads/company/A123/products/img1498719456.png', '2017-06-29 14:44:13', '2017-06-29 14:57:36', null);
INSERT INTO `wc_products` VALUES ('144', '47', '3', 'http://www.gbpen.com/article.php?m=3', 'uploads/company/A123/products/img1498719471.png', '2017-06-29 14:44:22', '2017-06-29 14:57:51', null);
INSERT INTO `wc_products` VALUES ('145', '47', '3', 'http://www.gbpen.com/article.php?m=3', null, '2017-06-29 14:44:55', '2017-06-29 14:44:55', null);
INSERT INTO `wc_products` VALUES ('146', '47', '4', 'http://www.gbpen.com/article.php?m=3', null, '2017-06-29 14:45:14', '2017-06-29 14:45:14', null);
INSERT INTO `wc_products` VALUES ('147', '47', '5', 'http://www.gbpen.com/article.php?m=3', null, '2017-06-29 14:45:24', '2017-06-29 14:45:24', null);
INSERT INTO `wc_products` VALUES ('148', '48', 'a', 'http://diy.12t.cn/', 'uploads/company/zz12t/products/img1498793159.jpg', '2017-06-30 11:25:59', '2017-06-30 11:25:59', null);
INSERT INTO `wc_products` VALUES ('149', '48', 'b', 'http://diy.12t.cn/', 'uploads/company/zz12t/products/img1498793182.jpg', '2017-06-30 11:26:22', '2017-06-30 11:26:22', null);
INSERT INTO `wc_products` VALUES ('150', '49', '统一平台', 'http://gbpen.com/templateShow.php', 'uploads/company/ly12t/products/img1498793368.png', '2017-06-30 11:29:28', '2017-06-30 11:29:28', null);
INSERT INTO `wc_products` VALUES ('151', '49', '百度推广', 'http://www.12t.cn/', 'uploads/company/ly12t/products/img1498793413.jpg', '2017-06-30 11:30:13', '2017-06-30 11:30:13', null);
INSERT INTO `wc_products` VALUES ('152', '49', 'E推', 'http://gbpen.com/ETui.php?show=1', 'uploads/company/ly12t/products/img1498793457.jpg', '2017-06-30 11:30:57', '2017-06-30 11:30:57', null);
INSERT INTO `wc_products` VALUES ('153', '49', '百度信息流', 'http://www.12t.cn/information.html', 'uploads/company/ly12t/products/img1498793579.png', '2017-06-30 11:32:59', '2017-06-30 11:32:59', null);
INSERT INTO `wc_products` VALUES ('154', '50', 'G宝盆', 'http://www.gbpen.com/index.php', 'uploads/company/qz12t/products/img1498809938.png', '2017-06-30 16:05:38', '2017-06-30 16:05:38', null);
INSERT INTO `wc_products` VALUES ('155', '52', 'E推', 'http://www.gbpen.com', 'uploads/company/test12t/products/img1499310050.jpg', '2017-07-06 11:00:50', '2017-07-31 11:23:00', null);
INSERT INTO `wc_products` VALUES ('156', '52', 'G宝盆', 'http://www.12t.cn', 'uploads/company/test12t/products/img1499310061.jpg', '2017-07-06 11:01:01', '2017-07-31 11:23:13', null);
INSERT INTO `wc_products` VALUES ('157', '52', '建站', 'http://www.12t.cn', 'uploads/company/test12t/products/img1499310070.jpg', '2017-07-06 11:01:10', '2017-07-31 11:23:33', null);
INSERT INTO `wc_products` VALUES ('158', '52', '12TSHOP', 'http://www.12t.cn', 'uploads/company/test12t/products/img1499310082.jpg', '2017-07-06 11:01:22', '2017-07-31 11:23:52', null);
INSERT INTO `wc_products` VALUES ('161', '55', '百度信息流', 'http://www.ydbaidu.net/xxl/', 'uploads/company/mzyrt/products/img1499928853.jpg', '2017-07-13 14:54:13', '2017-07-13 15:50:55', null);
INSERT INTO `wc_products` VALUES ('167', '57', '本地直通车', 'http://www.ydbaidu.net/page-ztc', null, '2017-07-14 10:35:21', '2017-07-14 10:35:21', null);
INSERT INTO `wc_products` VALUES ('168', '57', '网站建设', 'http://www.ydbaidu.net/web', null, '2017-07-14 10:36:24', '2017-07-14 10:36:24', null);
INSERT INTO `wc_products` VALUES ('169', '57', '直达号', 'http://www.ydbaidu.net/page-40', null, '2017-07-14 10:38:35', '2017-07-14 10:38:35', null);
INSERT INTO `wc_products` VALUES ('170', '57', '400业务', 'http://www.ydbaidu.net/page-41', null, '2017-07-14 10:39:01', '2017-07-14 10:39:01', null);
INSERT INTO `wc_products` VALUES ('171', '57', '企业SEM', 'http://www.ydbaidu.net/page-42', null, '2017-07-14 10:39:28', '2017-07-14 10:39:28', null);
INSERT INTO `wc_products` VALUES ('172', '57', '贴吧', 'http://www.ydbaidu.net/page-44', null, '2017-07-14 10:39:50', '2017-07-14 10:39:50', null);
INSERT INTO `wc_products` VALUES ('173', '57', '地图', 'http://www.ydbaidu.net/page-45', null, '2017-07-14 10:40:16', '2017-07-14 10:40:16', null);
INSERT INTO `wc_products` VALUES ('177', '54', '百度推广', 'http://m.ydbaidu.net/list-3-1.html', 'uploads/company/54/products/img1500017789.jpg', '2017-07-14 15:36:29', '2017-07-14 15:39:02', null);
INSERT INTO `wc_products` VALUES ('178', '54', '百度信息流', 'http://www.ydbaidu.net/xxl/', 'uploads/company/54/products/img1500018110.jpg', '2017-07-14 15:41:50', '2017-07-14 15:41:50', null);
INSERT INTO `wc_products` VALUES ('179', '54', 'G宝盆统一平台', 'http://www.gbpen.com/', 'uploads/company/54/products/img1500018130.jpg', '2017-07-14 15:42:10', '2017-07-14 15:45:00', null);
INSERT INTO `wc_products` VALUES ('180', '54', '商城', 'http://www.12tshop.com/', 'uploads/company/54/products/img1500018155.jpg', '2017-07-14 15:42:36', '2017-07-14 15:42:36', null);
INSERT INTO `wc_products` VALUES ('181', '54', 'E推', 'http://www.gbpen.com/ETui.php?show=1', 'uploads/company/54/products/img1500018179.jpg', '2017-07-14 15:42:59', '2017-07-14 15:42:59', null);
INSERT INTO `wc_products` VALUES ('182', '54', '百度本地直通车', 'http://www.ydbaidu.net/page-ztc', 'uploads/company/54/products/img1500018230.jpg', '2017-07-14 15:43:50', '2017-07-14 15:43:50', null);
INSERT INTO `wc_products` VALUES ('183', '56', '百度推广', 'http://m.ydbaidu.net/list-3-1.html', 'uploads/company/56/products/img1500088533.jpg', '2017-07-15 11:15:33', '2017-07-15 11:15:44', null);
INSERT INTO `wc_products` VALUES ('184', '56', '百度信息流', 'http://www.ydbaidu.net/xxl/', 'uploads/company/56/products/img1500088598.jpg', '2017-07-15 11:16:38', '2017-07-15 11:16:38', null);
INSERT INTO `wc_products` VALUES ('185', '56', 'G宝盆统一平台', 'http://www.gbpen.com/', 'uploads/company/56/products/img1500088656.jpg', '2017-07-15 11:17:36', '2017-07-15 11:17:36', null);
INSERT INTO `wc_products` VALUES ('186', '56', '商城', 'http://www.12tshop.com/', 'uploads/company/56/products/img1500088783.jpg', '2017-07-15 11:19:43', '2017-07-15 11:19:43', null);
INSERT INTO `wc_products` VALUES ('187', '56', 'E推', 'http://www.gbpen.com/ETui.php?show=1', 'uploads/company/56/products/img1500088960.jpg', '2017-07-15 11:22:40', '2017-07-15 11:22:40', null);
INSERT INTO `wc_products` VALUES ('188', '56', '百度本地直通车', 'http://www.ydbaidu.net/page-ztc', 'uploads/company/56/products/img1500089016.jpg', '2017-07-15 11:23:36', '2017-07-15 11:23:36', null);
INSERT INTO `wc_products` VALUES ('189', '55', '百度推广', 'http://m.ydbaidu.net/list-3-1.html', 'uploads/company/55/products/img1500089677.jpg', '2017-07-15 11:34:37', '2017-07-15 11:34:37', null);
INSERT INTO `wc_products` VALUES ('190', '55', 'G宝盆统一平台', 'http://www.gbpen.com/', 'uploads/company/55/products/img1500089704.jpg', '2017-07-15 11:35:04', '2017-07-15 11:35:04', null);
INSERT INTO `wc_products` VALUES ('191', '55', '网站商城', 'http://www.12tshop.com/', 'uploads/company/55/products/img1500089732.jpg', '2017-07-15 11:35:32', '2017-07-21 10:47:45', null);
INSERT INTO `wc_products` VALUES ('192', '55', 'E推', 'http://www.gbpen.com/ETui.php?show=1', 'uploads/company/55/products/img1500089756.jpg', '2017-07-15 11:35:57', '2017-07-15 11:35:57', null);
INSERT INTO `wc_products` VALUES ('193', '55', '百度本地直通车', 'http://www.ydbaidu.net/page-ztc', 'uploads/company/55/products/img1500089779.jpg', '2017-07-15 11:36:19', '2017-07-15 11:36:19', null);
INSERT INTO `wc_products` VALUES ('198', '59', '百度信息流', 'http://e.baidu.com/', 'uploads/company/59/products/img1500426761.png', '2017-07-19 09:10:10', '2017-07-19 09:12:42', null);
INSERT INTO `wc_products` VALUES ('199', '59', '百度信息流', 'http://e.baidu.com/', 'uploads/company/59/products/img1500426779.jpg', '2017-07-19 09:12:59', '2017-07-19 09:12:59', null);
INSERT INTO `wc_products` VALUES ('200', '59', '百度直通车', 'http://huodong.baidu.com/zhitongche/', 'uploads/company/59/products/img1500426801.png', '2017-07-19 09:13:21', '2017-07-19 09:13:21', null);
INSERT INTO `wc_products` VALUES ('201', '59', '百度直通车', 'http://huodong.baidu.com/zhitongche/', 'uploads/company/59/products/img1500426824.jpg', '2017-07-19 09:13:44', '2017-07-19 09:13:44', null);
INSERT INTO `wc_products` VALUES ('202', '59', '百度糯米团购', 'https://st.nuomi.com/', 'uploads/company/59/products/img1500426850.png', '2017-07-19 09:14:11', '2017-07-19 09:14:11', null);
INSERT INTO `wc_products` VALUES ('203', '59', '百度糯米团购', 'https://st.nuomi.com/', 'uploads/company/59/products/img1500429587.jpg', '2017-07-19 09:59:47', '2017-07-19 09:59:47', null);
INSERT INTO `wc_products` VALUES ('204', '59', '更多产品咨询本人', 'http://m.ydbaidu.net/', 'uploads/company/59/products/img1500429618.jpg', '2017-07-19 10:00:18', '2017-07-19 10:00:18', null);
INSERT INTO `wc_products` VALUES ('207', '60', '百度糯米', 'https://www.nuomi.com/', 'uploads/company/60/products/img1500536995.jpg', '2017-07-20 15:49:55', '2017-07-20 15:49:55', null);
INSERT INTO `wc_products` VALUES ('208', '60', '百度地图', 'http://map.baidu.com/', 'uploads/company/60/products/img1500537745.jpg', '2017-07-20 15:52:58', '2017-07-20 16:02:25', null);
INSERT INTO `wc_products` VALUES ('209', '63', '111', 'http://www.baidu.com', null, '2017-07-26 10:01:30', '2017-07-26 10:01:30', null);
INSERT INTO `wc_products` VALUES ('210', '64', 'sss', 'http://www.gbpen.com', null, '2017-07-26 11:20:26', '2017-07-26 11:20:26', null);
INSERT INTO `wc_products` VALUES ('211', '65', '产品1', 'http://www.baidu.com', 'uploads/company/65/products/img1501050882.jpg', '2017-07-26 14:34:42', '2017-07-26 14:34:42', null);
INSERT INTO `wc_products` VALUES ('212', '65', '产品2', 'http://www.gbpen.com', 'uploads/company/65/products/img1501050924.jpg', '2017-07-26 14:35:24', '2017-07-26 14:35:24', null);
INSERT INTO `wc_products` VALUES ('215', '67', '公司概况', 'http://www.12t.cn/about.html', 'uploads/company/67/products/img1501299015.jpg', '2017-07-29 11:16:00', '2017-07-29 11:30:15', null);
INSERT INTO `wc_products` VALUES ('216', '67', '服务项目', 'http://www.12t.cn/tg_wzjs.html', 'uploads/company/67/products/img1501299080.jpg', '2017-07-29 11:17:12', '2017-07-29 11:31:20', null);
INSERT INTO `wc_products` VALUES ('217', '67', '联系我们', 'http://www.12t.cn/contact.html', null, '2017-07-29 11:17:30', '2017-07-29 11:17:30', null);
INSERT INTO `wc_products` VALUES ('218', '68', '小庭院园艺设计', 'http://gbpen.gz01.bdysite.com/templateShow_detail.php?id=1254', 'uploads/company/68/products/img1501554047.jpg', '2017-08-01 10:20:47', '2017-08-01 10:20:47', null);
INSERT INTO `wc_products` VALUES ('219', '68', '花卉展示', 'http://gbpen.gz01.bdysite.com/templateShow_detail.php?id=1254', 'uploads/company/68/products/img1501554073.jpg', '2017-08-01 10:21:13', '2017-08-01 10:21:13', null);
INSERT INTO `wc_products` VALUES ('220', '70', '样板房精装修', 'http://gbpen.com/', 'uploads/company/70/products/img1501555438.jpg', '2017-08-01 10:41:58', '2017-08-01 10:43:58', null);
INSERT INTO `wc_products` VALUES ('221', '70', '别墅样板房精装修', 'http://gbpen.com/', 'uploads/company/70/products/img1501555359.jpg', '2017-08-01 10:42:21', '2017-08-01 10:42:39', null);
INSERT INTO `wc_products` VALUES ('223', '71', '公司官网', 'http://gbpen.gz01.bdysite.com/templateShow_detail.php?id=1476', 'uploads/company/71/products/img1501556583.png', '2017-08-01 11:02:25', '2017-08-01 11:03:04', null);
INSERT INTO `wc_products` VALUES ('228', '69', '产品服务', 'https://www.baidu.com/', 'uploads/company/69/products/img1501558678.jpg', '2017-08-01 11:37:58', '2017-08-01 11:37:58', null);
INSERT INTO `wc_products` VALUES ('229', '66', '厦门易尔通网络科技有限公司', 'http://www.12t.cn/', null, '2017-08-01 16:02:06', '2017-08-01 16:02:06', null);
INSERT INTO `wc_products` VALUES ('230', '74', '服务项目', 'http://m.xmzhongyun.com/category/27322.html', 'uploads/company/74/products/img1502097249.jpg', '2017-08-07 17:13:10', '2017-08-11 16:34:52', null);
INSERT INTO `wc_products` VALUES ('231', '74', '行业资讯', 'http://m.xmzhongyun.com/category/27300.html', 'uploads/company/74/products/img1502097259.jpg', '2017-08-07 17:13:41', '2017-08-11 16:37:03', null);
INSERT INTO `wc_products` VALUES ('232', '77', '办公室隔断', 'http://www.qzlongshida.com/', 'uploads/company/77/products/img1502099555.jpg', '2017-08-07 17:52:35', '2017-08-07 17:52:35', null);
INSERT INTO `wc_products` VALUES ('233', '77', '办公室高隔', 'http://www.qzlongshida.com/', 'uploads/company/77/products/img1502099582.jpg', '2017-08-07 17:53:02', '2017-08-07 17:53:02', null);
INSERT INTO `wc_products` VALUES ('236', '79', '榕树', 'http://zpysmm.n02.5067.org/category/49767.html', 'uploads/company/79/products/img1502099742.jpg', '2017-08-07 17:55:42', '2017-08-07 17:55:42', null);
INSERT INTO `wc_products` VALUES ('237', '80', '公司网站', 'http://zztltq.n02.5067.org/', 'uploads/company/80/products/img1502099759.png', '2017-08-07 17:55:59', '2017-08-07 17:55:59', null);
INSERT INTO `wc_products` VALUES ('238', '79', '三角梅', 'http://zpysmm.n02.5067.org/category/49768.html', 'uploads/company/79/products/img1502099802.jpg', '2017-08-07 17:56:42', '2017-08-07 17:56:42', null);
INSERT INTO `wc_products` VALUES ('239', '82', '关于我们', 'http://gbpen.com/', null, '2017-08-16 10:47:44', '2017-08-16 10:47:44', null);
INSERT INTO `wc_products` VALUES ('240', '82', '产品服务', 'http://gbpen.com/article.php?m=3', null, '2017-08-16 10:48:23', '2017-08-16 10:48:23', null);

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
  `sort` int(10) DEFAULT NULL COMMENT '排序',
  `link` varchar(255) DEFAULT NULL COMMENT '模板展示地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `templates_name_unique` (`name`) USING BTREE,
  KEY `wc_templates_manager_id` (`manager_id`),
  CONSTRAINT `wc_templates_manager_id` FOREIGN KEY (`manager_id`) REFERENCES `wc_managers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='模板表';

-- ----------------------------
-- Records of wc_templates
-- ----------------------------
INSERT INTO `wc_templates` VALUES ('10', '4', 'W0001MCN01', '1', 'templates/W0001MCN01', '个人模板1', '2017-06-02 15:31:51', '2017-07-28 09:21:37', '1', null);
INSERT INTO `wc_templates` VALUES ('12', '4', 'W0002MCN01', '1', 'templates/W0002MCN01', '个人模板2', '2017-06-02 15:39:22', '2017-07-28 09:22:54', '2', null);
INSERT INTO `wc_templates` VALUES ('15', '4', 'W0005MCN01', '2', 'templates/W0005MCN01', '企业模板3', '2017-06-24 11:28:45', '2017-08-16 14:45:22', '3', 'http://mp.gbpen.com/cardview/e-3125');
INSERT INTO `wc_templates` VALUES ('16', '4', 'W0004MCN01', '2', 'templates/W0004MCN01', '企业模板2', '2017-06-24 11:32:20', '2017-08-16 14:45:39', '2', 'http://mp.gbpen.com/cardview/e-3124');
INSERT INTO `wc_templates` VALUES ('17', '4', 'W0006MCN01', '2', 'templates/W0006MCN01', '企业模板4', '2017-06-30 09:41:51', '2017-08-16 14:45:09', '4', 'http://mp.gbpen.com/cardview/e-3126');
INSERT INTO `wc_templates` VALUES ('18', '4', 'W0007MCN01', '2', 'templates/W0007MCN01', '企业模板5', '2017-06-30 09:42:14', '2017-07-12 10:27:14', '5', 'http://mp.gbpen.com/cardview/e-3127');
INSERT INTO `wc_templates` VALUES ('19', '4', 'W0008MCN01', '2', 'templates/W0008MCN01', '企业模板6', '2017-07-01 11:05:34', '2017-08-16 14:44:41', '6', 'http://mp.gbpen.com/cardview/e-3128');
INSERT INTO `wc_templates` VALUES ('20', '4', 'W0009MCN01', '2', 'templates/W0009MCN01', '企业模板7', '2017-07-01 11:05:57', '2017-08-16 14:44:54', '7', 'http://mp.gbpen.com/cardview/e-3129');
INSERT INTO `wc_templates` VALUES ('21', '4', 'W0010MCN01', '2', 'templates/W0010MCN01', '企业模板8', '2017-07-06 15:24:12', '2017-07-31 15:40:32', '8', 'http://mp.gbpen.com/cardview/e-3130');
INSERT INTO `wc_templates` VALUES ('22', '4', 'W0011MCN01', '2', 'templates/W0011MCN01', '企业模板9', '2017-07-06 15:27:19', '2017-08-16 14:44:23', '9', 'http://mp.gbpen.com/cardview/e-3131');
INSERT INTO `wc_templates` VALUES ('23', '4', 'W0012MCN01', '1', 'templates/W0012MCN01', '个人模板3', '2017-07-06 15:28:52', '2017-07-28 09:24:34', '3', null);
INSERT INTO `wc_templates` VALUES ('24', '4', 'W0013MCN01', '2', 'templates/W0013MCN01', '企业模板10', '2017-07-08 11:11:45', '2017-07-12 10:30:15', '10', 'http://mp.gbpen.com/cardview/e-3132');
INSERT INTO `wc_templates` VALUES ('25', '4', 'W0014MCN01', '2', 'templates/W0014MCN01', '企业模板11', '2017-07-08 11:12:07', '2017-07-12 10:31:03', '11', 'http://mp.gbpen.com/cardview/e-3133');
INSERT INTO `wc_templates` VALUES ('26', '4', 'W0015MCN01', '1', 'templates/W0015MCN01', '个人模板4', '2017-07-08 11:12:28', '2017-07-28 09:18:33', '4', null);
INSERT INTO `wc_templates` VALUES ('27', '4', 'W0016MCN01', '1', 'templates/W0016MCN01', '个人模板5', '2017-07-10 15:17:52', '2017-08-17 11:01:08', '5', null);
INSERT INTO `wc_templates` VALUES ('28', '4', 'W0017MCN01', '2', 'templates/W0017MCN01', '企业模板12', '2017-07-10 15:18:18', '2017-07-24 14:41:32', '12', 'http://mp.gbpen.com/cardview/e-3134');
INSERT INTO `wc_templates` VALUES ('29', '4', 'W0018MCN01', '2', 'templates/W0018MCN01', '企业模板13', '2017-07-18 13:56:57', '2017-07-18 13:56:57', '13', 'http://mp.gbpen.com/cardview/e-3135');
INSERT INTO `wc_templates` VALUES ('30', '4', 'W0019MCN01', '2', 'templates/W0019MCN01', '企业模板14', '2017-07-18 13:57:21', '2017-07-19 09:11:16', '14', 'http://mp.gbpen.com/cardview/e-3136');
INSERT INTO `wc_templates` VALUES ('31', '4', 'W0020MCN01', '1', 'templates/W0020MCN01', '个人模板6', '2017-07-25 08:29:45', '2017-07-28 09:28:44', '6', null);
INSERT INTO `wc_templates` VALUES ('32', '4', 'W0021MCN01', '1', 'templates/W0021MCN01', '个人模板7', '2017-07-25 08:30:09', '2017-07-28 09:42:08', '7', null);
INSERT INTO `wc_templates` VALUES ('33', '4', 'W0022MCN01', '1', 'templates/W0022MCN01', '个人模板8', '2017-07-25 14:26:01', '2017-07-28 09:43:09', '8', null);
INSERT INTO `wc_templates` VALUES ('34', '4', 'W0023MCN01', '1', 'templates/W0023MCN01', '个人模板9', '2017-07-25 14:28:15', '2017-07-28 09:44:06', '9', null);
INSERT INTO `wc_templates` VALUES ('35', '4', 'W0024MCN01', '1', 'templates/W0024MCN01', '个人模板10', '2017-07-25 14:28:41', '2017-07-28 09:45:01', '10', null);
INSERT INTO `wc_templates` VALUES ('36', '4', 'W0025MCN01', '1', 'templates/W0025MCN01', '个人模板11', '2017-07-25 14:29:05', '2017-07-28 09:46:01', '11', null);
INSERT INTO `wc_templates` VALUES ('37', '4', 'W0026MCN01', '1', 'templates/W0026MCN01', '个人模板12', '2017-07-25 14:29:35', '2017-08-17 11:01:24', '12', null);
INSERT INTO `wc_templates` VALUES ('38', '4', 'W0027MCN01', '1', 'templates/W0027MCN01', '个人模板13', '2017-07-26 10:54:38', '2017-07-28 10:06:59', '13', null);
INSERT INTO `wc_templates` VALUES ('39', '4', 'W0028MCN01', '1', 'templates/W0028MCN01', '个人模板14', '2017-07-26 10:55:05', '2017-07-28 10:07:54', '14', null);
INSERT INTO `wc_templates` VALUES ('40', '4', 'W0030MCN01', '1', 'templates/W0030MCN01', '个人模板15', '2017-07-26 17:18:07', '2017-08-15 16:21:05', '15', null);
INSERT INTO `wc_templates` VALUES ('41', '4', 'W0031MCN01', '1', 'templates/W0031MCN01', '个人模板16', '2017-07-26 17:18:25', '2017-07-28 10:08:49', '16', null);
INSERT INTO `wc_templates` VALUES ('42', '4', 'W0032MCN01', '1', 'templates/W0032MCN01', '个人模板17', '2017-07-26 17:18:53', '2017-07-28 09:16:22', '17', null);
INSERT INTO `wc_templates` VALUES ('43', '4', 'W0033MCN01', '2', 'templates/W0033MCN01', '企业模板15', '2017-07-29 11:22:26', '2017-07-31 15:41:14', '15', 'http://mp.gbpen.com/cardview/e-3137');
INSERT INTO `wc_templates` VALUES ('44', '4', 'W0034MCN01', '2', 'templates/W0034MCN01', '企业模板16', '2017-07-29 11:22:45', '2017-07-31 15:41:36', '16', 'http://mp.gbpen.com/cardview/e-3138');
INSERT INTO `wc_templates` VALUES ('46', '4', 'W0036MCN01', '2', 'templates/W0036MCN01', '企业模板17', '2017-07-31 15:43:14', '2017-07-31 16:35:08', '17', 'http://mp.gbpen.com/cardview/e-3139');
INSERT INTO `wc_templates` VALUES ('47', '4', 'W0037MCN01', '2', 'templates/W0037MCN01', '企业模板18', '2017-07-31 15:43:43', '2017-07-31 15:43:43', '18', 'http://mp.gbpen.com/cardview/e-3140');
INSERT INTO `wc_templates` VALUES ('48', '4', 'W0035MCN01', '1', 'templates/W0035MCN01', '个人模板18', '2017-07-31 16:33:26', '2017-07-31 16:33:26', '18', null);
INSERT INTO `wc_templates` VALUES ('49', '4', 'W0038MCN01', '2', 'templates/W0038MCN01', '企业模板19', '2017-08-08 16:27:07', '2017-08-08 16:51:46', '19', null);
INSERT INTO `wc_templates` VALUES ('50', '4', 'W0039MCN01', '1', 'templates/W0039MCN01', '个人模板19', '2017-08-08 16:27:32', '2017-08-08 16:58:58', '19', null);
INSERT INTO `wc_templates` VALUES ('51', '4', 'W0040MCN01', '2', 'templates/W0040MCN01', '企业模板20', '2017-08-08 16:27:59', '2017-08-08 16:27:59', '20', null);
INSERT INTO `wc_templates` VALUES ('52', '4', 'W0041MCN01', '1', 'templates/W0041MCN01', '个人模板20', '2017-08-08 16:28:26', '2017-08-08 16:28:26', '20', null);
INSERT INTO `wc_templates` VALUES ('53', '4', 'W0042MCN01', '2', 'templates/W0042MCN01', '企业模板21', '2017-08-08 16:28:45', '2017-08-08 16:28:45', '21', null);
INSERT INTO `wc_templates` VALUES ('54', '4', 'W0043MCN01', '2', 'templates/W0043MCN01', '企业模板22', '2017-08-08 16:29:03', '2017-08-08 16:50:21', '22', null);
INSERT INTO `wc_templates` VALUES ('55', '4', 'W0044MCN01', '2', 'templates/W0044MCN01', '企业模板23', '2017-08-08 16:29:18', '2017-08-08 16:29:39', '23', null);

-- ----------------------------
-- Table structure for wc_template_group
-- ----------------------------
DROP TABLE IF EXISTS `wc_template_group`;
CREATE TABLE `wc_template_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned DEFAULT NULL COMMENT '公司ID',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '职位名',
  `template_id` int(10) DEFAULT NULL,
  `template_displayname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wc_positions_company_id` (`company_id`),
  CONSTRAINT `wc_template_group_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `wc_companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='职位表';

-- ----------------------------
-- Records of wc_template_group
-- ----------------------------
INSERT INTO `wc_template_group` VALUES ('18', '45', '技术人员型', '22', '企业模板9');
INSERT INTO `wc_template_group` VALUES ('19', '45', '财务部', '28', '企业模板12');
INSERT INTO `wc_template_group` VALUES ('20', '52', '模板2组', '16', '企业模板2');
INSERT INTO `wc_template_group` VALUES ('21', '52', '模板3组', '15', '企业模板3');
INSERT INTO `wc_template_group` VALUES ('22', '52', '模板4组', '17', '企业模板4');
INSERT INTO `wc_template_group` VALUES ('23', '52', '模板5组', '18', '企业模板5');
INSERT INTO `wc_template_group` VALUES ('24', '52', '模板6组', '19', '企业模板6');
INSERT INTO `wc_template_group` VALUES ('25', '52', '模板7组', '20', '企业模板7');
INSERT INTO `wc_template_group` VALUES ('26', '52', '模板8组', '21', '企业模板8');
INSERT INTO `wc_template_group` VALUES ('27', '52', '9组', '22', '企业模板9');
INSERT INTO `wc_template_group` VALUES ('28', '52', '10', '24', '企业模板10');
INSERT INTO `wc_template_group` VALUES ('29', '52', '11', '25', '企业模板11');
INSERT INTO `wc_template_group` VALUES ('30', '52', '12', '28', '企业模板12');
INSERT INTO `wc_template_group` VALUES ('31', '52', '13', '29', '企业模板13');
INSERT INTO `wc_template_group` VALUES ('32', '52', '14', '30', '企业模板14');
INSERT INTO `wc_template_group` VALUES ('33', '52', '15', '43', '企业模板15');
INSERT INTO `wc_template_group` VALUES ('34', '52', '16', '44', '企业模板16');
INSERT INTO `wc_template_group` VALUES ('35', '52', '17', '46', '企业模板17');
INSERT INTO `wc_template_group` VALUES ('36', '52', '18', '47', '企业模板18');
INSERT INTO `wc_template_group` VALUES ('37', '66', '经理', '22', '企业模板9');
INSERT INTO `wc_template_group` VALUES ('38', '66', '主管', '43', '企业模板15');
INSERT INTO `wc_template_group` VALUES ('40', '66', '一线员工', '25', '企业模板11');
INSERT INTO `wc_template_group` VALUES ('41', '76', '业务部', '25', '企业模板11');
INSERT INTO `wc_template_group` VALUES ('42', '76', '采购部', '25', '企业模板11');
INSERT INTO `wc_template_group` VALUES ('43', '76', '生产部', '16', '企业模板2');

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
INSERT INTO `wc_template_useable` VALUES ('15', '47', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('15', '49', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('12', '98', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '95', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '111', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '78', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '129', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '132', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '136', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '139', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '84', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '161', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '151', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '163', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '170', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '176', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '169', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '175', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '158', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '183', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '187', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '188', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '157', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '192', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '195', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '196', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '207', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '197', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '210', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '212', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '204', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '215', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '217', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '193', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '222', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '216', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '200', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '226', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '214', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '185', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '201', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '231', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '229', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '221', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '227', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '223', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '241', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '237', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '141', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '209', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '153', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '250', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '236', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '240', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '162', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '254', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '181', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '124', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('18', '39', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('23', '256', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '267', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '159', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '271', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '198', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('16', '48', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('23', '261', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '273', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '238', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '269', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '106', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('25', '50', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('10', '131', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '285', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '64', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '294', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '275', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '284', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '287', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '296', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '252', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '299', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '298', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '306', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('24', '54', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('27', '319', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '321', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '82', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '295', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '331', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '242', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '327', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '334', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '336', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '333', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '337', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '339', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('22', '57', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('10', '325', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '344', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '345', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '311', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '324', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '167', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('25', '56', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('23', '353', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '355', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '147', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '359', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '320', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '305', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '367', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '368', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '77', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '370', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '375', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '300', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '382', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '379', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('25', '59', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('26', '384', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '386', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '396', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '397', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '392', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('25', '61', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('27', '398', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '394', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '405', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '293', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '190', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '412', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '280', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '408', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '417', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '406', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '409', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '152', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '286', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '312', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '430', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '452', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '455', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '457', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '274', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '424', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '462', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '463', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '464', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '283', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '146', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '180', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '467', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '478', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '85', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '481', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '352', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '482', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '347', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '303', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '480', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '330', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '381', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('25', '60', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('27', '495', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '255', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '472', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '514', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '501', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '498', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '508', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '511', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '172', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '505', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '477', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '504', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '500', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '536', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '533', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '534', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '540', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '541', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '542', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '537', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '510', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '244', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '543', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '548', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '547', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '535', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('22', '55', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('10', '556', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '557', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '562', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '539', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '527', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '518', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '568', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '565', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '566', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '521', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '582', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '590', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '425', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '569', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '373', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '592', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '552', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '598', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '599', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '83', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '360', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '600', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '601', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '602', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '603', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '326', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '328', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '338', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '443', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '606', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '182', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '351', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '612', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '608', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '225', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '614', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '149', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '609', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '613', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('23', '234', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '607', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '174', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '171', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '619', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '623', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '625', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '626', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '629', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('32', '165', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '420', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '145', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '638', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '497', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '133', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '641', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '361', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('35', '342', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '297', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '341', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('34', '348', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '643', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '645', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '314', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '68', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('35', '648', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('33', '649', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('36', '640', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '642', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '636', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('36', '329', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('33', '651', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('32', '644', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('32', '652', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '262', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('32', '371', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('32', '662', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('38', '660', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '164', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '674', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '228', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('33', '676', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '668', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '74', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('37', '683', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('35', '682', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('38', '693', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('34', '702', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('37', '685', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('33', '707', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '679', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('37', '714', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('35', '289', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '173', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('35', '144', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '376', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '741', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('39', '740', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '742', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '746', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '745', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('40', '748', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('36', '233', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('32', '760', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '762', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('33', '765', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('36', '770', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('40', '515', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('35', '578', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('42', '413', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '316', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('32', '75', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('35', '772', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('40', '783', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '421', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '787', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '128', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '790', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('38', '791', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('40', '89', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '487', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '794', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('38', '795', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '689', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('39', '721', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '798', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('42', '72', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('39', '122', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('38', '70', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('42', '109', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '110', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('16', '68', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('44', '70', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('16', '66', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('21', '69', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('22', '71', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('20', '72', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('37', '849', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('16', '73', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('12', '851', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '792', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '80', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '71', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '793', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '290', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('36', '555', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('10', '761', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('35', '266', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('40', '118', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('33', '137', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '947', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('37', '958', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('36', '564', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('40', '961', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('15', '75', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('26', '967', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('18', '74', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('23', '968', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '970', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('37', '621', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('22', '80', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('47', '77', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('21', '79', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('48', '973', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('21', '76', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('19', '78', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('47', '67', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('48', '985', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '507', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('27', '40', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('50', '73', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '996', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('52', '79', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('18', '40', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('33', '62', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '998', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('40', '1001', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('24', '82', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('23', '852', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('16', '45', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('16', '83', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('26', '993', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('40', '66', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('55', '52', 'App\\Models\\Company');
INSERT INTO `wc_template_useable` VALUES ('52', '1008', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('37', '61', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('40', '680', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('36', '916', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('50', '52', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('41', '121', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '461', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('39', '76', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('36', '1037', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '459', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('12', '937', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('31', '918', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('26', '1054', 'App\\Models\\User');
INSERT INTO `wc_template_useable` VALUES ('32', '725', 'App\\Models\\User');

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
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');
INSERT INTO `wc_token` VALUES ('tzhpkfPGoT3d44FZJbwX5DV52R1NfFV7l_VpTCIdZ9uxTDoreAWi6ehpz7Gl_lzaXqSOZwDEcaz2jKPjosjD5QdZnewqr3tXmOmNBjbY8r_urt2om0U9W43b_yl-p36mZHDhAGANVR', '300', '1503389066');

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
  `qrcode` text COMMENT '微信二维码图片',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `homepage` varchar(255) DEFAULT NULL COMMENT '个人网址',
  `sex` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '性别，0-未知，1-男，2-女',
  `description` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `is_active` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '是否可用，0-停用，1-可用',
  `oauth_weixin` varchar(255) DEFAULT NULL COMMENT '第三方授权微信(unionID)',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1094 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of wc_users
-- ----------------------------
INSERT INTO `wc_users` VALUES ('40', 'Hsieh', '1195015834@qq.com', '18450104513', null, '$2y$10$EpikY0DGXqrc1WYSSgZE1.Qja4l.L7W7C6B5hmZGQxYf2oYLmmBL2', 'kYqOZR6K7X8EFlwMwknkI0Wc3C4BqPmxOb9dzagJeONilrkiC4QIMrTQdAf1', '谢大', 'uploads/user/40/img1502414523.jpg', null, null, null, '1', '2017 NBA 总冠军 勇士', '1', 'oruQl1R-dyRj_O8yvnQhlj2SHT60', '2017-05-05 15:32:50', '2017-08-11 16:27:36', null);
INSERT INTO `wc_users` VALUES ('42', 'test', 'test@qq.com', null, null, '$2y$10$qtqFzvlgolbgHaGP9WMlT.vtlrE5Sv2o/KIWDNcHAt4zPKWqoNfhC', 'CqCiIjoyJ3VkQLNTgCy3tagGNaJK7uXqVq5A3AYF8BJqWMVYcrOapR90ig2z', '测试专用号', 'uploads/user/test/img1494214725.png', null, null, null, '0', null, '1', null, '2017-05-08 11:38:45', '2017-06-02 09:11:55', null);
INSERT INTO `wc_users` VALUES ('44', 'userforest001', '164252855@qq.com', '18259175011', null, '$2y$10$EE6LZ.oxqU5QpWOkZtn7ieqiNq90fhDIUuK7R5piDdd4ldxzmfMBO', 'faWBpq81LD7MXwsnhONLu3jLvzPs2EeIbqBxJmnwzDnK1B3BydhnwT8rKIp0', '我的用户名森林001', 'uploads/user/userforest001/img1494291905.jpg', null, null, null, '2', '森林001', '1', null, '2017-05-09 09:05:05', '2017-08-11 10:10:42', null);
INSERT INTO `wc_users` VALUES ('46', 'adduser', '111111@qq.com', '13232323240', null, '$2y$10$umnPHmZvmQIallDcFFLY3eVcq83XC.c7YKkuEiRDp.c3dZD7Cfww.', '7cakrASYfgcsurUD8B4dwHizlBAGEF4xlxwWnfjE4bL1NXDpJLiIuiv4Vfwx', '添加用户', 'uploads/user/adduser/img1494320404.jpg', null, null, null, '0', '001', '1', null, '2017-05-09 16:39:35', '2017-05-09 17:22:30', null);
INSERT INTO `wc_users` VALUES ('50', 'oruQl1TKTP7KP6RjZqJkS2Wvr_iA', null, null, null, '', 'MmOUbSA9tKnPl6Vi3d3tXdK2EJVRERu7zr3FeC0fJ2BOkJwbWn7Ogwy6zgAC', '桑树', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5ZbBiaJjwNDRyUv1uuTJaC8Luz4YqvcR3fa5FdELDiaLsBqSyg4TYicDtlIVmSpqufgsbYpoN5wlmatydXJlrSH5l2/0', null, null, null, '1', null, '1', 'oruQl1TKTP7KP6RjZqJkS2Wvr_iA', '2017-05-13 00:52:09', '2017-05-13 00:53:34', null);
INSERT INTO `wc_users` VALUES ('52', 'oruQl1VpTvnKeGmmA0dC8KPrHPzY', '111@qq.com', '13055208817', null, '', 'hPRCGKwsEvoMkhkfGvXEdziFE1masNujewljWu3sAaM52BwTCbJWMpgkhaKL', '陈杰', 'uploads/user/52/img1500982194.jpg', 'uploads/user/52/img1502960325.jpg', '软件园二期望海路19号', null, '1', 'where there is a willjjjjj\r\n', '1', 'oruQl1VpTvnKeGmmA0dC8KPrHPzY', '2017-05-15 10:07:58', '2017-08-22 11:15:34', null);
INSERT INTO `wc_users` VALUES ('61', 'oruQl1XAFK_yc6VCSATDnJwSIvDE', '527031738@QQ.com', '13696955724', null, '', 'yoUJViB2GCP6op4fEX5XmRMIDBRragpez9eVZ5E7b1BQMwWtttAdXyuaSxLK', '维了王', 'uploads/user/61/img1502871661.jpg', 'uploads/user/61/img1502961461.jpg', '厦门，', null, '1', '厦门易尔通测试仔仔细细一心一意一只蜥蜴仔仔细细休息一下仔仔细细仔仔细细倪敏红米红米红米你公公哦哦', '1', 'oruQl1XAFK_yc6VCSATDnJwSIvDE', '2017-05-19 11:04:32', '2017-08-17 17:16:50', null);
INSERT INTO `wc_users` VALUES ('62', 'oruQl1TMWRsEd_LcV4Zrd4sVqsbA', 'wenhuay@12t.cn', '13666085526', null, '', '17qLy08s5jdFrpcHIn2DUrAM4EX3FH7JTpEhtN7zyYCZtglLEpL9V9qqjNRR', '温华园', 'uploads/user/62/img1500972602.jpg', null, '软件园二期观日路', null, '2', '没有最好，只有更好', '1', 'oruQl1TMWRsEd_LcV4Zrd4sVqsbA', '2017-05-22 11:33:25', '2017-07-25 16:48:25', null);
INSERT INTO `wc_users` VALUES ('63', 'oruQl1ZZAcOxdPOBXzKk09xrwpl0', null, null, null, '', null, '王大锤', 'http://wx.qlogo.cn/mmopen/5HkCBulJjD3mSGQ4NBCibiaXsLibVjicNLgXA82RWQYAmm7SAQliaX9XEakiaodzsFkdnh68cJeUvQ7GGoiaSdpjS5v9Iu2VB0NwPQQ/0', null, null, null, '1', null, '1', 'oruQl1ZZAcOxdPOBXzKk09xrwpl0', '2017-05-22 20:29:03', '2017-05-22 20:29:03', null);
INSERT INTO `wc_users` VALUES ('64', 'oruQl1ffYOU3LcTIPlCqnE5SDoqM', 'luoqiulong@xm12t.com', '15006015782', null, '', null, '百度罗秋龙', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQ43MiaXxWmzdVt6rrozKRAopOwFBg6h1GR71AYrSGSWCVvgvSOt0bI8GAMr5D0Eo6AcicKSHKjAKc3/0', null, null, null, '1', null, '1', 'oruQl1ffYOU3LcTIPlCqnE5SDoqM', '2017-05-23 09:38:55', '2017-07-13 13:08:11', null);
INSERT INTO `wc_users` VALUES ('65', 'oruQl1TEpTmdPslK_xlM4Josq6jY', null, null, null, '', null, '翔着咯', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q2ttraDQhibPchFjN3mib5ulIKbfMeiataG4Zx5QEWgCusEoI1ARHCKicdSvEQSPxI8iaBkn9FI7Y4dPk/0', null, null, null, '1', null, '1', 'oruQl1TEpTmdPslK_xlM4Josq6jY', '2017-05-23 11:00:06', '2017-05-23 11:00:06', null);
INSERT INTO `wc_users` VALUES ('66', 'oruQl1TfHCMVhdEvD5CPrSEbK8x0', '104836658@qq.com', '05923503575', null, '', 'A0umiFS10vYzDcOP3kF2XhV57fpkvsJjdlZziK3CAC51dQ87cZrJMM2vhs2q', '百度&逗逗', 'uploads/user/66/img1500024204.jpg', 'uploads/user/66/img1503363218.jpg', '软件园二期36号', null, '2', '詹小妹', '1', 'oruQl1TfHCMVhdEvD5CPrSEbK8x0', '2017-05-24 10:04:09', '2017-08-21 15:42:10', null);
INSERT INTO `wc_users` VALUES ('68', 'oruQl1Uzz7r3ls6YT_kcB8rvPmBU', 'ccww001@163.com', '18965824221', null, '', 'gWClhjH5f32EAKjHDLi8sjaifTa1Dep721jfUaEfsXAfWXZYkkvOR0AWD5j8', '快乐一家人', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc04PGjdyQICjLEk5CR6oVP1DALAWzdfswvTMU1IuhHARN7iabOfH7PyFlUWWP8DKuSWGmOL4oGykK/0', null, '', null, '1', '', '1', 'oruQl1Uzz7r3ls6YT_kcB8rvPmBU', '2017-05-24 10:12:12', '2017-08-11 15:00:50', null);
INSERT INTO `wc_users` VALUES ('69', 'asdf', null, null, null, '$2y$10$a/ZDTkOSse284ti/2m1Kq.4YFrW6jjKGECxC8v52vmVItsdmPkfL6', 'DNPxRuoFu4dFX4p2tamL3HOTXRkPkTgTvF9dwr5s6TJIwiYdiDLrLNx4ySjy', 'xsxs', null, null, null, null, '0', null, '1', null, '2017-05-25 09:44:54', '2017-06-01 11:12:47', null);
INSERT INTO `wc_users` VALUES ('70', 'oruQl1TWzPaS_-Dwjayi_OGKIH1Y', '1223746977@qq.com', '18159412257', null, '', 'G2ocSV4yxzb5Uue6EexCZLEVRyHZKz6Km1ZQXcG4xFrlyS60MbYrNRtTAGkJ', '陳超', 'uploads/user/70/img1502613554.jpg', null, '易尔通', null, '0', null, '1', 'oruQl1TWzPaS_-Dwjayi_OGKIH1Y', '2017-06-02 10:09:15', '2017-07-01 13:00:13', null);
INSERT INTO `wc_users` VALUES ('71', 'oruQl1Sw9dDq4tjJFcAupq4S4xZw', '690544863linguoxie@msn.com', '13792683804', null, '', 'ORM3h6OCXHs9PQxFUjQerxfGwmUpkNMbZss5XYOkT2PCrf7vjh6H55VirrcE', '溶化于水', 'uploads/user/71/img1501575575.jpg', null, '厦门市思明区软件园二期观日路30号107东侧（百度信誉边上）', null, '1', '你永远不知道明天又是怎么样的一个天气，也永远无法知道明天是怎么样的状态。测试凑字', '1', 'oruQl1Sw9dDq4tjJFcAupq4S4xZw', '2017-06-21 10:01:08', '2017-08-01 16:37:14', null);
INSERT INTO `wc_users` VALUES ('72', 'oruQl1dUZ9RYz6C63AtAmDPvTWpc', 'shuduan530@126.com', '13400605001', null, '', null, 'Cola Bottle', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQzgnqcHDBZ6u0TGdEHFZyHibksFoJaVicsGkS1q4Ak6gqfQicJBUAM7egFZ9rcxM12164b0gJD5KbWD/0', null, null, null, '2', null, '1', 'oruQl1dUZ9RYz6C63AtAmDPvTWpc', '2017-06-21 10:03:33', '2017-06-21 10:05:40', null);
INSERT INTO `wc_users` VALUES ('73', 'oruQl1dq-915rByawNUXV6fLZCj0', '874104943@qq.com', '15880691014', null, '', null, '小凤', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc5LxPiabc5U8PqLxPg0bFFPIArS8SuiaR0QVbfadsddQ0Ccq1JbhSHrdsY94mAN2bzWV91GLAHsUPk/0', null, null, null, '2', null, '1', 'oruQl1dq-915rByawNUXV6fLZCj0', '2017-06-24 09:19:44', '2017-06-24 09:21:30', null);
INSERT INTO `wc_users` VALUES ('74', 'oruQl1WlboYBGjHByFJg_5_L_eRA', 'xuchuanwu@xm12t.com', '13400691209', null, '', null, '武武武', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUY4dibGoq0iao4DtVehw7pvrc3SvjQPLmlmBpkYYdcPN8F2crVXUwob96BICU1c04abqn7hgZ6y71zA/0', null, '翔安区', null, '1', '程序猿', '1', 'oruQl1WlboYBGjHByFJg_5_L_eRA', '2017-06-24 11:32:10', '2017-07-26 16:20:54', null);
INSERT INTO `wc_users` VALUES ('75', 'oruQl1T567s70FVzh8cgLseYMRn4', '562602325@qq.com', '18250716915', null, '', null, '皮尔卡丹', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w4RDQE4qImupeqfnKpaiaXC0P5Mb3lTQaa6aibK0diczgTOS8fkU0veoxicHHkjWjb67fOricFG3QLfKRA/0', null, null, null, '1', null, '1', 'oruQl1T567s70FVzh8cgLseYMRn4', '2017-06-26 17:57:27', '2017-06-26 17:58:26', null);
INSERT INTO `wc_users` VALUES ('76', 'oruQl1fqZUgnggnnLyvaCGkoyLdk', 'jjjj@yhhh.com', '18759925923', null, '', null, 'jacky', 'uploads/user/76/img1500991145.jpg', 'uploads/user/76/img1502986699.jpg', '看看咯快乐', null, '0', '看看具体了', '1', 'oruQl1fqZUgnggnnLyvaCGkoyLdk', '2017-06-27 18:44:09', '2017-07-24 22:28:04', null);
INSERT INTO `wc_users` VALUES ('77', 'oruQl1fqN22ksgoTFiUffpxOdt8A', null, null, null, '', null, '许福生', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM79DckHpLlQEKsPL39vNaMe2vjLgNCUAVA0M6gGGTuVooNPH1sC2kibU2X8RiaIQ9snOA80xBR0L8elCu7HWWkwEzePehOvZmMns/0', null, null, null, '1', null, '1', 'oruQl1fqN22ksgoTFiUffpxOdt8A', '2017-06-28 09:55:36', '2017-07-13 14:15:08', null);
INSERT INTO `wc_users` VALUES ('78', 'oruQl1RlR5Iodl77oKSeiRaI1QWE', '1@q.com', '13860430930', null, '', null, '阿七', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarcxjWLUWtec4ZV5NWQmJVCZuhoEH7E5quGTbmdjwSjibsOkLRibJ9wdmx58s3sC5kZatvGA7CBgAgAl/0', null, null, null, '1', null, '1', 'oruQl1RlR5Iodl77oKSeiRaI1QWE', '2017-06-28 09:57:31', '2017-07-07 15:58:57', null);
INSERT INTO `wc_users` VALUES ('79', 'oruQl1S2rjLblc_EBFASo77FDpNo', 'linyh@xm12t.com', '13625010991', null, '', null, 'LIN', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQibCicmvUP2o0VsGs9AeuBAxhzy2SRl7Dicknq2V3fTJZ7QJuCC2TE5Yd9AL87S7dwgtH08QYPHPticX/0', null, null, null, '1', null, '1', 'oruQl1S2rjLblc_EBFASo77FDpNo', '2017-06-28 09:59:47', '2017-07-13 11:17:42', null);
INSERT INTO `wc_users` VALUES ('80', 'oruQl1acTdfY6bd_gzx29GPJj71o', '821833138@qq.com', '18259265202', null, '', null, '树', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarcxzjzltYxfvZJFnWD3swCIvdnoMSAJfRlNSs28blKRwPMicgsYVibfQrxWW34x25lWdIt9DcIyNcvv/0', null, '思明区软件园二期观日路30号107东侧', null, '2', '不要怕麻烦，因为很多故事都是发生在处理麻烦的路上', '1', 'oruQl1acTdfY6bd_gzx29GPJj71o', '2017-06-28 10:00:35', '2017-08-01 15:55:49', null);
INSERT INTO `wc_users` VALUES ('81', 'oruQl1YzMKuGoGYMB9FO-9k4mZT4', 'a@qq.com', '13812345678', null, '', null, '森晴2', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDGaNM9nVczXoYBUaHnpgzlSpQp9Wt3eI41z2rUJs7xbDibZ5ImbXRZ7yicZmzVFhK7XuicXDnpmH8Bg/0', null, null, null, '2', null, '1', null, '2017-06-28 18:40:10', '2017-08-07 15:27:38', null);
INSERT INTO `wc_users` VALUES ('82', 'oruQl1WecC_YaTK4V-Q0cJxoJAXI', 'zhouyi@xm12t.com', '05923503330', null, '', 'Qb76FDqfnrit3VF8rePkOgVok5FWeJL0XIauxVXMu0aW13f74UhVZldLMRem', '周艺', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUYm7QB6QQBZIoLZibXBogG1TpSrBM90AVt1XFpdVdNJJdb60icquDdNCqbwRqWoCicAKFpeHpzTLysug/0', null, '厦门思明区软件园二期观日路36号201室', null, '1', null, '1', 'oruQl1WecC_YaTK4V-Q0cJxoJAXI', '2017-06-29 10:39:58', '2017-07-13 17:30:07', null);
INSERT INTO `wc_users` VALUES ('83', 'oruQl1TapBIBgy4AD2GluzUFQoJ0', '494885174@qq.com', '15980761413', null, '', '8L0il1UzoCwNyUuwrMC3qKFfqNemJxuEcZkZy9kLIOYpz71ThaGsmvIqoEZr', '南生', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIxJbA71kGleQGNIvqhRGdn40YD0ibicad0pAgicNoCNlr3VmT9zpBaeyvNxFSJaCS1CBpB6aMZBzsibA/0', 'uploads/user/83/img1503301345.jpg', '厦门易尔通网络科技有限公司', null, '1', '我就是我，不一样烟火！', '1', 'oruQl1TapBIBgy4AD2GluzUFQoJ0', '2017-06-29 14:43:53', '2017-08-21 15:41:39', null);
INSERT INTO `wc_users` VALUES ('84', 'oruQl1dCXQjkGTJrQ6Bs0rEdIBWE', 'chenzhowei@xm12t.com', '13255036582', null, '', 'Wtf8NppJB5W7AcFLIotQXdFKasU6MUIjmsoeFkS9fMhhtE3ts14HUNCj3imo', '陈兆伟', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Qy3EjAE1KPrBqsaNyiaKgxrXptussQgAyecO1SllaM39Zm6h4pks8FoV0YbFMSlj9RStkiaPR1MZRs/0', 'uploads/user/84/img1503022956.jpg', null, null, '1', null, '1', 'oruQl1dCXQjkGTJrQ6Bs0rEdIBWE', '2017-06-29 14:46:51', '2017-07-12 17:00:25', null);
INSERT INTO `wc_users` VALUES ('85', 'oruQl1W2r8qu1D0Nu2YgObJQU0i4', 'zhangkeke@xm12t.com', '18859206409', '0592-3503003', '', 'Hl7brdejnbk4IoB8tMy66YMuEm3sQC65CvrjA448QpTJBtFtHkkhZ8qzBebx', '张珂珂', 'uploads/user/oruQl1W2r8qu1D0Nu2YgObJQU0i4/img1498792154.jpg', 'uploads/user/85/img1503022171.jpg', '厦门市思明区软件园二期观日路36号201单元', null, '1', '做百度找易尔通', '1', 'oruQl1W2r8qu1D0Nu2YgObJQU0i4', '2017-06-29 15:11:43', '2017-07-19 14:00:23', null);
INSERT INTO `wc_users` VALUES ('88', 'of6SVwngm5tHI21j3khNIwVrvAnk', null, null, null, '', '3d1hWmpEZmHwpJwypfzlbWqLoTKnQhQzvtPmX6ahArMAVbNXK6zJqnpfrXUv', '曾佳敏', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q0piaM32yYn4W3LZ5zpHiboBUrvKicjfiaHgyQQz8qXBVNsiafdIbdibHFp1fAPlPvBMtianj2b7j6gaSvX/0', null, null, null, '2', null, '1', 'oruQl1ams_5DvkI3st-9gdCxw19w', '2017-06-30 18:01:45', '2017-08-07 17:51:23', null);
INSERT INTO `wc_users` VALUES ('89', 'of6SVwgSGJUY7TO3Pn9vZBKQjtLk', '314318199@qq.com', '18759732195', null, '', null, '陈丹', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB2oKxZ0ib29gibXqZqgK1mNMElUvHKbKnwVkLOPlrNWjqZ2AiaKAKWt1kicFyQVSD2Z7bZRoicibw2pI3A/0', null, null, null, '2', null, '1', null, '2017-07-04 10:48:27', '2017-07-27 13:47:47', null);
INSERT INTO `wc_users` VALUES ('90', 'of6SVwqvA5DUsXFGX8TBW5DhMKq4', 'Guxl@12t.cn', '13600959180', null, '', null, 'Linda.gu', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK0xicCiappMJOEbT1oPkPQ1iaeDY8mniaMsuQ3FxWniavrrfnEMASXJfAVAbXfSAkIdaGZYXPibuhMDkXg/0', null, null, null, '0', null, '1', null, '2017-07-04 16:09:20', '2017-07-04 21:03:24', null);
INSERT INTO `wc_users` VALUES ('91', 'oxuAu08z3VxIpxCOTI24EttsMzcU', null, null, null, '', 'KsNzLXHf9wIYZPmR0Yq5E5o9yoydW9Qh9ibb3lFtJVS7IU5GA4x8ifAnp4Y1', '-', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5ZbBiaJjwNDRyR0oBhVH5HbnfWDLEwy1grQW4nhqpQmXPQzVyQ4vy74veFABRUuTqS4gxjabetXmliauGm9JOEibyE/0', null, null, null, '1', null, '1', null, '2017-07-05 06:11:01', '2017-07-05 06:11:30', null);
INSERT INTO `wc_users` VALUES ('94', 'of6SVwqYZicpWwNd9CJYFrryvt2Q', null, null, null, '', 'TPRlKzUCtfvLzAi0KhwgDkRbuhVvUbPFCBhTafFOwzvMUlJMf53bAfQ6sjb4', 'A-小映子。', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQ9xWzauVIW2p12ghDuXESZ60x3LdIb5txRgMFKbFIDu2vZ85sasprrbEzNLq7ARw9yMPvzHYENVD/0', null, null, null, '2', null, '1', 'oruQl1cxVaPFg7HyFzfM7nswrmxw', '2017-07-05 09:25:23', '2017-08-01 09:43:17', null);
INSERT INTO `wc_users` VALUES ('95', 'of6SVws9UzSc-nYQcIZlvyD9ld7I', null, null, null, '', 'cGCrE7r2R4t6PPQjpvQpz0WVuyQPg0SOrBwvtxAvmOjMcQIBOp7nDfSbrYXM', '喵', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5ZwEQ2cXfumIXJbJzkNFdsdsDh0yiaBYv0IZxkv39ak9ibC6EQHUDliaicntWRfOgfNFv4lAWZD9Re6LJ/0', null, null, null, '1', null, '1', 'oruQl1X6dTuiss5ivSPoH_p7tH3E', '2017-07-05 09:25:44', '2017-08-01 09:43:37', null);
INSERT INTO `wc_users` VALUES ('96', 'of6SVwh-Z43eRm3w4wUKbxBDlCcg', null, null, null, '', null, 'Sally', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUZ5d1UL9wKCdHT1D1ib0icHh5heRM1LcUEOjHzJgLScGLsRKfoK3qDLM2xTmbOgwb4SDCLFD3kKeYIFaLMCOC0kNU/0', null, null, null, '0', null, '1', null, '2017-07-05 09:26:22', '2017-07-05 09:26:22', null);
INSERT INTO `wc_users` VALUES ('97', 'of6SVwiHaPYwfFnfGOk8OuJjNxKk', null, null, null, '', null, '????', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJQVro7NGmqpkG84YbuicJ7vGRING2pXOwq6nicoQQY2ia7qic9lLnqP02ibcvP61uf3JzRKRyiaGLxJjsg/0', null, null, null, '2', null, '1', 'oruQl1cyV8KsTGRdcXK92ItCDQXE', '2017-07-05 09:26:24', '2017-07-05 09:26:24', null);
INSERT INTO `wc_users` VALUES ('98', 'of6SVwmHJE2UKXBIeIcRMcuTlfCk', null, null, null, '', 'xXVJQfk1lgFWYqtetYDBD1bKgZYUMIuDalAphyI5g7VlU0SF0IQBOoyjkxCV', '陈静', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5QFlXtBEgOPJCmN1P5UtlP8TibLC8Qib8uBREOhFEibp6PJqsfRmk2DJQEqFIjMnTvnRms7UelQVCYZ20nSlQexXdj/0', null, null, null, '2', null, '1', 'oruQl1T748wuuQEuCA6x-U_yQMyc', '2017-07-05 09:26:36', '2017-08-01 10:51:03', null);
INSERT INTO `wc_users` VALUES ('100', 'of6SVwspipTya16GlpMSsEGngabY', null, null, null, '', null, '南方姑娘', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8buedzpRhmAHq0ChoWz7bWNZdtqu3xcVGuJ8cgmIDYxw9eLpFZJ4G9ykHEDNBvBIpkMI3x9hbvxw2c6V/0', null, null, null, '2', null, '1', 'oruQl1SxPWyZnvEoL6I6EcoXYlv4', '2017-07-05 09:28:04', '2017-07-05 09:28:04', '2017-07-26 15:19:09');
INSERT INTO `wc_users` VALUES ('101', 'of6SVwp3dMbrPG8cOtdkW9Xplqto', null, null, null, '', 'P3btqu31hxn1Elu2EK4WC2Oz8Q9VCnHm8XelN5HyI1HXym52mx8SP2leBwK7', '旧时光-', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5Z75PG0lkluyd9gxjPbbJnDp5SP8uXqg1CUzSKGH79lkmVFcL8PwmnibibJI9MouxqCzGDCZ3MicstAu/0', null, null, null, '2', null, '1', 'oruQl1VuYgN_gZs6APk1kDMiRK8M', '2017-07-05 09:31:57', '2017-08-01 10:56:03', '2017-07-26 15:19:21');
INSERT INTO `wc_users` VALUES ('102', 'of6SVwrfSpOjv6t8p35UcT2Op4I4', null, null, null, '', null, '許憼鋒', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc38K3sEiaXYMIthOHmkvl00mMEMSQNGcyps82l36xeZym6KYg4aFDcPRcVAbH2cnFf1XT1KyJ5G1r/0', null, null, null, '1', null, '1', null, '2017-07-05 09:36:08', '2017-07-05 09:36:08', null);
INSERT INTO `wc_users` VALUES ('105', 'of6SVwq0r2ifaMa5gcLYCXpumrlQ', null, null, null, '', null, '夕颜', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI32fOia3yD8t9ch5RcmIEyZA8Qug2576jibSl8bOCudZ4ChuUIUDxfJpt0mfle6IphCqXrn231AWicA/0', null, null, null, '2', null, '1', 'oruQl1XX-SsBe4rH-3cNGZeeFP0Q', '2017-07-05 10:17:41', '2017-07-05 10:17:41', '2017-07-26 15:19:54');
INSERT INTO `wc_users` VALUES ('108', 'oruQl1bck11tgHFoB7Ir4dF-VTmk', null, null, null, '', null, '施冬峰', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc8TicFDhm0VRPH6xDI0bj7ppIBjXvwSk0QdrXaZm2I3lE1wwaXhibRhfXxgzpQicHEjtqshrd7jaiaxO/0', null, null, null, '1', null, '1', 'oruQl1bck11tgHFoB7Ir4dF-VTmk', '2017-07-05 10:23:48', '2017-07-21 09:17:07', null);
INSERT INTO `wc_users` VALUES ('109', 'oruQl1b3lpXGBWA-Nb0YxeqfSyuU', 'Liuxl@xm12t.com', '13779989640', null, '', null, '乖乖', 'http://wx.qlogo.cn/mmopen/rIQuAY6Wvlqa2XDegSH1wrtz7EiaIpekxbOWwiaf2jS5fB5ucCXWguOCUK85EAagn4CWibOFHyYyx8ES665ia5iawaPe6xS6QO44m/0', null, '厦门市软件园二期观日路36号201', null, '2', '谋定而后动！', '1', 'oruQl1b3lpXGBWA-Nb0YxeqfSyuU', '2017-07-05 10:25:12', '2017-07-13 16:47:37', null);
INSERT INTO `wc_users` VALUES ('110', 'oruQl1Tf_BM6rkKfJutxQdcCjwDQ', 'denglinshan@xm12t.com', '13559243226', null, '', null, '邓琳珊', 'uploads/user/110/img1500867521.jpg', null, null, null, '2', null, '1', 'oruQl1Tf_BM6rkKfJutxQdcCjwDQ', '2017-07-05 10:25:29', '2017-07-24 11:39:35', null);
INSERT INTO `wc_users` VALUES ('111', 'oruQl1VEbmmElROPVG8Ehbxm199c', 'zhangzhimou@xm12t.com', '15860783104', null, '', null, '百度推广---张志谋', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQxib1sgjcdWmS78PVg0hy8sziaibnYpzx4ckrU2ahbTxjuJ6MANd9DmINnwJJDWuOjWpGvvQz6oqns9/0', null, '厦门市思明区软件园二期观日路36号201', null, '1', '努力改变人生', '1', 'oruQl1VEbmmElROPVG8Ehbxm199c', '2017-07-05 10:26:00', '2017-07-14 10:15:17', null);
INSERT INTO `wc_users` VALUES ('113', 'of6SVws1NxmJAnQs465T9GP9xs5E', null, null, null, '', null, 'jacky', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w7icXOgibo1ic5A7ic2bAOqZH4nCLjlSm3YE5HFHK6gdiayicMebgkddT6YMKchm9GdvYWlUMR9GDsKUQqe4jDnvPMS97/0', null, null, null, '0', null, '1', null, '2017-07-05 17:39:09', '2017-07-05 17:39:09', '2017-07-26 14:16:12');
INSERT INTO `wc_users` VALUES ('114', 'of6SVwlawjvsNOEqbLqf9FQ1KWXA', null, null, null, '', null, 'S，', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ1KTI7Cicms1VSibeudhCe8RSZfwHBaAJwbcSbYFJQkkA5HViboUlKGY0DxnNzaLJjqldUrECByZfOg/0', null, null, null, '1', null, '1', null, '2017-07-05 19:33:35', '2017-07-05 19:33:35', null);
INSERT INTO `wc_users` VALUES ('118', 'oruQl1TqbBGKDa5eDbyjavdHNgqA', null, null, null, '', 'spmaYF21dfL89xAtZknXS6CJZXKNSOk5SlwpOQpRUZMRZrfZEppxY8ppR1qe', '小娉', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCF8qb14OpTKAleeXic6C5J6uicgaVveoVNQfxrrkJric41lgJP25VZ58Jg25l58eNTZMDic1ffXHCggQ/0', null, null, null, '2', null, '1', 'oruQl1TqbBGKDa5eDbyjavdHNgqA', '2017-07-06 11:31:14', '2017-08-11 15:37:04', null);
INSERT INTO `wc_users` VALUES ('121', 'oruQl1Y6Z36gxIfNw0ArkLi3ChHI', 'gaohan@xm12t.com', '13555559999', null, '', 'bx8XtYDsoeebA7RkWfd7aXDz3R14L07tryBH92EFziLQKFjNPtnwOymKBLct', '高涵', 'uploads/user/121/img1502870909.jpg', 'uploads/user/121/img1502960320.jpg', '厦门市思明区软件园二期观日路36号201单元', 'http://www.gbpen.com/', '2', 'サイン\r\nqingming\r\n签名\r\n厦门易尔通网络科技厦门易尔通网络科技厦门易尔通网络科技厦门易尔通网络科技厦门易尔通网络科技厦门易尔通网络科技', '1', 'oruQl1Y6Z36gxIfNw0ArkLi3ChHI', '2017-07-06 13:58:25', '2017-08-19 11:42:41', null);
INSERT INTO `wc_users` VALUES ('122', 'oruQl1XLIuhvYCGCHJsabzWPmbOk', 'liusongqiong@xm12t.com', '18850306322', null, '', null, '刘松琼', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKMZJHia5sXQKxODU7QakbTCYFHukl2cicqicyicyDasHJD4MkkgiceSuS3qzQKNfZeSF02zcUlL37uqoQ/0', null, null, null, '2', null, '1', 'oruQl1XLIuhvYCGCHJsabzWPmbOk', '2017-07-07 11:34:49', '2017-07-07 11:38:19', null);
INSERT INTO `wc_users` VALUES ('123', 'oruQl1VeBZH9Kc3B3tkZgh2BWL0M', 'linxy@12t.cn', '13459218581', null, '', null, '林小燕', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC8qzCSbZuekQRuruBbUFwH5pW0eKNWCmbxFujdr9CFKyQLYTDCZozqMicXWtPEqiaan9YQjnwgJibFQ/0', null, null, null, '2', null, '1', 'oruQl1VeBZH9Kc3B3tkZgh2BWL0M', '2017-07-07 14:50:40', '2017-07-07 15:14:49', null);
INSERT INTO `wc_users` VALUES ('124', 'oruQl1VZXbEqZwjL3khlAsgKZoJg', null, null, null, '', null, 'Aka 七仔         ????', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5QeQLibMhoaCtIrGqKQDaPPWebiaKAZYyRqegY7FrfODH2rbSm4LufaicwY5ApKqT2o1r602jffjwOBw/0', null, null, null, '1', null, '1', 'oruQl1VZXbEqZwjL3khlAsgKZoJg', '2017-07-07 15:54:34', '2017-07-07 15:54:34', null);
INSERT INTO `wc_users` VALUES ('125', 'oruQl1WXl8CpDLTIOf_RXBLDdmSQ', null, null, null, '', null, '乔装。', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJMmt2VCM8dh4AFz0kCezWLqZht9vwEMH9NdfEfvGeTm5BP2hiczhLVswp78XVr8iacDicrvTkWjHyFg/0', null, null, null, '0', null, '1', 'oruQl1WXl8CpDLTIOf_RXBLDdmSQ', '2017-07-07 15:58:50', '2017-07-07 15:58:50', null);
INSERT INTO `wc_users` VALUES ('126', 'oruQl1bBqltXFB7cdpPxKRnVVCec', null, null, null, '', null, 'lansing', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4qcX1cHmTPicSXHnibEnOymEDZ0bEpx2HjxniaEhyUibRn0ruIiaDrxZG8bhkyKr74SLFcbTNq2MgY9fg/0', null, null, null, '2', null, '1', 'oruQl1bBqltXFB7cdpPxKRnVVCec', '2017-07-07 15:58:53', '2017-07-07 15:58:53', null);
INSERT INTO `wc_users` VALUES ('127', 'oruQl1Xqe5EB-Vx103TxdVREDJ1s', null, null, null, '', null, '张淑云', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDE9Cxjo6DZw7Pia7CKGCibdE44q0wQMpS3FPG8u4WgI5x1Py6rRFulbNKVbDuPZ3WOvtAA5y6QISyg/0', null, null, null, '2', null, '1', 'oruQl1Xqe5EB-Vx103TxdVREDJ1s', '2017-07-07 16:01:48', '2017-07-07 16:01:48', null);
INSERT INTO `wc_users` VALUES ('128', 'oruQl1RVs-P0qOTE3vSemhGsAkxs', '362622929@qq.com', '15906061498', null, '', null, '水月', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc4nRbupdtcubiawhiaGB0kTRaAcJYyAiam5nKffebRlmpHVtjuoWDZojug1jZEW2WS8YTO7KCNuAiaEU/0', null, null, null, '2', '没个性，不签名！', '1', 'oruQl1RVs-P0qOTE3vSemhGsAkxs', '2017-07-07 16:01:49', '2017-07-27 10:49:05', null);
INSERT INTO `wc_users` VALUES ('129', 'oruQl1cQmaVPO3o8x25hZPhH66pQ', 'huanglili1@xm12t.com', '15080409909', null, '', null, '????ng丽丽', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8buedicstPmhrT8AHzBDcDPNst48RfRfSg7lMO6ZKJ8oXDDJuic0oH3QP0fSFltrdvGNdlRlPTzLv2KZZ7/0', null, '亚特写字楼4楼', null, '2', '“愿你是披荆斩棘的大英雄\r\n也是让人疼爱的小朋友”', '1', 'oruQl1cQmaVPO3o8x25hZPhH66pQ', '2017-07-07 16:11:22', '2017-07-07 16:13:49', null);
INSERT INTO `wc_users` VALUES ('130', 'oruQl1YRXiRMSQ8MY0pYvSR5QKn8', '1045888735@qq.com', '15159576198', null, '', null, '陈建彬', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5Zy1ibF7h4kiauyHtgGjLwuO2x827S0ia2d6NO8WPsnUh961NiaNHIqkwo3lCpYibJOiayq1e7zCLhuNpK2/0', null, '厦门市软件园二期观日路36号201单元 ', null, '1', '网站制作策划专员', '1', 'oruQl1YRXiRMSQ8MY0pYvSR5QKn8', '2017-07-07 16:15:03', '2017-07-10 16:09:49', null);
INSERT INTO `wc_users` VALUES ('131', 'oruQl1VwDQgI1hoXtE1jxnBmDk2w', '327251778@qq.com', '13459270739', null, '', null, '刘杜灿', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUYU40lkUbKd70BoSibZCvY0PfpvHbO6U2Zk7ntUHCWwfux4kGuiayF0M4Phkt9icD3bThU3HosvXJCEw/0', null, '泉州市丰泽区少林路仁风工业区亚特写字楼4楼', null, '1', '爱拼才会赢', '1', 'oruQl1VwDQgI1hoXtE1jxnBmDk2w', '2017-07-07 16:19:25', '2017-07-07 16:22:22', null);
INSERT INTO `wc_users` VALUES ('132', 'oruQl1R2S26HR64p4EzIEufMDYNE', null, null, null, '', null, '百度互联网策划   叶威威', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5Z41cicPhKMAwTia9yMAZsnFjVOcSeVQPFfy5NXW6JIxnJkqsDXTEBZGbQn5qZUvGHhRk36rdogIJw2/0', null, null, null, '1', null, '1', 'oruQl1R2S26HR64p4EzIEufMDYNE', '2017-07-07 16:41:13', '2017-07-07 16:41:13', null);
INSERT INTO `wc_users` VALUES ('133', 'oruQl1b-5VkstBRoK3YiBnuzhSrU', '1805751576@qq.com', '15059557357', null, '', null, '余美华', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5SGWSlWv1zhXwzGp3H0mFNARoAdJfgwbxtOVCLKfMIfXU6XYzSccZ5fQem6wTNRk4WibjGGuUmZAHAfFBs5Lz476/0', null, '泉州少林路亚特写字楼4楼', null, '2', '主营产品：百度推广、网盟推广、百度信息流广告、品牌推广（品牌专区、品牌起跑线、品牌华表）、百科微站、企业网站建设（企业官网、商城）、微官网、官网认证。身边有朋友要做的，可以来联系我哈。', '1', 'oruQl1b-5VkstBRoK3YiBnuzhSrU', '2017-07-07 17:08:23', '2017-07-25 11:46:40', null);
INSERT INTO `wc_users` VALUES ('134', 'oruQl1aUi0Npb95Z7uLTDFEHmKbo', null, null, null, '', null, '????猫耳', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCusCxyCXDPH19WmvP9pp7CgmiaqpWW4USxWQeRxXlTicAia1lqKB4icskx5uqqO708hkwHUcmzxQ2MicA/0', null, null, null, '2', null, '1', 'oruQl1aUi0Npb95Z7uLTDFEHmKbo', '2017-07-07 17:10:06', '2017-07-07 17:10:06', null);
INSERT INTO `wc_users` VALUES ('135', 'oruQl1XXqepmvrn5A47l6AQ-zCo0', 'linyd@12t.cn', '13808524119', null, '', null, '林无敌', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUZPd2XK2RdS6skDjYjEoMCKDnBk7SBMIU0JAtV8hkyTlg2D8xq3v6wuqwKiahrvgA88wLgFpdIfiaOg/0', null, '泉州市丰泽区少林路仁风工业区亚特大厦4楼', null, '1', '无敌一下，你就知道', '1', 'oruQl1XXqepmvrn5A47l6AQ-zCo0', '2017-07-07 17:20:26', '2017-07-07 17:22:01', null);
INSERT INTO `wc_users` VALUES ('136', 'oruQl1e4zDitW2TzFOjI6kX-H164', '907492935@qq.com', '15859506993', null, '', null, '假好人。', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc98aKIoXeqvqicSSN6W4GzRHLBux81DfbvexhQg4F2gDUsQSAMAteTX8bUox7crUhMoDGTcKbuI6o/0', null, null, null, '2', null, '1', 'oruQl1e4zDitW2TzFOjI6kX-H164', '2017-07-07 17:28:44', '2017-07-07 17:30:58', null);
INSERT INTO `wc_users` VALUES ('137', 'oruQl1RPj6nKq6dt4oSVeWfveaFc', 'wangping@xm12t.com', '15871655519', null, '', null, '王平', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80QibIKDYJQwJ1s55X0eLPIRlOFDjmQtg8WLY2eqiaA6ZQ09LqTl82160mezRCxKibQFlpOKUcZRFCz45/0', null, '厦门易尔通网络科技有限公司', null, '2', null, '1', 'oruQl1RPj6nKq6dt4oSVeWfveaFc', '2017-07-07 17:53:16', '2017-08-05 10:45:10', null);
INSERT INTO `wc_users` VALUES ('138', 'oruQl1Sf9NxmkBJrM1ItAFRIQgHs', null, null, null, '', null, 'A百度-谢林林', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQibk9ewIgw7UtL3hyV4AyRnvV3Hia5E6TYzwibDNLGxQf1Fj8GZrhERyib72GyLE1oLhXOyEXq4hnrsH/0', null, null, null, '1', null, '1', 'oruQl1Sf9NxmkBJrM1ItAFRIQgHs', '2017-07-07 17:56:19', '2017-07-07 17:56:19', null);
INSERT INTO `wc_users` VALUES ('139', 'oruQl1eWONJC10C_r9YP1JR_P2_k', '55018407@qq.com', '13606060050', null, '', null, '朱凯民', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5Z7hh7eYzPSCOSM0Bcvgib7ibRqVgc2sPxPXB9BGC9pRpjXJCJFSsDpQtS5y4uiaprSPRWcOTBhusibNg/0', null, '软件园二期观日路36号201', null, '1', null, '1', 'oruQl1eWONJC10C_r9YP1JR_P2_k', '2017-07-07 17:58:43', '2017-07-07 18:28:27', null);
INSERT INTO `wc_users` VALUES ('140', 'oruQl1dV0hteGIfccZaWJ7IgQryI', null, null, null, '', null, '@个人', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8buedxZfjcrqR4ZkibByTRE7yteKqFMzwV4Cxia8xzy3jKM4mzb4aIL3icIQicbZK5Fh30DDPV3vqYISne5V/0', null, null, null, '2', null, '1', 'oruQl1dV0hteGIfccZaWJ7IgQryI', '2017-07-07 21:58:50', '2017-07-07 21:58:50', null);
INSERT INTO `wc_users` VALUES ('141', 'oruQl1dLjQTU112OlhtVLpjvuGJk', null, null, null, '', null, '厦门百度蒋铃溪', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8bued3TXX8LdgxiaX248RWT6AV3XAGRPsrKGo0vqghLYMApE2miaLZw1JlucTTdsibTDK5d8ibj22dtIPTLB/0', null, null, null, '2', null, '1', 'oruQl1dLjQTU112OlhtVLpjvuGJk', '2017-07-07 22:20:04', '2017-07-07 22:20:04', null);
INSERT INTO `wc_users` VALUES ('142', 'oruQl1Z0y8fiSPB3E9BemBGAyNbA', null, null, null, '', null, '吴一帆', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8bued8YxcibNNpQiaPf47NMv33f8GXCyylMQF9j6w38g2xm0KAZacr4b45eictm67rdOMLdFxJLGD6Tuorh/0', null, null, null, '1', null, '1', 'oruQl1Z0y8fiSPB3E9BemBGAyNbA', '2017-07-08 10:33:32', '2017-07-08 10:33:32', null);
INSERT INTO `wc_users` VALUES ('143', 'oruQl1TEyQDB4CNbyk5jP4o0RiZY', null, null, null, '', null, 'Neon Trees', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKV6rgDD9Qa6bAibQXhwjrTGwWZelxZSepDBJNOZDct7STjaI2qXcQddCPic9zejF7zYmHoua5Z3e8g/0', null, null, null, '1', null, '1', 'oruQl1TEyQDB4CNbyk5jP4o0RiZY', '2017-07-08 10:33:39', '2017-07-08 10:33:39', null);
INSERT INTO `wc_users` VALUES ('144', 'oruQl1bylBk3J9wHxtNNagrVDWd0', 'pengxiaoting@xm12t.com', '13067029418', null, '', null, 'Tiny', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc77ROsqPlicjd3alibHalCPo4Sa2voPpxVz4QmSxjn3asyRpOrQspOlaZ1Tvgu2ffZqs72aN1xZWcC/0', null, null, null, '2', null, '1', 'oruQl1bylBk3J9wHxtNNagrVDWd0', '2017-07-08 11:00:02', '2017-07-26 17:02:30', null);
INSERT INTO `wc_users` VALUES ('145', 'oruQl1QizGQ-MHj6wuYmleWL6928', 'jiyj@12t.cn', '13906946160', null, '', null, '纪亚娇', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc5gtiaGTHiatLXgGHtKXLR6CKiaEbPyFfJsmemM9ZWpNtEcgicklsicdqcz1jCaZsl0eibuF5u3b1godmt/0', 'uploads/user/145/img1503387267.jpg', '万达百货6楼', null, '2', '快乐工作，快乐生活！', '1', 'oruQl1QizGQ-MHj6wuYmleWL6928', '2017-07-10 12:28:19', '2017-07-25 09:34:49', null);
INSERT INTO `wc_users` VALUES ('146', 'oruQl1TgCnaOlwIJdr72p0ssnidw', 'weiyq@xm12t.com', '15006002942', null, '', null, '魏奕强', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8buedyaib6HmOwjSwo093iablvMbbxBkiayaq34aAXjqyezAPKjbWUK289cQYdjDTN5oicyCbgaHg6AnPU52/0', null, '龙岩市新罗区商务板块C栋508', null, '1', null, '1', 'oruQl1TgCnaOlwIJdr72p0ssnidw', '2017-07-10 14:59:57', '2017-07-20 11:31:21', null);
INSERT INTO `wc_users` VALUES ('147', 'oruQl1eoIRbIhzpjPEyfxCQuo0-c', 'aiwa@12t.cn', '13599540060', null, '', null, 'Aiwa', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKQLGHbMZ7sib9lpIiaDFD3yBicsLQbkAicdTBOgSGk4pCgD0j0ov8R9s1xibpbzYzd0nCNmSe076JjzNg/0', null, '厦门市思明区软件园二期观日路36号201', null, '2', '专注互联网营销十三年', '1', 'oruQl1eoIRbIhzpjPEyfxCQuo0-c', '2017-07-10 15:00:12', '2017-07-14 19:33:29', null);
INSERT INTO `wc_users` VALUES ('148', 'oruQl1RwFt0CYGAk02oLMXn_hq6w', 'weitx@xm12t.com', '18760353822', null, '', null, '魏婷霞@百度', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUZKrru40WUvwKAGWn4HySZibHDeMvyicQQKhxqSxpUE678TicU7CtsxicWT9Quic3tooPuCnDyKVlnpo1A/0', null, null, null, '2', null, '1', 'oruQl1RwFt0CYGAk02oLMXn_hq6w', '2017-07-10 15:04:43', '2017-07-10 15:05:14', null);
INSERT INTO `wc_users` VALUES ('149', 'oruQl1ef7TToij5SWgfnqCkzC7iI', '923746995@qq.com', '13400655319', null, '', null, '林海滨', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBm8DZLbOZf5ia3TtZQjCIibkscgxvEq9ShKkOdVb5P0rT9u5y4NqV2xibhB5Chmjwp1T4C3hyBzCIpw/0', null, '厦门思明区软件园二期观日路36号楼之二201厦门易尔通网络科技有限公司', null, '1', null, '1', 'oruQl1ef7TToij5SWgfnqCkzC7iI', '2017-07-10 15:04:48', '2017-07-24 17:47:08', null);
INSERT INTO `wc_users` VALUES ('150', 'oruQl1UJ0WuFno8eLJ5tjszTsBfI', null, null, null, '', null, '百度推广+网站建设林生凑', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8bued9I9q2tWic8h840sltjYeLT8DfLFH4FC5B5njzHRS0wN0Hst0iaicNeMF87ljFY8A5k6oM9BLPNrN3U/0', null, null, null, '1', null, '1', 'oruQl1UJ0WuFno8eLJ5tjszTsBfI', '2017-07-10 15:05:07', '2017-07-10 15:05:07', null);
INSERT INTO `wc_users` VALUES ('151', 'oruQl1YnfEqGLvd8-_Nc8xj0or-Y', '1019928283@qq.com', '18850014291', null, '', null, '百度吴启建18850014291', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5ZzzH8ibbtZeJFia3gerRy0RIf8joYkTlvYj8Qia7NiaOf8FUh7VMlsz3RKfeEiaCbbibAbLF9Vtia9xP0Xu/0', null, '厦门市软件园二期观日路36号楼201单元', null, '1', '百度推广、百度糯米、百度百科、百度品牌推广、网站建设、邮箱等', '1', 'oruQl1YnfEqGLvd8-_Nc8xj0or-Y', '2017-07-10 15:05:09', '2017-07-10 15:15:11', null);
INSERT INTO `wc_users` VALUES ('152', 'oruQl1T6mMGLFkFjB6Yza1vZz6rw', 'yinhuanhuan@xm12t.com', '13599659573', null, '', null, '百度欢欢', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5ZbBiaJjwNDRyVpdziaV0cicxCUAyHSXD7jUOkzlibqYmP14Mp98GAUg43qGJ7IzJonykgickYFWaZg0To62fxBSNKJt/0', null, '万达广场百货六楼百度', null, '1', '笑出腹肌', '1', 'oruQl1T6mMGLFkFjB6Yza1vZz6rw', '2017-07-10 15:05:30', '2017-07-13 12:53:21', null);
INSERT INTO `wc_users` VALUES ('153', 'oruQl1WfAHGk7WK2NVZvFnqKqt9w', '672007283@qq.com', '15985824900', null, '', null, '厦门百度刘斌', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc5VR5jFaiclibOKNP8xwFdIMicSZ313nibbEwEMbdHibWRiauSdWebvgwpibzRZPoCict7e8szOUrJdAPlic8/0', null, '厦门市思明区软件园二期观日路36号之一', null, '1', '尽最大的努力，做最好的自己。', '1', 'oruQl1WfAHGk7WK2NVZvFnqKqt9w', '2017-07-10 15:06:01', '2017-07-10 19:04:56', null);
INSERT INTO `wc_users` VALUES ('154', 'oruQl1bh1DkOt-UiZmXPuyDvUUmY', 'huxi@xm12t.com', '18649668046', null, '', null, '百度胡小妞', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80QicibmsMAuvBBVfQ0cr7O45icDtXsAd58UvPKkQQ3J8WUK8yQUOiasxicAZ1ibwJwBaEtbiaGM386Jxbyr2/0', null, null, null, '2', null, '1', 'oruQl1bh1DkOt-UiZmXPuyDvUUmY', '2017-07-10 15:06:04', '2017-07-10 15:06:39', null);
INSERT INTO `wc_users` VALUES ('155', 'oruQl1WhV5u4LIGZvNW3Oymz-bcg', null, null, null, '', null, '杨超', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4StWXyple3NiarZPpoadwic6EBln0CCjIZgLD7FRX3wrdTCIb7nE2KcBZBb28BRNJwBwM2cyvKWVgQ/0', null, null, null, '1', null, '1', 'oruQl1WhV5u4LIGZvNW3Oymz-bcg', '2017-07-10 15:06:28', '2017-07-10 15:06:28', null);
INSERT INTO `wc_users` VALUES ('156', 'oruQl1fU-L7QCpsWIxlhoEaYP6eI', null, null, null, '', null, '别惊动回忆，好吗？', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6icaL2LnG0TYBKhibSBicEd1RBblBiaF0nxphPXC0graarJSO2RN35MQY3jUHJsSAsMMXSCpcvD6eM0A/0', null, null, null, '2', null, '1', 'oruQl1fU-L7QCpsWIxlhoEaYP6eI', '2017-07-10 15:06:59', '2017-07-10 15:06:59', null);
INSERT INTO `wc_users` VALUES ('157', 'oruQl1T2h-SBGw4xm9HE472qnId8', null, null, null, '', null, '厦门百度@连祖18659282264.', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Qwy2aNlnJIuwFiceGCCU4Bxe8RZGmwzVZSziaXkjfLwafh3j7JaRcoq1Gge2A72T4ibKgdX30gic8MI9/0', null, null, null, '1', null, '1', 'oruQl1T2h-SBGw4xm9HE472qnId8', '2017-07-10 15:07:29', '2017-07-10 15:07:29', null);
INSERT INTO `wc_users` VALUES ('158', 'oruQl1XUQZKRDDwJ__D8iYDpIIN4', 'huangyifeng@xm12t.com', '15006037339', null, '', null, '落 影、', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8buedxQT0cXeukdf74Ve208CxGRuKWibjoAibXta7d8xWPjf6dvT2icBQguic1PPXaR4oUDJmTtkc7LibE2C4/0', null, '厦门思明区', null, '2', null, '1', 'oruQl1XUQZKRDDwJ__D8iYDpIIN4', '2017-07-10 15:08:08', '2017-07-10 15:25:17', null);
INSERT INTO `wc_users` VALUES ('159', 'oruQl1fk8Zj3gvEJU6728V23LhUo', 'yeyouling@xm12t.com', '18059190180', null, '', null, '叶幼玲', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBbTCEibDpTicSrhVXeEVoadvv2J7GeWaRmuJOeWp53FGjCZtiajOuVH0zUp8StzDpZK9e0Kru9tk2kg/0', null, null, null, '2', null, '1', 'oruQl1fk8Zj3gvEJU6728V23LhUo', '2017-07-10 15:08:46', '2017-07-29 09:44:04', null);
INSERT INTO `wc_users` VALUES ('160', 'oruQl1bWxTyxoSwf352qah3EvAU4', null, null, null, '', 'iqNs55JW1znZbDhNxHaHDIxeyhm3BAQpWuKlkcjDgX1AsODB8va3b7LAVppY', '林锦珠', 'http://wx.qlogo.cn/mmopen/5HkCBulJjD04xribI1iaib7XTayUqWnZgoMXSqyjqEAHwOK7WbHhPU3E49u94vBvZ6FjxZLegoOsia0thEe8C0pr67QXCLQEEntV/0', null, null, null, '2', null, '1', 'oruQl1bWxTyxoSwf352qah3EvAU4', '2017-07-10 15:08:58', '2017-07-10 15:11:05', null);
INSERT INTO `wc_users` VALUES ('161', 'oruQl1fTfSBsy1NbSHQXV5aZ_Qkg', 'xiemengbing@xm12t.com', '18064448231', null, '', null, '百度 谢朦冰', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKZTu8krED6QzfxiaUT6PVKEd1pBwtYJReiboVicpNmrLDchickwKdY6n33FNsqne6RNj08lOW5Bo9ia9Q/0', null, '厦门市软件园观日路36号之二易尔通网络科技公司', null, '2', null, '1', 'oruQl1fTfSBsy1NbSHQXV5aZ_Qkg', '2017-07-10 15:09:21', '2017-07-10 15:11:21', null);
INSERT INTO `wc_users` VALUES ('162', 'oruQl1XEeJj5-0SdNrUWIHbALDtg', 'yanglin@xm12t.com', '15280290740', null, '', null, 'Baidu-杨林', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80QxPuHQLhv3loEoibTWpZWObBhxYCU7CEZia8tDzAgIfM5r05RlN6dYLdDeFbasV9hYDANKtSKlqfPC/0', null, '厦门市软件园二期36号201室', null, '2', '公司主营：百度推广、百度信息流、百度百科、网站建设。', '1', 'oruQl1XEeJj5-0SdNrUWIHbALDtg', '2017-07-10 15:09:46', '2017-07-10 20:54:49', null);
INSERT INTO `wc_users` VALUES ('163', 'oruQl1Q6ME4FHe2me30gmL9R44m8', 'lienlin@xm12t.com', '18650805217', null, '', null, '李恩临', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKbAwicnyvu61YrqYRDOH4acOE2BGVsChM271I67wEbH6m2Wc0tGRDOAlZP7zkU7zp5HYiakHhaTjr6e1HicVsuY0xvsvQ9ibepG30/0', null, '厦门市软件园二期观日路36号二楼', null, '2', '百度推广-百度信息流-百度糯米-百度百科-官网认证-品牌广告-网站建设-企业邮箱-H5页面', '1', 'oruQl1Q6ME4FHe2me30gmL9R44m8', '2017-07-10 15:09:55', '2017-07-10 15:15:15', null);
INSERT INTO `wc_users` VALUES ('164', 'oruQl1VTkl2T16G8xhARoO36nbl4', 'chenwenxiang@xm12t.com', '15759139290', null, '', null, '百度陈文祥', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBWDjvLraNwOxKncaoP2huhF9TFHYGwsQIk3F8bjGLPhibsbw1SJltryiczvsRZ2XJTmPWGDc4FLFdA/0', null, '漳州碧湖万达广场万达百货六楼', null, '1', null, '1', 'oruQl1VTkl2T16G8xhARoO36nbl4', '2017-07-10 15:10:35', '2017-07-19 11:53:10', null);
INSERT INTO `wc_users` VALUES ('165', 'oruQl1eQYml8_f5amIaKj1esDwa8', '249632597@qq.com', '18060033553', null, '', null, '百度魏婉婷', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAEGYMOZUsCC2nJPkFtvPUchkw0fVXZrfiaB7AmibSFZksx4g0lqzhX7UNNUChy2FbfsOre7mndJSZQ/0', null, '泉州市丰泽区少林路亚特大厦4楼', null, '2', '越努力，越幸运！  有需要百度推广，网站建设，官网认证等都可联系', '1', 'oruQl1eQYml8_f5amIaKj1esDwa8', '2017-07-10 15:12:06', '2017-07-21 14:51:46', null);
INSERT INTO `wc_users` VALUES ('166', 'oruQl1T7xZc5a2NBI1VYHcKPLyHo', null, null, null, '', null, '建平', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5ZicG5iawn7oQ0SlpsUpR7b2p0f84K8ByAa6Ym8DATGCNEHayibYCNjKInsg5GRHx4TQYkzLKStOicrIT/0', null, null, null, '1', null, '1', 'oruQl1T7xZc5a2NBI1VYHcKPLyHo', '2017-07-10 15:13:05', '2017-07-10 15:13:05', null);
INSERT INTO `wc_users` VALUES ('167', 'oruQl1RMmFl7UjkQjCOxMZbzZMRo', '2579158040@qq.com', '18750576691', null, '', null, '许水旺', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJyicovj4WNAxyrViaYQSchrnr12ibiaM5bMYZeYRQT7HriabUribs9vFibzpV64xf5Lzk8JappUkneHo8xg/0', null, '厦门市思明区软件园二期36号201', null, '1', '主营业务：百度推广~百度糯米~官网建设', '1', 'oruQl1RMmFl7UjkQjCOxMZbzZMRo', '2017-07-10 15:13:08', '2017-07-14 13:51:47', null);
INSERT INTO `wc_users` VALUES ('168', 'oruQl1ZF2XTgCPaC8qXX09TPFa7g', null, null, null, '', null, '百度纯伟', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q7Nulp4osVMHHKZT3fJe2f37K991CHDvsXmXeCicenhlwGRHWzzicDc9iao8uczibesq73lYrespP8l4/0', null, null, null, '1', null, '1', 'oruQl1ZF2XTgCPaC8qXX09TPFa7g', '2017-07-10 15:14:11', '2017-07-10 15:14:11', null);
INSERT INTO `wc_users` VALUES ('169', 'oruQl1bvHtBhT_llQh-gszusraW4', 'suzhenggao@xm12t.com', '17859910633', null, '', null, '苏政高', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5QeTjyLr8XxrfjmH0dtKVFOTJz3XsIC3K84xjI6j3DFkHmic61SWyVkKyREYtxibP4cP6nwET2CNYUP3c8YcC63X2/0', null, '泉州市丰泽区少林路仁凤工业区亚特大厦4楼', null, '1', '做低调的人，干成功的事。不畏难事，勇于争取。加油', '1', 'oruQl1bvHtBhT_llQh-gszusraW4', '2017-07-10 15:14:29', '2017-07-10 15:18:55', null);
INSERT INTO `wc_users` VALUES ('170', 'oruQl1eypKmiyGLRHCKFqpxVU9fw', 'pengwei@xm12t.com', '15750717757', null, '', null, '彭伟', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ4M3PNPTQIeMth8389kZheGrsCZsVlXXSAsttPpUICxnPxE960qx7d3ia5bw0IHQbdwxxukEtRImg/0', null, '厦门市思明区观日路36号之一201', null, '1', '网站建设，百度推广', '1', 'oruQl1eypKmiyGLRHCKFqpxVU9fw', '2017-07-10 15:15:09', '2017-07-10 15:18:00', null);
INSERT INTO `wc_users` VALUES ('171', 'oruQl1cwrWP0VSFEYyWocWWamBUA', 'chenhuaishan@xm12t.com', '18860042265', null, '', null, '百度陈槐山', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtXTh6FVorlTbfB3TMCvicKViagapNesD1owsaiaJ4cYVE3fMaR2Ju0xv4CEqib4hRfI8R3CibqB6NUJUAIiciah57MSaGO/0', null, '厦门市思明区软件园二期观日路36号之201', null, '1', '主营业务:百度推广、网站建设、百度信息流广告、百度糯米', '1', 'oruQl1cwrWP0VSFEYyWocWWamBUA', '2017-07-10 15:16:08', '2017-07-24 17:54:08', null);
INSERT INTO `wc_users` VALUES ('172', 'oruQl1RCt5NVb9ULpKTWPYu3lhk4', null, null, null, '', null, 'A百度推广建网站王心卫18396132966', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8bued4RphvIJSKjylxLYVTibBWoDrc9oAfzvGAfXrQMusrRnd8AwM4uAPrESFpFnQIiaZiaaHAkYS5tiajjfQIauYX52IibE/0', null, null, null, '1', null, '1', 'oruQl1RCt5NVb9ULpKTWPYu3lhk4', '2017-07-10 15:16:09', '2017-07-10 15:16:09', null);
INSERT INTO `wc_users` VALUES ('173', 'oruQl1SogM4O4Dz1Dk74C5jJWxGQ', 'panguobiao@xm12t.com', '18250111992', null, '', null, 'A~百度潘～网站制作推广', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5p47aICw71qeP9vUwGXQMc5iaiaJhJiaHib0oUYaTYG7IEL1ZshwyL5FKKH1xOyugpiabP2hEPSQK2EVUnokbtiaK3cu/0', null, '商务版块c栋5楼', null, '1', '百度推广，网站建设，百度百科，品牌华表', '1', 'oruQl1SogM4O4Dz1Dk74C5jJWxGQ', '2017-07-10 15:16:48', '2017-07-10 15:21:52', null);
INSERT INTO `wc_users` VALUES ('174', 'oruQl1fhCWqzoRTPlAhvU_rQqsOw', 'sunxiangxiang@xm12t.com', '13559492563', null, '', null, 'A百度-孙祥祥', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc7gsglfSFHGvyzK0k7bspSJ9TmbIictEjIJiaiafMIia3FY3g9JUMOW18ohHvzPyTibSA1iaVq5Em7iczlT/0', null, '厦门市思明区软件园二期观日路36号楼之一', null, '1', '百度推广，网站建设，百度信息流，百度糯米', '1', 'oruQl1fhCWqzoRTPlAhvU_rQqsOw', '2017-07-10 15:18:10', '2017-07-11 17:37:21', null);
INSERT INTO `wc_users` VALUES ('175', 'oruQl1ayHiO5qVm_yftrE3KvZ124', 'xugzh@12t.cn', '13696906006', null, '', null, '许国忠', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5QShoAO4QXVibXfJxoM7H7bH2I6H8ua2ImTKSwWZhdrL6CT4m7NEMbezvbAA8hZuwIiaYfJymL0UnLw/0', null, '厦门市软件园二期观日路36号201', null, '1', null, '1', 'oruQl1ayHiO5qVm_yftrE3KvZ124', '2017-07-10 15:18:36', '2017-07-10 15:19:52', null);
INSERT INTO `wc_users` VALUES ('176', 'oruQl1WiQU4aBZTggSX56J5w70FI', 'wugy@xm12t.com', '15860737645', null, '', null, '吴桂月', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc7pzEdvnmAKcibFP6tDcDC0lBexAWsqRdXCasaiaMA2M4BwkJuuic1wF8Rc4rl7kicEzoiax5PpnAZPsic/0', null, '厦门市思明区软件园二期观日路36号楼201单元', null, '2', null, '1', 'oruQl1WiQU4aBZTggSX56J5w70FI', '2017-07-10 15:18:40', '2017-07-10 15:21:56', null);
INSERT INTO `wc_users` VALUES ('177', 'oruQl1QERjLWalBLuNxUqVEIoOxk', 'suchen@12t.cn', '18906035211', null, '', null, '苏晨＠百度', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q7xO6lG66mqf5yZjRpKjgjUcPZN0eb0SqqTuMScGB4VjIA9pfl5wm2F6wFjchnK4ciaOEiamPedL5M/0', null, '厦门软件园二期观日路36号201', null, '1', null, '1', 'oruQl1QERjLWalBLuNxUqVEIoOxk', '2017-07-10 15:20:08', '2017-07-10 15:21:19', null);
INSERT INTO `wc_users` VALUES ('178', 'oruQl1StkNmBYzUfx4HiXzBZSZ9I', null, null, null, '', null, '????小手麦唛凉 suki????', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL3cCCGHLjxIuOt8vUJOTyzFSFmWNsxX7TApsVwyZdqO8w45IMqnNEzA1KJ9klJr83da2R22r00eA/0', null, null, null, '2', null, '1', 'oruQl1StkNmBYzUfx4HiXzBZSZ9I', '2017-07-10 15:20:41', '2017-07-10 15:20:41', null);
INSERT INTO `wc_users` VALUES ('179', 'oruQl1U47P0g7nO6zExB0MLWDArk', '384312747@qq.com', '13774660045', null, '', null, '百度推广&百度竞价王伟13774660045', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5Z0KBN8cwKRylAibN3BKfBxdg5NibBXWGq6DahA4OUkWap0tmiaZH31SCAN0wOJwGuYAWvIibpsDZs6rb/0', null, '厦门', null, '1', null, '1', 'oruQl1U47P0g7nO6zExB0MLWDArk', '2017-07-10 15:21:58', '2017-07-10 15:23:09', null);
INSERT INTO `wc_users` VALUES ('180', 'oruQl1d5QE2_Nny1uNNyJeajeaHE', 'liujianchuan@xm12t.com', '15159092519', null, '', null, '百度@刘建川', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUZibVjGBMW2FyGQPDG6T2Yko8LQicOf48a4ia8v5oq8kiaOVIjIZZGj3FqtGfJIQEYP4yIcahZDoaeSEw/0', null, '龙岩市新罗区商务板块C栋5楼百度公司', null, '1', '百度推广 网站建设   品牌推广', '1', 'oruQl1d5QE2_Nny1uNNyJeajeaHE', '2017-07-10 15:22:17', '2017-07-20 11:48:54', null);
INSERT INTO `wc_users` VALUES ('181', 'oruQl1Z5vaTH5Jh_pmEJXV-AtaA4', 'zhanghongfa@xm12t.com', '18359349683', null, '', null, '张鸿发（龙岩百度商务经理）', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5Z2GwYthrMCnscs0HjXc25Nia38ibQKwSGibxQp4ScMQCUIlJMZIsdMeLwibjtttKCxibkwoxADddVhmic5/0', null, '龙岩市新罗区龙岩大道282号商会大厦C幢508室', null, '1', '静心做事，用心做人！', '1', 'oruQl1Z5vaTH5Jh_pmEJXV-AtaA4', '2017-07-10 15:23:03', '2017-07-11 00:10:20', null);
INSERT INTO `wc_users` VALUES ('182', 'oruQl1Wp8rwMu2Zwwp2Z7wrmmdWw', '632058763@QQ.COM', '13850009462', null, '', null, '游达山', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w4jS0Z50rzibMqmCUz7sWxEqUMwsMoMLKaWtDKibbQbqxmXMQ6dC1P9zHCAlicrjNFA6jCobokQQPdmrdAlE327JDv/0', null, '软件园二期观日路36号楼之一201', null, '1', null, '1', 'oruQl1Wp8rwMu2Zwwp2Z7wrmmdWw', '2017-07-10 15:24:59', '2017-07-24 17:16:33', null);
INSERT INTO `wc_users` VALUES ('183', 'oruQl1fx9gHA96gcAU6UrcQnz4kg', 'yexiaoqiang@12t.com', '15260228322', null, '', null, '厦门百度小强哥', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5bJaiaXZ3bO3NMMySbCW2pRjX0eWYKjsUjibicckMVOMNib2VZ0H4OxOgaZwvMsBdsBLsYanCZNdnZRJhBCaC0hLrB/0', null, '厦门市思明区软件园二期观日路36号201单元', null, '1', '公司主营百度推广、网站建设、百科、糯米等等', '1', 'oruQl1fx9gHA96gcAU6UrcQnz4kg', '2017-07-10 15:26:19', '2017-07-10 18:48:35', null);
INSERT INTO `wc_users` VALUES ('184', 'oruQl1Qqn_i8m5oDYeDMapqQ9VNE', 'lijinkun@xm12t.com', '13599525182', null, '', null, '厦门百度李锦坤（信息流）', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5ZwGVUGpJhkat4vORFFa0WkN5kOFztcnzIUrLBK6LibTvFsDpAiaUrBa84gmYIDV5JGVfP8oOtyKnqs/0', null, '厦门市思明区软件园二期观日路36号201单元', null, '1', null, '1', 'oruQl1Qqn_i8m5oDYeDMapqQ9VNE', '2017-07-10 15:26:27', '2017-07-10 15:27:24', null);
INSERT INTO `wc_users` VALUES ('185', 'oruQl1TSgCYjVGeZULM22N4FZGVI', 'caojian@xm12t.com', '18030261783', null, '', null, '百度曹健', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarcwYpsxNyvJOLbWCJRcl2JRGB24QV0MNMF9lXJ7UKan3EokgJibhMgyNR4nOmLdE95tHF6TriaSyzcU/0', null, '厦门市思明区软件园二期观日路36号楼201', null, '1', null, '1', 'oruQl1TSgCYjVGeZULM22N4FZGVI', '2017-07-10 15:26:47', '2017-07-10 16:43:09', null);
INSERT INTO `wc_users` VALUES ('186', 'oruQl1Zx52pWc9lpuqw7xayao89c', null, null, null, '', null, '爱——牵手人生', 'http://wx.qlogo.cn/mmopen/1wNowwOCedXgf1Hc2ibaR0UMrvib4GKTBFhgLC3LXSTp5CO31FkqXh2ks1h5icv3WiaKDfWtSd9XEpibDqJCedriay0qm84wFiawjxa/0', null, null, null, '2', null, '1', 'oruQl1Zx52pWc9lpuqw7xayao89c', '2017-07-10 15:28:52', '2017-07-10 15:28:52', null);
INSERT INTO `wc_users` VALUES ('187', 'oruQl1ZHerK-VJTktK4s65RjuPeI', 'chenjing@12t.cn', '15659981373', null, '', null, '橙☀', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q3e8ibVYTDh0WusJ59TaIAU8nArZofPpibJuPeZG6VLvJscOibnDlEr5MxUibp1D7gWCt7NHRsu8AhKb/0', null, '厦门市思明区软件园二期观日路36号201', null, '2', '水自竹边流出冷风从花里过来香', '1', 'oruQl1ZHerK-VJTktK4s65RjuPeI', '2017-07-10 15:29:21', '2017-07-10 15:37:57', null);
INSERT INTO `wc_users` VALUES ('188', 'oruQl1aqE93ZD_GcvWGb7RbIzxrI', '378890421@qq.com', '18659688471', null, '', null, '卢志锋', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIJCGHQ9cVFEQPjV6dic8PmPMH8neADP1hibEGBicnhWNePwzOwWtdtfGLm0HEzxKhfSgeaLaJC0VJIw/0', null, '漳州市碧湖万达百货六楼漳州百度服务中心', null, '1', null, '1', 'oruQl1aqE93ZD_GcvWGb7RbIzxrI', '2017-07-10 15:30:49', '2017-07-10 15:39:47', null);
INSERT INTO `wc_users` VALUES ('189', 'oruQl1RT_negOXDKZChZZwWPvyds', null, null, null, '', null, 'Z', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Qz2XwQYswMVGhfttmT8sibG4ssLNxx2C6ic2Rxf8US9oWDJsq5mcksX4WbFKWS2hcaGI1co1wLKticV/0', null, null, null, '2', null, '1', 'oruQl1RT_negOXDKZChZZwWPvyds', '2017-07-10 15:32:30', '2017-07-10 15:32:30', null);
INSERT INTO `wc_users` VALUES ('190', 'oruQl1RjBUy36BEyXRwcsvjVqEsI', 'zhnongty@12t.cn', '13515958815', null, '', null, '钟桃英 ', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarcwicJVXEWwknst2XQCAicIoZ9BXS98o5bI3Mxbibq8aQXMud6HXABgkKxdSkRljzmQAtmkaHeK4KwfC/0', null, '漳州市龙文区碧湖万达广场六楼百度漳州营销服务中心', null, '2', '百度一下，让你更强！', '1', 'oruQl1RjBUy36BEyXRwcsvjVqEsI', '2017-07-10 15:34:09', '2017-07-11 09:53:54', null);
INSERT INTO `wc_users` VALUES ('191', 'oruQl1WG9GpNMB94xWHujYNG9YTM', null, null, null, '', null, 'joy-xiong', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8bued9BDbK8vnhdHUGJ7XQfZqJsictKrkxEbkG7JB2gbD4USIhdcrVwwj11GUiaBmRlic8iakLAcaZVXkIQu/0', null, null, null, '2', null, '1', 'oruQl1WG9GpNMB94xWHujYNG9YTM', '2017-07-10 15:37:43', '2017-07-10 15:37:43', null);
INSERT INTO `wc_users` VALUES ('192', 'oruQl1WmaDEIiWfBMrEhJSiriwUE', 'ruanweiyi@xm12t.com', '13358527710', null, '', null, '百度公司小伟', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQwkMwMpbh9HnHyms3cpqYQQoEC05SZ0a33gw66dtsv0JZsWADtn6nBMmAkFibmI1g9y6lX6eyV1De/0', null, null, null, '1', null, '1', 'oruQl1WmaDEIiWfBMrEhJSiriwUE', '2017-07-10 15:44:21', '2017-07-10 15:45:46', null);
INSERT INTO `wc_users` VALUES ('193', 'oruQl1Vq7W4wv_OS81ZIVLeHqLKw', 'chenpengfei@12t.com', '15859007813', null, '', null, '陈鹏飞·百度', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUZssAN0Q1KJ6nkOkajGY0MYFHyicC0DQKTZawIPZMB7AsibzRMa9Dibjh8y8HlrLPibzIyILVnKyicbLEQ/0', null, null, null, '1', '销售顾问', '1', 'oruQl1Vq7W4wv_OS81ZIVLeHqLKw', '2017-07-10 15:47:59', '2017-07-10 16:38:12', null);
INSERT INTO `wc_users` VALUES ('194', 'oruQl1c_n6k4kpkzeq1_69w8Z_OA', 'daimingde@xm12t.com', '18359204295', null, '', null, '厦门百度 -戴明德', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtXuQ1X3e7rqc0UwG3jzvNLjLDTvvv7REg4P0c0SIxc0qAj4OlvENItz3sW5fG7eJia10URyZbuGYLnibdynXQich6t/0', null, '厦门思明区软件园观日路36号之201', null, '1', '百度推广、网站建设、企业百科等业务', '1', 'oruQl1c_n6k4kpkzeq1_69w8Z_OA', '2017-07-10 15:49:39', '2017-07-10 15:53:32', null);
INSERT INTO `wc_users` VALUES ('195', 'oruQl1couf99qsMS6COJdejU3Lvg', '2692627856@qq.com', '15060352679', null, '', null, 'AOA百度徐燕美15060352679', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q84rW366zjEZOldpdfLRfuibX3YFhsicjswHqpvBlvsXKfhMUBr99vggbVZtCibBWnB7CJmmuUwsQjl/0', null, '厦门市思明区软件园二期观日路36号楼之一', null, '2', '来公司两年可以帮忙办理百度相关业务。。', '1', 'oruQl1couf99qsMS6COJdejU3Lvg', '2017-07-10 15:55:46', '2017-07-10 16:06:45', null);
INSERT INTO `wc_users` VALUES ('196', 'oruQl1bS_3ttAFqn5bdURhDH5OdE', null, null, null, '', null, 'A厦门百度～温联升～糯米', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q4bouFoMDg5GTICWLehL4cPDMZWKia7kiaZCH2Um3mjXzgIXyoLCGpJ2cicWNY77WUNs4V6jDNXQSze/0', null, null, null, '1', null, '1', 'oruQl1bS_3ttAFqn5bdURhDH5OdE', '2017-07-10 16:02:30', '2017-07-10 16:02:30', null);
INSERT INTO `wc_users` VALUES ('197', 'oruQl1fLa6SDyYSV0KnTbAB2CBlw', 'lijingping@xm12t.com', '17605080693', null, '', null, '栗静坪', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtXAlyPoxQaVfSFAdOicBggaBCcGC4MZclTfF03iciczq00Tcib0ptzuWmwJcTR3bFRdnMNUjJhoekfYegOmCGetAIAS/0', null, null, null, '1', null, '1', 'oruQl1fLa6SDyYSV0KnTbAB2CBlw', '2017-07-10 16:13:44', '2017-07-10 16:17:11', null);
INSERT INTO `wc_users` VALUES ('198', 'oruQl1f9-oOuTlN6cB0c6qzARmq8', 'huangjj@xm12t.com', '18760605927', '0596-6166559', '', 'caRgeQZDuKQLQxGMlYzd3CKgs1cmhP4Gq08We7HbdhfkSuJCdJ6lz2RPgQq4', '黄娟娟', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBUqfVCxCmNYWoFmcB2uLKQ9c4XXoqX3VohiaDZAGCxdMIb0lhBTdU8qgbibhmopGQOUBkRE3TDHW0A/0', null, null, null, '2', '心安之处，即是幸福', '1', 'oruQl1f9-oOuTlN6cB0c6qzARmq8', '2017-07-10 16:13:48', '2017-07-13 12:55:42', null);
INSERT INTO `wc_users` VALUES ('199', 'oruQl1Qoa7L6L4LaRVDj79zIE-2U', null, null, null, '', null, '_熊猫兔纸', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5ZibcdxuOWPgK22cn3txzYicYwII6RU5WEQeLESek2ibEUZicvucCUkyic28IpC2kE48kgI2ze3iaGicXkzz/0', null, null, null, '2', null, '1', 'oruQl1Qoa7L6L4LaRVDj79zIE-2U', '2017-07-10 16:13:51', '2017-07-10 16:13:51', null);
INSERT INTO `wc_users` VALUES ('200', 'oruQl1Zo1mpc8-Th-JPKiD7IJxBo', 'lich@xm12t.com', '15860715680', null, '', null, 'A-Baidu李春华', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc4pI3saNo9s8vfKHvJvsWGpJ2Tst5iaybtG9JWIGAxxCiceZAPtgHmMlQvIY41ryDBDpzPibxgDo9ep/0', null, '厦门软件园二期观日路36号201单元', null, '2', '遇见的都是天意，拥有的都是幸运', '1', 'oruQl1Zo1mpc8-Th-JPKiD7IJxBo', '2017-07-10 16:14:29', '2017-07-10 16:38:22', null);
INSERT INTO `wc_users` VALUES ('201', 'oruQl1V7vQNk3Roc1VfItc1Okefo', 'linjingshan@xm12t.com', '18250845345', null, '', null, '百度林景山', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDkEiaP40fq1HhJnBSlK6yEQBdwsYHicCPR1e1Mn9RBc6aCqibibAxg9EiaZ1XJNqTbSWFkh0dTicZW6jkw/0', null, '厦门软件园二期观日路36号201单元', null, '1', '公司主营：百度推广、百度信息流、百度百科、网站建设。', '1', 'oruQl1V7vQNk3Roc1VfItc1Okefo', '2017-07-10 16:14:30', '2017-07-10 16:48:18', null);
INSERT INTO `wc_users` VALUES ('202', 'oruQl1biD1eveJfA55I8dQ-PxFkw', null, null, null, '', null, '百度苏婷', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUb1pzf74ECckywJoc4kqRpXe17Jl7fOoia3ANX8Z1Epus7Tgv4UMJo3vFg490vN7zYIibrTUE0KI4wA/0', null, null, null, '2', null, '1', 'oruQl1biD1eveJfA55I8dQ-PxFkw', '2017-07-10 16:14:42', '2017-07-10 16:14:42', null);
INSERT INTO `wc_users` VALUES ('203', 'oruQl1XPHiAGN1wGsjyyEfEtf6KA', null, null, null, '', null, '六六????', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q02P51HUDZeOtrFrhicF3iaRc3ejrBPAT8eT8qZobvyfGctSTCNniaAID8QneialdRPep0ZapkJice6ibZ/0', null, null, null, '2', null, '1', 'oruQl1XPHiAGN1wGsjyyEfEtf6KA', '2017-07-10 16:14:57', '2017-07-10 16:14:57', null);
INSERT INTO `wc_users` VALUES ('204', 'oruQl1Sx-pdzLOQkOsBwBmHFHPfc', '1253569039@qq.com', '13489529755', null, '', null, 'A泉州百度陈芳梅', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUYpXUicjzl2wt2YDuia7gIBmjJ9WOrrh1AfWx6j2GSY0qe41iczTkLAo8AySTUZUibRaKPSHfE5mcGU9w/0', null, '丰泽区少林路仁风工业区亚特大厦4楼', null, '2', '百度推广  网站建设  百度信息流  糯米团购  咨询电话13489529755陈经理', '1', 'oruQl1Sx-pdzLOQkOsBwBmHFHPfc', '2017-07-10 16:15:19', '2017-07-10 16:17:51', null);
INSERT INTO `wc_users` VALUES ('205', 'oruQl1ZdYh3CHeaieuY6fL6ENQOg', 'linpeirong@xm12t.com', '13400606819', null, '', null, '百度林培榕', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDvb5rjJnyZjzTnI2ZibicfwlaK8R6W5RBLoP6ibUFMTJOHDwPpseXURbWWpwrAKLl5lc7vnY27pUW2A/0', null, '厦门思明区软件园二期观日路36号201单元', null, '1', '主营:百度推广，网站建设，百度直通车', '1', 'oruQl1ZdYh3CHeaieuY6fL6ENQOg', '2017-07-10 16:16:02', '2017-07-10 16:18:48', null);
INSERT INTO `wc_users` VALUES ('206', 'oruQl1SpETkB0itwfQ_UpUVrzmE0', null, null, null, '', null, 'AOO百度方君鸿', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Qz5YZWamnGnwDBptFQjiaXkhblkCPKaKWNTjySibOWNayoTF5NnhrudI57KS3ZOQ57SDn9LhicJQkF7/0', null, null, null, '1', null, '1', 'oruQl1SpETkB0itwfQ_UpUVrzmE0', '2017-07-10 16:16:07', '2017-07-10 16:16:07', null);
INSERT INTO `wc_users` VALUES ('207', 'oruQl1YeG89VmQJ5J_zh5mV2Za2E', 'chenwenyu@xm12t.com', '13559896077', null, '', null, 'A百度信息流-陈文玉', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q8PNOgMricnOicBoIecAfMibDSicAgJr8WyT0XSMVmYx6daWDmAtWJPZCo7qp2KnDy6oHMWeZ0DuMcx7/0', null, '厦门软件园二期观日路36号之一，201', null, '1', '主营：百度推广，百度糯米，网盟，信息流，品牌专区，品牌起跑线，网站建设，互联网服务', '1', 'oruQl1YeG89VmQJ5J_zh5mV2Za2E', '2017-07-10 16:16:18', '2017-07-10 16:19:26', null);
INSERT INTO `wc_users` VALUES ('208', 'oruQl1daZiytr8rOyb9JtfvUaNG8', null, null, null, '', null, '功是标量', 'uploads/user/208/img1502973654.jpg', 'uploads/user/208/img1502973971.jpg', null, null, '1', null, '1', 'oruQl1daZiytr8rOyb9JtfvUaNG8', '2017-07-10 16:18:11', '2017-07-10 16:18:11', null);
INSERT INTO `wc_users` VALUES ('209', 'oruQl1SHPk4KR4-3825GjVlZYO4E', 'yanghuiling@xm12t.com', '18146141184', null, '', null, '百度杨慧玲', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtXiamtSLmq9XQjFucTvtcSAMLlco9j33Q8gGMUh7xzpC4POO21qS2WYACWeJj8e8QDUzuzKnVt229DLYpW40ibRibH/0', null, '厦门市思明区软件园二期观日路36号201单元', null, '2', '百度推广、百度信息流、百科微站、网站建设、官网认证、百度糯米本地直通车', '1', 'oruQl1SHPk4KR4-3825GjVlZYO4E', '2017-07-10 16:19:00', '2017-07-10 18:55:01', null);
INSERT INTO `wc_users` VALUES ('210', 'oruQl1cPdIdj2i2pHGCrWuSyQ59o', '123456789@qq.com', '18659282620', null, '', null, '方啊茹', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarcxYB12M8ggqctumGWaiaTfL5N8wkLEgJkdibNw8U5DxVLxXfpw7J5qNia0Lbvmjw8bqm5acsnZ5K3jP/0', null, null, null, '2', null, '1', 'oruQl1cPdIdj2i2pHGCrWuSyQ59o', '2017-07-10 16:19:51', '2017-07-24 17:43:13', null);
INSERT INTO `wc_users` VALUES ('211', 'oruQl1cjY4UNYQJ1gmtdkanVzGhE', 'Zhuangmingjun@xm12t.com', '13666096675', null, '', null, '庄明俊', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w7icXOgibo1ic5A4z7Nudm8RG0DPL4BTI9GN9z3tKgUuUUibWLEyaWaq78O5YsjvtD3zZnXKIWrib0hoXGFBCp3Nes4s/0', null, '厦门市思明区软件园二期观日路36号201单元', null, '1', '感恩', '1', 'oruQl1cjY4UNYQJ1gmtdkanVzGhE', '2017-07-10 16:21:35', '2017-08-07 13:55:31', null);
INSERT INTO `wc_users` VALUES ('212', 'oruQl1dG009uz54RnvfsKoGYLX-M', null, null, null, '', null, '百度推广余文', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIzOdfxOllreNgkF6MUcq8hmsibvFG8mhZibtK9WOicv9L3OA8uwz1ZsgXKep7z1rcfdibKtZURITw8Tg/0', null, null, null, '1', null, '1', 'oruQl1dG009uz54RnvfsKoGYLX-M', '2017-07-10 16:23:41', '2017-07-10 16:23:41', null);
INSERT INTO `wc_users` VALUES ('213', 'oruQl1bVyQTSBJ8ONQOI9CZVAC_A', null, null, null, '', null, 'A  Baidu Online ～CCC', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8bued801Hme9VFSRaz8ic6rI1HFqXsftO8U6keRiaHxYXjcicpDS9b3l9L8OBsVrg0fqibBcb96WGGqD9R36/0', null, null, null, '2', null, '1', 'oruQl1bVyQTSBJ8ONQOI9CZVAC_A', '2017-07-10 16:24:02', '2017-07-10 16:24:02', null);
INSERT INTO `wc_users` VALUES ('214', 'oruQl1YCokz5JoRhYBU_boeRU6y8', 'xieluhua@xm12t.com', '18359336051', null, '', null, '百度@谢露华', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAexg8CHsybNK0Tz1bQZq0E4rNj53SK2UeNwyjBCFqpjx75VcrOdANFrqXI9jibiaGmD4wd5cSdDSRovXzib5kXPGtmCUKgUD3WFY/0', null, '龙岩市新罗区商务板块c栋508室', null, '2', '百度推广，百度信息流，百度直通车，百度品牌推广', '1', 'oruQl1YCokz5JoRhYBU_boeRU6y8', '2017-07-10 16:26:11', '2017-07-10 16:45:01', null);
INSERT INTO `wc_users` VALUES ('215', 'oruQl1b5b8nawJXz_-80vfNx0_DQ', 'chencj@xm12t.com', '13159251258', null, '', null, '陈成健', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6g7renoSSCHr9KDvX9kF2u2fGEuq3ia3RgfI8qgl2splJQFOhTckAeIjvqQ3rBtSYWoUfAPUadluQ/0', 'uploads/user/215/img1503372126.jpg', '厦门市思明区软件园二期观日路36号201单元', null, '1', null, '1', 'oruQl1b5b8nawJXz_-80vfNx0_DQ', '2017-07-10 16:31:11', '2017-07-10 16:32:56', null);
INSERT INTO `wc_users` VALUES ('216', 'oruQl1VYHX2MfBtC7EsXoB1bEpOc', null, null, null, '', null, 'A 百度 王凯18278360920', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w7N0SJnCGPOgE7u4P8Gg0BFZeuicf1t3YhdvBwtVPph6kibbCAouteT6eSGQUmmnxeboI5CEoJicS4KSHdrzDWnUmD/0', null, null, null, '1', null, '1', 'oruQl1VYHX2MfBtC7EsXoB1bEpOc', '2017-07-10 16:31:40', '2017-07-10 16:31:40', null);
INSERT INTO `wc_users` VALUES ('217', 'oruQl1dMpHPb4ofWnxkiRJuwu_b4', 'zhengchaoyuan@xm12t.com', '18006078721', null, '', null, 'A百度  郑朝源 18006078721', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc5ic8WD5KIS96SVQwtibL5P0deDichSTKIN79tRo3EDcrdoiamv18ajnTgL9m9Pxz2WuE5jtRibibfabibX/0', null, '龙岩市新罗区商会大厦c栋5层百度公司', null, '1', '承接各类网络推广，网站制作，400电话等等业务。。。', '1', 'oruQl1dMpHPb4ofWnxkiRJuwu_b4', '2017-07-10 16:32:31', '2017-07-10 16:38:42', null);
INSERT INTO `wc_users` VALUES ('218', 'oruQl1UB9UKJ0Z0KWP4IohZu41QY', '745734435@qq.com', '18050059870', null, '', null, '百度 莫湖月', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5SGWSlWv1zhX48XlpqkEWJIpaCUbrUwBwsqWclAJyFia3vovlD4ZR0UXJdXENS3GzBPriawRzia1h3g5TF9WOurdEh/0', null, null, null, '0', null, '1', 'oruQl1UB9UKJ0Z0KWP4IohZu41QY', '2017-07-10 16:36:08', '2017-07-10 16:37:28', null);
INSERT INTO `wc_users` VALUES ('219', 'oruQl1VMUSK7waWi2D4NW87ldPJU', null, null, null, '', null, 'A厦门百度@周清标15280403389', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarcw9TnOop7obZ2cGILjibiaSuNGeibgwsCrkIdlnqBCTPqDOjIViaRicvT1Y7lDTSribzIo1SKRcJzqmMga/0', null, null, null, '1', null, '1', 'oruQl1VMUSK7waWi2D4NW87ldPJU', '2017-07-10 16:36:09', '2017-07-10 16:36:09', null);
INSERT INTO `wc_users` VALUES ('220', 'oruQl1Z5ER4JyNVzlCfCcKTKwNQE', 'chenyunnan@xm12t.com', '18750658056', null, '', null, 'a百度陈运南18750658056', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q7Kia4V5DgF6tKZTXUHEOQphTezTL7iaa8xXHWqTGKQpzNPb95YNfESvKibCJicAplibdUNA9Zca42ym7/0', null, '厦门市思明区软件园二期观日路36号201单元', null, '0', '我就是我，努力拼搏的就是我', '1', 'oruQl1Z5ER4JyNVzlCfCcKTKwNQE', '2017-07-10 16:36:17', '2017-07-10 17:03:14', null);
INSERT INTO `wc_users` VALUES ('221', 'oruQl1fFezZcnvwa-FrF3PjwKQs4', 'yejian@xm12t.com', '13599699064', null, '', null, 'A百度-叶健', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5R1pPm2tMZZ3ia8Q2GjgdWgkc6GadwibCVVztUZffUwM4qLkqsakU0Oy65LsT1zc3ChImBGDw2uDeOcVs6OshgLU3/0', null, '厦门市思明区软件园二期观日路36号201室', null, '1', '主营业务:百度推广；网站建设；百度信息流；百度糯米；百科微站', '1', 'oruQl1fFezZcnvwa-FrF3PjwKQs4', '2017-07-10 16:36:42', '2017-07-10 17:09:03', null);
INSERT INTO `wc_users` VALUES ('222', 'oruQl1fFQjDZHWlW9O_uL8T_IeO8', 'wangligxiang@xm12t.com', '15985889770', null, '', null, '王凌翔 大客户经理', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAv5UaQKDX3wHgTAuibaIe5VaQ44BurV2h5uXQ31u0VrHPsufIQFbsy5VLU6nYcyh8JSAWNW7T80ibQ/0', null, '厦门市思明区软件园二期观日路36号201室', null, '1', '百度推广，百度信息流，百度品牌华表，百度品牌起跑线，百度品牌专区', '1', 'oruQl1fFQjDZHWlW9O_uL8T_IeO8', '2017-07-10 16:36:51', '2017-07-12 13:46:45', null);
INSERT INTO `wc_users` VALUES ('223', 'oruQl1U2-sc-N9Sa8vNhcIB9seK8', 'linyouen@xm12t.com', '17750532053', null, '', null, '厦门百度 友恩', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUZ2EheaibMacg3wG8c5ptw8kGREQAYhMx7libVe1l0LLUOYMYx2X7dnaZA6u06srpw5VAh8t88KXE3g/0', null, '厦门市思明区观日路36号201单元软件园二期', null, '1', null, '1', 'oruQl1U2-sc-N9Sa8vNhcIB9seK8', '2017-07-10 16:37:13', '2017-07-10 16:39:36', null);
INSERT INTO `wc_users` VALUES ('224', 'oruQl1aGCeULyI0K-sEpGstEfhRM', null, null, null, '', null, '咝妤', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarcyjFx3UBhFkUJ34Y5qyicj2piblbq9JtZ91R15rkM8UQLLrEycYbxzTrJSJ2xOmJDjhcWn1picUJyGic/0', null, null, null, '2', null, '1', 'oruQl1aGCeULyI0K-sEpGstEfhRM', '2017-07-10 16:38:43', '2017-07-10 16:38:43', null);
INSERT INTO `wc_users` VALUES ('225', 'oruQl1eGlny0PzX0ebGwcr8XRWBs', null, null, null, '', null, 'john.dy', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8buedy4icQmPuFmOg4eTIc1s3RCnFUmyicj55ibBUUssbes34viaja5VN0nnScAJ21kbUv4XSwAS5Fw3Z4rb/0', null, null, null, '1', null, '1', 'oruQl1eGlny0PzX0ebGwcr8XRWBs', '2017-07-10 16:40:01', '2017-07-10 16:40:01', null);
INSERT INTO `wc_users` VALUES ('226', 'oruQl1S-YxvNE1cx5NRid0hS7ThY', '80438538@qq.com', '15905097101', null, '', null, '百度章子华', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUYPu9DnglyHcQdb4ZqicwviaLpvpydric4Nwm6FLkJdQEUjJaJzehLupHQF38LPnI8k8e2REqiatI7bbg/0', null, '晋江市青阳国贸大厦806', null, '1', '网站建设，二维码手机站，百度推广，百度品牌广告，百度信息流，百度糯米团购。', '1', 'oruQl1S-YxvNE1cx5NRid0hS7ThY', '2017-07-10 16:41:32', '2017-07-10 16:44:39', null);
INSERT INTO `wc_users` VALUES ('227', 'oruQl1TOTYMEH4uYZm_J1Zd2f468', '1053672545@qq.com', '18659778847', null, '', null, 'AA百度推广兰18659778847', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5TlENicNiaPRiaf1vN3YcnX6lLH9gFEUdS3vJzicaopHcfsM8EsjdQ3ArvjicIDqxxHc43Po7Fdhd4KxibsuTBPDYI3Ed/0', null, '龙岩大道商务运营中心C栋', null, '1', '承接本地推广，网站建设，百度推广，', '1', 'oruQl1TOTYMEH4uYZm_J1Zd2f468', '2017-07-10 16:48:01', '2017-07-10 17:07:40', null);
INSERT INTO `wc_users` VALUES ('228', 'oruQl1ZPA1oc3raGMS7U0a-sGaGg', 'jiangjinlong@xm12t.com', '13599330673', null, '', null, 'A 百度 小江', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELXyIFN0eorNgRpTwQqZNUVsib31PJNVORhJ810hJvhCvDAAszRWjrvEImtLX1ccKLMAvXaMibDp52g/0', null, '商务板块C栋5楼', null, '1', '百度推广，网站制作，本地直通车，官网认证，百度信息流。', '1', 'oruQl1ZPA1oc3raGMS7U0a-sGaGg', '2017-07-10 16:49:26', '2017-07-28 12:36:50', null);
INSERT INTO `wc_users` VALUES ('229', 'oruQl1eGZEm1M2sUDauPXDv8eXXI', 'liujianxin@xm12t.com', '18350118197', null, '', null, '刘健鑫', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbd7D7OWHuGaHIaFU5dS9komJA37fDBP6ngyPmoa8JNstUUlYhiaUAx92bZcAao4droWUX55icicp3xs1j5OXBdJKN/0', null, '龙岩市新罗区龙岩大道商务板块c栋5层', null, '1', '百度关键词排名，网站建设，官网认证，百度地图', '1', 'oruQl1eGZEm1M2sUDauPXDv8eXXI', '2017-07-10 16:49:27', '2017-07-10 16:57:55', null);
INSERT INTO `wc_users` VALUES ('230', 'oruQl1SHjYBCqWrNmKybuFBfBxwM', '2240173866@qq.com', '18859065675', null, '', null, '龚晓辉', 'http://wx.qlogo.cn/mmopen/fETvSOXrALFudiaGia6jqt5QnJCo0pNeEKJnvriaw7EYLoKxAbOY7IdfK3ysJDnrh4JibUAKZBpF2gIq3sIVW5MFibfbknJHRiakxb/0', null, '新罗区商务板块c棟5楼百度龙岩公司', null, '1', '网站建设，百度首页广告，百度百科。', '1', 'oruQl1SHjYBCqWrNmKybuFBfBxwM', '2017-07-10 16:52:02', '2017-07-10 16:57:24', null);
INSERT INTO `wc_users` VALUES ('231', 'oruQl1cJkSoaPg_8O7uPDxv3DzsA', 'chenhao@xm12t.com', '18760012469', null, '', null, '陈浩', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q4xDRarOY1bIHYxMicDmib8iayV5nsfh6FiaF4ibDNnGKr8p43IRhbk5q29nFtGWC4EbGpotSiahx4lIPN/0', null, '福建省龙岩市新罗区商会大厦c幢5楼508', null, '1', '百度推广，网站建设，百度百科，官网认证，品牌华表。', '1', 'oruQl1cJkSoaPg_8O7uPDxv3DzsA', '2017-07-10 16:55:16', '2017-07-10 16:59:30', null);
INSERT INTO `wc_users` VALUES ('232', 'oruQl1fthcRYDQAOoT8xCRWFPSLE', null, null, null, '', null, 'mybaggio', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc8TdibATbFvIxD5R3K1CQpxsklHtvxA9lcOr8QMyZBTlerYlqKdOaB7yYMnf8ljaKMHfiaQZnkw8Ht/0', null, null, null, '1', null, '1', 'oruQl1fthcRYDQAOoT8xCRWFPSLE', '2017-07-10 16:57:26', '2017-07-10 16:57:26', null);
INSERT INTO `wc_users` VALUES ('233', 'oruQl1U7AsGNWF2fxEp0c7L4nE7w', '1032179012@qq.com', '15260510470', null, '', null, 'Evil', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w6FssBjuqmFXAnqicKwHegE5Y8VibKSvITs74t74zK8yGIu4WBIM1QhYoVUeuSgBANo2vibaRRAjv2lybdLFL6r1iax/0', null, '漳州市南靖县金山镇中国邮政储蓄银行', null, '2', null, '1', 'oruQl1U7AsGNWF2fxEp0c7L4nE7w', '2017-07-10 16:59:46', '2017-07-26 17:32:09', null);
INSERT INTO `wc_users` VALUES ('234', 'oruQl1fkCINdr3SEGzb2RJwVy9fw', 'shuaiying@xm12t.com', '18605020436', null, '', null, '百度帅莹18605020436', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4F9ibEiafDGrLyvs1KojzqTHShqqDxN6YbLJt6SC3ich4pQhgF7FkzdVSvhddBuyHQGmlfVZT5xNicOw/0', null, '厦门市思明区软件园二期观日路36号201单元', null, '2', '做百度找我', '1', 'oruQl1fkCINdr3SEGzb2RJwVy9fw', '2017-07-10 17:01:33', '2017-07-24 17:47:03', null);
INSERT INTO `wc_users` VALUES ('235', 'oruQl1QHUvZQefOQhIV31CLQeMeQ', '3287678961@qq.com', '18759977725', null, '', null, '闽南百度光海', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUZMXqeIxtmnicpIxKHOeb1GH8IAUveDQnGkjZCHQmX9SXc3OfzdKkXQOQB55eIGtksuGPsyMo98hjA/0', null, '泉州市丰泽区少林路仁风工业区亚特写字楼4楼', null, '1', 'keep calm and carry on', '1', 'oruQl1QHUvZQefOQhIV31CLQeMeQ', '2017-07-10 17:14:30', '2017-07-10 17:18:03', null);
INSERT INTO `wc_users` VALUES ('236', 'oruQl1aDORn9d9-Xyv2x7_xpauMk', 'penglingling@xm12t.com', '15959213948', null, '', null, '百度彭凌玲', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc1n18XqlicBWOiccvicSymDNr44cUhCUHFicZ8fSywDIfuCj0kRFUNDB5uPd6GMUBuEg4wQs8whKiahdw/0', null, '福建省厦门市思明区软件二期观日路36号201', null, '0', null, '1', 'oruQl1aDORn9d9-Xyv2x7_xpauMk', '2017-07-10 17:19:50', '2017-07-10 20:23:06', null);
INSERT INTO `wc_users` VALUES ('237', 'oruQl1VZ7iw7nWK-qqSe-uEbAHzc', '2452285222@qq.com', '13400956265', null, '', null, '黄艺宾', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAZhghqcUQPSOwOlic1RhABxIYPjd0PVqNDFo7SHXUQMd8ZniaqrkXTDKiaXUdjUmaYlYWTDCiccOS87w/0', null, '厦门市软件园二期观日路32号10304', null, '1', '一直被模仿，从未被超越。', '1', 'oruQl1VZ7iw7nWK-qqSe-uEbAHzc', '2017-07-10 17:25:33', '2017-07-10 18:00:59', null);
INSERT INTO `wc_users` VALUES ('238', 'oruQl1VKyS9tPkm1lnslLOptg73s', 'niu@12t.cn', '13860423411', null, '', null, '牛宏翔', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8buedicuhNNvs51g4UBY4NXMycCuBH8gMzibQJow5gPEnX2OodptzTmnFAA3Nwbq96CLD9sVRNsicEyvF4k/0', null, null, null, '1', null, '1', 'oruQl1VKyS9tPkm1lnslLOptg73s', '2017-07-10 17:32:23', '2017-07-14 11:16:06', null);
INSERT INTO `wc_users` VALUES ('239', 'oruQl1ZK5L04e8MqCqrq0028Ubbc', null, null, null, '', null, '百度 林小燕 13860466845', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5f8tQnRHFmzTSDA0tVOX5HiavV60dmR4nQ6NicGKrkjxSyTBhcp8pQ2runibcR3LqWOWR996L09sn5Q16TWlkibjVx/0', null, null, null, '0', null, '1', 'oruQl1ZK5L04e8MqCqrq0028Ubbc', '2017-07-10 17:32:44', '2017-07-10 17:32:44', null);
INSERT INTO `wc_users` VALUES ('240', 'oruQl1XrRPuA-L7tGHDlHh527R8A', '370955911@qq.com', '18760053818', null, '', null, 'z z m', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc60icuYoXLhkd7KYMTjcOMqjNocOkJBd3icZ5pHia7ia080Q6icLt0Uib4ObYYNxsIHxwUEFOddiaym0GgX/0', null, '商务板块C栋5楼', null, '2', '百度推广 网站建设', '1', 'oruQl1XrRPuA-L7tGHDlHh527R8A', '2017-07-10 17:34:11', '2017-07-10 20:31:18', null);
INSERT INTO `wc_users` VALUES ('241', 'oruQl1amEM7MNtORkTchI2tJC2Jw', 'alphacat@126.com', '18695689993', null, '', null, 'Latte|III', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w6fsiceDW9JPL3LQ9deIicyChdgWDsdgdKDMXvRibF4xpCjfPWhkywjMEbVP7asuaGP3A3ialaTIOcAAg/0', null, null, null, '1', null, '1', 'oruQl1amEM7MNtORkTchI2tJC2Jw', '2017-07-10 17:38:37', '2017-07-10 17:40:25', null);
INSERT INTO `wc_users` VALUES ('242', 'oruQl1dp5jKsw-5nSyHmQLr09Jm4', 'lijg@ydbaidu.net', '13249548789', null, '', null, '百度 李嘉广', 'uploads/user/242/img1499944188.jpg', null, '广东省汕头市金平区跃进路23号利鸿基中心大厦B座20楼', null, '1', '百度推广、百度糯米、百度信息流、百度百科、网站建设', '1', 'oruQl1dp5jKsw-5nSyHmQLr09Jm4', '2017-07-10 17:38:45', '2017-07-13 19:09:48', null);
INSERT INTO `wc_users` VALUES ('243', 'oruQl1avOoZQoWzB5-POL6pjl_tM', 'yihuaiying@xm12t.com', '17750516569', null, '', null, '易淮英@百度（易尔通网络科技）', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w7RyKibTOmacAw8OW2OfIg70aXe6WwOrpSEicYKUs3FLfdSP1n0Fo3c0XG5dDTdCIia1dxSicEibfBrykNgRNZr2geYz/0', null, '泉州市丰泽区少林路仁风工业区亚特写字楼4楼', null, '2', '百度推广、网站建设、百度百科、百度信息流推广等等', '1', 'oruQl1avOoZQoWzB5-POL6pjl_tM', '2017-07-10 18:20:49', '2017-07-21 09:20:32', null);
INSERT INTO `wc_users` VALUES ('244', 'oruQl1YDpak4Ml_N_Wy1N4-znLLA', 'leijinhui@xm12t.com', '18065235735', null, '', null, 'Ao百度推广 雷锦辉18065235735', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8bued2Yams0rnDD8hicE15E2uqONPtjt0UickweCyL39qY5D78wmdPO8gZRRD1icibNyjNCnvs98cMJzCZ41/0', null, '福建省泉州市丰泽区少林路仁凤工业区亚特大厦', null, '1', '百度推广、网站建设、百度糯米、百度信息流广告、官网标注、百度地图标注、商城网站建设。。。。。。', '1', 'oruQl1YDpak4Ml_N_Wy1N4-znLLA', '2017-07-10 18:27:51', '2017-07-21 09:42:24', null);
INSERT INTO `wc_users` VALUES ('245', 'oruQl1SYSe3G4-1me8SLaibjzhpE', 'maodongrong@xm12t.com', '18850313778', null, '', null, 'A000百度毛冬荣', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5ZxK4mNAGRCW2ak0aGPSeS2KwFPzGJ9Vibu2p0gdAxGKu5qlfnAZVzibicJ5dBpSljSo8CTdQszsJoMI/0', null, '厦门市思明区软件园二期观日路36号201单元', null, '2', '主营业务:百度推广，网站建设，品牌华表，信息流，直通车糯米团购等等', '1', 'oruQl1SYSe3G4-1me8SLaibjzhpE', '2017-07-10 18:32:00', '2017-07-10 19:20:23', null);
INSERT INTO `wc_users` VALUES ('246', 'oruQl1b6xIfJpG14v2kSWv9V90Ec', '1499647156@qq.com', '18046050367', null, '', null, '吴雪红', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5ZibeyvxO9rVeZfLC50otdcIvZyHJoictxxlIuHx5udiabOVeNbm0xxIJvKicY7tpHa5KIibictC0BGoicN1/0', null, '泉州丰泽区少林路仁风工业区亚特大厦4楼', null, '2', '相信能，所以能', '1', 'oruQl1b6xIfJpG14v2kSWv9V90Ec', '2017-07-10 18:43:01', '2017-08-05 11:38:42', null);
INSERT INTO `wc_users` VALUES ('247', 'oruQl1cZ_hSbWGXIiWeCLYP0hyrI', null, null, null, '', null, 'lulu', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q5tGrT4sLp9Rq2pyu3MxUNjs804tXfHhCLh0M5YgT1gYUbjJ7y88pXfJiaN9R52AEAykXHMYkAiaW8/0', null, null, null, '2', null, '1', 'oruQl1cZ_hSbWGXIiWeCLYP0hyrI', '2017-07-10 18:45:08', '2017-07-10 18:45:08', null);
INSERT INTO `wc_users` VALUES ('248', 'oruQl1bg1nztR7bwEFGPraqVWUbs', null, null, null, '', null, '百度谌晓芳', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUZX7zuViatvNjcXOogchBAJ9ffP5ay7vTnRAhd1BZlfokh5p0qyNNp6t2BBpkCibdUtzttElaAViaNSg/0', null, null, null, '2', null, '1', 'oruQl1bg1nztR7bwEFGPraqVWUbs', '2017-07-10 18:48:59', '2017-07-10 18:48:59', null);
INSERT INTO `wc_users` VALUES ('249', 'oruQl1RQFUJlbQkms8P0nvDomALw', null, null, null, '', null, '百度推广&信息流-林洁（糯米）', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQxltjKFnmiaNxMHWxGYarku6dbQ6WiaJtvUJ05wyHRNHljpXMVYqRvBeVuSjYlqA0kqKZcxulkGKW2/0', null, null, null, '2', null, '1', 'oruQl1RQFUJlbQkms8P0nvDomALw', '2017-07-10 18:54:58', '2017-07-10 18:54:58', null);
INSERT INTO `wc_users` VALUES ('250', 'oruQl1c5P8YU0pGbTg3WwJhg5zNQ', null, null, null, '', null, 'A百度郭芬萍', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQwCgooiacYKmH2MY2tqucNMPwc3ibsZWd0LiawqdoXWe16Uor2oILcSpNEZ8IICHS1suc8ZqaKCiaAdD/0', null, null, null, '2', null, '1', 'oruQl1c5P8YU0pGbTg3WwJhg5zNQ', '2017-07-10 19:11:32', '2017-07-10 19:11:32', null);
INSERT INTO `wc_users` VALUES ('251', 'oruQl1YFfPjfQDjwz7mw2MwuD524', 'chenxiaoyan@xm12t.com', '17750091801', null, '', null, '百度 信息流陈小燕', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIQdoEYb25GzzS9GWxSM2mN0VxiceYDWPEkVE0baQkcwocyKSibAKvwyTkeXJ1jUXvNyialP1QQb0wMg/0', null, '厦门市思明区软件园二期观日路36号之一201室', null, '2', '年轻的时候就要努力拼一把！整合:百度推广，网站建设，品牌华表，信息流，直通车糯米团购等等', '1', 'oruQl1YFfPjfQDjwz7mw2MwuD524', '2017-07-10 20:16:50', '2017-07-10 23:02:59', null);
INSERT INTO `wc_users` VALUES ('252', 'oruQl1UmkIR1514bk48uSMlTKzXY', 'zhouhl@ydbaidu.net', '13160700916', null, '', null, '周华乐', 'uploads/user/252/img1499928229.jpg', null, null, null, '1', null, '1', 'oruQl1UmkIR1514bk48uSMlTKzXY', '2017-07-10 21:33:25', '2017-07-13 14:43:50', null);
INSERT INTO `wc_users` VALUES ('253', 'oruQl1d0KL_CzwJVdl-ysMsu91-w', null, null, null, '', null, '0', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5ZyEdJ2pStvh6pt7TSWx0so1nQX7EUibAqDFCNzD0uRiahM8b8tqGhdIHibKEuwED8O66EsM1ASiaKOgS/0', null, null, null, '2', null, '1', 'oruQl1d0KL_CzwJVdl-ysMsu91-w', '2017-07-10 22:44:53', '2017-07-10 22:44:53', null);
INSERT INTO `wc_users` VALUES ('254', 'oruQl1ZxKdO1OQD-FtOd7ffvc9M4', 'liu353056572@126.com', '15004300563', null, '', null, '百度刘敏', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDqWJpJIprIXoOU5vFiaL1rQwcKGuQD3QejKs87hl6w3WHtTr02fGxia5K2uGRg7kJxGsyU2Pic4kKyQ/0', null, '厦门市思明区软件园二期观日路36号之一201室', null, '1', '百度推广，网站建设，品牌华表，百度信息流，直通车糯米团购等', '1', 'oruQl1ZxKdO1OQD-FtOd7ffvc9M4', '2017-07-10 23:42:58', '2017-07-10 23:48:28', null);
INSERT INTO `wc_users` VALUES ('255', 'oruQl1TOApN67pOovzJu3ZWK_lkE', '276803062@qq.com', '18059996903', null, '', null, '百度柯雄峰', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w55BFHuxiaBEZ82ia10H1DDPMYYknKfoAFvN2M36bUV22DoxtIf28JOPx2uHPicfUV9G7FvLe7jVfgegpoPWYpfzal/0', null, '泉州丰泽区少林路仁凤工业区亚特大厦4楼', null, '1', '百度搜索推广，百度信息流推荐，百度糯米，百度官网认证，百度品牌华表，响应式网站双站建设，E推易企秀', '1', 'oruQl1TOApN67pOovzJu3ZWK_lkE', '2017-07-11 00:04:24', '2017-07-21 08:56:35', null);
INSERT INTO `wc_users` VALUES ('256', 'oruQl1dEXAtoOqMBePwUq0nxEDSk', 'guohaiqing@xm12t.com', '15396527615', null, '', null, '百度－郭海清', 'http://wx.qlogo.cn/mmopen/PwLIppqeDCkXPE4xf4icp7GlYEZZ75jpqCibFBjuBguPbbzB4JHDFR211fakTs0VyHiaElNmEQpjpiaCBJgpAB0QibBrBaAMEjqr1/0', null, '泉州市晋江青阳国贸电脑城8楼806', null, '1', '百度一下，你就知道', '1', 'oruQl1dEXAtoOqMBePwUq0nxEDSk', '2017-07-11 07:13:32', '2017-07-11 22:33:00', null);
INSERT INTO `wc_users` VALUES ('257', 'oruQl1SBTMILhdJ1gqGYNxGc0G0g', null, null, null, '', null, 'A百度???? 张志勇', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJRCFTV6WzO5CCKzyvjRVKMCuc7W0xPjCzDyrJQYfpgtLjfd2b6nu95GH4y5ibJ2odCn2Eprh73sMg/0', null, null, null, '1', null, '1', 'oruQl1SBTMILhdJ1gqGYNxGc0G0g', '2017-07-11 08:17:29', '2017-07-11 08:17:29', null);
INSERT INTO `wc_users` VALUES ('258', 'oruQl1S24xxB-W2YULdE6bE6zE94', null, null, null, '', null, '沉睡的长安、乱', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80QzJd2RwV440bdS8YiaH51RwZVSoVdgRia22YjvQbHuvriamj33OoibsHAO3Ux7hmIcc0rp041wG5EEKM/0', null, null, null, '2', null, '1', 'oruQl1S24xxB-W2YULdE6bE6zE94', '2017-07-11 08:30:52', '2017-07-11 08:30:52', null);
INSERT INTO `wc_users` VALUES ('259', 'oruQl1eD18Fowunt4LsCbDA9JCXg', null, null, null, '', null, 'A百度赖国城', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w7icXOgibo1ic5AxkqibWicvE9SA6H7QUO2KOhV9m7BPplicLRpvibqAzEYfcggXOBEbJUboP9941qgg8vmPFWGXyChPLf/0', null, null, null, '1', null, '1', 'oruQl1eD18Fowunt4LsCbDA9JCXg', '2017-07-11 08:34:16', '2017-07-11 08:34:16', null);
INSERT INTO `wc_users` VALUES ('260', 'oruQl1T7ztgEPApy0WQJWY4Ngo-M', '568546616@qq.com', '18959292965', null, '', null, '卢金亮', 'http://wx.qlogo.cn/mmopen/2X7evHor0UWb5btehNeQXfgJx5HrnOKwpI6PmoJtkUibzn0s1glWNiar42hYP2fz460azJW3LNRiaXzT7kmPggjOicAt3icCgE0Io/0', null, '厦门集美', null, '1', null, '1', 'oruQl1T7ztgEPApy0WQJWY4Ngo-M', '2017-07-11 10:23:39', '2017-07-11 10:25:01', null);
INSERT INTO `wc_users` VALUES ('261', 'oruQl1cHAXMIA1XIxOC8IaI38v-w', 'chendp@ydbaidu.net', '18318908522', null, '', 'CKnIrML6JBx1H99F9yAhdLZCxZ6ZwN3q4Lhv3q0c74y19OxeRoqaFAHgDAJZ', '陈达平', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELd5SgLdgVGb8YPpIKRUmWNcDhwUqwxIqQlFnBy2XE1nczLvmUoyYETSDTdSxD6aiaHdhELzrDal3w/0', null, '惠州市惠城区演达一路华阳大厦24楼', null, '1', null, '1', 'oruQl1cHAXMIA1XIxOC8IaI38v-w', '2017-07-11 11:42:05', '2017-08-22 14:37:22', null);
INSERT INTO `wc_users` VALUES ('262', 'oruQl1bHQeG38hwnYnJI41Le45hA', '18060105058@139.com', '18060105058', null, '', 'inefNJrsElSLTeqgx4Dhh8VN4UIdCgbGGJxMTXKdBTZ9CxnT03bFRrgWOTqZ', '.王阳', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBxvA1EozU5L7UicyyMljJQJ0NcxOwfpu0Y2IlmwjgUXnUJf1MOFS1ibrAqUicoFtqLnd1aicwmCeiaSKDaqMvhIngHUzZkviaib6P6vI/0', null, '泉秀路158号', null, '2', null, '1', 'oruQl1bHQeG38hwnYnJI41Le45hA', '2017-07-11 12:42:04', '2017-07-11 12:46:40', null);
INSERT INTO `wc_users` VALUES ('263', 'oruQl1dZxlb_sD6gpTKRfMweIhGU', null, null, null, '', null, 'A当幸福来敲门', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q7yeibicCngHRrMStibZTOC5vEEAt0SXGGupYOwsLRzEHNOjprC1Wza21ysRA9FvSJ7PJHKsToFoD1ia/0', null, null, null, '1', null, '1', 'oruQl1dZxlb_sD6gpTKRfMweIhGU', '2017-07-11 14:57:28', '2017-07-11 14:57:28', null);
INSERT INTO `wc_users` VALUES ('264', 'oruQl1R8ssvBvwnAtvtYQMbbQAyU', null, null, null, '', null, '王大大大大大大脸', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarcxQhXouaoF10Hicbnr4PTAp8UeDBmJd6iatHkH1S2x2japbcibeWuibbuy9WYzzj7h3r0OKLBnVJec6y/0', null, null, null, '2', null, '1', 'oruQl1R8ssvBvwnAtvtYQMbbQAyU', '2017-07-11 15:31:30', '2017-07-11 15:31:30', null);
INSERT INTO `wc_users` VALUES ('265', 'oruQl1YMeF0eZim8pdW0Gqu_-72o', 'liwh@ydbaidu.net', '13143050483', null, '', 'npdxJR4662rgAHb9RLqt72nlS5qgFdYRa64GgtEHxWCn0a6fdTa2gb6hq7pr', '黎文浩', 'http://wx.qlogo.cn/mmopen/5HkCBulJjD1Wn8woxZ1voojo9x0bENvPhV9G3w1nwdFibZqwBbHCdf2wtRE0LzjziaWOaVtPvo63S9ZLebAm2BlqcJbhNiaIqicI/0', null, null, null, '1', null, '1', 'oruQl1YMeF0eZim8pdW0Gqu_-72o', '2017-07-12 08:51:40', '2017-07-13 08:52:38', null);
INSERT INTO `wc_users` VALUES ('266', 'oruQl1TLrIQnrTsAN0loKYSqk8ho', '437361899@qq.com', '13023913951', null, '', null, '厦门百度 林立鹏', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5Sj68AermDS3GKGjvAjRzf5IxsF7kbMIdLEZDARo9Dtqgc0C9wKavbn5yqhzH0ksN5CulVKotianIia7kiarEQ6rz3/0', null, '厦门思明区软件园二期观日路36号201单元', null, '0', '一路向前！', '1', 'oruQl1TLrIQnrTsAN0loKYSqk8ho', '2017-07-12 09:08:26', '2017-07-12 09:12:34', null);
INSERT INTO `wc_users` VALUES ('267', 'oruQl1Z4V5GxikXnsXL6pqg90Npg', '2559143241@qq.com', '18950882050', null, '', null, '苏松浩', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8bued28pzxAicLibuFPe1pNlBSh0M0reKH12bCDzRTLPoFZUbZ4v5EnHaq2ibNUjQwH5CKzCK6kLLnzKIcK/0', null, '龙岩市新罗区龙岩大道商务中心C栋5F508', null, '1', null, '1', 'oruQl1Z4V5GxikXnsXL6pqg90Npg', '2017-07-12 09:14:45', '2017-07-12 09:30:37', null);
INSERT INTO `wc_users` VALUES ('268', 'oruQl1WDbgHuuQ-px73cuOwuOugM', null, null, null, '', null, '互联网百度推广@赖', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUaWicEqWmAMKLMkNhia5YB8iaQPdWnR9nu6ZvLnD0w8OJ6vwZDUkEh48XGLS4C21DCic5TSzXKIYUXGBQ/0', null, null, null, '1', null, '1', 'oruQl1WDbgHuuQ-px73cuOwuOugM', '2017-07-12 09:34:45', '2017-07-12 09:34:45', null);
INSERT INTO `wc_users` VALUES ('269', 'oruQl1ffhfrQgXECVglLq6B9b3ac', 'qzxz@xm12t.com', '13015875575', '0595-28037778', '', null, '丸子。', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q2s0dLiaSGRfzRazHqSL5iaKrUcjh2jicUOWE937R6ibmPNjYibgdgapWPF0cicPJ6pnezKl7O8ZqE65T0/0', null, '泉州市丰泽区少林路仁风工业区亚特写字楼4楼', null, '2', '保持微笑，你会发现生活是美好的。', '1', 'oruQl1ffhfrQgXECVglLq6B9b3ac', '2017-07-12 09:54:15', '2017-07-12 15:41:38', null);
INSERT INTO `wc_users` VALUES ('270', 'oruQl1bpaJVLXcEluHfN_02ATwMA', null, null, null, '', 'neFJpLrBFQqWtWdDW0qinvkeTTJVEb2Mq4ldHDetBUlreq46ruX4JauDTBov', 'Ｃｓｈ', 'http://wx.qlogo.cn/mmopen/rIQuAY6Wvlqa2XDegSH1wslCuOXiaMaWjxyY0eMM7lBc3LeTIKHibUENQmM9z0ibSpC4b3f2KmnkWGic9ne8FoQJ0cpicnvMs6V0T/0', null, null, null, '2', null, '1', 'oruQl1bpaJVLXcEluHfN_02ATwMA', '2017-07-12 10:04:39', '2017-08-04 09:25:07', null);
INSERT INTO `wc_users` VALUES ('271', 'oruQl1dRegh-mS42tPk0hkQ1AdhE', 'zhengjinglin@xm12t.com', '18250852052', '0596-6166559', '', null, '郑荆霖', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5zcQyTaA60GwLFaDuQnI0a0lRj5IZ9zRulbdsoywq40ia9uQmic7RmficEtIn9QvL0DCJjp9Fmbu5ZLs3p3Nw3ibMP/0', null, '漳州市建元东路2号万达广场6楼', null, '1', null, '1', 'oruQl1dRegh-mS42tPk0hkQ1AdhE', '2017-07-12 12:52:39', '2017-07-12 13:09:30', null);
INSERT INTO `wc_users` VALUES ('272', 'oruQl1VOrY3jGwDSMVClD9KrTrVE', 'liusibo@ydbaidu.net', '18688018478', null, '', null, '刘思博', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEJPI8jhib2MxXCiaD3ZibZ7KZ7dqUtK3TE0QWwGYNF64Mqtw/0', null, null, null, '1', null, '1', 'oruQl1VOrY3jGwDSMVClD9KrTrVE', '2017-07-12 16:09:26', '2017-07-12 16:12:02', null);
INSERT INTO `wc_users` VALUES ('273', 'oruQl1anaZcxz_mnBL8WovNWDQAk', 'linkh@ydbaidu.net', '18319704543', null, '', '5iAupeQ31nMxlkOeB1hwuB7oaQvMl1jIjQUIRqnporHm8xmXzPyb2r776rdq', '林可欢', 'http://wx.qlogo.cn/mmopen/06iaElJ7Wj5bq20zc0iaTLKkCRWWaD3bhFpyFs2AOCic44CCd3hic1Vhib2sFMfDPzibhMp4g9jC0B7BRJuPn9TfAxYA6GmT6KWeia0/0', null, null, null, '1', null, '1', 'oruQl1anaZcxz_mnBL8WovNWDQAk', '2017-07-12 16:14:28', '2017-07-18 10:54:49', null);
INSERT INTO `wc_users` VALUES ('274', 'oruQl1W9ht6YsC0__7KyEpBIHr-s', 'zhengtq@ydbaidu.net', '13727954260', null, '', null, 'Z_天琪', 'http://wx.qlogo.cn/mmopen/5HkCBulJjD0u8lR38brfoDHdJ2hWvrupOFPqiardzvWlASln7oxiaGhCKCvRVHJ0MDCSN07hpuTibqHPHiapA8hw4g7CTljkeTFV/0', null, '潮州大道交行大厦8楼', null, '2', null, '1', 'oruQl1W9ht6YsC0__7KyEpBIHr-s', '2017-07-12 16:23:02', '2017-07-13 15:26:51', null);
INSERT INTO `wc_users` VALUES ('275', 'oruQl1UliXPkTZLybNlnJqtx-ReE', 'zhangyufen@xm12t.com', '18050671871', null, '', null, '张宇芬', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8bued71sp8gLS3zwiaLALm21zpqVjvh24EaqTXWzezdFrX1285KZDRooWrVS2W4V7MfXsFzH4SAicG5d1D/0', null, '漳州市龙文区万达广场6楼', null, '2', null, '1', 'oruQl1UliXPkTZLybNlnJqtx-ReE', '2017-07-12 21:35:27', '2017-07-13 14:02:11', null);
INSERT INTO `wc_users` VALUES ('276', 'oruQl1WBTJgTJfDkRB8TMmV9vWz4', 'linyt@ydbaidu.net', '13798450985', null, '', 'EX5YllWvdpsNDidd78LXUoi5quglsy9F5fJJPoidRl2FLOrpHTLvayceVueu', '林玉婷', 'http://wx.qlogo.cn/mmhead/BfRL3E0G1pdyib4d61zeghYXkzdliajJRGstjjmwps0epybZo6iaTUmCQ/0', null, null, null, '2', null, '1', 'oruQl1WBTJgTJfDkRB8TMmV9vWz4', '2017-07-13 10:16:31', '2017-07-13 10:29:57', null);
INSERT INTO `wc_users` VALUES ('277', 'oruQl1Vo3Xzh8HcUrJ-uYHu-nfAo', 'zhongkr@ydbaidu.net', '15627132827', null, '', '5cFPs1FySX85Rft35nBE3Sacc1Wo0Zt1IMhRCbQdymd7l5X3RaNKDpQ9QsqH', '钟可柔', 'http://wx.qlogo.cn/mmopen/5HkCBulJjD3mSGQ4NBCibiaXzE1IfUe9zu14icImh6UxxJZRyG4xwI7SVfibDvfKXGhOK9ZIssPnKicQibUuFIAuHQe7YmViaRcvyTC/0', null, null, null, '2', null, '1', 'oruQl1Vo3Xzh8HcUrJ-uYHu-nfAo', '2017-07-13 10:30:19', '2017-07-13 10:34:20', null);
INSERT INTO `wc_users` VALUES ('278', 'oruQl1bQ3F44d-k4Ob9oKLl-h13c', 'zhengxb@ydbaidu.net', '15626060708', null, '', 'apFKrXyuD3W1sty09MU2l37gTutDFAUADVkW6y4D3dHVDLt6ozAkjRSyoeoi', '郑喜斌', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEJ1GxibqPtyOkzknOCicqCcxoWcqCwibjWRvfA7E38EXabuA/0', null, null, null, '1', null, '1', 'oruQl1bQ3F44d-k4Ob9oKLl-h13c', '2017-07-13 10:48:46', '2017-07-13 11:04:16', null);
INSERT INTO `wc_users` VALUES ('279', 'oruQl1dCka5wyvlCSNRFOGE-sS94', null, null, null, '', 'zz0ZQTjFFgnAxES5sWKQgivVRBC6OXpFlk9niAbhxHwuTEdIQrrKjClx26Va', 'A黄小燕 ', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6Blic4qAQwCMcRhTbWWHVvNQJhEuhvPL3md593Ont2xUA/0', 'uploads/user/279/img1503372768.jpg', null, null, '2', null, '1', 'oruQl1dCka5wyvlCSNRFOGE-sS94', '2017-07-13 11:06:05', '2017-07-13 14:16:43', null);
INSERT INTO `wc_users` VALUES ('280', 'oruQl1XRrT-DyfPEIu1HyL7xciYU', 'xuyijuan@xm12t.com', '13062401829', null, '', null, 'jany艺娟', 'uploads/user/280/img1500436544.jpg', null, '龙文区建元东路万达广场万达百货6楼', null, '2', null, '1', 'oruQl1XRrT-DyfPEIu1HyL7xciYU', '2017-07-13 11:17:15', '2017-07-19 11:47:55', null);
INSERT INTO `wc_users` VALUES ('281', 'oruQl1aKKu1aQ3n2a9l8LTL-TiMk', null, null, null, '', null, 'k', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6vPZArNqcgibLlHwRySwugoCIekcdy4A8J9D9K1URfqzg/0', null, null, null, '1', null, '1', 'oruQl1aKKu1aQ3n2a9l8LTL-TiMk', '2017-07-13 11:17:18', '2017-07-13 11:17:18', null);
INSERT INTO `wc_users` VALUES ('282', 'oruQl1cUBEFzzVxEemHyZS8XWa60', null, null, null, '', null, 'A百度一小陈', 'http://wx.qlogo.cn/mmhead/ic5wZa8tYEiaIr57QQqt5e9jU0HeTmsogUIqfpTicTmt8A/0', null, null, null, '2', null, '1', 'oruQl1cUBEFzzVxEemHyZS8XWa60', '2017-07-13 11:19:01', '2017-07-13 11:19:01', null);
INSERT INTO `wc_users` VALUES ('283', 'oruQl1VPvKEVM2X5btwFBpyrDtsc', 'daishouhua@xm12t.com', '15960333511', null, '', null, '百度一戴子15960333511', 'http://wx.qlogo.cn/mmhead/WiaUQos39rZERkYCYgFpnk5W2bTvvro7cFDMmHML25iaE/0', null, '龙岩新罗区商务版块c栋508百度公司', null, '2', '服务只有起点，满意没有终点', '1', 'oruQl1VPvKEVM2X5btwFBpyrDtsc', '2017-07-13 11:20:38', '2017-07-20 11:29:01', null);
INSERT INTO `wc_users` VALUES ('284', 'oruQl1fNr3ElZYaPhwoTsnyTNRnM', '605480960@qq.com', '17750151106', null, '', null, '小周', 'http://wx.qlogo.cn/mmhead/ufVMVgCvafI1bPJjibW4ZKq2JGXILibKuic9nMTT8Gy5gGgyCZZaO2HnQ/0', null, '漳州市龙文区万达广场6楼', null, '2', null, '1', 'oruQl1fNr3ElZYaPhwoTsnyTNRnM', '2017-07-13 11:44:21', '2017-07-13 14:05:00', null);
INSERT INTO `wc_users` VALUES ('285', 'oruQl1ThRgP6S2hsVaNvxftIYWo4', 'huangxunjie@xm12t.com', '15605966198', null, '', null, '黄勋杰   百度品牌中心', 'http://wx.qlogo.cn/mmhead/d74wwnqmdGlia4tUbqE9DI908ajw5unUxwxh42GTMBWU/0', null, '福建漳州万达广场6层', null, '1', '用心做最好！', '1', 'oruQl1ThRgP6S2hsVaNvxftIYWo4', '2017-07-13 12:46:46', '2017-07-14 15:23:36', null);
INSERT INTO `wc_users` VALUES ('286', 'oruQl1clSzkbfZoSTgHDtbqL8wZc', '719766638@qq.com', '18965182350', null, '', null, '吴燕彬', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5Zyl2S15yXlj07kBwQ7fBOIQXonmScqFDXuz3aBNicHGsOhVaHricVrStxLuaPHN7n8ofNiabIDuiahYV/0', null, null, null, '2', null, '1', 'oruQl1clSzkbfZoSTgHDtbqL8wZc', '2017-07-13 12:47:07', '2017-07-19 11:56:42', null);
INSERT INTO `wc_users` VALUES ('287', 'oruQl1TIljBwzkD-otZBl5mce634', 'xiecaijuan@12t.com', '15695960882', null, '', null, '谢彩娟', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc2121yBEQibiaxYKsqSo8TZV37uhwrzuws0dd1laQucRerkzy7vIF21WxKS8SliaNaWLibzYdCuSKsNib/0', null, '龙文区建元东路2号漳州碧湖万达广场万达百货6楼', null, '2', null, '1', 'oruQl1TIljBwzkD-otZBl5mce634', '2017-07-13 12:47:47', '2017-07-13 14:20:33', null);
INSERT INTO `wc_users` VALUES ('288', 'oruQl1f6hd6-lJd9ptCiCu3irAYs', '330745617@qq.com', '18759619892', null, '', null, '游仔18759619892', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6NIKRnreiaPicur829NgDDokmqEQRM3eCtXiawYZJribfwUQ/0', null, null, null, '1', null, '1', 'oruQl1f6hd6-lJd9ptCiCu3irAYs', '2017-07-13 12:54:17', '2017-07-19 11:52:53', null);
INSERT INTO `wc_users` VALUES ('289', 'oruQl1QZLQvXv8QZYj0zuuHVZHjE', 'laiwanyi@xm12t.com', '15960628337', null, '', null, '小藝', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8buedzsEF3YbMqtTibvb8aJJxmfic809uibXt00sm4zgJia9Pdn1Mm9ZXhbFVB6IgvwwJjHxtIfU3fB7fYHk/0', null, '漳州万达广场', null, '2', '我的青春我做主', '1', 'oruQl1QZLQvXv8QZYj0zuuHVZHjE', '2017-07-13 12:55:45', '2017-07-13 13:00:57', null);
INSERT INTO `wc_users` VALUES ('290', 'oruQl1YNNZRGDKWj8rVrybpo8c2I', 'xuzhipeng@xm12t.com', '13695911616', null, '', null, '百度营销 许志鹏', 'http://wx.qlogo.cn/mmhead/EQahpG3PDC3fcNu1hicG0OCXMgCvbaGvicmQViarXZuRuE/0', null, '漳州市龙文区万达百货六楼', null, '1', '不要等待机会，而要创造机会。', '1', 'oruQl1YNNZRGDKWj8rVrybpo8c2I', '2017-07-13 13:08:47', '2017-07-26 17:27:23', null);
INSERT INTO `wc_users` VALUES ('291', 'oruQl1eOdPxtL1m-yYxW3yGfuU_I', null, null, null, '', null, '小样', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQ5icscjYNYAiaSib5WZB07AA3PI4fA1cmDwgjkuky8T82nRpnSdcNtfIVZpDBfiaRT6dVXM7UAriauURQ/0', null, null, null, '2', null, '1', 'oruQl1eOdPxtL1m-yYxW3yGfuU_I', '2017-07-13 13:11:20', '2017-07-13 13:11:20', null);
INSERT INTO `wc_users` VALUES ('292', 'oruQl1Z2agFdQk_P0KtXUvJAfTeU', null, null, null, '', null, '李秀惠@百度', 'http://wx.qlogo.cn/mmhead/bgBtuKJPaNcBiakibTQNObM3rwuLgVWLyPJuQ8TTBgdwY/0', null, null, null, '0', null, '1', 'oruQl1Z2agFdQk_P0KtXUvJAfTeU', '2017-07-13 13:16:31', '2017-07-13 13:16:31', null);
INSERT INTO `wc_users` VALUES ('293', 'oruQl1caIz08Qa_6QEWt0-lXSS_w', 'wanghao@xm12t.con', '15059680284', null, '', null, '王浩', 'uploads/user/293/img1500435414.jpg', null, '漳州市龙文区建元东路万达广场百货六楼，漳州百度营销服务中心', null, '1', '百度，为企业提供最专业的互联网服务。', '1', 'oruQl1caIz08Qa_6QEWt0-lXSS_w', '2017-07-13 13:26:48', '2017-07-19 11:34:13', null);
INSERT INTO `wc_users` VALUES ('294', 'oruQl1afmpKWp2tM60Ghu9SmRxNw', 'chenchanghua@xm12t.com', '13799717187', null, '', null, '百度陈长华', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQxgy4s9euKiczNDtpbOUV5lxeGZS3Yo0gziaBkMSbjMBGeAibwP6Zj1Hag9JXmdtfyf7BDF8cUKAeAs/0', null, null, null, '2', null, '1', 'oruQl1afmpKWp2tM60Ghu9SmRxNw', '2017-07-13 13:43:19', '2017-07-13 13:56:10', null);
INSERT INTO `wc_users` VALUES ('295', 'oruQl1Src3OR3zhC1Cv3gYS9--4Q', 'zhenghm@ydbaidu.net', '15919388166', null, '', '1HXQHi8fXUnnseoUS0WLgDsFZbXu998h7pWexada4RLiodtVOZgrWoWlrHIC', '郑慧敏', 'http://wx.qlogo.cn/mmhead/04LrpEqAf4v6xfzGLlr6Zxxvk9E63ReA3b07iciakYgib3Gf5iaVl3ia8KA/0', null, null, null, '2', null, '1', 'oruQl1Src3OR3zhC1Cv3gYS9--4Q', '2017-07-13 14:16:59', '2017-07-13 14:59:21', null);
INSERT INTO `wc_users` VALUES ('296', 'oruQl1ZNryv0DtB1Ipy6iMXphXC4', 'weishq@ydbaidu.net', '15859159510', null, '', null, '韦胜青', 'http://wx.qlogo.cn/mmhead/8ICxNnJeDqictrx9aUgNhBhDe92g2Q7Plyn57QKBELF0/0', null, '惠州河南岸演达大道港惠新天地华阳大厦24楼', null, '2', '惠州百度主要负责百度推广，网站建设，信息流广告，百度百科等业务！欢迎来电咨询！', '1', 'oruQl1ZNryv0DtB1Ipy6iMXphXC4', '2017-07-13 14:24:58', '2017-07-13 17:47:57', null);
INSERT INTO `wc_users` VALUES ('297', 'oruQl1RTS7ymb8umLFudjuKeB9hI', 'caizhzh@ydbaidu.net', '15217814787', null, '', null, '百度蔡智重', 'uploads/user/297/img1500184025.jpg', null, '惠城区演达大道华阳大厦24楼惠州百度服务中心', null, '1', '百度推广，网站建设，百度糯米团购，百度信息流', '1', 'oruQl1RTS7ymb8umLFudjuKeB9hI', '2017-07-13 14:43:36', '2017-07-16 13:47:05', null);
INSERT INTO `wc_users` VALUES ('298', 'oruQl1TjwV5oyBvto-KJz0x3PEWQ', 'wuzhx@ydbaidu.net', '13249321171', null, '', null, '惠州百度吴正贤13249321171', 'uploads/user/298/img1499928852.jpg', null, '惠州市惠城区华阳大厦24层', null, '1', '吴正贤', '1', 'oruQl1TjwV5oyBvto-KJz0x3PEWQ', '2017-07-13 14:46:56', '2017-07-13 14:54:14', null);
INSERT INTO `wc_users` VALUES ('299', 'oruQl1dsGbZzmipzQO9dcwZB6pUI', 'Jigy@ydbaidu.net', '18575514605', null, '', null, '粤东百度纪耿毅', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM76t7IwDYkEnz9O15ad0HCOuoicE2wdmYPHiaIDFIgqSRJQ/0', null, '汕头市利鸿基大厦b栋20层', null, '0', '我就是我，不一样的烟火', '1', 'oruQl1dsGbZzmipzQO9dcwZB6pUI', '2017-07-13 14:47:26', '2017-07-13 14:53:52', null);
INSERT INTO `wc_users` VALUES ('300', 'oruQl1a3-6IJSkLaZ62CxbDFWTqE', 'lijm@ydbaidu.net', '13719915016', null, '', null, '李金明', 'http://wx.qlogo.cn/mmhead/1LlgQzJVOyDlv4txBu2uUxACQib083awM9V7j5gjXwt1BYfy8xBPW5w/0', null, '广东省汕头市跃进路23号利鸿基大厦B座20层', null, '1', null, '1', 'oruQl1a3-6IJSkLaZ62CxbDFWTqE', '2017-07-13 14:50:04', '2017-08-16 09:58:17', null);
INSERT INTO `wc_users` VALUES ('301', 'oruQl1eCRaI6DIiR_W8np27gpvo8', null, null, null, '', null, '珊！', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4dVFWxhfaYDMHxhru52V5dRdrWibzBTS6f4z7T7yicicqLw/0', null, null, null, '2', null, '1', 'oruQl1eCRaI6DIiR_W8np27gpvo8', '2017-07-13 14:50:24', '2017-07-13 14:50:24', null);
INSERT INTO `wc_users` VALUES ('302', 'oruQl1WQ_7rIgb5ukZ8nT0I2FAwA', null, null, null, '', '5EPzhap8YeDRjEEHILAcE7jZjjGTUbgZutUT6fE0Kla931jJeTY6hMTypIm3', '铄澄', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5bbtE4sVvdCEI46KuAibIkWRPfSJ8W7YCm0OKVNDzs2aGes8u20iadqccZyuPY3ZY9JwQsmrRAiccX8WqJ5Y0WMOQ6/0', null, null, null, '1', null, '1', 'oruQl1WQ_7rIgb5ukZ8nT0I2FAwA', '2017-07-13 14:51:00', '2017-07-13 14:51:44', null);
INSERT INTO `wc_users` VALUES ('303', 'oruQl1YQkEhY1ZxBiGSfX6HsYTDA', 'chenyy@ydbaidu.net', '15817959339', null, '', null, '粤东百度陈玉燕', 'http://wx.qlogo.cn/mmhead/ajNVdqHZLLDQDoFShjLeNSPq1AJYwlibiaCnTghEs02QMFrkcrxZIibVw/0', null, '汕头市金平区跃进路利鸿基大厦B座20楼', null, '2', '简单，快乐。烦恼，看开就好！', '1', 'oruQl1YQkEhY1ZxBiGSfX6HsYTDA', '2017-07-13 14:51:12', '2017-07-20 14:29:29', null);
INSERT INTO `wc_users` VALUES ('304', 'oruQl1eDfg537A-tp4GvV6eCwOHU', 'liusht@ydbaidu.net', '15016077342', null, '', 'rufdH1CSe5r8J0O0aCzCsQyRTIUNdHL8XBWdYtHwzYT6MwMXLWH0lXHqJeBb', '刘淑婷', 'http://wx.qlogo.cn/mmopen/5HkCBulJjD3mSGQ4NBCibiaVWYtuGJYBa2Gic67err0F9ApuWM9bbicqNic723tbbZ7JZUfhqBhg11ewFa3uSfylqarR7UoXUw5su/0', null, '惠州市惠城区演达一路华阳大厦24楼', null, '2', '惠州百度推广刘淑婷：15016077342', '1', 'oruQl1eDfg537A-tp4GvV6eCwOHU', '2017-07-13 14:51:28', '2017-07-25 17:35:30', null);
INSERT INTO `wc_users` VALUES ('305', 'oruQl1TuHbbN5m0SSYmwFk_CpDA0', 'dingshch@ydbaidu.com', '13531585434', null, '', null, '潮州百度-丁铄澄13531585434', 'uploads/user/305/img1500100109.jpg', null, null, null, '0', null, '1', 'oruQl1TuHbbN5m0SSYmwFk_CpDA0', '2017-07-13 14:52:06', '2017-07-15 14:28:30', null);
INSERT INTO `wc_users` VALUES ('306', 'oruQl1ddfIcClWtpkr8smte_rNSo', null, null, null, '', null, 'CG.', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc4jAXC7P6YzKNr7tQJt6WLM5KAhJBLzPLrGA70AEw4ySE7Vy7CiafwtXL8nZ5giatbY84zAuNYeduY/0', null, null, null, '1', null, '1', 'oruQl1ddfIcClWtpkr8smte_rNSo', '2017-07-13 14:56:24', '2017-07-13 14:56:24', null);
INSERT INTO `wc_users` VALUES ('307', 'oruQl1cdlCHKZn0fMBPF72kSpBug', 'sucheng@ydbaidu.net', '13428012102', '0752-5703917', '', null, '百度大客经理苏成', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM54TcxmhCTC3T2ppAMYr5ObqB6epmO2eiaV5cA5opDvwWw/0', null, '惠州市惠城区演达一路9号华阳大厦24层百度', null, '1', 'Tel:13428012102', '1', 'oruQl1cdlCHKZn0fMBPF72kSpBug', '2017-07-13 14:58:08', '2017-07-13 15:00:03', null);
INSERT INTO `wc_users` VALUES ('308', 'oruQl1cX5G90kb2mqeN8TejyUXAU', null, null, null, '', null, 'A百度胡先生', 'http://wx.qlogo.cn/mmopen/eaxSbS6m4LWQrVZkb6OlRVP0uuBFmHB10Iv8RUYlI9bR2ic4fPtzejlekC5bDicmoicjsQq9lTHYkPCwkkh8uBicxMj6noAh29xw/0', null, null, null, '1', null, '1', 'oruQl1cX5G90kb2mqeN8TejyUXAU', '2017-07-13 15:02:03', '2017-07-13 15:02:03', null);
INSERT INTO `wc_users` VALUES ('309', 'oruQl1drmiPFLVqPQbkNX3-VVpPg', 'huangrh@ydbaidu.net', '13750555457', null, '', 'Ga87aoWg50X6t1PTbUy9zB4zzfAZ4ZzTVNadWdCPq0gPAf8tWuIWmIwyRGNx', '黄润红', 'http://wx.qlogo.cn/mmhead/rObab2DcIhgsLrDYWxajSGia9QGDMuQLJ5GRNE3Nf60A/0', null, null, null, '2', null, '1', 'oruQl1drmiPFLVqPQbkNX3-VVpPg', '2017-07-13 15:08:46', '2017-07-15 11:48:51', null);
INSERT INTO `wc_users` VALUES ('310', 'oruQl1c3bxqUd0WSsJwnXXY4FehY', '258720404@qq.com', '15812933625', null, '', null, '李嘉妮', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5ZbBiaJjwNDRyYP2xE9DySndZXv9xuxj44PkjHDKUwfibbEDKDicQ1KWPR1tL4ov4aDCDVaCc8EibBrhBiczlfygrpKh/0', null, '梅州市彬芳大道中鸿兴创意园7楼', null, '2', null, '1', 'oruQl1c3bxqUd0WSsJwnXXY4FehY', '2017-07-13 15:11:19', '2017-07-13 15:15:31', null);
INSERT INTO `wc_users` VALUES ('311', 'oruQl1fo4qDPFmH_o981-Uio8JEs', 'Chenshq@ydbaidu.net', '13799196686', null, '', 'vRsFAwSGXdoCucQefWPwARZJZ8mUitVN4d7L88FBL1UQGiK0Dhs2HibzsLEJ', '广东惠州百度-陈绍琼13799196686', 'http://wx.qlogo.cn/mmhead/LU9tpwNm2nicsgwPUM8WDlnDImzpKo7nUcbK6XC2dTOg/0', null, '惠州市惠城区演达一路华阳大厦24层', null, '1', '你现在的气质里，藏着你走过的路，读过的书，爱过的人。', '1', 'oruQl1fo4qDPFmH_o981-Uio8JEs', '2017-07-13 15:11:44', '2017-07-14 11:03:16', null);
INSERT INTO `wc_users` VALUES ('312', 'oruQl1fWnsdIHzMP1NcZVXa_MdZw', 'huangcy@ydbaidu.net', '13750591130', null, '', null, '黄彩艺', 'http://wx.qlogo.cn/mmhead/xzvVYaqtSnwRSpnylBibcBrCQYiaLpVouZV0gX2Ojic8uDq0ibzgR8Tuyw/0', null, '梅州市彬芳大道中鸿兴大厦七楼', null, '1', null, '1', 'oruQl1fWnsdIHzMP1NcZVXa_MdZw', '2017-07-13 15:12:35', '2017-07-21 14:25:18', null);
INSERT INTO `wc_users` VALUES ('313', 'oruQl1SJHjbXxDFUZNXCiUMU7iEg', null, null, null, '', null, '惠州百度小林13790777494', 'http://wx.qlogo.cn/mmhead/XFJ8HdGGwGB6plBsaXqXo1SD2Yic9xFc3DDibnxNOXmibksfB88G8DK4A/0', null, null, null, '1', null, '1', 'oruQl1SJHjbXxDFUZNXCiUMU7iEg', '2017-07-13 15:17:08', '2017-07-13 15:17:08', null);
INSERT INTO `wc_users` VALUES ('314', 'oruQl1eJZPtlzxJbIO8kpPERxsiA', 'quxh@ydbaidu.net', '15007520714', null, '', null, '屈晓花', 'http://wx.qlogo.cn/mmopen/Jiavz9UrH80k2UpRfJiavzDMV1YXZw4xY1LQUiaQdrqnbkSemlABQrOB6OLBlHic4phuNepZtTsehgBxLcfD5rkXsiaXwcnLacXfu/0', null, '惠州市惠城区演达一路华阳大厦24层', null, '2', '百度推广、网站建设欢迎咨询。', '1', 'oruQl1eJZPtlzxJbIO8kpPERxsiA', '2017-07-13 15:17:12', '2017-07-25 17:22:01', null);
INSERT INTO `wc_users` VALUES ('315', 'oruQl1UfcvcJYjwFxjrKG4R-nXyo', null, null, null, '', null, 'A惠州百度推广-小园15217598627', 'http://wx.qlogo.cn/mmhead/ob7E1maFycpZsWIrfGWia5N9wHGshIbFFlfoMIEzNhn8/0', null, null, null, '2', null, '1', 'oruQl1UfcvcJYjwFxjrKG4R-nXyo', '2017-07-13 15:17:29', '2017-07-13 15:17:29', null);
INSERT INTO `wc_users` VALUES ('316', 'oruQl1db_KjG1a3gEtwm_qAqDTwg', 'suhh@ydbaidi.net', '15766965377', null, '', null, '惠州百度-阿晖', 'http://wx.qlogo.cn/mmhead/qcvCXwh4QvMbG9x637icyBVuaYZjdkMYTA5mzByAsZZg/0', null, '惠州市惠城区华阳大厦24楼', null, '1', null, '1', 'oruQl1db_KjG1a3gEtwm_qAqDTwg', '2017-07-13 15:18:14', '2017-07-26 17:45:52', null);
INSERT INTO `wc_users` VALUES ('317', 'oruQl1U0MKVGG6sxljhPxPxNDNsY', 'faq@ydbaidu.net', '13825494792', null, '', null, '余唯', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5ZpwibKaF1CB8Vynqz9BXx2ib8icvLiaMVaHwctktMFrAzBPrOjj09A0AmNDkGIbul1KBur1Nx8peV1qiarwBB2FBarZ/0', null, null, null, '2', null, '1', 'oruQl1U0MKVGG6sxljhPxPxNDNsY', '2017-07-13 15:19:47', '2017-07-13 15:22:23', null);
INSERT INTO `wc_users` VALUES ('318', 'oruQl1YZgNdQdBhoAxCGkoTIk_OQ', null, null, null, '', null, '鱼', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4GdPqUlj1IFTIsjc3my6XUdrk3RbYWFJiaNFia8ia0ZhfZw/0', null, null, null, '2', null, '1', 'oruQl1YZgNdQdBhoAxCGkoTIk_OQ', '2017-07-13 15:37:44', '2017-07-13 15:37:44', null);
INSERT INTO `wc_users` VALUES ('319', 'oruQl1YJCcMzYaCItFM9gYywkQnw', null, null, null, '', null, '宇宙超級無敵霹靂美少女是也????', 'http://wx.qlogo.cn/mmhead/wcib2GksmGOlzs1KshVSjj5XpO4HpRTjP6RGEXSV5uTicMbCibaibveSKQ/0', null, null, null, '2', null, '1', 'oruQl1YJCcMzYaCItFM9gYywkQnw', '2017-07-13 16:03:15', '2017-07-13 16:03:15', null);
INSERT INTO `wc_users` VALUES ('320', 'oruQl1REBJ5nlkK9ZEJHznPm2ao4', 'xiaox@ydbaidu.net', '13480554089', null, '', null, '肖璇', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w4X4P5Tibb0W3qFP8icQHcXiaCW5scNpBdYdPqj1paXo13nNPFj45H112uU7qzXsXutNIsqOSrW5gyNibkUvg59V3g3/0', null, '惠州市惠城区演达一路华阳大厦24楼', null, '2', '与你相遇 好幸运', '1', 'oruQl1REBJ5nlkK9ZEJHznPm2ao4', '2017-07-13 16:04:56', '2017-07-15 01:08:07', null);
INSERT INTO `wc_users` VALUES ('321', 'oruQl1amiGBG7xFvaneV-j_vhihg', 'Zhengszh@ydbaidu.net', '13959490124', null, '', null, '百度泗姐', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5mgKO0R6wM7aBgD2Em1EFX00TNObAbUcnW71K9SgVtyw/0', null, '梅州市梅江区彬芳大道中鸿兴创意园7楼', null, '2', null, '1', 'oruQl1amiGBG7xFvaneV-j_vhihg', '2017-07-13 16:09:24', '2017-07-13 16:20:17', null);
INSERT INTO `wc_users` VALUES ('322', 'oruQl1R7-1MGXPM4su0IGL-IMGrQ', null, null, null, '', 'mib6PuoGVTxJhBhkQpFpNnTyhlv9cBmLSPxnRl7oEnV6ARsQarDTGoaEemEo', '梅州百度 刘仕望', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4QnopEPxnUL13vT5uPCCkibFWJiazVr5oPc7srnX3cauDUEYwatsXLoGek1cmBK5ICicx8VKornTyQ0HpqiauBUWw5eibgzau99zIY/0', null, null, null, '2', null, '1', 'oruQl1R7-1MGXPM4su0IGL-IMGrQ', '2017-07-13 16:18:07', '2017-07-13 16:21:57', null);
INSERT INTO `wc_users` VALUES ('323', 'oruQl1fHTLDaFPY1PIwsym8XuOAI', null, null, null, '', 'y2O6hcFdcZdRw813czmFOxY5ke2uYyIzfZNl6IrzzWN2r27RsHUInlaLtIRu', '朝浦', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5L9AW84dhkFgxUfxYxbnt2pfnfulInUeyImtLbsXokEw/0', null, null, null, '1', null, '1', 'oruQl1fHTLDaFPY1PIwsym8XuOAI', '2017-07-13 16:32:47', '2017-07-13 16:34:38', null);
INSERT INTO `wc_users` VALUES ('324', 'oruQl1X_hbzFrXHh5S7At4U5x5Bc', 'maixq@ydbaidu.net', '18407582489', null, '', null, '小麦', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5Z7877AShHlN2xb8Vla7h7KibsDb4DRRguVCDPuXyEMb7rSdukCo0NDRb4Kx1MH3Y8BOPgYib81xLibe/0', null, '惠州百度营销服务中心', null, '2', '我能无限可能', '1', 'oruQl1X_hbzFrXHh5S7At4U5x5Bc', '2017-07-13 16:57:38', '2017-07-14 11:38:09', null);
INSERT INTO `wc_users` VALUES ('325', 'oruQl1bwmD9r3cH2_DZklX1ka3Do', 'liaoyy@ydbaidu.net', '15768858289', null, '', null, '廖雨雁', 'http://wx.qlogo.cn/mmhead/eHEMOF2hOencWUYCrVvPkErdnTtEXRiaia00I5icnMCjLzNd2okIiaibSEw/0', null, '惠州市惠城区华阳大厦24层', null, '2', '百度推广、百度营销、网站建设', '1', 'oruQl1bwmD9r3cH2_DZklX1ka3Do', '2017-07-13 17:17:10', '2017-07-14 10:34:51', null);
INSERT INTO `wc_users` VALUES ('326', 'oruQl1aqsfk13FGK0iuPw8Z-JskQ', 'guoql@ydbaidu.net', '13531511144', null, '', null, '洽洽', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEJNw94qrk8FTBlSMCJqfibiarGQstT8Yv2J51gQSJptyicpQ/0', null, '潮州大道交行8楼', null, '1', null, '1', 'oruQl1aqsfk13FGK0iuPw8Z-JskQ', '2017-07-13 17:35:29', '2017-07-24 15:02:21', null);
INSERT INTO `wc_users` VALUES ('327', 'oruQl1Vor9FslEgWaWQKsBpcGpjE', '404478090@qq.com', '15707680504', null, '', null, '百度营销中心陈泽杰', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEKeCic1bicwXzuBDzWuuoibENxDCLOibVibJWcrfB11lA5Jy6A/0', null, null, null, '1', null, '1', 'oruQl1Vor9FslEgWaWQKsBpcGpjE', '2017-07-13 17:36:43', '2017-07-13 17:37:40', null);
INSERT INTO `wc_users` VALUES ('328', 'oruQl1cvHTjqtQXQvXH7yTIOin0E', 'zhengsh@ydbaidu.net', '18807677776', null, '', null, '郑思鸿', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtXJSichtjoaP7avBBiaGsEebYdF4qYERu96K0RbJ9gsMKlQxMDhd5oV5QEGK9NWhtIZMOLSxibDIibLH4BIjqukRibEU/0', null, '广东省潮州市潮州大道交通大厦8楼潮州百度', null, '1', '新时代，网络是大趋势…你还想错过吗？', '1', 'oruQl1cvHTjqtQXQvXH7yTIOin0E', '2017-07-13 17:37:18', '2017-07-24 15:04:00', null);
INSERT INTO `wc_users` VALUES ('329', 'oruQl1VHPDKHnbwHWonWs-9U1l1M', 'fanjh@ydbaidu.net', '18826483354', null, '', null, '范健航', 'http://wx.qlogo.cn/mmhead/EWo3hwIVSD2mfm9CwGHVCbibibkDXxBRNArVeq4Z8JNlNiaVS5JODZcGg/0', null, '惠州市惠城区演达大道9华阳大厦24层', 'http://0752baidu.cn', '1', '百度推广丨网站建设', '1', 'oruQl1VHPDKHnbwHWonWs-9U1l1M', '2017-07-13 17:55:12', '2017-07-25 18:53:40', null);
INSERT INTO `wc_users` VALUES ('330', 'oruQl1R3KET9YXwttW96GQro_RUo', 'huangyu@ydbaidu.net', '18813402610', null, '', 'l816wLNlTyVrZowMcSLGwVDTKTeWQhf0hcWT0QpoCimkXwErxXYXqvUmoE49', '黄毓', 'http://wx.qlogo.cn/mmhead/TTQibyKjrickyDDzmCuGaGibh5s4F4A19JaBicWYTr8rO0XuMGOhrdh1vQ/0', null, null, null, '2', '百度推广、网站建设、百度品牌推广、百度信息流', '1', 'oruQl1R3KET9YXwttW96GQro_RUo', '2017-07-13 18:15:50', '2017-07-13 18:29:00', null);
INSERT INTO `wc_users` VALUES ('331', 'oruQl1Z3J04sOPtnPjugaQDDhbSM', 'pangr@ydbaidu.com', '13531246349', null, '', 'h2CnPE0Lcmy7kCgI6WyubShuyJDsKMpSklIDR0Z9n0gkvonk2QUUGyxgMZzQ', '如如????', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaELXCzkar1AibASibHDHn8eRHzc51r9aYtRT0G4Wn8YrIUicA/0', null, null, null, '2', '百度推广，百度信息流，百度直通车，百度百科，百度地图，网站建设', '1', 'oruQl1Z3J04sOPtnPjugaQDDhbSM', '2017-07-13 18:22:31', '2017-07-13 18:31:43', null);
INSERT INTO `wc_users` VALUES ('332', 'oruQl1XA39tRh6jf7MfBZooThjgM', null, null, null, '', null, '-Higuain-', 'http://wx.qlogo.cn/mmhead/LTpwfH82ricm5Hu2utNMoorticInTBrl5b8FVNCib2GOT1yPJj0nwuqrg/0', null, null, null, '2', null, '1', 'oruQl1XA39tRh6jf7MfBZooThjgM', '2017-07-13 18:42:08', '2017-07-13 18:42:08', null);
INSERT INTO `wc_users` VALUES ('333', 'oruQl1T8nkPscqrXV95Cx6dW-trM', '179141793@qq.com', '13690014371', null, '', null, '菜菜-力胜体育13690014371', 'http://wx.qlogo.cn/mmhead/QnM5bMcic4Z146veSabibHZJGdoNiaX95872Rtiaic1PIfZyyYlibIqsuqUA/0', null, '潮州大道8楼', null, '2', null, '1', 'oruQl1T8nkPscqrXV95Cx6dW-trM', '2017-07-13 18:43:07', '2017-07-13 22:18:06', null);
INSERT INTO `wc_users` VALUES ('334', 'oruQl1XHhsLJHeCQ9r-mUUx3FrlE', '844032405@qq.com', '15823195617', null, '', null, '许志飞', 'http://wx.qlogo.cn/mmhead/Rm7hEkmsmDv6lvfUmZAFHL58ia1WzJDMf1QMrRk5aiaUc/0', null, '惠州市惠城区港惠新天地华阳大厦24层', null, '1', null, '1', 'oruQl1XHhsLJHeCQ9r-mUUx3FrlE', '2017-07-13 19:13:33', '2017-07-13 19:26:54', null);
INSERT INTO `wc_users` VALUES ('335', 'oruQl1YohSPqnsGkDKysgWHi63kk', null, null, null, '', null, 'No one', 'http://wx.qlogo.cn/mmhead/YjurveN6Nx15kuaMZCPwJ1lGImfCcsOo3jNEqjKmf14/0', null, null, null, '1', null, '1', 'oruQl1YohSPqnsGkDKysgWHi63kk', '2017-07-13 19:18:40', '2017-07-13 19:18:40', null);
INSERT INTO `wc_users` VALUES ('336', 'oruQl1etKU4SlRnDZiwOgJAoD6kQ', 'chenzel@18city.cn', '18927961465', null, '', null, '陈泽霖', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEJaR1G45g7WDibhWu3UGXOltG04rPFmiahFzB01VRAZn7zQ/0', null, '海丰县附城镇海丽花园', null, '1', '百度推广（手机百度、百度地图、百度糯米）', '1', 'oruQl1etKU4SlRnDZiwOgJAoD6kQ', '2017-07-13 21:08:36', '2017-07-13 21:17:13', null);
INSERT INTO `wc_users` VALUES ('337', 'oruQl1RZjSff9uRr_2s0Y1-lxjSk', '1477661876@qq.com', '17088849962', null, '', null, '潮州百度-蔡卓聪(17088849962)', 'http://wx.qlogo.cn/mmhead/icFTnRoibgibpibrnnqia5DcXcIGm4WG09HTO2Xkbb1vlicaOiapib462hvsQg/0', null, '潮州市潮州大道交银大厦 8 楼', null, '1', null, '1', 'oruQl1RZjSff9uRr_2s0Y1-lxjSk', '2017-07-13 22:40:13', '2017-07-13 22:44:17', null);
INSERT INTO `wc_users` VALUES ('338', 'oruQl1S8oj8_bO5JQRuIE2gmBtuk', 'jianghj@ydbaidu.net', '13018771710', null, '', null, '江慧娟', 'http://wx.qlogo.cn/mmhead/VLjDyM7pibyII6ib4XppT6daKuwCefHGQ1bWzX0EdnL2BeibhJ4jrVgicA/0', null, '潮州', null, '2', '百度推广，网站建设，梅州深山农家自养蜂蜜', '1', 'oruQl1S8oj8_bO5JQRuIE2gmBtuk', '2017-07-14 08:34:15', '2017-07-24 15:10:07', null);
INSERT INTO `wc_users` VALUES ('339', 'oruQl1QzfiCU9W7LjuFtyL_6woFs', 'fujn@ydbaidu.net', '13828309897', null, '', null, '傅炯楠', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEKZB7rYZhcibNE4fbXficHoL5YRZXA6FegvPSAkgJBpv1kQ/0', null, null, null, '1', null, '1', 'oruQl1QzfiCU9W7LjuFtyL_6woFs', '2017-07-14 08:35:25', '2017-07-14 08:38:12', null);
INSERT INTO `wc_users` VALUES ('340', 'oruQl1ZtYlbHDXG1eVsm82CS6vcs', 'shiyy@12t.cn', '13656030069', null, '', null, '施英英', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5gyOPPKB81j4ViaoLz7GZ4aC4N7mVWgUV2Pf7fWbdCHAg/0', null, null, null, '2', null, '1', 'oruQl1ZtYlbHDXG1eVsm82CS6vcs', '2017-07-14 08:59:20', '2017-08-05 11:12:38', null);
INSERT INTO `wc_users` VALUES ('341', 'oruQl1dE_9jZfxo8gJMOne7HRP_k', null, null, null, '', null, '惠州百度贺菇凉????', 'http://wx.qlogo.cn/mmopen/rIQuAY6WvlqrUuxAKky78oyq5JwZMwmYBwXpGictDLiazIgfJkiclwEXwJmsVZcPIia943mwozIhhlHpuMkSmgfCOcsFwiaItAZpM/0', null, null, null, '2', null, '1', 'oruQl1dE_9jZfxo8gJMOne7HRP_k', '2017-07-14 09:45:37', '2017-07-14 09:45:37', null);
INSERT INTO `wc_users` VALUES ('342', 'oruQl1YIwJVBPNvVbrmdXgr1qFrA', 'wanghan@ydbaidu.net', '15768653944', null, '', null, '百度-王涵', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEIUO2SKA4TUWI48mVobs5Rt5N5KgpXxJtZjN9rTasXuUA/0', null, '惠城区演达大道华阳大厦', null, '2', null, '1', 'oruQl1YIwJVBPNvVbrmdXgr1qFrA', '2017-07-14 10:25:50', '2017-07-25 14:33:44', null);
INSERT INTO `wc_users` VALUES ('343', 'oruQl1TXf_atEJoi80AtmLpE_8uY', 'lindy@ydbaidu.net', '18050017758', null, '', null, '百度林待有～阿佑', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7ET2k7icVjUt95hcoYSZMVrv7kHEUM8TbvTEYxjQLVVHQ/0', null, null, null, '1', null, '1', 'oruQl1TXf_atEJoi80AtmLpE_8uY', '2017-07-14 10:29:37', '2017-08-16 09:58:45', null);
INSERT INTO `wc_users` VALUES ('344', 'oruQl1XpxAoeTf5kihrJihzYaxfA', '1296649557@qq.com', '13906000547', null, '', null, '欣云', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7TE0cfsic6ic7VaCvfVqdQaiaIFGOY48gHhn033HWm5bPcA/0', null, '厦门市软件园二期观日路36号201室', null, '2', null, '1', 'oruQl1XpxAoeTf5kihrJihzYaxfA', '2017-07-14 10:34:20', '2017-07-14 10:39:03', null);
INSERT INTO `wc_users` VALUES ('345', 'oruQl1RRdwNxhVGlNDpPkXt9id9Y', null, null, null, '', null, '百度、冨', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5J4Y6eSWRA9VQvkn4zBlM9qk4hbpjqSZibhKdbjGx014A/0', null, null, null, '1', null, '1', 'oruQl1RRdwNxhVGlNDpPkXt9id9Y', '2017-07-14 10:59:21', '2017-07-14 10:59:21', null);
INSERT INTO `wc_users` VALUES ('346', 'oruQl1dAIqEHbwRePd2mtDYiTsFw', 'linyzh@ydbaidu.net', '15160079854', null, '', null, '林友忠', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5mxFl7N50ONibCo0hLFJoDjfXqjnVHEKezB5REUogo1zg/0', null, '汕头市金平区跃进路23号利鸿基大厦B栋20楼', null, '1', '汕头百度大区经理', '1', 'oruQl1dAIqEHbwRePd2mtDYiTsFw', '2017-07-14 11:05:00', '2017-07-14 11:08:25', null);
INSERT INTO `wc_users` VALUES ('347', 'oruQl1VXwZJ4oyAa93_4jAi63GiA', 'lizj@ydbaidu.net', '13560245949', null, '', null, '百度企业营销顾问-李泽杰', 'http://wx.qlogo.cn/mmhead/5cJ329xUeTxH1omWw76ob0FVFYsryFviaks1icR2hTlM01uPpplOxxnA/0', null, '汕头市跃进路利鸿基大厦B座20楼', null, '1', '致力于服务企业转型升级，通过结合网络为企业发展出谋划策，创造美好未来！', '1', 'oruQl1VXwZJ4oyAa93_4jAi63GiA', '2017-07-14 11:14:52', '2017-07-14 11:24:27', null);
INSERT INTO `wc_users` VALUES ('348', 'oruQl1UcLMKv7soWsOnPxvaYapdo', 'fusht@ydbaidu.net', '13437619721', null, '', null, '付绍婷', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5ZicEyTcSibgVdicRuA3iajujibLJibEJLsfW2cicwsZ9jf1PjQcAnO7k1LauKQlcucQFZ1BAicdGF4f3DWf7/0', null, '惠州河南岸演达大道港汇华阳大厦24楼', null, '2', '友善待人，诚信做事。\r\n\r\n百度推广，信息流，网站建设，团购', '1', 'oruQl1UcLMKv7soWsOnPxvaYapdo', '2017-07-14 11:47:02', '2017-07-25 14:42:41', null);
INSERT INTO `wc_users` VALUES ('349', 'oruQl1RfYvyTYjpJRc68yE89WB-4', null, null, null, '', null, '陈二丫', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc9sy4ianfEdSlbzuQdj90iaptE8UEcWYY6RqsXLUicaZduCUeXJVicficKjicxCd43m1QTGFXOEz6o7m6L/0', null, null, null, '0', null, '1', 'oruQl1RfYvyTYjpJRc68yE89WB-4', '2017-07-14 12:46:18', '2017-07-14 12:46:18', null);
INSERT INTO `wc_users` VALUES ('350', 'oruQl1aYIEy5A7VkvwgDtxrC5Kw8', null, null, null, '', null, '钟燕', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6uKcIUH21F4CRNnH0ZbcJsJqjRxdAYgv6BCOTlERjHTQ/0', null, null, null, '2', null, '1', 'oruQl1aYIEy5A7VkvwgDtxrC5Kw8', '2017-07-14 16:04:48', '2017-07-14 16:04:48', null);
INSERT INTO `wc_users` VALUES ('351', 'oruQl1fd-ZuAw-oFkgCiW_XPQDz8', '2435381260@qq.com', '18759637520', null, '', null, '厦门百度李凯琦', 'http://wx.qlogo.cn/mmhead/FGAial1Uico95OlBiaYLWDyKcxYamGN7kAC9bu9fGUEcI8/0', 'uploads/user/351/img1502962254.jpg', '软件园二期观日路36', null, '1', null, '1', 'oruQl1fd-ZuAw-oFkgCiW_XPQDz8', '2017-07-14 16:13:13', '2017-08-07 08:58:53', null);
INSERT INTO `wc_users` VALUES ('352', 'oruQl1VuqkdiYwIsZiYUjsojMLwM', 'zhanghs@ydbaidu.net', '13926774523', null, '', null, '百度营销顾问-张宏昇', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7htCVqmuwDTXKon0siaXOcfmLut5dtwCGj3vvKC1iatwWQ/0', null, '汕头市金平区利鸿基大厦B座20层', null, '1', null, '1', 'oruQl1VuqkdiYwIsZiYUjsojMLwM', '2017-07-14 16:14:26', '2017-07-14 16:18:52', null);
INSERT INTO `wc_users` VALUES ('353', 'oruQl1c7YIsp9mKbiq7y8KUfkNqs', '290083580@qq.com', '15960234999', null, '', null, '谢培鸣', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5wtbxo3SxIlLmBbyQY0k2JibJskniaffgW4maAOicQCND9w/0', null, '厦门市集美区后溪镇第二农场后厝48号', null, '1', null, '1', 'oruQl1c7YIsp9mKbiq7y8KUfkNqs', '2017-07-14 16:17:46', '2017-07-14 16:20:42', null);
INSERT INTO `wc_users` VALUES ('354', 'oruQl1axkTT2zJTkRzBixuzB7ECI', 'alex_lin76@hotmail.com', '18559306918', null, '', null, 'ALEX LIN', 'http://wx.qlogo.cn/mmhead/yYI4pIsF7XEyRiaTLLb9ThRJK9A0jicbyNdTKq6RdibKt8O7EHDQuwZBw/0', null, 'AMOY CHINA', null, '1', 'MAKE IT HAPPEN...', '1', 'oruQl1axkTT2zJTkRzBixuzB7ECI', '2017-07-14 16:30:48', '2017-08-02 23:19:06', null);
INSERT INTO `wc_users` VALUES ('355', 'oruQl1eJdp1UzCQD3g7MGEGJ6gQE', null, null, null, '', null, 'ZKJ中科净-科技创造洁净', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7ZI25agRUKlad3KndYRIbqXReXxwiaeXzqRcXnYUZI8hA/0', null, null, null, '1', null, '1', 'oruQl1eJdp1UzCQD3g7MGEGJ6gQE', '2017-07-14 16:41:06', '2017-07-14 16:41:06', null);
INSERT INTO `wc_users` VALUES ('356', 'oruQl1Q6RLRJiNiIYOC1qnbixmiQ', null, null, null, '', null, '柯裕慧', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6HJ6ua6ZXFzKxhDojibORJILltZZMUf0X8c81xv2ngJdw/0', null, null, null, '2', null, '1', 'oruQl1Q6RLRJiNiIYOC1qnbixmiQ', '2017-07-14 17:36:27', '2017-07-14 17:36:27', null);
INSERT INTO `wc_users` VALUES ('357', 'oruQl1RSyJ-kPNM0IhWMtO7M586c', null, null, null, '', null, '惠州百度刘雅玲15766954559', 'http://wx.qlogo.cn/mmhead/UOlZKghBxaZkDPCntiaHON1y2PaiaGNgSaFuRV3jFicicGts64JwKyy5DA/0', null, null, null, '2', null, '1', 'oruQl1RSyJ-kPNM0IhWMtO7M586c', '2017-07-14 18:34:29', '2017-07-14 18:34:29', null);
INSERT INTO `wc_users` VALUES ('358', 'oruQl1bSbOrdFoKsDdwJ9jy19NgQ', 'zenglp@ydbaidu.net', '13085763883', null, '', null, '百度  丽萍', 'uploads/user/358/img1500036678.jpg', null, '汕头市利鸿基大厦b栋20百度公司', null, '2', '让有需求的客户找到您~相信百度', '1', 'oruQl1bSbOrdFoKsDdwJ9jy19NgQ', '2017-07-14 20:46:27', '2017-07-14 20:51:18', null);
INSERT INTO `wc_users` VALUES ('359', 'oruQl1fmm8WopfwjKjbZKdbwoxyg', 'wangww@ydbaidu.net', '15820740575', null, '', null, 'A00000百度SEVEN', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5PFA3BA7uCtm9Ya6kpFibIg40FiajxqEnPibGlsUBNRkAWw/0', null, '惠州市惠城区演达大道华阳大厦24层', null, '1', '给我一个机会 还你一个奇迹', '1', 'oruQl1fmm8WopfwjKjbZKdbwoxyg', '2017-07-14 20:50:24', '2017-07-14 20:53:39', null);
INSERT INTO `wc_users` VALUES ('360', 'oruQl1WUNpQH036gHekgKxsocbGA', 'qiuby@ydbaidu.net', '13413143283', null, '', null, '惠州百度邱碧云', 'http://wx.qlogo.cn/mmhead/B2EfAOZfS1gJUeoHyr2micicxMB4nB2gvN1r0XicZn8oQgF0EZYTk1oJw/0', null, '惠州惠城港汇新天地华阳大厦24楼', null, '2', '以诚心相待，用服务说话（您值得拥有）', '1', 'oruQl1WUNpQH036gHekgKxsocbGA', '2017-07-14 22:20:12', '2017-07-22 18:31:58', null);
INSERT INTO `wc_users` VALUES ('361', 'oruQl1QMJ7jFPLiuASvOfZI4ngsY', 'liliangliang@ydbaidu.net', '15767454577', null, '', null, '李亮亮', 'uploads/user/361/img1500963830.jpg', null, '惠州市河南岸华阳大厦24楼', null, '1', '相信百度，相信自己', '1', 'oruQl1QMJ7jFPLiuASvOfZI4ngsY', '2017-07-14 22:57:28', '2017-07-14 23:08:52', null);
INSERT INTO `wc_users` VALUES ('362', 'oruQl1f_6NuBi2QXbQmQMISojR7E', null, null, null, '', 'iocMrK8ssjtRiILSjCES2B8j4AI3zza2s5GKgujD88QwAggROoyYywP6bl9b', '林_BINGer????', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6FJUp6evmibh6kEpAgH5FCZ00zTYZhpMoFFHicIGYOxzXg/0', null, null, null, '2', null, '1', 'oruQl1f_6NuBi2QXbQmQMISojR7E', '2017-07-15 11:12:10', '2017-07-15 11:18:59', null);
INSERT INTO `wc_users` VALUES ('363', 'oruQl1WRSVebqojeXWTER8Hhbb5Q', null, null, null, '', null, '一个小箱子', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEK28xmicYiaWWXzwlt7J1OrPMXem3xTqYCalkz4MR15Ktpw/0', null, null, null, '2', null, '1', 'oruQl1WRSVebqojeXWTER8Hhbb5Q', '2017-07-15 11:17:07', '2017-07-15 11:17:07', null);
INSERT INTO `wc_users` VALUES ('364', 'oruQl1QXmKprGcLWKpH0UpsmxYm0', null, null, null, '', null, '灵通桓少', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaELLfwjTxpPNrU8RYL4hZxODBicE5APDgprbY7D5sibfDdvg/0', null, null, null, '1', null, '1', 'oruQl1QXmKprGcLWKpH0UpsmxYm0', '2017-07-15 11:21:59', '2017-07-15 11:21:59', null);
INSERT INTO `wc_users` VALUES ('365', 'oruQl1ac7l1GL8OtS2Jw8YdjTrNA', null, null, null, '', null, '????✨Hong✨', 'http://wx.qlogo.cn/mmhead/OUicWJdJoz3FIG5ZXrfFXwohOvnibwfAKD1efnIXM5ooIHkt1XCuLOKA/0', null, null, null, '2', null, '1', 'oruQl1ac7l1GL8OtS2Jw8YdjTrNA', '2017-07-15 11:22:27', '2017-07-15 11:22:27', null);
INSERT INTO `wc_users` VALUES ('366', 'oruQl1USQJo2wqQpZRo4NasiY-B8', 'lizhzh@ydbaidu.net', '13723697136', null, '', null, '李卓臻', 'http://wx.qlogo.cn/mmhead/xzvVYaqtSnxmQ0wvkjyf8WMce8P9Ue7PbUcjFIsicIl0W10jrdXbJTw/0', null, '梅州市彬芳大道鸿兴创意园', null, '2', null, '1', 'oruQl1USQJo2wqQpZRo4NasiY-B8', '2017-07-15 11:42:23', '2017-07-15 11:45:01', null);
INSERT INTO `wc_users` VALUES ('367', 'oruQl1UHZ2tqJNl3CVbBGGgIQf1k', 'guchw@ydbaudi.net', '15899984276', null, '', null, '梅州M', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEKt4WziaCMG36eUmkPFQ22DQictQLl6OYEoibt2mNwNEXjmQ/0', null, null, null, '1', null, '1', 'oruQl1UHZ2tqJNl3CVbBGGgIQf1k', '2017-07-15 14:00:58', '2017-07-15 16:54:49', null);
INSERT INTO `wc_users` VALUES ('368', 'oruQl1aTmm8V7q-phOJ3NL_7Xub8', 'huangxy@ydbaidu.net', '17876160693', null, '', null, '黄晓燕', 'http://wx.qlogo.cn/mmhead/AYfn0IKjIIOUVkKB86AqZ09jJoglhdichAPM1UU3OQOstDzBb9cn4rg/0', null, '跃进路利鸿基', null, '2', '百度推广，网站建设，信息流产品，本地化直通车', '1', 'oruQl1aTmm8V7q-phOJ3NL_7Xub8', '2017-07-15 18:40:30', '2017-07-21 07:34:48', null);
INSERT INTO `wc_users` VALUES ('369', 'oruQl1fh84ECw1JkZ7K2OoTKzTu0', null, null, null, '', null, 'A.邹斯韩', 'http://wx.qlogo.cn/mmhead/dW9Lx6OTm68iasX6fHibGQXA3Ax6Bt73gZPLTfqlkU9zo/0', null, null, null, '1', null, '1', 'oruQl1fh84ECw1JkZ7K2OoTKzTu0', '2017-07-16 14:04:36', '2017-07-16 14:04:36', null);
INSERT INTO `wc_users` VALUES ('370', 'oruQl1QLiH_l72UsJV9qn1LTdpqE', '418308645@qq.con', '13286252575', null, '', null, 'AA百度@文静', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEIlmj4zc1SSiawla4CzVlmpLL4SUlto7pyP5gyt8GfBhKQ/0', null, '华阳大厦24楼', null, '2', null, '1', 'oruQl1QLiH_l72UsJV9qn1LTdpqE', '2017-07-16 14:28:41', '2017-07-16 14:30:23', null);
INSERT INTO `wc_users` VALUES ('371', 'oruQl1WtSVAOAbzS2jyFG-0NOGYo', 'libin@ydbaidu.net', '15766901485', null, '', null, '百度 李彬', 'http://wx.qlogo.cn/mmhead/eb4MwItsIqNK9bAs4eTYoIWMufMoapfbAbLL6PDUakA/0', null, '河南岸华阳大厦', null, '2', '百度推广  百度信息流  网站建设', '1', 'oruQl1WtSVAOAbzS2jyFG-0NOGYo', '2017-07-17 11:34:59', '2017-07-26 10:27:00', null);
INSERT INTO `wc_users` VALUES ('372', 'oruQl1eZIZXz82B7BuyDchBmEb0o', '1573008812@qq.com', '13692726347', null, '', null, '*Miss z', 'http://wx.qlogo.cn/mmhead/hIz3ylFIYSicVCIjFUDI3icpfNhlrOicbia8CSclnBg8og0gA48SpX5iafQ/0', null, '华阳大厦24楼', null, '2', null, '1', 'oruQl1eZIZXz82B7BuyDchBmEb0o', '2017-07-17 15:00:45', '2017-08-06 20:10:13', null);
INSERT INTO `wc_users` VALUES ('373', 'oruQl1Vad5i2o_57KG1RkKWvklzY', 'chenja@ydbaidu.net', '18475055430', null, '', null, '陈金岸', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4WPsCJib6PzoJibsMgobysLFkr6KSib6bOHdxOekAt4X9Fg/0', null, '梅州市彬芳大道中鸿兴大厦B栋7楼', null, '1', '百度推广，网站建设，百度品牌专区，百度品牌起跑线', '1', 'oruQl1Vad5i2o_57KG1RkKWvklzY', '2017-07-18 10:50:33', '2017-07-21 14:25:22', null);
INSERT INTO `wc_users` VALUES ('374', 'oruQl1detHqabcq8uIzwKe3ekZBc', 'yangji@ydbaidu.net', '13923042225', '0753-8589091', '', 'qMAqLYhvYwbYuXOZdh0fToFnkLcaxoGVm9moKArQtGCwb1xFox9YNk5h6Yhf', '杨继', 'http://wx.qlogo.cn/mmhead/JCrjicctRMocOVBwZxy3k3dkibCF2ibFaWW85iaQBVQ2AqhYiaFZh9pbPBQ/0', null, '梅州市梅江区彬芳大道鸿兴大厦B栋7楼', null, '1', '网络营销专业打造！', '1', 'oruQl1detHqabcq8uIzwKe3ekZBc', '2017-07-18 10:52:24', '2017-07-25 14:08:46', null);
INSERT INTO `wc_users` VALUES ('375', 'oruQl1diIaw3siXJW9Rbat_FfATk', '644673844@qq.com', '15992337880', null, '', null, '林洽', 'http://wx.qlogo.cn/mmhead/bSb5dSzPn0KZVxDkmV4ibwuuvKC6cLAia9YscYhpvBfoSWhqHxqKrHhA/0', null, null, null, '1', null, '1', 'oruQl1diIaw3siXJW9Rbat_FfATk', '2017-07-18 11:19:25', '2017-07-18 11:33:06', null);
INSERT INTO `wc_users` VALUES ('376', 'oruQl1XiPy-Lg-Iy2p7tZluiCbCQ', '623090300@qq.com', '17876806060', null, '', 'EekZ874Fdkg0DCdpoOQ2ImVLU0vJxjOcqmwy0Hc0xUwHhKLfBNYNSmcdDdIQ', '仅仅是炜哥哥而已', 'http://wx.qlogo.cn/mmhead/LXqicVqwJiatp0SqyfMZx676OdJIXHnicKDtwXZJaZTJh6q6TC3pJMpVw/0', null, null, null, '1', null, '1', 'oruQl1XiPy-Lg-Iy2p7tZluiCbCQ', '2017-07-18 11:19:31', '2017-07-26 17:11:21', null);
INSERT INTO `wc_users` VALUES ('377', 'oruQl1aV4ETDQVe8LNSPEORLjFrU', 'stadmin@ydbaidu.net', '18029500662', '0754-89929711', '', null, '恬甜', 'http://wx.qlogo.cn/mmhead/bofA1vl6EUbVypflpZibibdibdjx2iaTCRxv76DicpQBicAkWqZDibdU4qFOA/0', null, null, null, '2', null, '1', 'oruQl1aV4ETDQVe8LNSPEORLjFrU', '2017-07-18 11:38:21', '2017-07-18 11:39:43', null);
INSERT INTO `wc_users` VALUES ('378', 'oruQl1XpPUpxBaGSnGz6wfnMCuGs', null, null, null, '', null, 'Alice????', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEKmTNudLqoSQaYs2TKotliciaJNfHUHzRclwcXIOoT7Oic0A/0', null, null, null, '2', null, '1', 'oruQl1XpPUpxBaGSnGz6wfnMCuGs', '2017-07-18 11:39:30', '2017-07-18 11:39:30', null);
INSERT INTO `wc_users` VALUES ('379', 'oruQl1bPp-VdY3kaDXnRrM3cBEkc', 'chenshumin@ydbaidu.net', '12345678910', '12345678910', '', 'FvFVfqptIkSkfmhBJL8CUysuq5hmeA4f0s2t8OCpgYNxCPgdv7gFGsrQQF5b', 'Chan.s.m', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7v4LS4CKCLndHrqoaLHM0lmqcBtV7ibmoNT1GGdpH6hLw/0', null, null, null, '1', null, '1', 'oruQl1bPp-VdY3kaDXnRrM3cBEkc', '2017-07-18 15:22:46', '2017-07-19 15:08:20', null);
INSERT INTO `wc_users` VALUES ('380', 'oruQl1R0ZvhwDkfTejb9RJsxcsHg', null, null, null, '', null, '百度~王雄', 'http://wx.qlogo.cn/mmhead/0sDCa2E8S1vG876trrGqPw8libtNcgrxzkDX0Nww1y42nfYWC6SDBvA/0', null, null, null, '1', null, '1', 'oruQl1R0ZvhwDkfTejb9RJsxcsHg', '2017-07-18 15:47:05', '2017-07-18 15:47:05', null);
INSERT INTO `wc_users` VALUES ('381', 'oruQl1QVFo834YAz_yXf6e8ZcMQQ', 'chenqq@ydbaidu.net', '13129543212', null, '', 'XTHCX36yRpeyVe02aNHETanpWUyyIRYG8rXMJNqK5TZlyW1x7hAm7jg3BJJz', '陈倩倩', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEJ42iaATZLeh3ibDibm0zgH04DI8Un2S4juJC3BwxnBx11NQ/0', null, '', null, '2', '百度推广，给你前行新动力！', '1', 'oruQl1QVFo834YAz_yXf6e8ZcMQQ', '2017-07-18 15:52:15', '2017-07-20 15:30:56', null);
INSERT INTO `wc_users` VALUES ('382', 'oruQl1brXtATBVYVOABoyUUpQF1Q', 'ggggg@163.com', '17759205930', null, '', null, '小小叶', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM68HsWzqf72xULoiabOhtdxTtDpkeLT2oicqfCPdowgLZow/0', null, '厦门', null, '1', 'ceo\r\n', '1', 'oruQl1brXtATBVYVOABoyUUpQF1Q', '2017-07-18 16:26:57', '2017-07-18 16:29:40', null);
INSERT INTO `wc_users` VALUES ('383', 'oruQl1WeftYyFJzd3PJ1fETshf5M', 'chenxl@ydbaidu.net', '13729431211', null, '', '2wA0nLwRH9saJ54kD7faAHQr5rPtz6bXg27mILAHnk5SOAfuZeBwIDMPivEQ', '陈晓玲', 'http://wx.qlogo.cn/mmhead/F2CHYbNuNS8OYTOXibD5v1bNUTaMfWemHicotJpf3xEbo/0', null, '广东省普宁市流沙镇御景城三期对面百得厨卫4楼', null, '2', null, '1', 'oruQl1WeftYyFJzd3PJ1fETshf5M', '2017-07-18 16:38:31', '2017-07-18 18:13:55', null);
INSERT INTO `wc_users` VALUES ('384', 'oruQl1Qpekhph3I5389eiHxdzkEo', '13270283@qq.com', '18695688909', null, '', null, '风吹麦浪', 'http://wx.qlogo.cn/mmhead/otPIf59dvusTFJmkk5MicfbibDehZiaKSlicCsCteKMLKgk/0', null, null, null, '1', null, '1', 'oruQl1Qpekhph3I5389eiHxdzkEo', '2017-07-18 17:52:02', '2017-07-18 17:54:34', null);
INSERT INTO `wc_users` VALUES ('385', 'oruQl1f6vBMyBUK8CKbGRaOIAZn4', 'laian@ydbaidu.net', '15975193395', null, '', null, '赖安娜', 'http://wx.qlogo.cn/mmhead/ic3ibEjvYaKJxibZ8LF5bt8ZBPR9BU7XaheZh4ESQfrngYD79J5UgpiaMQ/0', null, '广东省揭阳市普宁市流沙御景城二期百得橱柜四楼', null, '2', null, '1', 'oruQl1f6vBMyBUK8CKbGRaOIAZn4', '2017-07-18 18:03:53', '2017-07-18 18:21:28', null);
INSERT INTO `wc_users` VALUES ('386', 'oruQl1eOuL4JalaCx2lU7q84a0GM', 'lizhp@ydbaidu.net', '13192939699', null, '', null, '李志平', 'uploads/user/386/img1500381221.jpeg', null, null, null, '1', '业务：百度糯米，百度直通车，百度信息流，百度地图全景等', '1', 'oruQl1eOuL4JalaCx2lU7q84a0GM', '2017-07-18 18:06:59', '2017-07-18 20:36:38', null);
INSERT INTO `wc_users` VALUES ('387', 'oruQl1a45nyuDhxfYbcPYNVgaoms', 'huangab@ydbaidu.net', '13610356629', null, '', '1h4R5PY12mm79te6VpT14WaWHVzgecVR5rB1KgwAScMuxn5XsvlgFKBjVaCk', '黄艾冰', 'http://wx.qlogo.cn/mmhead/JW0xibTktrT36fwfLXteZnc4lmwBiaVYCRvFfooCdVzN8/0', null, null, null, '2', '榴莲千层是我的命。', '1', 'oruQl1a45nyuDhxfYbcPYNVgaoms', '2017-07-18 18:07:01', '2017-07-25 08:41:27', null);
INSERT INTO `wc_users` VALUES ('388', 'oruQl1Yqxm3aDzUlWL1CQXAT0FbY', 'laicc@ydbaidu.net', '18312218572', null, '', null, '赖楚纯', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5CtRFq4XqtQicibliaUibvLYwCktXAt2ObyC8iaAYAx6Fnu4Q/0', null, '揭阳市普宁市流沙御景城二期对面百得厨卫', null, '2', null, '1', 'oruQl1Yqxm3aDzUlWL1CQXAT0FbY', '2017-07-18 18:09:38', '2017-07-18 18:24:31', null);
INSERT INTO `wc_users` VALUES ('389', 'oruQl1dVA1mZbgQvmTs2tVoHKago', null, null, null, '', 'ksUAWWShqn0YR4jiPMURe91vjsCJhem1KgSDU42vuWFBNEZcJ97vSwDKvgSe', '百度糯米客服', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEK1JkWJ2axLzYnbDkJNSqiafcGCXm2Rv8ggahoWb3ql1gA/0', null, null, null, '0', null, '1', 'oruQl1dVA1mZbgQvmTs2tVoHKago', '2017-07-18 18:12:31', '2017-07-18 18:12:46', null);
INSERT INTO `wc_users` VALUES ('390', 'oruQl1W1KQ6Goq3pkD_Tog0RhO4E', null, null, null, '', 'miinLQCLOwg2ZMZNd13bnomSNu6BDAOFEB0J6uoxZEJ0zFI0qtkcI7HNWrar', '梁伟雄', 'http://wx.qlogo.cn/mmhead/GqIlejFTbNiaoa02fDyKROPOYqsGlYjuqYKweKiaqcT8fgY9ofNiaznuA/0', null, null, null, '1', null, '1', 'oruQl1W1KQ6Goq3pkD_Tog0RhO4E', '2017-07-19 08:48:35', '2017-07-19 08:49:57', null);
INSERT INTO `wc_users` VALUES ('391', 'oruQl1dImc8G4-h3WIkQgl0_gdhk', null, null, null, '', null, '章航', 'http://wx.qlogo.cn/mmhead/WmwqjsSBsZJa3VfIIRPZa9I3YcXQXZv8VBcfD5O1pM7cTCxrju2rlg/0', null, null, null, '1', null, '1', 'oruQl1dImc8G4-h3WIkQgl0_gdhk', '2017-07-19 08:57:46', '2017-07-19 08:57:46', null);
INSERT INTO `wc_users` VALUES ('392', 'oruQl1YmhRFLc_V2EyjUEBvG3qow', 'fangxyz@ydbaidu.net', '13652998411', '0660-3259166', '', null, '方贤莹珠', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEIcnOwsoIJcdicvYicfp3NRSNyTWHANu5YIFlE224qbUaQw/0', null, '汕尾市城区鸿景园二期', null, '2', null, '1', 'oruQl1YmhRFLc_V2EyjUEBvG3qow', '2017-07-19 08:58:08', '2017-07-19 09:07:13', null);
INSERT INTO `wc_users` VALUES ('393', 'oruQl1XZ54Ti3kRQeb3w6rNjzz48', null, null, null, '', 'GKmj5Ulgm2P9fPySzT2mVAWPy6wHInJAnAbFUuvSfYxJnhjWHkHo0OdjxT5I', '黄游娜', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM771jctnt8kGp8nHF07IcKtpulzsMGYSokLR4JGfq4Gbw/0', null, null, null, '2', null, '1', 'oruQl1XZ54Ti3kRQeb3w6rNjzz48', '2017-07-19 09:09:18', '2017-07-19 09:10:33', null);
INSERT INTO `wc_users` VALUES ('394', 'oruQl1YnBvWBlv7-U-InmSH_hrT4', 'liyr@ydbaidu.net', '18219056474', '0753-8589091', '', 'AEonGfMSP2Cc8xxpKIv66vgttWa6RLREDZZGZg1AlNCKFJnsNmRQmyjD36XV', '月 Rong', 'http://wx.qlogo.cn/mmhead/GqIlejFTbNhw6DSgkicvq1xIy9DjT1hSrPvUMgpO3AOKNDPawF8Bzmg/0', null, '梅州市梅江区彬芳大道鸿兴大厦B栋7楼', null, '2', '人生没有彩排，每一天都是现场直播，加油吧。。。', '1', 'oruQl1YnBvWBlv7-U-InmSH_hrT4', '2017-07-19 09:14:40', '2017-07-19 16:02:36', null);
INSERT INTO `wc_users` VALUES ('395', 'oruQl1XMzPWLJ08aKIBpl7xLW_MU', 'lijiajie@ydbaidu.com', '13512757976', null, '', null, 'GaGit', 'http://wx.qlogo.cn/mmhead/eHEMOF2hOelK8n5MXjcVeySIRR8Pgq5OGYWJSEKNJafYshPAAGRTsA/0', null, '广东省汕头市龙湖区', null, '1', null, '1', 'oruQl1XMzPWLJ08aKIBpl7xLW_MU', '2017-07-19 09:25:28', '2017-08-07 11:54:48', null);
INSERT INTO `wc_users` VALUES ('396', 'oruQl1WT6dDkU1rtT5ECf8nhjDOE', 'linyu@ydbaidu.net', '13676111604', null, '', null, '林煜', 'uploads/user/396/img1502066590.jpg', null, '汕头市金平区中源大厦1302', null, '1', '努力到自己无能为力，拼搏到自己感动自己', '1', 'oruQl1WT6dDkU1rtT5ECf8nhjDOE', '2017-07-19 09:28:30', '2017-08-07 08:44:00', null);
INSERT INTO `wc_users` VALUES ('397', 'oruQl1dyyC_FTB_jJ3sssa_Idh24', 'wangyuying@ydbaidu.net', '13750495226', null, '', null, 'MOT颖', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaELGj0b4zuNIzEYbz143nH7HxCDwBEQ4TSfFkiaYHrZF7yA/0', null, 'ydbaidu.ne汕头市金平区长平路中源大厦1302', null, '1', '厚德载物，不诚无物。', '1', 'oruQl1dyyC_FTB_jJ3sssa_Idh24', '2017-07-19 09:29:54', '2017-08-07 10:06:09', null);
INSERT INTO `wc_users` VALUES ('398', 'oruQl1QQdhLv4g9T_krt7hsrheL8', null, null, null, '', 'aV4L9WPglHEQShotOtt3JMDMuwwjSGbu3G2y5AKabTwe5Gtiz17CSDumWmht', 'a黄守威威翰摄影13242418520,61072', 'http://wx.qlogo.cn/mmhead/5ZQ3V8nVdKo1ytic4JWTqyJLTDtCOg8t7qr9oOS6XQd0UlscrtBSkVg/0', null, null, null, '1', null, '1', 'oruQl1QQdhLv4g9T_krt7hsrheL8', '2017-07-19 09:57:16', '2017-07-19 09:57:41', null);
INSERT INTO `wc_users` VALUES ('399', 'oruQl1YrLp1_vW694cyKjLCFfRJc', null, null, null, '', null, '2xy', 'http://wx.qlogo.cn/mmhead/ajNVdqHZLLBnccOQFjssqicL5QWMJSk2cvGjlEzcHdzuWIm2VTQyWQQ/0', null, null, null, '2', null, '1', 'oruQl1YrLp1_vW694cyKjLCFfRJc', '2017-07-19 10:10:39', '2017-07-19 10:10:39', null);
INSERT INTO `wc_users` VALUES ('400', 'oruQl1e8yIj40pIW9HkML67aQo6Y', null, null, null, '', null, 'L*M*Y', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7rBsia7qCvAv3Siczu7WuymI7OjfXS8ntVZVQ0SicIELvrA/0', null, null, null, '2', null, '1', 'oruQl1e8yIj40pIW9HkML67aQo6Y', '2017-07-19 10:11:02', '2017-07-19 10:11:02', null);
INSERT INTO `wc_users` VALUES ('401', 'oruQl1Stc1BNKenczZs0i_DWelHU', null, null, null, '', null, ' 徐先生', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaELQIxtnOZibBibU20T5J4OAic1YlLnGt2kdHAtTQaKDXQ7zQ/0', null, null, null, '1', null, '1', 'oruQl1Stc1BNKenczZs0i_DWelHU', '2017-07-19 10:14:31', '2017-07-19 10:14:31', null);
INSERT INTO `wc_users` VALUES ('402', 'oruQl1bnh11H94XYZhZex8oWyRlk', null, null, null, '', null, '小洋', 'http://wx.qlogo.cn/mmhead/fWJhv9xMFTt9eQuiczxibbuQDsxgXRRicykYZ7jSnRMjLn78dEQmIlTBg/0', null, null, null, '1', null, '1', 'oruQl1bnh11H94XYZhZex8oWyRlk', '2017-07-19 10:15:38', '2017-07-19 10:15:38', null);
INSERT INTO `wc_users` VALUES ('403', 'oruQl1Wq_XHUbw-c7E1henSW4FMw', null, null, null, '', null, ',  ,', 'http://wx.qlogo.cn/mmhead/WmwqjsSBsZLcoMoibb1uRvBvvTCQcI0rD6n469kxTkWtU4ch9uEMDpw/0', null, null, null, '2', null, '1', 'oruQl1Wq_XHUbw-c7E1henSW4FMw', '2017-07-19 10:19:45', '2017-07-19 10:19:45', null);
INSERT INTO `wc_users` VALUES ('404', 'oruQl1T2i83GdwRBlc2bgLS-VvDg', null, null, null, '', null, '芝士就是力量', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4yFyagyNFTvpYOhbiaMa1V7JuTLm7EbibTdUQDH5lhgPCQ/0', null, null, null, '1', null, '1', 'oruQl1T2i83GdwRBlc2bgLS-VvDg', '2017-07-19 11:22:07', '2017-07-19 11:22:07', null);
INSERT INTO `wc_users` VALUES ('405', 'oruQl1dQlimN9QxfsA9Kq8-9QmDk', 'shijun@xm12t.com', '18701904918', null, '', null, '施君', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5rS5aic5GnfEpfoicy48UXIickeER9iaPfibRTSGliaEsem1zA/0', null, '龙文区建元东路2号漳州碧湖万达广场万达百货6楼', null, '1', '路漫漫其修远兮，吾将上下而求索', '1', 'oruQl1dQlimN9QxfsA9Kq8-9QmDk', '2017-07-19 11:22:50', '2017-07-19 11:28:31', null);
INSERT INTO `wc_users` VALUES ('406', 'oruQl1aNIKRIvUrAJIO95gurqxCU', 'hongyongyu@12t.com', '15659696591', null, '', null, '洪永裕', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKHIhqHA3OO6XeM8rF16VIk29E3qDJ9PyJJrIJXd37kh8HyiaKqPaNcB4sNCjtYTUxufyuW8BSfHibA/0', null, '漳州市龙文区建元东路2号万达百货6楼', null, '1', '总有人要成功的，为什么不是你', '1', 'oruQl1aNIKRIvUrAJIO95gurqxCU', '2017-07-19 11:23:14', '2017-07-19 11:54:35', null);
INSERT INTO `wc_users` VALUES ('407', 'oruQl1dfwGrkywc_yjqEPtBIf3_A', '237176186@qq.com', '18094042073', null, '', null, '林晓敏', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6iaPPRSDWDibDpicppStYy4y9TBTXFYODMfmzXUQwjd9p6w/0', null, null, null, '2', null, '1', 'oruQl1dfwGrkywc_yjqEPtBIf3_A', '2017-07-19 11:26:08', '2017-07-19 11:52:53', null);
INSERT INTO `wc_users` VALUES ('408', 'oruQl1dMRjZ1KgfWViR5u4jjSExY', 'qiuhuirong@xm12t.com', '18850236602', null, '', null, '邱惠蓉', 'http://wx.qlogo.cn/mmhead/83bpWp8EdlibfqfLLsLWsQiblVIRlJ3HmYweQibv4THBib4/0', null, '漳州市龙文区建元东路2号碧湖万达广场6楼', null, '1', '创意领导未来', '1', 'oruQl1dMRjZ1KgfWViR5u4jjSExY', '2017-07-19 11:26:17', '2017-07-19 11:52:10', null);
INSERT INTO `wc_users` VALUES ('409', 'oruQl1a9PXbPb7SBaeFaXI9jNUnI', 'lanzhihai@xm12t.com', '15659822208', null, '', null, '蓝志海', 'http://wx.qlogo.cn/mmhead/7YnclxsxC0IVibDHfMmYguuR1HiaoQSaWzKibolnR2ibUia8/0', null, null, null, '1', null, '1', 'oruQl1a9PXbPb7SBaeFaXI9jNUnI', '2017-07-19 11:26:29', '2017-07-19 11:52:44', null);
INSERT INTO `wc_users` VALUES ('410', 'oruQl1cKE8TJ3jm9yrRpWGoweH98', null, null, null, '', null, '陈晓慧', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEL0F9L6P5U6icBjs6fCH5Wdxmx6vo7Q0zeHwXEBahhQ8Jw/0', null, null, null, '0', null, '1', 'oruQl1cKE8TJ3jm9yrRpWGoweH98', '2017-07-19 11:28:56', '2017-07-19 11:28:56', null);
INSERT INTO `wc_users` VALUES ('411', 'oruQl1QuWxc-dw04tXQ_YzzdaQPg', '1051000743@qq.com', '15260072091', null, '', null, '钟森强', 'http://wx.qlogo.cn/mmhead/ajNVdqHZLLCros1nFibPJz7hX6rpZ1NKgqcWjB8raDrPZUsanicP6GwA/0', null, '福建省漳州市诏安县西潭乡美营村', null, '1', '百度推广，网站建设，本地推广服务需要的找我15260072091', '1', 'oruQl1QuWxc-dw04tXQ_YzzdaQPg', '2017-07-19 11:30:56', '2017-07-27 09:28:49', null);
INSERT INTO `wc_users` VALUES ('412', 'oruQl1SrbS8BaawEcfB7M3FUjqg4', '3162769872@qq.com', '18859610599', null, '', null, '陈燕秀', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM54qtibRvNicQEw2qhdrSceicrZj4sBt55gEvBwkj5Kb6OyA/0', null, '漳州市龙文区建元东路2号碧湖万达广场六楼', null, '1', null, '1', 'oruQl1SrbS8BaawEcfB7M3FUjqg4', '2017-07-19 11:38:27', '2017-07-19 11:57:49', null);
INSERT INTO `wc_users` VALUES ('413', 'oruQl1dGh9OxuYpF7jM7ZuGDA8L4', 'huangshuling@xm12t.com', '15006063031', null, '', null, 'sulin', 'http://wx.qlogo.cn/mmhead/032SFrKfTF1iblWj777aN7Xx2pPeDXvsGgFZZ1mlW78U/0', null, '万达广场', null, '2', '相信美好就会遇见美好', '1', 'oruQl1dGh9OxuYpF7jM7ZuGDA8L4', '2017-07-19 11:42:08', '2017-07-26 17:32:08', null);
INSERT INTO `wc_users` VALUES ('414', 'oruQl1YGLg2_f8kM0bQ2V3hsaInk', 'wusiling@12t.com', '18859673818', null, '', null, '侬540', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM79BBLySAy1bnaBoazjAV2mI2VeUEzdNm6kHMnHZ16X7g/0', null, '漳州市龙文区建元东路万达百货6楼', null, '2', null, '1', 'oruQl1YGLg2_f8kM0bQ2V3hsaInk', '2017-07-19 11:43:04', '2017-08-01 09:14:15', null);
INSERT INTO `wc_users` VALUES ('415', 'oruQl1XcFIRyCtk-02BQD1K1PdXo', null, null, null, '', null, '林尔佳要做自己的太阳', 'http://wx.qlogo.cn/mmhead/LIMVN2XWG8GOQNaq1NysPb9c9MQwMUia6UXwU3rBdJ80ppJRJZWgL4g/0', null, null, null, '2', null, '1', 'oruQl1XcFIRyCtk-02BQD1K1PdXo', '2017-07-19 11:43:56', '2017-07-19 11:43:56', null);
INSERT INTO `wc_users` VALUES ('416', 'oruQl1eTD28m1-IsQDWLc4pUpNe8', null, null, null, '', null, '雨中太阳的泪', 'http://wx.qlogo.cn/mmhead/iachxria75aow0PlH7tGiaIjH239pnCAMARskjrxdjHPtA/0', null, null, null, '1', null, '1', 'oruQl1eTD28m1-IsQDWLc4pUpNe8', '2017-07-19 11:52:00', '2017-07-19 11:52:00', null);
INSERT INTO `wc_users` VALUES ('417', 'oruQl1eHAYFaD0ROkvMTOCQGK-98', '412506154@qq.com', '15880408497', null, '', null, '????笑', 'http://wx.qlogo.cn/mmhead/FHe9Rn9YotJ85r825F7MaI8ZA9v2HE4NEBDP0ZYHibjY/0', null, null, null, '2', null, '1', 'oruQl1eHAYFaD0ROkvMTOCQGK-98', '2017-07-19 11:52:18', '2017-07-19 11:54:27', null);
INSERT INTO `wc_users` VALUES ('418', 'oruQl1QekorG28FRwN-0pV5gOw2o', null, null, null, '', null, '易', 'http://wx.qlogo.cn/mmhead/4abo5Vk23K900ymenwwj1PbrpFQtEbRy58BjuDTC4FA/0', null, null, null, '0', null, '1', 'oruQl1QekorG28FRwN-0pV5gOw2o', '2017-07-19 11:53:02', '2017-07-19 11:53:02', null);
INSERT INTO `wc_users` VALUES ('419', 'oruQl1ae1vSzRIl4K1bzbY19DUt8', 'laiyonghui@xm12t.com', '15659733078', null, '', null, '若羽而逝、、', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM731IBQG2FRcZicNruCsXUoict6YSYiawSibm1urdUEc2L2Ng/0', null, null, null, '2', null, '1', 'oruQl1ae1vSzRIl4K1bzbY19DUt8', '2017-07-19 11:53:23', '2017-07-19 11:55:01', null);
INSERT INTO `wc_users` VALUES ('420', 'oruQl1bkZF60U_ciYxKfLH_o10AQ', '546637794@qq.com', '18050709936', null, '', null, '吴炉国', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7N2xnSSL2mYA5JLMltNKpmusLGjjaIO2LHCee64UsJCg/0', null, '漳州市龙文区碧湖万达广场六楼', null, '1', null, '1', 'oruQl1bkZF60U_ciYxKfLH_o10AQ', '2017-07-19 11:54:12', '2017-07-25 09:27:43', null);
INSERT INTO `wc_users` VALUES ('421', 'oruQl1bUjZlXCC_DGD64SQ1KWjC0', 'youruifeng@xm12t.com', '15659530928', null, '', null, '瑞凤Y.', 'http://wx.qlogo.cn/mmhead/wcib2GksmGOkjy1tFqEwB2UtE8RCibq7Piaz5g2VZKj5UDQmRotmw9AVg/0', null, null, null, '2', null, '1', 'oruQl1bUjZlXCC_DGD64SQ1KWjC0', '2017-07-19 11:56:00', '2017-07-27 09:23:58', null);
INSERT INTO `wc_users` VALUES ('422', 'oruQl1bpvGrLZyC1woDP2N5w4x34', null, null, null, '', null, '君君雅大西瓜', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM45HZICm0bXgia1KbCJ2FbBssMFegUjIdh0LKTVPtu14Bg/0', null, null, null, '2', null, '1', 'oruQl1bpvGrLZyC1woDP2N5w4x34', '2017-07-19 11:59:36', '2017-07-19 11:59:36', null);
INSERT INTO `wc_users` VALUES ('423', 'oruQl1YS5UkOj4ExCI7bMEbFc8qg', null, null, null, '', 'rH7F5jOoEawIeftGihbrZ9ZmURZgn78e8EyRMYS2dtAQdthXc7yLPk7cgxDA', 'Julia', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEIlqnX5KaPMic7zyNSiaPiaPoZA9C30whtLZV0FOcH9uIGug/0', null, null, null, '2', null, '1', 'oruQl1YS5UkOj4ExCI7bMEbFc8qg', '2017-07-19 15:01:52', '2017-08-17 19:21:48', null);
INSERT INTO `wc_users` VALUES ('424', 'oruQl1R6WvisHygSBL9Hibn6WSJ4', '351655667@qq.com', '13542848747', null, '', null, '林佳龙', 'http://wx.qlogo.cn/mmhead/CttmTaYSYkQJkah5dh0xpQG6ibQBrD5fU4q2aIjnFvO2rNRNooMVWCw/0', null, '汕头市金平区中源大厦1302', null, '1', '身不由已，词不达意！', '1', 'oruQl1R6WvisHygSBL9Hibn6WSJ4', '2017-07-19 15:13:44', '2017-07-20 10:57:35', null);
INSERT INTO `wc_users` VALUES ('425', 'oruQl1X7Hnc0oDh7218a4tNMOn9I', '799567397@qq.com', '13750520571', null, '', null, '大女人', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEKbjycT1nOPbfIBchncXTyRvfZcNhWwmOPWuZic80q4psA/0', null, '广东省梅州市', null, '2', '挂云帆', '1', 'oruQl1X7Hnc0oDh7218a4tNMOn9I', '2017-07-19 15:15:24', '2017-07-21 14:24:08', null);
INSERT INTO `wc_users` VALUES ('426', 'oruQl1RH-212GUbvDsYKt-JhiDwE', 'fengjinyan@ydbaidu.net', '13075298618', null, '', null, '冯锦雁', 'http://wx.qlogo.cn/mmhead/2s6OoOSwe8aJKPIk5TYPica9Q5fDyqPIbQwo2Drdn5Vc/0', null, '惠州市惠城区演达一路华阳大厦24楼', null, '1', null, '1', 'oruQl1RH-212GUbvDsYKt-JhiDwE', '2017-07-19 15:16:40', '2017-07-19 16:40:49', null);
INSERT INTO `wc_users` VALUES ('427', 'oruQl1bjmdMbTLQa3hyAJvfEKmOU', null, null, null, '', null, '百度糯米丶豪', 'http://wx.qlogo.cn/mmhead/sc8lJYpicUaUdibrNbPQrUrAyg9v8qg7BfHMTWRYGRTLSrnicO5Gop25A/0', null, null, null, '1', null, '1', 'oruQl1bjmdMbTLQa3hyAJvfEKmOU', '2017-07-19 15:22:40', '2017-07-19 15:22:40', null);
INSERT INTO `wc_users` VALUES ('428', 'oruQl1URaxvpmWiBaWtMlth9aS5o', null, null, null, '', null, '李凝', 'http://wx.qlogo.cn/mmhead/kiaXicXJs2M4dYj9WuE7g4O47hOI0FuKFm012NibsJYYrlUQ8v1DBkWwA/0', null, null, null, '2', null, '1', 'oruQl1URaxvpmWiBaWtMlth9aS5o', '2017-07-19 15:26:36', '2017-07-19 15:26:36', null);
INSERT INTO `wc_users` VALUES ('429', 'oruQl1abGfNW007WBj7Aeyfpqpuk', null, null, null, '', null, '宇健', 'http://wx.qlogo.cn/mmhead/KetjXWSVpptfJAfkOeNj5l3DibcVViaCYrfuF7TwRtljEMauhA9IdEbg/0', null, null, null, '1', null, '1', 'oruQl1abGfNW007WBj7Aeyfpqpuk', '2017-07-19 15:30:28', '2017-07-19 15:30:28', null);
INSERT INTO `wc_users` VALUES ('430', 'oruQl1Sj2ngwxwY3m-a8ImECQyGI', '1742161394@qq.com', '13417602035', null, '', null, 'liberty', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5tF2rpBvMEOOrgMcmeKpgv4r1qvQqx0BbrUiauwMfFOBw/0', null, null, null, '1', '王耿彬', '1', 'oruQl1Sj2ngwxwY3m-a8ImECQyGI', '2017-07-19 15:38:18', '2017-07-19 16:01:57', null);
INSERT INTO `wc_users` VALUES ('431', 'oruQl1T8VyMEuBaFWt2azBovCSfA', null, null, null, '', null, '烏斯', 'http://wx.qlogo.cn/mmhead/VNMic85jx3X75WUyxrbz8ibibYZkwJy1G5zpiaOrGaAzl2gW0yAunuvLBw/0', null, null, null, '1', null, '1', 'oruQl1T8VyMEuBaFWt2azBovCSfA', '2017-07-19 15:38:33', '2017-07-19 15:38:33', null);
INSERT INTO `wc_users` VALUES ('432', 'oruQl1QguqFgrpPCYwCeKN2e3aWc', null, null, null, '', null, '惠州百度 钟亚钊', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEL2eZCv8UJlbfJPI5QA5iarol5zBRzHhWZkE4zZFOkxw8w/0', null, null, null, '1', null, '1', 'oruQl1QguqFgrpPCYwCeKN2e3aWc', '2017-07-19 15:38:49', '2017-07-19 15:38:49', null);
INSERT INTO `wc_users` VALUES ('433', 'oruQl1RE0yUsa-XJpAW2r90BKkoM', null, null, null, '', null, '思权', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6aCLMQJV3LwkKmY1EAiamzhLbXQWHX1ncSGZTmicPKgEnQ/0', null, null, null, '1', null, '1', 'oruQl1RE0yUsa-XJpAW2r90BKkoM', '2017-07-19 15:40:33', '2017-07-19 15:40:33', null);
INSERT INTO `wc_users` VALUES ('434', 'oruQl1ethlosBFBf02NIRGexZ1so', 'liaomf@ydbaidu.net', '18218820419', '0752-5708341', '', null, 'Liao，Miao', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEKEwMIf8c9vesaicJibiby137vnerrqkvVeerQRf45Ay7a7g/0', null, '惠州市惠城区演达一路华阳大厦24层', null, '1', null, '1', 'oruQl1ethlosBFBf02NIRGexZ1so', '2017-07-19 15:41:26', '2017-07-19 15:45:49', null);
INSERT INTO `wc_users` VALUES ('435', 'oruQl1cLiRizpd7zql1HWDg5OPuw', null, null, null, '', null, '张逸飞', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEJiawmbt667NnXlOdtIcltRCZJEQeHytudzZ2WeXpMKlFg/0', null, null, null, '1', null, '1', 'oruQl1cLiRizpd7zql1HWDg5OPuw', '2017-07-19 15:41:29', '2017-07-19 15:41:29', null);
INSERT INTO `wc_users` VALUES ('436', 'oruQl1b0INFBzIEK_8bwV4k-di6Q', null, null, null, '', null, '良', 'http://wx.qlogo.cn/mmhead/dGX2SKLzeyhQ5Q6rzlbwNJu5JzOkGLk3ILTZbesXHGw/0', null, null, null, '1', null, '1', 'oruQl1b0INFBzIEK_8bwV4k-di6Q', '2017-07-19 15:43:46', '2017-07-19 15:43:46', null);
INSERT INTO `wc_users` VALUES ('437', 'oruQl1fhOpC9nR1ibyp45TrZnjIk', null, null, null, '', null, ' Stanvy', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEJ1oWHKhhvCKu7uTO5JYFdabDGph9CibKPWc9pcPAYUlpQ/0', null, null, null, '2', null, '1', 'oruQl1fhOpC9nR1ibyp45TrZnjIk', '2017-07-19 15:44:37', '2017-07-19 15:44:37', null);
INSERT INTO `wc_users` VALUES ('438', 'oruQl1dCYqAQXP-OstjHqj5TQ3Pg', null, null, null, '', null, 'YX', 'http://wx.qlogo.cn/mmhead/SYeWkon6C6Kt881V8z2sL6fbLr404aPXYiajSiaEMcCGHZ0UMQsw7RZA/0', null, null, null, '1', null, '1', 'oruQl1dCYqAQXP-OstjHqj5TQ3Pg', '2017-07-19 15:53:20', '2017-07-19 15:53:20', null);
INSERT INTO `wc_users` VALUES ('439', 'oruQl1UvR4ff8dbmLJcCkRnAP2Dw', 'zhongzhenming@ydbaidu.net', '13592739787', null, '', null, '钟振鸣', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEILTStzDTnq4FXl6Bnhvy8VztPWuiaVBDJSWruAsgL5SlA/0', null, '惠州市惠城区演达大道华阳大厦24楼', null, '1', '天道酬勤', '1', 'oruQl1UvR4ff8dbmLJcCkRnAP2Dw', '2017-07-19 15:54:52', '2017-07-19 15:59:34', null);
INSERT INTO `wc_users` VALUES ('440', 'oruQl1W_dk-p4wtwfBCz3aLBTEPM', '1609221094@qq.com', '13727603136', null, '', null, '百度', 'http://wx.qlogo.cn/mmhead/ylRhrSjQb8j1gNA3ZWYiaXKnFAtw3UnLM5ibXLWA31iaOibCwOrL2O0XOQ/0', null, '梅州鸿达路鸿兴创意园7楼', null, '1', null, '1', 'oruQl1W_dk-p4wtwfBCz3aLBTEPM', '2017-07-19 15:58:19', '2017-07-19 15:59:51', null);
INSERT INTO `wc_users` VALUES ('441', 'oruQl1W9s4PdKMFgEWCVFXCZdNsQ', 'lichzh@ydbaidu.net', '18475055277', '0753-8589091', '', 'VVMtWFKNqN2YBE6PFNNGsfhgndD9VQbwj6elguqnfpaZ7qPBEfecXbLxRLdI', '黎崇智', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEKGAnrQ3MBwLpNPJAuguMKenaUllO2LPkwj4Drc0ibiaIQQ/0', null, '梅州市梅江区彬芳大道鸿兴大厦B栋7楼', null, '1', '梅州百度糯米事业部。', '1', 'oruQl1W9s4PdKMFgEWCVFXCZdNsQ', '2017-07-19 16:03:07', '2017-07-19 16:10:13', null);
INSERT INTO `wc_users` VALUES ('442', 'oruQl1XLaW7VCwing3VG7tav5xA4', null, null, null, '', null, '机智可爱的天才美少女', 'http://wx.qlogo.cn/mmhead/qbvaL9taELvWH3XTWZrjPCSDm8gzMH8bb2ZXibmMYibQWeHldVyuAcbA/0', null, null, null, '2', null, '1', 'oruQl1XLaW7VCwing3VG7tav5xA4', '2017-07-19 16:03:24', '2017-07-19 16:03:24', null);
INSERT INTO `wc_users` VALUES ('443', 'oruQl1ckRm2iA6yAMQRvGWkhYw5Y', 'qiurj@ydbaidu.net', '15992371629', null, '', null, '邱润佳', 'http://wx.qlogo.cn/mmhead/KydxAIB52xljIPl5TiaTImA2Ynib0yr4mROWe4VrfIOd7oQgvPSTN7lA/0', null, '潮州交行8楼', null, '1', null, '1', 'oruQl1ckRm2iA6yAMQRvGWkhYw5Y', '2017-07-19 16:03:32', '2017-07-19 16:07:17', null);
INSERT INTO `wc_users` VALUES ('444', 'oruQl1XpDSy3KAI4unJwn4hhPc50', 'yanzl@ydbaidu.net', '13612442700', null, '', null, '嚴多多', 'http://wx.qlogo.cn/mmhead/hgXWbMaaqmDHe57B53eQWz2udIHqwdl6QeL0mvXFWWIGfDKhR5f7Yg/0', null, '潮州交行8楼', null, '1', null, '1', 'oruQl1XpDSy3KAI4unJwn4hhPc50', '2017-07-19 16:03:48', '2017-07-19 16:07:09', null);
INSERT INTO `wc_users` VALUES ('445', 'oruQl1fp8PDvHbT4xxTNYy_YnUQs', 'linhua@ydbaidu.net', '18814383900', '0753-8589091', '', null, '林桦', 'http://wx.qlogo.cn/mmhead/CJ35Z2cnZA163HxIEvNvtiarfL2NyVudjwgk8d1EcCP7PvzI4gDKSUQ/0', null, '梅州市梅江区彬芳大道鸿兴大厦B栋7楼', null, '0', null, '1', 'oruQl1fp8PDvHbT4xxTNYy_YnUQs', '2017-07-19 16:10:34', '2017-07-19 16:12:29', null);
INSERT INTO `wc_users` VALUES ('446', 'oruQl1WD-5LCiY0uYzoURaFKn_1E', 'liangjp@ydbaidu.net', '18814383879', null, '', null, '嘉沛', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4AiaIrjGlZ7T3VEXbusQMQzI4Jol3icIicrFeroV2AKrQJQ/0', null, null, null, '1', null, '1', 'oruQl1WD-5LCiY0uYzoURaFKn_1E', '2017-07-19 16:11:36', '2017-07-19 16:14:46', null);
INSERT INTO `wc_users` VALUES ('447', 'oruQl1Tm-eNQSViYJSLX3fetkCK0', null, null, null, '', null, 'H', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEJl8dxMCsSQwgqCukKUqP1ibLNkmVSjh64wSzsNibEYtw9A/0', null, null, null, '1', null, '1', 'oruQl1Tm-eNQSViYJSLX3fetkCK0', '2017-07-19 16:12:39', '2017-07-19 16:12:39', null);
INSERT INTO `wc_users` VALUES ('448', 'oruQl1Z2SPl0bd79BH-EtzlWGhos', 'zhuxu@ydbaidu.net', '13430160225', null, '', 'q0l0Z82VWXvSSLQK4RX3ioyxjjrmoluM3mmfkeemPM5DWtcdG9mMRjoKm1pk', '朱旭', 'http://wx.qlogo.cn/mmhead/EVPtJJ9TsHwicWv47DhGbMUGSIwHNlLmibdWEsnIvQ6sFZczx3y1iceVA/0', null, null, null, '1', null, '1', 'oruQl1Z2SPl0bd79BH-EtzlWGhos', '2017-07-19 16:16:44', '2017-07-19 16:21:55', null);
INSERT INTO `wc_users` VALUES ('449', 'oruQl1YO9p7uYK_jqy_HMkQ5g7x8', null, null, null, '', 'F4TpH1zIcv5LXf6MoRo8Moyj0cDy92piqogrRykH54z3cfpfbagogsPsAds3', 'A黄志锐', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5YMyhibb1T8hEOuVctu9HKA5x7nH7OK9OlkjWrxc8csxIibMvm58d2gibzniamC9G8Ad869cQe4pBnI1M1YVOfN5E2T/0', null, null, null, '1', null, '1', 'oruQl1YO9p7uYK_jqy_HMkQ5g7x8', '2017-07-19 16:21:46', '2017-07-19 16:23:13', null);
INSERT INTO `wc_users` VALUES ('450', 'oruQl1RIycY0R9YjmtHZqyoaerwM', null, null, null, '', null, '平凡', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5N03oIux9omOicRV0MENUxiab1gHGIAeCjRmicw7Eznibxtw/0', null, null, null, '1', null, '1', 'oruQl1RIycY0R9YjmtHZqyoaerwM', '2017-07-19 16:22:51', '2017-07-19 16:22:51', null);
INSERT INTO `wc_users` VALUES ('451', 'oruQl1W9N1O8JoFQzFiePr1spYgE', null, null, null, '', null, '简单的', 'http://wx.qlogo.cn/mmhead/N4HWkmwbSVQWo3hDTCJdJgrsibC3EsXDrpCrYupbsjqtmdyKBzVa4ZA/0', null, null, null, '1', null, '1', 'oruQl1W9N1O8JoFQzFiePr1spYgE', '2017-07-19 16:28:22', '2017-07-19 16:28:22', null);
INSERT INTO `wc_users` VALUES ('452', 'oruQl1X6_H3rfHsqgqije7tj1Fm0', 'chenying@ydbaidu.net', '18813972902', null, '', null, '陈颖', 'http://wx.qlogo.cn/mmhead/icXtjp9jsR5TenbgHDyBjUDmo4XKlH5S1o0UsMJNbrVLcia8h2sKzKHw/0', null, '梅州市梅江区彬芳大道中鸿兴创意园7楼', null, '2', null, '1', 'oruQl1X6_H3rfHsqgqije7tj1Fm0', '2017-07-19 16:30:45', '2017-07-19 16:36:01', null);
INSERT INTO `wc_users` VALUES ('453', 'oruQl1UEOkA9QD5yoELpBP_w4skI', 'chensy@ydbaidu.net', '13076569442', null, '', null, '陈思茵', 'http://wx.qlogo.cn/mmhead/1LlgQzJVOyCoadNqs0ujOynppkc1kdmjydYZY5xfLop4UwLR2PpKug/0', null, null, null, '2', null, '1', 'oruQl1UEOkA9QD5yoELpBP_w4skI', '2017-07-19 17:50:48', '2017-07-19 17:52:11', null);
INSERT INTO `wc_users` VALUES ('454', 'oruQl1eRjzPOw3PHkRT3FEAypom0', 'liangyujian@ydbaidu.net', '15017570189', null, '', null, '啊健', 'uploads/user/454/img1500458620.jpg', null, null, null, '1', '努力赚钱', '1', 'oruQl1eRjzPOw3PHkRT3FEAypom0', '2017-07-19 18:01:47', '2017-07-19 18:03:40', null);
INSERT INTO `wc_users` VALUES ('455', 'oruQl1aV7it4dDiaFzybhToTRuBI', 'shell@ybaidu.net', '15989703584', null, '', null, '佘琅琅', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaELwEwn6kuPy7Xvu4wugnlErnX4y5h3hbuN8ZZj5bhcWtg/0', null, null, null, '2', null, '1', 'oruQl1aV7it4dDiaFzybhToTRuBI', '2017-07-20 09:06:11', '2017-07-20 09:08:15', null);
INSERT INTO `wc_users` VALUES ('456', 'oruQl1e-6PshtDWfteoheWqryCyI', '279592598@qq.com', '13612363249', null, '', null, '陈鹏', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEKIRYkU30T15ZQeL9RZCDR3QrfSFzJANoGBElcV7Kib17w/0', null, '广东省汕头市金平区中源大厦1302', null, '1', '陈鹏', '1', 'oruQl1e-6PshtDWfteoheWqryCyI', '2017-07-20 09:29:56', '2017-08-07 11:55:48', null);
INSERT INTO `wc_users` VALUES ('457', 'oruQl1bkEi35SEdz8ksTxUh9fOvE', 'jipengsheng@ydbaidu.net', '15914760427', null, '', null, '纪鹏升', 'http://wx.qlogo.cn/mmhead/X6Ucic5kYIBMxDbdD5hrX4HLrpxclvOm2DkpagMAaJbAsa39Z8XVdOg/0', null, null, null, '1', null, '1', 'oruQl1bkEi35SEdz8ksTxUh9fOvE', '2017-07-20 09:39:47', '2017-07-20 09:42:24', null);
INSERT INTO `wc_users` VALUES ('458', 'oruQl1X24qRsQEdpyJ3Y3cDvPKE0', 'guoxiaoxue@ydbaidu.com', '13411934332', null, '', null, '小雷', 'http://wx.qlogo.cn/mmhead/ylRhrSjQb8ho4k0kROnKz556c2KVMM44dkSb9IzakvrXW3MHnYAaTg/0', null, null, null, '2', null, '1', 'oruQl1X24qRsQEdpyJ3Y3cDvPKE0', '2017-07-20 09:46:25', '2017-08-07 11:59:45', null);
INSERT INTO `wc_users` VALUES ('459', 'oruQl1S7S9DZ-KfY_K-p_glWNzOU', 'xuyiwen@ydbaidu.net', '13433884699', null, '', null, '许怡雯', 'uploads/user/459/img1502077346.jpg', null, '广东省汕头市金平区中源大厦1302', null, '2', '言而有信，勿忘初心。', '1', 'oruQl1S7S9DZ-KfY_K-p_glWNzOU', '2017-07-20 09:59:06', '2017-08-07 11:47:16', null);
INSERT INTO `wc_users` VALUES ('460', 'oruQl1Z2Gh9XdxlZR5DN1JqdmX24', null, null, null, '', null, '爱鞋者联盟', 'http://wx.qlogo.cn/mmopen/rIQuAY6WvloQ1XX9anfdW1FeKscEolj78Fx0sYIsBJBDOXYq9cia5pqu6GAMylicktVbbM07woo852pdNRA7SXyVJO45yNo7Xd/0', null, null, null, '1', null, '1', 'oruQl1Z2Gh9XdxlZR5DN1JqdmX24', '2017-07-20 10:36:45', '2017-07-20 10:36:45', null);
INSERT INTO `wc_users` VALUES ('461', 'oruQl1aUhi75LX5uNJ4aOi24IqNI', '1113140678@qq.com', '13286416205', null, '', null, '郑妮子', 'uploads/user/461/img1502966705.jpg', 'uploads/user/461/img1502966845.jpg', '长平路91号中源大厦13楼百度糯米', null, '2', '走自己路让别人说去', '1', 'oruQl1aUhi75LX5uNJ4aOi24IqNI', '2017-07-20 10:44:00', '2017-07-20 11:03:08', null);
INSERT INTO `wc_users` VALUES ('462', 'oruQl1XbUbAaK-op9aabKk6IZo2Y', 'hongshunchao@yd.baidu.net', '13112562212', null, '', null, '百度糯米洪顺潮13112562212', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w7icXOgibo1ic5A1UEcMxKV9Lcw99NicHO546WBKyBhSSdcYhVuy1wkNHsTILqjyqiaaYDBxE84vWUQFc6ySZw4WCQdj/0', null, '广东省汕头市金平区长平路中源大厦1302', null, '1', '做命运的王者！', '1', 'oruQl1XbUbAaK-op9aabKk6IZo2Y', '2017-07-20 10:49:23', '2017-07-20 10:53:33', null);
INSERT INTO `wc_users` VALUES ('463', 'oruQl1RGKv4i5RhvanjzJKEGpMxM', 'chenxiumei@xm12t.com', '15080284209', null, '', null, '陈秀梅@百度', 'http://wx.qlogo.cn/mmhead/1LlgQzJVOyCwuEDPclP7IJnd9qSiajjkd7NAEazdLDTaEgvrvFbicQow/0', null, '龙岩新罗区商务中心商会大厦c栋508', null, '2', '知足常乐', '1', 'oruQl1RGKv4i5RhvanjzJKEGpMxM', '2017-07-20 11:19:14', '2017-07-20 11:31:18', null);
INSERT INTO `wc_users` VALUES ('464', 'oruQl1U8ByM94sAc7m7TVyLqZdsA', 'chenlihong@xm12t.com', '13599320016', null, '', null, '陈丽红', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5lajvN5W4ZO9kucWqCKnmrOgQo8pNic2rLvHxUVuglSTg/0', null, '福建省龙岩市商会大厦C幢508', null, '0', '爱工作，爱生活', '1', 'oruQl1U8ByM94sAc7m7TVyLqZdsA', '2017-07-20 11:20:13', '2017-07-20 11:25:47', null);
INSERT INTO `wc_users` VALUES ('465', 'oruQl1fpVUXBqnte74Tx88fC-4Ck', null, null, null, '', null, '郑金祥', 'http://wx.qlogo.cn/mmhead/QYQTCBwgqg7X7ghCfH16ic33dicsLKBpwBwmbKRiavC0Ks/0', null, null, null, '1', null, '1', 'oruQl1fpVUXBqnte74Tx88fC-4Ck', '2017-07-20 11:21:58', '2017-07-20 11:21:58', null);
INSERT INTO `wc_users` VALUES ('466', 'oruQl1YRgq7PIeZvkoZHoLVSQ4GQ', '624816624@qq.com', '15960897183', null, '', null, '林秀余', 'uploads/user/466/img1500530247.jpg', null, '龙岩市商务板块', null, '2', null, '1', 'oruQl1YRgq7PIeZvkoZHoLVSQ4GQ', '2017-07-20 11:40:19', '2017-07-24 17:33:54', null);
INSERT INTO `wc_users` VALUES ('467', 'oruQl1Y1q4K9aNASB3Y3sylVTUmI', null, null, null, '', null, '拉西', 'http://wx.qlogo.cn/mmhead/jJtbwFuzNwCkib1ItS23nbxkjY41IS4NbNtM2dV45xcNX3d5cGSxMLQ/0', null, null, null, '2', null, '1', 'oruQl1Y1q4K9aNASB3Y3sylVTUmI', '2017-07-20 11:44:32', '2017-07-20 11:44:32', null);
INSERT INTO `wc_users` VALUES ('468', 'oruQl1eLN_NVTG3Y2iWr4GGhdkK0', null, null, null, '', null, 'Mi  * Q', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEL9YbxPhLeiaM2rrpCnB8nobL7QDpiczNchBqy85hpibcVcQ/0', null, null, null, '2', null, '1', 'oruQl1eLN_NVTG3Y2iWr4GGhdkK0', '2017-07-20 11:45:57', '2017-07-20 11:45:57', null);
INSERT INTO `wc_users` VALUES ('469', 'oruQl1atXt_1A5JhKjh8MBYRjy0c', null, null, null, '', null, 'lcccxxx', 'http://wx.qlogo.cn/mmhead/JslgEic57sa2WMZCK6kic9Yic8PU8Libgb6rqbMvEP9lEicI/0', null, null, null, '2', null, '1', 'oruQl1atXt_1A5JhKjh8MBYRjy0c', '2017-07-20 11:47:04', '2017-07-20 11:47:04', null);
INSERT INTO `wc_users` VALUES ('470', 'oruQl1cZVmpHEXpcyN9wU3KbQT4o', null, null, null, '', null, '陈鹏坤', 'http://wx.qlogo.cn/mmhead/BROQjVicEVyRc2MBfxd9sIbjhWYliclqF0GSjmzHSTlSo/0', null, null, null, '1', null, '1', 'oruQl1cZVmpHEXpcyN9wU3KbQT4o', '2017-07-20 11:47:27', '2017-07-20 11:47:27', null);
INSERT INTO `wc_users` VALUES ('471', 'oruQl1X6TZPe888B5xYrF-LB-VYM', null, null, null, '', null, '冰雪瑶', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4Ct0klCTnKCjXffpnZFSEkgJsf3rib5IibZSHbicCukRyZA/0', null, null, null, '2', null, '1', 'oruQl1X6TZPe888B5xYrF-LB-VYM', '2017-07-20 11:47:51', '2017-07-20 11:47:51', null);
INSERT INTO `wc_users` VALUES ('472', 'oruQl1do-pLRo1llZuQbfCUhw7lk', '993058000@qq.com', '18650838300', null, '', null, '刘晓倩', 'http://wx.qlogo.cn/mmhead/mONcle9pic3zAujF672691dYJSopNfpXE5piadUXCfEia7J0GZhOCcnEA/0', null, '龙岩商会大厦C座508', null, '2', '网站建设/E推/G名片/企业邮箱/百度推广/信息流/直通车', '1', 'oruQl1do-pLRo1llZuQbfCUhw7lk', '2017-07-20 11:47:52', '2017-07-21 09:17:22', null);
INSERT INTO `wc_users` VALUES ('473', 'oruQl1bj6D0RfeNGTNoLhb_Myxuk', null, null, null, '', null, '波哎百度@张斌', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5sicUiboPWu1lLStGgH0iakyCPPdvMxdQvSOwKfNibFbXhYw/0', null, null, null, '1', null, '1', 'oruQl1bj6D0RfeNGTNoLhb_Myxuk', '2017-07-20 11:47:59', '2017-07-20 11:47:59', null);
INSERT INTO `wc_users` VALUES ('474', 'oruQl1QT3ZT6SOrOzno8Xxnde33o', null, null, null, '', null, 'zz', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4oSbFowWGPF5f2jDteOTyMHfS8rIOZDaUNmbIFWicJblw/0', null, null, null, '2', null, '1', 'oruQl1QT3ZT6SOrOzno8Xxnde33o', '2017-07-20 11:47:59', '2017-07-20 11:47:59', null);
INSERT INTO `wc_users` VALUES ('475', 'oruQl1ZlkB8OZ2wI_C8tNvoesx_I', null, null, null, '', null, 'u', 'http://wx.qlogo.cn/mmhead/4QtDCkraacPKjp9ILjBt007fEcCCjqKib3oVMAXasFga9WmichJHGcdA/0', null, null, null, '2', null, '1', 'oruQl1ZlkB8OZ2wI_C8tNvoesx_I', '2017-07-20 11:48:25', '2017-07-20 11:48:25', null);
INSERT INTO `wc_users` VALUES ('476', 'oruQl1SZu4yK660y03mrG1po-1zE', null, null, null, '', null, 'A百度推广  苏尔善', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM49SQntQxOPQZ8QDdVnepVVrCqEHBSicqXd6hBtkXwaVAA/0', null, null, null, '1', null, '1', 'oruQl1SZu4yK660y03mrG1po-1zE', '2017-07-20 11:49:34', '2017-07-20 11:49:34', null);
INSERT INTO `wc_users` VALUES ('477', 'oruQl1VuZxWnEB648SAqVM3O6T7Y', 'zhongmhj@xm12t.com', '15260366709', null, '', null, '钟马海金', 'uploads/user/477/img1500599959.jpg', null, '泉州市丰泽区少林路仁风工业区亚特大厦4楼', null, '1', '面朝大海，春暖花开', '1', 'oruQl1VuZxWnEB648SAqVM3O6T7Y', '2017-07-20 12:00:53', '2017-07-21 09:18:14', null);
INSERT INTO `wc_users` VALUES ('478', 'oruQl1TNT7AwtT6RUbfsgmElgCB4', null, null, null, '', null, '卢健', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4oVvQlaG8O14bnoEmcZ1Tm28hYxavkFGUHZKNt6SUZeQ/0', null, null, null, '1', null, '1', 'oruQl1TNT7AwtT6RUbfsgmElgCB4', '2017-07-20 12:08:45', '2017-07-20 12:08:45', null);
INSERT INTO `wc_users` VALUES ('479', 'oruQl1RMRP6zVK8Io7SPcLtnbAgA', 'dingcm@ydbaidu.net', '13690014865', null, '', null, '丁草嫚', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w7icXOgibo1ic5A1Q0TDATanIEXPyW4BmXdMl7sScdkbobicy9iaAnliaEXW0ZoAzq4Qxb2oK73jLJLhzXdicAGNTKJqC2/0', null, '潮州市湘桥区潮州大道交银大厦8楼', null, '2', '百度合作，请联系我', '1', 'oruQl1RMRP6zVK8Io7SPcLtnbAgA', '2017-07-20 14:13:05', '2017-07-20 14:15:28', null);
INSERT INTO `wc_users` VALUES ('480', 'oruQl1SkmnxOELMgv81tI_GbrIvE', 'linxt@ydbaidu.net', '13415063260', null, '', null, '林晓庭', 'http://wx.qlogo.cn/mmhead/ajNVdqHZLLDicwSPtnkplQ96wlklUDicI4Nib1ovm53WTOeicxNe5FWdEw/0', null, '汕头市跃进路利鸿基大厦写字楼b座20楼全层', null, '1', '百度推广开户，百度信息流，网站建设。', '1', 'oruQl1SkmnxOELMgv81tI_GbrIvE', '2017-07-20 14:21:10', '2017-07-20 14:29:19', null);
INSERT INTO `wc_users` VALUES ('481', 'oruQl1ZywQMFD6kpMOAUKRcRdVRA', '372138242@qq.com', '13005334303', null, '', null, '百度赵锦发', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaELrVV65qE7CO5dMWZ7zh9s6omJTMKIqFjCTJBOA8taSqw/0', null, null, null, '1', null, '1', 'oruQl1ZywQMFD6kpMOAUKRcRdVRA', '2017-07-20 14:21:37', '2017-07-20 14:25:40', null);
INSERT INTO `wc_users` VALUES ('482', 'oruQl1R1fs0UDsv56XFQlnt2Zzgs', 'wangxiaoxian@ydbaidu.net', '18688009232', null, '', null, '静待初夏', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEJdOkwg7JEXsxiclskdibHuGqYXEu1VOwK97ibC9T13klHbg/0', null, '汕头市金平区跃进路利鸿基B座20层', null, '2', '百度推广、网站建设、让有需求的客户主动找你，找我就是了！', '1', 'oruQl1R1fs0UDsv56XFQlnt2Zzgs', '2017-07-20 14:22:20', '2017-07-20 14:26:46', null);
INSERT INTO `wc_users` VALUES ('483', 'oruQl1dsfzYYHOAqoiFv9wDP4jFc', '739125538@qq.com', '15767068798', null, '', null, '肖思思', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaELZ7YBxbyt1gqrqZ3wrayeYMxo9n7lncQwqicPhtZyn1Nw/0', null, null, null, '2', null, '1', 'oruQl1dsfzYYHOAqoiFv9wDP4jFc', '2017-07-20 14:27:33', '2017-08-09 09:41:02', null);
INSERT INTO `wc_users` VALUES ('484', 'oruQl1SdnxHJCqkNvZrUFgbrmkB8', null, null, null, '', null, '粽zuki^^  지 용xi~', 'http://wx.qlogo.cn/mmhead/iamHgph1rufMtR7If9ZQtSUiaX5qeWyYYJO43EeyncTuM/0', null, null, null, '2', null, '1', 'oruQl1SdnxHJCqkNvZrUFgbrmkB8', '2017-07-20 14:38:27', '2017-07-20 14:38:27', null);
INSERT INTO `wc_users` VALUES ('485', 'oruQl1W2VmW1pCSeWuq4SoAxxky8', null, null, null, '', null, '蔡海涛', 'http://wx.qlogo.cn/mmhead/dxKEsjQBP4TrNLFMMVYkklQPicvrMExarQwBicRhkticrQg9njhuuNKIA/0', null, null, null, '1', null, '1', 'oruQl1W2VmW1pCSeWuq4SoAxxky8', '2017-07-20 14:52:12', '2017-07-20 14:52:12', null);
INSERT INTO `wc_users` VALUES ('486', 'oruQl1TE-eipPvKsQpfFJMoXTyDo', null, null, null, '', null, '力智®', 'http://wx.qlogo.cn/mmhead/dWYcndbpDnbwz9QAoibvicxvrhO8gq43nicV2U6uMeMbXDdl5zadmkOSQ/0', null, null, null, '1', null, '1', 'oruQl1TE-eipPvKsQpfFJMoXTyDo', '2017-07-20 14:52:39', '2017-07-20 14:52:39', null);
INSERT INTO `wc_users` VALUES ('487', 'oruQl1bNWvqWOa7S9V2ebjsO-vPI', 'wangxinbiao@xm12t.com', '15160310695', null, '', null, '王鑫标', 'uploads/user/487/img1501135759.jpg', null, '泉州丰泽区少林路仁风工业区亚特4楼', null, '1', '网站建设 百度推广  ', '1', 'oruQl1bNWvqWOa7S9V2ebjsO-vPI', '2017-07-20 15:41:40', '2017-07-27 14:12:18', null);
INSERT INTO `wc_users` VALUES ('488', 'oruQl1UvgG0P1wszqTvIuQfiN0w8', null, null, null, '', null, 'fpw', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7zcssGLcEF8sCQEShjsq6k5GCxoX2zqibR1tsDKahUfeA/0', null, null, null, '0', null, '1', 'oruQl1UvgG0P1wszqTvIuQfiN0w8', '2017-07-20 15:50:30', '2017-07-20 15:50:30', null);
INSERT INTO `wc_users` VALUES ('489', 'oruQl1blmDry0Lk1hUJg_MhaUTjU', null, null, null, '', null, '幼茶', 'http://wx.qlogo.cn/mmhead/5cJ329xUeTy1syBRdTict0rboMOBnakRAiaSickFCibiaeScvJiaE49wJVjA/0', null, null, null, '2', null, '1', 'oruQl1blmDry0Lk1hUJg_MhaUTjU', '2017-07-20 15:51:16', '2017-07-20 15:51:16', null);
INSERT INTO `wc_users` VALUES ('490', 'oruQl1YEnYI8PFa2S6Y-i3D5nvNM', null, null, null, '', null, 'x.y', 'http://wx.qlogo.cn/mmhead/c37Z1eq4r9uvo2oxYficmsqKArtJRREDqt9eL3V8g4UU/0', null, null, null, '2', null, '1', 'oruQl1YEnYI8PFa2S6Y-i3D5nvNM', '2017-07-20 15:51:19', '2017-07-20 15:51:19', null);
INSERT INTO `wc_users` VALUES ('491', 'oruQl1fzQuxKFA0g9V27UsQrgs8E', 'huangyz@12t.cn', '13850084630', null, '', null, '财务黄燕真', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7MiaFrxjjnr5VSyYia1PNicHvGBXrxFVNEvoFhyeLicc0DMg/0', null, null, null, '2', null, '1', 'oruQl1fzQuxKFA0g9V27UsQrgs8E', '2017-07-20 15:51:25', '2017-07-20 15:53:05', null);
INSERT INTO `wc_users` VALUES ('492', 'oruQl1W6kCd6fTTvWyR9RVOF2Et8', null, null, null, '', null, 'chichi co', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarcxGB4mvpONsjOJUTgHSsgK50HiaGX6kJib74KQ5XIa3COQNbskEe1gE6avo3jJGF16hwq4Gl1weumia/0', null, null, null, '2', null, '1', 'oruQl1W6kCd6fTTvWyR9RVOF2Et8', '2017-07-20 15:51:37', '2017-07-20 15:51:37', null);
INSERT INTO `wc_users` VALUES ('493', 'oruQl1RACAoynGwdLSeHOgfwr7io', null, null, null, '', null, 'Sue', 'http://wx.qlogo.cn/mmhead/v6XbW38nFOTF1oaCGeE17FhbAJjODye8saGMoXtGYQ2zBAch3aibTicw/0', null, null, null, '0', null, '1', 'oruQl1RACAoynGwdLSeHOgfwr7io', '2017-07-20 15:53:48', '2017-07-20 15:53:48', null);
INSERT INTO `wc_users` VALUES ('494', 'oruQl1bxLl9YKVEO0a5mFqxemcsg', null, null, null, '', null, '???? ???? ????', 'http://wx.qlogo.cn/mmhead/j8JSzC6ialBYwCicTwzbn0ZI2Qibonn9mqpbMU6oibyAsfzsHftIfNHeicg/0', null, null, null, '2', null, '1', 'oruQl1bxLl9YKVEO0a5mFqxemcsg', '2017-07-20 16:52:23', '2017-07-20 16:52:23', null);
INSERT INTO `wc_users` VALUES ('495', 'oruQl1ckDMTZYiWBiwY4Xu8n0fYs', 'huanglk@ydbaidu.net', '15913990079', null, '', null, '黄烙坤', 'http://wx.qlogo.cn/mmhead/78EkX665csBvlp3yh0YhMuAOdePNKxNrOKib23BDrK8TOpbdt2TicemA/0', null, '汕头市跃进路利鸿基大厦B座20楼', null, '1', '主营百度搜索推广，百度信息流，企业个人网站构建，百度直通车', '1', 'oruQl1ckDMTZYiWBiwY4Xu8n0fYs', '2017-07-21 07:55:35', '2017-07-21 09:53:14', null);
INSERT INTO `wc_users` VALUES ('496', 'oruQl1d-vMYUSDPL0AL5JNPoYqsg', null, null, null, '', null, 'May', 'http://wx.qlogo.cn/mmhead/qGusKyb0IEdDmiaDysZRhM3cu5xaQZVebFGHTDI8Jt2Lw2o7lLQnia8g/0', null, null, null, '2', null, '1', 'oruQl1d-vMYUSDPL0AL5JNPoYqsg', '2017-07-21 09:10:13', '2017-07-21 09:10:13', null);
INSERT INTO `wc_users` VALUES ('497', 'oruQl1Yq6LbO3N18rEVA5mu0D-g8', 'shangguanshangjiao@xm12t.com', '17750415143', null, '', null, '百度（泉州）营销服务中心 ～ 上官上蕉（大客户经理）', 'uploads/user/497/img1500600530.jpg', null, '泉州市丰泽区少林路亚特写字楼4楼', null, '1', '主营产品：百度推广、网盟推广、百度信息流广告、品牌推广、百科微站、企业网站建设、微官网、官网认证。', '1', 'oruQl1Yq6LbO3N18rEVA5mu0D-g8', '2017-07-21 09:14:39', '2017-07-25 10:46:39', null);
INSERT INTO `wc_users` VALUES ('498', 'oruQl1Q1XxnkoDZ3HbcunyQJJ2aE', null, null, null, '', null, '奋斗不息-百度陈文枝', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM61bYSviaiaLTMRGKaNa5jcuqs55FCEAro9938dD7sRxwRQ/0', null, null, null, '1', null, '1', 'oruQl1Q1XxnkoDZ3HbcunyQJJ2aE', '2017-07-21 09:16:12', '2017-07-21 09:16:12', null);
INSERT INTO `wc_users` VALUES ('499', 'oruQl1Q4PGfgOW8TT5YaAj3lhWdM', null, null, null, '', null, '百度闽南地区Mr.Huang', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6R8P4XF5IRRuHU4Gx2v9JmHnKoVG3EpBms7Dlf3UxT5Q/0', null, null, null, '1', null, '1', 'oruQl1Q4PGfgOW8TT5YaAj3lhWdM', '2017-07-21 09:16:26', '2017-07-21 09:16:26', null);
INSERT INTO `wc_users` VALUES ('500', 'oruQl1a7lGzKDnDdXO_C3sufC5GU', '584018684@qq.com', '17750088832', null, '', null, '游馨婷', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q8WWAeXxIDqiamUrzichVI1fFNIuJkDIHyfreasUCXib6t7BKfp98VgNn9gXCNF7s6gm90Prw5jREtI/0', null, null, null, '2', null, '1', 'oruQl1a7lGzKDnDdXO_C3sufC5GU', '2017-07-21 09:16:27', '2017-07-21 09:17:42', null);
INSERT INTO `wc_users` VALUES ('501', 'oruQl1U3XGm_HLemAsEKZ2AvsGhA', 'foxkiller@163.com', '17689353868', null, '', null, '超级大叶子', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6SNSQ78iayWlEQcwQkiavP3R8mkkl6cEGiaIHy9ksTzzjiaQ/0', null, null, null, '1', null, '1', 'oruQl1U3XGm_HLemAsEKZ2AvsGhA', '2017-07-21 09:16:41', '2017-07-21 09:21:12', null);
INSERT INTO `wc_users` VALUES ('502', 'oruQl1U1P-eWPz3_KUj5RYY0Qiew', '87924871@qq.com', '13636999093', null, '', null, '曾端谊₁₃₆₃₆ ₉₉₉ ₀₉₃', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM47tFGjnHzx6ic4cYTLvjhxsJaUKZxcwtlnyibic8EXXiaHpQ/0', null, null, null, '2', null, '1', 'oruQl1U1P-eWPz3_KUj5RYY0Qiew', '2017-07-21 09:16:42', '2017-07-21 14:02:03', null);
INSERT INTO `wc_users` VALUES ('503', 'oruQl1d55j3ixo5y9cQm1XzkBhYA', null, null, null, '', null, 'biubiubiu', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5ZwNIqf5zV38twyA5y1g7OWLoeJ5QvMZmMWW8t4xxfYQeeWHLrngelibrgAl6dW5WM4kpYPlmlFAIY/0', null, null, null, '1', null, '1', 'oruQl1d55j3ixo5y9cQm1XzkBhYA', '2017-07-21 09:16:43', '2017-07-21 09:16:43', null);
INSERT INTO `wc_users` VALUES ('504', 'oruQl1esAElIkk3X2Q9ibatPRc5k', '282865364@qq.com', '15659891469', null, '', null, '泉州百度小吴', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4VFiaLTINWBSol64hqwNXWIVM1d7UzRg4H3d971GKGy3A/0', null, null, null, '1', null, '1', 'oruQl1esAElIkk3X2Q9ibatPRc5k', '2017-07-21 09:16:46', '2017-07-21 09:17:54', null);
INSERT INTO `wc_users` VALUES ('505', 'oruQl1fA9o0PGK-psEiyBEzMpeHQ', 'daial@xm12t.com', '13788826814', null, '', null, 'Only Love', 'http://wx.qlogo.cn/mmhead/RGK5c7rGjq7l4kXmibQYQdVg1bf7XY1YANJDjvCEQyBI/0', null, null, null, '2', '越努力越幸运！', '1', 'oruQl1fA9o0PGK-psEiyBEzMpeHQ', '2017-07-21 09:16:47', '2017-07-21 09:25:30', null);
INSERT INTO `wc_users` VALUES ('506', 'oruQl1ac6Ld4jFrpZ6gzsPqPue4M', null, null, null, '', null, '徒惹。', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w5hhU8icdL80Q58DlObJrvSRQPMIxxLGE5ngEO57OTLeA9dHRn6rAibJza3npdR1U6Hh9UR4a9QMRvxHNvkTHrQ6O/0', null, null, null, '1', null, '1', 'oruQl1ac6Ld4jFrpZ6gzsPqPue4M', '2017-07-21 09:16:49', '2017-07-21 09:16:49', null);
INSERT INTO `wc_users` VALUES ('507', 'oruQl1UH2QAmH7_0-t-1qzNxq4XQ', 'luliangy@xm12t.com', '18065270037', null, '', null, '卢良艺', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUbWMvbp8bued5CoicebKhMd675t5mTZic40ShhfBpVtziaIxwvMc4YYM2QaaLW8RqL4HnrUf7jy0XibE7Gpqibn5uswW/0', null, '福建省泉州市丰泽区少林山庄', null, '1', '一切都浮云', '1', 'oruQl1UH2QAmH7_0-t-1qzNxq4XQ', '2017-07-21 09:16:51', '2017-08-10 16:43:30', null);
INSERT INTO `wc_users` VALUES ('508', 'oruQl1TdUi-8d81aEQzH-8l6nflY', '415150112@qq.com', '15159504123', null, '', null, '_橘猫', 'http://wx.qlogo.cn/mmhead/Eh6sG6Aaje4mV2j4C8MpdF369RUZdKnOv3JEoAV8DibM/0', null, '福建省泉州市丰泽区少林路仁凤工业区亚特大厦4楼', null, '1', '我见青山多妩媚，料青山，见我应如是。', '1', 'oruQl1TdUi-8d81aEQzH-8l6nflY', '2017-07-21 09:16:52', '2017-07-21 09:24:23', null);
INSERT INTO `wc_users` VALUES ('509', 'oruQl1UHwLUIFrkpMxCaaH3OLuBA', null, null, null, '', null, '晓平', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4BoiaHEBYDkslX4CqFcUVntJaXHwgcs66tDPfKCIWsU1A/0', null, null, null, '2', null, '1', 'oruQl1UHwLUIFrkpMxCaaH3OLuBA', '2017-07-21 09:16:53', '2017-07-21 09:16:53', null);
INSERT INTO `wc_users` VALUES ('510', 'oruQl1Wz1Uj-1jvi2LRxy2EKJccc', '1976689881@qq.com', '18065370136', null, '', null, '徐武童', 'uploads/user/510/img1500601429.jpg', null, '泉州市少林路仁凤工业区亚特大厦4楼', null, '1', '百度搜索推广、网站建设、网盟推广、百度糯米', '1', 'oruQl1Wz1Uj-1jvi2LRxy2EKJccc', '2017-07-21 09:16:56', '2017-07-21 09:46:35', null);
INSERT INTO `wc_users` VALUES ('511', 'oruQl1RGOO8AlsrddK1Su9Rk_1EE', 'zhongxiaohong@xm12t.com', '13107866802', null, '', null, '百度推广  钟晓虹', 'http://wx.qlogo.cn/mmhead/qGusKyb0IEfgH8GWQotn41N6HcldkMEWQ5ER2FRicMSuPP2lfch01ng/0', null, '泉州丰泽区少林路仁凤工业区亚特写字楼四楼', null, '2', null, '1', 'oruQl1RGOO8AlsrddK1Su9Rk_1EE', '2017-07-21 09:16:58', '2017-07-21 09:25:04', null);
INSERT INTO `wc_users` VALUES ('512', 'oruQl1Z9jLLxqfbwbS9Q-oDfQp0U', null, null, null, '', null, 'Baidu-剑斌', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4Gt6UTs0xlWtzialjaqX07bx5U8UDtYAxE0ZOiabdjiaCIA/0', null, null, null, '1', null, '1', 'oruQl1Z9jLLxqfbwbS9Q-oDfQp0U', '2017-07-21 09:17:02', '2017-07-21 09:17:02', null);
INSERT INTO `wc_users` VALUES ('513', 'oruQl1bvYV9A-W31f3dd5A7m7PnI', '373837530@qq.com', '18859294301', null, '', null, '百度陈嘉', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7hlrhs8NZDhiahx7iaj9MZjQUNicJiaXgyvVkvlicOsEheN6g/0', null, '泉州市仁凤工业区亚特写字楼4楼', null, '2', null, '1', 'oruQl1bvYV9A-W31f3dd5A7m7PnI', '2017-07-21 09:17:09', '2017-07-21 09:26:36', null);
INSERT INTO `wc_users` VALUES ('514', 'oruQl1ewdJvjyJungFT7xFqoy0pM', '373936732@qq.com', '15059768076', null, '', null, '许剑锋', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7vFTtwZ4FHiantsXez6cFHWYL9CHslvV21HrVufW5m4vA/0', null, '福建省泉州市少林路仁风工业区亚特写字楼4楼', null, '1', '追梦赤子心', '1', 'oruQl1ewdJvjyJungFT7xFqoy0pM', '2017-07-21 09:17:14', '2017-07-21 13:56:10', null);
INSERT INTO `wc_users` VALUES ('515', 'oruQl1cO_HtkXUVgL0y4IC-EudbA', '437144302@qq.com', '18960312200', null, '', null, '黄志宏', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELDvMdSxcAxIUMwcfrVedAgXLnSFdScXBSWQbrdcN5exlicIFzGhIETzoacnvib8AfpgjQIcwzJ8q2A/0', null, '泉州丰泽区', null, '1', '123', '1', 'oruQl1cO_HtkXUVgL0y4IC-EudbA', '2017-07-21 09:17:17', '2017-07-26 17:37:08', null);
INSERT INTO `wc_users` VALUES ('516', 'oruQl1edxVPG_dIomPmvctmGLhQM', null, null, null, '', null, '是你么', 'http://wx.qlogo.cn/mmhead/MwGwiazxWFzhIWQTibMibeqBuze5xnnCYwXjtwfJWdpIG8/0', null, null, null, '1', null, '1', 'oruQl1edxVPG_dIomPmvctmGLhQM', '2017-07-21 09:17:20', '2017-07-21 09:17:20', null);
INSERT INTO `wc_users` VALUES ('517', 'oruQl1eB346rIkHxkRUCSZE3tOhM', null, null, null, '', null, 'a小練叔叔????', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5a5MlrqdpQKVe8aMd0Ke2VZmx9v0dhG7J9V5nBzMoLHg/0', null, null, null, '1', null, '1', 'oruQl1eB346rIkHxkRUCSZE3tOhM', '2017-07-21 09:17:23', '2017-07-21 09:17:23', null);
INSERT INTO `wc_users` VALUES ('518', 'oruQl1c1ewTz42TLLt6nC8bo15BE', 'yujingwen@xm12t.com', '15905098281', null, '', null, '咸包', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6RhpZBRs3ouTRSZmDFsLWdw28rPelg2w2ibYvibuMZ3svQ/0', null, null, null, '2', null, '1', 'oruQl1c1ewTz42TLLt6nC8bo15BE', '2017-07-21 09:17:29', '2017-07-21 13:57:14', null);
INSERT INTO `wc_users` VALUES ('519', 'oruQl1fFlKKbY2HpSROHFGOetrxM', null, null, null, '', null, '泉州百度黄国清17605958021', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKfy8xpCDn4yNVjunRG46rzg96ct5tZBWJCwsgtBdLvuG2q6SJ9M9fwjX9hBSgIOSWTF0d9EibxGEkTpstNGv4m3tPSCsxUPcAk/0', null, null, null, '2', null, '1', 'oruQl1fFlKKbY2HpSROHFGOetrxM', '2017-07-21 09:17:30', '2017-07-21 09:17:30', null);
INSERT INTO `wc_users` VALUES ('520', 'oruQl1cXqNR0FfQkOZ_6o8XKMSc8', null, null, null, '', null, 'A  百度林桂英*^_^*18759595631', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5S2ibtlc0fzZk3ndB9oCagCOUdJNWZZ7EfvsDYaKVvVSIPhEkoHodRKdPBRSWx06JpgHFRwqCH4T0SiaKdzibmdDnv/0', null, null, null, '2', null, '1', 'oruQl1cXqNR0FfQkOZ_6o8XKMSc8', '2017-07-21 09:17:43', '2017-07-21 09:17:43', null);
INSERT INTO `wc_users` VALUES ('521', 'oruQl1WT4_7UjwwGC9iZu4rxofHQ', '1838726422@qq.com', '15602453960', null, '', null, '梁芬', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5TiajJXY9Wvf0qXxL2BJ456vULvCwB2riccO6gfe28hUuibz8x1xG5N3Uicmmv5DUFsP6dpZUicw5E3QYdyiaZ544RMGP/0', null, '丰泽区少林路仁凤工业区亚特大厦四楼', null, '2', null, '1', 'oruQl1WT4_7UjwwGC9iZu4rxofHQ', '2017-07-21 09:17:45', '2017-07-21 14:05:47', null);
INSERT INTO `wc_users` VALUES ('522', 'oruQl1csfwAzHvaH3IgYUogjXM7U', null, null, null, '', null, '筱敏', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4EsJuE84vVWiaicicFnNEppdbJZJyKnxSD9EWNofzAHdibXg/0', null, null, null, '2', null, '1', 'oruQl1csfwAzHvaH3IgYUogjXM7U', '2017-07-21 09:17:49', '2017-07-21 09:17:49', null);
INSERT INTO `wc_users` VALUES ('523', 'oruQl1caogdOJODURWuWs3ZFKLko', null, null, null, '', null, '百度泉州-陈斌', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUa1nUXBGRAbCHfXtXU46SDulygnfp0dS6Jyx4icrtwmbJ0W5vHibSQfvp1pL6vicN4hKUfibicS7ppR9Fg/0', null, null, null, '2', null, '1', 'oruQl1caogdOJODURWuWs3ZFKLko', '2017-07-21 09:17:56', '2017-07-21 09:17:56', null);
INSERT INTO `wc_users` VALUES ('524', 'oruQl1YH_7xbvDoa9LeHTvfeoTqQ', 'weizhl@12t.cn', '13506029213', null, '', null, '小魏', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEIeql7WysrQIJwuVzqsVJ42l3EWGg8Q44JMMhsvibKb4icg/0', null, '泉州市丰泽区少林路仁风工业区亚特大厦四楼', null, '0', null, '1', 'oruQl1YH_7xbvDoa9LeHTvfeoTqQ', '2017-07-21 09:18:00', '2017-07-21 09:21:27', null);
INSERT INTO `wc_users` VALUES ('525', 'oruQl1X3z5KqdhFeMRCB0bq1s7mk', null, null, null, '', null, '丽', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM79DckHpLlQEKsPL39vNaMeg1fXLyLtlrRKUsxAicrz7iaWunHibLh22Aa0zUE20DYJ7FHwvk2GJMLb2ZUtZkUU5cCvYdHy2X3CG8/0', null, null, null, '2', null, '1', 'oruQl1X3z5KqdhFeMRCB0bq1s7mk', '2017-07-21 09:18:06', '2017-07-21 09:18:06', null);
INSERT INTO `wc_users` VALUES ('526', 'oruQl1eFCv3qKcqUDhmPQ4SPmkYU', null, null, null, '', null, 'LANer', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM51cgz76tvgjhjprXcsth2tvHHYR1kRcRdZ0QyKJyNSlA/0', null, null, null, '2', null, '1', 'oruQl1eFCv3qKcqUDhmPQ4SPmkYU', '2017-07-21 09:18:30', '2017-07-21 09:18:30', null);
INSERT INTO `wc_users` VALUES ('527', 'oruQl1QBp4q8agLHLlsedvAiJquE', '1129870916@qq.com', '15160783565', null, '', null, '傻蛋', 'http://wx.qlogo.cn/mmhead/DibicSf4GKtr4MBDdeXLaiartLnGAiaDRickJfvvoB9Fgaj4/0', null, '泉州市丰泽区少林路仁风工业区亚特写字楼', null, '2', '开心快乐每一天', '1', 'oruQl1QBp4q8agLHLlsedvAiJquE', '2017-07-21 09:18:46', '2017-07-21 12:41:16', null);
INSERT INTO `wc_users` VALUES ('528', 'oruQl1Ua_q0W2pUpvifRtkU9ECm0', null, null, null, '', null, 'little kid', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4jXqzNET4d2wvpDR0shdJicRr4P4aXqDgLSnWibYEiciaXYw/0', null, null, null, '2', null, '1', 'oruQl1Ua_q0W2pUpvifRtkU9ECm0', '2017-07-21 09:19:05', '2017-07-21 09:19:05', null);
INSERT INTO `wc_users` VALUES ('529', 'oruQl1ftRKEvDSohN7tqjAI9fp9I', null, null, null, '', null, '燕玲儿。', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7ibWEkicTyibCAsqDUWsuXdIIzWI0KZEyLN56QWPI7rAsuA/0', null, null, null, '2', null, '1', 'oruQl1ftRKEvDSohN7tqjAI9fp9I', '2017-07-21 09:19:12', '2017-07-21 09:19:12', null);
INSERT INTO `wc_users` VALUES ('530', 'oruQl1VpsvQJzKPacs2FbJ466zEE', null, null, null, '', null, '海人', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6MnqXgAMZHJHnvEtoASZ27WRX7VxBfia6YWdyPOh63CBg/0', null, null, null, '2', null, '1', 'oruQl1VpsvQJzKPacs2FbJ466zEE', '2017-07-21 09:19:12', '2017-07-21 09:19:12', null);
INSERT INTO `wc_users` VALUES ('531', 'oruQl1ZjraCPOYETnZxOJ4rGpuBA', null, null, null, '', null, 'zhr', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5A7AuR7DganZmSn7WERNBunDHNhC2g5VCRxYpgGKCHxQ/0', null, null, null, '1', null, '1', 'oruQl1ZjraCPOYETnZxOJ4rGpuBA', '2017-07-21 09:19:22', '2017-07-21 09:19:22', null);
INSERT INTO `wc_users` VALUES ('532', 'oruQl1SSEc43STmr6AsZ-UVAJ97g', null, null, null, '', null, '黄培杉', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarc6Rtrl2TAaRthNic1NH2ibXRrSsMia1Ov2DBaDp0tMg2CBNhxKFwYpGdkKaQbF1NljkbyGmCpmOhFSN/0', null, null, null, '1', null, '1', 'oruQl1SSEc43STmr6AsZ-UVAJ97g', '2017-07-21 09:20:32', '2017-07-21 09:20:32', null);
INSERT INTO `wc_users` VALUES ('533', 'oruQl1XwOwR75gr3aVwpoSol__4Y', 'youjinlian@xm12t.com', '15160770335', null, '', null, '泉州百度尤金莲', 'http://wx.qlogo.cn/mmhead/6yEqZLzvbhUDxxrKO54iaDnsmkhJq4QurKiampTzbbrl4/0', null, '泉州市丰泽区少林路仁风工业区亚特大厦4楼', null, '2', '无个性不签名～需要百度推广，网站建设找小尤准没错～', '1', 'oruQl1XwOwR75gr3aVwpoSol__4Y', '2017-07-21 09:23:17', '2017-07-21 09:28:02', null);
INSERT INTO `wc_users` VALUES ('534', 'oruQl1T5Iab1XZexJixFgI7TNiKw', 'yangshaoping@xm12t.com', '18659809395', null, '', null, '泉州百度杨少平', 'http://wx.qlogo.cn/mmhead/VNDQtnw16icIymNdVEeO347d5xu5OibYzzYgKBz3OGLic7XGTSg4wsgew/0', null, '福建省泉州市丰泽区少林路仁凤工业区亚特写字楼四楼', null, '1', null, '1', 'oruQl1T5Iab1XZexJixFgI7TNiKw', '2017-07-21 09:24:52', '2017-07-21 11:07:07', null);
INSERT INTO `wc_users` VALUES ('535', 'oruQl1UhkvrDuglyGCtw4HzXYZCY', '1140433113@qq.com', '13599205385', null, '', null, '肖敏', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM44lFCUibWRuicNGMm1GQWmx55auFvJLdZ1gEuarfESIo6g/0', null, '泉州市少林路仁风工业区亚特大厦4楼', null, '2', '百度推广，网站建设，', '1', 'oruQl1UhkvrDuglyGCtw4HzXYZCY', '2017-07-21 09:24:54', '2017-07-21 10:03:00', null);
INSERT INTO `wc_users` VALUES ('536', 'oruQl1Wpi_9DdLNZQZysuS5qOs5U', '274707995@qq.com', '15859563792', null, '', null, '百度张榕城', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEJeNgbBNhSicpJmHicn3tzaZEsAauzudutnsn891Pt7MFUA/0', null, null, null, '1', null, '1', 'oruQl1Wpi_9DdLNZQZysuS5qOs5U', '2017-07-21 09:26:18', '2017-07-21 09:27:29', null);
INSERT INTO `wc_users` VALUES ('537', 'oruQl1YDEIuAAMWilOK4Kwx1Bdi8', '124099166@qq.com', '13959721116', null, '', null, '郑航南', 'http://wx.qlogo.cn/mmhead/OINItlkZlMYuWVwWyZFe96xKwcBFUy8fmKpn33libLLY/0', null, '福建泉州市东海大街雅园滨海酒业', null, '1', null, '1', 'oruQl1YDEIuAAMWilOK4Kwx1Bdi8', '2017-07-21 09:28:54', '2017-07-21 09:38:29', null);
INSERT INTO `wc_users` VALUES ('538', 'oruQl1WZfJsUMHv6FKxQCqMHf5o0', null, null, null, '', null, 'a吴（百度推广，网站，糯米）', 'http://wx.qlogo.cn/mmhead/8CjsMlzqh0PgxqInhUgyEYkwKBwUEg06rRVXDd7SLMU/0', null, null, null, '2', null, '1', 'oruQl1WZfJsUMHv6FKxQCqMHf5o0', '2017-07-21 09:31:45', '2017-07-21 09:31:45', null);
INSERT INTO `wc_users` VALUES ('539', 'oruQl1So7Psngbr7JMJqRbFoVrv4', 'weixiaolan@xm12t.com', '13959790917', null, '', null, '泉州百度～魏小兰', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5l0XhOdVtr3o1QicriaP01WqKgiblNgBGib7m90AWUibvzw0w/0', null, '泉州丰泽区仁风工业区亚特写字楼4楼', null, '2', null, '1', 'oruQl1So7Psngbr7JMJqRbFoVrv4', '2017-07-21 09:32:27', '2017-07-21 12:25:37', null);
INSERT INTO `wc_users` VALUES ('540', 'oruQl1U5U9JhApVnHBqNojbN1-No', '15821831759@163.com', '15821831759', null, '', null, '吴清铃', 'http://wx.qlogo.cn/mmhead/sstLNDibp2U7PnU0fcrESCEqJQzHlUCkcSYuvst9YyCaiawqnKRonmhQ/0', null, '福建省泉州市', null, '2', '即使是猪头也有存在的意义，存在即合理！', '1', 'oruQl1U5U9JhApVnHBqNojbN1-No', '2017-07-21 09:32:28', '2017-07-21 14:00:43', null);
INSERT INTO `wc_users` VALUES ('541', 'oruQl1V-2eBRmGh8XDf6rHwabMYc', '360700666@qq.com', '18030142866', null, '', null, '泉州百度运营中心商务经理－许伟军', 'http://wx.qlogo.cn/mmhead/ADjfiax8nU4zfEUHaua8ibMYmicbYPnzxXibx52e7FQETnE/0', null, null, null, '1', null, '1', 'oruQl1V-2eBRmGh8XDf6rHwabMYc', '2017-07-21 09:32:57', '2017-07-21 10:42:33', null);
INSERT INTO `wc_users` VALUES ('542', 'oruQl1R2nxyYXZhHkOHlbo53pUfQ', '1549460041@qq.com', '18876551255', null, '', null, '曹莉莉', 'http://wx.qlogo.cn/mmopen/p1XU9gF76w7hMJlZiamexL1UUnyLKoBRtrJjMLLJUUS5V1zyYnDnSaxyOq9jZcv7lv1qLyTCy2kSicfyTu57ia1uTka8iaDd1h6t/0', null, null, null, '2', null, '1', 'oruQl1R2nxyYXZhHkOHlbo53pUfQ', '2017-07-21 09:32:57', '2017-07-21 09:34:19', null);
INSERT INTO `wc_users` VALUES ('543', 'oruQl1Xfkub11pB3RT8iz7rPtcSY', 'dusihuai@xm12t.com', '18750591890', null, '', null, '杜思淮', 'http://wx.qlogo.cn/mmhead/7T31gBTJbSA3AXY6a2bh7pHPS433DfHMltBvvCnqfmE/0', null, '泉州市丰泽区少林路亚特大厦4楼', null, '1', null, '1', 'oruQl1Xfkub11pB3RT8iz7rPtcSY', '2017-07-21 09:33:37', '2017-07-21 09:46:22', null);
INSERT INTO `wc_users` VALUES ('544', 'oruQl1aL32gu8qQvtYvbr00H0nGM', 'guowj@xm12t.com', '15159875553', null, '', null, '高级商务经理-郭伟军', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5J1GsL8N70SgCicMjvw4d61ld1p5lPAQia2GAKMORyNOK0x6kguUMlcr8qNGsCbwBjt0YN52Cuiae1w/0', null, '泉州市丰泽区少林路仁风工业区亚特4楼', null, '1', '百度推广，网站建设，百度糯米，地图标注，微信第三方开发。百度系列产品都可联系', '1', 'oruQl1aL32gu8qQvtYvbr00H0nGM', '2017-07-21 09:35:50', '2017-07-21 09:40:30', null);
INSERT INTO `wc_users` VALUES ('545', 'oruQl1Qg4WNgDr6ojomXoXsfXyDk', '15911593601@163.com', '15911593601', null, '', null, '田志刚', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7IBJ2dbib6RFwx2icRYibIlClaZzJpZgGzWHSAwCqZGYxuA/0', null, null, null, '1', null, '1', 'oruQl1Qg4WNgDr6ojomXoXsfXyDk', '2017-07-21 09:36:02', '2017-07-21 13:38:39', null);
INSERT INTO `wc_users` VALUES ('546', 'oruQl1UrOXg5CFhRqXSNDTqu4g7g', null, null, null, '', null, '云卷云舒。', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIPqlHIMB4OEDE7KfzEjpf34RmicB8Qev7Mia4JQ4lhR3WPHKib6hfUEF1cYRbfZThdqKNhDCop2ZjvA/0', null, null, null, '2', null, '1', 'oruQl1UrOXg5CFhRqXSNDTqu4g7g', '2017-07-21 09:36:20', '2017-07-21 09:36:20', null);
INSERT INTO `wc_users` VALUES ('547', 'oruQl1aq1QUX1b9XpNNLQmFXeN-M', '321764231@qq.com', '13599731741', null, '', null, '泉州百度刘锦彬', 'uploads/user/547/img1500601727.jpg', null, '泉州市丰泽区少林路仁凤工业区亚特大厦4楼', null, '1', '有需要百度推广 网站建设 ，百度糯米等 咨询电话 13599731741', '1', 'oruQl1aq1QUX1b9XpNNLQmFXeN-M', '2017-07-21 09:41:56', '2017-07-21 10:03:10', null);
INSERT INTO `wc_users` VALUES ('548', 'oruQl1RSI5D4EGtDwNppIYht7bD4', '413330313@qq.com', '13959975053', null, '', null, '纪清江', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4icdhzH5HHVdUt0TJzMBbfichDSzkoA8y7AML2RvLpOIDg/0', null, '晋江青阳国贸大厦8楼806', null, '1', '百度推广，网站建设找我，我能无限可能', '1', 'oruQl1RSI5D4EGtDwNppIYht7bD4', '2017-07-21 09:48:27', '2017-07-21 09:52:18', null);
INSERT INTO `wc_users` VALUES ('549', 'oruQl1ZeB5DGL-tdM_MVirbCIGLM', null, null, null, '', null, '堕落精灵', 'http://wx.qlogo.cn/mmhead/qPicwR57YpaZytNKf9Tz3KVYicoWLOZvBGRt5CAe5Dd34/0', null, null, null, '1', null, '1', 'oruQl1ZeB5DGL-tdM_MVirbCIGLM', '2017-07-21 09:49:54', '2017-07-21 09:49:54', null);
INSERT INTO `wc_users` VALUES ('550', 'oruQl1UDHQnF5pdLvtoj2jLF3w_E', null, null, null, '', null, '先德尧福', 'http://wx.qlogo.cn/mmopen/x6DoPFQ1wlpqjA0KAB1OQ4kQ0FqAObqHNlR33UzSfT9rPlTxkjliafmMfpib8TzBH8iaUp1FicDefaa5uqibAsVkpzPnLZ5vdtdXA/0', null, null, null, '1', null, '1', 'oruQl1UDHQnF5pdLvtoj2jLF3w_E', '2017-07-21 09:53:43', '2017-07-21 09:53:43', null);
INSERT INTO `wc_users` VALUES ('551', 'oruQl1TNFoW9qZdmmFdo7bA4qPv8', null, null, null, '', null, '????嘟????嘟????。', 'http://wx.qlogo.cn/mmhead/0e8ceBZm14CQmS5HcmgYiaZWDYfajFh1Ofugd8A6WNso/0', null, null, null, '2', null, '1', 'oruQl1TNFoW9qZdmmFdo7bA4qPv8', '2017-07-21 10:07:04', '2017-07-21 10:07:04', null);
INSERT INTO `wc_users` VALUES ('552', 'oruQl1cIFh2RimZA18fQ8hqjy7uA', '369104578@qq.com', '15859576753', null, '', null, '百度郑盛王', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM752qdCtdlJ1rIwRibN9UiaZyPPdO0dtnUulAtsyr95gzFg/0', null, '晋江青阳国贸大厦806', null, '1', '百度推广  网站建设  企业宣传\r\n只要心中有梦，没什么不可能', '1', 'oruQl1cIFh2RimZA18fQ8hqjy7uA', '2017-07-21 10:16:36', '2017-07-21 15:11:25', null);
INSERT INTO `wc_users` VALUES ('553', 'oruQl1Q4QPZ0FUZTccnydFbftNfA', '827790936@qq.com', '18160995760', null, '', null, '黄金城', 'http://wx.qlogo.cn/mmhead/hiaC2Dh5LysicILfx4YrAx3sY5qvmu44AVMicbZefUJYAA/0', null, '晋江市国贸大厦8楼806', null, '1', '百度推广 网站建设 百度是您最好的选择！！', '1', 'oruQl1Q4QPZ0FUZTccnydFbftNfA', '2017-07-21 10:21:50', '2017-07-21 10:24:49', null);
INSERT INTO `wc_users` VALUES ('554', 'oruQl1TPQDGBgLRk3sUD6zf9XUxI', null, null, null, '', null, 'H J', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4udaxFobvpiclxv6J4nAWIq6bkicwDctQGVZeQQqRltXgy8kxlDFXo7l1zAa7Nv0pqedn9H1zFGwyQ/0', null, null, null, '2', null, '1', 'oruQl1TPQDGBgLRk3sUD6zf9XUxI', '2017-07-21 10:27:03', '2017-07-21 10:27:03', null);
INSERT INTO `wc_users` VALUES ('555', 'oruQl1bj_l3u-S5uJCB4zirxwpPw', '236042019@QQ.com', '15759509203', null, '', null, '网站建设，百度推广，黄种发', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4ookufXDicqy5IAjQzIUbcuVnFjwJrfz4JmXtfyBP4TaQ/0', null, '晋江市泉安中路青阳街道国贸大厦806', null, '1', '网站建设，百度推广，信息流，百度糯米团购，百度地图，E推，微信名片', '1', 'oruQl1bj_l3u-S5uJCB4zirxwpPw', '2017-07-21 10:35:56', '2017-08-05 10:12:58', null);
INSERT INTO `wc_users` VALUES ('556', 'oruQl1WzspQYO9gL2k99YoWnwhi8', null, null, null, '', null, '菲特.窗帘.软包.墙布.8D壁画', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5KJ6kLPBzqmMTWTSgskuNf4XqMC1dmQryWq3EnaIfkRA/0', null, null, null, '1', null, '1', 'oruQl1WzspQYO9gL2k99YoWnwhi8', '2017-07-21 10:46:17', '2017-07-21 10:46:17', null);
INSERT INTO `wc_users` VALUES ('557', 'oruQl1WmfIhJ3TaGyiIt5fXLvLsg', null, null, null, '', null, '19。', 'http://wx.qlogo.cn/mmhead/vtnuMBibofcZryIFztM1uVluXRyn9rhibvcu9ejgTSLLvnHaQH79VJHQ/0', null, null, null, '2', null, '1', 'oruQl1WmfIhJ3TaGyiIt5fXLvLsg', '2017-07-21 10:48:12', '2017-07-21 10:48:12', null);
INSERT INTO `wc_users` VALUES ('558', 'oruQl1QdK4slOAG3CxVAL3vZdinc', null, null, null, '', null, '阿青13450746359', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEJOomWRVArrClTLMClGsWIdr51aTZiacT9I3dkrGUQOKDQ/0', null, null, null, '2', null, '1', 'oruQl1QdK4slOAG3CxVAL3vZdinc', '2017-07-21 10:51:30', '2017-07-21 10:51:30', null);
INSERT INTO `wc_users` VALUES ('559', 'oruQl1SLKHk9-jHwKEb2L9tEiN_o', null, null, null, '', null, '叶子', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4IaToicHI7iao5PJJicK3VKibF7fNibib4zjomjLNibfwMy5zhA/0', null, null, null, '2', null, '1', 'oruQl1SLKHk9-jHwKEb2L9tEiN_o', '2017-07-21 10:54:29', '2017-07-21 10:54:29', null);
INSERT INTO `wc_users` VALUES ('560', 'oruQl1cIN6l00RtL7m6PuuNc3SIg', null, null, null, '', null, '专业机械维修', 'http://wx.qlogo.cn/mmhead/YFt7W4e5QhBBiczHDatibyfpB83elRKQanZuo9BDMyfZg/0', null, null, null, '1', null, '1', 'oruQl1cIN6l00RtL7m6PuuNc3SIg', '2017-07-21 11:23:58', '2017-07-21 11:23:58', null);
INSERT INTO `wc_users` VALUES ('561', 'oruQl1RXC6Jv9waR1sRU9jeCBO7E', null, null, null, '', null, '「@」曾先生', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5UdNAG6zT3lj7tz3F1cItsoXYr7x4mpcscjZKrHicicxOQ/0', null, null, null, '1', null, '1', 'oruQl1RXC6Jv9waR1sRU9jeCBO7E', '2017-07-21 11:45:01', '2017-07-21 11:45:01', null);
INSERT INTO `wc_users` VALUES ('562', 'oruQl1XtmchhnD1khhnOiheLGm2o', null, null, null, '', null, '????  百里杜鹃.', 'http://wx.qlogo.cn/mmhead/IxibJyF23uotuZvTw4Zvo4m7hY0iay1WPKdulIJicnXSfA/0', null, null, null, '1', null, '1', 'oruQl1XtmchhnD1khhnOiheLGm2o', '2017-07-21 11:45:11', '2017-07-21 11:45:11', null);
INSERT INTO `wc_users` VALUES ('563', 'oruQl1aQKUdWjw3LllB9qf6idAOk', null, null, null, '', null, '涵涵angel', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaELxXJibd9LtgwBHfZS5IxGQYGY7OFyQZn6pIY6qXMA9IrQ/0', null, null, null, '2', null, '1', 'oruQl1aQKUdWjw3LllB9qf6idAOk', '2017-07-21 12:39:21', '2017-07-21 12:39:21', null);
INSERT INTO `wc_users` VALUES ('564', 'oruQl1VINs0bTBSuEyxNHLjW9_-k', 'zhangzhixiang@xm12t.com', '18559552276', null, '', null, 'A    泉州百度张志祥-18559552276', 'http://wx.qlogo.cn/mmhead/LSOCzBLDCKxENjgIFjXnYUP4GkgcrGmMQyaSdGJfMuM/0', null, 'jj and', null, '1', null, '1', 'oruQl1VINs0bTBSuEyxNHLjW9_-k', '2017-07-21 13:53:32', '2017-08-07 16:12:27', null);
INSERT INTO `wc_users` VALUES ('565', 'oruQl1QZeUgIV8vbrTFZugF6bLIQ', 'liuwenzhen@xm12t.com', '18959751032', null, '', null, '泉州百度刘文振', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM41gNyWf23HZH6oUVIZwTn6U1Z3FWDWqmibAicgw9Pdt6yA/0', null, '丰泽区少林路仁凤工业区亚特大厦4楼', null, '1', null, '1', 'oruQl1QZeUgIV8vbrTFZugF6bLIQ', '2017-07-21 13:54:36', '2017-07-21 13:59:55', null);
INSERT INTO `wc_users` VALUES ('566', 'oruQl1Zv3zQaZknKP8_tGmyxxasA', 'wuml@xm12t.com', '18959723579', null, '', null, '吴梅', 'http://wx.qlogo.cn/mmhead/hNg3Via6JgDicWibbHkK00m3oRCDXn8c1clBbCBQvPoecM/0', null, '泉州丰泽区少林路仁凤工业区亚特大厦4楼', null, '0', '我是谁，我就是我！', '1', 'oruQl1Zv3zQaZknKP8_tGmyxxasA', '2017-07-21 13:54:41', '2017-07-21 13:58:19', null);
INSERT INTO `wc_users` VALUES ('567', 'oruQl1RQ7lcj1rYdJXJ4tFDKxMDQ', null, null, null, '', null, '老公公', 'http://wx.qlogo.cn/mmhead/1CHHx9Yq4nHkKeibKaD17hTv2oE8lFoOayibcZ7qU01ykSjuZGhVhiafQ/0', null, null, null, '1', null, '1', 'oruQl1RQ7lcj1rYdJXJ4tFDKxMDQ', '2017-07-21 13:54:50', '2017-07-21 13:54:50', null);
INSERT INTO `wc_users` VALUES ('568', 'oruQl1WfwQx19RDqp1oPBpvYemLY', null, null, null, '', null, '藝', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7ZhD7XvHeD127Pzua4fDvkASFiccMkRRFnVYz8n5yTOYA/0', null, null, null, '2', null, '1', 'oruQl1WfwQx19RDqp1oPBpvYemLY', '2017-07-21 13:55:03', '2017-07-21 13:55:03', null);
INSERT INTO `wc_users` VALUES ('569', 'oruQl1fakLz2tytgt4zAOWWytDNU', 'amin0.7@foxmail.com', '15859576886', null, '', null, 'α ζั͡✾ 敏 ೄ', 'http://wx.qlogo.cn/mmhead/gQeG4MQHuY6PIXQdpRFmWkXW21qtHNpQgMbyBJpsicsM/0', null, '少林路仁风工业区亚特大厦4楼百度泉州运营中心', null, '2', '(⌯˃̶᷄ ⁻̫ ˂̶᷄⌯) 做 好 每 件 简 单 de 事 就 是 不 简 单❣️', '1', 'oruQl1fakLz2tytgt4zAOWWytDNU', '2017-07-21 13:55:04', '2017-07-21 14:59:40', null);
INSERT INTO `wc_users` VALUES ('570', 'oruQl1cyZ-8JQM2ZXu-QV3jyu-lY', null, null, null, '', null, '嘻嘻', 'http://wx.qlogo.cn/mmhead/4LzxyAhFTSKNy63BSUwjicaHicNnSEqgCjibmWDbjQpFgY/0', null, null, null, '1', null, '1', 'oruQl1cyZ-8JQM2ZXu-QV3jyu-lY', '2017-07-21 13:55:06', '2017-07-21 13:55:06', null);
INSERT INTO `wc_users` VALUES ('571', 'oruQl1fmifEC0ErvgJq048_CVcBU', '601716209@qq.com', '15959573645', null, '', null, '邓秋玲', 'http://wx.qlogo.cn/mmhead/CwGzcuM5T4sxPeZ4w2kKrOMib2fVUR8YBDXNFMgwUcYg/0', null, null, null, '2', null, '1', 'oruQl1fmifEC0ErvgJq048_CVcBU', '2017-07-21 13:55:11', '2017-08-10 16:58:18', null);
INSERT INTO `wc_users` VALUES ('572', 'oruQl1cyV8KsTGRdcXK92ItCDQXE', null, null, null, '', null, '????', 'http://wx.qlogo.cn/mmhead/XFJ8HdGGwGCVqnPGpGib79nwxrmpOD192gPaYFkK38m0ic8ibtzvOoXRw/0', null, null, null, '1', null, '1', 'oruQl1cyV8KsTGRdcXK92ItCDQXE', '2017-07-21 13:55:27', '2017-07-21 13:55:27', '2017-07-26 14:13:02');
INSERT INTO `wc_users` VALUES ('573', 'oruQl1XjyCHpvBm9cpBPWZfpTZBs', '419130913@qq.com', '13107862185', null, '', null, '柯伟杰', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5SGWSlWv1zhX1G0b9HNUzM9ZXiaambnlxdOYNiaFcWcAv5gaJiaHKvseHxicyHa06h81jZnGouQOL60Clu6dHB47jm3/0', null, '泉州市仁风工业区亚特写字楼四楼', null, '1', null, '1', 'oruQl1XjyCHpvBm9cpBPWZfpTZBs', '2017-07-21 13:55:42', '2017-08-05 10:07:41', null);
INSERT INTO `wc_users` VALUES ('574', 'oruQl1UUwW3wAAYZtoMjJjhTbN1Q', null, null, null, '', null, '羽', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4YicwZwNDnrcBZX1YWjePW2yLayOibdbJoWSE7Wx8MjF2g/0', null, null, null, '1', null, '1', 'oruQl1UUwW3wAAYZtoMjJjhTbN1Q', '2017-07-21 13:55:55', '2017-07-21 13:55:55', null);
INSERT INTO `wc_users` VALUES ('575', 'oruQl1f47OL4xiOoxgqSjVAfLV1M', null, null, null, '', null, '肉圆', 'http://wx.qlogo.cn/mmhead/6wMDq498U22iaB8ibvDJEL3AjicG3zuNicwOvgFic9VzOV9U/0', null, null, null, '2', null, '1', 'oruQl1f47OL4xiOoxgqSjVAfLV1M', '2017-07-21 13:56:24', '2017-07-21 13:56:24', null);
INSERT INTO `wc_users` VALUES ('576', 'oruQl1Rnhc-ZalaQNeI190VndSUo', null, null, null, '', null, '叶叶。。', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6H1P2iaspyDqEg6derD4cHcxPEBUn5YNxYtsiaB4Tz3lxQ/0', null, null, null, '2', null, '1', 'oruQl1Rnhc-ZalaQNeI190VndSUo', '2017-07-21 13:57:27', '2017-07-21 13:57:27', null);
INSERT INTO `wc_users` VALUES ('577', 'oruQl1bztjzZEujIw-oczpoC5MTA', null, null, null, '', null, '紫夜香花', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4viaPvS8s234cF57ZeBiah5gV43e6gvRPMqYvXBicwlCJGQ/0', null, null, null, '2', null, '1', 'oruQl1bztjzZEujIw-oczpoC5MTA', '2017-07-21 13:58:09', '2017-07-21 13:58:09', null);
INSERT INTO `wc_users` VALUES ('578', 'oruQl1QujESz8aBT1oe6bwUfnzlg', '736709910@qq.com', '13599227307', null, '', null, '我就喜欢', 'http://wx.qlogo.cn/mmhead/mqIwtSnDIWVFkFicDL0C3J1ibRmxqic2pdpmrF1GwDdPgk/0', null, '泉州市丰泽区泉秀路', null, '1', '我就喜欢，要你管', '1', 'oruQl1QujESz8aBT1oe6bwUfnzlg', '2017-07-21 14:02:00', '2017-07-26 17:33:51', null);
INSERT INTO `wc_users` VALUES ('579', 'oruQl1ZT5W9017s1QS-M7_ZbVchs', null, null, null, '', null, '赫葛格', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6RpLiblXxyEkUMyLnTvqOwnoh3Iudnz3Bxpee3icHCpW8g/0', null, null, null, '1', null, '1', 'oruQl1ZT5W9017s1QS-M7_ZbVchs', '2017-07-21 14:03:09', '2017-07-21 14:03:09', null);
INSERT INTO `wc_users` VALUES ('580', 'oruQl1UCRwR5vHzEVl9GB4Wz_7g4', 'linzhifeng@xm12t.com', '15080441214', null, '', null, '林志峰', 'http://wx.qlogo.cn/mmopen/22YD2oBcVUZzsSIY0iaVVAwcntZCsQ9EAdpaCTiamsVa8FWulu2gfWwC0RK2tm8oicnstaGpv2jzjdpnlIWUVa0dQ/0', null, null, null, '1', null, '1', 'oruQl1UCRwR5vHzEVl9GB4Wz_7g4', '2017-07-21 14:09:19', '2017-07-26 17:37:44', null);
INSERT INTO `wc_users` VALUES ('581', 'oruQl1biP8cWu9p7es_fypeIIHfw', 'linlili@xm12t.com', '18005072278', null, '', null, '林莉莉', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5BXdqkYsOfdJiak9UpLlYkCIAZjQSb5OzSsNlby3ibqRvQ/0', null, null, null, '2', null, '1', 'oruQl1biP8cWu9p7es_fypeIIHfw', '2017-07-21 14:13:53', '2017-08-05 10:08:00', null);
INSERT INTO `wc_users` VALUES ('582', 'oruQl1b69CUuMO9qyOvGdrEkg8FI', null, null, null, '', null, 'Daisy', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6zpwTZeW0RML6YQw4icrLhahsicMMibcmSJeu7g69L3MqQA/0', null, null, null, '2', null, '1', 'oruQl1b69CUuMO9qyOvGdrEkg8FI', '2017-07-21 14:17:20', '2017-07-21 14:17:20', null);
INSERT INTO `wc_users` VALUES ('583', 'oruQl1Zkj2hramyPvz7rHuf8QAC0', null, null, null, '', null, 'Baidu 百度℡ 王', 'http://wx.qlogo.cn/mmhead/MohUrtLr8ZYDUk0xrONm3KolJm8ltqL0AAxdumAghxk/0', null, null, null, '1', null, '1', 'oruQl1Zkj2hramyPvz7rHuf8QAC0', '2017-07-21 14:17:30', '2017-07-21 14:17:30', null);
INSERT INTO `wc_users` VALUES ('584', 'oruQl1eUSXjrixD7Mvv0U9RYESdE', null, null, null, '', null, '百度推广吴乙彬15805995060', 'http://wx.qlogo.cn/mmhead/ibexxy8AIZ1r6x5TCyqAaxFXW5lZnGU67pqQmvOQKXWw/0', null, null, null, '1', null, '1', 'oruQl1eUSXjrixD7Mvv0U9RYESdE', '2017-07-21 14:18:10', '2017-07-21 14:18:10', null);
INSERT INTO `wc_users` VALUES ('585', 'oruQl1Y6gMWfJl_A1HQDohWrRp6g', null, null, null, '', null, '吴承汉', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEIKbEZSibftIamiczGv05pibia4GCQGocoJB4Jmq15S1GUHSQ/0', null, null, null, '1', null, '1', 'oruQl1Y6gMWfJl_A1HQDohWrRp6g', '2017-07-21 14:18:12', '2017-07-21 14:18:12', null);
INSERT INTO `wc_users` VALUES ('586', 'oruQl1dgqZnowX4dLjJGTY6r6tDE', null, null, null, '', null, '白边', 'http://wx.qlogo.cn/mmhead/zsUXYY6y4cKlkfLBsVY2EhcOF8JCV7IAlkNGfiaaukTwyReTBml2EXQ/0', null, null, null, '2', null, '1', 'oruQl1dgqZnowX4dLjJGTY6r6tDE', '2017-07-21 14:18:18', '2017-07-21 14:18:18', null);
INSERT INTO `wc_users` VALUES ('587', 'oruQl1WLSKA9YQPamWL5ap6rHW28', '1002132787@qq.com', '13586961048', null, '', null, '百度黄辉瑞', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6QHyAvNOsia15xBxGKxtaVy0e0qkzWvYOZgiasl50v9u4Q/0', null, null, null, '1', null, '1', 'oruQl1WLSKA9YQPamWL5ap6rHW28', '2017-07-21 14:18:18', '2017-08-10 16:46:22', null);
INSERT INTO `wc_users` VALUES ('588', 'oruQl1bKD82NZqhiBS-xQl0Ka3Mw', null, null, null, '', null, '无从释怀', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5Z1b5icSVnO76zBjHpucBicmmp93CbUQria82PvEY9KXGftfOq4183UAOjB8uPljTVfibkJXvZSIAcpX4/0', null, null, null, '2', null, '1', 'oruQl1bKD82NZqhiBS-xQl0Ka3Mw', '2017-07-21 14:18:21', '2017-07-21 14:18:21', null);
INSERT INTO `wc_users` VALUES ('589', 'oruQl1foy4GGMWAjHaWKmQSL7A2g', null, null, null, '', null, 'Eggsy', 'http://wx.qlogo.cn/mmopen/xzbsLJkZOtWvsK2KDHiarcwKLKibOzAm0y5Ytics4EOFVPo8B7vQbibFDwlg6ST0k4VfwGHWpy1cQnHPK3sibzEtI5QOZ3Idsibecib/0', null, null, null, '2', null, '1', 'oruQl1foy4GGMWAjHaWKmQSL7A2g', '2017-07-21 14:18:39', '2017-07-21 14:18:39', null);
INSERT INTO `wc_users` VALUES ('590', 'oruQl1cT3oZhUL6-kelgSSsZotFM', null, null, null, '', null, '此刻心情', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5v105yXp5vE5Jiax1898iawpXTdQ0oN8ZF01nESFxCibdQw/0', null, null, null, '2', null, '1', 'oruQl1cT3oZhUL6-kelgSSsZotFM', '2017-07-21 14:19:01', '2017-07-21 14:19:01', null);
INSERT INTO `wc_users` VALUES ('591', 'oruQl1a1bjD4DqZ9qAdO9Yj2MVLc', null, null, null, '', null, '-Nacy ????', 'http://wx.qlogo.cn/mmhead/ibITIxsSrKF2RBb6muHF01Ty6BLOibibzHGvgyiaiaibicGI6g/0', null, null, null, '2', null, '1', 'oruQl1a1bjD4DqZ9qAdO9Yj2MVLc', '2017-07-21 14:20:57', '2017-07-21 14:20:57', null);
INSERT INTO `wc_users` VALUES ('592', 'oruQl1X5KV1wmdg9w6ckBozqPwF0', '657004828@qq.com', '15980142959', null, '', null, '南国', 'uploads/user/592/img1500620768.jpg', null, null, null, '2', '诚信买卖，季节出售野生红菇，欢迎咨询，谢谢。', '1', 'oruQl1X5KV1wmdg9w6ckBozqPwF0', '2017-07-21 14:58:23', '2017-07-21 15:07:05', null);
INSERT INTO `wc_users` VALUES ('593', 'oruQl1dTmXzqZkSaYhvzo_o_rxZk', null, null, null, '', null, 'A百度-陈锦灵15860572977', 'http://wx.qlogo.cn/mmhead/SYeWkon6C6KMeiateicyogKgib2Gq3jlXbTKuR9ice4oKuHle9LrJrR2RQ/0', null, null, null, '1', null, '1', 'oruQl1dTmXzqZkSaYhvzo_o_rxZk', '2017-07-21 15:55:14', '2017-07-21 15:55:14', null);
INSERT INTO `wc_users` VALUES ('594', 'oruQl1Q4SPbhCtjAqscqhRL7kwSQ', null, null, null, '', null, 'biang', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM5Kcej2XlAAAwf60KMqdgAYdY4uhgCNY2hpQCj7ibdeV9w/0', null, null, null, '2', null, '1', 'oruQl1Q4SPbhCtjAqscqhRL7kwSQ', '2017-07-21 15:56:06', '2017-07-21 15:56:06', null);
INSERT INTO `wc_users` VALUES ('595', 'oruQl1aaV5g4OKapcCSINW0q5yNQ', null, null, null, '', null, '戒烟戒酒不戒你ぃ', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7Q8T8Bz9Q9lPqVWvzYhaJHEqpRfQld8XGmeYhULZcy3A/0', null, null, null, '1', null, '1', 'oruQl1aaV5g4OKapcCSINW0q5yNQ', '2017-07-21 16:18:12', '2017-07-21 16:18:12', null);
INSERT INTO `wc_users` VALUES ('596', 'oruQl1ShQp_5uVQHx75YncNWlRto', null, null, null, '', null, '吴王夫差', 'http://wx.qlogo.cn/mmhead/KydxAIB52xlTvGs18Z7BpYabZL9V5boFDvKibwJKo7GpcKSDZiaTaYGw/0', null, null, null, '0', null, '1', 'oruQl1ShQp_5uVQHx75YncNWlRto', '2017-07-21 16:31:43', '2017-07-21 16:31:43', null);
INSERT INTO `wc_users` VALUES ('597', 'oruQl1Vs-Wq7dj16WWDkhpAZ0yS4', null, null, null, '', null, 'A俊龍༗13008855944', 'http://wx.qlogo.cn/mmopen/evxwjYValEUK6o7xQQ88ZhPQ64R230YxlHWt3nFmkIcvPRGSbNibZBicEZkGp57HEN4sC4QyKnWp1vRr1xqD0nPesjbqbaSt77/0', null, null, null, '1', null, '1', 'oruQl1Vs-Wq7dj16WWDkhpAZ0yS4', '2017-07-21 18:17:57', '2017-07-21 18:17:57', null);
INSERT INTO `wc_users` VALUES ('598', 'oruQl1cSCEczr8xJB38kY3hAzo8U', 'chenyy@xm12t.com', '18750549066', null, '', null, '福建百度公司陈莹莹', 'http://wx.qlogo.cn/mmhead/FrNod6jRzQXPSrUADu5t32fU9Aok3qhDjIZXW8iaE99w/0', null, '少林路仁凤工业区亚特大厦四楼', null, '2', '做百度推广，网站建设', '1', 'oruQl1cSCEczr8xJB38kY3hAzo8U', '2017-07-21 19:41:15', '2017-07-21 19:42:21', null);
INSERT INTO `wc_users` VALUES ('599', 'oruQl1a2yiHQYaJpeS1ktZLwytto', '3071566039@qq.com', '18250289602', null, '', null, 'Xieshengquan', 'http://wx.qlogo.cn/mmhead/wXJ5kSJT6OM2ty0nLhVfGZCqAibwSABWPhaKMkCkFYe8wym6b2kicHww/0', null, '泉州市丰泽区清濛开发区锦绣江南6栋', null, '1', '你所要的网站设计和推广，我们有！你来！一切都水到渠成', '1', 'oruQl1a2yiHQYaJpeS1ktZLwytto', '2017-07-22 01:52:51', '2017-07-22 01:57:41', null);
INSERT INTO `wc_users` VALUES ('600', 'oruQl1brKx5GsJW5J3x1zwaaGiSg', null, null, null, '', null, '脚????笑', 'http://wx.qlogo.cn/mmhead/PiajxSqBRaEJP0U1xCEAVwWCV4RQDTJqj5cTDBSFJEP1x4JIXBjCTeA/0', null, null, null, '1', null, '1', 'oruQl1brKx5GsJW5J3x1zwaaGiSg', '2017-07-22 18:42:35', '2017-07-22 18:42:35', null);
INSERT INTO `wc_users` VALUES ('601', 'oruQl1apI5qwJ3ELSYCUfQCHQ59w', '406460693@qq.com', '13430161470', null, '', null, '惠州百度彭天生', 'http://wx.qlogo.cn/mmhead/PL5y7QQHZgJnrw2uibbb7XfJW8V0wYZ4o3k3anyfC7WtS3pB24DRKOQ/0', null, '惠州市惠城区演达一路华阳大厦二十四层', null, '1', '花该花的时间，做该做的事', '1', 'oruQl1apI5qwJ3ELSYCUfQCHQ59w', '2017-07-23 00:37:58', '2017-07-23 00:43:03', null);
INSERT INTO `wc_users` VALUES ('602', 'oruQl1YcnyfbhhCSBtKVlxVjuCig', '15220606008@qq.com', '15220606008', null, '', null, '惠州众盟·胡剑杰', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKbAwicnyvu61Zp8DIic4zAcnKlnciaOHJFv5xWp2ibzzAk4xKZ7rArQUNPuObCbiboV4p2nGib4fKBc38BWZ5hRKUDQbccrw4iafzZSY/0', null, '惠州市惠城区河南岸华阳大厦4楼C座', null, '1', '大数据营销于手机广告，让中小企业投得起央视广告。', '1', 'oruQl1YcnyfbhhCSBtKVlxVjuCig', '2017-07-23 01:14:05', '2017-07-23 01:17:21', null);
INSERT INTO `wc_users` VALUES ('603', 'oruQl1UD0D3nBf7i-nz8uffrEQzE', null, null, null, '', null, '????weekend', 'http://wx.qlogo.cn/mmopen/IP1A06N4R5T5AUckeUz5Z2KKntu065JWvOAr4oRUGLLjgaGhze95G54uXffGpa4uv7wib0veWIVVhkh1PA4FGuBnAngoIUXD8/0', null, null, null, '2', null, '1', 'oruQl1UD0D3nBf7i-nz8uffrEQzE', '2017-07-23 17:19:17', '2017-07-23 17:19:17', null);
INSERT INTO `wc_users` VALUES ('604', 'oruQl1Z0mTJzy2ys9VuTPYnh-0wA', null, null, null, '', null, '徐云云', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM4pjkhTDzuD7e0NRdQDFNMDzjibAzWCHLtmQaRDsghSibLQ/0', null, null, null, '2', null, '1', 'oruQl1Z0mTJzy2ys9VuTPYnh-0wA', '2017-07-24 11:36:12', '2017-07-24 11:36:12', null);
INSERT INTO `wc_users` VALUES ('605', 'oruQl1crF9l2hVX-9vQVK7R8TfP0', null, null, null, '', null, 'A晋江嘉林商标小庄13506037200', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM79DckHpLlQEKsPL39vNaMev7E6rVQ4AIHHrWtdMCJYia5px3LRf6xWHyN14Y8Os7NknUg8oPuy8w0OKqbLQuXBnG9uvdQPtvhQ/0', null, null, null, '2', null, '1', 'oruQl1crF9l2hVX-9vQVK7R8TfP0', '2017-07-24 15:21:31', '2017-07-24 15:21:31', null);
INSERT INTO `wc_users` VALUES ('606', 'oruQl1S8OW8_exlUK3ZiUpvNxgwU', 'xuxj@ydbaidu.net', '13829035999', null, '', null, '许晓佳', 'uploads/user/606/img1502850828.jpg', null, null, null, '2', null, '1', 'oruQl1S8OW8_exlUK3ZiUpvNxgwU', '2017-07-24 15:44:21', '2017-07-24 15:46:08', null);
INSERT INTO `wc_users` VALUES ('607', 'oruQl1aqgQ7T1RS0xbLS_mYtDRWw', 'chenwp@12t.cn', '13774651497', null, '', null, '陈伟平', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3W3ia04xgdRQw0p7Piath9QTdbYfMxq0cM4gUmwm5PfwF4vGZJJCicicpqcQic6xkLNSrkPVS13CU0eL9/0', 'uploads/user/607/img1502874305.png', '厦门软件园二期观日路36号201', null, '1', '百度简单可依赖', '1', 'oruQl1aqgQ7T1RS0xbLS_mYtDRWw', '2017-07-24 17:36:55', '2017-08-16 17:05:05', null);
INSERT INTO `wc_users` VALUES ('608', 'oruQl1UdYeboalauSpokBq1kKGWQ', '969396428@qq.com', '15160009645', null, '', null, '百度互联网策划  林汉斌', 'uploads/user/608/img1500889537.jpg', null, '厦门市思明区软件园二期观日路36号201单元', null, '1', '建站，百度推广。', '1', 'oruQl1UdYeboalauSpokBq1kKGWQ', '2017-07-24 17:37:08', '2017-07-24 17:43:34', null);
INSERT INTO `wc_users` VALUES ('609', 'oruQl1W8YqG9B9hmv0j69nKnf7YM', '907672629@qq.com', '18250103926', null, '', null, '耳東陈', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8f7u7onOKVwsJ2Y317JVgeGMBrMTia08FSLn5jIZ4D4dZRWn3pURIibCLK2uKWpe5jaXAibDHYvGCkJaYZKCH4OofV/0', null, null, null, '0', 'Stay hungry\r\nStay foolish', '1', 'oruQl1W8YqG9B9hmv0j69nKnf7YM', '2017-07-24 17:40:13', '2017-07-24 17:44:30', null);
INSERT INTO `wc_users` VALUES ('610', 'oruQl1W_JPT5FADfNia_RqkjNabk', null, null, null, '', null, 'A000百度王晓亮15959355064', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzib48cq6SliakM45QkzNLqqC7VlVib8OqIw36ibWpuEaPUFLiaYiacjDBh8ENVjjA1Glbu0xcMMesChTcC/0', null, null, null, '1', null, '1', 'oruQl1W_JPT5FADfNia_RqkjNabk', '2017-07-24 17:40:33', '2017-07-24 17:40:33', null);
INSERT INTO `wc_users` VALUES ('611', 'oruQl1dq_FSv3R_YFoSXd88GapZI', null, null, null, '', null, '百度竞价推广&品牌推广～王晓亮', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBDicczIFvh1M5cnxy7x24x354qKVy29LpnDRc4Cpserq4FyOBQohRWZxibEJHtWNic4QWfM8LicrcpmA/0', null, null, null, '1', null, '1', 'oruQl1dq_FSv3R_YFoSXd88GapZI', '2017-07-24 17:40:59', '2017-07-24 17:40:59', null);
INSERT INTO `wc_users` VALUES ('612', 'oruQl1acf5Qee8o5yP1H66fX0Fnk', null, null, null, '', null, '百度林爱义', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaexyoCx5CFViclTw6SrA4l0UZibWHg9arXVJibOUycBphfSJyToaPTQRes1Pia1Ku6leduuA3AWybw8ol/0', null, null, null, '1', null, '1', 'oruQl1acf5Qee8o5yP1H66fX0Fnk', '2017-07-24 17:41:11', '2017-07-24 17:41:11', null);
INSERT INTO `wc_users` VALUES ('613', 'oruQl1ShVAKCj4ac-rkDXLLXJzso', 'chenjiawei@xm12t.com', '13255029802', null, '', null, 'A百度-陈加伟', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw812yM2cdWjasxOFgHvQFee7EXEUj4c0ibdVOxJoPKpGSgEtW7hQlYPTticlZYFzrrTcTAIK2jSBSEWLUdPicghoB2/0', null, '厦门市软件园二期观日路36号201单元', null, '1', '你的推广顾问', '1', 'oruQl1ShVAKCj4ac-rkDXLLXJzso', '2017-07-24 17:42:21', '2017-07-24 17:48:58', null);
INSERT INTO `wc_users` VALUES ('614', 'oruQl1U48S7daTpwhgC5WECZDLGs', 'chenxing@xm12t.com', '15880540857', null, '', null, '陈星', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzyQYecOQHlKA86oic9MklBflz0SnXj7o9WHnia7rDRuZRzkNWjv311YicQpSIiak1vhLrqgr7EoWb822/0', null, null, null, '1', null, '1', 'oruQl1U48S7daTpwhgC5WECZDLGs', '2017-07-24 17:42:52', '2017-07-24 17:45:11', null);
INSERT INTO `wc_users` VALUES ('615', 'oruQl1Sx3fS45A5y59CxgLp6bqbU', '13063030160@163.com', '13063030160', null, '', null, '陈燕冰', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuRByW7JXmD2MdYgkTNOkCabjpMamfcCrDsGElPfD3RYCcZdEUDd0qx9Q5BDRiaSbDL3kvyUmbgeynUPz6AUwKHUj/0', null, null, null, '2', null, '1', 'oruQl1Sx3fS45A5y59CxgLp6bqbU', '2017-07-24 17:43:05', '2017-07-24 17:43:49', null);
INSERT INTO `wc_users` VALUES ('616', 'oruQl1Uc-dkJl8tAA2l8LJSCRBu4', '750600346@qq.com', '15980934561', null, '', null, 'Clarence(锋)', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaT1B1AqVTS2prj21yIib1ib9M8QErTNRP2q5862KvSqpeykR0WozB4sOXf8UGtibmicibGdw3ic5lib4hYP/0', 'uploads/user/616/img1503371301.jpg', null, null, '1', null, '1', 'oruQl1Uc-dkJl8tAA2l8LJSCRBu4', '2017-07-24 17:43:21', '2017-08-07 14:34:40', null);
INSERT INTO `wc_users` VALUES ('617', 'oruQl1dFK4ZxSFq9gSBOYBZxMmwY', 'zhenglongjie@12t.com', '15985887595', null, '', null, '百度_郑龙杰', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSabLs7YVCrQia3jKypz1hQr06lhvdu504qx95eYfiak6SWRy4ibPibRnVS1QjTAibic4RFx1SV1K3y3clnO/0', null, '厦门市思明区软件园二期36号之一', null, '1', '网站建设，网络推广，糯米团购……', '1', 'oruQl1dFK4ZxSFq9gSBOYBZxMmwY', '2017-07-24 17:43:33', '2017-07-24 17:46:19', null);
INSERT INTO `wc_users` VALUES ('618', 'oruQl1S11dWM5cNYYWoY7H2fRmZs', null, null, null, '', null, '百度-蒋玉柏', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaexUbegxz5xAeEQ33lFfT6OL2zwpXmlcibXiceRuEazuglLZqINiaJu1GQXJzZo2LmaeiaR5OmMK4x8BP/0', null, null, null, '1', null, '1', 'oruQl1S11dWM5cNYYWoY7H2fRmZs', '2017-07-24 17:43:37', '2017-07-24 17:43:37', null);
INSERT INTO `wc_users` VALUES ('619', 'oruQl1eMsiCABmMrKTNUrJw3JgJY', 'tandong@ydbaidu.com', '15819883889', '0752-5702360', '', null, '粤东百度谭冬', 'http://wx.qlogo.cn/mmopen/gQQO820rz5V9JzPJVvB5ic84HiceDOUd69gbI3Rl0OEMRneTXayF2btbQ3v3ibL1FFNWQyGO1icT1pgpfZslZpoUzcso9JNfpib2b/0', null, '惠州市惠城区演达一路华阳大厦24层', null, '1', null, '1', 'oruQl1eMsiCABmMrKTNUrJw3JgJY', '2017-07-24 18:10:13', '2017-07-24 18:26:48', null);
INSERT INTO `wc_users` VALUES ('620', 'oruQl1Vze_ddxFk4X3--Xgr1DBjU', null, null, null, '', null, '惠州百度????杜慧君', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuTzx80tx7bdeUpn4zuuNmhov9D6ic65EsrBOMPiaeLZya316cibHt1e0aLN4qhvWDvtD8u2gjJ9vxOc7ru4LPiaPWeP/0', null, null, null, '2', null, '1', 'oruQl1Vze_ddxFk4X3--Xgr1DBjU', '2017-07-24 19:48:23', '2017-07-24 19:48:23', null);
INSERT INTO `wc_users` VALUES ('621', 'oruQl1fMvCNr9tCd240UFghxGglY', 'marb@ydbaidu.net', '15767979528', null, '', null, '惠州百度马锐滨', 'http://wx.qlogo.cn/mmopen/5HkCBulJjD1MrBUDAV6qr3B5e5trFTjEYplLU2cEGVozkEfSFviavxrtjvyDF5deIfAIeb259hWC2iaV0DuqclsNMAlRALSY1ic/0', null, '惠城区华阳大厦24楼', null, '1', null, '1', 'oruQl1fMvCNr9tCd240UFghxGglY', '2017-07-24 19:50:05', '2017-08-07 17:46:53', null);
INSERT INTO `wc_users` VALUES ('622', 'oruQl1fQ41lqwlO0E5T3gCnUVB7w', null, null, null, '', null, '绿森之家装饰建材13459000689', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3SiaU4LgGibiazibibbOBkT4PiaaFnEV1fW1IXjQtpdmdnaHlQftE38bnlSwbBq4hfrCRMm4rReGpkRtwW/0', null, null, null, '1', null, '1', 'oruQl1fQ41lqwlO0E5T3gCnUVB7w', '2017-07-24 20:14:59', '2017-07-24 20:14:59', null);
INSERT INTO `wc_users` VALUES ('623', 'oruQl1TWhFzBDsYisv-xq6Rvilxk', 'wuqiaolingvv@163.com', '18850789935', null, '', null, 'Cara', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDmXfFgnSa8fBdgOC5sWm9bjOpXlIC4kC2moJ9dRjDPrIzbiacGRcVEpA6Bzuh6dBntKMMiawIEiaHJg/0', null, null, null, '2', null, '1', 'oruQl1TWhFzBDsYisv-xq6Rvilxk', '2017-07-24 20:57:43', '2017-07-24 21:05:42', null);
INSERT INTO `wc_users` VALUES ('624', 'oruQl1TD0gR152Yv0tXBeyaKGHrY', '392568054@qq.com', '13025324765', null, '', null, '李涵', 'http://wx.qlogo.cn/mmopen/gQQO820rz5XHEJj9oqdZyM5zEuVu0oMib4SibiaEicC9DLSSC9Ux3TZn6aLmW6ZXj9RuGKudFA3HFvm8G3YpmeFn4D4kzEONhGLR/0', null, '汕头市金平区跃进路利鸿基大厦b座20楼', null, '2', '百度搜索推广，网站建设，手百信息流，找我哦', '1', 'oruQl1TD0gR152Yv0tXBeyaKGHrY', '2017-07-24 21:28:55', '2017-07-24 21:31:11', null);
INSERT INTO `wc_users` VALUES ('625', 'oruQl1SLH7x2Rw3LoZnFdAFmRdFs', null, null, null, '', null, '陈秀玉', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicBJetj7PBnJ8hmUUg1FCJyJsykmIiaFDicDQqaNhnfSQBFicEY70GjUqc4x1aygkQG2RbqY4cxAH1qC/0', null, null, null, '2', null, '1', 'oruQl1SLH7x2Rw3LoZnFdAFmRdFs', '2017-07-24 22:06:42', '2017-07-24 22:06:42', null);
INSERT INTO `wc_users` VALUES ('626', 'oruQl1WJ8Hxzs6DI05cr5Spn_wko', null, null, null, '', null, '许sir', 'http://wx.qlogo.cn/mmopen/YW4c50BwHwicT5ibp5PFUwHa1S30PW6ofjibZrwGHFAUAiaq1oGmoXL8qnFzefOx5LJK8ZLAuMoNERfd4XvNHZydw2icNjmxrYdXb/0', null, null, null, '1', null, '1', 'oruQl1WJ8Hxzs6DI05cr5Spn_wko', '2017-07-24 23:09:34', '2017-07-24 23:09:34', null);
INSERT INTO `wc_users` VALUES ('627', 'oruQl1bBhKIYKIm_yVmfu9HSlTxI', null, null, null, '', null, '三七', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCvnqKvevOJxzdUYPkicNFvvFicwJgsUSibXibzaubIsIU4BQMsTZXlxqNmH2y8v7N0VG0FrY0y5TKo4A/0', null, null, null, '1', null, '1', 'oruQl1bBhKIYKIm_yVmfu9HSlTxI', '2017-07-25 08:15:49', '2017-07-25 08:15:49', null);
INSERT INTO `wc_users` VALUES ('628', 'oruQl1YWijYi5kf3N3yzRJRyHVfI', null, null, null, '', 'Tgm7Mj3NxgDwFUlBoFRg9LxFLldJ3LjAebFFHq8G7Wt7S2h54RTyayV3ZLwp', '6粒橙', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3TkhW0J5h8C5eysCUicawUNHvicRx3sUNexUsw3al6tNAhlUHSoXkZy5L8G9VKEdHOicUaFMSknoTG9/0', null, null, null, '1', null, '1', 'oruQl1YWijYi5kf3N3yzRJRyHVfI', '2017-07-25 08:26:32', '2017-07-25 09:23:10', null);
INSERT INTO `wc_users` VALUES ('629', 'oruQl1XX-SsBe4rH-3cNGZeeFP0Q', null, null, null, '', null, '夕颜', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELmA9Px8uY3bE1Bve6ac8Ym2AwQciaYzq9zKadxg1FubxV0QDQ5dBVCl5NQSmLTXzJejSRKpa6RePw/0', null, null, null, '2', null, '1', 'oruQl1XX-SsBe4rH-3cNGZeeFP0Q', '2017-07-25 08:32:40', '2017-07-25 08:32:40', null);
INSERT INTO `wc_users` VALUES ('630', 'oruQl1f8HEWaFAfWtfACTbOoEJhQ', null, null, null, '', null, '是不是', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3dEdzWkOZiaduDKfjibINqnbg9LeKQYHzcmnqhuHXULkHDR1CbBnWMib1HbbuQzx5gEHD84PUaRO67H/0', null, null, null, '2', null, '1', 'oruQl1f8HEWaFAfWtfACTbOoEJhQ', '2017-07-25 08:32:56', '2017-07-25 08:32:56', null);
INSERT INTO `wc_users` VALUES ('631', 'oruQl1T6j0tOXgfJkeDWplxn9u1A', null, null, null, '', null, '百度   李钿', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBnluuTL2UAAAzlBbyaZiaFibCsVb7dVSpjJn7YXgFhtVxqvfaFxAicae7xZN3LtJGTpJBvAsTk22mBDa0N9cpibIPMKnAPlNuOTZ0/0', null, null, null, '1', null, '1', 'oruQl1T6j0tOXgfJkeDWplxn9u1A', '2017-07-25 09:18:55', '2017-07-25 09:18:55', null);
INSERT INTO `wc_users` VALUES ('632', 'oruQl1eBIfbaqtujzbmKuZp2sCjU', null, null, null, '', null, '我不是思密达', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3ZQH2jIiabcJibry2yQUlD4jbGFmbXncsskMTeicgptbjZpLAJ0qeQcIuXvRRh2VbpmJw2yosy7qQQ/0', null, null, null, '1', null, '1', 'oruQl1eBIfbaqtujzbmKuZp2sCjU', '2017-07-25 09:20:34', '2017-07-25 09:20:34', null);
INSERT INTO `wc_users` VALUES ('633', 'oruQl1Qr05Ga0FZZJ3Zh1MCTTkB8', null, null, null, '', null, '沈映旋', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzyDS911M48GuWsYRcMWobD7YjUVYSys0lfz12CJVibh8swnd1mIYOtlVicdMjLcv9SfITSO8s5VO4q/0', null, null, null, '2', null, '1', 'oruQl1Qr05Ga0FZZJ3Zh1MCTTkB8', '2017-07-25 09:20:43', '2017-07-25 09:20:43', null);
INSERT INTO `wc_users` VALUES ('634', 'oruQl1fNzhnrV7jsltPjMvrGpRSo', null, null, null, '', null, '别来无恙', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3WkFhjoiaYhUedJbsUCp0u98H6Dy2E70eqCWXPTpGSJ4ksSno76W3HvHfMYHPZyZRlxiaSJklNECrb/0', null, null, null, '2', null, '1', 'oruQl1fNzhnrV7jsltPjMvrGpRSo', '2017-07-25 09:25:12', '2017-07-25 09:25:12', null);
INSERT INTO `wc_users` VALUES ('635', 'oruQl1VhJNhiuVg37Klw29tgTBUk', null, null, null, '', null, '惠州百度孟欣_18666205174', 'http://wx.qlogo.cn/mmopen/rIQuAY6WvlpkhUwvB0GBa1OEpscFLEtD6YL4LzlCUhq605X1qHRC3dicUiaictKrMMBQb1RMTzJKykbOEQ47mwv9o83wxX4Gic7v/0', 'uploads/user/635/img1502963492.jpg', null, null, '0', null, '1', 'oruQl1VhJNhiuVg37Klw29tgTBUk', '2017-07-25 09:30:45', '2017-07-25 09:30:45', null);
INSERT INTO `wc_users` VALUES ('636', 'oruQl1SdEde1cOjRRH5YHJ9iX3eM', '491386562@qq.com', '13246128727', null, '', null, '百度鸿玲', 'http://wx.qlogo.cn/mmopen/rIQuAY6Wvlqa2XDegSH1wpIMZRflrpwnY15h89SR7xNdfxyu2mndRsaVwKpd7uhdWuicBiaUHfYKqYyqcUdMIiaMmxMDNo2V1ia4/0', null, '惠州百度华阳大厦24楼', null, '2', '唯有努力方能对得起自己', '1', 'oruQl1SdEde1cOjRRH5YHJ9iX3eM', '2017-07-25 10:13:19', '2017-07-25 18:48:09', null);
INSERT INTO `wc_users` VALUES ('637', 'oruQl1T8YLQWJPmDD5tgpm9PcCww', null, null, null, '', null, '林A伽????', 'http://wx.qlogo.cn/mmopen/8U2kuy1rpx6w6sCmyHNcGiccrC8ZA1xcsic7ZWcv8xnDkHgj6WXP2xIMzLoWYKw9RK1OYZ3IrdUrcIq5W7kxjTnZe9zTZwdSwib/0', null, null, null, '1', null, '1', 'oruQl1T8YLQWJPmDD5tgpm9PcCww', '2017-07-25 10:21:08', '2017-07-25 10:21:08', null);
INSERT INTO `wc_users` VALUES ('638', 'oruQl1Q08OilYyiy5ryqKmqrI8Vw', null, null, null, '', null, 'A00奋斗者', 'http://wx.qlogo.cn/mmopen/gQQO820rz5UQaY2pgp1PdsT5pTgyfEhz7e0UjTjnKbyibwPHZXYZ661iahBkc3eW1ibibPjPWxvLcje6Thuia9ibMdsA/0', null, null, null, '1', null, '1', 'oruQl1Q08OilYyiy5ryqKmqrI8Vw', '2017-07-25 10:22:23', '2017-07-25 10:22:23', null);
INSERT INTO `wc_users` VALUES ('639', 'oruQl1SjjIbFY7QQDH5Z0T7vSQ0Q', null, null, null, '', null, '西风', 'http://wx.qlogo.cn/mmopen/rIQuAY6Wvlqa2XDegSH1wpKpjCbj3mVFIu7y9vQqibXOB2kTm6sO1o4gwobzZ4zK20aeBe6gcJ5YF05QWic74vAvRic1aic25sicp/0', null, null, null, '1', null, '1', 'oruQl1SjjIbFY7QQDH5Z0T7vSQ0Q', '2017-07-25 11:15:03', '2017-07-25 11:15:03', null);
INSERT INTO `wc_users` VALUES ('640', 'oruQl1bVDzoVTBl1ogBkfFEZCTkQ', 'chenwn@ydbaidu.net', '13680743144', null, '', null, '陈玮楠', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8e8soib73gwBnE7SBVqdFBa80tnmjJb7ssc7cC6CMVzpKY2qDK85xculGPHmPIkEoqFDn3iaqDbtpq0hezexG7DRic/0', null, '惠州港汇新天地华阳大厦24层', null, '1', '百度推广，百度网站建设，百度信息流，百度地图等业务办理', '1', 'oruQl1bVDzoVTBl1ogBkfFEZCTkQ', '2017-07-25 14:16:01', '2017-07-25 18:12:23', null);
INSERT INTO `wc_users` VALUES ('641', 'oruQl1RYgoQZTCq2RbphEm7DOIGA', 'zhutao@ydbaidu.net', '13923796201', null, '', null, '朱涛', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3cO1WBHjbBwAuWqfZBWznPyT76b58ibLFUYjeeNFVbVKtjsnMu5O3S8Co63l3SpkV3gaGPpZkbYNW/0', null, null, null, '1', null, '1', 'oruQl1RYgoQZTCq2RbphEm7DOIGA', '2017-07-25 14:21:49', '2017-07-25 14:23:43', null);
INSERT INTO `wc_users` VALUES ('642', 'oruQl1e3CM-x1PfBfpGD2fiF4Uy8', '1028138124@qq.com', '15627386605', null, '', null, 'AA粤东百度顾问林小慧', 'http://wx.qlogo.cn/mmopen/rzMQGpNUVekXm1ic9djVAABqEYmcU2zcu7uwgZTdiaF5FZf7xkh5icYJOJGHDiaj6GLmuxgLvjiagda4bx9F6l1ZUcueDoNmCUplB/0', null, '演达大道华阳大厦24楼', null, '2', null, '1', 'oruQl1e3CM-x1PfBfpGD2fiF4Uy8', '2017-07-25 14:48:44', '2017-07-25 14:51:41', null);
INSERT INTO `wc_users` VALUES ('643', 'oruQl1a5VPGfyA59OlEVmLsldMA0', null, null, null, '', null, 'csc', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuR2TicGV2RDWI0ILsBaD3SiczVZFlIhLM3aJP6B5dsvYmULWejkpN5KW6gLicZxRqube5IapibvuFj2SN1zRxPfHiazm/0', null, null, null, '1', null, '1', 'oruQl1a5VPGfyA59OlEVmLsldMA0', '2017-07-25 14:49:04', '2017-07-25 14:49:04', null);
INSERT INTO `wc_users` VALUES ('644', 'oruQl1d-KqD0ZyE3Udp6hmmXPyhM', null, null, null, '', null, '惠州百度的小叶 13502428740', 'http://wx.qlogo.cn/mmopen/gQQO820rz5XTAbkEhycSXMxcpToKCtBjSsldVfxDdlLqjRcVdiaurqyg4JDaMavia68ThJ93gibbFVQ6Y1HmdIjtt7J4ZRKTGb1/0', null, null, null, '2', null, '1', 'oruQl1d-KqD0ZyE3Udp6hmmXPyhM', '2017-07-25 14:49:06', '2017-07-25 14:49:06', null);
INSERT INTO `wc_users` VALUES ('645', 'oruQl1Vn9CR5kGhNdyCHz_KTCGEA', 'liukw@ydbaidu.net', '13580984951', null, '', 'JIPem0gktkaFdvxXjHtoJZTZupXBcfr6kzBumMP5F1navWTutB6gFxlGdiYX', '刘康伟', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5Zv2GiawSZMILFduRKR06kcr3dIrLlFSVCKo6JALFNz0koSUsOsGakCwb8ZpKiaHTugzHWEXsicFiankBHsicNChDRLT/0', null, '惠州市惠城区华阳大厦24楼', null, '1', '我的理想就是大家都不上班', '1', 'oruQl1Vn9CR5kGhNdyCHz_KTCGEA', '2017-07-25 15:17:50', '2017-07-25 15:35:35', null);
INSERT INTO `wc_users` VALUES ('646', 'oruQl1VzMVgW_f8AAp6F8twpTIG4', null, null, null, '', null, 'A惠州阿里渠道-晓文', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae2fGaChYqNZoNnnicgbAibuOUViaFAhupNjZpEJ7M9xm336Kn42aTsBJ9wnuEnZ3tBJmkxzs46jzdHW/0', null, null, null, '1', null, '1', 'oruQl1VzMVgW_f8AAp6F8twpTIG4', '2017-07-25 15:24:40', '2017-07-25 15:24:40', null);
INSERT INTO `wc_users` VALUES ('647', 'oruQl1W4GW99XLjRDc6lGaLykw8M', null, null, null, '', null, '阿里巴巴惠州赖晓婷', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8dVIEqm3SbY1tFkLm0QwcZqsSzDK52iam9DXpCFysMUcZmXtvCiaTiazCvt3I3sXyBtIBAavl5nhHd6fBZl0rPF4tO/0', null, null, null, '2', null, '1', 'oruQl1W4GW99XLjRDc6lGaLykw8M', '2017-07-25 17:34:01', '2017-07-25 17:34:01', null);
INSERT INTO `wc_users` VALUES ('648', 'oruQl1W3px0wbsOQ-jymkZ6BLDuQ', '921542161@qq.com', '15768659092', null, '', null, 'TEA', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cc7xxptp4qfDib6ich9551n0TvVDLSh9H2AI02C4fibKA6RRtpZ0Fiadh9J7MOQ11EEH1F9v6DNoIXdultbNujtoz9/0', null, '惠州市惠城区演达大道三环装饰城', null, '2', '平面设计师', '1', 'oruQl1W3px0wbsOQ-jymkZ6BLDuQ', '2017-07-25 17:34:52', '2017-07-25 17:40:12', null);
INSERT INTO `wc_users` VALUES ('649', 'oruQl1VaGRlvnFxPoHFe-yglSmIM', 'lijw@ydbaidu.net', '15767952205', null, '', null, '百度@蚊宝宝', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaaKHG1R1aLbHLuicibIjeGFQ6qrlcMHgvvXT2CnMvRmfhII5QPVbRvlfjsEVB08VibhTvJNjO8Hszvh/0', null, '惠州市惠城区演达一路华阳大厦24层', null, '1', '百度推广、百度直通车、百度百科、百度地图、网站建设、企业邮箱等', '1', 'oruQl1VaGRlvnFxPoHFe-yglSmIM', '2017-07-25 18:06:04', '2017-07-25 18:28:04', null);
INSERT INTO `wc_users` VALUES ('650', 'oruQl1dt6afgxTR4wMj6AyxHGpFI', '1187468956@QQ.com', '13413843205', null, '', null, '一窝鋒珠宝店', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuTtXvrt0QPr1xlORAic47kibWvLIyNUte2LdMRGeBIiaJ7dICd2gt9mAY1ggDa7U5qmVRsT0B9RWPictlvE6hfJH6C0/0', null, null, null, '1', null, '1', 'oruQl1dt6afgxTR4wMj6AyxHGpFI', '2017-07-25 18:27:20', '2017-07-25 18:29:27', null);
INSERT INTO `wc_users` VALUES ('651', 'oruQl1Q4qeg9SjqVP1uXJVCMjy0E', 'lixue@ydbaidu.net', '13480580532', null, '', null, '惠州百度推广李雪', 'http://wx.qlogo.cn/mmopen/gQQO820rz5UPrYwiaQicfRa3gQtCRLAwp5QWTr5Pb30nBaDZCEBib5A3OeMPkELchq1rkD1JWhkWiaLOibqIF85LibQA/0', null, '河南岸华阳大厦24楼', null, '2', '百度推广 百度信息流   网站建设  百度直通车  百度百科  企业邮箱', '1', 'oruQl1Q4qeg9SjqVP1uXJVCMjy0E', '2017-07-25 18:40:26', '2017-07-25 18:54:58', null);
INSERT INTO `wc_users` VALUES ('652', 'oruQl1cOegN8NeQlC2bmdXnyCcrg', '1484818510@qq.com', '18312267794', null, '', null, '惠州百度林小怡18312267794', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8dicgeRvbfZg8gWvL9V7vo14U8AMDI7J1PpQTrMV1icvoWWG7Sr7xLuictWHOjca57GicYJ8duoD6EjffpD207ZARTq/0', null, null, null, '2', '不忘初心，方得始终。', '1', 'oruQl1cOegN8NeQlC2bmdXnyCcrg', '2017-07-25 19:03:32', '2017-07-25 19:19:57', null);
INSERT INTO `wc_users` VALUES ('653', 'oruQl1cC1bR2i3MeanSbVvLTIKj8', null, null, null, '', null, '琼', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9eXSGzJSicEic4eoGEvhzxpkOwJgsVIdTticibl9RsY8HKw3cFdlOz0SAx3STy8BP9VqO9CrhzynSiafibfHAWczO3SD/0', null, null, null, '2', null, '1', 'oruQl1cC1bR2i3MeanSbVvLTIKj8', '2017-07-25 19:16:04', '2017-07-25 19:16:04', null);
INSERT INTO `wc_users` VALUES ('654', 'oruQl1X8DZHk-gz41_7lLWrA9L_Y', '1079586652@qq.com', '15986048142', null, '', null, '许志强', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuSmt6dDpuKLcwkwJ35tmSlukjIk9kAzGkyNwDWtpSLG8TbVC9AbRaglNfwUCD3k4VA62LycWZrfibV6rtXIJx0zV/0', null, '惠州市演达一路9号华阳大厦16楼CDE室', null, '1', null, '1', 'oruQl1X8DZHk-gz41_7lLWrA9L_Y', '2017-07-25 21:28:32', '2017-07-25 21:30:51', null);
INSERT INTO `wc_users` VALUES ('655', 'oruQl1a_xuMEFmbJxwCrteumhOeE', null, null, null, '', null, '勿忘我', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaek6iblXLMatSicloeKfk2dgjeRZziaj46yfaj5VB6HF0s4BovnxJMl0OEmQ7rPh4ZrqHDPJYBI8u5G/0', null, null, null, '1', null, '1', 'oruQl1a_xuMEFmbJxwCrteumhOeE', '2017-07-25 22:03:21', '2017-07-25 22:03:21', null);
INSERT INTO `wc_users` VALUES ('656', '111111', null, null, null, '$2y$10$AcSdxti7KHUakU61bSAsc.XMVBWsMk8e3ZUiYAvU/WUUwxlR5ZZkm', 'kBDOynDk6UAd08xfpsqRhEUHfzYU3JSr2MExNsEtySwZqeGyCrbI2VgvyBOz', '111111', null, null, null, null, '0', null, '1', null, '2017-07-26 11:24:02', '2017-08-03 15:20:14', null);
INSERT INTO `wc_users` VALUES ('657', 'oruQl1cxVaPFg7HyFzfM7nswrmxw', null, null, null, '', null, 'A-小映子。', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicEBBPDNo0lkejBRthtac3Bgp6OD7ialD5lXxUOrrYqBz5k1qbRs3yptttHjXvzLRwbn1YqgsII0ul/0', null, null, null, '2', null, '1', 'oruQl1cxVaPFg7HyFzfM7nswrmxw', '2017-07-26 13:55:19', '2017-07-26 13:55:19', null);
INSERT INTO `wc_users` VALUES ('658', 'oruQl1R7hxkDAfi-ndSZn2uhlKPA', null, null, null, '', 'HrkkYNXDrdTnF4IyBwfiWwMHtb9uy7AX14363aVk6nQqYQWsRF4xGuteYHCv', '蓝小小', 'http://wx.qlogo.cn/mmopen/gQQO820rz5VUo5mhjL5Uw3ibpT8YklOswiaWojojia53SrAjz2ic4cjP578S7a0icR83ejku5p5RNYDvw2bvGcfyY1w/0', null, null, null, '2', null, '1', 'oruQl1R7hxkDAfi-ndSZn2uhlKPA', '2017-07-26 13:57:21', '2017-07-29 11:28:35', null);
INSERT INTO `wc_users` VALUES ('659', 'oruQl1ams_5DvkI3st-9gdCxw19w', null, null, null, '', null, '曾佳敏', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3VO26qpnlibBm7SuS4s24Jhe4cL5JwCeTVo6xebmOLdMTRFricFAT0ujsdv89oyXuaVp9w6xiaQ1L0G/0', null, null, null, '2', null, '1', 'oruQl1ams_5DvkI3st-9gdCxw19w', '2017-07-26 13:57:39', '2017-07-26 13:57:39', '2017-07-26 14:10:32');
INSERT INTO `wc_users` VALUES ('660', 'oruQl1VuYgN_gZs6APk1kDMiRK8M', null, null, null, '', null, '旧时光-', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz4QFepKTrjyRrEYiciaTvsLDcSiclPQOZhgoJqTHY9OCOERMibj9JnSibX97U7QULBwoez035rnUggn2p/0', null, null, null, '2', null, '1', 'oruQl1VuYgN_gZs6APk1kDMiRK8M', '2017-07-26 13:59:52', '2017-07-26 13:59:52', null);
INSERT INTO `wc_users` VALUES ('661', 'oruQl1SxPWyZnvEoL6I6EcoXYlv4', null, null, null, '', null, '南方姑娘', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSadIG3271951kQDqKGfaz3J7IvXftELX7u5IYsmhGt0j9TJwJBCP46oOtulRKgtw61INGsu8kw1kr/0', null, null, null, '2', null, '1', 'oruQl1SxPWyZnvEoL6I6EcoXYlv4', '2017-07-26 13:59:58', '2017-07-26 13:59:58', null);
INSERT INTO `wc_users` VALUES ('662', 'oruQl1T748wuuQEuCA6x-U_yQMyc', null, null, null, '', null, '陈静', 'http://wx.qlogo.cn/mmopen/YW4c50BwHwibnXGejsBux0Ph90rmJhrrrUDafzoJRAcCHDrsRTodBiaMyv9PicolXKWR5OrxvT9icNyXRx514FdL5Bl3bxBGzpXX/0', null, null, null, '2', null, '1', 'oruQl1T748wuuQEuCA6x-U_yQMyc', '2017-07-26 14:00:26', '2017-07-26 14:00:26', '2017-07-26 14:14:14');
INSERT INTO `wc_users` VALUES ('663', 'oruQl1X6dTuiss5ivSPoH_p7tH3E', null, null, null, '', null, '喵', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz8ovAVodwSm68FdZPvqVRVgANnaXwsZ7tydsTLzI22j2tZZZe5EjJCPQ15va6lOP0kLuoFVx3swb/0', null, null, null, '1', null, '1', 'oruQl1X6dTuiss5ivSPoH_p7tH3E', '2017-07-26 14:00:35', '2017-07-26 14:00:35', '2017-07-26 14:13:40');
INSERT INTO `wc_users` VALUES ('664', 'abc1', null, null, null, '$2y$10$nT65amQF6mFtOjbYyi4ueOhnhXyUGA3c2Hr3hoio9XH5KpikmWGCa', null, '演示管理员', null, null, null, null, '0', null, '1', null, '2017-07-26 14:07:48', '2017-07-26 14:07:48', null);
INSERT INTO `wc_users` VALUES ('665', 'oruQl1cONsAvVFUc61zlBXrW0dxc', null, null, null, '', null, 'Sally', 'http://wx.qlogo.cn/mmopen/gQQO820rz5U3MrTWCibKWpFBxBjfNL4NqaPu3oNPTIyQdHVpQtO2icfKI2L6q7Z23wNlIkj2cGRgymDCqFGicVTSTyicnmqfpjm2/0', null, null, null, '0', null, '1', 'oruQl1cONsAvVFUc61zlBXrW0dxc', '2017-07-26 15:18:39', '2017-07-26 15:18:39', null);
INSERT INTO `wc_users` VALUES ('666', 'oruQl1ef1KklwA1gJAPK6QXaO2bI', null, null, null, '', null, '。。。', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3fRo6y4mpI4yWnLVuS3xLt77N5vrZRiciaqsvL9bk3SD5eRz8ESq0aTWleBnGNaCx1SrDpCiajTROI5/0', null, null, null, '2', null, '1', 'oruQl1ef1KklwA1gJAPK6QXaO2bI', '2017-07-26 15:36:18', '2017-07-26 15:36:18', null);
INSERT INTO `wc_users` VALUES ('667', 'oruQl1Req_3VoA-15yqk8f6KXYJU', null, null, null, '', null, '金色领子的小柯南', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaeibdXKKiaT43JXhSPnj4HjPv8QiaXG64mVVyuereqqB6Vmkvic75Ijz4GSnryBOjGtnbiaG88j4otKMAL/0', null, null, null, '0', null, '1', 'oruQl1Req_3VoA-15yqk8f6KXYJU', '2017-07-26 16:10:31', '2017-07-26 16:10:31', null);
INSERT INTO `wc_users` VALUES ('668', 'oruQl1fDATNc6s9wkn-GEl7QgQII', null, null, null, '', null, '許憼鋒', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3VGKnu2l6gdtdmkhfjbM6uqUOHEfH3lLlIU7WpvYaPSmiboYB9m8ZfFfIXx9xFcAUR2TyKs67o0kI/0', null, null, null, '1', null, '1', 'oruQl1fDATNc6s9wkn-GEl7QgQII', '2017-07-26 16:10:34', '2017-07-26 16:10:34', null);
INSERT INTO `wc_users` VALUES ('669', 'oruQl1cmbCw7OyMdTEb9kWTNhPyw', 'zhengxiudong@12t.com', '18960045275', null, '', null, '奶酪墙上的小矮人', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB31fGBGIw5MjCfuDEom4icMHgy0DPCa7uuJso8M57T06CCicss0R5S5hO9XrDtF9cMAl4v8vEYxaCw/0', null, null, null, '2', null, '1', 'oruQl1cmbCw7OyMdTEb9kWTNhPyw', '2017-07-26 16:10:42', '2017-07-27 16:23:23', null);
INSERT INTO `wc_users` VALUES ('670', 'oruQl1W5-NinyX0iKJy04yBZ5jc8', null, null, null, '', null, 'A000000【百度】黄海龙18876261565', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM73CNibEeBTrM7byEIMMyL0IhwVxRrsTqyfF15hw6icT2ysOBJibhP7e8TqqjwU6YZmkvBmKAylUY6aDV5bc0Y3yHN7PkjPJPEDqI/0', null, null, null, '1', null, '1', 'oruQl1W5-NinyX0iKJy04yBZ5jc8', '2017-07-26 16:11:16', '2017-07-26 16:11:16', null);
INSERT INTO `wc_users` VALUES ('671', 'oruQl1SqytXmepN1MR5_8sA2Xbuk', null, null, null, '', null, 'AAA福建百度网站陈自力15959959179', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAMBAhde57otZLqeOrczpHAyIIiaqjSiawQzibWtzicicibkicJc7rjkC7zZWRuLLwXHKjU3Sdf4Y7nRz7MA/0', null, null, null, '1', null, '1', 'oruQl1SqytXmepN1MR5_8sA2Xbuk', '2017-07-26 16:11:38', '2017-07-26 16:11:38', null);
INSERT INTO `wc_users` VALUES ('672', 'oruQl1Q6MHSPRgAlTDQrYg2RSBNM', null, null, null, '', null, '百度@第五正直', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEITI9gmPD34eRd2ugsejkrTkkUdXQrsmfg7ey0SRbcPDu2NtTribkRGHtqSk6KfB8QEMVNSTVz7okQ/0', null, null, null, '1', null, '1', 'oruQl1Q6MHSPRgAlTDQrYg2RSBNM', '2017-07-26 16:11:48', '2017-07-26 16:11:48', null);
INSERT INTO `wc_users` VALUES ('673', 'oruQl1TDHU9cSrYDYyq4EDoQwrtU', null, null, null, '', null, '百度推广何俊', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaZR0Iwwg4m2kZTmFTCOGAe50Zr1t9YeY0CR5icC6Bib7obHHsV66gcr5J4Eib9djibA1uLWj1IhZjhq0/0', null, null, null, '1', null, '1', 'oruQl1TDHU9cSrYDYyq4EDoQwrtU', '2017-07-26 16:12:22', '2017-07-26 16:12:22', null);
INSERT INTO `wc_users` VALUES ('674', 'oruQl1dW19OMB2wt8MmJzVPXNlwM', '599273995@qq.com', '15359222527', null, '', null, '缝中的一束阳光', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM73CNibEeBTrM7byEIMMyL0IEsZMP8AmWoveV24XT0kbCTfD6wKnn9JicbX9PZjzJg17uhhPl2Q5ZWTJldCQczeFDYMctXI5BEM4/0', null, null, null, '1', '给生活留点空白～Q_Q', '1', 'oruQl1dW19OMB2wt8MmJzVPXNlwM', '2017-07-26 16:12:38', '2017-07-26 16:28:20', null);
INSERT INTO `wc_users` VALUES ('675', 'oruQl1emRcidWEpwFKnedsDE2nkw', null, null, null, '', null, '百度推广郑桦东', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaexJQ852IPZxpIuGPSeic3j7kYZibamcB6Mas1ia6iaFWZgZia9desn8oc6spY6GwhVYbkWNuSyHlOl1n2/0', null, null, null, '1', null, '1', 'oruQl1emRcidWEpwFKnedsDE2nkw', '2017-07-26 16:13:18', '2017-07-26 16:13:18', null);
INSERT INTO `wc_users` VALUES ('676', 'oruQl1cI1GSZJi602it9TyukSh5E', '2770106967@qq.com', '18359887263', null, '', null, '百度营销经理郑浪', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaZSeNibJ2OGz5G0vZjU4VhAo6UV455XlNz1EAPDNXhsL0NyjIwFPZTIs2OFAiathAHSjiaDCl9PWChG/0', null, '晋江国贸大厦', null, '2', '越努力，越幸运！', '1', 'oruQl1cI1GSZJi602it9TyukSh5E', '2017-07-26 16:14:11', '2017-07-26 16:21:42', null);
INSERT INTO `wc_users` VALUES ('677', 'oruQl1bl_2roXL5ZC5S81Xd2OUDA', 'Xuxy@12t.cn', '13606098429', null, '', null, '睿 凯', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6rpfBWhsPK2PEyvCz54N1qk8zjIDJcV2BoekJwIdQIpyKkxG3hzB3E7pO4uhQYpXWljwJsv0SXrw/0', null, '厦门软件园二期观日路36号201单元', null, '1', null, '1', 'oruQl1bl_2roXL5ZC5S81Xd2OUDA', '2017-07-26 16:15:22', '2017-07-26 16:21:07', null);
INSERT INTO `wc_users` VALUES ('678', 'oruQl1S-b5HSU63mi1KJMQrtGXFo', null, null, null, '', null, 'Jerry H.', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaV4AdkxrLy7GnrzGpUibnQsVBuv32ia9NycBNQDmP5EicK2tRV6uzjm1YhA9lxJbria8PyA8lwgZdcnx/0', null, null, null, '1', null, '1', 'oruQl1S-b5HSU63mi1KJMQrtGXFo', '2017-07-26 16:15:29', '2017-07-26 16:15:29', null);
INSERT INTO `wc_users` VALUES ('679', 'oruQl1alD2VSTN32nJ_Ipl4MobUA', 'jiangyan@xm12t.com', '18094159556', null, '', null, '江妍', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3S8yce8x9yd0WWqWdwKMqN9YoNfWSKLrkxN9o72xI3F2qkYxsRPVx7ggfLxRm1nn9cTM3u0zLNkia/0', null, '思明区', null, '2', 'StuDy timeS', '1', 'oruQl1alD2VSTN32nJ_Ipl4MobUA', '2017-07-26 16:15:48', '2017-07-26 17:05:31', null);
INSERT INTO `wc_users` VALUES ('680', 'oruQl1escbHrxhy5vP8qKad4Ztoc', 'xuting@xm12t.com', '17750594807', null, '', null, '许婷', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae0LnKghc9cteM0XGluVIpcSbiaPVJHF9907ic4JJ9CeUIBiaFSPIkaVv8Gx4FOCeXftMUIDygENz4jH/0', null, '圣托里尼', null, '2', '如果这相差的时间可以折叠，我们就相遇。', '1', 'oruQl1escbHrxhy5vP8qKad4Ztoc', '2017-07-26 16:16:12', '2017-07-26 18:33:58', null);
INSERT INTO `wc_users` VALUES ('681', 'oruQl1XHDr7cGfN3yEK_jMfWcpXI', null, null, null, '', null, '百度推广&信息流魏重阳', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3Wbrv5ibAvxG1vKzx49xbHsC2on4CIC4DrRkYyTgJHicDHkeibyfzpRu62jhQWGdnNw37OoDafuIgVs/0', null, null, null, '1', null, '1', 'oruQl1XHDr7cGfN3yEK_jMfWcpXI', '2017-07-26 16:16:14', '2017-07-26 16:16:14', null);
INSERT INTO `wc_users` VALUES ('682', 'oruQl1XsHxAsRsCib3zvMixsLeZY', 'caomiaoxue@12t.com', '13860474348', null, '', null, '曹妙雪', 'http://wx.qlogo.cn/mmopen/gQQO820rz5VTe7E8YicJqHFH3zhgMuQgNIjqgia8tibIJf9A0IHkXV5haHr3ibw7SDSAfJYcnblxIHgbuib5pmHibtibv8y2Xq7omRv/0', null, null, null, '1', null, '1', 'oruQl1XsHxAsRsCib3zvMixsLeZY', '2017-07-26 16:16:41', '2017-07-26 16:26:50', null);
INSERT INTO `wc_users` VALUES ('683', 'oruQl1ZDneGHdly1CYTvCatyE1Kg', '1045976910@qq.com', '15959450472', null, '', null, '傅福汉', 'http://wx.qlogo.cn/mmopen/YW4c50BwHwibvOjQnJRUYxbEzm6K3ZficMWRe9sgpwdnaDojvTBAq0PYC6X1H2KGPASMKzRTb1syHiaLibFzYTwAbdP5icUEicNH5y/0', null, null, null, '1', null, '1', 'oruQl1ZDneGHdly1CYTvCatyE1Kg', '2017-07-26 16:16:42', '2017-07-26 16:22:42', null);
INSERT INTO `wc_users` VALUES ('684', 'oruQl1Tsqz9nkiBEj6OathQdaLsQ', null, null, null, '', null, '????', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaYiauRI3gIpjGMsnBOVKPVx0DR0iacnRxxvffSDtJBiczJJBKHOksPib5ErSYc0QGygQPhmqGRLPCD0c/0', null, null, null, '2', null, '1', 'oruQl1Tsqz9nkiBEj6OathQdaLsQ', '2017-07-26 16:18:14', '2017-07-26 16:18:14', null);
INSERT INTO `wc_users` VALUES ('685', 'oruQl1cHusSZ3976lrRAWoJGz4lI', '3326528874@qq.com', '13646071723', null, '', null, '百度℡-苏丽珍', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicBia5EpDoXBzOiayTlpOr83QEjLErYjg1fdfat5gdqNo2yY0YSoDBh1SQK73GB7AJkaIRlYeZHYrbT/0', null, '软件园二期观日路36号201百度营销中心', null, '2', '百度推广，官网，信息流，网站，G宝盆。。。。。。', '1', 'oruQl1cHusSZ3976lrRAWoJGz4lI', '2017-07-26 16:18:25', '2017-07-26 16:32:16', null);
INSERT INTO `wc_users` VALUES ('686', 'oruQl1TPRhfCAv9lfMcuOPqdNfr8', 'cs6@12t.cn', '13400658506', null, '', null, '王月', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3VXeG4ffwrLBZcNzBXUxDsBoQ9PicWuv66GLjFdA2xUgAhAibHrNF6O4rsx13211m8bYOfSTgLxX0m/0', null, null, null, '0', null, '1', 'oruQl1TPRhfCAv9lfMcuOPqdNfr8', '2017-07-26 16:19:23', '2017-07-29 09:44:56', null);
INSERT INTO `wc_users` VALUES ('687', 'oruQl1b6rYa7kLg4MmZQ8R3vG7tQ', null, null, null, '', null, 'monstre', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae9JYiaBMhnY6giatjk5AwoRxx3XxZwKKj5hEGdl9dSPicpPzibiaeMAPN1GSGhumZjHL5PD7BLopFmVKH/0', null, null, null, '2', null, '1', 'oruQl1b6rYa7kLg4MmZQ8R3vG7tQ', '2017-07-26 16:19:42', '2017-07-26 16:19:42', null);
INSERT INTO `wc_users` VALUES ('688', 'oruQl1Xr2IIRa2L7ORTzbOsAcPR4', null, null, null, '', null, '厦门百度@潘彬', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCTp33BC7lGPXXj620qV29wMG1gV6l6uh4FZdiaaHicia0j8spvpJSbpUicUmF7nA04ibvgxqQMfyXjdYB8yYraDiaQBvVeJiapx9nG6I/0', null, null, null, '1', null, '1', 'oruQl1Xr2IIRa2L7ORTzbOsAcPR4', '2017-07-26 16:19:52', '2017-07-26 16:19:52', null);
INSERT INTO `wc_users` VALUES ('689', 'oruQl1V2ESw52swmjpZGrHhiJyeM', '631345277@qq.com', '15080318037', null, '', null, '赖春连', 'http://wx.qlogo.cn/mmopen/YW4c50BwHwicKJpGRYBPWvZ2Z11rpxaK4JnkPagIibc4UMmjUibr3qAGEfZibPqS2Hm6SIU044riakPvRH1D1aWIrG4tV7qolPOc2/0', null, '厦门市湖里区', null, '2', '没个性不签名！', '1', 'oruQl1V2ESw52swmjpZGrHhiJyeM', '2017-07-26 16:20:53', '2017-07-27 16:22:30', null);
INSERT INTO `wc_users` VALUES ('690', 'oruQl1a2Zo6fh6PisbrhI8x0wi8E', null, null, null, '', null, '丽媛', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3XQ2vtB68hCbkEo0xjFBicSsy2b5l5oU65tiaCXsHUfyoYOxA05SpE0Q8ctZp7QAlPvDAOIekTRxyL/0', null, null, null, '2', null, '1', 'oruQl1a2Zo6fh6PisbrhI8x0wi8E', '2017-07-26 16:21:28', '2017-07-26 16:21:28', null);
INSERT INTO `wc_users` VALUES ('691', 'oruQl1aR0FQE6UNel35Qr9VzY8SU', null, null, null, '', null, '牙牙', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDoibwZOicYTkk7Qb3Vyc2c3Gcj2QhDPukZ4svAVg5kAmtRGDn8IfCXSpmD1maYcO9v1W4e6yJDGs6w/0', null, null, null, '2', null, '1', 'oruQl1aR0FQE6UNel35Qr9VzY8SU', '2017-07-26 16:21:43', '2017-07-26 16:21:43', null);
INSERT INTO `wc_users` VALUES ('692', 'oruQl1R5q0Md_OGyosfZWzn0J278', null, null, null, '', null, 'if', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3TF9dP2xtRjzs0TibQK2elKTVRjm7SKSQeYIMVdCAGUcqricugjy3Pkia5O656KmiaYeNrJLgUnGd8Ue/0', null, null, null, '2', null, '1', 'oruQl1R5q0Md_OGyosfZWzn0J278', '2017-07-26 16:22:30', '2017-07-26 16:22:30', null);
INSERT INTO `wc_users` VALUES ('693', 'oruQl1YmuPaJyG7NhDOfchbD22HY', 'yangdf@12t.cn', '15859245649', null, '', null, '杨丹凤', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaeibXibFnJc2bZ7gPbz6nSDxa0PJticfUicFPq6CxkcxicWX8bjyOBYTA3HJyXbdgnDzr47DckXLLyF1qY/0', null, '厦门软件园二期观日路36号201', null, '2', '好心情', '1', 'oruQl1YmuPaJyG7NhDOfchbD22HY', '2017-07-26 16:23:14', '2017-07-26 16:29:08', null);
INSERT INTO `wc_users` VALUES ('694', 'oruQl1bD1JyP4T3VHLeCC4lm4qbE', null, null, null, '', null, '何为兮', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3Sh6IRSOp42voZ1PyJkRspgeYicVCExQvtsV7XNQPfXsPzvAdLNIx0ic9CoYGWPdhqbNsZy4KmTOqr/0', null, null, null, '1', null, '1', 'oruQl1bD1JyP4T3VHLeCC4lm4qbE', '2017-07-26 16:24:33', '2017-07-26 16:24:33', null);
INSERT INTO `wc_users` VALUES ('695', 'oruQl1X4yB4IzwchB3fDI9wZeNBs', 'xiaoyuemei@xm12t.com', '13959238510', null, '', null, '小葵', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz37tytOAbMDJgqpgeen1UfMaUicIHLUciaKW3Em9TlalMX0AczEShsEyC2Q77HgAHXOWMmraaRqDZQ/0', null, null, null, '2', null, '1', 'oruQl1X4yB4IzwchB3fDI9wZeNBs', '2017-07-26 16:24:46', '2017-07-27 16:42:04', null);
INSERT INTO `wc_users` VALUES ('696', 'oruQl1Vei4pr4AZUafQNPDgHqAqw', null, null, null, '', null, '小e', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7b0X8uEsjM2SnsiaUZVLciazrmItJFXIZPHiblgw9TW5HoLpx5SMpXsnkSjozoQicJu8bqbkNbevQu4g/0', null, null, null, '2', null, '1', 'oruQl1Vei4pr4AZUafQNPDgHqAqw', '2017-07-26 16:25:00', '2017-07-26 16:25:00', null);
INSERT INTO `wc_users` VALUES ('697', 'oruQl1ZV2BK70KxRgSKjY8X5YIW4', null, null, null, '', null, '曾星星的海角', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDF0YK7MGibsibAVojtknP6aaIRbYqn9Pfc9loPNfV5EJXqrOkQZOt2eaGrT4bHKGS3gvT8PSAwdIDg/0', null, null, null, '1', null, '1', 'oruQl1ZV2BK70KxRgSKjY8X5YIW4', '2017-07-26 16:25:07', '2017-07-26 16:25:07', null);
INSERT INTO `wc_users` VALUES ('698', 'oruQl1RLKcVROu-DjhzvQ_sXw6Zs', null, null, null, '', null, '风一样的老娘  ', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8dZb6pCdRn7KhLibUpia5HkzHE9reuSF0aGh0zibEn7DCFEk8Q0xEaOaOwEcMDF4muChnZ0gdoWsS5QA/0', null, null, null, '2', null, '1', 'oruQl1RLKcVROu-DjhzvQ_sXw6Zs', '2017-07-26 16:26:25', '2017-07-26 16:26:25', null);
INSERT INTO `wc_users` VALUES ('699', 'oruQl1R1uRi2_vU6fO6IIe8JCrNM', null, null, null, '', null, '.. ..   E  O', 'http://wx.qlogo.cn/mmopen/YW4c50BwHwicT5ibp5PFUwHQHosf5FKibSctxxvvXsyt4exZibicD2qrhOyrMyLoMT3hoYZZekkTibmibHIC6ibQ0jyicSTwTE9wx0ahS/0', null, null, null, '0', null, '1', 'oruQl1R1uRi2_vU6fO6IIe8JCrNM', '2017-07-26 16:26:50', '2017-07-26 16:26:50', null);
INSERT INTO `wc_users` VALUES ('700', 'oruQl1QjsKqf0io7jb7UeEXHNj3g', null, null, null, '', null, '燕', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaYud503D1iad5XBgIT4zNToGOn46DCw3icId4XAic9N2YPKsuvq29yDTDSUpBf1JpOYxcA5Dal8mLpt/0', null, null, null, '2', null, '1', 'oruQl1QjsKqf0io7jb7UeEXHNj3g', '2017-07-26 16:27:03', '2017-07-26 16:27:03', null);
INSERT INTO `wc_users` VALUES ('701', 'oruQl1ecFf-kOaYzpRDYc4qoocFQ', '1175921293@qq.com', '18030137801', null, '', null, '大欢', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz9aMA3mgGtGMCGO0aSOdc6eicXEPx5hTSoeW1016RAVrAorXp6ShCNQR4SAqEGQMzTrTAPibGSDNaE/0', null, null, null, '2', null, '1', 'oruQl1ecFf-kOaYzpRDYc4qoocFQ', '2017-07-26 16:27:04', '2017-07-27 16:44:36', null);
INSERT INTO `wc_users` VALUES ('702', 'oruQl1QLOG_L2CtRnpSwk1_u-6iA', 'linxiaomei@xm12t.com', '13599851823', null, '', null, '林晓梅', 'http://wx.qlogo.cn/mmopen/rYqlKVibmt5TD6MyradoRnqyHgNvAiaFHrvTkqky8VYhgxfCCgQupkibEaxLLX0HYgzIworWfNEcwwG2jwMLOtiaSmXFZcwsQBeB/0', null, '软件园二期观日路36号', null, '2', '太个性不签名', '1', 'oruQl1QLOG_L2CtRnpSwk1_u-6iA', '2017-07-26 16:27:10', '2017-07-26 16:31:59', null);
INSERT INTO `wc_users` VALUES ('703', 'oruQl1Sm7ct9Pf8-sQVSj4HFgM7M', null, null, null, '', null, '叶惠', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3T3YC8yrkPCk4pDGfPQXoeB93MjDRco4peuxoc39E3Qg1glJ1layEQqkbjxOT6ZfaLlQeWibL2Gus/0', null, null, null, '2', null, '1', 'oruQl1Sm7ct9Pf8-sQVSj4HFgM7M', '2017-07-26 16:27:18', '2017-07-26 16:27:18', null);
INSERT INTO `wc_users` VALUES ('704', 'oruQl1QWib62wWwztiPIaNiMPnpQ', null, null, null, '', null, '汤汤汤', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae7pvPwcibAlNU7ibQhicEw9TANtsFu6twhuNaTEl867uC2IibYKF9Zz2hagibA2PeRFPUpNdKsTdREn6t/0', null, null, null, '2', null, '1', 'oruQl1QWib62wWwztiPIaNiMPnpQ', '2017-07-26 16:27:46', '2017-07-26 16:27:46', null);
INSERT INTO `wc_users` VALUES ('705', 'oruQl1cjyoW4B5GoG6TuhZE0I3aI', null, null, null, '', null, 'Yayo静????', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae2lrUU4twZB6DqFQiag6nJAhrmFCOiaU0Gu0TJrj4qtDjEhicNG5hggbOFCOsFRwRtXy25dFa4jPnaI/0', null, null, null, '2', null, '1', 'oruQl1cjyoW4B5GoG6TuhZE0I3aI', '2017-07-26 16:28:00', '2017-07-26 16:28:00', null);
INSERT INTO `wc_users` VALUES ('706', 'oruQl1czSIUV3FX51hGDyN8FyYO8', null, null, null, '', null, '魔王', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKOI9CiaPHpDvsoCEfkDdfrjdxbJBn7TIaLVjgxiboTic0evGThYLLJ4ZMN9ThEfOb3kKP2UyNZTYia6Q/0', null, null, null, '2', null, '1', 'oruQl1czSIUV3FX51hGDyN8FyYO8', '2017-07-26 16:29:22', '2017-07-26 16:29:22', null);
INSERT INTO `wc_users` VALUES ('707', 'oruQl1YNiKC3EmWt2QalqF2P7uvk', '404053012@qq.com', '18758589868', null, '', null, '代玉', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCc1R04aEzJNrV0zIibBrHMBtkBXmlcgz57qDkPZ6F3LRH8usDCKEjaE31HkKMO2pFme3boHovPzDmhC83f11eSD93z4cYlO46A/0', null, '福建省厦门市观日路36号201', null, '2', '代玉', '1', 'oruQl1YNiKC3EmWt2QalqF2P7uvk', '2017-07-26 16:29:40', '2017-07-26 16:33:18', null);
INSERT INTO `wc_users` VALUES ('708', 'oruQl1S4fpJ8poI_0jExQ4tUW8aM', '1203264085@qq.com', '15860796650', null, '', null, 'L-SHAOJIN', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae61UJRUmbYQpBicNUqPHj1W6W7aaALHmdy0WtA2lnbHBgW9py1U7cVaGgUAE88CwpLvbc2SIu7T0L/0', null, null, null, '2', null, '1', 'oruQl1S4fpJ8poI_0jExQ4tUW8aM', '2017-07-26 16:30:04', '2017-07-27 16:43:23', null);
INSERT INTO `wc_users` VALUES ('709', 'oruQl1czAy8ChmcOvaKMxxdEtzmQ', null, null, null, '', null, 'Something', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae50KTyGGv9ZUuTp9P9o7tIO6NyicqzG2ZCJW5JhicvNPQCURIe3icnkfgJEB2UIm7g4wRWGykEib3aot/0', null, null, null, '2', null, '1', 'oruQl1czAy8ChmcOvaKMxxdEtzmQ', '2017-07-26 16:30:18', '2017-07-26 16:30:18', null);
INSERT INTO `wc_users` VALUES ('710', 'oruQl1SIeARweEFq6Qaic7CbZVoo', null, null, null, '', null, 'alina木子婷', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI68do8XibE21htWSc0QyZWP5icg76veNA5Zgfia2Nwicic4540WXiaC9yEF4gjFAicp385kHCOuayic4eYYA/0', null, null, null, '2', null, '1', 'oruQl1SIeARweEFq6Qaic7CbZVoo', '2017-07-26 16:30:40', '2017-07-26 16:30:40', null);
INSERT INTO `wc_users` VALUES ('711', 'oruQl1X4u7yPAtYWXESFjvRQwFG8', null, null, null, '', null, 'Lapland 。', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3a9rk1gAQXib6ku4wDs2N8dFHOLR8EKeSnFiaxJEeCOfQl3kB2rEBoQw1VvrkgatqLuMFUToM2kXp3/0', null, null, null, '2', null, '1', 'oruQl1X4u7yPAtYWXESFjvRQwFG8', '2017-07-26 16:30:47', '2017-07-26 16:30:47', null);
INSERT INTO `wc_users` VALUES ('712', 'oruQl1aeoM1CrrMEWcZGrQ1renXE', null, null, null, '', null, '记忆如画520', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJeNwmUP75xFf8dGDSVbvIJzBuHeTxKPQsmsmWnhibymkMhLsicPQpaVhrxMy0JYoMmVSXpbIsbp8Dw/0', null, null, null, '2', null, '1', 'oruQl1aeoM1CrrMEWcZGrQ1renXE', '2017-07-26 16:30:50', '2017-07-26 16:30:50', null);
INSERT INTO `wc_users` VALUES ('713', 'oruQl1R_ffIXkSVE9pZIls0uqM68', null, null, null, '', null, 'Miszly-莉莉酱', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae5icaNyHSmKPGUlGVYWykesjsjBwxHOc00vgbLww4hmTYABbABMv1hGf995lwrFyFfLxYUgf58rSB/0', null, null, null, '2', null, '1', 'oruQl1R_ffIXkSVE9pZIls0uqM68', '2017-07-26 16:31:05', '2017-07-26 16:31:05', null);
INSERT INTO `wc_users` VALUES ('714', 'oruQl1X3uVVoCdHHAyqeyyjGOh7U', 'laiyuqin@xm12t.com', '18950169736', null, '', null, 'Only', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaTcMm1wyhNhic9Z0M42NMmAz3hiccCyiaHjCZBpLnKX6cxpyxGG55ibDyKs77w2bsKiac5icibaKAGcs30C/0', null, null, null, '2', null, '1', 'oruQl1X3uVVoCdHHAyqeyyjGOh7U', '2017-07-26 16:31:12', '2017-07-26 16:40:22', null);
INSERT INTO `wc_users` VALUES ('715', 'oruQl1cli5V1CfJJy4NcPe5QqDyQ', null, null, null, '', null, '笑对人生', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaexxCzaByw26Hvbn5ricKBuicJePomJm1Wjl6vnxQgk6XCic0tZ6sicmrCfba5d2poxExNBMNSic96eYAr/0', null, null, null, '2', null, '1', 'oruQl1cli5V1CfJJy4NcPe5QqDyQ', '2017-07-26 16:31:22', '2017-07-26 16:31:22', null);
INSERT INTO `wc_users` VALUES ('716', 'oruQl1aYuBVcDD2l2i53WxGwmwb4', null, null, null, '', null, '瓷', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSacQAkMSf7iafREia05E0Zr7YWsriblUnsr1Bqwy1aVhG6YftaPolzpxAYiaLngJBWtaIpODVQsAUwUFM/0', null, null, null, '2', null, '1', 'oruQl1aYuBVcDD2l2i53WxGwmwb4', '2017-07-26 16:31:23', '2017-07-26 16:31:23', null);
INSERT INTO `wc_users` VALUES ('717', 'oruQl1d8K4TWRLePLebkmXUc4_Ys', 'cs77@xm12t.com', '15859269129', null, '', null, 'Jane', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzzntHwJ27xjNs5iavaI4ciabMicGwcuRb7JHnfbvItundSvficyXjrVic0NENMer2YA1pcFEHJq1lPXZS/0', 'uploads/user/717/img1503386228.jpg', null, null, '2', null, '1', 'oruQl1d8K4TWRLePLebkmXUc4_Ys', '2017-07-26 16:31:33', '2017-08-22 15:54:13', null);
INSERT INTO `wc_users` VALUES ('718', 'oruQl1atSqykt-JOcBdofwdpqVDk', null, null, null, '', null, 'Jeson', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae7NGCkPZQn4thyOYiamiadfDKYN9sXDTWyqerd4yB49ZNG22tCoVOBYJzrzESBbTAIdRlmP7faX1Y6/0', null, null, null, '0', null, '1', 'oruQl1atSqykt-JOcBdofwdpqVDk', '2017-07-26 16:33:00', '2017-07-26 16:33:00', null);
INSERT INTO `wc_users` VALUES ('719', 'oruQl1ahYY_YtfBXls4NvHQEr2FY', null, null, null, '', null, 'lucky', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6PoiaXXsicmB19kFygsIJHl31SK6mZdWXknLQC2nREanW2LbNxo8j8Xmxic34MSjYQe1Sn2plfFwgkA/0', null, null, null, '2', null, '1', 'oruQl1ahYY_YtfBXls4NvHQEr2FY', '2017-07-26 16:33:48', '2017-07-26 16:33:48', null);
INSERT INTO `wc_users` VALUES ('720', 'oruQl1fD0T7TitC7eA2ugJWJ4a7E', null, null, null, '', null, 'A整合营销，__郑景景（百度推广）', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEICVYwKVF89icv2EDUyrL3vmWnNVksgKh7yQ26JKLJv63uUWBxdiaOXA28vJwE9cic7O6DdRTibQDDVLQ/0', null, null, null, '1', null, '1', 'oruQl1fD0T7TitC7eA2ugJWJ4a7E', '2017-07-26 16:33:55', '2017-07-26 16:33:55', null);
INSERT INTO `wc_users` VALUES ('721', 'oruQl1fLBxVtg11bqRpK6w0jp45M', '768225990@qq.com', '15859183502', null, '', null, '罗秀才', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuR9XZGiboRR5VFebkMJBDvjDJksArPaO74yOVtzOX6RaTygts24kKIFgIKEQM40kR0ts4dCyyeFtZQ/0', null, '', null, '2', null, '1', 'oruQl1fLBxVtg11bqRpK6w0jp45M', '2017-07-26 16:34:21', '2017-07-26 16:44:39', null);
INSERT INTO `wc_users` VALUES ('722', 'oruQl1cUUde4JeadnQIacZeN3nYQ', null, null, null, '', null, '我不是阿凡提', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuTtXvrt0QPr13wRQLuLuHibkQym3ibPspmk6BRflNxbzDZLFpicDZZib1KIIWDKmicZs5sE5BlQfecJg3TILUBn5cpYg/0', null, null, null, '2', null, '1', 'oruQl1cUUde4JeadnQIacZeN3nYQ', '2017-07-26 16:35:00', '2017-07-26 16:35:00', null);
INSERT INTO `wc_users` VALUES ('723', 'oruQl1V4d-l6uEJ-1Iu_lbOqSjd8', null, null, null, '', null, '躲起来', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaVFqdXW5clQjJvSQsmG31HqoUicxlLa7Tcx8liamldlzWcx6LXWMNryayicePMtL1Z7TTHRmWBvt133/0', null, null, null, '2', null, '1', 'oruQl1V4d-l6uEJ-1Iu_lbOqSjd8', '2017-07-26 16:35:37', '2017-07-26 16:35:37', null);
INSERT INTO `wc_users` VALUES ('724', 'oruQl1XP-wopl2jaZd9pwXP_sr_c', null, null, null, '', null, '????', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae7qwaYKdicjahCTzcOPHCeKO241Om0ePSPSe0TVQvBBQF8mGfkVicZibm821UxO0m3VibJq5aLBt4Pjk/0', null, null, null, '2', null, '1', 'oruQl1XP-wopl2jaZd9pwXP_sr_c', '2017-07-26 16:37:22', '2017-07-26 16:37:22', null);
INSERT INTO `wc_users` VALUES ('725', 'oruQl1bLzcS3ZG-2oH47pA5lcNhs', 'cs32@12t.cn', '15980938135', null, '', null, 'Panda', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSacyVXnoo3EialXhV09asG3DvSncGErlA6cL1eBlHgSrYthbsadcjXLbt2ibYogHy1qHbgLtJFiahfQv/0', null, null, null, '2', null, '1', 'oruQl1bLzcS3ZG-2oH47pA5lcNhs', '2017-07-26 16:38:24', '2017-07-27 16:41:11', null);
INSERT INTO `wc_users` VALUES ('726', 'oruQl1cZ5Kd9DysSeKDe6luVUYvg', null, null, null, '', null, 'A000百度丘连珍18359926128', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3YOsdFiahKSVmrIcArVQWEVgt5Lic1d5ibFJ9vmqb7nYfcCIftyGrBUK84FibhQ6IrUOKCBJJKicC39ZU/0', null, null, null, '2', null, '1', 'oruQl1cZ5Kd9DysSeKDe6luVUYvg', '2017-07-26 16:39:27', '2017-07-26 16:39:27', null);
INSERT INTO `wc_users` VALUES ('727', 'oruQl1YlvYs5BvpFTyIYuUflf1IU', null, null, null, '', null, 'A-YL', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzwTEXrdsH7YOabdxrDfCkZtvSdIc03WovSwL2B2jbjjYo8WM6DaXd8q6wBbzdbt8DICuCEgBB1icd/0', null, null, null, '2', null, '1', 'oruQl1YlvYs5BvpFTyIYuUflf1IU', '2017-07-26 16:41:12', '2017-07-26 16:41:12', null);
INSERT INTO `wc_users` VALUES ('728', 'oruQl1T6XJlGbGNqRZeaTpwnqRko', 'zhongzhuxuan@xm12t.com', '13385928316', null, '', null, '钟竹轩', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI5rKXKLKPTsK4G0Umic5fh7icATdicBOnQ0zYV0p6gXQ5RqYRt3E7icqEBgcdpDddVFeI6sTgicMeoR2w/0', null, '厦门软件园二期观日路36号之二201室', null, '2', null, '1', 'oruQl1T6XJlGbGNqRZeaTpwnqRko', '2017-07-26 16:41:22', '2017-07-26 16:45:44', null);
INSERT INTO `wc_users` VALUES ('729', 'oruQl1atYMzrmeBtZRqxsGVjCu8I', null, null, null, '', null, '哆啦A梦', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz6EPnrSo5NRpQQHOEJDicrLhAeuI6SXyLqTPRH5qnSm6GmXRIPQTc7tHFsjBEhBEeBmrPaiaMyElHt/0', null, null, null, '2', null, '1', 'oruQl1atYMzrmeBtZRqxsGVjCu8I', '2017-07-26 16:41:41', '2017-07-26 16:41:41', null);
INSERT INTO `wc_users` VALUES ('730', 'oruQl1RehCZonFs0lHdpdhDVueqU', null, null, null, '', null, '看我眼睛大不大', 'http://wx.qlogo.cn/mmopen/gQQO820rz5U9PHS1xuvHZQibZWr0U5h3UgO6e6ia4icIEibNyF1ibcVJlyWz9Scu1Zz0LQOdHBtk5CD4d8GagZqQvyg/0', null, null, null, '1', null, '1', 'oruQl1RehCZonFs0lHdpdhDVueqU', '2017-07-26 16:43:39', '2017-07-26 16:43:39', null);
INSERT INTO `wc_users` VALUES ('731', 'oruQl1be4WMSWaBAjLKxKlDbQH7U', 'linyanhua2@xm12t.com', '18059869261', null, '', null, '清灯', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBic0YpxMqfok0zaW0kRZ12ZA4aNQLb4BqjC2Wb87yKX3XiaYnhl4Pib62oiadh2ZMfp2ibRfdo682DDkg/0', null, '思明区软件园二期观日路36号楼之一201易尔通', null, '2', null, '1', 'oruQl1be4WMSWaBAjLKxKlDbQH7U', '2017-07-26 16:43:55', '2017-08-05 10:25:37', null);
INSERT INTO `wc_users` VALUES ('732', 'oruQl1dZpPDlEFRcU5QOW3ad1DbQ', null, null, null, '', null, '迪子', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3etqcPt1AU3jvDWjRHgUZL45zibwHkG0rISIVegC9ADmvicia5UneOiaWdibiaAxKvGopklWYz2T9dkDva/0', null, null, null, '2', null, '1', 'oruQl1dZpPDlEFRcU5QOW3ad1DbQ', '2017-07-26 16:43:59', '2017-07-26 16:43:59', null);
INSERT INTO `wc_users` VALUES ('733', 'oruQl1eYMV-E3yX_MDVzWqiH-s6w', null, null, null, '', null, 'YIWEI。', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIgykIgZFVF5y4YVZTiac915JG86ibQIM5TkVE4WEhEiaHfRTDqp8icSZ2S3oKqSS45HcF02IP7IrwCIQ/0', null, null, null, '1', null, '1', 'oruQl1eYMV-E3yX_MDVzWqiH-s6w', '2017-07-26 16:47:46', '2017-07-26 16:47:46', null);
INSERT INTO `wc_users` VALUES ('734', 'oruQl1T88jL-U8yXCKz8OTU8w6Og', null, null, null, '', null, '戴永清（海带）', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzicuXgYjJjGpTicSwRF0AAyN9tuGRUqricq2GJ9LohPO7uCv5qwq4Rytw62HGH9frjxCMQVhgTsCr3k/0', null, null, null, '1', null, '1', 'oruQl1T88jL-U8yXCKz8OTU8w6Og', '2017-07-26 16:47:52', '2017-07-26 16:47:52', null);
INSERT INTO `wc_users` VALUES ('735', 'oruQl1XkhK3KWkfPTsbpdU-smeXY', null, null, null, '', null, '陈美蕊', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzy94h0HUQ55Xib1Vnia9tWz6ic6kXjuXNtfkkHa5D1s3ZuUuPGvHDBSq2E60haIl5hg8OjA5q2diaoBp/0', null, null, null, '2', null, '1', 'oruQl1XkhK3KWkfPTsbpdU-smeXY', '2017-07-26 16:51:53', '2017-07-26 16:51:53', null);
INSERT INTO `wc_users` VALUES ('736', 'oruQl1fBRJqNmDf7rUdGHU2dFv_M', null, null, null, '', null, '????芒胖胖', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLASO1Btnr64Dj1cGsghaY37bvVR2oT0hs7E4cw5nibcWyRyzNT9h8LOX2wBLlqOIdjibGUfF8S2rAcQ/0', null, null, null, '2', null, '1', 'oruQl1fBRJqNmDf7rUdGHU2dFv_M', '2017-07-26 16:51:56', '2017-07-26 16:51:56', null);
INSERT INTO `wc_users` VALUES ('737', 'oruQl1RTe5t_kylw6iF-_CLJhl7I', '814621143@qq.com', '18202006611', null, '', null, 'Leelen陈', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3dgM1z0ibKcfQbyAibHMWR6Qe45qUyGeU727nMdVu9Jjichh7KvicibYeGibgQVTdg5nOJMoE1f8K3Tcmu/0', null, '天河区中山大道中1095号昇晖大厦702室', null, '1', null, '1', 'oruQl1RTe5t_kylw6iF-_CLJhl7I', '2017-07-26 16:55:37', '2017-07-28 11:08:17', null);
INSERT INTO `wc_users` VALUES ('738', 'oruQl1fYu-QIvVXH87A9P5avzym0', null, null, null, '', null, 'XJL', 'http://wx.qlogo.cn/mmopen/gQQO820rz5Xft2UlGx2jHD77Qc6MQsibpfFM0gC4rnmsT0UGApiaTMvMkSYbnOjicII3E1J4H8bkgE3USc1xEBeicg/0', null, null, null, '1', null, '1', 'oruQl1fYu-QIvVXH87A9P5avzym0', '2017-07-26 17:09:43', '2017-07-26 17:09:43', null);
INSERT INTO `wc_users` VALUES ('739', 'oruQl1Tqjy8ehLpFaj4068sgLFdU', 'zhangxinchao@xm12t.com', '18750817726', null, '', null, '张新朝', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaXnramPkCfpWfSGcrSvauKRicmLK5HESEI5e309GIdxYkmHmL2XkOR04QGAk1I0ZsafqLy3wYIt92/0', null, null, null, '2', null, '1', 'oruQl1Tqjy8ehLpFaj4068sgLFdU', '2017-07-26 17:09:47', '2017-07-26 17:12:12', null);
INSERT INTO `wc_users` VALUES ('740', 'oruQl1S2op2HqLUp8-JyUNNRu-Xc', '1361055458@qq.com', '18312168163', null, '', null, 'AK百度陈淑琴', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuRgUDzBKy1TIrcNES4k0vLkglCoS9r6OokOySg1vAAY43sZVYeicpnKSTfLaXwUQXsRuGgJSshdicdmpicw4NlzRK6/0', null, '惠州市惠城区华阳大厦24楼', null, '2', '坚持就是胜利', '1', 'oruQl1S2op2HqLUp8-JyUNNRu-Xc', '2017-07-26 17:11:29', '2017-07-26 17:15:54', null);
INSERT INTO `wc_users` VALUES ('741', 'oruQl1c34cP0j5wdVg0YoLWHveo0', 'luzhq@ydbaidu.com', '15217805191', null, '', null, '广东惠州百度卢竹青', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5GHpJIhJNrEWWqX9HKia3YzE022mIL1aluhm1l2hIryeB7yyaH0vevUvw6gonPHUiaPuEQqMWXj565mVaFFMaIYtuBLJ347MnO4/0', null, '惠城区演达大道华阳大厦24楼', null, '2', '百度一下你就知道', '1', 'oruQl1c34cP0j5wdVg0YoLWHveo0', '2017-07-26 17:12:46', '2017-07-26 17:14:13', null);
INSERT INTO `wc_users` VALUES ('742', 'oruQl1Y3Klgp5RAXMCwhYHxsUw_g', 'yuanppp@ydbaidu.net', '13413048488', null, '', null, '惠州百度袁培培', 'http://wx.qlogo.cn/mmopen/gQQO820rz5XvNYNuCSAMzzneQcRORYibuCmZXjHvT5icfGJeUAicK40tg1ibicnYxiaVZJAXTU46GcqL123kUN8wdlBQ/0', null, '广东省惠州市惠城区演达大道9号华阳大厦9号', null, '1', '负责惠州地区的百度推广，网站建设等百度相关业务', '1', 'oruQl1Y3Klgp5RAXMCwhYHxsUw_g', '2017-07-26 17:14:40', '2017-07-26 17:16:39', null);
INSERT INTO `wc_users` VALUES ('743', 'oruQl1cn400MwvJLE30WdJRcxuoU', '916122771@qq.com', '15207543837', null, '', null, '陈丽端', 'http://wx.qlogo.cn/mmopen/ibUnqQHib5IHw9JCkuMiaGXKKNW06DwzXLrHriaKNHTDNaDiag2icvD9m3pzCSUMAib5tv0EbFialaibC5tsbroaqbwZib6AzKjnZgFZJU/0', null, '汕头市金平区利鸿基大厦B栋20楼', null, '2', '所有美好的事情总会发生????', '1', 'oruQl1cn400MwvJLE30WdJRcxuoU', '2017-07-26 17:15:50', '2017-08-16 10:01:58', null);
INSERT INTO `wc_users` VALUES ('744', 'oruQl1feoYrlboz71lTokX85R6-M', null, null, null, '', null, '惠州百度翟欣瑜15118987007', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8e8soib73gwBnOic64nmJ9lHkTqaLnkjHdIFQUNuqGnQ2OwFiccKpvRon9HvYQ8Eial2EDFMqfEqEibrLziam3yrSbyQn/0', null, null, null, '0', null, '1', 'oruQl1feoYrlboz71lTokX85R6-M', '2017-07-26 17:16:16', '2017-07-26 17:16:16', null);
INSERT INTO `wc_users` VALUES ('745', 'oruQl1VQaEkeJvL8ueyNqsEVC7hA', 'xiebin@xm12t.com', '18150886385', null, '', null, '百度推广顾问_shrap  谢斌', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw81WCDHfZMUX482KHCXssWBLZuNd9NciakrD7m5WjMok5uiadgsrKcialicd5bQUCQvjlYaKUnmhKtQQNExbdWmzsrU/0', null, '厦门市思明区软件园二期观日路36号201单元', null, '1', '人生活的是经历，钱和时间都为经历服务，最宝贵的是经历。不要浪费你的经历，特别是不一样的经历。经历多了经历才会对，经历对了你要的东西就都自己出来了。', '1', 'oruQl1VQaEkeJvL8ueyNqsEVC7hA', '2017-07-26 17:19:06', '2017-07-26 17:24:19', null);
INSERT INTO `wc_users` VALUES ('746', 'oruQl1Uw4gRotuu4-yFo1vLDTLCM', 'huangzheny@xm12t.com', '13850133122', null, '', null, '黄臻宇', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8e8soib73gwBnOHzK907pJg3Ud0D0JWDSsTC6alDSwDWEA0kysx7v7qkFQQ9SEezM2bxm087ib75BngIg0HDVmr2w/0', null, null, null, '1', null, '1', 'oruQl1Uw4gRotuu4-yFo1vLDTLCM', '2017-07-26 17:21:47', '2017-07-26 17:22:46', null);
INSERT INTO `wc_users` VALUES ('747', 'oruQl1Xm2HiXPNrS6kCZ-kvF1MHM', '709606646@qq.com', '15606951231', null, '', null, 'J.K Kafka', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuSDwPQsv9nz6RUa9BJv0HjYyGv9pG0GOqs7kDB1eViaialCqccLHiaLztPcFqQQFOY4wbYyZnEIaftfWeNv5Q5vFEu/0', null, null, null, '1', null, '1', 'oruQl1Xm2HiXPNrS6kCZ-kvF1MHM', '2017-07-26 17:23:26', '2017-07-27 16:43:32', null);
INSERT INTO `wc_users` VALUES ('748', 'oruQl1aBkUc8F7AiKo6IDnEhC_38', 'huangtingting@xm12t.com', '15959446090', null, '', null, '黄婷婷', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3aO11ABWuiaAJ16JxAfPC9AU1icuHfScbro1AiaCic7E4m2ajUmibTVbtRE8RevXHK66fkhYEMEVxcFpc/0', null, null, null, '2', null, '1', 'oruQl1aBkUc8F7AiKo6IDnEhC_38', '2017-07-26 17:25:21', '2017-07-26 17:27:59', null);
INSERT INTO `wc_users` VALUES ('749', 'oruQl1RHLhRneiiN0NDDRLV41hVU', null, null, null, '', null, '(ﾐචᆽචﾐ)百度-陆珊', 'http://wx.qlogo.cn/mmopen/ulH6nuqiaNLZeCs3jClg8OQ6Dicqel82KL5BVaw66DVtcslNFjv2iawq2epHOn2CsdNSoGN8qTgBNYC9DSVtsZZGlJAf7Ccnj4d/0', null, null, null, '2', null, '1', 'oruQl1RHLhRneiiN0NDDRLV41hVU', '2017-07-26 17:25:47', '2017-07-26 17:25:47', null);
INSERT INTO `wc_users` VALUES ('750', 'oruQl1doGcH14CduNfmgCzOixxkY', null, null, null, '', null, '米糖妹', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5UfW1abbuoSHAxWcAWrfzfyap6SX3aZVWxCpQrFTGD4PbDbfZ2V6uAdIicU2pKrQHv25GMQW5d5ECEf13ysBUlXY6cDBbrpb1c/0', null, null, null, '2', null, '1', 'oruQl1doGcH14CduNfmgCzOixxkY', '2017-07-26 17:28:03', '2017-07-26 17:28:03', null);
INSERT INTO `wc_users` VALUES ('751', 'oruQl1Q6FfhpCQ_tqqlSRrtM3Tbg', null, null, null, '', null, '大米', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz0iaGYJE8jdWu6SPvibcgWTF0VtAzmiaYiaG2icTBG51KTTw5HOAVM2fgw1bZUqTg2LopSdKW2Xz2MYhk/0', null, null, null, '1', null, '1', 'oruQl1Q6FfhpCQ_tqqlSRrtM3Tbg', '2017-07-26 17:28:34', '2017-07-26 17:28:34', null);
INSERT INTO `wc_users` VALUES ('752', 'oruQl1Rdwj0_fnBUUiIRrM37bLwA', 'xieyanqin@xm12t.com', '13959793187', null, '', null, '????谢哈哈????', 'http://wx.qlogo.cn/mmopen/gQQO820rz5WjWYqpDpYZB7JZjRy4rOYtPa9zb2j5uGpy2s2xicbJHyZy93RtNBfgx9ozHw9Su47BEOUOmqacetw/0', null, '泉州少林路亚特5楼', null, '2', '哈哈哈', '1', 'oruQl1Rdwj0_fnBUUiIRrM37bLwA', '2017-07-26 17:28:48', '2017-08-05 10:08:43', null);
INSERT INTO `wc_users` VALUES ('753', 'oruQl1RsAdWH-JdpZdtKQr3LJDoo', null, null, null, '', null, '三岁。', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8e8soib73gwBnPVQd4teHJLGxD3RTZZHFiaImN5FhzAqOibV62pljPS8B282hv2AEVdicFunibfxucjhrKt3pM518lWw/0', null, null, null, '2', null, '1', 'oruQl1RsAdWH-JdpZdtKQr3LJDoo', '2017-07-26 17:29:08', '2017-07-26 17:29:08', null);
INSERT INTO `wc_users` VALUES ('754', 'oruQl1eWPIXuD9IIVwLmARWgkiD0', 'chengxiantian@xm12t.com', '15880729433', null, '', null, '程晓田', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8eibJhsgAFQqWLMcbtruqaoODLfbgtxI9ib4ia8bZj6Mbc7eFTPTa7P3eNLgJicaq7FBiacEY3MxyQiccdahESia5zKbck/0', null, '泉州市丰泽区少林路仁风工业区亚特大厦5楼', null, '2', null, '1', 'oruQl1eWPIXuD9IIVwLmARWgkiD0', '2017-07-26 17:29:29', '2017-08-10 16:51:35', null);
INSERT INTO `wc_users` VALUES ('755', 'oruQl1a0urBR06VR2H1x7ZRV3Vs8', null, null, null, '', null, '酒窝里面没有酒', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3VVaRwhKVEQ20Sicd1CbsGFhDo3saSvtXj7OVyZxZkPSdicR6wLfLWDBEBc6fK2QcYqtg3f3MicricY4/0', null, null, null, '2', null, '1', 'oruQl1a0urBR06VR2H1x7ZRV3Vs8', '2017-07-26 17:29:30', '2017-07-26 17:29:30', null);
INSERT INTO `wc_users` VALUES ('756', 'oruQl1fyUyXHDzaORjbSrE--1VJI', null, null, null, '', null, '肖小金', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8d6H4PvJdaVPYKKvctRPibynqjfb0RdtFUEvJDVwCeFpuddrhRydMMuplgibBsnV64hhjQCW9lxEEw6SpicTMA9HME/0', null, null, null, '2', null, '1', 'oruQl1fyUyXHDzaORjbSrE--1VJI', '2017-07-26 17:29:54', '2017-07-26 17:29:54', null);
INSERT INTO `wc_users` VALUES ('757', 'oruQl1azdLOlS_ddI4bICvCM85W4', null, null, null, '', null, '一个西瓜大又圆????????', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicNv36rpBTaZzXZ5efAOthTK5P0Ej8OOQ4MeuCiaAHgs2CowugPMP889XHrMUZvxLEB7n8ICSMokwj/0', null, null, null, '1', null, '1', 'oruQl1azdLOlS_ddI4bICvCM85W4', '2017-07-26 17:30:09', '2017-07-26 17:30:09', null);
INSERT INTO `wc_users` VALUES ('758', 'oruQl1aiyxS6yQ9XL86bKtmlxZY0', null, null, null, '', null, '、        劫後餘生°', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3W2JTTfjqC0U18wL00088lLhhDHOYqcncxbdn5j7ceoNhlWDsPCkYZ3s7cKOs7UgicRQZJWTd1I3s/0', null, null, null, '2', null, '1', 'oruQl1aiyxS6yQ9XL86bKtmlxZY0', '2017-07-26 17:30:37', '2017-07-26 17:30:37', null);
INSERT INTO `wc_users` VALUES ('759', 'oruQl1Qbbl8IKynHryCddb286rcI', null, null, null, '', null, '夏天????āáǎà', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3SAzWxMia3CyYxXrlVRq9KEdmIicMkOB2qJRFohbZtarmIyVHsz5WKxBjJMrCIKzGzLROgRuTCsItZ/0', null, null, null, '2', null, '1', 'oruQl1Qbbl8IKynHryCddb286rcI', '2017-07-26 17:30:37', '2017-07-26 17:30:37', null);
INSERT INTO `wc_users` VALUES ('760', 'oruQl1R5mFqsXsjF6iWxMof4dGtM', '839644707@qq.com', '15960138156', null, '', null, '陈莉', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7rGr4SRKnsCcXyPJo67Tzot9nuveZmY1jR2VhKz6N3hIqd7JnFKzmBia5BHvmmCPSXTwkmxicJkqKN734vWXesjyCUibXE6ptkXw/0', null, '晋江国贸大厦8楼百度公司', null, '2', '陈莉', '1', 'oruQl1R5mFqsXsjF6iWxMof4dGtM', '2017-07-26 17:31:00', '2017-07-26 17:32:46', null);
INSERT INTO `wc_users` VALUES ('761', 'oruQl1enamm1K5EmpH2_ZHtLT3Nw', '807573107@qq.com', '15060602440', null, '', null, '百度客服黄圣伟', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3XhUCibTJWiaicDhjO3QRrMPMzqojoZ0jp6UkBticKudbm86rxUFAXRLul3lPWP5EblFp0ShibJx8ve9O/0', null, null, null, '1', '青天白云，红旗招展！！！', '1', 'oruQl1enamm1K5EmpH2_ZHtLT3Nw', '2017-07-26 17:31:11', '2017-07-26 17:33:07', null);
INSERT INTO `wc_users` VALUES ('762', 'oruQl1d173deB7zpyT8KgtYlIcb0', 'chenjian@xm12t.com', '13808520836', null, '', null, '陈健', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJq9bRCYicCPFwNMiabCkscZSyLl0bCIpulDosHDFYibz82Am4NWqauFf2smzLauKx61FBQxMB2VrXhQ/0', null, '丰泽区少林路仁风工业区亚特大厦4楼', null, '1', null, '1', 'oruQl1d173deB7zpyT8KgtYlIcb0', '2017-07-26 17:31:16', '2017-07-26 17:33:04', null);
INSERT INTO `wc_users` VALUES ('763', 'oruQl1UI2XWoJaTlurU6bO3MfSVs', null, null, null, '', null, 'yan昂昂', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSacibrqxey296EAUz1nPt3lSicH8ibheNicxM1pJxibT1Uqbh6YibOEhcPl58XDpa323aGmbfuKsYb5Bnv4/0', null, null, null, '0', null, '1', 'oruQl1UI2XWoJaTlurU6bO3MfSVs', '2017-07-26 17:31:18', '2017-07-26 17:31:18', null);
INSERT INTO `wc_users` VALUES ('764', 'oruQl1WQFDLJP47MDumTStjXUXz0', null, null, null, '', null, 'hhhh', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLATiaJs5oeA48ic3icaaD8B1VUUib49sv78OFwNXygWEF6XcnKCDtq49fawUMoelkMzCdZ3OWPqqyzcqw/0', null, null, null, '2', null, '1', 'oruQl1WQFDLJP47MDumTStjXUXz0', '2017-07-26 17:31:19', '2017-07-26 17:31:19', null);
INSERT INTO `wc_users` VALUES ('765', 'oruQl1ffbufZy2C4eMJo0ASrmHKc', 'huangshuli@xm12t.com', '18259636034', null, '', null, '黄淑丽', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicNPdqQqS7vqUXkibxicEAjnibj1L11TLwn46HdDhc6h7m249FwLy8mqEeviaan4jmwahejl49SWZ663p/0', null, '漳州市龙文区建元东路2号碧湖万达广场六楼（云梯众创空间）', null, '0', '这一秒坚持，下一秒就会有希望！', '1', 'oruQl1ffbufZy2C4eMJo0ASrmHKc', '2017-07-26 17:31:26', '2017-07-26 17:33:47', null);
INSERT INTO `wc_users` VALUES ('766', 'oruQl1cngaor21HFrSEwAplF59vo', 'lihua@xm12t.com', '15805080630', null, '', null, '李华', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3bQ1b4IVI47lPYElYQBGtJvPHncPQReFnXicibIxfUXlRweSGTtZyDhym9hVUic6uPS18ic0CKgjPGov/0', null, null, null, '2', null, '1', 'oruQl1cngaor21HFrSEwAplF59vo', '2017-07-26 17:31:29', '2017-08-05 11:18:48', null);
INSERT INTO `wc_users` VALUES ('767', 'oruQl1ZZ4r8kJvDGAztsPUqvaWIA', null, null, null, '', null, 'A百度小施', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3UaUy8ariakAA3hAIib0MInjXyoTt7usb07tCXu55rZ691zaHqAe4hSCDxjd0M6VoUPHdlzjjmZaicp/0', null, null, null, '2', null, '1', 'oruQl1ZZ4r8kJvDGAztsPUqvaWIA', '2017-07-26 17:31:40', '2017-07-26 17:31:40', null);
INSERT INTO `wc_users` VALUES ('768', 'oruQl1QIqd6Xg0h8Py2kLObkW7us', 'wangzy@xm12t.com', '15980061165', null, '', null, '王智勇', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaeibzDjllegTCcy6YxM6FHMEzZ9K8nH4DkRenS6CQT4e7JuPgf1gnRvsiaOn0picicbHBer5cewnxfVKD/0', null, null, null, '1', null, '1', 'oruQl1QIqd6Xg0h8Py2kLObkW7us', '2017-07-26 17:31:53', '2017-08-10 16:57:55', null);
INSERT INTO `wc_users` VALUES ('769', 'oruQl1VjRzUEHJOPGP8vfVD3duxk', null, null, null, '', null, 'miyaka珠', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8fpMTGicxlyOicL1TOsIDiaoG4PvE3YmBmD8iaspDaDWBEhFGoRdwaJxzChfGbSrzypODxqm7Fxz8XVPQ/0', null, null, null, '2', null, '1', 'oruQl1VjRzUEHJOPGP8vfVD3duxk', '2017-07-26 17:32:32', '2017-07-26 17:32:32', null);
INSERT INTO `wc_users` VALUES ('770', 'oruQl1eQ8Cc9fCjbDsqZKJGZGvN0', 'hongrongkun@xm12t.com', '18605006618', null, '', null, '洪荣堃', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI4qZoKA7ibs56Rib09P8KACaJIkkwAylCYGspibNaGwlDyPQMaLHicSFodaiaWbW5svuJL8mmgxFkiaqiaw/0', null, '泉州市丰泽区少林路仁风工业区亚特大厦4楼', null, '1', null, '1', 'oruQl1eQ8Cc9fCjbDsqZKJGZGvN0', '2017-07-26 17:33:57', '2017-07-26 17:36:56', null);
INSERT INTO `wc_users` VALUES ('771', 'oruQl1ernRZAtvN_3QyfnYZ91bwo', null, null, null, '', null, 'C扎西德勒', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBXibvehBrxvxWFIW1KSqpMPGYPNvbg90gqaKFiagiaSB7cubE8rK2qJzxBkpvajE6NTf4Sxy4iboox2A/0', null, null, null, '2', null, '1', 'oruQl1ernRZAtvN_3QyfnYZ91bwo', '2017-07-26 17:34:14', '2017-07-26 17:34:14', null);
INSERT INTO `wc_users` VALUES ('772', 'oruQl1ZxtRPJ6X3GYujYb-G96nhM', 'wangxiaoting@xm12t.com', '15260788027', null, '', null, '王小婷', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw90XuIztiaAyzjV6UGS7HWhOJubIIO2nFibIej2gwSBhbVzKq0eDOCVDq4UXeOTakcmsqDgvlZibpxeknubJUOmkeB/0', null, '泉州市丰泽区少林路仁风工业区亚特写字楼4楼', null, '2', null, '1', 'oruQl1ZxtRPJ6X3GYujYb-G96nhM', '2017-07-26 17:34:18', '2017-07-27 08:46:32', null);
INSERT INTO `wc_users` VALUES ('773', 'oruQl1XZyXsbAS28RyDRsk9V0T0A', null, null, null, '', null, '华胥明梦', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD1uE50ZLQfSmQ8kpBiaFYbrQrNYWOic4BIeLcvxqVqkejtzTfQwfp89agMCacZK6TMAV2cu8gNK4icg/0', null, null, null, '2', null, '1', 'oruQl1XZyXsbAS28RyDRsk9V0T0A', '2017-07-26 17:34:21', '2017-07-26 17:34:21', null);
INSERT INTO `wc_users` VALUES ('774', 'oruQl1bimvX1Pd8mTZTv4QxI7Ws4', null, null, null, '', null, '惠州市瑞志诚纸箱包装有限公司', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae4GGf4LXfHricc9J1BpQsF7ZTyfV7VYM36Bj6EJRn6icAOkDM9T2xSTdqkRpHdzpyNmjOtSiaCQnVFU/0', null, null, null, '1', null, '1', 'oruQl1bimvX1Pd8mTZTv4QxI7Ws4', '2017-07-26 17:38:05', '2017-07-26 17:38:05', null);
INSERT INTO `wc_users` VALUES ('775', 'oruQl1ZoqcneS_y3Nh2wewLitOAo', 'huangkai@xm12t.com', '13860729043', null, '', null, '黄锴', 'uploads/user/775/img1501902845.jpg', null, '福建省泉州市丰泽区仁风工业区亚特大厦4楼B厅', null, '1', null, '1', 'oruQl1ZoqcneS_y3Nh2wewLitOAo', '2017-07-26 17:47:24', '2017-08-05 11:12:18', null);
INSERT INTO `wc_users` VALUES ('776', 'oruQl1XpVar4YE-usI3HhJovv9eM', 'chenbh@xm12t.com', '13860778902', null, '', null, '陈宝华', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuRdeLB3wWlmwUVdiaEMOxKfsv42QMANt7YKUcJwcT7FL4wpaXIXHQ1Uq5uXO5PvGITYjdOz04DhyhA/0', null, '泉州市丰泽区少林路仁凤工业区亚特大厦4楼', null, '2', null, '1', 'oruQl1XpVar4YE-usI3HhJovv9eM', '2017-07-26 17:50:48', '2017-07-26 17:52:33', null);
INSERT INTO `wc_users` VALUES ('777', 'oruQl1WUP15p177RH-HLnbNIsYXo', null, null, null, '', null, 'J剑荣', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuTQFLg0nRDfxgMXBaiaDy2jdau9pqYicEu2IQEqSdKiaclm21ondLurGelfxOCnrcib6ibvibK3yYwPgdZBFvCU1nR9NW/0', null, null, null, '1', null, '1', 'oruQl1WUP15p177RH-HLnbNIsYXo', '2017-07-26 22:14:09', '2017-07-26 22:14:09', null);
INSERT INTO `wc_users` VALUES ('778', 'oruQl1e4D3ZH7IWvaR4RkbFkfevY', 'lintuqiang@xm12t.com', '15985814122', null, '', null, 'L', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8dagWIrBU5lxc6o8ic68IoRGW0yglZYJStgtVATqOdRbpian5ub7jicfaXCfBUHAiaPg6qWGjZX7NGpym9eqCttABicf/0', null, null, null, '1', null, '1', 'oruQl1e4D3ZH7IWvaR4RkbFkfevY', '2017-07-27 08:04:47', '2017-07-27 08:09:49', null);
INSERT INTO `wc_users` VALUES ('779', 'oruQl1Yz07XpSDHYuVgsaWZIcwh8', 'linsf@ydbaidu.net', '13670465535', null, '', null, '汕头 林珊凤', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCc1R04aEzJNtVmO7JbuzA7qRGcw0nSIAggWGfGs1pNibjsBWzr0o9cwr9wPswPujdvEiaA8QyF1FA23iaEa4Mv8WLU28NcIFPxBo/0', null, null, null, '2', null, '1', 'oruQl1Yz07XpSDHYuVgsaWZIcwh8', '2017-07-27 08:22:49', '2017-07-27 08:25:38', null);
INSERT INTO `wc_users` VALUES ('780', 'oruQl1cyBIttQDpHCQOLVH_3-xig', '547530119@qq.com', '15559192902', null, '', null, '柯林星', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae65fo6ibicWv1IhW35IhymPc8dJbAG4bSfTCR6ruRhvFx73pzP1gI8T8etFtQvYGarYPAicA0R9YV2P/0', null, '亚特大夏4楼', null, '1', null, '1', 'oruQl1cyBIttQDpHCQOLVH_3-xig', '2017-07-27 08:41:17', '2017-08-05 11:30:51', null);
INSERT INTO `wc_users` VALUES ('781', 'oruQl1fKEcAbcOwoIVRfN9LI3d9Q', 'linys@ydbaidu.net', '17098993298', null, '', null, '汕头百度@林佑生', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae2tp9530icjzBpOKUms5w8HNJWhYeJan5dp1QPSll23dFIjufnCprRibCgnicj3Aa48o88Zw7AnUgibB/0', null, null, null, '1', null, '1', 'oruQl1fKEcAbcOwoIVRfN9LI3d9Q', '2017-07-27 08:43:13', '2017-08-05 13:16:11', null);
INSERT INTO `wc_users` VALUES ('782', 'oruQl1bVdM6yiCbPpL7_XfPQ1CEQ', null, null, null, '', null, '百度营销中心????陈琪18207687417', 'http://wx.qlogo.cn/mmopen/gQQO820rz5XoHaUKoo2eq7uPO9A1zswiazrX2UTR0dwc2wSld4aDZ2QRCcG1niaYa0gWFmud0jsTzTjAJDwa24hFtPydiaTcGhT/0', null, null, null, '1', null, '1', 'oruQl1bVdM6yiCbPpL7_XfPQ1CEQ', '2017-07-27 08:46:41', '2017-07-27 08:46:41', null);
INSERT INTO `wc_users` VALUES ('783', 'oruQl1eNUJtG54u5BaiYytX2zDpA', 'wanghuiqin@xm12t.com', '13400779656', null, '', null, '王会芹', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaSrPV1ib4ibWFKvyo3AGq1xYV6UP2XVia3LZric4SohPhztxN6HKvODFCmFF3qiacibrB25ZlFveZ6bmibk/0', null, '厦门市思明区软件园观日路36号之一201', null, '2', '开心就笑，难过就哭，简单最好', '1', 'oruQl1eNUJtG54u5BaiYytX2zDpA', '2017-07-27 09:04:23', '2017-07-27 09:06:17', null);
INSERT INTO `wc_users` VALUES ('784', 'oruQl1QLbMTf64DkjluDxHrP7_J4', null, null, null, '', null, 'Vane', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaYNmeSkceAdibIPR86tcO8bHyxvOGwS9ryGC5icBAT9ZH516e8bs4YqqgBwNzUdRyfZovMIFvFd0Gy/0', null, null, null, '2', null, '1', 'oruQl1QLbMTf64DkjluDxHrP7_J4', '2017-07-27 09:24:38', '2017-07-27 09:24:38', null);
INSERT INTO `wc_users` VALUES ('785', 'oruQl1SFVlhmJL719CdsiMRXepXY', null, null, null, '', null, '超君君', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3QjqMQUicbNLdpKnlicoA9pYhLia1aicreMwqmmytfxYPo9C042bw2DdhRdMyh2HkKR17PwEOOwhfPE1/0', null, null, null, '2', null, '1', 'oruQl1SFVlhmJL719CdsiMRXepXY', '2017-07-27 09:26:15', '2017-07-27 09:26:15', null);
INSERT INTO `wc_users` VALUES ('786', 'oruQl1eL5PQdHPd0ei6VCnpRR_zI', null, null, null, '', null, 'Zoey', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae2Qoiaq0nicF9hapxuFjiauEHWBDSFaJUUwYCRqic0cGkgzV7mnNXc2Vty72vTwQtLDrhDb9ztkc6Xyia/0', null, null, null, '2', null, '1', 'oruQl1eL5PQdHPd0ei6VCnpRR_zI', '2017-07-27 09:27:56', '2017-07-27 09:27:56', null);
INSERT INTO `wc_users` VALUES ('787', 'oruQl1XWrXHK6DDfzsxGMGZIiBww', '1270748103@qq.com', '13709355481', null, '', null, '艾克迅Jason', 'uploads/user/787/img1501119574.jpg', null, '万达广场六楼', null, '1', '要的并不多，简单快乐就好了。', '1', 'oruQl1XWrXHK6DDfzsxGMGZIiBww', '2017-07-27 09:29:41', '2017-07-27 09:38:05', null);
INSERT INTO `wc_users` VALUES ('788', 'oruQl1RVUWCoR90RupKamkiyMtaQ', null, null, null, '', null, '玲玲', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz9ebERxnPD9rKXRlq1t69eeq9slicW6XgQdv2pf829kHqzaM0rAXOvjJtSicygX5Huxv5lcGJIvOjc/0', null, null, null, '2', null, '1', 'oruQl1RVUWCoR90RupKamkiyMtaQ', '2017-07-27 09:55:06', '2017-07-27 09:55:06', null);
INSERT INTO `wc_users` VALUES ('789', 'oruQl1dOwE7FnM_tF1beBOcI_BHc', null, null, null, '', null, '沈水木.万通知识产权创始人.总经理', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuSrRN1dNHHhtvXq4IyKZMicbl7BMN2ibBJ20GUhfYzxRYev1Eib505aFcPCHpiccI7GhhUhvkDJpwYmQw/0', null, null, null, '1', null, '1', 'oruQl1dOwE7FnM_tF1beBOcI_BHc', '2017-07-27 10:25:45', '2017-07-27 10:25:45', null);
INSERT INTO `wc_users` VALUES ('790', 'oruQl1eCPzbyh-kK4or0STVzGFSo', '1419556549@qq.com', '13229842129', null, '', null, '百度-徐顾问', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaeyWTFiat8MZZkBa88KwQscasXA6qdRropxmiam8eibt4kAPNLHjKO1tPRc0UVpcMXOLEiav6tQ4DhMic9/0', null, '广东省汕头市金平区利鸿基大厦20楼', null, '1', null, '1', 'oruQl1eCPzbyh-kK4or0STVzGFSo', '2017-07-27 11:38:09', '2017-07-27 11:39:55', null);
INSERT INTO `wc_users` VALUES ('791', 'oruQl1buJEuJYZNA4wRR405HPDf4', 'aodan@xm12t.com', '18859550040', null, '', null, '敖丹', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3ao4Oe2RYzbPe2Sn9Tia8z8L5sa2QtiasvOxUJkO70u7EIkwdEx5tDWvBETQFsHUJzibDibjIU6HtV1a/0', null, '福建省泉州市丰泽区仁风工业区亚特大厦百度5楼', null, '2', '最值得欣赏的风景是自己奋斗的足迹', '1', 'oruQl1buJEuJYZNA4wRR405HPDf4', '2017-07-27 13:44:48', '2017-07-27 13:52:13', null);
INSERT INTO `wc_users` VALUES ('792', 'zeng123', 'zengjiamin@xm12t.com', '18650493308', null, '$2y$10$MdmdNNHUK5d8Y3cS/gw6W.MoGzQznBCxXAGnjR6PAORZqSJllk2/q', 'DIVysdLaPI6snB7jd3HJX2uRUgdxFVwAFVL2tu59aVRqz20q7Uz9it3GLorZ', '曾佳敏', 'uploads/user/792/img1501575893.jpg', null, null, null, '2', null, '1', null, '2017-07-27 14:12:47', '2017-08-07 17:26:43', null);
INSERT INTO `wc_users` VALUES ('793', 'oruQl1WZWolX7gJkKsWNBhTwlnIY', 'dayi1969@163.com', '13505913631', null, '', null, 'A 快乐星星玩具批发', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzxicgcTZkiazhVtKGzkfzRjDkia8RLhxdSGHibC2LjguZHz0RqcQibIdk9sq8V2h8JMtcuMxD9o0IfNeZ/0', null, '福建省泉州市鲤城区惠义街15号', null, '1', '批发儿童DI丫(金粉画、数字画、Eva画等) 、沙滩玩具、电动玩具、益智玩具、摇控模型、小型游乐设备', '1', 'oruQl1WZWolX7gJkKsWNBhTwlnIY', '2017-07-27 14:16:45', '2017-07-27 14:53:47', null);
INSERT INTO `wc_users` VALUES ('794', 'oruQl1TRuL4CltgTta2pKTpGx6I0', '702237839@qq.com', '15260889355', null, '', null, '郭泽昆', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM73CNibEeBTrM7byEIMMyL0IJDj8Q0mT8yKZjsk1AxNk5l3wAtLq9BhdZAcwoiaFFZCAHoNlXGNdmBsPDw1sHQlUf41iaCS9TdibM0/0', null, '泉州洛江中俊世界城龙商大厦五楼艾尚健身瑜伽学院', null, '1', '增肌，塑型，减脂，康复，瑜伽……付出的汗水将是你身体最好的回报', '1', 'oruQl1TRuL4CltgTta2pKTpGx6I0', '2017-07-27 14:22:02', '2017-07-27 14:24:00', null);
INSERT INTO `wc_users` VALUES ('795', 'oruQl1cG-DVjociQ--_44MzgYpXM', '3297593622@qq.com', '13959890991', null, '', null, '郑某人', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM73CNibEeBTrM7byEIMMyL0ICIsibWssEXYdAYjMsiaeiaO6uxdVg3QEQwqz6rmpdGQwUf3kuN22LZpjWPodxOoTibUfRRLsMz0eBgM/0', null, null, null, '2', '上帝为你关上了一扇门，也一定会为你打开一扇窗。只要努力，就能走到柳暗花明。', '1', 'oruQl1cG-DVjociQ--_44MzgYpXM', '2017-07-27 15:05:12', '2017-07-27 15:12:44', null);
INSERT INTO `wc_users` VALUES ('796', 'oruQl1WPecrFPDFlMEFPMYU4VzxM', null, null, null, '', null, '东东', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw90XuIztiaAyzquLyPxoZloVEajaehPh10U97NLbTGB6DLVCx49uTTDwOKN1Kyb1QqOibSw8grWiaWDVxOPEGEO9tc/0', null, null, null, '2', null, '1', 'oruQl1WPecrFPDFlMEFPMYU4VzxM', '2017-07-27 15:05:39', '2017-07-27 15:05:39', null);
INSERT INTO `wc_users` VALUES ('797', 'oruQl1T-7Msrd10NVhXvxnZ-yUiU', null, null, null, '', null, 'chen', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8dHDmZxvYoXr2wIjIrMCU0OiaPGRe7yadFATiaeI5wRwgJic8MTpY0dWicRiaFEqqLMEiaE0Wp05T3nyQzw/0', null, null, null, '2', null, '1', 'oruQl1T-7Msrd10NVhXvxnZ-yUiU', '2017-07-27 16:21:14', '2017-07-27 16:21:14', null);
INSERT INTO `wc_users` VALUES ('798', 'oruQl1d2kflVRuCar---anczS9nk', '403657424@qq.com', '18120758578', null, '', null, '林俊', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB2fWMYiaQx3rUbTjmvhWYHCsBfIaMrMiaWTXo8XibMxOOTZKT9gAFjV5xH0ricibWDtLicpWXiaqm2n0whQ/0', null, null, null, '1', null, '1', 'oruQl1d2kflVRuCar---anczS9nk', '2017-07-27 16:29:26', '2017-07-27 16:30:04', null);
INSERT INTO `wc_users` VALUES ('799', 'oruQl1Wy9z9I2Ln7pK89iffHNbpM', null, null, null, '', null, '°', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5FTjqOVvzHUNmcUfRJSkVqlEDR5WaRic7tgN2ygo0emAZTSGUjbq0omtyUboqVbdI2oia2a3grfj8A/0', null, null, null, '1', null, '1', 'oruQl1Wy9z9I2Ln7pK89iffHNbpM', '2017-07-27 16:39:33', '2017-07-27 16:39:33', null);
INSERT INTO `wc_users` VALUES ('800', 'oruQl1eSEb2gX-ziV5nqfXTHjv_I', null, null, null, '', null, '陈沅', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaezpxSec9X2fQJH8OmrhPuzB3rkyJIzMHP2b1lzEw8XJeqkXiaCdRdKaLtjWGdJngNk5rz6mwKP5wF/0', null, null, null, '2', null, '1', 'oruQl1eSEb2gX-ziV5nqfXTHjv_I', '2017-07-27 16:39:34', '2017-07-27 16:39:34', null);
INSERT INTO `wc_users` VALUES ('801', 'oruQl1V9wdY9y68QOxiy2Il4uSZI', null, null, null, '', null, '金菇凉', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaewM5DtFptL1EKIhYxdLZfqWf1iayeyxtQ2ChTOkWqFia1VVJWkELgcWvL4Fw79yaiaTnZtglr3grfyR/0', null, null, null, '2', null, '1', 'oruQl1V9wdY9y68QOxiy2Il4uSZI', '2017-07-27 16:39:37', '2017-07-27 16:39:37', null);
INSERT INTO `wc_users` VALUES ('802', 'oruQl1T2q1hLy5opWDxfi2h54bNs', null, null, null, '', null, '郑薇', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8e8soib73gwBnOfcge0jiaiahOGqD2TdgwHM5ice4xvnYgA6r33hAetSibvvQ9Gabjn3yRHYfeumRrutGCW5c3JMJzWE/0', null, null, null, '2', null, '1', 'oruQl1T2q1hLy5opWDxfi2h54bNs', '2017-07-27 16:39:50', '2017-07-27 16:39:50', null);
INSERT INTO `wc_users` VALUES ('803', 'oruQl1YfEAfUcFN2Gh3oYvEO2dp4', null, null, null, '', null, '朵鱼', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3bNfuCfVupHIaZ8f4iaENmWY0EsZ7Xp8r4pgBmCxrzYspL8z6IQjZVZqkXkKU3kib5CozAcoxhu8jR/0', null, null, null, '2', null, '1', 'oruQl1YfEAfUcFN2Gh3oYvEO2dp4', '2017-07-27 16:40:22', '2017-07-27 16:40:22', null);
INSERT INTO `wc_users` VALUES ('804', 'oruQl1d_3zl1qm-oaHGY4g00arS8', null, null, null, '', null, ' Gemini', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicAnx2UrpA61yyicBkmPu6RLGTeM1M28JbAichuP4CANvhg9Jj20F7jiccSltKoGwqQAGicsiaefV7ZVWk/0', null, null, null, '2', null, '1', 'oruQl1d_3zl1qm-oaHGY4g00arS8', '2017-07-27 16:40:46', '2017-07-27 16:40:46', null);
INSERT INTO `wc_users` VALUES ('805', 'oruQl1QDEiXrLbF2_AurTvOr7NjY', null, null, null, '', null, '涅槃', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae71DsPL0qliaE20BLASGdT8cSxibSibsLkaKZv29ZmorWBnfAGN8GGgTt5fficf0B0eic2vpic1NxQMt55/0', null, null, null, '2', null, '1', 'oruQl1QDEiXrLbF2_AurTvOr7NjY', '2017-07-27 16:40:57', '2017-07-27 16:40:57', null);
INSERT INTO `wc_users` VALUES ('806', 'oruQl1dEeFtone9W3_rf6fWL_iT0', null, null, null, '', null, '露卡卡', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3WM4pib9es4CX7NVNQahoFHVh50nr55NcK47jC8uMRcQySqiabGSFrNOxaiaYjJ3gicrNDBZnFBdUckV/0', null, null, null, '2', null, '1', 'oruQl1dEeFtone9W3_rf6fWL_iT0', '2017-07-27 16:41:12', '2017-07-27 16:41:12', null);
INSERT INTO `wc_users` VALUES ('807', 'oruQl1W6CZ0iO7e-m2PlUY0-sFhw', 'suxiaomin@xm12t.com', '18259224881', null, '', null, 'Sss', 'http://wx.qlogo.cn/mmopen/gQQO820rz5XnSSWQdNzQJGF2Y9icJcFcZTHhIXfoN7zFDkXxPBkfFpialQu3ozy2AZiaBs9iaopFZc9iabR0aeYLwzQ/0', null, null, null, '2', null, '1', 'oruQl1W6CZ0iO7e-m2PlUY0-sFhw', '2017-07-27 16:41:43', '2017-07-27 16:43:16', null);
INSERT INTO `wc_users` VALUES ('808', 'oruQl1f3PDPg72irb-H6Iw7IXJy4', null, null, null, '', null, '飞', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuS3GD5q51LcfMyW6P246JVV4chDWvU3zUTlmcibqdGH5mX0EjRPgHrOV3Rc9diaJajeUGUCAz7jhxOfw5azJvLiblQ/0', null, null, null, '2', null, '1', 'oruQl1f3PDPg72irb-H6Iw7IXJy4', '2017-07-27 16:41:46', '2017-07-27 16:41:46', null);
INSERT INTO `wc_users` VALUES ('809', 'oruQl1cxd-HpiH22-ElPYEtfnDM8', null, null, null, '', null, 'Ataraxia', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAhnDYicadzibT1DdM0kWrpJMaictQDqnNzKmibxdZwpjmrpGe4tiaU7TrjpqEe9R0D0weAJc1SJKZ9l9w/0', null, null, null, '2', null, '1', 'oruQl1cxd-HpiH22-ElPYEtfnDM8', '2017-07-27 16:42:18', '2017-07-27 16:42:18', null);
INSERT INTO `wc_users` VALUES ('810', 'oruQl1RVUZsX1x-x2c_npd4SyiKw', null, null, null, '', null, '藏起来', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8fyLlQiagB1s8UugJ50mjTtvNkrDibzC8sJuDibSYuUp7iajqOtcCahrFdXUV2G2yLRGXg5Oq6REtzCHw/0', null, null, null, '2', null, '1', 'oruQl1RVUZsX1x-x2c_npd4SyiKw', '2017-07-27 16:42:27', '2017-07-27 16:42:27', null);
INSERT INTO `wc_users` VALUES ('811', 'oruQl1dT7Xl2ffKa4o5t3V-UJggg', 'yangyanxiu@12t.com', '18120755054', null, '', null, '克己复礼', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3ZAyj0dRwaicHeP1xib10piasVTicX9NlwJpOAVvju5yt7kLMHbIhcK7UTCxZrhRC5WRb4ibRthp8N6jM/0', null, '厦门思明区软件园二期观日路36号201单元', null, '2', '这是很好很长的一生', '1', 'oruQl1dT7Xl2ffKa4o5t3V-UJggg', '2017-07-27 16:42:28', '2017-08-08 09:54:54', null);
INSERT INTO `wc_users` VALUES ('812', 'oruQl1fnjPPp7SK9SkVsp0X-7T8U', null, null, null, '', null, 'Blue', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaXwuYJxXpWMk5gfssQiarsMdcKeibAcXvceZq45St6DVX1ib613kSD7X9EEloF9ib9NpR8LZohibpAAib3/0', null, null, null, '2', null, '1', 'oruQl1fnjPPp7SK9SkVsp0X-7T8U', '2017-07-27 16:42:36', '2017-07-27 16:42:36', null);
INSERT INTO `wc_users` VALUES ('813', 'oruQl1dEgzrx6xaAG6c7t7_cfFeQ', 'xuli@xm12t.com', '13850048691', null, '', null, 'Lily', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzibW7PCOhJU0tZEaWlL8RRmQaHwiaFic1bT3ttTH4VMWeOtfc0kDMAVPqVAIicWichn5FSXt4ghAfOo31/0', null, null, null, '2', null, '1', 'oruQl1dEgzrx6xaAG6c7t7_cfFeQ', '2017-07-27 16:42:39', '2017-08-17 10:32:00', null);
INSERT INTO `wc_users` VALUES ('814', 'oruQl1SxE48wk3drJTuQ9wEW9cDE', null, null, null, '', null, '西瓜夏了夏天', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3SbnPtGHqkZAABH2AQh2fYyCBBOEoqSWdnHFShVTf3jyEZScibVdUSAx48AyNWibNeziauaa3ZDH9nc/0', null, null, null, '2', null, '1', 'oruQl1SxE48wk3drJTuQ9wEW9cDE', '2017-07-27 16:43:07', '2017-07-27 16:43:07', null);
INSERT INTO `wc_users` VALUES ('815', 'oruQl1S-DYnyBUHsi7lHzYhbh4OQ', null, null, null, '', null, '燕红', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae9uKs65el9A0O9ZZauNChJHWutrVCedibWvTpR9yibrwV1fBDVKLA5sibg5PubM8g1XqoSbzbRibcDCib/0', null, null, null, '2', null, '1', 'oruQl1S-DYnyBUHsi7lHzYhbh4OQ', '2017-07-27 16:43:12', '2017-07-27 16:43:12', null);
INSERT INTO `wc_users` VALUES ('816', 'oruQl1aK2W6QuL1OIYsQtUnwZpjk', null, null, null, '', null, '@夏天夏了西瓜', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4sED5l7icZe7jUDvoadc7ib5Ava1Nc70CaRo6aMgkaVJXAP78Z81XQajicMpyibVKgt1u7rMP6UVYOZQ/0', null, null, null, '1', null, '1', 'oruQl1aK2W6QuL1OIYsQtUnwZpjk', '2017-07-27 16:48:01', '2017-07-27 16:48:01', null);
INSERT INTO `wc_users` VALUES ('817', 'oruQl1UwzfqiAd0ScevCJf_5LIpU', null, null, null, '', null, '椰椰椰子', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDxWia2KHvKNGicVtaVgjtSj1DqTicbYXziafaA9cz6IuNtkBnmupkbibLd8Ealcd6XfPOIbj91YRFCKUg/0', null, null, null, '2', null, '1', 'oruQl1UwzfqiAd0ScevCJf_5LIpU', '2017-07-27 16:50:35', '2017-07-27 16:50:35', null);
INSERT INTO `wc_users` VALUES ('818', 'oruQl1Vq8MO1jFhS9-XdesunvwQQ', null, null, null, '', null, '盒子', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw81WCDHfZMUXic6hIo1HHwwWOSSElaCK3ibX4IKaL4iar3VXInDWicle7zXdS3BelbyA8kztq15ViaGnW1LSfOhYThBr/0', null, null, null, '0', null, '1', 'oruQl1Vq8MO1jFhS9-XdesunvwQQ', '2017-07-27 16:50:51', '2017-07-27 16:50:51', null);
INSERT INTO `wc_users` VALUES ('819', 'oruQl1eWSkJJuEThQTHCOHOjmQ0w', null, null, null, '', null, '益西多杰', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzwxtExTzibxINQo04yhWwXazDTcekLoH6AazaSyODiaaIrC26b3UlaHZEfcjgcyqIPbgea037t8Ricm/0', null, null, null, '1', null, '1', 'oruQl1eWSkJJuEThQTHCOHOjmQ0w', '2017-07-27 17:02:08', '2017-07-27 17:02:08', null);
INSERT INTO `wc_users` VALUES ('820', 'oruQl1TQQomNaZ9NUFUaGllhSzMs', null, null, null, '', null, '百度直通车客服', 'http://wx.qlogo.cn/mmopen/gQQO820rz5XJZWQDF5AKkvljGA2YUN2V1HnjxQOzUYib3cSdL9LatQd816c7ic5qoohFgribyzbHKFibaceCoxsp3Q/0', null, null, null, '0', null, '1', 'oruQl1TQQomNaZ9NUFUaGllhSzMs', '2017-07-27 17:28:01', '2017-07-27 17:28:01', null);
INSERT INTO `wc_users` VALUES ('821', 'oruQl1VfNiV6_NBWjQ-fa0ljRnTA', null, null, null, '', null, 'AA百度_卢燕文', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3YZHtqawNtvzEABshSfdrJCGF8WE9sVicSM4rNe8FBNmG1ZgKQ3UohSwfAEXe3ppCgSwt01LtxXcM/0', 'uploads/user/821/img1502967708.jpg', null, null, '1', null, '1', 'oruQl1VfNiV6_NBWjQ-fa0ljRnTA', '2017-07-27 17:31:57', '2017-08-17 19:00:49', null);
INSERT INTO `wc_users` VALUES ('822', 'oruQl1XAzqpMdPiesim-b0-lg48s', 'Andash@163.com', '13088859684', null, '', null, '范敬丁', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9NcVibjIK8LdjOvvgGBQn4jvkxbib0frCAAMNMt7GvQ93kfezSzHtZJSmQr6wX6ribKfbNXL856QicVuolFhGsuibhS/0', null, '惠州市惠阳区秋长镇鹏南路75号', null, '1', '范敬丁', '1', 'oruQl1XAzqpMdPiesim-b0-lg48s', '2017-07-27 19:09:40', '2017-07-27 19:14:32', null);
INSERT INTO `wc_users` VALUES ('823', 'oruQl1dBbc2rnQF_UkQjp1l4nOxc', '1913392338@qq.com', '15980205504', null, '', null, '雷Li(❛ω❛)', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae8o9uMibriax4YTRD0fXbXUSnIhTvtOib4iaqw8x3LUV2tzMadZGw7DicOWxiarQF0UHia1UEygxVm1M6Qp/0', null, null, null, '0', null, '1', 'oruQl1dBbc2rnQF_UkQjp1l4nOxc', '2017-07-27 19:47:30', '2017-07-27 19:50:04', null);
INSERT INTO `wc_users` VALUES ('824', 'oruQl1RHUfa-rtynfRiAP0moFZjU', null, null, null, '', null, '___Smile', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaexws5B58FPP2E0mNk3kVMiaR09rkux4ZEuPAzMCBOmS7icAFCh6UPLCI9iaKKwI5o4HB6jprtdxv64g/0', null, null, null, '1', null, '1', 'oruQl1RHUfa-rtynfRiAP0moFZjU', '2017-07-27 19:51:53', '2017-07-27 19:51:53', null);
INSERT INTO `wc_users` VALUES ('825', 'oruQl1VDvnxxLCTb7rOwBCqTr08k', null, null, null, '', null, '花生', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaeicbbYZaJsdPtQcxt1iaiapYqV6mwqfR1flwebeMLIcSiaRqhY5yGLstd7E4f7PTB5ib2iaelfyboqnFGq/0', null, null, null, '1', null, '1', 'oruQl1VDvnxxLCTb7rOwBCqTr08k', '2017-07-27 21:44:11', '2017-07-27 21:44:11', null);
INSERT INTO `wc_users` VALUES ('826', 'oruQl1TMtOOWlKUAV7J33jnsGpDQ', '615730675@qq.com', '13732256824', null, '', null, '郑美梨', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3WvicTib6QdDc9MyEkbIKQrmDPzicJfzKcq3xNibVNbrexdLYzcR3XCOUAbtEBSKd33ZQ7P8VvCbWUmV/0', null, '厦门思明区软件园二期观日路36之一201', null, '1', null, '1', 'oruQl1TMtOOWlKUAV7J33jnsGpDQ', '2017-07-28 09:30:03', '2017-07-28 09:32:00', null);
INSERT INTO `wc_users` VALUES ('827', 'oruQl1ZtQmSimvCYIKr3jx8OmogM', '1359471226@qq.com', '13824570360', null, '', null, '李荣宏', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuTZntJ4De8d8NcGdlkqx92LhmE5Ml9ryZicLdlHObovwAT7Ovr3y0zDXWTnfSOfTrf1n9QwUmx77gjay85iaYmMW3/0', null, null, null, '1', null, '1', 'oruQl1ZtQmSimvCYIKr3jx8OmogM', '2017-07-28 09:46:51', '2017-07-28 09:47:27', null);
INSERT INTO `wc_users` VALUES ('828', 'oruQl1afgbcJ2AH7Pto64joRDJSw', null, null, null, '', null, '陈荣', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaez8qUibx5lZj0nBIKtaK3cw6HpJnksh8qH18L5LSNSXc4BouU3UOiakSr4pNbyxM1fwO8RtDTTAjMf/0', null, null, null, '1', null, '1', 'oruQl1afgbcJ2AH7Pto64joRDJSw', '2017-07-28 10:40:07', '2017-07-28 10:40:07', null);
INSERT INTO `wc_users` VALUES ('829', 'oruQl1cWNCi4UOyyzKMkGniNgQZQ', '750795216@qq.com', '15985833628', null, '', null, 'A艺闽PVC封边条销售～小郭', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicBtK9lYDFcpZL1ZTxCcah4kjq0xY1e2eEOpWNwic8bGdzFmCUjVibloWZmssAYR1058Ot9ODDa4fyib/0', null, '厦门市翔安区巷北工业区舫山北二路1123-1139', null, '1', 'PVC封边条;ABS;T型;U型;\r\n高亮光;哑光', '1', 'oruQl1cWNCi4UOyyzKMkGniNgQZQ', '2017-07-28 21:58:14', '2017-07-28 22:03:11', null);
INSERT INTO `wc_users` VALUES ('830', 'oruQl1RCRe80XdBMhnoRpBHAZYRE', '464300747@qq.com', '15396235119', null, '', null, '赵玮', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3RVYht4qcOgiamX9NWh4ZwP4CMJv0T5AUhwSiamge278JM8L2nzXlibdIa5QFeTGQkJPUQVIFkBGHMN/0', null, null, null, '1', null, '1', 'oruQl1RCRe80XdBMhnoRpBHAZYRE', '2017-07-29 09:42:24', '2017-07-29 09:43:18', null);
INSERT INTO `wc_users` VALUES ('831', 'oruQl1S0va-vLRV1kbZ9xVI-4Bds', null, null, null, '', null, '????', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIgRduKeNXHUtub1tdS31BLZichBGc0ursBDOtmraP2IVIENDQglFtgGbicr7IyTtCszY1tGRfzQZvQ/0', null, null, null, '2', null, '1', 'oruQl1S0va-vLRV1kbZ9xVI-4Bds', '2017-07-29 09:42:42', '2017-07-29 09:42:42', null);
INSERT INTO `wc_users` VALUES ('832', 'oruQl1R5goegponO9ONU6-1CLk0I', null, null, null, '', null, 'Ray', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK6MibeiaXRJewDzA7TPHtUL049nAiaeByvgvezmx6gbMKXeSzHPwSlTHmuGBISdhdsM8PzP5DVDtHIQ/0', null, null, null, '1', null, '1', 'oruQl1R5goegponO9ONU6-1CLk0I', '2017-07-29 09:42:53', '2017-07-29 09:42:53', null);
INSERT INTO `wc_users` VALUES ('833', 'oruQl1eHXzZLY7gAciJE0FpFx4w8', null, null, null, '', null, '蛋儿～玲(づ￣3￣)づ', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLClUPOo2uicAJxJiaNSV11ricfo79yZhDq8IEKgblW0xEZhwh3tJHicxeyrhEn4osvrY0SxLpXDqz60ng/0', null, null, null, '2', null, '1', 'oruQl1eHXzZLY7gAciJE0FpFx4w8', '2017-07-29 09:42:58', '2017-07-29 09:42:58', null);
INSERT INTO `wc_users` VALUES ('834', 'oruQl1cNNhT1tjA0OQpmdxPcRiXw', null, null, null, '', null, '真善美', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3d6wXTXefkH8BfgKpQncMHRWicgpdGfEV4p1Ge4sU7Ew4IXJSPia0a2OFetg6iah0ST75pUhLPYQb9X/0', null, null, null, '2', null, '1', 'oruQl1cNNhT1tjA0OQpmdxPcRiXw', '2017-07-29 09:43:05', '2017-07-29 09:43:05', null);
INSERT INTO `wc_users` VALUES ('835', 'oruQl1WgApQ8m-VE43NbMEwtoaIQ', null, null, null, '', null, '人生有假如吗', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicK2U7Af830pFQq1Eade0nibnNjYtwIJQeXic1DZfpRRoRYRrIW6a5VNQAxo9nI0JFfpjZHU0Vqwfbd/0', null, null, null, '2', null, '1', 'oruQl1WgApQ8m-VE43NbMEwtoaIQ', '2017-07-29 09:43:16', '2017-07-29 09:43:16', null);
INSERT INTO `wc_users` VALUES ('836', 'oruQl1QLPZ8SuFCsGUZ-nrlUEt5s', null, null, null, '', null, 'Zoe', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzxVeuRMps0X6Glhf84ZqVghnGJB2ROk5iaaKrUfJibvaquAenrQU0H3okGNScrugdwb7AHVHibRwic5t/0', null, null, null, '2', null, '1', 'oruQl1QLPZ8SuFCsGUZ-nrlUEt5s', '2017-07-29 09:43:31', '2017-07-29 09:43:31', null);
INSERT INTO `wc_users` VALUES ('837', 'oruQl1f9jMdmlMTK1Tg8cLAAIUGI', null, null, null, '', null, 'lucifer宏野', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw8FiaxhnCrFQ0bLZx1CBpgYV2wdLbjmWFsg9QFwth1ZzvFBFZJWzicxAMQXVnPpRXxKKmsTr5C2ibHicCbfIt1qTVyw/0', 'uploads/user/837/img1503384880.jpg', null, null, '1', null, '1', 'oruQl1f9jMdmlMTK1Tg8cLAAIUGI', '2017-07-29 09:43:57', '2017-07-29 09:43:57', null);
INSERT INTO `wc_users` VALUES ('838', 'oruQl1f1CdWDKwJ7dMQYCsHpTpZ8', null, null, null, '', null, '姓夏的那个ning―', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw83ibcEJ0JUCtZlicCsUkVMSj1RArXSVH62WRehsvIrmpoBXFDW8wK1Tkfuvq46ehjbib8wIMyzbxAZKuhrniaPYibgk/0', null, null, null, '2', null, '1', 'oruQl1f1CdWDKwJ7dMQYCsHpTpZ8', '2017-07-29 09:44:10', '2017-07-29 09:44:10', null);
INSERT INTO `wc_users` VALUES ('839', 'oruQl1R07vU4yrflXHUbHwEUD57w', null, null, null, '', null, 'nerrisa', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8d6XkU1GxtDKjxmoH0PD40nLpdC0Siaia3dqW9yeQTsEYCo0PjdXRuKFvoicN8ky2kLnQc4fklPCgLLh9NhpmjBhibV/0', null, null, null, '2', null, '1', 'oruQl1R07vU4yrflXHUbHwEUD57w', '2017-07-29 09:44:32', '2017-07-29 09:44:32', null);
INSERT INTO `wc_users` VALUES ('840', 'oruQl1cfTn_oHGyaCouvVfaLrMf4', null, null, null, '', null, 'so what？', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3dzpMIKxUusBh0K1OCeDPsa82rFfoqrUdMBAiajR9uEa0NmqeLibeMSOPEYiaYggKRQIXAGzocFVic9ic/0', null, null, null, '2', null, '1', 'oruQl1cfTn_oHGyaCouvVfaLrMf4', '2017-07-29 09:46:03', '2017-07-29 09:46:03', null);
INSERT INTO `wc_users` VALUES ('841', 'oruQl1cYIQrqFv0YWDauVPr-nJ10', null, null, null, '', null, '曦-Seraph', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8fwHYSicicDjBPy4RAI9oFnTrdbC2UtIepQOicP5uqicYUAxfQqVgA1cmNWKVIibMlUkQEctHjiaLY6SLUXQEAp157MibS/0', null, null, null, '1', null, '1', 'oruQl1cYIQrqFv0YWDauVPr-nJ10', '2017-07-29 09:46:08', '2017-07-29 09:46:08', null);
INSERT INTO `wc_users` VALUES ('842', 'oruQl1TiAvdAhr3igMYk2HyNL8NE', null, null, null, '', null, '空杯心', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae0IYhoiaby7VuYiboAvRIicUf7WmV4H2mibce2icKgQH9EqX257D6aRwic9MILowD8PBAicGFGFBHDMzXCib/0', null, null, null, '2', null, '1', 'oruQl1TiAvdAhr3igMYk2HyNL8NE', '2017-07-29 09:46:10', '2017-07-29 09:46:10', null);
INSERT INTO `wc_users` VALUES ('843', 'lxl123', null, null, null, '$2y$10$orgzs8jFTJaCE58buXjzIODUG8/vOXAv4UIGNKOrx1A6zU06YzPQi', 'NEK8hrtQy1UzMpvt2VkzdIZkToAQtVJlyxMKyzVTlwHX5jrWLm68aETI65L9', '小兰', 'uploads/user/843/img1501300046.jpg', null, null, null, '2', '专业的团队、优质的服务！', '1', null, '2017-07-29 10:37:43', '2017-08-08 16:35:00', null);
INSERT INTO `wc_users` VALUES ('844', 'oruQl1XI48CdvxT7xW91lF7PHcm4', 'zhanghuan@xm12t.com', '18359316330', null, '', null, '张欢', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaUao3CguRSvgnvnYy5vvxhd1Mg2ibRSpAj7jjSVMqFYMDws90AQeMKlZdkrFibfvBolrIicjdnVArSia/0', null, null, null, '1', null, '1', 'oruQl1XI48CdvxT7xW91lF7PHcm4', '2017-07-31 08:32:38', '2017-08-07 09:24:28', null);
INSERT INTO `wc_users` VALUES ('845', 'chen0596', '929418230@qq.com', '18750912481', null, '$2y$10$1m9OU5bdjPHtDIEf5YqLeOVfz3q2UUun0lHJZFSaDuNFGMzw.6t/.', '96MchPu5B874v3aLPtz5q9fHN2KmlX8LxmEsDLyOlsEj7ptLuAfaGvogqMra', '映雪', 'uploads/user/845/img1501554774.jpg', null, null, null, '2', null, '1', null, '2017-08-01 09:26:29', '2017-08-07 17:40:44', null);
INSERT INTO `wc_users` VALUES ('846', 'ZS123', '111222333@qq.com', '18200000000', '0592-1324567', '$2y$10$aVCHqMuX2l.HF0lvILEm6O.UMEpgSLxBcxIBS7CqKXIl3omTn7Hku', 'yeEzyGaGQbh1runnHLTiHZpISzKEv5VZx8xsbHYY3o9P8xOXHJl1NmvBTXvW', '钟帅', 'uploads/user/846/img1501556270.jpg', null, '厦门万石山', null, '0', null, '1', null, '2017-08-01 09:31:13', '2017-08-07 17:33:05', null);
INSERT INTO `wc_users` VALUES ('847', 'shijuying1', '133456789@qq.com', '13606050126', null, '$2y$10$RpQNTvw/kOkvEBLD/9wlpe9.4vVQ8YSuLD8OafPiwqkU0RCyq/j1.', 'zge4q12uLo9pNIsl9g1nig26tVPdPGiNaoBEqeQ3VIwViZq9fXgF9xTnPZRF', '懒懒', 'uploads/user/847/img1501555849.png', null, null, null, '2', null, '1', null, '2017-08-01 09:33:36', '2017-08-07 17:38:15', null);
INSERT INTO `wc_users` VALUES ('848', 'wqjy', null, null, null, '$2y$10$NX6Ktx7aZdcZifPrkPZVVemG3AWImi1tlmX00DDNV.h0W/DwwEUxu', 'zE4Y55EN81aEoRZIwSVn9oXe38To4QN4hRn47zeeu7mQxqDN55oUUcPxE0yJ', '望谦教育', null, null, null, null, '2', null, '1', null, '2017-08-01 09:43:10', '2017-08-07 17:39:51', null);
INSERT INTO `wc_users` VALUES ('849', 'xmtywl', 'f21@qq.com', '13816205123', null, '$2y$10$Bz3YfO9bkfmYBAVOTy4OK.28xYsAzSOfKdeoakjf.hz7dwkFaqIP.', 'wrZ75L2mXSgxKW6fKFUmS1UnCpYpkTTwPkVanIyWpsanaoeK063VaSTYwtf4', '林玉媛', 'uploads/user/849/img1502101106.png', null, '厦门集美区灌口中路49号之（9-14）', null, '2', '厦门兴东峰物流有限公司于2010年10月成立，公司注册资本为318万元整，总公司位于厦门，分别在西安、兰州、西宁、银川、乌鲁木齐、拉萨设立分公司。我司主要承运厦门至西北各省市（陕西、甘肃、宁夏、新疆、西藏等辐射全境）零担或整车箱车平板等专线运输。', '1', null, '2017-08-01 10:32:39', '2017-08-08 15:29:16', null);
INSERT INTO `wc_users` VALUES ('850', 'oruQl1Uiz0AUBBxwnzsgyOZhjTSs', '2246945329@qq.com', '18150145713', null, '', null, '陈艳', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicD8W5lqAlOtMzxK8eibibvQfJW6ocD2TPSPPuO4pDp9pWdBwbibp64Uzx4WvjOr5iaBJGYJFbdfkQjo6/0', null, '杏林湾营运中心1号楼1607', null, '2', '陈艳', '1', 'oruQl1Uiz0AUBBxwnzsgyOZhjTSs', '2017-08-01 13:20:30', '2017-08-01 13:22:10', null);
INSERT INTO `wc_users` VALUES ('851', 'xmgwplc123', '156316333@qq.com', '13589413336', null, '$2y$10$KDvqdnym8trU4CjQH7oVTubFESYlpjaKN6G5QtxxjwRI.Oqzhqq0q', '6UDtevwhgG7xiEiwSJDpgoRE4ZsZdwFSmm6GB42NOb6MvFtk9meW6o4a03lp', '欧阳', 'uploads/user/851/img1501574358.png', null, null, null, '1', '厦门光沃是一家专业从事大型进口系统备件销售', '1', null, '2017-08-01 15:11:07', '2017-08-07 16:19:45', null);
INSERT INTO `wc_users` VALUES ('852', 'oruQl1RX0AJdBCovoCVOXcl8YY3I', '1490302351@qq.com', '18859678890', null, '', null, '叶志强', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzxfhODmPrGJYmMBXE3W8rH9LPtdh8ahThlQcjX5qURxa5RL3H3doDl4vfibyc4VwcbhWfia3DiaopsU/0', null, null, null, '1', '凛冬已至', '1', 'oruQl1RX0AJdBCovoCVOXcl8YY3I', '2017-08-01 17:46:32', '2017-08-01 17:48:28', null);
INSERT INTO `wc_users` VALUES ('853', 'oruQl1aJxpbjewsn__3ZwWfD2L58', null, null, null, '', null, 'mandy', 'http://wx.qlogo.cn/mmopen/YrfFLa3YYsBQAOGkWIib7BKv3xwptumksbLE5oy80l7V2ARJqqtZ7eBa1kHcuWWOIT8ce2xSu60V5NkGVnibtlKHkEd691P2zr/0', null, null, null, '2', null, '1', 'oruQl1aJxpbjewsn__3ZwWfD2L58', '2017-08-01 19:41:28', '2017-08-01 19:41:28', null);
INSERT INTO `wc_users` VALUES ('854', 'oruQl1Z3dVvq3pokBjdHQpvHS5bY', '564555413@qq.com', '18650851910', null, '', 'RjLIGKvXmdwuYPj67Jp9OiperE4atOaTjWNRZqmHObIa88PNER7gKRW6XyjW', '乔托纸尿裤~小汤汤', 'http://wx.qlogo.cn/mmopen/rIQuAY6Wvlqa2XDegSH1wkvrd9nLUPCTOe5htSp1E9ugK2hZHfrNXaJXKMqLl6mEqVsMm3gvvg5opruQL8A7gUoFdhh508Xic/0', null, '龙岩市新罗区商会大厦c栋508', null, '2', null, '1', 'oruQl1Z3dVvq3pokBjdHQpvHS5bY', '2017-08-04 09:13:22', '2017-08-05 11:57:24', null);
INSERT INTO `wc_users` VALUES ('855', 'oruQl1ZEGRabxjpgC0-sBZv_IgBA', null, null, null, '', null, '桎梏', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz1O9PI7EHFRjzZwy0VsiaBEkFiaWMHZnib29Xj0ib98CficDGYQ0iaRXOoUKZVRlEPJSrjlMwvYyytjYkb/0', null, null, null, '1', null, '1', 'oruQl1ZEGRabxjpgC0-sBZv_IgBA', '2017-08-05 09:57:20', '2017-08-05 09:57:20', null);
INSERT INTO `wc_users` VALUES ('856', 'oruQl1fTI1j7LYlCLz0ou-sw-XXk', 'liangye@xm12t.com', '18750903203', null, '', null, '梁烨', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8coZ18ZoeQlqgqKHiae8jEsCoTtHZ3Mdybibbgg1QqrkeiauhuRkQDiaSkJAmOOnYVWtJibUhA9cY1aUtg/0', null, null, null, '2', null, '1', 'oruQl1fTI1j7LYlCLz0ou-sw-XXk', '2017-08-05 10:00:49', '2017-08-05 10:03:39', null);
INSERT INTO `wc_users` VALUES ('857', 'oruQl1Z0RZEztYaPl4x20hB3jTCw', null, null, null, '', null, '丘不是秋天的秋', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicGRjmzavclGY3elurrOTv5RaVVDasciab6qya3YeeULtzNGIYLPwXJ3ZGJRkY64Ib5Yvysl9ajEeN/0', null, null, null, '2', null, '1', 'oruQl1Z0RZEztYaPl4x20hB3jTCw', '2017-08-05 10:01:04', '2017-08-05 10:01:04', null);
INSERT INTO `wc_users` VALUES ('858', 'oruQl1ScePjg_t--uIpFs-lK5eB8', null, null, null, '', null, '孤', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3fr2vvlo24D7WibicbHWO9IYFmkotESWoRZbM23AuVpiaMC4pHj5O5Umqc6IuJs1KZ3apcwKrOW3m9K/0', null, null, null, '1', null, '1', 'oruQl1ScePjg_t--uIpFs-lK5eB8', '2017-08-05 10:04:59', '2017-08-05 10:04:59', null);
INSERT INTO `wc_users` VALUES ('859', 'oruQl1TmPnr36wPo78eOywuJJ0_4', null, null, null, '', null, '哒菠.菜', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCzYp2S5AVANtmWtFvQjVHLByT3hZTsx8GTr3yYib17jcdOGPVf6ExMt70huFG2AMJOaRRUfL2ad2A/0', null, null, null, '2', null, '1', 'oruQl1TmPnr36wPo78eOywuJJ0_4', '2017-08-05 10:06:21', '2017-08-05 10:06:21', null);
INSERT INTO `wc_users` VALUES ('860', 'oruQl1dwB31WUHvqNF-CgCbkaWec', null, null, null, '', null, '陈浩', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzicjqxUSCsOR9ic09EtxweicM7gW0fbjKGOXx2c5LR73wfjF0REyOwqmNnwypw8CiaJXhaenRosleLp8/0', null, null, null, '1', null, '1', 'oruQl1dwB31WUHvqNF-CgCbkaWec', '2017-08-05 10:09:02', '2017-08-05 10:09:02', null);
INSERT INTO `wc_users` VALUES ('861', 'oruQl1QhUx4OIAOKVsTY1-32xElw', null, null, null, '', null, '张大欣。', 'http://wx.qlogo.cn/mmopen/YW4c50BwHwiblwnOhp0ibYjmL0vBDvSICmjJ4wFicCh6LxQFHLpTcBFJTY7h579zeefzXicDpnhOBaDfLvKlOY5gbr3BeKCPicWib2/0', null, null, null, '2', null, '1', 'oruQl1QhUx4OIAOKVsTY1-32xElw', '2017-08-05 10:16:17', '2017-08-05 10:16:17', null);
INSERT INTO `wc_users` VALUES ('862', 'oruQl1VIbXokB2rxxpTh_6J58xM0', 'lihuili@xm12t.com', '15006059663', null, '', null, '李惠丽 滴滴企业出行', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicC0ibkvMnNNenNfFOOUBqBnyhLSpBYEsGfywLqS0Y2GjQJUHbF2ibicRkjibBzicaKrAduia0wSgshpXfH/0', null, null, null, '2', null, '1', 'oruQl1VIbXokB2rxxpTh_6J58xM0', '2017-08-05 10:39:43', '2017-08-17 10:26:25', null);
INSERT INTO `wc_users` VALUES ('863', 'oruQl1QUO4tHKIezxskPzSK2js5M', null, null, null, '', null, '????✈????33', 'http://wx.qlogo.cn/mmopen/gQQO820rz5VaAkGrcX3PaVJ6KoTxuIFlIf0ibY8icJDvc8dXIFPxdHsicEow6UfzQzWdrrVVywiaRmlSiaN9RiamnZaw/0', null, null, null, '2', null, '1', 'oruQl1QUO4tHKIezxskPzSK2js5M', '2017-08-05 10:48:34', '2017-08-05 10:48:34', null);
INSERT INTO `wc_users` VALUES ('864', 'oruQl1YrMC0Y5yUfYr39Bdgm-oMo', null, null, null, '', null, '张佳', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw8UaCRCEznZfcF3zfknyakuyj0LH0coVSBdzEqDQPL3JQl9Suy33wQUCMOsLkA69PSSGAv1JojqQzm3ibSZatkiaF/0', null, null, null, '2', null, '1', 'oruQl1YrMC0Y5yUfYr39Bdgm-oMo', '2017-08-05 10:51:06', '2017-08-05 10:51:06', null);
INSERT INTO `wc_users` VALUES ('865', 'oruQl1QF1fnZYJzGAcJ2tz1fjDz0', null, null, null, '', null, '馒头', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8eiaib8TAJjoMQT9zf3PzzlHpEqEia256qNRDh8icqwtqU2LMmTw91XJK5xOQFdloLMjol8RnKgEPswwW3RFCMW7ZzC/0', null, null, null, '2', null, '1', 'oruQl1QF1fnZYJzGAcJ2tz1fjDz0', '2017-08-05 10:59:05', '2017-08-05 10:59:05', null);
INSERT INTO `wc_users` VALUES ('866', 'oruQl1UR2wIV80nyansdvO3gGSAc', 'cs41@12t.cn', '13959234243', null, '', null, '胤', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3eKZtKTxD2nUUnqcSLYlFuicN0qL0vO1COtsFAiaGj7CgB4b0FCSwLZaqGQDwbmMiafKYiaFMWicrVR3X/0', null, null, null, '2', null, '1', 'oruQl1UR2wIV80nyansdvO3gGSAc', '2017-08-05 11:03:38', '2017-08-05 11:09:18', null);
INSERT INTO `wc_users` VALUES ('867', 'oruQl1cz_TaaMoZrmfoifmzH22jM', 'cs64@12t.cn', '15860727940', null, '', null, '晶晶', 'http://wx.qlogo.cn/mmopen/gQQO820rz5UQBMDlhsWiaGias0QbUZ5prhkZpibicibca5vRRqoalx6V8LrA6Yh1fbp7ibhzQVtEqPMYjeSiarbDbkIKQ/0', null, null, null, '2', null, '1', 'oruQl1cz_TaaMoZrmfoifmzH22jM', '2017-08-05 11:04:49', '2017-08-05 11:06:28', null);
INSERT INTO `wc_users` VALUES ('868', 'oruQl1bUq2KE8waTz89iq-DyUfrU', null, null, null, '', null, '金杰', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicEppbCk3QbmjiajibxvvOxwjI1Rtia8Yqiaf1gOQibPEASnWhhrFH02VCLQEV98PgpfaFxe5D2d9t1boB/0', null, null, null, '1', null, '1', 'oruQl1bUq2KE8waTz89iq-DyUfrU', '2017-08-05 11:05:27', '2017-08-05 11:05:27', null);
INSERT INTO `wc_users` VALUES ('869', 'oruQl1W1P-5Vplqw0ghmXf6i9fIk', null, null, null, '', null, '乐乐爸', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3ayYNIUjKFxlgHIa2MHmicmDwXynSro2d5YXLjRTWthXViaKPqiauKC8khtXYmibEc3FicfAwibNINicrXe/0', null, null, null, '1', null, '1', 'oruQl1W1P-5Vplqw0ghmXf6i9fIk', '2017-08-05 11:08:30', '2017-08-05 11:08:30', null);
INSERT INTO `wc_users` VALUES ('870', 'oruQl1SJPMC0J_JloIURmB17Sgeo', 'wushuangyan@xm12t.com', '18606927436', null, '', null, '百度吴双燕', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaey0jzmzxXwEcJszRibvYjj1oJsnWkxga7CaTib8kjarjGV111RfbYicCELcLbS6yyhbib8Q5QyBn8Qeia/0', null, null, null, '2', '吃的白白胖胖', '1', 'oruQl1SJPMC0J_JloIURmB17Sgeo', '2017-08-05 11:15:43', '2017-08-05 11:17:39', null);
INSERT INTO `wc_users` VALUES ('871', 'oruQl1dqQhYnDILkHhY_gzt29kec', 'caibihua@xm12t.com', '13506095491', null, '', null, '菜', 'http://wx.qlogo.cn/mmopen/gQQO820rz5X7gZjMqRwzVV21Uia5TXCV47QaXoibhScICgGd1cfkaueQ563rlpaqqhv7NGHVDKj62l2wXn2MvxSA/0', null, null, null, '2', null, '1', 'oruQl1dqQhYnDILkHhY_gzt29kec', '2017-08-05 11:18:07', '2017-08-05 11:22:16', null);
INSERT INTO `wc_users` VALUES ('872', 'oruQl1WNldEvLzqwyJ_5JSFt1c8k', 'chenmeifang@xm12t.com', '18250895002', null, '', null, '陈美芳', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3dicZbpOGQjZmXyN4EzYRaQCMcBQKxxWOGicsYctBUq8FXN0jlrm7eu7MC80bC6hLpkJT7zWSa6sqq/0', null, null, null, '2', null, '1', 'oruQl1WNldEvLzqwyJ_5JSFt1c8k', '2017-08-05 11:19:06', '2017-08-05 11:21:36', null);
INSERT INTO `wc_users` VALUES ('873', 'oruQl1Xrhq3IO3TpoU7RfIZpdhwM', null, null, null, '', null, '阿敏', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3faHP3gibntWdxqOlGsF54sswcUR5Z9oCHrGjzjU6XMHgC0YG6Mc05qFRmTNLAicicoShvz2PVSkwT0/0', null, null, null, '0', null, '1', 'oruQl1Xrhq3IO3TpoU7RfIZpdhwM', '2017-08-05 11:21:16', '2017-08-05 11:21:16', null);
INSERT INTO `wc_users` VALUES ('874', 'oruQl1eQ_wxYnxwPuEcG-q239ZOI', null, null, null, '', null, '泉州百度顺', 'http://wx.qlogo.cn/mmopen/rYqlKVibmt5TD6MyradoRntOic4mejMq2EuKcrKuIAicQyMuThFZWXDmXrqV2SOejfaEq6Yy5OfefQ6r3PBdDZXbFh8yibsWp0Aw/0', null, null, null, '1', null, '1', 'oruQl1eQ_wxYnxwPuEcG-q239ZOI', '2017-08-05 11:21:59', '2017-08-05 11:21:59', null);
INSERT INTO `wc_users` VALUES ('875', 'oruQl1VTyyNozRvyT9UkxIXLxc88', '1151476531@qq.com', '13459016162', null, '', null, '小透明', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3VJxXafkxqc7lBTUqRZ1d7eTAYib0HvGpSPK8yxibqhoTGN2n4bkhWIrkYvfQrFg9Dg2HAS1bwmoxib/0', null, '厦门市湖里区', null, '2', null, '1', 'oruQl1VTyyNozRvyT9UkxIXLxc88', '2017-08-05 11:25:36', '2017-08-05 11:26:54', null);
INSERT INTO `wc_users` VALUES ('876', 'oruQl1XAbRaz1yG_2__EtKN6jHxg', null, null, null, '', null, '末日', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz8pricngUYeAV9r6iaLEEaNYWEsiaicudhH0dGpMwrPgw5g3ajZWzotXrl6I4XUl3EBWdibUw76S31Ygs/0', null, null, null, '1', null, '1', 'oruQl1XAbRaz1yG_2__EtKN6jHxg', '2017-08-05 11:26:36', '2017-08-05 11:26:36', null);
INSERT INTO `wc_users` VALUES ('877', 'oruQl1eGhJGPT_9KQcfMS1LLByD8', 'huangxiaoyu@xm12t.com', '18559551483', null, '', null, '鱼', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicOJEKLrkWiawOCyL20jn4j076xBNE8fAl0WqWsPj7iagDnibibdKh9DULbvWVg221JPU3JwrqvMKUhicv/0', null, '少林路亚特大厦四楼', null, '2', '不要生气，要争气！', '1', 'oruQl1eGhJGPT_9KQcfMS1LLByD8', '2017-08-05 11:28:36', '2017-08-05 11:31:03', null);
INSERT INTO `wc_users` VALUES ('878', 'oruQl1Qjsmc5_CYop1cNild4akas', 'zhangxiaoyun@12t.com', '18850748276', null, '', null, '嗯。', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae4LyJh6Y1FtQ0ULxypEZvicdQbZ0e7PRag8ThnzZmnZyqU7e3f98wxdrYJSwAYPEBzJrUnH7Z7icBa/0', null, '福建省泉州市丰泽区东湖街道少林路仁风工业区亚特写字楼4楼', null, '2', null, '1', 'oruQl1Qjsmc5_CYop1cNild4akas', '2017-08-05 11:28:57', '2017-08-05 11:31:32', null);
INSERT INTO `wc_users` VALUES ('879', 'oruQl1d1KDfIY1ORxTktRm46NjpI', '392738962@qq.com', '15859210928', null, '', null, '吴鸿盛', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0ykXajBnibIujEyaRstPoazmq20yW1mbWfnNykLpib34hRof35uKYxGveHoribCicickrSdRibtofWiaYR5lbUaCxmqar/0', null, null, null, '0', null, '1', 'oruQl1d1KDfIY1ORxTktRm46NjpI', '2017-08-05 11:29:04', '2017-08-05 11:29:56', null);
INSERT INTO `wc_users` VALUES ('880', 'oruQl1SMEx10n25XBf9F6FAKnvVs', null, null, null, '', null, '婷', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzib1gmEPTCYb6ibjsy17RZ2z7hP8bUwnZAIEZ5CLibIJnPv9x9t13IPiauV1YFhhzZibB07EW39e0C7AP/0', null, null, null, '2', null, '1', 'oruQl1SMEx10n25XBf9F6FAKnvVs', '2017-08-05 11:29:40', '2017-08-05 11:29:40', null);
INSERT INTO `wc_users` VALUES ('881', 'oruQl1Uh9TJEcfH9CCNhk0Z3ObdE', null, null, null, '', null, '车喵将军', 'http://wx.qlogo.cn/mmopen/gQQO820rz5WuwsqenR5u8Wiayz0A4MllmuWiajnIhhc0dyhogtDffFs079jjgASxgVWcff5mD0Lm0ku2WT6E80Ww/0', null, null, null, '1', null, '1', 'oruQl1Uh9TJEcfH9CCNhk0Z3ObdE', '2017-08-05 11:32:48', '2017-08-05 11:32:48', null);
INSERT INTO `wc_users` VALUES ('882', 'oruQl1em83l7p97J0gfgOu4ZHD7s', null, null, null, '', null, 'ab', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIoTjyRSf1PauczBic7eef5L3zXgSlld43DPSuWpEiaVKf5ze6bqXwtiavJA0ZVLhzick9qRpmyPibSVdg/0', null, null, null, '1', null, '1', 'oruQl1em83l7p97J0gfgOu4ZHD7s', '2017-08-05 11:32:52', '2017-08-05 11:32:52', null);
INSERT INTO `wc_users` VALUES ('883', 'oruQl1dvlyU5Ls62LPnVHVxNQU_I', null, null, null, '', null, 'LDD', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3XWpk5cgq2DgRLSazsyylczlxKRmTSxOd7YxFTnkAM1djhLakgVCibnwjSDMnvqZr5fsAPR7sJRLo/0', null, null, null, '2', null, '1', 'oruQl1dvlyU5Ls62LPnVHVxNQU_I', '2017-08-05 11:34:29', '2017-08-05 11:34:29', null);
INSERT INTO `wc_users` VALUES ('884', 'oruQl1VKz5hkAqkl8ERoIYEfP5GY', null, null, null, '', null, '林肥肥', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw90XuIztiaAyzoJY311hQRRyGxCxsfls2BrwXXsT9SeRXbaklVz49ib76qxBgTchy3S4jx1fsxlhKmXJ6N6oe6AUS/0', null, null, null, '2', null, '1', 'oruQl1VKz5hkAqkl8ERoIYEfP5GY', '2017-08-05 11:35:34', '2017-08-05 11:35:34', null);
INSERT INTO `wc_users` VALUES ('885', 'oruQl1VDB7uy1Gdkc0PP9a1dEAmA', 'cs83@xm12t.com', '18650170762', null, '', null, '葛晓丹', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKxAcBFA1CaeyMpOibaX3S8AMON4LiaksdrCJRicIuPw1pD4Ks9WHGj9PyfdFaiaWicVUlHvAWQXYYcuVQ/0', null, '福建省厦门市思明区软件园二期观日路36号201单元', null, '2', null, '1', 'oruQl1VDB7uy1Gdkc0PP9a1dEAmA', '2017-08-05 11:42:47', '2017-08-05 11:45:15', null);
INSERT INTO `wc_users` VALUES ('886', 'oruQl1c1qYTraHo1ZJgG4_a-9LYY', null, null, null, '', null, '高美美', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3YNavVng6zuXNNPicLiagJicHoTvR3d6V16zkkUicicicmEDNia9ofCFiacsc4SHmk37mhiakZyZ2yHPicDvSz/0', null, null, null, '2', null, '1', 'oruQl1c1qYTraHo1ZJgG4_a-9LYY', '2017-08-05 11:48:13', '2017-08-05 11:48:13', null);
INSERT INTO `wc_users` VALUES ('887', 'oruQl1TgTmHstRudz8fMdTHOGebI', null, null, null, '', null, '刘亲贵(柯斯曼可乐机)', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cnzWRVnR1wLhRjsQIAgEbKVNVdxIpiamsqH8ibp4Y5S0ZucAPMxJyJKOz6uCyWAtwXVBiac1Q6nPcxbEJ3XLh1hUS/0', null, null, null, '1', null, '1', 'oruQl1TgTmHstRudz8fMdTHOGebI', '2017-08-05 13:08:38', '2017-08-05 13:08:38', null);
INSERT INTO `wc_users` VALUES ('888', 'oruQl1QhcXLj91rDZj7hDq10Hvqo', null, null, null, '', null, 'A陈晓雄(百度推广、网站建设)', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJmRacFOcOicd3wr4k05ZaYVHKYnibj9oc2545oOZC2uI55OReICoAdm1PzpDJqkeiaaqpWNC1sBA2ibA/0', null, null, null, '1', null, '1', 'oruQl1QhcXLj91rDZj7hDq10Hvqo', '2017-08-05 15:01:03', '2017-08-05 15:01:03', null);
INSERT INTO `wc_users` VALUES ('889', 'oruQl1UzMTnlJSnEoV5iCdWSgasM', '942603688@qq.com', '15766597835', null, '', null, '骆骆', 'uploads/user/889/img1501949449.jpg', null, '惠州市壹生艺装饰设计工程有限公司', null, '1', '承接，各种工装，家装，别墅，酒店，园林设计等工程！有需要直接上面电话咨询。谢谢！???? ', '1', 'oruQl1UzMTnlJSnEoV5iCdWSgasM', '2017-08-06 00:09:24', '2017-08-06 19:01:47', null);
INSERT INTO `wc_users` VALUES ('890', 'oruQl1RUGvWI1U9sXZ5n1b81CSAY', null, null, null, '', 'ZUjVzKIu739xkZ0GYsg3b4nDrn95ZsSjoP6y5MYmuXQKt9xCoeAYQJbDmQ9c', '南', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5aTnItKxibndfKODThnqtDmAJqoczjCKD0rGOu4EPGbAURjdLuvdCTq0LzsCm3iaXbKhTp8kMFnnqtVC51IOEsTC5/0', null, null, null, '1', null, '1', 'oruQl1RUGvWI1U9sXZ5n1b81CSAY', '2017-08-06 16:07:26', '2017-08-06 16:09:27', null);
INSERT INTO `wc_users` VALUES ('891', 'oruQl1e7--Qhv09z_yRA3SmlN6I0', 'Jhh@126.com', '13888888888', null, '', null, '空山新雨后', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCTiaJSL72lNep9E0ia4KTnMEZyhdnk0wXiaBnfrPjXbJwWMtObq0tq6S7f1ORGCxAblbVUw0LjPHbnw/0', null, null, null, '1', null, '1', 'oruQl1e7--Qhv09z_yRA3SmlN6I0', '2017-08-06 22:11:53', '2017-08-06 22:13:39', null);
INSERT INTO `wc_users` VALUES ('892', 'oruQl1VP_QuTRYgGLLzR1jhH1pFE', 'yuyichong@ydbaidu.net', '18675234293', null, '', null, '余亿冲', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7rGr4SRKnsCcXyPJo67TzowGqwO29nicMIguJc6tiaoibvQHYXNJLicm4ebic5yQ30FcG63SIZyuqTL6ejFy5Z6jibj7sNibEakKScmk/0', null, null, null, '1', null, '1', 'oruQl1VP_QuTRYgGLLzR1jhH1pFE', '2017-08-07 08:21:16', '2017-08-07 08:22:34', null);
INSERT INTO `wc_users` VALUES ('893', 'oruQl1eAxN4e2VCHq7jBeS7tperc', null, null, null, '', null, 'Lucky 爱使小性子????', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8eG2meNDnMPGrCc2P0Ez6nBjA9j7n0SAgFwZtmtZttlibUQsBdrVVoAoYUKC2V4JQc4WRYvYnwZMhxY6QicDVlAKZ/0', null, null, null, '2', null, '1', 'oruQl1eAxN4e2VCHq7jBeS7tperc', '2017-08-07 08:31:48', '2017-08-07 08:31:48', null);
INSERT INTO `wc_users` VALUES ('894', 'oruQl1UXyeBiRv8WLi2WNXhUl2ho', 'zhangjuqing@xm12t.com', '13860283004', null, '', null, '张菊清', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC7u59WWyYTW73q9yibjJBl3bBzHA348sJ4pU8x3GNSxvpclic0G4QYouhuzbvgyKPibWxkVzGZgHjpQ/0', null, '福建省龙岩市新罗区龙岩大道商会大厦C栋508单元', null, '2', null, '1', 'oruQl1UXyeBiRv8WLi2WNXhUl2ho', '2017-08-07 08:34:44', '2017-08-07 08:36:23', null);
INSERT INTO `wc_users` VALUES ('895', 'oruQl1cNCPr1CnZbf-H9x9tKJboE', 'fengyq@ybaidu.net', '15976119791', null, '', null, '冯钰荃', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuTtXvrt0QPr1xGbEwVvjdJbxMGXZopCSp4XDJ6ADiaDrcwpeM2do4d70Da8jPHFxkkkDXNpQqpo4MNL1pAPLPPfx/0', null, null, null, '2', null, '1', 'oruQl1cNCPr1CnZbf-H9x9tKJboE', '2017-08-07 08:34:57', '2017-08-18 08:30:34', null);
INSERT INTO `wc_users` VALUES ('896', 'oruQl1ahZuEtBnff_ZNhVSrhu5-w', null, null, null, '', null, '周项委', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae11HsIrsYvJSRbYc8jwvXhib9pnmhQA8Q2zJ6pB0iax0ibt4VuIAQEXyykEuokjXU9TBux0XVx8AcZd/0', null, null, null, '1', null, '1', 'oruQl1ahZuEtBnff_ZNhVSrhu5-w', '2017-08-07 08:36:04', '2017-08-07 08:36:04', null);
INSERT INTO `wc_users` VALUES ('897', 'oruQl1aBnBL7KEkB1FTVpvO3hYvY', null, null, null, '', null, '杨仔y^o^y', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8e8soib73gwBnG9zwZzaxowhO51bKq6VHbHFnksFTbhjwuB5JqEaJwoVCVtmCxA6GEJxlcI9S6PayW45bzzR0ic8z/0', null, null, null, '2', null, '1', 'oruQl1aBnBL7KEkB1FTVpvO3hYvY', '2017-08-07 08:38:42', '2017-08-07 08:38:42', null);
INSERT INTO `wc_users` VALUES ('898', 'oruQl1fytpTfzlYW_lXgmdSsEtic', null, null, null, '', null, '丁丁', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae5P5NHO2a1nnahurjUM9hHR4FkQtFpQa8sbicicNTxABGHJ5QB54688VFSOmHWBkSR9ZND3nxiaMIiaC/0', null, null, null, '2', null, '1', 'oruQl1fytpTfzlYW_lXgmdSsEtic', '2017-08-07 08:39:13', '2017-08-07 08:39:13', null);
INSERT INTO `wc_users` VALUES ('899', 'oruQl1YD1GiWPGzUNeYr7P7zpeqY', 'lanyihu@xm12t.com', '18205920280', null, '', null, '蓝毅湖', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3YAD799xgxwSuE8sjUjCpqKXEDR5bOiaics6068uzUPNWmLZFFEhiblic6NgVYsTibV2kwavuyOmRaXMa/0', null, null, null, '1', '勇者无畏', '1', 'oruQl1YD1GiWPGzUNeYr7P7zpeqY', '2017-08-07 08:40:50', '2017-08-07 08:58:34', null);
INSERT INTO `wc_users` VALUES ('900', 'oruQl1cwZllpbf0JV_LYnJngTjHQ', 'chenmeizhen@xm12t.com', '13959268065', null, '', null, '陈美珍', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae6YriaSYCA2XdgmvvTNQNUMozwlly5ZjPnVibysic77icxHyJaFEjS14ZPnObGqljAFUbOUMyuibw1lsk/0', null, null, null, '2', null, '1', 'oruQl1cwZllpbf0JV_LYnJngTjHQ', '2017-08-07 08:44:45', '2017-08-07 08:46:35', null);
INSERT INTO `wc_users` VALUES ('901', 'oruQl1ZYeAyN82l4sVdXLW7VHiCI', null, null, null, '', null, 'YuJ.', 'http://wx.qlogo.cn/mmopen/GsLIUaSWreeibdXpHpU4SNo0zwW2BTNWFLvGrpD1Q8mmibLXqwFNCiayDnIFB0gkKykMicnEHayC1Xaq9Ugjicbqr7XTo9qUSoDbb/0', null, null, null, '2', null, '1', 'oruQl1ZYeAyN82l4sVdXLW7VHiCI', '2017-08-07 08:45:30', '2017-08-07 08:45:30', null);
INSERT INTO `wc_users` VALUES ('902', 'oruQl1eEQSxEbTx1FCUmXHD0wOAU', null, null, null, '', null, '黄钰洲', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCtz2UJ574upuaqj7U1MP8p7DkzSYYU5KzWZpA1JU4y4ZBP6ibHVsfHaia2SxSlxgUgYHobNs6yyVlw/0', null, null, null, '1', null, '1', 'oruQl1eEQSxEbTx1FCUmXHD0wOAU', '2017-08-07 08:45:44', '2017-08-07 08:45:44', null);
INSERT INTO `wc_users` VALUES ('903', 'oruQl1SdJ0f13p1IZUbLME4CquK0', 'linxiaodong@xm12t.com', '18030164883', null, '', null, '林晓东', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM52Q8fkdBHka6A90CzLsHjLP9vCp4WVvY7wh9wbTbLFY4Sib6tzwxM8lQfZgsMXuicV1icxxywZsNxZA/0', null, '厦门市思明区软件园二期观日路30号201室', null, '0', '林晓东', '1', 'oruQl1SdJ0f13p1IZUbLME4CquK0', '2017-08-07 08:47:57', '2017-08-07 08:51:16', null);
INSERT INTO `wc_users` VALUES ('904', 'oruQl1R78KcQz11oeXvM3fVLGefk', 'huyi@ydbaidu.net', '13794126391', null, '', null, '仪', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuRQ7qAIFTR0Zw5GQSs20pkE0KPAXViauSz8dhdU3ACwvG3e7KqibtuGP3tFBQxiaeSFvDQbKJ0gCRNZeF3FxgJkbat/0', null, null, null, '2', null, '1', 'oruQl1R78KcQz11oeXvM3fVLGefk', '2017-08-07 08:49:38', '2017-08-07 08:50:18', null);
INSERT INTO `wc_users` VALUES ('905', 'oruQl1bR-X61QUVo01BE_KeujiG4', '1302199803@qq.com', '15759221855', null, '', null, '朱晓婷', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaeicSujL4aOAOoV0G7SjicoDUkfxlEHA4UYyhDhCrfHSuoATwCx184NNEzrCM4MMsIjInKXejQzkrLC/0', null, null, null, '2', null, '1', 'oruQl1bR-X61QUVo01BE_KeujiG4', '2017-08-07 08:50:57', '2017-08-07 08:51:31', null);
INSERT INTO `wc_users` VALUES ('906', 'oruQl1ZnPlfChuH6ssKG63oxEJ_Y', null, null, null, '', null, '鹅仔', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3WAiajWukMMONNFCkzYTL8ge64zsk2IbmRyO7ZzO1hfYZkc7OiaPEb3y2ndLyiawo3dMVgk5L8dy4EP/0', null, null, null, '2', null, '1', 'oruQl1ZnPlfChuH6ssKG63oxEJ_Y', '2017-08-07 08:51:02', '2017-08-07 08:51:02', null);
INSERT INTO `wc_users` VALUES ('907', 'oruQl1ZWVpqC8TrbOXnQpLW5KwRI', '280489478@qq.com', '18760076616', null, '', null, '廖淑云', 'http://wx.qlogo.cn/mmopen/gQQO820rz5UCX0vqriahFaXjVcvc9C9SnXrsX7MKTkKiaK4tmyD8iag4gRSutyUustE1Rme0DjeIYBnV7ZW2w6M5w/0', null, null, null, '2', null, '1', 'oruQl1ZWVpqC8TrbOXnQpLW5KwRI', '2017-08-07 08:53:17', '2017-08-07 08:57:33', null);
INSERT INTO `wc_users` VALUES ('908', 'oruQl1fPki3UU-pHcV1ttgJl_rWk', '1814268474@qq.com', '13642220816', null, '', null, '林桂芬', 'http://wx.qlogo.cn/mmopen/gQQO820rz5UBohV3EcCYS3J3uSK2JqGTu7lTtnQfpZWm1piaLzMQas8KK2bOt5wcbAzlic0CtQp4bVwvVZx4dGMA/0', null, null, null, '2', null, '1', 'oruQl1fPki3UU-pHcV1ttgJl_rWk', '2017-08-07 08:55:57', '2017-08-07 08:58:14', null);
INSERT INTO `wc_users` VALUES ('909', 'oruQl1SaGR7q6SabAD3vKILFvqtU', null, null, null, '', null, '胡晓坤', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaezQhKOr73FqA5OOjfvcAyBcEzAXnVC5Smb9wJ7mpADMcYeTpANuQfZLuRkM0xWEk3MvPmG4z6iau4/0', null, null, null, '1', null, '1', 'oruQl1SaGR7q6SabAD3vKILFvqtU', '2017-08-07 09:00:13', '2017-08-07 09:00:13', null);
INSERT INTO `wc_users` VALUES ('910', 'oruQl1doUeg4VThT5g3NXwq8nJLc', null, null, null, '', null, '百度张佳雯', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM73CNibEeBTrM7byEIMMyL0IzKA5ue5Xt3sMLTTzD7TlWkxHXibicwRZZ5JAH0uJyG268EPhBfWnjFSynyn4euyHxFh1bGhpS0pLM/0', null, null, null, '0', null, '1', 'oruQl1doUeg4VThT5g3NXwq8nJLc', '2017-08-07 09:02:50', '2017-08-07 09:02:50', null);
INSERT INTO `wc_users` VALUES ('911', 'oruQl1QkIHn5-ayx7kn2WIeEPPxo', null, null, null, '', null, '莉℃????', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz2b8HVeVPIBeTyuTZurm6yWdeWxRfFr6zQGYMibdGH1rq1wHRLAMrib7KdtG9oHyYx3PNJ6UzW3R3H/0', null, null, null, '2', null, '1', 'oruQl1QkIHn5-ayx7kn2WIeEPPxo', '2017-08-07 09:03:13', '2017-08-07 09:03:13', null);
INSERT INTO `wc_users` VALUES ('912', 'oruQl1eybT1jnYSAVVvGsszLTxPQ', null, null, null, '', null, '卢卢。', 'http://wx.qlogo.cn/mmopen/YW4c50BwHwibXMYtQHLPejxJjsic7911YR3yv1Q5GjxicwMy6y3XtgN3wlNnrzqrdFVbpeiaibvlibHsNzMLoVbibpz2PP9MxBfcnicl/0', null, null, null, '2', null, '1', 'oruQl1eybT1jnYSAVVvGsszLTxPQ', '2017-08-07 09:07:07', '2017-08-07 09:07:07', null);
INSERT INTO `wc_users` VALUES ('913', 'oruQl1aIyht61xNU44nuTZOo9ewo', null, null, null, '', null, '海市蜃楼', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuRdmwrOFQQIhXzRz89vJcPkuhDsqB7YTH4NmD8PaHnCnXOChnu5Q8UQZ0q61dicbvNzdkt6twvQ4W42s7MDicpHZQ/0', null, null, null, '1', null, '1', 'oruQl1aIyht61xNU44nuTZOo9ewo', '2017-08-07 09:08:24', '2017-08-07 09:08:24', null);
INSERT INTO `wc_users` VALUES ('914', 'oruQl1bO4DGZ-47QB5lJyoOuhoWI', null, null, null, '', null, '陈巧云', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM73CNibEeBTrM7byEIMMyL0Il2d6XkibIuibRzEVQ11CBZ8KzHNj5EmfpFLDageKNEdyhiapA3ibSTg2kMfnRkvtZWDFVLJLx7G1ggs/0', null, null, null, '2', null, '1', 'oruQl1bO4DGZ-47QB5lJyoOuhoWI', '2017-08-07 09:13:38', '2017-08-07 09:13:38', null);
INSERT INTO `wc_users` VALUES ('915', 'oruQl1TCCTpAjeEVloVtB2Efrjjw', null, null, null, '', null, 'Angel', 'http://wx.qlogo.cn/mmopen/lib3mfM6jribsZnbWm0OTKqcxGtRZoB5uBOhqRcWl4xhFad8BDAh5Yhl9NDNKzx3ibREgYYgDIkm5O9atFrTia1pJBdvicUmGZazy/0', null, null, null, '2', null, '1', 'oruQl1TCCTpAjeEVloVtB2Efrjjw', '2017-08-07 09:16:01', '2017-08-07 09:16:01', null);
INSERT INTO `wc_users` VALUES ('916', 'oruQl1appum4PxI0FzVFl9DTMxUM', 'huangchao@ydbaidu.com', '13902276646', null, '', null, 'Huang C〇', 'http://wx.qlogo.cn/mmopen/UJKgUU1OkU4VgJibFxgHgiao6RfM69ia68qrt1Ysf6ZcaGb1Zcp86ozo3JWdNT9W6fNy4asbJiaPS5ic04BwWrmibPfcRbzVT74Utia/0', null, null, null, '1', null, '1', 'oruQl1appum4PxI0FzVFl9DTMxUM', '2017-08-07 09:17:08', '2017-08-07 09:18:24', null);
INSERT INTO `wc_users` VALUES ('917', 'oruQl1WipTn59-NJF86tTdJqnO6M', null, null, null, '', null, '粤东百度-李志伟', 'http://wx.qlogo.cn/mmopen/rYqlKVibmt5TD6MyradoRnl4glyQ2ANpoNzcGmiaSwUu7Skc7ExAQtA5g8d29HqhiaZjSarNpibnophUPZfzz3rKTictUaKQNCZsY/0', null, null, null, '1', null, '1', 'oruQl1WipTn59-NJF86tTdJqnO6M', '2017-08-07 09:18:28', '2017-08-07 09:18:28', null);
INSERT INTO `wc_users` VALUES ('918', 'oruQl1RC7t2qbLu9Vhten93oHZGg', null, null, null, '', null, '汤圆', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuRFfdd107cocyoI58IxY7icOobSibuzTyfzh9fIAjic3efIVnV64UPtzx3zofia6s0HUaiaQ3MRktJ7yOxDAJOrBH9FN/0', 'uploads/user/918/img1503369568.jpg', null, null, '2', null, '1', 'oruQl1RC7t2qbLu9Vhten93oHZGg', '2017-08-07 09:21:29', '2017-08-07 09:21:29', null);
INSERT INTO `wc_users` VALUES ('919', 'oruQl1WwXmFzl6xA1CRdP0znEChQ', 'xionglin@xm12t.com', '15750751269', null, '', null, '♔♚琳宝贝。', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8d2VmX3iaFqcXXlz5UnvcytlibUK7YLMFv366QjyhQ5dNlS7ILVibWrTjX66cgTiawM0CDNtyBMbTa5cV2xnv2UJhf7/0', null, '厦门市思明区观日路36号', null, '2', '没签名', '1', 'oruQl1WwXmFzl6xA1CRdP0znEChQ', '2017-08-07 09:27:43', '2017-08-07 09:29:13', null);
INSERT INTO `wc_users` VALUES ('920', 'oruQl1T__xPK6ir9wcz0xvr7GPGQ', null, null, null, '', null, '南港旧人', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6Yp0I1iah4xYBbFXn0X1oQ33oZ4hN7jD8Bewg8KXibicLKic34DY4u2NMOyFFicyfVuhQCxibn0m8d8WMEn40Xydph7xgrNUYhYyFMI/0', null, null, null, '1', null, '1', 'oruQl1T__xPK6ir9wcz0xvr7GPGQ', '2017-08-07 09:31:56', '2017-08-07 09:31:56', null);
INSERT INTO `wc_users` VALUES ('921', 'oruQl1SVueHy2afLCVIQuBflYvPE', null, null, null, '', null, '卷卷', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz5LfDSSJ089N7XVNsWRuJFLSxibRJYEBZK9gvMGIZdnuPHX7fZPu4lZXgEkZ1ZS4ezKic2L2V0ia9zL/0', null, null, null, '2', null, '1', 'oruQl1SVueHy2afLCVIQuBflYvPE', '2017-08-07 09:35:42', '2017-08-07 09:35:42', null);
INSERT INTO `wc_users` VALUES ('922', 'oruQl1REDiUy168pjVxzEej6Fass', null, null, null, '', null, '秋秋', 'http://wx.qlogo.cn/mmopen/rYqlKVibmt5TD6MyradoRntmXK0HLQecPIrUBicrN9sQBr40eLqUSibkVnYeumObsWD4NeNUTQtdZ6f2WkTvMdCyo8G5crAnGQc/0', null, null, null, '1', null, '1', 'oruQl1REDiUy168pjVxzEej6Fass', '2017-08-07 09:37:33', '2017-08-07 09:37:33', null);
INSERT INTO `wc_users` VALUES ('923', 'oruQl1XRQHbn0p4kh4c9IFiHXywk', '834735197@qq.com', '13794070858', null, '', null, '夏丐', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaeyhdc8t9xCqfkt2HBGkV7sc9YTRMmz6DiaibHjxTCjdk34dhUcURBLH1UMicHj8ARRVmbfIjkAOgSZm/0', null, '惠州市惠城区河南岸演达大道9号华阳大厦24楼', null, '1', null, '1', 'oruQl1XRQHbn0p4kh4c9IFiHXywk', '2017-08-07 09:38:01', '2017-08-07 09:39:04', null);
INSERT INTO `wc_users` VALUES ('924', 'oruQl1f0jc__e_bgmTo6cwFvUn-I', 'xewc@ydbaidu.net', '13790770063', null, '', null, '谢文彩', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuRFEhlAafYxPEEQa0ib0Sl90g93gxLyta9hB2EPUbHx5y6QRO5BehJBwzVUSlulDib1D3OrgjTSU3FodEwUU84Jo0/0', null, null, null, '2', null, '1', 'oruQl1f0jc__e_bgmTo6cwFvUn-I', '2017-08-07 09:38:18', '2017-08-07 09:39:28', null);
INSERT INTO `wc_users` VALUES ('925', 'oruQl1eAyeOuEobmfFeR09ZbUZgk', null, null, null, '', null, 'E嘉', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4gQ5SauxsxBPndTqAMB37X9TVRjiaYibVZicZHCMRo3YQnnbicwrRZh2Msu1w5wgydY4VcDDyTxG8J5g/0', null, null, null, '1', null, '1', 'oruQl1eAyeOuEobmfFeR09ZbUZgk', '2017-08-07 10:04:56', '2017-08-07 10:04:56', null);
INSERT INTO `wc_users` VALUES ('926', 'oruQl1eo0diSn8HpkbOjK-Y-7GAc', null, null, null, '', null, '菜肉包包', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8e8soib73gwBnO5z84E1FIvPiaZVTARiagHS3OEjMQoHnTYwdmytl9hvvzkUs7PS5VwrjYQ6aYiawBz1cUee3q1gKCR/0', null, null, null, '1', null, '1', 'oruQl1eo0diSn8HpkbOjK-Y-7GAc', '2017-08-07 10:19:53', '2017-08-07 10:19:53', null);
INSERT INTO `wc_users` VALUES ('927', 'oruQl1XfgWG3IWTbey698MXQhn0M', null, null, null, '', null, '唯风潇洒', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3YQiaV3OCOH6qrKXiaY6Wak3JzJqkaxREKpZoFdvSSjkibkxYQ7AUKKy5ICEefbDmSialraUlJ9icKqXv/0', null, null, null, '1', null, '1', 'oruQl1XfgWG3IWTbey698MXQhn0M', '2017-08-07 10:23:23', '2017-08-07 10:23:23', null);
INSERT INTO `wc_users` VALUES ('928', 'oruQl1Y5Xae1opGL-N4uBRVEABTA', null, null, null, '', null, 'Linda.gu', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELUEHciaRTfPV2QlNd63vyYZm1hIbBq1s9Yq80LHzShSml1WdMfOZ1aK5qwuOXGe9rKCtmeiaia91icBg/0', null, null, null, '0', null, '1', 'oruQl1Y5Xae1opGL-N4uBRVEABTA', '2017-08-07 10:32:07', '2017-08-07 10:32:07', null);
INSERT INTO `wc_users` VALUES ('929', 'oruQl1dfogvUCSHvlrF9bnJ2s1Bk', 'zhuoxiaoling@xm12t.com', '18250161173', null, '', null, '卓小玲', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicKyLT8m0sjwJqAHibEUg9ias54sT008xxpWXia2g297YeAoZUINA2pMosg0AVZTJuq2CBO3CVZcLXL6/0', null, null, null, '2', null, '1', 'oruQl1dfogvUCSHvlrF9bnJ2s1Bk', '2017-08-07 10:36:21', '2017-08-17 10:41:52', null);
INSERT INTO `wc_users` VALUES ('930', 'oruQl1Z5UmWZI2D4ktnMlbU31NYo', 'zhenghua@xm12t.com', '15059893596', null, '', null, '郑华', 'http://wx.qlogo.cn/mmopen/gQQO820rz5UsEYczULnY0MlCANcicr0tyzaycaEiataTlEfqTlBcWmBz48jC2KhppNic9Zj0HI0enZB90RgsPr4rQ/0', null, null, null, '2', null, '1', 'oruQl1Z5UmWZI2D4ktnMlbU31NYo', '2017-08-07 10:51:38', '2017-08-07 10:53:38', null);
INSERT INTO `wc_users` VALUES ('931', 'oruQl1Yb-zGd3lba5OfDjcsxW2Fo', null, null, null, '', null, '爱舞学堂', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicKHMltuYJCKZzA5NtRDsuATf9LrZJc6hWMgxgRzGibNicv2K8uEBcj3iaQpdKwIen8qnyk6Q4dPXsDj/0', null, null, null, '2', null, '1', 'oruQl1Yb-zGd3lba5OfDjcsxW2Fo', '2017-08-07 10:58:44', '2017-08-07 10:58:44', null);
INSERT INTO `wc_users` VALUES ('932', 'oruQl1XZsmR-90U6_HNew_ojWhjE', null, null, null, '', null, '小调调', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3TbAic4OSibJGYL76x7GNdicdNdknhxeyvxfXzNLaV0y9Gj1sicoziaZlPWibUy12P2Uka9jAQvweO08ml/0', null, null, null, '2', null, '1', 'oruQl1XZsmR-90U6_HNew_ojWhjE', '2017-08-07 11:19:36', '2017-08-07 11:19:36', null);
INSERT INTO `wc_users` VALUES ('933', 'oruQl1R88ieNwuT4F-m-bxpdDMlY', null, null, null, '', null, '∞ O', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5NA7YRt1z835qMTXFuXnnYL3uxnE0Jia266eVJfNIoOQLmNYGKd4nYIq2apBToOZOicicPHogOcOWFQ/0', null, null, null, '2', null, '1', 'oruQl1R88ieNwuT4F-m-bxpdDMlY', '2017-08-07 11:24:35', '2017-08-07 11:24:35', null);
INSERT INTO `wc_users` VALUES ('934', 'oruQl1dzuRG0TRafCAfJu4LUbKpE', null, null, null, '', null, 'Alsioncai', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKia1l3SUh5H4zGfFr28oCQWNR6ic8A9kicfjOXaI5p89hLuh8nLshGqsQn9WVDsYt5gbFqwax8Ode2A/0', null, null, null, '1', null, '1', 'oruQl1dzuRG0TRafCAfJu4LUbKpE', '2017-08-07 11:25:46', '2017-08-07 11:25:46', null);
INSERT INTO `wc_users` VALUES ('935', 'oruQl1RtAbzFMzZUH5577zRdG8xk', null, null, null, '', null, '百度小黎', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw90XuIztiaAyzpHToiab4yw5ajL5YDzV7Zmlw29bQnKicXVEGCpBVUOj8Ns8pH7fbkyrB0IiblmRHAEJJc1CAHojcTt/0', null, null, null, '1', null, '1', 'oruQl1RtAbzFMzZUH5577zRdG8xk', '2017-08-07 11:34:08', '2017-08-07 11:34:08', null);
INSERT INTO `wc_users` VALUES ('936', 'oruQl1VofnSrnArUU1pUS9r6nfqw', '282720274@qq.com', '18923928300', null, '', null, '思东', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8fJTU0ialWxP1vA2VrhpeOuaJibkaribo7vC0x4xuV6dVyNLmnZR2Rl3NaPhsa56FvFIzlAsNNck6wCDicZGwPGztSs/0', null, '广东省汕头市金平区长平路中源大厦1302', null, '1', '勿忘初心，方得始终', '1', 'oruQl1VofnSrnArUU1pUS9r6nfqw', '2017-08-07 11:39:19', '2017-08-07 11:44:15', null);
INSERT INTO `wc_users` VALUES ('937', 'oruQl1btr6tu8Htj0Fb69pX7Rr7s', '350134534@qq.com', '13612352833', null, '', null, 'DS.G', 'http://wx.qlogo.cn/mmopen/VotociceOYnJ9ok1Y2jGwEqwa9ol6Xqgv9lKWBkVIcGzicb19oJyXSzuOydkiaatPSO9h3UuJ3tlt8I8iaVaRia6IrCia0ajnUpQjD/0', 'uploads/user/937/img1503370960.jpg', null, null, '1', null, '1', 'oruQl1btr6tu8Htj0Fb69pX7Rr7s', '2017-08-07 12:15:13', '2017-08-07 12:17:06', null);
INSERT INTO `wc_users` VALUES ('938', 'oruQl1QWFvQsXqcmIy0oUCXQw3og', '69957766@qq.com', '15322625606', null, '', null, 'A庆庆庆', 'http://wx.qlogo.cn/mmopen/gQQO820rz5WZP0TaHhqeVuayyClfFMyL1y0OnbKagCoUKDmzZ75XOZeIqIFR5Nr7mhBQ8PqR6icIGia1cgxSaNmicXDxPFdngb9/0', null, null, null, '1', null, '1', 'oruQl1QWFvQsXqcmIy0oUCXQw3og', '2017-08-07 12:29:01', '2017-08-07 12:29:51', null);
INSERT INTO `wc_users` VALUES ('939', 'oruQl1TbvHBFl13D7E3mki5rN5zo', 'chenlinfei@xm12t.com', '13860149223', null, '', null, '陈霖霏', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzibZP0NFhDFh02TvrCDtmqKT0JrAnZu5dDt24pXESLia5qunzp2TLM23DdChqjgfWFDIdBKzOnRl1m/0', null, null, null, '1', null, '1', 'oruQl1TbvHBFl13D7E3mki5rN5zo', '2017-08-07 13:52:41', '2017-08-07 13:59:54', null);
INSERT INTO `wc_users` VALUES ('940', 'oruQl1Vkruw1uOJyHdxCBWE0fBh4', 'suhan@xm12t.com', '13695903944', null, '', null, '苏菡', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz3EXgH3PMDwI5wZLx3Jc42Qzu2byrj4LgFCCiclnkpnLTaR7BHYTpUWNeTuPoHjf3JPhGVLyM4vibS/0', null, '厦门市思明区软件园二期观日路36号之一201室', null, '2', null, '1', 'oruQl1Vkruw1uOJyHdxCBWE0fBh4', '2017-08-07 13:55:29', '2017-08-08 08:56:35', null);
INSERT INTO `wc_users` VALUES ('941', 'oruQl1Zn9JWgKWnd8lkntCnVfBlo', 'pengmin@xm12t.com', '13655909859', null, '', null, 'Sandglass', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5GHpJIhJNrEWWqX9HKia3YzmtnibiaxgWVreFCPsCSRXnbaCW1r1jSFb3x6Kc1G9icwnY7KwUp2xoNz5AnanCdUKic7EAOicZfzELJ8/0', null, null, null, '2', null, '1', 'oruQl1Zn9JWgKWnd8lkntCnVfBlo', '2017-08-07 13:58:20', '2017-08-17 10:31:50', null);
INSERT INTO `wc_users` VALUES ('942', 'oruQl1f7YSb-BuhXrvi_ttTWsfLg', null, null, null, '', null, 'PT', 'uploads/user/942/img1503384407.jpg', 'uploads/user/942/img1503384992.jpg', null, null, '1', null, '1', 'oruQl1f7YSb-BuhXrvi_ttTWsfLg', '2017-08-07 14:12:45', '2017-08-22 14:49:45', null);
INSERT INTO `wc_users` VALUES ('943', 'oruQl1avcjM6DmouzJNvoW6xgudg', '932827774@qq.com', '15159013161', null, '', null, '肖凯', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw90XuIztiaAyzlYbaZia830sLogVLRdu2c3JdQC1e7F4oicaCrEo28DkJPVia8FibTbg1ZAexzg3NaYUDqCZNvHiaibcCia/0', null, null, null, '2', null, '1', 'oruQl1avcjM6DmouzJNvoW6xgudg', '2017-08-07 14:37:59', '2017-08-07 14:41:30', null);
INSERT INTO `wc_users` VALUES ('944', 'oruQl1Uk4oeud8lAjBscUnpb5BkI', 'wenjl@ydbaidu.net', '13632020283', null, '', null, '温建略', 'http://wx.qlogo.cn/mmopen/rYqlKVibmt5TD6MyradoRnhdMicv5q8skPGUYGy4paUOP0faBngdsqDyiaMuStknhicEmg9kJ0bcbial5rjUVLfhyEuEyTeVsXAZX/0', null, '潮州大道交通银行8楼', null, '1', null, '1', 'oruQl1Uk4oeud8lAjBscUnpb5BkI', '2017-08-07 14:39:31', '2017-08-07 14:42:17', null);
INSERT INTO `wc_users` VALUES ('945', 'oruQl1Tnm2w8RZNy0zkFcp-6_BFo', 'zhuwr@ydbaidu.net', '13144466876', null, '', null, '锐', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8dibJUBQ4UBWxulic4QM5u8oAhSMNnBB2ozl6MhPhxkMM3lJCc2ejarDb8Yc6DkCz0pg16V7HmPEuB2WHAvNUaiavP/0', null, null, null, '1', null, '1', 'oruQl1Tnm2w8RZNy0zkFcp-6_BFo', '2017-08-07 14:42:08', '2017-08-22 16:01:53', null);
INSERT INTO `wc_users` VALUES ('946', 'oruQl1T7-S7w5DLalJtIJh3xs420', 'huanglf@ydbaidu.net', '13680775864', null, '', null, '黄林烽', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz52DWEmnibv1chibeRaYiatlNiaXxSY5MToiat1ce4oJEqRFuSjwQPjMNxtUT4jufIZvgOGePAVTibNQFI/0', null, '惠州市华阳大厦', null, '1', null, '1', 'oruQl1T7-S7w5DLalJtIJh3xs420', '2017-08-07 15:47:06', '2017-08-07 15:51:07', null);
INSERT INTO `wc_users` VALUES ('947', 'oruQl1YbMWIToserQhEISuWO2ZUk', 'huangxianjia@xm12t.com', '15280470148', null, '', null, '雨丶落♥', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCx3Wzr48RViaxibKEUMDLt8yicrV1oZhXpC8ChlrxibDneeLNEUtiazXJYXGUAg9V6KundATI5NGIrJHQ/0', null, '亚特写字楼', null, '1', null, '1', 'oruQl1YbMWIToserQhEISuWO2ZUk', '2017-08-07 15:52:36', '2017-08-07 15:53:52', null);
INSERT INTO `wc_users` VALUES ('948', 'oruQl1VI8tBRb0IkpEQkW2sgisHI', null, null, null, '', null, '小卷毛奶奶', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzxktKQcXSnsRvWveDNNF0SuLDvY6WBqtEY7PQeQGzWicKkLxAJIGsfclJNrkuRrxdrCeFL7zLMOhia/0', null, null, null, '2', null, '1', 'oruQl1VI8tBRb0IkpEQkW2sgisHI', '2017-08-07 15:53:15', '2017-08-07 15:53:15', null);
INSERT INTO `wc_users` VALUES ('949', 'oruQl1TcPIR59X97MCAnS4xBowFI', null, null, null, '', null, 'wlz非', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae4icAG8cxGibG0hYzQqcZKHLibfhBBjEPGXDgpkf9jpib4udRYomfciaKGBEw3N5jaKPq77Yptwibqc1gS/0', null, null, null, '2', null, '1', 'oruQl1TcPIR59X97MCAnS4xBowFI', '2017-08-07 15:54:27', '2017-08-07 15:54:27', null);
INSERT INTO `wc_users` VALUES ('950', 'oruQl1Rq1Cas7ocM4v2kbDHN7hIc', null, null, null, '', null, '菜加盐', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4X2PMPpj8okdlRicmE32ElI54C8V1lmVTxrAibpeVIh74kZYiaCTYUkDUiasyd7k8nWFDJuVEHMMbT6Q/0', null, null, null, '2', null, '1', 'oruQl1Rq1Cas7ocM4v2kbDHN7hIc', '2017-08-07 15:54:47', '2017-08-07 15:54:47', null);
INSERT INTO `wc_users` VALUES ('951', 'oruQl1fUW-g-pMZl1TBmayUVTRFA', null, null, null, '', null, '(阝東)少少????', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz60ISZ6o4lwWmlDGpRlaIgXwQSF6fwibVldHVZWCx6W1bMJdD2aGEAXPPtVync7N8CelCk8hWKoiav/0', null, null, null, '2', null, '1', 'oruQl1fUW-g-pMZl1TBmayUVTRFA', '2017-08-07 15:55:43', '2017-08-07 15:55:43', null);
INSERT INTO `wc_users` VALUES ('952', 'oruQl1TfS3DNG4y0rKniRQ0z2gkE', null, null, null, '', null, '芭琦', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz8WOSvFLMnw1OshLAnibMA9MQNDFFHavtic4cIfdeXT14AtYPlIZr91WYJGMM7huwosq27t2muD5Zr/0', null, null, null, '2', null, '1', 'oruQl1TfS3DNG4y0rKniRQ0z2gkE', '2017-08-07 15:57:50', '2017-08-07 15:57:50', null);
INSERT INTO `wc_users` VALUES ('953', 'oruQl1QsYTsPxRmL8M18tG7o2Q0w', null, null, null, '', null, '哈哈', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz4yHZdlO1A3tEfibiaMS9AsIhuAAicia4xGQjiaTqD6AsLKWBenHGAtUzJ84OSVQNFrTJNQOEXpbbf7b5/0', null, null, null, '2', null, '1', 'oruQl1QsYTsPxRmL8M18tG7o2Q0w', '2017-08-07 16:01:48', '2017-08-07 16:01:48', null);
INSERT INTO `wc_users` VALUES ('954', 'oruQl1RkLjBe1b0lRKwootrEXf7Q', '670785379@qq.com', '18759503610', null, '', null, '泉州百度广告商陈志鹏', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKz3vdUwQUvRpRH4cApzzaNCkIiaUHibCIttT8H3g3iaKCX3R4ibCGD6BDvyNZdeOgy8k6LtM1O9mwib3g/0', null, '泉州市丰泽区少林路亚特写字楼四楼', null, '1', '666', '1', 'oruQl1RkLjBe1b0lRKwootrEXf7Q', '2017-08-07 16:02:12', '2017-08-07 16:04:24', null);
INSERT INTO `wc_users` VALUES ('955', 'oruQl1ZECBdJ0QH-7G7kAYOAoRDA', null, null, null, '', null, '猪猪弄丢了', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL56D6fwXsuZRhCkjwezpJzNUDzicZTaAfDYujMJ8uraibp618iaRzexcd4m7SLFuQpaLDarcz8p3YgA/0', null, null, null, '0', null, '1', 'oruQl1ZECBdJ0QH-7G7kAYOAoRDA', '2017-08-07 16:04:07', '2017-08-07 16:04:07', null);
INSERT INTO `wc_users` VALUES ('956', 'oruQl1YC_DKazgMumZzTT-Mjgpck', null, null, null, '', null, '醒', 'http://wx.qlogo.cn/mmopen/gQQO820rz5VfeXS3iawTsXJmtwSMcEOuicQcZ55zhMOhlrWUa15GM1pcp1CO1skxkDt6vglqCeSTpzDibO92Jdf6Q/0', null, null, null, '2', null, '1', 'oruQl1YC_DKazgMumZzTT-Mjgpck', '2017-08-07 16:04:30', '2017-08-07 16:04:30', null);
INSERT INTO `wc_users` VALUES ('957', 'oruQl1UegdfxT9W_M_Tf7jwB4Nmk', '2643523674@qq.com', '15060876839', null, '', null, '小曾', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3YrPrzibKBBPfibQ4PHxk77Ly7IxUtJV2KdLKlZ5xicwfoCbNDT70XwiaWQJq6n1RwpWCVRRF93OERWO/0', null, '亚特大厦5楼', null, '2', '耶！耶！耶！', '1', 'oruQl1UegdfxT9W_M_Tf7jwB4Nmk', '2017-08-07 16:05:32', '2017-08-07 16:07:35', null);
INSERT INTO `wc_users` VALUES ('958', 'oruQl1Wg1YdBvgLWZfdmztxnpic8', '525643970@qq.com', '13600702209', null, '', null, 'A百度李炜坤 13600702209', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3bxSPP0FgkKOhJw3OBdKy10G2N5NS3YhD7y1LTAEv16vHf5BfbwpAOV3oiamzh1dDOycxupYE9zro/0', null, '晋江', null, '1', '1', '1', 'oruQl1Wg1YdBvgLWZfdmztxnpic8', '2017-08-07 16:06:54', '2017-08-07 16:07:25', null);
INSERT INTO `wc_users` VALUES ('959', 'oruQl1Zer-FZfpJQ6lqVixok2-ew', null, null, null, '', null, '安安安静', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaaJSWfS499oZDvWicux6EWAQU1wzSXfibx9icoiaGuRfAp1Ma9UZrTXYPohFncvXO5NTFryaoRFWv5MT/0', null, null, null, '2', null, '1', 'oruQl1Zer-FZfpJQ6lqVixok2-ew', '2017-08-07 16:07:09', '2017-08-07 16:07:09', null);
INSERT INTO `wc_users` VALUES ('960', 'oruQl1U7mfB7yxckOCWJMEde6E6o', null, null, null, '', null, '我是你巧哥啊????', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIzyJSic48wGUb8u1aiahHYUEjdVniazb7dbkIRRiciajJhr99l8ibypRjibgqqHUYoRXrxcnXSiaPt0PeibMje/0', null, null, null, '1', null, '1', 'oruQl1U7mfB7yxckOCWJMEde6E6o', '2017-08-07 16:09:42', '2017-08-07 16:09:42', null);
INSERT INTO `wc_users` VALUES ('961', 'oruQl1cs6l4CI99vpe5vl9PoQ2I8', 'liugs@ydbaidu.net', '15218530844', null, '', null, '百度MVP专员', 'http://wx.qlogo.cn/mmopen/gQQO820rz5Wg4AnkXKy98GK64x9ib66fvuZibdzz7xtFZv7kIrYsS2LZL1qB1mQjRqXYPRcQdyrKyyKIDibKbAs5f7gXN3fq17ib/0', null, '潮州市交通银行大厦8楼', null, '1', '百度推广（你的客户正在网上找你）', '1', 'oruQl1cs6l4CI99vpe5vl9PoQ2I8', '2017-08-07 16:14:05', '2017-08-07 16:20:06', null);
INSERT INTO `wc_users` VALUES ('962', 'oruQl1fh6ErJvTnQCaWRk_UTUM00', '464495580@qq.com', '13636968813', null, '', null, '郑婉婷', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuTpDYVdoW7v4zOkS7cWPHjkuslykH07HAicb7xiblbkKlUVphnKEzY0NwPiaWkjvAQPm6NKZzJfblyVw/0', null, '福建省泉州市丰泽区', null, '2', null, '1', 'oruQl1fh6ErJvTnQCaWRk_UTUM00', '2017-08-07 16:14:14', '2017-08-07 16:15:24', null);
INSERT INTO `wc_users` VALUES ('963', 'oruQl1dCQei0jKJuG0lP8mkmenOM', '305378851@qq.com', '13421500112', null, '', null, '晓东', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw90XuIztiaAyzuzkrgE2iaDZBSLUg25m6dSCicsX688CDpvayXKjqoTpIIchPBGftEiazrWGrTgohjYf9KLrPHdOlOL/0', null, null, null, '1', '简单可依赖', '1', 'oruQl1dCQei0jKJuG0lP8mkmenOM', '2017-08-07 16:31:45', '2017-08-07 16:34:00', null);
INSERT INTO `wc_users` VALUES ('964', 'oruQl1R3k8mcxBslpwyV9hf0cK5w', null, null, null, '', null, '苏文革', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae3HIhfGPQEZXcDk6akicWZbx1rlWD1dYMbmGnwFjI2utuzeYBAG78BNZBXD2Z3VD30vZNPf4JNrz4/0', null, null, null, '1', null, '1', 'oruQl1R3k8mcxBslpwyV9hf0cK5w', '2017-08-07 16:42:31', '2017-08-07 16:42:31', null);
INSERT INTO `wc_users` VALUES ('965', 'oruQl1Q1fLjqZdw4tpVdweEVT3Vs', null, null, null, '', null, '槑_', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3XgUPnBKEznaCdXnCGVjPrlbUvGnRzfZ2JHrjg0gXYTaScOa2REasvVsotVu9E9VZAeZbjgcHKkB/0', null, null, null, '2', null, '1', 'oruQl1Q1fLjqZdw4tpVdweEVT3Vs', '2017-08-07 16:46:51', '2017-08-07 16:46:51', null);
INSERT INTO `wc_users` VALUES ('966', 'xmzhongyun', '1398073635@qq.com', '13774695953', null, '$2y$10$LBCjKkVfeBOtY2GNv6bbxO4E1aWknvxLwpqQ6PrqRyWmBqXPgKAve', 'qVdpnNkr4HzpWGySkp5Y24Z3T4ZmjY4pmx7Ol4YNuZMFt7Pw8UvhZoZnGNVK', '众耕财务', 'uploads/user/966/img1502097924.jpg', null, null, null, '2', null, '1', null, '2017-08-07 17:00:28', '2017-08-11 15:16:09', null);
INSERT INTO `wc_users` VALUES ('967', 'xmhthjc123', '524203729@qq.com', '15860791302', '0592-5557824', '$2y$10$STzfqkkxMkNH1n.3POF9w.w2O0GTIqtpbE1XBWukemsuWv3YqcFF2', '93ISNGlRPPSiH81wDZ0ef6RLOZOE21eriZLSNS9QRLZdXiOQOArcu62DVdfO', '张经理', 'uploads/user/967/img1502176682.jpg', null, '厦门市湖里区枋湖北二路562号二楼', 'http://www.xmhthjc.com/', '1', '诚信、创新、高效、专业、共赢', '1', null, '2017-08-07 17:02:56', '2017-08-11 16:24:29', null);
INSERT INTO `wc_users` VALUES ('968', 'guo123', '945126478@qq.com', '13809690502', null, '$2y$10$sgJuX8gO/QIhd.qeJAA6a.FJKgviWP0JMMqEi4T.THDnGCens5lEm', 'CAJ1ZZLe6Qv33CexJi98x9PuxdludltgMp9Kv0C4rs4uEyowoHLe2g9VkRsx', '郭淼波', 'uploads/user/968/img1502098258.png', null, null, null, '1', null, '1', null, '2017-08-07 17:08:55', '2017-08-08 15:27:20', null);
INSERT INTO `wc_users` VALUES ('969', 'oruQl1Rq5IYhGbbtLmjTXOoQW7J0', null, null, null, '', 'su88bqKE2mifcQHycmcBgQ69npDfZehI1hz7ued4FUmrM6uRgqNV40T2dTZS', '叶子Li', 'uploads/user/969/img1503370836.jpg', 'uploads/user/969/img1503370876.jpg', null, null, '0', null, '1', 'oruQl1Rq5IYhGbbtLmjTXOoQW7J0', '2017-08-07 17:22:26', '2017-08-22 11:06:48', null);
INSERT INTO `wc_users` VALUES ('970', 'yuanbing', '635299200@qq.com', '15768465168', null, '$2y$10$Rq.cRjMUwtCFF4Ui37CL9eGqWfbsTH61UDELEJNACbLuv3qwGvvRS', 'L2SAq17LbFu2A8RAohfIVQlyBjTlBQvp2rzeVK219bb0oLMV3JLODrRN6tBR', '袁冰', 'uploads/user/970/img1502098334.jpg', null, null, 'http://cyshuichan.com/', '1', null, '1', null, '2017-08-07 17:32:14', '2017-08-08 15:43:29', null);
INSERT INTO `wc_users` VALUES ('971', 'qzlongshida1', '359758444@qq.com', '15880266603', null, '$2y$10$zN52OstCSVK2DKJczDtFL.tFkR3lXiuDt/SVvxTpxOpSIHyBsNeEy', '4RH4SAHZatXi12dh0KSOhcOVhFDhdKFNpegsCIeGGsGyvUyCJrsUm3L1HHZI', '李忠华', 'uploads/user/971/img1502176773.png', null, null, null, '1', null, '1', null, '2017-08-07 17:33:59', '2017-08-08 15:20:17', null);
INSERT INTO `wc_users` VALUES ('972', 'zz51coloraround', '26207544@qq.com', '13605051690', null, '$2y$10$744/dRUCFYyxGEKXuNfxuOpFfbehe3e.Dg39zucbBqyS7iuLe1oN2', null, '漳州龙文土形生教育咨询有限责任公司', 'uploads/user/972/img1502099650.jpg', null, null, null, '2', null, '1', null, '2017-08-07 17:37:04', '2017-08-07 17:54:10', null);
INSERT INTO `wc_users` VALUES ('973', 'lxh123', '2820550973@qq.com', '15859666567', null, '$2y$10$/RDnojh7Qmd1h65fdeR4iOTsCwzoglImJEWdBQvEodUIoMRdoHWFS', 'lUvwo8wPdGhQ0tXndr1i2qXHAdriwcys0je0XUg7vScN5G0IqE6KnML76EgE', '李小辉', 'uploads/user/973/img1502100110.jpg', null, '福建省漳州市漳浦县沙西镇高林村', null, '1', null, '1', null, '2017-08-07 17:39:37', '2017-08-08 15:31:24', null);
INSERT INTO `wc_users` VALUES ('974', 'oruQl1Uj1J8KTnAv6riHEGkOiQOg', null, null, null, '', null, '小熊萌主', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8ds8KrM9lzibTVo6L95oMPNtOjg0HmFTgNqZcSiaKWPTJaMYTwelbXvO8SOX68glPbBtbmoMqMCta7gPn0yiaEMlE4/0', null, null, null, '2', null, '1', 'oruQl1Uj1J8KTnAv6riHEGkOiQOg', '2017-08-07 17:40:31', '2017-08-07 17:40:31', null);
INSERT INTO `wc_users` VALUES ('975', 'oruQl1ZT5am17jvROi4O57OuZiFs', null, null, null, '', null, '乐一木', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3ar29HJlg37KEDcockLrf4NUq5tXujBvQNicOd20eRoVnaLNKVwsPEkyMqpIOG8WV972u2OLmAxicB/0', null, null, null, '2', null, '1', 'oruQl1ZT5am17jvROi4O57OuZiFs', '2017-08-07 18:33:24', '2017-08-07 18:33:24', null);
INSERT INTO `wc_users` VALUES ('976', 'oruQl1ddyQp8QDgpHfPuQEsKGX7k', 'niulu@12t.com', '18250813511', null, '', null, 'A~baidu金融牛璐', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5icJNQrchsCLlkRNib9okUXj0P8XCAc48uBicRkQibMq5GgkWTDasMapwmrsicDo9DVUw4hWyjYLz9Zyg/0', null, '厦门思明区软件园二期观日路36号201单元', null, '2', '百度有钱花，助学贷款，让你离梦想更近一步。', '1', 'oruQl1ddyQp8QDgpHfPuQEsKGX7k', '2017-08-08 08:40:37', '2017-08-08 08:45:23', null);
INSERT INTO `wc_users` VALUES ('977', 'oruQl1WiyFgL9wCwd0ngL4Y6x7_U', 'Xinsh@ydbaidu.net', '18219083702', null, '', null, '辛思华', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8eB3W8XY24kQOZjz2eIIuKzpGYaLCIPtfLU1NDPLnKJo8A9LFmrbKibow1zshnRR9a1a36DPy2gMLotRq0eZT8ZC/0', null, null, null, '2', null, '1', 'oruQl1WiyFgL9wCwd0ngL4Y6x7_U', '2017-08-08 14:17:26', '2017-08-16 10:06:56', null);
INSERT INTO `wc_users` VALUES ('978', 'oruQl1Wrxw8f_j-xdPl6h2fgjQos', null, null, null, '', null, '想得美', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae1El9r6R249KnW4W6d1ZQkBh1u8K8mokLmVmgc0HcZtI22PgdibNKyHeJhbkwPwYV5dQnXiaH6KmDR/0', null, null, null, '2', null, '1', 'oruQl1Wrxw8f_j-xdPl6h2fgjQos', '2017-08-08 15:17:50', '2017-08-08 15:17:50', null);
INSERT INTO `wc_users` VALUES ('979', 'oruQl1TQwNHU4lJyy_U5R_Fyw8jw', null, null, null, '', null, '雅玲童鞋', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3eQFdiaJYJGMRPuQjdGYwia1prGib73Mjj92AHTg52S63Bdc4N4fsNlRPngD9KHxWZEPSaQLufkh5pt/0', null, null, null, '2', null, '1', 'oruQl1TQwNHU4lJyy_U5R_Fyw8jw', '2017-08-08 17:14:33', '2017-08-08 17:14:33', null);
INSERT INTO `wc_users` VALUES ('980', 'oruQl1U4NRCM3I-mBhEUgEwdiaR4', null, null, null, '', null, '马龙乾丰（大洋芋）', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8csWThicejfvdEibrvGxAt58uzTgtSvI0aQjH1DcNr80rQw794cnvYEhsL1icpMXK169Libc4bFY8RJIuTrpa8wMutK/0', null, null, null, '1', null, '1', 'oruQl1U4NRCM3I-mBhEUgEwdiaR4', '2017-08-08 20:44:04', '2017-08-08 20:44:04', null);
INSERT INTO `wc_users` VALUES ('981', 'oruQl1Uo9R-3Ohku622ObIkyEjZI', 'liquan@ydbaidu.net', '13794108979', null, '', null, 'LI Quan', 'uploads/user/981/img1503389069.jpg', null, null, null, '1', null, '1', 'oruQl1Uo9R-3Ohku622ObIkyEjZI', '2017-08-09 09:39:42', '2017-08-09 09:44:05', null);
INSERT INTO `wc_users` VALUES ('982', 'oruQl1Sunh_hKgmbmTsBVP6TIrI4', 'wuml@12t.cn', '18250848084', null, '', null, ' 百度在厦门', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae2WXVFDCneLMvgePJWiaCze2yxGNhtgwNJUyMrjFTECvGgdJwSoJSvqWt8eQqe2B6iaHl2m5j4q7tU/0', null, '厦门思明区软件园二期观日路36号201', null, '2', '一切靠自己', '1', 'oruQl1Sunh_hKgmbmTsBVP6TIrI4', '2017-08-09 10:57:54', '2017-08-09 11:03:12', null);
INSERT INTO `wc_users` VALUES ('983', 'oruQl1WdeWNcV3qBdTdbfI4j7WXc', '772927337@qq.com', '18675353235', null, '', null, '坦荡荡', 'http://wx.qlogo.cn/mmopen/p1FVpqO6q5aibibcOboh5YGNl0CoFYXfsV5FHD4hZmFwJdWJiaibJIN5J5JcU5AAjoU4ANicQh1TCyWkZ911940kbsWRlUSHOQYYE/0', null, null, null, '1', null, '1', 'oruQl1WdeWNcV3qBdTdbfI4j7WXc', '2017-08-09 11:27:01', '2017-08-09 11:36:09', null);
INSERT INTO `wc_users` VALUES ('984', 'oruQl1b3lpXGBWA-Nb0YxeqfSyuU11', null, null, null, '', null, '乖乖', 'http://wx.qlogo.cn/mmopen/rIQuAY6Wvlqa2XDegSH1wrtz7EiaIpekxbOWwiaf2jS5fB5ucCXWguOCUK85EAagn4CWibOFHyYyx8ES665ia5iawaPe6xS6QO44m/0', null, null, null, '2', null, '1', 'oruQl1b3lpXGBWA-Nb0YxeqfSyuU11', '2017-08-09 15:14:57', '2017-08-09 15:15:28', '2017-08-21 16:51:03');
INSERT INTO `wc_users` VALUES ('985', 'oruQl1ctl4lCRRwVT-1e8xN89xrE', 'chenxh@ydbaidu.net', '15918770696', null, '', null, '粤东百度 陈鑫浩', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8e8soib73gwBnCMoAkznWLTP9rR2jmRwOkIgs0dr5rKpesuyChFjKM5NHy2rbQ56zMNlqkpPJw98wMub6r6cEFec/0', null, '汕头市金平区跃进路利鸿基中心大厦B座20层', null, '1', null, '1', 'oruQl1ctl4lCRRwVT-1e8xN89xrE', '2017-08-10 09:48:09', '2017-08-10 09:50:26', null);
INSERT INTO `wc_users` VALUES ('986', 'oruQl1UTZw0-c757Nay2BxGPsug0', '2889637869@qq.com', '13960216077', null, '', null, '陈佳莉', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSabSLzFicrwuK1h7yKpjJ2h6KiaYHcW9B4chRnYSmNLtre8kPzaGZMabpxibtLVDBKu785Xw3FGWTgIl/0', null, null, null, '2', null, '1', 'oruQl1UTZw0-c757Nay2BxGPsug0', '2017-08-10 16:32:50', '2017-08-10 16:34:45', null);
INSERT INTO `wc_users` VALUES ('987', 'oruQl1azqQzJVrAzG8j2pkHCqbqI', null, null, null, '', null, '小虾子', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuRByW7JXmD2MYWuNblahGNhsnibA2cPw0lrjjDLJ2ZpGVn3icicmV5Vb8nrQfhFyP9hk3iaPPWibK1CSX5m3iauuwxS9y/0', null, null, null, '2', null, '1', 'oruQl1azqQzJVrAzG8j2pkHCqbqI', '2017-08-10 16:33:06', '2017-08-10 16:33:06', null);
INSERT INTO `wc_users` VALUES ('988', 'oruQl1et2dSqNhNDyHSLoxxzlzXk', null, null, null, '', null, '陈潇潇', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae9nbiaeUjX2WK2XLy8PrFYibnBQhhVFyhzztC12T1h2DP4Dq2Bxb1oadTtxrnfcc74cySIz3MKyjRF/0', null, null, null, '2', null, '1', 'oruQl1et2dSqNhNDyHSLoxxzlzXk', '2017-08-10 16:36:13', '2017-08-10 16:36:13', null);
INSERT INTO `wc_users` VALUES ('989', 'oruQl1QXFZMTLMpTg-CFVe5g91ts', null, null, null, '', null, '百度推广-张志河18459157318', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz0CuJS2ribYPCBJhtq9nLMsHkM9kDPuJFMY3JV8oLnlmZSwrKibzwWP9jvHAsCEEdMstYEWYRSumDl/0', null, null, null, '1', null, '1', 'oruQl1QXFZMTLMpTg-CFVe5g91ts', '2017-08-10 16:39:35', '2017-08-10 16:39:35', null);
INSERT INTO `wc_users` VALUES ('990', 'oruQl1ZW6fBZ7f2wfX2jkjp-84Ps', null, null, null, '', null, 'low-key', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLClThKPibQrIp5kmaHrPFleSIDPkiapaicqKhlVYOL0Hulib2YwQqRxM4IBr3DjbhiaHUaX8k6aib3ctVmg/0', null, null, null, '2', null, '1', 'oruQl1ZW6fBZ7f2wfX2jkjp-84Ps', '2017-08-10 16:49:22', '2017-08-10 16:49:22', null);
INSERT INTO `wc_users` VALUES ('991', 'oruQl1X5dZLDOOkz-3OMpZkKYl4I', null, null, null, '', null, '张巧龙', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaeytCBn6TICjLrYWCBUOwGgbXfeTpUHJEOY23PK0BZUfY5MwR7QSefQb22HmFrVXxxoRiboKWbdWiaia/0', null, null, null, '1', null, '1', 'oruQl1X5dZLDOOkz-3OMpZkKYl4I', '2017-08-10 16:49:43', '2017-08-10 16:49:43', null);
INSERT INTO `wc_users` VALUES ('992', 'oruQl1Sms5lfN7a5zdymY6NEyQVY', null, null, null, '', null, '淡淡烟草味????', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae1tGia3ywBZ317hb0TyItGZK2rnVHKYhibn4iaZYhoiaGwvfiaFMSduAEibggmDBDb8wghAz7oML86WqkV/0', null, null, null, '1', null, '1', 'oruQl1Sms5lfN7a5zdymY6NEyQVY', '2017-08-11 09:19:51', '2017-08-11 09:19:51', null);
INSERT INTO `wc_users` VALUES ('993', 'oruQl1cu4cW2q3NmTDR4XVNrsxAM', '896761395@qq.com', '18344935868', null, '', null, 'ペ新', 'http://wx.qlogo.cn/mmopen/Jiavz9UrH80k2UpRfJiavzDNyFT7vKVwkPP1Dw10pVhjtem2RHHz5icXh7rtj05XlVVBYz7nAvpLk5FIOfUS0HpWdicaac7X5jLk/0', null, null, 'http://mp.gbpen.com/', '1', null, '1', 'oruQl1cu4cW2q3NmTDR4XVNrsxAM', '2017-08-11 16:37:11', '2017-08-16 15:38:58', null);
INSERT INTO `wc_users` VALUES ('994', 'oruQl1SviFMaio2p_jIB0df26DP4', null, null, null, '', null, '逍遥男众邦装饰公司13882896988', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw8X2XuwNa424lKDp5kTbJJXNtSfHKiaqsrbTKM12yic11jOrjZj1pkCDALX7T1JE0HXOZiaeUCkia03qbmrHhyPYRiab/0', null, null, null, '1', null, '1', 'oruQl1SviFMaio2p_jIB0df26DP4', '2017-08-11 22:41:26', '2017-08-11 22:41:26', null);
INSERT INTO `wc_users` VALUES ('995', 'oruQl1VAqGgFsNZu5ice17uXo3KY', null, null, null, '', null, '大椰子', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaexaV1cB82jGYM3SFMCeicyFWvm9AQuPP4MEea1eu0DFn9kWIE0aO6IibOU4nqJvyjZm3De8Vg96ZS4/0', null, null, null, '2', null, '1', 'oruQl1VAqGgFsNZu5ice17uXo3KY', '2017-08-14 11:19:08', '2017-08-14 11:19:08', null);
INSERT INTO `wc_users` VALUES ('996', 'oruQl1UL09mH32DopbuQOuJ1uM4Y', '107758781@qq.com', '15521092347', null, '', null, '驰叔', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8dpYsyqrOf7QGr2gOkE49buc2t39DfxsfA5b1v3ymBFWelb9mk2cveOAvNMTYmIuuxoQ1P83QBYhG0mCyLqhqfR/0', null, '广东省潮州市枫春路嘉和名苑', null, '1', 'Don\'t Be An Asshole', '1', 'oruQl1UL09mH32DopbuQOuJ1uM4Y', '2017-08-14 11:38:12', '2017-08-14 11:39:15', null);
INSERT INTO `wc_users` VALUES ('997', 'oruQl1ccEp_dH2tdsrOOGiWTJXwA', null, null, null, '', null, 'A王生聪|有吖财务', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJhvla6qArToyQsr1XM7RPZ8j0O3F0grypZic62gRzrrBDJfGicaODqdhCtJgB1325nPx2oj2krPriag/0', null, null, null, '1', null, '1', 'oruQl1ccEp_dH2tdsrOOGiWTJXwA', '2017-08-15 21:35:02', '2017-08-15 21:35:02', null);
INSERT INTO `wc_users` VALUES ('998', 'oruQl1RGBfdrS_VmqD9kM1OO7oDk', '748164980@qq.com', '15976118851', null, '', null, 'A  惠州百度练显涛', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8dBuoQhEwLAnqRJsHzjtiaEia0pVR9EpEYMEdeXGxTibN2HBCNXDyTfXBaQaO49CAkgIzn2QU74MdFUt7XPCIXTjvn/0', null, null, null, '1', null, '1', 'oruQl1RGBfdrS_VmqD9kM1OO7oDk', '2017-08-16 09:57:16', '2017-08-16 09:58:07', null);
INSERT INTO `wc_users` VALUES ('999', 'oruQl1U6qa4tD08cG8lWlVFC42nY', null, null, null, '', null, 'Eturn、', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8fJTU0ialWxP1rhWHp5g7EMqm6TzRa3S8RH5Ek4vqMic7Cx8pOibG1p7RUwj6Wty7Mf8uyjrUtHzK7B8ykKW8ic110H/0', null, null, null, '2', null, '1', 'oruQl1U6qa4tD08cG8lWlVFC42nY', '2017-08-16 09:57:32', '2017-08-16 09:57:32', null);
INSERT INTO `wc_users` VALUES ('1000', 'oruQl1ZJ-n9wxxshKPDfv6uxfDK8', null, null, null, '', null, '惠州百度小陈', 'uploads/user/1000/img1503015253.jpg', null, null, null, '1', null, '1', 'oruQl1ZJ-n9wxxshKPDfv6uxfDK8', '2017-08-16 09:58:14', '2017-08-18 08:16:53', null);
INSERT INTO `wc_users` VALUES ('1001', 'oruQl1UhursRUBSJprhmZGAJSo9g', 'jiangrh@ydbaidu.net', '15959216810', null, '', null, '江仁海', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIziczYPXjuSf8K1N2iaBOXS3BqEVdAx7QYbowRvdMb6L6Jv9JpxxaNQicTPLGoh8bzH0Ew0Pj45hUIh4/0', null, null, null, '1', null, '1', 'oruQl1UhursRUBSJprhmZGAJSo9g', '2017-08-16 10:08:16', '2017-08-16 10:09:31', null);
INSERT INTO `wc_users` VALUES ('1002', 'oruQl1aJ2ZsAPTGvdK76Jec8C2hA', null, null, null, '', null, 'YaoMuro', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8fJCj0Y5hZp1S5rsbrTSy4SQticq6R8k9HzzjjV1cB7TlSjbhLVklSVtn4tibhQntnwjHVAmkH02Ndct4SYtiaCl6Y/0', null, null, null, '1', null, '1', 'oruQl1aJ2ZsAPTGvdK76Jec8C2hA', '2017-08-16 10:16:01', '2017-08-16 10:16:01', null);
INSERT INTO `wc_users` VALUES ('1003', 'lxl123987', null, null, null, '$2y$10$RsoTR5VYYwKbsQz1FV0S6.CLCr.VesRjw2QCj9BN70iC1OvmAdLqG', '5sl6XTNUDeaF55wCK7Wf8wC2u4YnmXSCvGd26BaViLlwRm6zgAoRsmOI65gF', '兰小', null, null, null, null, '2', null, '1', null, '2017-08-16 10:37:30', '2017-08-16 11:02:28', null);
INSERT INTO `wc_users` VALUES ('1004', 'oruQl1W3nMvINPvh76v9ZMFewEpU', '2643950321@qq.com', '13823895224', null, '', null, '✨ JimLy✨', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8dB6PTgibMticxiay0IHoDmub8F3e8iawoxa8msQTPHv6jYTWc0VadU2HbclJuD9eO9vdxv7DKldic1kMcDvEouudTSY/0', null, null, null, '2', null, '1', 'oruQl1W3nMvINPvh76v9ZMFewEpU', '2017-08-16 10:47:00', '2017-08-16 10:59:22', null);
INSERT INTO `wc_users` VALUES ('1005', 'oruQl1eLS1Xi0X_Enh07_KomRGd0', null, null, null, '', null, '阿呆', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQmeh7BqVHxMUQAd3F1ibHAdvEEydpNIGombtEjPib0HgZTpfhOTXcK0gibfkBlpiaoAFFoPsvzRaJXXc5No37m1D6C/0', null, null, null, '2', null, '1', 'oruQl1eLS1Xi0X_Enh07_KomRGd0', '2017-08-16 10:48:42', '2017-08-16 10:48:42', null);
INSERT INTO `wc_users` VALUES ('1006', 'oruQl1dZ2zjhf1TCFVG6WJFArYGQ', null, null, null, '', null, 'King_????', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7WfiaOarg7R3dEchGLic2OkNXIOz9sByQmfYlic0KRr3Aia7bEO4zkFHuq55vJHGFlYwggqoSicefDO5uQosiaxC8NxltqpPCL1EZhs/0', null, null, null, '2', null, '1', 'oruQl1dZ2zjhf1TCFVG6WJFArYGQ', '2017-08-16 10:52:10', '2017-08-16 10:52:10', null);
INSERT INTO `wc_users` VALUES ('1007', 'oruQl1cvhe3pNl7M5QbjIanWoq1M', null, null, null, '', null, 'A百度-李嘉玲', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8d3fDoiaLV3UQTjtdBKETTlMdRU7E4PMCh56dUiaEJKgoOEj9DJXTibOlz4ibSLKWXSLJvbLS62eWLl2sLC8xE4M633/0', null, null, null, '2', null, '1', 'oruQl1cvhe3pNl7M5QbjIanWoq1M', '2017-08-16 13:58:47', '2017-08-16 13:58:47', null);
INSERT INTO `wc_users` VALUES ('1008', 'oruQl1YeH9Nuy5cwO2uTjEt0Vta0', '394751601@qq.com', '18759762195', null, '', null, '????豆芽', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBOIhVRUEI79FqbWyYCEjykQUUEQnZHtcDCMtbV5zQHzNt5CnpND0s51WFdKb3eqNQGvuzQNiarFVQ/0', 'uploads/user/1008/img1502961832.jpg', '厦门市', null, '2', '一颗有情绪的牙～', '1', 'oruQl1YeH9Nuy5cwO2uTjEt0Vta0', '2017-08-16 15:14:24', '2017-08-17 17:16:41', null);
INSERT INTO `wc_users` VALUES ('1009', 'oruQl1eRwr9QygeZdBdltpBR-2lI', 'houxf@ydbaidu.net', '13823893031', null, '', null, '小枫(^O^)', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8etGrCo26GrUDXYiaaiaXxKWFTxT597taFzQEo2SdNoZ1fkFv27plvEzEgXrpfPfRXEd4nMOsA2iaucBb2qfgs4Or6/0', null, null, null, '2', null, '1', 'oruQl1eRwr9QygeZdBdltpBR-2lI', '2017-08-16 16:01:25', '2017-08-16 16:04:08', null);
INSERT INTO `wc_users` VALUES ('1010', 'oruQl1dCcGsOEAfi6i31xr509jNI', null, null, null, '', null, '    ——师叔????', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuS71AXh9mdbnGiaJsNM5Yrgn96FVqNvmQmAbBM6yMiaOric73sJjzfmPicfictUY9AfprjBYFVnSNWywfdf8eXReoaJc/0', null, null, null, '1', null, '1', 'oruQl1dCcGsOEAfi6i31xr509jNI', '2017-08-16 16:25:33', '2017-08-16 16:25:33', null);
INSERT INTO `wc_users` VALUES ('1011', 'oruQl1al0YCSx6LmbYlo9jWOWOBs', 'lidy@ydbaidu.net', '13450414206', null, '', null, '李丹媛', 'http://wx.qlogo.cn/mmopen/rIQuAY6WvlpWgibqObbia6de0RGvKjluuibR03nElZAlsgRUXwplL6PGfgo6ibYSBIN6t5kSWqRc0yajYFMFIHwqvF2ydJKNZTSj/0', null, null, null, '2', null, '1', 'oruQl1al0YCSx6LmbYlo9jWOWOBs', '2017-08-16 16:26:57', '2017-08-22 15:49:28', null);
INSERT INTO `wc_users` VALUES ('1012', 'oruQl1Uz88PnE3cfGfjGrYarfxhI', '258448902@qq.cm', '15805910865', null, '', null, 'danne—luo', 'http://wx.qlogo.cn/mmopen/gQQO820rz5WZWRGTeTzMW5MAAicueekJkNvk2zehQUJxrxZib5qYWicLSmnGPtdQALJPMOwibkOSNa8u7KtjDJF3Dw/0', null, null, null, '2', null, '1', 'oruQl1Uz88PnE3cfGfjGrYarfxhI', '2017-08-17 11:16:01', '2017-08-17 11:16:46', null);
INSERT INTO `wc_users` VALUES ('1013', 'oruQl1ZAThngOINpaYweY_4Qai0o', null, null, null, '', null, '.小林', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8dpYsyqrOf7QFfFe3ia3ia6oxS0oAQMdn1LHTeZYfbdr1tQL3PzlY8PfYKFStURN2TA0fkHSEZbNlINgEtMqRuq2L/0', null, null, null, '1', null, '1', 'oruQl1ZAThngOINpaYweY_4Qai0o', '2017-08-17 11:20:30', '2017-08-17 11:20:30', null);
INSERT INTO `wc_users` VALUES ('1014', 'oruQl1Un-RehwUDSQWFS6dH5v79E', null, null, null, '', null, 'Sh€n。∞', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuR3xOtosXHM6ZqyHxvnbcgraw1FP3gfFJ9UXGwwZIfhteLp38t5G6K3fY1DFT7ql1mcF4exs8JKrg/0', null, null, null, '1', null, '1', 'oruQl1Un-RehwUDSQWFS6dH5v79E', '2017-08-17 11:20:47', '2017-08-17 11:20:47', null);
INSERT INTO `wc_users` VALUES ('1015', 'oruQl1SV8b_H_OoTBQcnfajOsAXY', null, null, null, '', null, '朱丽仙(장 위 안 비 정 장 회 담 )', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3TdTHHT5QwPYL9ibAYLiblnyHoEAg8sG6VSicnwX922Dcy8lZh01Td46JfXQmLuic1OGfOzTf8VaQic4V/0', 'uploads/user/1015/img1502966325.jpg', null, null, '2', null, '1', 'oruQl1SV8b_H_OoTBQcnfajOsAXY', '2017-08-17 13:41:48', '2017-08-17 13:41:48', null);
INSERT INTO `wc_users` VALUES ('1016', 'oruQl1UkLC39kgDvNUj6X6jguHOQ', 'linchq@xm12t.com', '15859245176', null, '', null, '林春强', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3TrmAhtm8B7nPzBl9qXGFlkPuLk40jx1ngokLbx3aibu8vTN11ebRGmATCDKK7q2YCbppdia4eicLaQ/0', null, '厦门市思明区软件园二期观日路36号楼201单元', null, '1', null, '1', 'oruQl1UkLC39kgDvNUj6X6jguHOQ', '2017-08-17 13:47:33', '2017-08-17 13:54:37', null);
INSERT INTO `wc_users` VALUES ('1017', 'oruQl1XrOLdLz1iDKigV8PBafy-k', '1173199092@qq.com', '14787890947', null, '', null, 'A-Baidu-余建春', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw90XuIztiaAyzqD9cniav7GqPFoaIdFJEaz2yKslia4OV0ialSODc0OyOO0PQmAm7WAnxqG6Pia9DiboEibVXHNrQr1YbR/0', null, null, null, '1', null, '1', 'oruQl1XrOLdLz1iDKigV8PBafy-k', '2017-08-17 14:09:42', '2017-08-17 14:10:03', null);
INSERT INTO `wc_users` VALUES ('1018', 'oruQl1RkpFSJ2vu5uDvS5i0HB1Gk', 'laihx@ydbaidu.net', '15880263612', null, '', null, '百度-惠州·^_^赖后新', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaex0sAFLoxJzvNias6bWg3ZCCRiaXia0KsUGFsIyXFTD7BqU28M3YMWGAtgVzrAPFpRQwobNqmkpZVz3/0', null, '惠州市惠城区演达一路华阳大厦24层', null, '1', null, '1', 'oruQl1RkpFSJ2vu5uDvS5i0HB1Gk', '2017-08-17 15:38:30', '2017-08-17 15:40:46', null);
INSERT INTO `wc_users` VALUES ('1019', 'oruQl1Sw-nYhdhPd_cm1CPc7Mttw', 'lijy@ydbaidu.net', '13411987106', null, '', null, '李静仪', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3eK9tLNDKG5o2f1fDZjjed5icwMKheHXdV8Jb1dhw55TDSQ9dkGy9jiaV6XB1PlldaqjPy3gibrZt2N/0', null, '汕头市金平区跃进路利鸿基大厦b座20楼', null, '2', null, '1', 'oruQl1Sw-nYhdhPd_cm1CPc7Mttw', '2017-08-17 15:39:29', '2017-08-17 15:41:03', null);
INSERT INTO `wc_users` VALUES ('1020', 'oruQl1cgeNd_tHt5JRfeysI4JsjU', 'huazhx@ydbaidu.net', '13640089578', null, '', null, 'A惠州百度小华', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8dXSiaAaLtw98EvYmsajcibEMvuSbQltgeaFe4fGib0C91V3Gp9v8UJY2PIlhAhMgVHpTjxZrKw9Wpdwd81WpaaibCZ/0', null, '惠州市演达大道9号华阳大厦24楼', null, '1', null, '1', 'oruQl1cgeNd_tHt5JRfeysI4JsjU', '2017-08-17 15:43:22', '2017-08-17 15:45:15', null);
INSERT INTO `wc_users` VALUES ('1021', 'oruQl1VdifYVBvoQIKAOAqQ3nHnY', null, null, null, '', null, '帆', 'http://wx.qlogo.cn/mmopen/gQQO820rz5UIL2oRa6aDKcS36T9tAwF3ibyZFhmZHcArrvLnuxC8frpMVx4cu0uAm0EGSeJTUbLTxu3ibgqD757A/0', null, null, null, '2', null, '1', 'oruQl1VdifYVBvoQIKAOAqQ3nHnY', '2017-08-17 15:45:27', '2017-08-17 15:45:27', null);
INSERT INTO `wc_users` VALUES ('1022', 'oruQl1YcAkl6vtL16Ju-ElLT72Zw', null, null, null, '', null, 'Hūà', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8e4c9FoSyPBSu0vJWiaZMEXc9fj94hMGGWhUN1SFX2ALQCYvNL7ckjdEaHeBvf0fcbtPmt3z7nsD8Y3XFQpBVTVu/0', null, null, null, '2', null, '1', 'oruQl1YcAkl6vtL16Ju-ElLT72Zw', '2017-08-17 15:58:52', '2017-08-17 15:58:52', null);
INSERT INTO `wc_users` VALUES ('1023', 'oruQl1VGX9KYjYOog5OduNul9TAQ', null, null, null, '', null, '百度蛋蛋????', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaZ1LyL0slLibUiaesLFoA17LichYa0sFrRpZ6LBFZj4IqysQ4qzXetJ78t4NIKXlp3Wo9rUbibYPBNHq/0', null, null, null, '2', null, '1', 'oruQl1VGX9KYjYOog5OduNul9TAQ', '2017-08-17 15:59:06', '2017-08-17 15:59:06', null);
INSERT INTO `wc_users` VALUES ('1024', 'oruQl1X21EB5wCmkli1v2Fs5_qyY', null, null, null, '', null, '百度 林嘉茂', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM50pTbmKxMwvatrnN0f6qJfW3VMhrGO5DHzGEJXqxMuapSMp0aBeWhicHwudlHjzoHw0DpCSplFABUn5XeyYp9m8ujW6H2WeEgE/0', 'uploads/user/1024/img1502957717.jpg', null, null, '0', null, '1', 'oruQl1X21EB5wCmkli1v2Fs5_qyY', '2017-08-17 16:05:08', '2017-08-17 16:05:08', null);
INSERT INTO `wc_users` VALUES ('1025', 'oruQl1Z49yAdcjwBJrjZU640VlkU', null, null, null, '', null, '唐€', 'http://wx.qlogo.cn/mmopen/gQQO820rz5WF4AxROhBrmevHdI0xMEX2V05Swe57o7NibFmw18yMHCDJT06ibVt32HvMtSygC8GVpia7CHZeic8oz3o7ic4N4Eeps/0', 'uploads/user/1025/img1502962350.jpg', null, null, '2', null, '1', 'oruQl1Z49yAdcjwBJrjZU640VlkU', '2017-08-17 17:26:54', '2017-08-17 17:26:54', null);
INSERT INTO `wc_users` VALUES ('1026', 'oruQl1eYPRmX_REm6ePhq06254ng', null, null, null, '', null, '惠州百度信息流客服--小陈', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae6eO7Vfkeas6ViaXW2FmexTasMS4eQeicNpo1lHdibJ1XsNVBzq4t5gKKntYdmgD4oPxUl5BAPwTOFic/0', 'uploads/user/1026/img1503369449.jpg', null, null, '2', null, '1', 'oruQl1eYPRmX_REm6ePhq06254ng', '2017-08-17 17:34:54', '2017-08-22 10:36:49', null);
INSERT INTO `wc_users` VALUES ('1027', 'oruQl1VCIEDug0rB8Wj3mOqzUTrI', null, null, null, '', null, '刘颖华花花耶????', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuTtXvrt0QPr196Tw8EhoRJKYwXMnpn5oRaSf7hrQdgTSD3ibNN1tYdpn4lsrnicmkj3wtDnP0VCyRtX7n5iaFODZAG/0', null, null, null, '2', null, '1', 'oruQl1VCIEDug0rB8Wj3mOqzUTrI', '2017-08-17 17:34:59', '2017-08-17 17:34:59', null);
INSERT INTO `wc_users` VALUES ('1028', 'oruQl1ZNxMxA1hp68cp5sfs9DHyM', null, null, null, '', null, '欧阳浈百度一下', 'http://wx.qlogo.cn/mmopen/lib3mfM6jribuTvnMFPNbeR6uc3mcmcsicVVicWnLsFzSlLX6b39Zx64cDx6OyO7zOuOgm5vvia9hZMQCibBb8mHvFujzjj6EhBibhY/0', 'uploads/user/1028/img1502962861.jpg', null, null, '1', null, '1', 'oruQl1ZNxMxA1hp68cp5sfs9DHyM', '2017-08-17 17:35:19', '2017-08-17 17:35:19', null);
INSERT INTO `wc_users` VALUES ('1029', 'oruQl1XsK-XpOeHPOgBk_wsxt6Gw', null, null, null, '', null, '百度  方耿钦', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae0SgqSfNU8SlaaJ0vaRjCdqnAzCtqncsT6XRtfIydHhjEemaWVV7nKupKxvIwHa3unTMm4LoLB1E/0', null, null, null, '1', null, '1', 'oruQl1XsK-XpOeHPOgBk_wsxt6Gw', '2017-08-17 17:35:22', '2017-08-17 17:35:22', null);
INSERT INTO `wc_users` VALUES ('1030', 'oruQl1ceOfa2VGFGj-p0xALrRPuc', null, null, null, '', null, '蔡青青', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQh7GT7oAIV2bheKuHkMNyvCsOuUYmWj7UztxDcDa52KT1TlEcPp85lqIKLkKFu7iavCM1BWLKx317sBMicE8smzI/0', null, null, null, '2', null, '1', 'oruQl1ceOfa2VGFGj-p0xALrRPuc', '2017-08-17 17:35:22', '2017-08-17 17:45:02', null);
INSERT INTO `wc_users` VALUES ('1031', 'oruQl1QKWzEhZCgkJR6z3wTLsVjA', null, null, null, '', null, 'Hly', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3UwKLcHDyV908AhCGuhlQelmOMegtGISxHKBaJ090Nhb35AlXNyWxgvzFruqO62W3uI0bgeeuC2j/0', null, null, null, '2', null, '1', 'oruQl1QKWzEhZCgkJR6z3wTLsVjA', '2017-08-17 17:35:48', '2017-08-17 17:35:48', null);
INSERT INTO `wc_users` VALUES ('1032', 'oruQl1eZa72aUHnZO48iSueRTmlA', null, null, null, '', null, '✨ Kelly.黄', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ1SnKsaMpcgwiayOPB5Hzx1EJrNw0goDOJB3m78ZxibCuibdRJ4m4Mp8et9cviaBGKibCjNCxiacdZGQ7Q/0', null, null, null, '2', null, '1', 'oruQl1eZa72aUHnZO48iSueRTmlA', '2017-08-17 17:36:59', '2017-08-17 17:36:59', null);
INSERT INTO `wc_users` VALUES ('1033', 'oruQl1Y7p8qV4CjygKcDM0yZG73Q', null, null, null, '', null, 'Arashi', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8eGBdIWWDcudMcoZScsGURVacpEhqEVEqEwhuvfo9yglCGTASkHDZtSuJbNFV2ZauCFB9wrse3yAULxDn1c0Umw/0', 'uploads/user/1033/img1502962792.jpg', null, null, '1', null, '1', 'oruQl1Y7p8qV4CjygKcDM0yZG73Q', '2017-08-17 17:37:18', '2017-08-17 17:37:18', null);
INSERT INTO `wc_users` VALUES ('1034', 'oruQl1UvXP0iWz1CaWY27bKDmRew', null, null, null, '', null, '不留', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3Rvgj389nEDmCvIicKKOricCCp4r7UZDj4vO4yXQQruuhgeq9ed1jyLbNRT9U0MV3icfjAZ9TzK3oJT/0', null, null, null, '2', null, '1', 'oruQl1UvXP0iWz1CaWY27bKDmRew', '2017-08-17 17:38:49', '2017-08-17 17:41:28', null);
INSERT INTO `wc_users` VALUES ('1035', 'oruQl1XEC8daD8B786gerOhDYr_E', null, null, null, '', null, '百度客服陈梦婷', 'http://wx.qlogo.cn/mmopen/rYqlKVibmt5TD6MyradoRngmJjVvUIkNs7IqHhPcd2D3ticKj9ElO9t9Lzp5nwD7cNyf09lIzT78FX4vSaBGib79Reg1PnstwtU/0', null, null, null, '0', null, '1', 'oruQl1XEC8daD8B786gerOhDYr_E', '2017-08-17 17:44:13', '2017-08-17 17:44:13', null);
INSERT INTO `wc_users` VALUES ('1036', 'oruQl1ZJXXcXlFLW7_zM48wgaF0U', null, null, null, '', null, '陈新洪????', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuTtXvrt0QPr1x0TGa9rUmmyib05teUl8DPGEQxXjNibDicz508iabBOWWa9r3iaRDp09HMlgWeckss5NROvW3LSUwmT1/0', 'uploads/user/1036/img1502970636.jpg', null, null, '1', null, '1', 'oruQl1ZJXXcXlFLW7_zM48wgaF0U', '2017-08-17 18:23:17', '2017-08-17 18:23:17', null);
INSERT INTO `wc_users` VALUES ('1037', 'oruQl1TmPPNDQwpNehdkBXlFe4CQ', null, null, null, '', null, '百度-彭晓娜', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7rGr4SRKnsCcXyPJo67TzoOBQUz5nL0eGFro1nK8yKctMzSL6vlh2sShUINhLChGUKO7Vzkic5Xw4WUMvVodvYbzq3ksD4zdn0/0', null, null, null, '2', null, '1', 'oruQl1TmPPNDQwpNehdkBXlFe4CQ', '2017-08-18 11:16:03', '2017-08-18 11:16:03', null);
INSERT INTO `wc_users` VALUES ('1038', 'oruQl1dxLV9_FuLXkI8dDoL-ezIg', null, null, null, '', null, '百度 何凯丰', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuRHwqymdzf8jBbicB1x6bA43p4kAwkFOfh4DEDuvWOac28wQYC47BK2XiamhRJBiaMvOib2RrBsXu0H7PmZ83OPFr9F/0', 'uploads/user/1038/img1503028760.jpg', null, null, '1', null, '1', 'oruQl1dxLV9_FuLXkI8dDoL-ezIg', '2017-08-18 11:55:56', '2017-08-18 11:55:56', null);
INSERT INTO `wc_users` VALUES ('1039', 'oruQl1YSymIOQY3ZnovW-C6tYWZc', null, null, null, '', null, '伊柳', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuSzl5X717OCD9FibPNXniacnFNtnV7BAkMiaLexC1yjCVLgbE7JicURf7LXHww8Uniajiap30mRGftQA4Lh7zYibScwjM2/0', null, null, null, '2', null, '1', 'oruQl1YSymIOQY3ZnovW-C6tYWZc', '2017-08-18 14:16:49', '2017-08-18 14:23:17', null);
INSERT INTO `wc_users` VALUES ('1040', 'oruQl1XSFC7M6MAmWDEvFKm3C9-A', null, null, null, '', null, '哆啦A玲子', 'http://wx.qlogo.cn/mmopen/rYqlKVibmt5TD6MyradoRnvx3EQPPLzgMp48GfrHEh6C22KgJlBxnrR1sly80IxS6ycQ1lmtjmZXkX5CtTFUusvichB2Qia00uV/0', null, null, null, '2', null, '1', 'oruQl1XSFC7M6MAmWDEvFKm3C9-A', '2017-08-18 15:42:47', '2017-08-18 15:42:47', null);
INSERT INTO `wc_users` VALUES ('1041', 'oruQl1fBNAmEs6fOvjJksycPsfZE', null, null, null, '', null, '过', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3WAAueed0QJcUiaibu9YyASP01EW6x04EbC1eApfStE6Vn3rhKOGjibjFPjt25joRsokgiaQZSnXw9sO/0', null, null, null, '1', null, '1', 'oruQl1fBNAmEs6fOvjJksycPsfZE', '2017-08-19 09:13:01', '2017-08-19 09:13:01', null);
INSERT INTO `wc_users` VALUES ('1042', 'oruQl1Z09bb5jHveDYFOSuLkGf5k', null, null, null, '', null, 'Lucas', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIic8927xdJUARRhw4krkDaYUYV6SiaMY9vDdRuCd1nrRqWzuGpzmgyib3yQI4RiagrnT1fibXbgdRiaa6Q/0', null, null, null, '1', null, '1', 'oruQl1Z09bb5jHveDYFOSuLkGf5k', '2017-08-19 20:58:31', '2017-08-19 20:58:31', null);
INSERT INTO `wc_users` VALUES ('1043', 'oruQl1fUfN6E_hzljHCIyzCH6nK0', null, null, null, '', null, '年少爱追梦、', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaVr9AEQtIRXwUEYJibwqLSBSolibGiblT4HEKQPK3Xk0TxNGJC4Kria9kkbQpVeq1myreweJkUbpbCsb/0', null, null, null, '1', null, '1', 'oruQl1fUfN6E_hzljHCIyzCH6nK0', '2017-08-20 02:46:50', '2017-08-20 02:46:50', null);
INSERT INTO `wc_users` VALUES ('1044', 'oruQl1bwWzLqAm0VzXkz7iVHuhTA', null, null, null, '', null, '南', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz5FRkwSsxR7zhxPOLEUIicHB5icdFDA6F0EhjAh0RicIGYcibbxTyqMO9d1QS9enwNS7J0qrHHHelBf4/0', null, null, null, '2', null, '1', 'oruQl1bwWzLqAm0VzXkz7iVHuhTA', '2017-08-21 08:49:24', '2017-08-21 08:49:24', null);
INSERT INTO `wc_users` VALUES ('1045', 'oruQl1ebnQFU7WkdJftVAJQPDOzI', null, null, null, '', null, '王斯超', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6wYMW7RtQuLUaERP8Z1EHwh1yGsnDGZxBViahl53e6FILY2ckkhNGBhmqBZRe0EYSZibOLbBMTyEuQ/0', null, null, null, '1', null, '1', 'oruQl1ebnQFU7WkdJftVAJQPDOzI', '2017-08-21 10:41:30', '2017-08-21 10:41:30', null);
INSERT INTO `wc_users` VALUES ('1046', 'oruQl1XlUluUfJa0IE_RBISdzgYM', null, null, null, '', null, 'AMY', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaeeNcNnxQTtWGG20dv7HeNAWRehQ7BIJtF6C4dxlrV3LqHVCXZ0dFF9rCPgzKJlgu13uQ1AA442c/0', null, null, null, '2', null, '1', 'oruQl1XlUluUfJa0IE_RBISdzgYM', '2017-08-21 10:53:13', '2017-08-21 10:53:13', null);
INSERT INTO `wc_users` VALUES ('1047', 'oruQl1XRyqYwTZ631n3bwXrYFYjo', null, null, null, '', null, '凌晨', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJDOwaajOAvHnWhUxDPRuXVmbWTlxtibUoLlDK0EuRTIoN6OMicOgDZwO6w4A4oD6WMFHicsH28VRe3g/0', null, null, null, '1', null, '1', 'oruQl1XRyqYwTZ631n3bwXrYFYjo', '2017-08-21 13:13:18', '2017-08-21 13:13:18', null);
INSERT INTO `wc_users` VALUES ('1048', 'oruQl1bj9qo4oXEbTGLap0Nc9yeo', null, null, null, '', null, '毛毛', 'http://wx.qlogo.cn/mmopen/rYqlKVibmt5TD6MyradoRnoOCroP2VpGVzFjQHrjTI0oSD6MAaTfdOfz8j3zicia9YjKgKBZfHoian5PRsV9IgPicmM73WNJTVBYm/0', 'uploads/user/1048/img1503366790.jpg', null, null, '2', null, '1', 'oruQl1bj9qo4oXEbTGLap0Nc9yeo', '2017-08-22 09:51:52', '2017-08-22 09:51:52', null);
INSERT INTO `wc_users` VALUES ('1049', 'oruQl1f9nYq-1W1UGX0wWHf_FvTo', null, null, null, '', null, 'A百度-王珠珠(3503318)', 'http://wx.qlogo.cn/mmopen/YW4c50BwHwicC7wCa8qiavpaP77ibmdR8ibh8OQbFXw7MJwZibFrPeGGARHjLwfSDUoaJib6HZRvFicXTELrVL7gzFiaib2hOMw6eKf1h/0', null, null, null, '2', null, '1', 'oruQl1f9nYq-1W1UGX0wWHf_FvTo', '2017-08-22 10:25:13', '2017-08-22 10:25:13', null);
INSERT INTO `wc_users` VALUES ('1050', 'oruQl1eJVWnb-X1qM0ucrNJZpK7k', null, null, null, '', null, '百度-李小楷', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw90XuIztiaAyzkBRySfadfJNF4kTlxNyk5PnU6W9zMbbexbow5AM9No7osDlS97ibLLmphWgbTqFiaRWLgj52Akdzf/0', null, null, null, '1', null, '1', 'oruQl1eJVWnb-X1qM0ucrNJZpK7k', '2017-08-22 10:40:45', '2017-08-22 10:40:45', null);
INSERT INTO `wc_users` VALUES ('1051', 'oruQl1UGJTPvJk3BFnb_t7qxSAw4', null, null, null, '', null, '????????????rainy', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3ciaolA0xA6G77wmAoicXJh2dB7GI1icm9huTy0v7rnWZic5jJUp84ImXWwmA8B6qjnnEfH1sTyOEkVic/0', null, null, null, '2', null, '1', 'oruQl1UGJTPvJk3BFnb_t7qxSAw4', '2017-08-22 10:58:37', '2017-08-22 10:58:37', null);
INSERT INTO `wc_users` VALUES ('1052', 'oruQl1eQOrPTt0z0kURgOReAJvfg', 'linsj@ydbaidu.net', '15994972833', null, '', null, '小洁', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8ftCLxlkHhuyTcc1VbiaNPxhsYVOVXv2xTancm4qRyBEvCETcoAfcJvIMvzalQX5iczY8icAdaA4teyq3IpAQFDljs/0', 'uploads/user/1052/img1503385595.jpg', null, null, '2', null, '1', 'oruQl1eQOrPTt0z0kURgOReAJvfg', '2017-08-22 11:12:08', '2017-08-22 15:13:55', null);
INSERT INTO `wc_users` VALUES ('1053', 'oruQl1cn8-tPF3vkz_FhfxR1sKQc', null, null, null, '', null, '蛮曼', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELUmbx1HaguYEoap61AXdH6InOZiaNGSES3FRscfQf934F0wGSxY0mV6UKC652e80ITtw0CvlBHtcw/0', null, null, null, '2', null, '1', 'oruQl1cn8-tPF3vkz_FhfxR1sKQc', '2017-08-22 11:17:42', '2017-08-22 11:17:42', null);
INSERT INTO `wc_users` VALUES ('1054', 'oruQl1VGSBCu5c6BoUrKXw3JCZ5E', 'linsc@ydbaidu.net', '15994989206', null, '', null, 'Ser.', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQDSbL1LEncvykbl6v3UTdjKBkqTJbdYZqRL0evl4ia8UW4CTSujrPRoMXMj0RjH3t63ia4RXUsTGkbSm68xfAEF0/0', 'uploads/user/1054/img1503373065.jpg', null, null, '2', null, '1', 'oruQl1VGSBCu5c6BoUrKXw3JCZ5E', '2017-08-22 11:21:28', '2017-08-22 11:45:44', null);
INSERT INTO `wc_users` VALUES ('1055', 'oruQl1bhSYK1-B6_Wy5VCwZnaAiY', null, null, null, '', null, 'Elvira', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8feTd2wm5t2Tf6tn5Z3MibkV6mha4JSedZpDT4ppxs5WXB81O1TDLvDnpcBrkC5sYrGIvicFY5KLmzibLyfsU7rxDm/0', 'uploads/user/1055/img1503372338.jpg', null, null, '2', null, '1', 'oruQl1bhSYK1-B6_Wy5VCwZnaAiY', '2017-08-22 11:22:38', '2017-08-22 11:22:38', null);
INSERT INTO `wc_users` VALUES ('1056', 'oruQl1eXbRCsSiZYLu0kz0oyFM6I', null, null, null, '', null, '   ', 'http://wx.qlogo.cn/mmopen/rIQuAY6WvloUTibHXEibtDA45ZjPTxq7jAclMPHJPxdLrfVNnjJjianEZXy46jEiaFAICKMDe5rogvABgkJPxzdZeC0OzKd3UZO1/0', null, null, null, '1', null, '1', 'oruQl1eXbRCsSiZYLu0kz0oyFM6I', '2017-08-22 11:34:04', '2017-08-22 11:34:04', null);
INSERT INTO `wc_users` VALUES ('1057', 'oruQl1TKkRgbEkG0M2DxmDEcHnME', null, null, null, '', null, '假行僧', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7rGr4SRKnsCcXyPJo67TzorzUSZJwN7luG576wibLsrZ63aqIvWlma0nUut0OaIYhDWj7PvdJhtzdAw4bFsCrz8vt5JcosqXt8/0', null, null, null, '1', null, '1', 'oruQl1TKkRgbEkG0M2DxmDEcHnME', '2017-08-22 13:55:36', '2017-08-22 13:55:36', null);
INSERT INTO `wc_users` VALUES ('1058', 'oruQl1QAlyJd4n34k04N6jKmzPhs', null, null, null, '', null, '君宝', 'http://wx.qlogo.cn/mmopen/rIQuAY6WvlpkhUwvB0GBa0wMOjXuPVSPEsDFpJZrj7ccrrORVT0uGk6jrJoXdvPU8c4nCgj55rn0wkib5kiaYx26oGclX45Br7/0', null, null, null, '2', null, '1', 'oruQl1QAlyJd4n34k04N6jKmzPhs', '2017-08-22 14:01:33', '2017-08-22 14:01:33', null);
INSERT INTO `wc_users` VALUES ('1059', 'oruQl1XeIJsAo3WOti3j_s-E704A', null, null, null, '', null, '攞塊????當作????', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuSDUD1tKqaYp9qpwxavaWzRZVQzqCyUK3icHjSQtbnefakKvyGoKLPAEbYY2rb0GKUAiaYy9APRSH9mgiaqysV1xPG/0', 'uploads/user/1059/img1503382349.jpg', null, null, '2', null, '1', 'oruQl1XeIJsAo3WOti3j_s-E704A', '2017-08-22 14:07:49', '2017-08-22 14:07:49', null);
INSERT INTO `wc_users` VALUES ('1060', 'oruQl1fV7kAYYwO66Gxn2K_zP8SQ', null, null, null, '', null, '洗洗睡了', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8eiaiaWvs73ep6ujdSZfKOfRO3a1E3rXSCPiamsschIP9KS7MctYHicCWh6RTEVxBKLicvlJaeiba5RnWzH14bhFvzbYV/0', null, null, null, '1', null, '1', 'oruQl1fV7kAYYwO66Gxn2K_zP8SQ', '2017-08-22 14:21:11', '2017-08-22 14:21:11', null);
INSERT INTO `wc_users` VALUES ('1061', 'oruQl1baqcdEAUvQpTJjcHaeH9uI', null, null, null, '', null, 'Y·蓉', 'http://wx.qlogo.cn/mmopen/4ac9Hhg2qF0CjiaWSxStZicGXnVYFuld5PNMoMSJZk4BTT31X3PFNtscCzhRLc6a8do4lmF8usw7ba18SHRNecTV8wGpyKHtNY/0', null, null, null, '2', null, '1', 'oruQl1baqcdEAUvQpTJjcHaeH9uI', '2017-08-22 14:22:38', '2017-08-22 14:22:38', null);
INSERT INTO `wc_users` VALUES ('1062', 'oruQl1T_whkfScT_cFfPQcrdL0_4', null, null, null, '', null, 'huali', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz69mamzU3MD26QyvCzGktykyxc5gd0ZLdLG7cNSbQglpSaCFucSp5STrcBXln1ibTLJ21EkmMaMibX/0', null, null, null, '2', null, '1', 'oruQl1T_whkfScT_cFfPQcrdL0_4', '2017-08-22 14:31:23', '2017-08-22 14:31:23', null);
INSERT INTO `wc_users` VALUES ('1063', 'oruQl1RZZqRUQDA-MqfEXCGmMxUY', null, null, null, '', null, '梦醒了', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBUrMDibLs8TkO74T54gecmiabreMib44thfibZic0Ylz2e9RibXr2bqnfj18g8xCabg0rZIRPWOtl0eoMQ/0', 'uploads/user/1063/img1503384195.jpg', null, null, '2', null, '1', 'oruQl1RZZqRUQDA-MqfEXCGmMxUY', '2017-08-22 14:31:36', '2017-08-22 14:39:31', null);
INSERT INTO `wc_users` VALUES ('1064', 'oruQl1e8BNHy4122qJwkTybviwSQ', null, null, null, '', null, '叶基`C', 'uploads/user/1064/img1503383850.jpg', 'uploads/user/1064/img1503383790.jpg', null, null, '1', null, '1', 'oruQl1e8BNHy4122qJwkTybviwSQ', '2017-08-22 14:31:39', '2017-08-22 14:36:14', null);
INSERT INTO `wc_users` VALUES ('1065', 'oruQl1S3h0WHm2HXzXdUWdyqZ3Bg', null, null, null, '', '8u8Rxdkr8ZfSrOpV9AkVnt1kFzan165y7W0kIPkC5KBHuhYXUguBdmttjZk1', '雷公', 'http://wx.qlogo.cn/mmopen/YW4c50BwHwibT8q6FtrR1ibIdqoJuY1peMKM9nEcwV1b3oFw9ReSS1dIdWKdfkAeibdvGKEAoPiam6Zw0wSUcHcJvRpYRMibDSC19/0', 'uploads/user/1065/img1503383748.jpg', null, null, '1', null, '1', 'oruQl1S3h0WHm2HXzXdUWdyqZ3Bg', '2017-08-22 14:33:32', '2017-08-22 14:51:30', null);
INSERT INTO `wc_users` VALUES ('1066', 'oruQl1WNIEREeMRapSEq4gD04H_k', null, null, null, '', null, '小叶子', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz5Skh0ibHSPXk8r6SbNAoG0799CpiaibibfOCtaXeN5dSY6fKvEOHWNcN6dw8iamv1RfmO15bJRTDLfXW/0', 'uploads/user/1066/img1503383812.jpg', null, null, '2', null, '1', 'oruQl1WNIEREeMRapSEq4gD04H_k', '2017-08-22 14:33:39', '2017-08-22 14:33:39', null);
INSERT INTO `wc_users` VALUES ('1067', 'oruQl1RdDf5frAsrCZv049rFvr-U', null, null, null, '', null, '听风', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3Xvia1IPuAEmzOrbhfLzMC5FVTh64vYbru2j7TQ9C60KlzicoLcibicfOlwsWxcduKAVLYU3eDtsr4x9/0', null, null, null, '1', null, '1', 'oruQl1RdDf5frAsrCZv049rFvr-U', '2017-08-22 14:35:56', '2017-08-22 14:35:56', null);
INSERT INTO `wc_users` VALUES ('1068', 'oruQl1S9DoP3E-BTOweYvdpvmJPA', null, null, null, '', null, '百度小黄人', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSaTB51JJW2pHA16DcbTl5hwebkZAqicqzaxWB85X6CNAnvR1L4hb3qTESG3Yru4Rmic5jJ1BgXicCbRu/0', 'uploads/user/1068/img1503384478.jpg', null, null, '1', null, '1', 'oruQl1S9DoP3E-BTOweYvdpvmJPA', '2017-08-22 14:45:43', '2017-08-22 14:45:43', null);
INSERT INTO `wc_users` VALUES ('1069', 'oruQl1flf2GkdWS9DOj-vbN1FHmY', null, null, null, '', null, '风语', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaeibUl58XC4W7YqLkQ41VvoIpbNxZtww4sND8LmwBQu0vftxRK98guOXU6hSZ1yokPVW8X9g7AJS6k/0', null, null, null, '1', null, '1', 'oruQl1flf2GkdWS9DOj-vbN1FHmY', '2017-08-22 14:45:53', '2017-08-22 14:49:44', null);
INSERT INTO `wc_users` VALUES ('1070', 'oruQl1RUTeXe_aGbIfoHvWwed-14', null, null, null, '', null, '、丶', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiaeibG01FiajIZjlawDLcpfsqVDXrGQZZO3DVXk6TE0v7cj8ouvp9A6qSa5tWVXtedCDvhqQpasIaEHo/0', null, null, null, '1', null, '1', 'oruQl1RUTeXe_aGbIfoHvWwed-14', '2017-08-22 14:45:53', '2017-08-22 14:45:53', null);
INSERT INTO `wc_users` VALUES ('1071', 'oruQl1a23TrOUSeKlLOupnr1RBMI', null, null, null, '', null, '小暖', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKK1k1ic7Iw9Yh0fsWMB6Z6bR6WYEgdcra01ByMq7cnIjtvhEa5y9FA1XShAOCKHN2KA07Nqkvhn5w/0', null, null, null, '2', null, '1', 'oruQl1a23TrOUSeKlLOupnr1RBMI', '2017-08-22 14:46:05', '2017-08-22 14:46:05', null);
INSERT INTO `wc_users` VALUES ('1072', 'oruQl1fBGa26REHtcuybTwMl13VY', null, null, null, '', null, 'Qi', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIUicFmiaxstfCs1j13f52oDHnlZKpnibv1icTg9dNNvQlJBKohAcWAnIuh6eSoMfKTwBlvyQZ1ic4HdVA/0', 'uploads/user/1072/img1503384879.jpg', null, null, '2', null, '1', 'oruQl1fBGa26REHtcuybTwMl13VY', '2017-08-22 14:46:13', '2017-08-22 14:53:54', null);
INSERT INTO `wc_users` VALUES ('1073', 'oruQl1dzBQEYYa-BJPF6TejMUfc8', null, null, null, '', null, 'BAIDU????陈', 'http://wx.qlogo.cn/mmopen/gQQO820rz5WtFt6qVslphGqnicpgZy1Bia1QkMhMGKB3WQxbT0icxAJKetfVSIWU3KXibeODcRlTeFW1vqkCEzXvbw/0', null, null, null, '1', null, '1', 'oruQl1dzBQEYYa-BJPF6TejMUfc8', '2017-08-22 14:46:14', '2017-08-22 14:46:14', null);
INSERT INTO `wc_users` VALUES ('1074', 'oruQl1bXBd_lxsfmMW8JVaiyKyd4', null, null, null, '', null, '゛微微凉dě薄荷·唐メ', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIaicniayrkHIWYnvtSJSYOlic7mibTbA6zjCsIBvSBwlOwibQkgAsQZer3mPz02HiaFlFicBJPZibpdL48QQ/0', null, null, null, '2', null, '1', 'oruQl1bXBd_lxsfmMW8JVaiyKyd4', '2017-08-22 14:47:23', '2017-08-22 14:47:23', null);
INSERT INTO `wc_users` VALUES ('1075', 'oruQl1YJ2lUV1jwfuDQcKPKVw3ZY', null, null, null, '', null, 'Agoni', 'http://wx.qlogo.cn/mmopen/YW4c50BwHw9TCPAdnARIz8ryiam8ialBqnVRO6s9QToWFLnKDsAwIJcRW9581zcA7DzCu0SgtoMKGUGAPjQltWrwiam8snicNwCu/0', 'uploads/user/1075/img1503384555.jpg', null, null, '2', null, '1', 'oruQl1YJ2lUV1jwfuDQcKPKVw3ZY', '2017-08-22 14:47:46', '2017-08-22 14:47:46', null);
INSERT INTO `wc_users` VALUES ('1076', 'oruQl1YY5NdFloCuy0-aA1zj2erA', null, null, null, '', null, '艳丽', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSabNiacnRxHztP0EgLQHM9eGEQwoRPDgPjVJSM0a47s69iaVWdFehtxLbVerPMtFyLcJ1IxeEIN411r/0', 'uploads/user/1076/img1503384840.jpg', null, null, '2', null, '1', 'oruQl1YY5NdFloCuy0-aA1zj2erA', '2017-08-22 14:49:07', '2017-08-22 14:49:07', null);
INSERT INTO `wc_users` VALUES ('1077', 'oruQl1d7UP1gOyHxwDvSQSwdFG4Q', null, null, null, '', null, 'Micky', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae0YKmcxOG8XPuJn54T8slXby442lby9kxlBqia0QxmxV2EUic42Gia27GXflJqAsHZyHq94HOtkRNibY/0', null, null, null, '2', null, '1', 'oruQl1d7UP1gOyHxwDvSQSwdFG4Q', '2017-08-22 14:52:49', '2017-08-22 14:52:49', null);
INSERT INTO `wc_users` VALUES ('1078', 'oruQl1YAZLLY_kdPnQWwERDN9kc4', null, null, null, '', null, '百度  楠', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8eg0wCdtxvIvbne79CkMJ9IcZvMD1QOicpDichxicBx606JFLO6291m6GF9dSYOZEvxquN3pjS62Epu6iaxX0oSH01o/0', 'uploads/user/1078/img1503384964.jpg', null, null, '1', null, '1', 'oruQl1YAZLLY_kdPnQWwERDN9kc4', '2017-08-22 14:54:03', '2017-08-22 14:54:03', null);
INSERT INTO `wc_users` VALUES ('1079', 'oruQl1WpPCjxe7mJFQY15AEaKwew', null, null, null, '', null, '☪☤JｅｎPｏｎ✫﹏♚', 'http://wx.qlogo.cn/mmopen/YW4c50BwHwicxKdH7zgb5vR36PdCn7D1DHVgicdenaW0xpEfzibEBnb1ib3l1BdoibRRLsaONFhPY5L4p3oibLcMUSCwa00z2NFNec/0', 'uploads/user/1079/img1503385334.jpg', null, null, '1', null, '1', 'oruQl1WpPCjxe7mJFQY15AEaKwew', '2017-08-22 14:55:30', '2017-08-22 15:01:28', null);
INSERT INTO `wc_users` VALUES ('1080', 'oruQl1Qva6amu3IKBr_U5euQB0Qg', null, null, null, '', null, 'MDL', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W3IKQOXZMSacaLapibClJEwP71pH09Sbzhor0TYdZsN6Yt7mTygbtlDTWqOMCmHyKp7xiaxnXiaxyrI4vSGD75rhV/0', null, null, null, '1', null, '1', 'oruQl1Qva6amu3IKBr_U5euQB0Qg', '2017-08-22 14:57:15', '2017-08-22 14:57:15', null);
INSERT INTO `wc_users` VALUES ('1081', 'oruQl1R04Z1FwcoSFT5c3LMOCKNA', null, null, null, '', null, '槿。', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIWf8Quc2rU8QZ4kLdLyInIulUNaDRulxFGdicicpYYB5x9lqTXMy0xS8tVAvZtNDWS9m6ViaLia0qRmw/0', 'uploads/user/1081/img1503385579.jpg', null, null, '1', null, '1', 'oruQl1R04Z1FwcoSFT5c3LMOCKNA', '2017-08-22 15:04:10', '2017-08-22 15:04:10', null);
INSERT INTO `wc_users` VALUES ('1082', 'oruQl1e35n9ldP9aRjc6rwjJu8lU', null, null, null, '', null, 'LI', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8eKcqcsag5MZZlYj4YVWGXTS7D6DliagBAIia31xghAFMJmRyQ5pTqFyqPxanRZ9hFdibvicm3ibCYZCeCh7GsPoWEA3/0', null, null, null, '0', null, '1', 'oruQl1e35n9ldP9aRjc6rwjJu8lU', '2017-08-22 15:05:55', '2017-08-22 15:05:55', null);
INSERT INTO `wc_users` VALUES ('1083', 'oruQl1Ug4PrrPTXVmCiofOtMI8FE', null, null, null, '', null, '。', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDoYXUvATJGSt1sWQRQN4jz9uzZdzLTvvSawDNB3LtIWjHuYciczs0XfUhT61YZYnuJ42SAibiazvR68gP7v2npvVgNkOyibHBW8HA/0', 'uploads/user/1083/img1503385753.jpg', null, null, '2', null, '1', 'oruQl1Ug4PrrPTXVmCiofOtMI8FE', '2017-08-22 15:06:52', '2017-08-22 15:06:52', null);
INSERT INTO `wc_users` VALUES ('1084', 'oruQl1RCPWpFE4dqUI4vCycCdp9w', null, null, null, '', null, '惠州百度李智杰', 'http://wx.qlogo.cn/mmopen/UJKgUU1OkU704zlC4lZmpBzT75hkpERqKAJQOPviax5KiamY7RnreiaH20O5d2mzwuSE0LaUX5nlwbIY310MleXd9yhWWVicFFFW/0', null, null, null, '1', null, '1', 'oruQl1RCPWpFE4dqUI4vCycCdp9w', '2017-08-22 15:06:56', '2017-08-22 15:06:56', null);
INSERT INTO `wc_users` VALUES ('1085', 'oruQl1UsProZXzbra-zfU5PafYko', null, null, null, '', null, '欧阳', 'http://wx.qlogo.cn/mmopen/JFDuOnTicZpjLzZvbQuaVjCpkpTCngdzko9ofvhMHoudCcG0w3ia6pMCpyOuNkRp7xYrPyVHCBM3401gPCunCPRTibNhSgTdKuB/0', 'uploads/user/1085/img1503386116.jpg', null, null, '1', null, '1', 'oruQl1UsProZXzbra-zfU5PafYko', '2017-08-22 15:07:04', '2017-08-22 15:07:04', null);
INSERT INTO `wc_users` VALUES ('1086', 'oruQl1U9RE8C6alVWVit2iHvJTE0', null, null, null, '', null, '百度小丁', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuTtXvrt0QPr14da8rM9ElDXO0bicicwFONog0icnEgq4zI1xU4tuj4f9pnyWP8ib58esmKvyxLSpu0uQoZ16DSsJRV0/0', 'uploads/user/1086/img1503385749.jpg', null, null, '1', null, '1', 'oruQl1U9RE8C6alVWVit2iHvJTE0', '2017-08-22 15:07:12', '2017-08-22 15:07:12', null);
INSERT INTO `wc_users` VALUES ('1087', 'oruQl1dFs3k27k_kJ_GOKBUE9YA4', 'chenchj@ydbaidu.net', '15992398921', null, '', null, '啊楚君啊楚君', 'http://wx.qlogo.cn/mmopen/lib3mfM6jribu6ibDwKPs79cQmsWSLnegVSGmd3GCsKgXGKNKibDfW76c4b43dxibaclbYtXiblMHsiakBnwX0knBaYYiabhnyI9fQQN/0', null, '广东省潮州市湘桥区潮州大道交通银行八楼', null, '2', null, '1', 'oruQl1dFs3k27k_kJ_GOKBUE9YA4', '2017-08-22 15:11:32', '2017-08-22 15:17:37', null);
INSERT INTO `wc_users` VALUES ('1088', 'oruQl1Y3kbWo7ctdZBEBDrHk9ucw', null, null, null, '', null, '《杂志摄》阿臣', 'http://wx.qlogo.cn/mmopen/rIQuAY6WvlqqqfuTTiccl95pvwwMzbdicicu6OqAxf4eyibAllJXFiasNjZNLPtAuPehy5eJqWcyxmf7iah6h7Kx3t4lYjRc8LlFZ0/0', null, null, null, '1', null, '1', 'oruQl1Y3kbWo7ctdZBEBDrHk9ucw', '2017-08-22 15:12:07', '2017-08-22 15:12:07', null);
INSERT INTO `wc_users` VALUES ('1089', 'oruQl1aSIEgei72Z5n66FJ-rc7r0', null, null, null, '', null, '瑞定', 'http://wx.qlogo.cn/mmopen/SdNX5wWop8cHe7wctYFiae24SxMOeFjibzguQOLxNAicbXwugiaoZshe4bEGMibWXKn6v254r8ClRlwxfFJicsS26bfrA7ouSwsfCia/0', null, null, null, '2', null, '1', 'oruQl1aSIEgei72Z5n66FJ-rc7r0', '2017-08-22 15:17:02', '2017-08-22 15:17:02', null);
INSERT INTO `wc_users` VALUES ('1090', 'oruQl1QiuXyFIBS0oPo3x4lbCDZo', null, null, null, '', null, '姐姐', 'http://wx.qlogo.cn/mmopen/fRrjF7YUSuQwMu3ibDz6W3dkSq2hC0Bs7IO6Uo93r1WjhsGSUtU4Lb0TxvWqnySMibSdrSlaH9GQzlpFD09IW0PrYBhiavLnLp9/0', 'uploads/user/1090/img1503386623.jpg', null, null, '2', null, '1', 'oruQl1QiuXyFIBS0oPo3x4lbCDZo', '2017-08-22 15:20:57', '2017-08-22 15:23:21', null);
INSERT INTO `wc_users` VALUES ('1091', 'oruQl1auM5e8iPhQRjtdTfNCeFdc', null, null, null, '', null, 'A百度推广赖小虫', 'http://wx.qlogo.cn/mmopen/YW4c50BwHwicUcekFvBePfmrA6rtOLCtUiaGnOEx9WFX0qiak5cPAXeoYM3ibQ2X7BvgNJUicPNrvDDRRl5qtE7LgoWYcOgQicxHf3/0', null, null, null, '2', null, '1', 'oruQl1auM5e8iPhQRjtdTfNCeFdc', '2017-08-22 15:30:17', '2017-08-22 15:30:17', null);
INSERT INTO `wc_users` VALUES ('1092', 'oruQl1RMppLLjOkTXlfL82twxGO4', null, null, null, '', null, '珊珊', 'http://wx.qlogo.cn/mmopen/gQQO820rz5W5yNwrlfm20SMUGZBxI6epYhgTOnUv8fkvm2cz6y9x5VbCCC06oicSBmJ1ep4Gu0CIK3XyTlb8hpA/0', null, null, null, '2', null, '1', 'oruQl1RMppLLjOkTXlfL82twxGO4', '2017-08-22 15:52:32', '2017-08-22 15:52:32', null);
INSERT INTO `wc_users` VALUES ('1093', 'oruQl1aiYc2x_mJ3fHFepgbA5ox8', 'wuy@xm12.com', '18965222180', null, '', null, '吴燕', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLATlveEH86TyQPvT1OW4plds6e705QbJ9qpIvOQ2HN8poTofqNTxAL62ic7ud3J7nlvbbcpdLRicmgw/0', null, null, null, '2', null, '1', 'oruQl1aiYc2x_mJ3fHFepgbA5ox8', '2017-08-22 15:55:33', '2017-08-22 15:56:13', null);

-- ----------------------------
-- Table structure for wc_user_followers
-- ----------------------------
DROP TABLE IF EXISTS `wc_user_followers`;
CREATE TABLE `wc_user_followers` (
  `follower_id` int(10) unsigned NOT NULL COMMENT '用户ID',
  `followed_id` int(10) unsigned NOT NULL COMMENT '被关注用户ID',
  `remark` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL COMMENT '关注时间',
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `user_id` (`follower_id`) USING BTREE,
  KEY `follow_id` (`followed_id`) USING BTREE,
  CONSTRAINT `wc_followers_ibfk_1` FOREIGN KEY (`follower_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wc_followers_ibfk_2` FOREIGN KEY (`followed_id`) REFERENCES `wc_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='关注列表';

-- ----------------------------
-- Records of wc_user_followers
-- ----------------------------
INSERT INTO `wc_user_followers` VALUES ('40', '679', null, '2017-08-11 10:04:59', '2017-08-11 10:04:59');
INSERT INTO `wc_user_followers` VALUES ('52', '61', null, '2017-08-11 10:07:37', '2017-08-11 10:07:37');
INSERT INTO `wc_user_followers` VALUES ('121', '656', null, '2017-08-11 10:21:13', '2017-08-11 10:21:13');
INSERT INTO `wc_user_followers` VALUES ('40', '121', null, '2017-08-11 10:23:04', '2017-08-11 10:23:06');
INSERT INTO `wc_user_followers` VALUES ('61', '40', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('61', '52', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('68', '61', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('80', '68', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('75', '61', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('71', '61', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('62', '928', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('90', '62', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('70', '61', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('61', '70', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('98', '663', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('95', '662', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('66', '888', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('114', '663', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('62', '78', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('124', '78', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('109', '132', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('66', '132', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('62', '66', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('71', '78', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('176', '78', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('62', '147', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('62', '109', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('190', '215', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('147', '220', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('147', '196', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('132', '888', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('62', '237', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('232', '62', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('141', '147', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('140', '888', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('75', '888', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('198', '190', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('198', '285', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('198', '152', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('293', '152', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('252', '298', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('261', '274', null, '2017-08-11 10:29:35', '2017-08-11 10:29:35');
INSERT INTO `wc_user_followers` VALUES ('261', '273', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('261', '272', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('242', '331', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('242', '222', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('313', '298', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('343', '261', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('261', '343', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('261', '325', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('325', '261', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('261', '341', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('261', '345', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('135', '285', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('341', '295', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('341', '320', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('261', '362', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('345', '370', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('346', '261', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('261', '380', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('261', '381', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('271', '64', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('64', '271', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('261', '379', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('271', '287', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('64', '289', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('289', '64', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('109', '405', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('405', '271', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('152', '289', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('289', '152', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('85', '83', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('459', '462', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('461', '424', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('465', '146', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('468', '472', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('471', '468', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('468', '471', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('472', '471', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('173', '146', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('255', '251', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('135', '133', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('255', '135', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('128', '496', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('135', '165', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('537', '135', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('548', '535', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('85', '533', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('127', '539', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('552', '226', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('552', '548', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('553', '548', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('520', '512', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('603', '297', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('66', '109', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('110', '109', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('109', '888', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('110', '604', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('109', '110', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('376', '375', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('375', '376', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('151', '208', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('212', '607', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('124', '109', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('62', '132', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('71', '109', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('372', '357', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('628', '361', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('342', '645', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('332', '643', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('262', '62', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('642', '649', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('640', '649', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('242', '314', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('616', '888', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('590', '676', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('679', '74', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('698', '700', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('793', '791', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('797', '721', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('721', '797', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('661', '851', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('721', '932', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('932', '721', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('657', '973', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('730', '976', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('109', '62', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('507', '578', null, '2017-08-11 10:29:36', '2017-08-11 10:29:36');
INSERT INTO `wc_user_followers` VALUES ('121', '40', null, '2017-08-11 10:32:26', '2017-08-11 10:32:26');
