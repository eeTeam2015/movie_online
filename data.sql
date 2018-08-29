/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : movie_online

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2018-08-29 13:41:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `is_super` smallint(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `role_id` (`role_id`),
  KEY `ix_admin_addtime` (`addtime`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('3', 'admin', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1', '1', '2018-06-08 15:43:00');

-- ----------------------------
-- Table structure for adminlog
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_adminlog_addtime` (`addtime`),
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminlog
-- ----------------------------
INSERT INTO `adminlog` VALUES ('1', '3', '127.0.0.1', '2018-08-10 13:26:33');
INSERT INTO `adminlog` VALUES ('2', '3', '127.0.0.1', '2018-08-10 13:37:38');
INSERT INTO `adminlog` VALUES ('3', '3', '127.0.0.1', '2018-08-10 13:48:00');
INSERT INTO `adminlog` VALUES ('4', '3', '127.0.0.1', '2018-08-22 15:17:34');
INSERT INTO `adminlog` VALUES ('5', '3', '127.0.0.1', '2018-08-23 10:19:35');
INSERT INTO `adminlog` VALUES ('6', '3', '127.0.0.1', '2018-08-29 13:37:15');
INSERT INTO `adminlog` VALUES ('7', '3', '127.0.0.1', '2018-08-29 13:37:51');

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  KEY `ix_auth_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth
-- ----------------------------
INSERT INTO `auth` VALUES ('1', '添加标签', '/tag/add/', '2018-08-10 13:46:17');
INSERT INTO `auth` VALUES ('2', '删除标签', '/tag/del/<int:id>/', '2018-08-10 13:46:22');
INSERT INTO `auth` VALUES ('3', '编辑标签', '/tag/edit/<int:id>/', '2018-08-10 13:46:34');
INSERT INTO `auth` VALUES ('4', '标签列表', '/tag/list/<int:page>/', '2018-08-10 13:46:43');
INSERT INTO `auth` VALUES ('5', '添加电影', '/movie/add/', '2018-08-10 13:46:51');
INSERT INTO `auth` VALUES ('6', '编辑电影', '/movie/edit/<int:id>/', '2018-08-10 13:47:00');
INSERT INTO `auth` VALUES ('7', '删除电影', '/movie/del/<int:id>/', '2018-08-10 13:47:12');
INSERT INTO `auth` VALUES ('8', '电影列表', '/movie/list/<int:page>/', '2018-08-10 13:47:19');
INSERT INTO `auth` VALUES ('9', '添加上映预告', '/preview/add/', '2018-08-10 13:47:25');
INSERT INTO `auth` VALUES ('10', '删除上映预告', '/preview/del/<int:id>/', '2018-08-10 13:47:33');
INSERT INTO `auth` VALUES ('12', '编辑上映预告', '/preview/edit/<int:id>/', '2018-08-10 14:15:17');
INSERT INTO `auth` VALUES ('13', '上映列表', '/preview/list/', '2018-08-10 14:15:27');
INSERT INTO `auth` VALUES ('14', '会员列表', '/user/list/<int:page>/', '2018-08-10 14:15:48');
INSERT INTO `auth` VALUES ('15', '查看会员', '/user/view/<int:id>/', '2018-08-10 14:15:55');
INSERT INTO `auth` VALUES ('16', '删除会员', '/user/del/<int:id>/', '2018-08-10 14:16:05');
INSERT INTO `auth` VALUES ('17', '删除评论', '/comment/del/<int:id>/', '2018-08-10 14:16:15');
INSERT INTO `auth` VALUES ('18', '评论列表', '/comment/list/<int:page>/', '2018-08-10 14:16:22');
INSERT INTO `auth` VALUES ('19', '收藏列表', '/moviecol/list/<int:page>/', '2018-08-10 14:16:29');
INSERT INTO `auth` VALUES ('20', '删除收藏', '/moviecol/del/<int:id>/', '2018-08-10 14:16:41');
INSERT INTO `auth` VALUES ('21', '操作日志列表', '/oplog/list/<int:page>/', '2018-08-10 14:16:53');
INSERT INTO `auth` VALUES ('22', '管理员日志列表', '/adminloginlog_list/list/<int:page>/', '2018-08-10 14:17:53');
INSERT INTO `auth` VALUES ('23', '会员日志列表', '/userloginlog/list/<int:page>/', '2018-08-10 14:17:59');
INSERT INTO `auth` VALUES ('24', '添加角色', '/role/add/', '2018-08-10 14:18:07');
INSERT INTO `auth` VALUES ('25', '角色列表', '/role/list/<int:page>/', '2018-08-10 14:18:14');
INSERT INTO `auth` VALUES ('26', '角色删除', '/role/del/<int:id>/', '2018-08-10 14:18:20');
INSERT INTO `auth` VALUES ('27', '编辑角色', '/role/edit/<int:id>/', '2018-08-10 14:18:26');
INSERT INTO `auth` VALUES ('28', '添加权限', '/auth/add/', '2018-08-10 14:18:32');
INSERT INTO `auth` VALUES ('29', '权限列表', '/auth/list/<int:page>/', '2018-08-10 14:18:39');
INSERT INTO `auth` VALUES ('30', '权限删除', '/auth/del/<int:id>/', '2018-08-10 14:19:12');
INSERT INTO `auth` VALUES ('31', '编辑权限', '/auth/edit/<int:id>/', '2018-08-10 14:19:19');
INSERT INTO `auth` VALUES ('32', '添加管理员', '/admin/add/', '2018-08-10 14:19:25');
INSERT INTO `auth` VALUES ('33', '管理员列表', '/admin/list/<int:page>/', '2018-08-10 14:19:31');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_comment_addtime` (`addtime`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for movie
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `info` text,
  `logo` varchar(255) DEFAULT NULL,
  `star` smallint(6) DEFAULT NULL,
  `playnum` bigint(20) DEFAULT NULL,
  `commentnum` bigint(20) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `release_time` date DEFAULT NULL,
  `length` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `logo` (`logo`),
  KEY `tag_id` (`tag_id`),
  KEY `ix_movie_addtime` (`addtime`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of movie
-- ----------------------------
INSERT INTO `movie` VALUES ('1', '变形金刚', '201808221544449409500498704ac38b9da36dedf7039d.mp4', '变形金刚变形金刚变形金刚变形金刚变形金刚变形金刚1', '201808221544447d659001f638444fbceec490d5b6349f.jpg', '1', '3', '0', '2', '美国', '2018-08-17', '101', '2018-08-10 14:13:14');
INSERT INTO `movie` VALUES ('2', '头号玩家', '201808221550431ea4045526b647d48e0175a737e387af.mp4', '头号玩家头号玩家头号玩家头号玩家头号玩家头号玩家1', '201808221702592856d1e3e11745369f856d52bc6390b1.jpg', '3', '25', '0', '1', '中国', '2018-08-16', '134', '2018-08-22 15:50:44');
INSERT INTO `movie` VALUES ('3', '巨齿鲨', '20180822171203f575488a35a94fce8af19ef986321bbb.mp4', '巨齿鲨巨齿鲨巨齿鲨巨齿鲨巨齿鲨', '201808221712032264dc64e5fb4c6c979e67cfcc14bbe6.jpg', '2', '1', '0', '4', '香港', '2018-08-07', '117', '2018-08-22 17:12:04');

-- ----------------------------
-- Table structure for moviecol
-- ----------------------------
DROP TABLE IF EXISTS `moviecol`;
CREATE TABLE `moviecol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_moviecol_addtime` (`addtime`),
  CONSTRAINT `moviecol_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `moviecol_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of moviecol
-- ----------------------------

-- ----------------------------
-- Table structure for oplog
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `reason` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_oplog_addtime` (`addtime`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oplog
-- ----------------------------
INSERT INTO `oplog` VALUES ('1', '3', '127.0.0.1', '添加标签动作', '2018-08-10 13:56:41');
INSERT INTO `oplog` VALUES ('2', '3', '127.0.0.1', '添加标签科幻', '2018-08-10 13:56:44');
INSERT INTO `oplog` VALUES ('3', '3', '127.0.0.1', '添加标签爱情', '2018-08-10 13:56:47');
INSERT INTO `oplog` VALUES ('4', '3', '127.0.0.1', '添加标签都市', '2018-08-10 13:56:52');
INSERT INTO `oplog` VALUES ('5', '3', '127.0.0.1', '添加标签喜剧', '2018-08-10 13:57:40');

-- ----------------------------
-- Table structure for preview
-- ----------------------------
DROP TABLE IF EXISTS `preview`;
CREATE TABLE `preview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `logo` (`logo`),
  KEY `ix_preview_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of preview
-- ----------------------------
INSERT INTO `preview` VALUES ('1', '变形金刚', '20180823103032806071e27302459d9e39e768b70e6060.jpg', '2018-08-23 10:27:11');
INSERT INTO `preview` VALUES ('2', '头号玩家', '20180823102719087f395d7e0a4bdfb1c4e9650e3e0b86.jpg', '2018-08-23 10:27:19');
INSERT INTO `preview` VALUES ('3', '巨齿鲨', '201808231027243230fe0b6a77405498bceff5eba68a7a.jpg', '2018-08-23 10:27:25');
INSERT INTO `preview` VALUES ('4', '复仇者联盟', '201808231047123ec69a17074c4721b405aacfd2eb3f3d.jpg', '2018-08-23 10:47:13');
INSERT INTO `preview` VALUES ('5', '蚁人', '201808231047184c8a57311233412fb2514c640b8d4284.jpg', '2018-08-23 10:47:18');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `auths` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `auths` (`auths`),
  KEY `ix_role_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '1,2,3,4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33', '2018-06-08 07:15:07');
INSERT INTO `role` VALUES ('2', '电影管理员', '5,6,7,8,9,10,12,13', '2018-08-10 14:24:05');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_tag_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '动作', '2018-08-10 13:56:41');
INSERT INTO `tag` VALUES ('2', '科幻', '2018-08-10 13:56:44');
INSERT INTO `tag` VALUES ('3', '爱情', '2018-08-10 13:56:47');
INSERT INTO `tag` VALUES ('4', '都市', '2018-08-10 13:56:52');
INSERT INTO `tag` VALUES ('5', '喜剧', '2018-08-10 13:57:40');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `info` text,
  `face` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `face` (`face`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '鼠', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1231@123.com', '13888888881', '鼠', '1f401.png', '2018-07-13 15:26:22', 'd32a72bdac524478b7e4f6dfc8394fc0');
INSERT INTO `user` VALUES ('2', '牛', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1232@123.com', '13888888882', '牛', '1f402.png', '2018-07-13 15:26:22', 'd32a72bdac524478b7e4f6dfc8394fc1');
INSERT INTO `user` VALUES ('3', '虎', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1233@123.com', '13888888883', '虎虎', '1f405.png', '2018-07-13 15:26:22', 'd32a72bdac524478b7e4f6dfc8394fc2');
INSERT INTO `user` VALUES ('4', '兔', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1234@123.com', '13888888884', '兔', '1f407.png', '2018-07-13 15:26:22', 'd32a72bdac524478b7e4f6dfc8394fc3');
INSERT INTO `user` VALUES ('5', '龙', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1235@123.com', '13888888885', '龙', '1f409.png', '2018-07-13 15:26:22', 'd32a72bdac524478b7e4f6dfc8394fc4');
INSERT INTO `user` VALUES ('6', '蛇', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1236@123.com', '13888888886', '蛇', '1f40d.png', '2018-07-13 15:26:22', 'd32a72bdac524478b7e4f6dfc8394fc5');
INSERT INTO `user` VALUES ('7', '马', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1237@123.com', '13888888887', '马', '1f434.png', '2018-07-13 15:26:22', 'd32a72bdac524478b7e4f6dfc8394fc6');
INSERT INTO `user` VALUES ('8', '羊', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1238@123.com', '13888888888', '羊', '1f411.png', '2018-07-13 15:26:22', 'd32a72bdac524478b7e4f6dfc8394fc7');
INSERT INTO `user` VALUES ('9', '猴', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1239@123.com', '13888888889', '猴', '1f412.png', '2018-07-13 15:26:22', 'd32a72bdac524478b7e4f6dfc8394fc8');
INSERT INTO `user` VALUES ('10', '鸡', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1240@123.com', '13888888891', '鸡', '1f413.png', '2018-07-13 15:26:22', 'd32a72bdac524478b7e4f6dfc8394fc9');
INSERT INTO `user` VALUES ('11', '狗', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1241@123.com', '13888888892', '狗', '1f415.png', '2018-07-13 15:26:22', 'd32a72bdac524478b7e4f6dfc8394fd0');
INSERT INTO `user` VALUES ('12', '猪', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1242@123.com', '13888888893', '猪', '1f416.png', '2018-07-13 15:26:22', 'd32a72bdac524478b7e4f6dfc8394fd1');
INSERT INTO `user` VALUES ('13', 'wang', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '1231231@qq232.com', '18665222222', null, null, '2018-08-23 11:02:37', '08725ab9b21f4b5095b1a1eb8892e547');
INSERT INTO `user` VALUES ('14', 'li', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '123213@1241.com', '13976554545', null, null, '2018-08-23 11:04:25', '41ca4871a6d241e2af2a0e991ce97466');
INSERT INTO `user` VALUES ('15', 'qing', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '123213@1s241.com', '13976554543', null, null, '2018-08-23 11:05:27', '987e3f0198e348369c8ccdce6f2feb38');
INSERT INTO `user` VALUES ('16', 'oo22', 'pbkdf2:sha256:50000$VIhnQO60$2e3a9de48135b6ec8c2c0d75ecafe9ba80847b3e6c1c303f1b21d64ffc45f821', '12ss@sqd.com', '13945626666', null, null, '2018-08-23 11:06:00', 'b701fcc6f17f41cbbbda8b6d759c403b');

-- ----------------------------
-- Table structure for userlog
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_userlog_addtime` (`addtime`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlog
-- ----------------------------
INSERT INTO `userlog` VALUES ('1', '16', '127.0.0.1', '2018-08-23 11:20:33');
INSERT INTO `userlog` VALUES ('2', '16', '127.0.0.1', '2018-08-23 11:22:35');
INSERT INTO `userlog` VALUES ('3', '16', '127.0.0.1', '2018-08-23 11:22:49');
INSERT INTO `userlog` VALUES ('4', '16', '127.0.0.1', '2018-08-28 14:40:13');
