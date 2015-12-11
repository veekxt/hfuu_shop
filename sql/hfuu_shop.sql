/*
Navicat MySQL Data Transfer

Source Server         : hhh
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : hfuu_shop

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2015-12-11 09:43:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL COMMENT '类型id',
  `name` char(255) COLLATE utf8_bin NOT NULL COMMENT '商品名',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `price` float DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  `producter_id` int(11) DEFAULT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of goods
-- ----------------------------



-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(32) NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `pwd` varchar(255) COLLATE utf8_bin NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `stu_num` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------


INSERT INTO `user` VALUES ('9', 'dandan@qq.com', '14e1b600b1fd579f47433b88e8d85291', null, null);
INSERT INTO `user` VALUES ('10', 'laibao@qq.com', '14e1b600b1fd579f47433b88e8d85291', null, null);
INSERT INTO `user` VALUES ('11', 'jianguo@qq.com', '14e1b600b1fd579f47433b88e8d85291', null, null);
INSERT INTO `user` VALUES ('13', 'zijian@qq.com', '14e1b600b1fd579f47433b88e8d85291', null, null);
