/*
Navicat MySQL Data Transfer

Source Server         : xt_db
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : hfuu_shop

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2015-12-19 15:35:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `image` char(255) COLLATE utf8_bin NOT NULL,
  `type_id` int(11) NOT NULL COMMENT '类型id',
  `name` char(255) COLLATE utf8_bin NOT NULL COMMENT '商品名',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `price` float NOT NULL,
  `status` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  `producter_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'static/goods_img/1.jpg', '4', '笔记本', '1', '4000', '2', '二手笔记本，8成新，I7处理器', '1017', '2015-12-12 12:10:10');
INSERT INTO `goods` VALUES ('2', 'static/goods_img/2.jpg', '2', '被套', '1', '30', '2', '二手被套', '1017', '2015-12-16 02:34:01');
INSERT INTO `goods` VALUES ('3', 'static/goods_img/3.jpg', '2', '自行车', '1', '50', '2', '二手自行车', '1017', '2015-12-11 11:22:33');
INSERT INTO `goods` VALUES ('4', 'static/goods_img/4.jpg', '5', '网球拍', '1', '50', '2', '二手网球拍，用过几天，九成新', '1018', '2015-12-17 11:00:16');
INSERT INTO `goods` VALUES ('5', 'static/goods_img/5.jpg', '5', '篮球', '1', '80', '2', '全牛皮篮球，', '1018', '2015-12-17 11:02:57');
INSERT INTO `goods` VALUES ('6', 'static/goods_img/6.jpg', '2', '懒人桌', '1', '15', '2', '加固型懒人桌，九成新', '1018', '2015-12-17 11:05:00');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `mess_from_id` int(11) NOT NULL,
  `mess_to_id` int(11) NOT NULL,
  `mess_text` varchar(255) COLLATE utf8_bin NOT NULL,
  `send_time` datetime NOT NULL,
  `mess_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mess_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`mess_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `message` varchar(255) COLLATE utf8_bin DEFAULT NULL,
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
  `email` char(255) COLLATE utf8_bin NOT NULL,
  `pwd` char(255) COLLATE utf8_bin NOT NULL,
  `name` char(255) COLLATE utf8_bin DEFAULT NULL,
  `stu_num` char(255) COLLATE utf8_bin DEFAULT NULL,
  `qq` char(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` char(255) COLLATE utf8_bin DEFAULT NULL,
  `mess_num` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'hfuu_shop@163.com', '8560ef54213c8b32e89a24ccc323a79e', '交易系统', null, null, null, '0');
INSERT INTO `user` VALUES ('9', 'dandan@qq.com', '14e1b600b1fd579f47433b88e8d85291', '朱雷雷', null, null, null, '0');
INSERT INTO `user` VALUES ('10', 'veekxt@gmail.com', '14e1b600b1fd579f47433b88e8d85291', '涛哥', null, null, null, '0');
INSERT INTO `user` VALUES ('1017', '1050026@qq.com', 'acd09f1f204179b957001f53f411899b', '陈生辉', null, null, '13245634567', '0');
INSERT INTO `user` VALUES ('1018', '1300573251@qq.com', '191016dc3346309bee3403f55f77e871', '张剑', null, null, null, '0');
INSERT INTO `user` VALUES ('1019', '18256989168@163.com', '191016dc3346309bee3403f55f77e871', '张剑', null, null, null, '0');
DROP TRIGGER IF EXISTS `change_user_mess_num`;
DELIMITER ;;
CREATE TRIGGER `change_user_mess_num` AFTER INSERT ON `message` FOR EACH ROW update user set mess_num=mess_num+1 where id=new.mess_to_id
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_goods_status`;
DELIMITER ;;
CREATE TRIGGER `update_goods_status` AFTER INSERT ON `order` FOR EACH ROW begin
set @sellerid = (select producter_id from goods where id=new.goods_id);
set @goodsid = (select id from goods where id=new.goods_id);
set @goodsname = (select name from goods where id=new.goods_id);
set @sellername = (select name from `user` where id=@sellerid);
INSERT INTO `message`(mess_from_id,mess_to_id,mess_text,send_time) VALUES (1,@sellerid,CONCAT("你的商品","<a target='_blank' href='goods/info.jsp?goodsid=",@goodsid,"'>",@goodsname,"</a>","被购买，请尽快联系买家","<a target='_blank' href='user/personal.jsp?tab=info&userid=",@sellerid,"'>",@sellername,"</a>","，以下为买家的附加信息（可能为空）
==============
",new.message),new.date);
update goods set status=4 where id=new.goods_id;
end
;;
DELIMITER ;
