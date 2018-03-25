# Host: localhost  (Version: 5.6.14)
# Date: 2018-01-11 08:16:52
# Generator: MySQL-Front 5.3  (Build 4.13)

/*!40101 SET NAMES utf8 */;

#
# Source for table "admin"
#

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL COMMENT '账号',
  `upassword` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员信息';

#
# Data for table "admin"
#

INSERT INTO `admin` VALUES (1,'admin','admin');

#
# Source for table "fees"
#

DROP TABLE IF EXISTS `fees`;
CREATE TABLE `fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wid` int(11) DEFAULT NULL COMMENT '稿件id',
  `fval` float DEFAULT '20' COMMENT '付费金额',
  `ftime` datetime DEFAULT NULL COMMENT '付费时间',
  `ftype` varchar(255) DEFAULT NULL COMMENT '费用类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='付费信息';

#
# Data for table "fees"
#


#
# Source for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(255) DEFAULT NULL COMMENT '账号',
  `upassword` varchar(255) DEFAULT NULL COMMENT '密码',
  `realname` varchar(255) DEFAULT NULL COMMENT '姓名',
  `gender` varchar(255) DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `addr` varchar(255) DEFAULT NULL COMMENT '地址',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `role` varchar(255) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息';

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'a','a','a','男','aa','a','aaa@sina.com','投稿人'),(2,'b','b','张三','男','121','张三的地址','bb@sina.com','审稿人'),(3,'100','0','周晓白','女','1101','周晓白的地址','aaa@sina.com','投稿人');

#
# Source for table "wordinfo"
#

DROP TABLE IF EXISTS `wordinfo`;
CREATE TABLE `wordinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wtitle` varchar(255) DEFAULT NULL COMMENT '标题',
  `wmark` text COMMENT '内容',
  `wtype` varchar(255) DEFAULT NULL COMMENT '类型',
  `tgid` int(11) DEFAULT NULL COMMENT '投稿人id',
  `tgtime` datetime DEFAULT NULL COMMENT '投稿时间',
  `sgmark` text COMMENT '专家评语',
  `sgid` int(11) DEFAULT NULL COMMENT '审稿者id',
  `sgtime` datetime DEFAULT NULL COMMENT '审稿时间',
  `sgflag` varchar(255) DEFAULT NULL COMMENT '审核结果',
  `sgfflag` varchar(255) DEFAULT NULL COMMENT '是否付审稿费',
  `bmfflag` varchar(255) DEFAULT NULL COMMENT '是否付版面费',
  `gfflag` varchar(255) DEFAULT NULL COMMENT '是否付稿费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='稿件信息';

#
# Data for table "wordinfo"
#

INSERT INTO `wordinfo` VALUES (1,'a','ab','消息类',1,'2018-01-11 00:00:00','bbbbb',2,'2018-01-11 00:00:00','通过','是','是','是'),(2,'aaa','aaa','消息类',1,'2018-01-11 00:00:00',NULL,NULL,NULL,'未审核','是','否','否'),(3,'随便一篇稿','随便写几个字','消息类',3,'2018-01-11 00:00:00','写的不错，通过',2,'2018-01-11 00:00:00','通过','是','是','是');
