/*
Navicat MySQL Data Transfer

Source Server         : pandaSQL
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : newsmanage

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-09-24 11:41:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for applymessage
-- ----------------------------
DROP TABLE IF EXISTS `applymessage`;
CREATE TABLE `applymessage` (
  `applyId` int(11) NOT NULL AUTO_INCREMENT,
  `fromAccount` varchar(255) DEFAULT NULL,
  `dealAccount` varchar(255) DEFAULT NULL,
  `isAccept` smallint(1) NOT NULL DEFAULT '2' COMMENT '2是待处理，0是不接受，1是接受',
  `kind` smallint(1) NOT NULL COMMENT '1是管理员 3是新闻发布员',
  PRIMARY KEY (`applyId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of applymessage
-- ----------------------------
INSERT INTO `applymessage` VALUES ('8', '123', '123', '1', '1');
INSERT INTO `applymessage` VALUES ('9', '1', '1', '1', '1');
INSERT INTO `applymessage` VALUES ('10', '2', '1', '1', '1');
INSERT INTO `applymessage` VALUES ('12', '123', '123', '1', '3');
INSERT INTO `applymessage` VALUES ('13', '1', '1', '1', '3');
INSERT INTO `applymessage` VALUES ('14', 'panda', '1', '1', '3');
INSERT INTO `applymessage` VALUES ('15', '2', '1', '1', '3');
INSERT INTO `applymessage` VALUES ('16', '3', null, '2', '1');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `context` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `newsId` int(11) NOT NULL,
  PRIMARY KEY (`time`,`newsId`),
  KEY `userId_comment_user_Fk` (`userId`),
  KEY `newsId_comment_news_Fk` (`newsId`),
  CONSTRAINT `newsId_comment_news_Fk` FOREIGN KEY (`newsId`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userId_comment_user_Fk` FOREIGN KEY (`userId`) REFERENCES `user` (`account`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for manage
-- ----------------------------
DROP TABLE IF EXISTS `manage`;
CREATE TABLE `manage` (
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` char(20) NOT NULL,
  `registerTime` date DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `state` smallint(1) DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manage
-- ----------------------------
INSERT INTO `manage` VALUES ('1', '1', 'panda123', '2018-08-05', '1.png', '1');
INSERT INTO `manage` VALUES ('123', '123', 'panda121', '2018-08-05', '123.png', '1');
INSERT INTO `manage` VALUES ('2', '1', '2', '2018-08-07', '2.jpg', '1');
INSERT INTO `manage` VALUES ('3', '3', '测试页面', '2018-08-19', '3.jpg', '0');
INSERT INTO `manage` VALUES ('admin', '123', 'panda', '2018-08-03', 'default.jpg', '1');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsAuthor` varchar(20) NOT NULL,
  `newsTitle` varchar(255) NOT NULL,
  `savePath` varchar(255) NOT NULL,
  `saveDate` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `newsMakerAccount` varchar(255) NOT NULL,
  `kind` smallint(2) NOT NULL DEFAULT '1' COMMENT '1 科技 2 军事 3 体育 4 娱乐 5 政治',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titleImage` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `newAccount_news_newsMaker_Fk` (`newsMakerAccount`),
  CONSTRAINT `newAccount_news_newsMaker_Fk` FOREIGN KEY (`newsMakerAccount`) REFERENCES `newsmaker` (`account`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('黄浩填  ', '中兴被断供才仨月，中国芯就走向世界前列了？', '1/20.html', '2018-08-15 11:58:21', '1', '1', '20', '120.jpg');
INSERT INTO `news` VALUES ('真是的', '360N7 Pro7天后正式亮相，拍照比肩iPhoneX等机型！', '1/21.html', '2018-08-19 17:00:16', '1', '1', '21', '121.jpg');
INSERT INTO `news` VALUES ('黄浩填 ', 'baby烟瘾太大导致孩子有缺陷? 黄晓明大怒: 你就靠你的医生保持容颜吧', '1/22.html', '2018-08-15 12:00:45', '1', '4', '22', '122.jpg');
INSERT INTO `news` VALUES ('黄浩填 ', '雷军微博被\"2698\"刷屏，小米8的回应实在太绝了，网友彻底被惊呆', '1/23.html', '2018-08-15 12:02:05', '1', '1', '23', '123.jpg');
INSERT INTO `news` VALUES ('panda', '保障人民健康安全，习近平总书记这样说', '1/24.html', '2018-08-18 18:28:58', '1', '5', '24', '124.jpg');
INSERT INTO `news` VALUES ('李博丹', '美国对土耳其发狠：再跟俄罗斯眉来眼去，你就没有F-35了', '1/25.html', '2018-08-18 18:30:53', '1', '2', '25', '125.jpg');
INSERT INTO `news` VALUES ('拉勾网', '华为、腾讯、阿里、网易员工下班时间大曝光，靠加班，你是赢不了他们的', '1/26.html', '2018-08-18 18:32:47', '1', '1', '26', '126.jpg');
INSERT INTO `news` VALUES ('一周数码新知', '小米终于亮王牌：骁龙845+弹射装置+95%屏占比+良心价，外观真香', '1/27.html', '2018-08-18 18:33:27', '1', '1', '27', '127.jpg');
INSERT INTO `news` VALUES ('战驴', '中国一邻国又打起来了：大批美军介入战争，各方已有数百人死亡', '1/28.html', '2018-08-18 18:34:18', '1', '1', '28', '128.jpg');

-- ----------------------------
-- Table structure for newsdeal
-- ----------------------------
DROP TABLE IF EXISTS `newsdeal`;
CREATE TABLE `newsdeal` (
  `newsId` int(11) DEFAULT NULL,
  `state` smallint(1) NOT NULL DEFAULT '2' COMMENT '2是待审核 1是通过 0是不通过',
  `dealAccount` varchar(255) DEFAULT NULL,
  `publishDate` date DEFAULT NULL,
  `dealId` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`dealId`),
  KEY `newsId_news_newsDeal_Fk` (`newsId`),
  CONSTRAINT `newsId_news_newsDeal_Fk` FOREIGN KEY (`newsId`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newsdeal
-- ----------------------------
INSERT INTO `newsdeal` VALUES ('20', '1', '1', '2018-08-15', '4');
INSERT INTO `newsdeal` VALUES ('21', '1', '1', '2018-07-03', '5');
INSERT INTO `newsdeal` VALUES ('22', '1', '1', '2018-06-26', '6');
INSERT INTO `newsdeal` VALUES ('23', '1', '1', '2018-07-15', '7');
INSERT INTO `newsdeal` VALUES ('24', '1', '1', '2018-08-18', '8');
INSERT INTO `newsdeal` VALUES ('25', '1', '1', '2018-06-12', '9');
INSERT INTO `newsdeal` VALUES ('26', '1', '1', '2018-08-18', '10');
INSERT INTO `newsdeal` VALUES ('27', '0', '1', '2018-08-18', '11');
INSERT INTO `newsdeal` VALUES ('28', '1', '1', '2018-08-18', '12');
INSERT INTO `newsdeal` VALUES ('21', '1', '1', '2018-01-19', '13');

-- ----------------------------
-- Table structure for newsmaker
-- ----------------------------
DROP TABLE IF EXISTS `newsmaker`;
CREATE TABLE `newsmaker` (
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` char(20) NOT NULL,
  `registerTime` date DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `state` smallint(1) DEFAULT '0',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newsmaker
-- ----------------------------
INSERT INTO `newsmaker` VALUES ('1', '1', '黄浩填', '2018-08-07', '1.png', '1');
INSERT INTO `newsmaker` VALUES ('2', '2', '嘻嘻', '2018-08-16', '2.png', '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `account` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` char(20) DEFAULT NULL,
  `registerTime` date DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `state` smallint(1) NOT NULL DEFAULT '1' COMMENT '1是正常 0是封号',
  `email` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `emailCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('123', 'JT7Whq0+nA27CKTeV698tw==', 'panda', '2018-09-24', null, '1', '287595523@qq.com', '$!5grk%8s6$2!6h', null);
SET FOREIGN_KEY_CHECKS=1;
