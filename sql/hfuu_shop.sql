/*
Navicat MySQL Data Transfer

Source Server         : xt_db
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : hfuu_shop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-12-16 13:34:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `image` char(255)  NOT NULL,
  `type_id` int(11) NOT NULL COMMENT '类型id',
  `name` char(255)  NOT NULL COMMENT '商品名',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `price` float NOT NULL,
  `status` int(11) NOT NULL,
  `content` varchar(255)  NOT NULL,
  `producter_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'static/goods_img/1.jpg', '5', '笔记本', '1', '4000', '1', '二手笔记本，8成新，I7处理器', '1017', '2015-12-12 12:10:10');
INSERT INTO `goods` VALUES ('2', 'static/goods_img/2.jpg', '2', '被套', '1', '30', '2', '二手被套', '1017', '2015-12-16 02:34:01');
INSERT INTO `goods` VALUES ('3', 'static/goods_img/3.jpg', '2', '自行车', '1', '50', '4', '二手自行车', '1017', '2015-12-11 11:22:33');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `message` varchar(255)  DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for `shoppingcart`
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `id` int(11) NOT NULL,
  `goodsId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` char(255)  NOT NULL,
  `pwd` char(255)  NOT NULL,
  `name` char(255)  DEFAULT NULL,
  `stu_num` char(255)  DEFAULT NULL,
  `qq` char(255)  DEFAULT NULL,
  `phone` char(255)  DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('9', 'dandan@qq.com', '14e1b600b1fd579f47433b88e8d85291', '朱雷雷', null, null, null);
INSERT INTO `user` VALUES ('10', 'veekxt@gmail.com', '14e1b600b1fd579f47433b88e8d85291', 'KevinVeek', null, null, null);
INSERT INTO `user` VALUES ('1015', 'xietao@163.com', '8560ef54213c8b32e89a24ccc323a79e', '解涛', null, null, null);
INSERT INTO `user` VALUES ('1017', '1050026@qq.com', 'acd09f1f204179b957001f53f411899b', '陈生辉', null, null, '13245634567');
DROP TRIGGER IF EXISTS `update_goods_status`;
DELIMITER ;;
CREATE TRIGGER `update_goods_status` AFTER INSERT ON `order` FOR EACH ROW update goods set status=4 where id=new.goods_id
;;
DELIMITER ;
