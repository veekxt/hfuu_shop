/*
Navicat MySQL Data Transfer

Source Server         : xtvps
Source Server Version : 50546
Source Host           : 45.78.60.77:3306
Source Database       : hfuu_shop

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2015-12-25 16:05:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `user_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of collect
-- ----------------------------

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
INSERT INTO `goods` VALUES ('1', 'static/goods_img/1.jpg', '4', '笔记本', '1', '4000', '2', '二手笔记本，8成新，I7处理器', '10', '2015-12-12 12:10:10');
INSERT INTO `goods` VALUES ('2', 'static/goods_img/2.jpg', '2', '被套', '1', '30', '2', '二手被套', '1017', '2015-12-16 02:34:01');
INSERT INTO `goods` VALUES ('3', 'static/goods_img/3.jpg', '2', '自行车', '1', '50', '2', '二手自行车', '1017', '2015-12-11 11:22:33');
INSERT INTO `goods` VALUES ('4', 'static/goods_img/4.jpg', '5', '网球拍', '1', '50', '2', '二手网球拍，用过几天，九成新', '123', '2015-12-17 11:00:16');
INSERT INTO `goods` VALUES ('5', 'static/goods_img/5.jpg', '5', '篮球', '1', '80', '2', '全牛皮篮球，', '9', '2015-12-17 11:02:57');
INSERT INTO `goods` VALUES ('6', 'static/goods_img/6.jpg', '2', '懒人桌', '1', '15', '2', '加固型懒人桌，九成新', '123', '2015-12-17 11:05:00');
INSERT INTO `goods` VALUES ('7', 'static/goods_img/7.jpg', '1', '考研书', '1', '30', '2', '聚星文登考研', '123', '2015-12-21 11:07:22');
INSERT INTO `goods` VALUES ('8', 'static/goods_img/8.jpg', '1', '公务员书', '1', '30', '2', '公务员考试书籍，9成新', '123', '2015-12-23 16:02:21');
INSERT INTO `goods` VALUES ('9', 'static/goods_img/9.jpg', '2', '凉席', '1', '60', '2', '寝室牛皮凉席', '123', '2015-12-23 16:20:46');
INSERT INTO `goods` VALUES ('10', 'static/goods_img/10.jpg', '2', '纯棉枕头', '1', '50', '2', '纯棉枕头', '123', '2015-12-23 16:21:37');
INSERT INTO `goods` VALUES ('11', 'static/goods_img/11.jpg', '2', 'LED台灯，学习卧室床头书桌大学生寝室插电节能USB调光夹子台灯', '1', '100', '2', '灯光颜色默认自然光，轻微偏黄的灯光颜色，台灯默认USB接口，台灯供电方式：1，可用一切手机充电器直接插220V家用插座。 2，可接电脑USB。 3，可接手机充电宝供电。（注：这款不是充电台灯，不带蓄电池，必须连着电源使用）', '123', '2015-12-23 16:29:32');
INSERT INTO `goods` VALUES ('12', 'static/goods_img/12.jpg', '1', '《c primer plus(第五版)中文版》C语言经典入门书籍', '1', '23', '2', '只翻过几次，几乎全新。', '10', '2015-12-24 01:02:27');
INSERT INTO `goods` VALUES ('13', 'static/goods_img/13.jpg', '4', '诺基亚830手机', '1', '1200', '2', '购买时间在一年内，无保修，屏幕无划痕或坏点，机身有破裂损伤，完全正常，曾无拆无修，待机时长超过2天。相关配件有原装电池。', '10', '2015-12-24 01:08:58');
INSERT INTO `goods` VALUES ('14', 'static/goods_img/14.jpg', '2', '室内物品收纳架，多功能免钉可伸缩衣柜分层隔板', '1', '11', '2', '多功能免钉无痕衣柜分层架，', '123', '2015-12-24 09:26:42');
INSERT INTO `goods` VALUES ('15', 'static/goods_img/15.jpg', '3', '沃曼威斯韩版夜光双肩包大容量个性背包', '1', '50', '2', '书包，8成新\r\n', '123', '2015-12-24 09:36:38');
INSERT INTO `goods` VALUES ('16', 'static/goods_img/16.jpg', '4', '华为荣耀4x手机', '1', '450', '2', '移动4g标配版在保九新，京东抢购的，配件发票箱盒齐全，已经贴好钢化膜，送一软壳，便框有些许磕碰，不明显，屏幕右上方有出厂黄斑，4x通病，买回来就这样，无拆无修，特价处理。不议价，顺丰到付。', '10', '2015-12-24 15:30:13');
INSERT INTO `goods` VALUES ('17', 'static/goods_img/17.jpg', '4', '畅学STM32开发学习板，配套stm32f103c8t6最小系统核心板', '1', '67', '1', '畅学STM32开发学习板，所有模块均可用', '10', '2015-12-24 15:34:45');
INSERT INTO `goods` VALUES ('18', 'static/goods_img/18.jpg', '1', '地球往事系列小说 ，三体1+三体2黑暗森林+三体3死神永生', '1', '72', '1', '重庆出版集团出版\r\n全部是正版\r\nISBN编号: 9787536693968', '10', '2015-12-24 15:43:54');
INSERT INTO `goods` VALUES ('19', 'static/goods_img/19.jpg', '1', '《1984》(精装珍藏本) 奥威尔著  世界名著小说', '1', '23', '1', '全新\r\n中国画报出版社出版\r\n译者: 林东泰\r\nISBN编号: 9787514601312\r\n2011年08月', '10', '2015-12-25 15:57:39');

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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `img` char(255) COLLATE utf8_bin DEFAULT NULL,
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
INSERT INTO `user` VALUES (null, '1', 'hfuu_shop@163.com', '8560ef54213c8b32e89a24ccc323a79e', '交易系统', null, null, null, '1');
INSERT INTO `user` VALUES ('static/user_img/9', '9', 'dandan@qq.com', '14e1b600b1fd579f47433b88e8d85291', '朱雷雷', null, null, '', '0');
INSERT INTO `user` VALUES ('static/user_img/10', '10', 'veekxt@gmail.com', '14e1b600b1fd579f47433b88e8d85291', '解涛', null, null, '15256925578', '0');
INSERT INTO `user` VALUES ('static/user_img/123', '123', '1300573251@qq.com', '191016dc3346309bee3403f55f77e871', '张剑', null, null, null, '0');
INSERT INTO `user` VALUES ('static/user_img/0', '1017', '1050026@qq.com', 'acd09f1f204179b957001f53f411899b', '陈生辉', null, null, '13245634567', '0');
INSERT INTO `user` VALUES ('static/user_img/1019', '1019', '18256989168@163.com', '191016dc3346309bee3403f55f77e871', '张剑', null, null, null, '0');
INSERT INTO `user` VALUES (null, '1020', '121@qq.com', '14e1b600b1fd579f47433b88e8d85291', null, null, null, null, '0');
INSERT INTO `user` VALUES (null, '1021', 'leilei@qq.com', '14e1b600b1fd579f47433b88e8d85291', null, null, null, null, '0');
DROP TRIGGER IF EXISTS `notify_auditing`;
DELIMITER ;;
CREATE TRIGGER `notify_auditing` AFTER UPDATE ON `goods` FOR EACH ROW begin
set @goodsid=new.id;
set @goodsname=new.name;
set @newst=new.status;
set @oldst=old.status;
if ((@newst=2) and (@oldst=1)) then
INSERT INTO `message`(mess_from_id,mess_to_id,mess_text,send_time) VALUES(1,new.producter_id,CONCAT("你的商品 ","<a target='_blank' href='goods/info.jsp?goodsid=",@goodsid,"'>",@goodsname,"</a>","已经审核通过"),now());
end if;
if ((@newst=3) and (@oldst=1)) then
INSERT INTO `message`(mess_from_id,mess_to_id,mess_text,send_time) VALUES(1,new.producter_id,CONCAT("你的商品 ","<a target='_blank' href='goods/info.jsp?goodsid=",@goodsid,"'>",@goodsname,"</a>","审核未通过"),now());
end if;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `change_user_mess_num`;
DELIMITER ;;
CREATE TRIGGER `change_user_mess_num` AFTER INSERT ON `message` FOR EACH ROW update user set mess_num=mess_num+1 where id=new.mess_to_id
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `update_goods_status`;
DELIMITER ;;
CREATE TRIGGER `update_goods_status` AFTER INSERT ON `order` FOR EACH ROW begin
set @buyerid=new.user_id;
set @buyername=(select name from user where id=@buyerid);
set @sellerid = (select producter_id from goods where id=new.goods_id);
set @goodsid = (select id from goods where id=new.goods_id);
set @goodsname = (select name from goods where id=new.goods_id);
set @sellername = (select name from `user` where id=@sellerid);
INSERT INTO `message`(mess_from_id,mess_to_id,mess_text,send_time) VALUES (1,@sellerid,CONCAT("你的商品","<a target='_blank' href='goods/info.jsp?goodsid=",@goodsid,"'>",@goodsname,"</a>","被购买，请尽快联系买家","<a target='_blank' href='user/personal.jsp?tab=info&userid=",@buyerid,"'>",@buyername,"</a>","，以下为买家的附加信息（可能为空）
==============
",new.message),new.date);
update goods set status=4 where id=new.goods_id;
end
;;
DELIMITER ;
