/*
* 用户信息表
* 暂定
*/
USE hfuu_shop;
DROP TABLE IF EXISTS `user`;
CREATE TA BLE `user` (
  `id` int(32) NOT NULL,
  `email` char(255) COLLATE utf8_bin NOT NULL,
  `pwd` char(255) COLLATE utf8_bin NOT NULL,
  `name` char(255) COLLATE utf8_bin DEFAULT NULL,
  `stu_num` char(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*
* 商品信息表
* 暂定
*/
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `image` char(255) COLLATE utf8_bin NOT NULL,
  `type_id` int(11) NOT NULL COMMENT '类型id',
  `name` char(255) COLLATE utf8_bin NOT NULL COMMENT '商品名',
  `num` int(11) COMMENT '数量',
  `price` float NOT NULL,
  `status` int NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  `producter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
