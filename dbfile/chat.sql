/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : chat

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2016-04-30 18:45:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `from_user` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `time` date NOT NULL,
  `hh` varchar(255) NOT NULL,
  `mm` varchar(255) NOT NULL,
  `ss` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1', 'qwe', 'nihao', '2015-12-28', '04', '04', '15');
INSERT INTO `message` VALUES ('2', 'qwe', '你好呀', '2015-12-28', '04', '12', '17');
INSERT INTO `message` VALUES ('3', 'qwe', '恩', '2015-12-28', '04', '12', '56');
INSERT INTO `message` VALUES ('4', 'qwe', '嗯哼', '2015-12-28', '04', '21', '14');
INSERT INTO `message` VALUES ('5', 'qwe', '哈哈哈', '2015-12-28', '04', '21', '21');
INSERT INTO `message` VALUES ('6', 'qwe', '你好啊，王文婧', '2015-12-28', '04', '24', '33');
INSERT INTO `message` VALUES ('7', 'qwe', 'qoiwhas', '2015-12-28', '04', '45', '51');
INSERT INTO `message` VALUES ('8', '打的', 'hi', '2015-12-28', '04', '47', '32');
INSERT INTO `message` VALUES ('9', '打的', '你好', '2015-12-28', '04', '47', '58');

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('12');
INSERT INTO `test` VALUES ('1213141');
INSERT INTO `test` VALUES ('2121');
INSERT INTO `test` VALUES ('niasdhai');
INSERT INTO `test` VALUES ('nijqeoqwe');
INSERT INTO `test` VALUES ('sada');
INSERT INTO `test` VALUES ('sadda');
INSERT INTO `test` VALUES ('sanidhasidhasio');
INSERT INTO `test` VALUES ('中文');
INSERT INTO `test` VALUES ('你好的');
INSERT INTO `test` VALUES ('啦啦啦啦啦');
INSERT INTO `test` VALUES ('大大大');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `name` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `sex` int(11) DEFAULT NULL COMMENT '1是男，0是女',
  `state` int(11) DEFAULT NULL,
  `e_mail` varchar(255) DEFAULT NULL,
  `meCount` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('qwe', '123', null, '廊坊', null, '1', '1', '858582381@qq.com', '7');
INSERT INTO `user` VALUES ('打的', '12', null, '廊坊', null, '0', '1', '858582381@qq.com', '2');
INSERT INTO `user` VALUES ('李先森', '1', null, '廊坊', null, '1', null, '858582381@qq.com', '0');
