/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : itiner

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 30/05/2025 23:35:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `userID` int NOT NULL,
  `date` datetime NULL DEFAULT NULL,
  `eventTitle` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `eventDetail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES (123456, '2025-03-21 00:00:00', '睡觉', '周末睡觉');
INSERT INTO `event` VALUES (1234567, '2025-03-22 00:00:00', '周末', '今天是周末');
INSERT INTO `event` VALUES (123456, '2025-04-02 00:00:00', '周末', '周末休假1');
INSERT INTO `event` VALUES (123456, '2025-04-03 00:00:00', '生日', '今天是20岁生日');
INSERT INTO `event` VALUES (123456, '2025-04-17 00:00:00', '期末考试', '今天是期末考试');
INSERT INTO `event` VALUES (123456, '2025-05-28 00:00:00', '毕业答辩', '毕设答辩！！！！！！！！！！');

-- ----------------------------
-- Table structure for holidays
-- ----------------------------
DROP TABLE IF EXISTS `holidays`;
CREATE TABLE `holidays`  (
  `date` date NOT NULL COMMENT '日期',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '节日名称',
  `type` enum('festival','rest','workday') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'festival' COMMENT '类型',
  `is_offday` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否休息日',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '详细描述',
  UNIQUE INDEX `date`(`date` ASC) USING BTREE,
  INDEX `idx_date`(`date` ASC) USING BTREE,
  INDEX `idx_type`(`type` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of holidays
-- ----------------------------
INSERT INTO `holidays` VALUES ('2000-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2000-02-05', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2000-02-06', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2000-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2000-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2000-06-07', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2000-09-12', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2000-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2001-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2001-01-22', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2001-01-23', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2001-01-24', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2001-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2001-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2001-06-25', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2001-09-29', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2001-09-30', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2001-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2001-10-08', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2002-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2002-02-11', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2002-02-12', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2002-02-18', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2002-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2002-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2002-06-15', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2002-09-21', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2002-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2003-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2003-01-26', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2003-01-27', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2003-02-01', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2003-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2003-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2003-06-04', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2003-09-11', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2003-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2004-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2004-01-19', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2004-01-22', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2004-01-26', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2004-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2004-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2004-06-22', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2004-09-28', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2004-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2005-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2005-02-05', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2005-02-09', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2005-02-12', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2005-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2005-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2005-06-11', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2005-09-18', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2005-09-19', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2005-09-25', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2005-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2006-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2006-01-28', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2006-01-29', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2006-01-30', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2006-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2006-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2006-05-31', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2006-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2006-10-06', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2006-10-08', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2007-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2007-02-17', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2007-02-18', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2007-02-25', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2007-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2007-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2007-06-19', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2007-09-25', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2007-09-29', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2007-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2007-10-08', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2008-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2008-02-02', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2008-02-07', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2008-02-15', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2008-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2008-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2008-06-08', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2008-09-14', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2008-09-28', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2008-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2008-10-04', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2009-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2009-01-24', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2009-01-25', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2009-01-26', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2009-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2009-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2009-05-28', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2009-09-27', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2009-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2009-10-03', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2009-10-10', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2010-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2010-02-14', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2010-02-20', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2010-02-21', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2010-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2010-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2010-06-16', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2010-09-19', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2010-09-22', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2010-09-25', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2010-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2011-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2011-01-30', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2011-02-03', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2011-02-08', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2011-02-12', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2011-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2011-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2011-06-06', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2011-09-12', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2011-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2012-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2012-01-23', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2012-01-29', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2012-02-04', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2012-04-01', '清明调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2012-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2012-04-28', '劳动节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2012-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2012-06-23', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2012-09-29', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2012-09-30', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2012-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2012-10-08', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2013-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2013-02-10', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2013-02-16', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2013-02-17', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2013-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2013-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2013-06-12', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2013-09-19', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2013-09-22', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2013-09-29', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2013-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2013-10-12', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2014-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2014-01-26', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2014-01-31', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2014-02-08', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2014-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2014-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2014-05-04', '劳动节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2014-06-02', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2014-09-08', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2014-09-28', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2014-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2014-10-11', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2015-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2015-02-15', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2015-02-19', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2015-02-28', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2015-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2015-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2015-06-20', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2015-09-06', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2015-09-27', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2015-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2015-10-10', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2016-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2016-02-06', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2016-02-08', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2016-02-14', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2016-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2016-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2016-06-09', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2016-06-12', '端午调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2016-09-15', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2016-09-18', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2016-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2016-10-08', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2016-10-09', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2017-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2017-01-22', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2017-01-28', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2017-02-04', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2017-04-01', '清明调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2017-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2017-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2017-05-30', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2017-09-30', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2017-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2017-10-04', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2017-10-08', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2018-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2018-02-11', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2018-02-16', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2018-02-24', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2018-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2018-04-08', '清明调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2018-04-28', '劳动节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2018-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2018-06-18', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2018-09-24', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2018-09-30', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2018-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2018-10-07', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2019-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2019-02-02', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2019-02-03', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2019-02-05', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2019-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2019-04-28', '劳动节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2019-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2019-05-05', '劳动节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2019-06-07', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2019-09-13', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2019-09-29', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2019-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2019-10-12', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2020-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2020-01-19', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2020-01-25', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2020-02-02', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2020-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2020-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2020-06-25', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2020-10-01', '中秋节国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2021-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2021-02-07', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2021-02-12', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2021-02-20', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2021-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2021-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2021-06-14', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2021-09-18', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2021-09-21', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2021-09-26', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2021-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2021-10-09', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2022-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2022-01-29', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2022-01-30', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2022-02-01', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2022-04-02', '清明调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2022-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2022-04-24', '五一调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2022-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2022-05-07', '五一调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2022-06-03', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2022-09-10', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2022-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2022-10-08', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2022-10-09', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2023-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2023-01-22', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2023-01-28', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2023-01-29', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2023-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2023-04-23', '五一调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2023-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2023-05-06', '五一调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2023-06-22', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2023-09-28', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2023-09-29', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2023-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2023-10-07', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2023-10-08', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2024-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2024-02-04', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2024-02-10', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2024-02-18', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2024-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2024-04-28', '五一调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2024-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2024-06-23', '端午节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2024-09-29', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2024-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2024-10-12', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2025-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2025-01-29', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2025-02-03', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2025-02-10', '春节调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2025-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2025-04-27', '五一调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2025-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2025-06-09', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2025-09-24', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2025-09-28', '中秋调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2025-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2025-10-11', '国庆调休', 'workday', 0, NULL);
INSERT INTO `holidays` VALUES ('2026-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2026-02-17', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2026-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2026-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2026-06-20', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2026-09-15', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2026-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2027-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2027-02-06', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2027-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2027-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2027-06-08', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2027-09-24', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2027-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2028-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2028-01-26', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2028-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2028-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2028-06-16', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2028-09-13', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2028-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2029-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2029-02-13', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2029-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2029-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2029-06-02', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2029-09-22', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2029-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2030-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2030-01-30', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2030-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2030-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2030-06-12', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2030-09-11', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2030-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2031-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2031-02-19', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2031-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2031-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2031-06-18', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2031-09-23', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2031-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2032-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2032-02-08', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2032-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2032-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2032-06-02', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2032-09-11', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2032-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2033-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2033-01-27', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2033-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2033-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2033-06-10', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2033-09-20', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2033-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2034-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2034-02-15', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2034-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2034-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2034-06-20', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2034-09-29', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2034-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2035-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2035-02-04', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2035-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2035-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2035-06-09', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2035-09-18', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2035-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2036-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2036-01-23', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2036-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2036-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2036-06-24', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2036-09-27', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2036-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2037-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2037-02-12', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2037-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2037-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2037-06-03', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2037-09-16', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2037-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2038-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2038-01-31', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2038-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2038-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2038-06-13', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2038-09-25', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2038-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2039-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2039-02-19', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2039-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2039-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2039-06-21', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2039-09-24', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2039-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2040-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2040-02-08', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2040-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2040-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2040-06-02', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2040-09-13', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2040-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2041-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2041-01-28', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2041-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2041-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2041-06-17', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2041-09-22', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2041-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2042-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2042-02-15', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2042-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2042-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2042-06-03', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2042-09-11', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2042-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2043-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2043-02-03', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2043-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2043-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2043-06-12', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2043-09-20', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2043-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2044-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2044-01-22', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2044-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2044-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2044-06-20', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2044-09-29', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2044-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2045-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2045-02-10', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2045-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2045-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2045-06-09', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2045-09-18', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2045-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2046-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2046-01-30', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2046-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2046-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2046-06-18', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2046-09-27', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2046-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2047-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2047-02-18', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2047-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2047-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2047-06-03', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2047-09-16', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2047-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2048-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2048-02-06', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2048-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2048-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2048-06-14', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2048-09-24', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2048-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2049-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2049-01-25', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2049-04-04', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2049-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2049-06-23', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2049-09-12', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2049-10-01', '国庆节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2050-01-01', '元旦', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2050-02-13', '春节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2050-04-05', '清明节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2050-05-01', '劳动节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2050-06-02', '端午节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2050-09-21', '中秋节', 'festival', 1, NULL);
INSERT INTO `holidays` VALUES ('2050-10-01', '国庆节', 'festival', 1, NULL);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `managerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `managerId` int NOT NULL,
  `managerPwd` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `managerImg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`managerId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('chopin', 123, '123456', 'f58736d9-c4b5-4126-a246-df9e15fcb494.jpeg');
INSERT INTO `manager` VALUES ('chopin2', 1234, '123456', 'c8575aed-3a0d-460e-9881-1cd894dc0680.jpg');

-- ----------------------------
-- Table structure for managerinfo
-- ----------------------------
DROP TABLE IF EXISTS `managerinfo`;
CREATE TABLE `managerinfo`  (
  `managerId` int NOT NULL,
  `managerEml` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `managerTel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`managerId`) USING BTREE,
  CONSTRAINT `managerinfo_ibfk_1` FOREIGN KEY (`managerId`) REFERENCES `manager` (`managerId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of managerinfo
-- ----------------------------
INSERT INTO `managerinfo` VALUES (123, '123456789@qq.com', '12345678910');
INSERT INTO `managerinfo` VALUES (1234, '123@qq.com', '12345678900');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `UserID` int NOT NULL,
  `UserPwd` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `UserImgPath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UserID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (123456, '123456', 'chopin', 'af66690d-34a3-4e24-b543-2e39e69678bd.jpg');
INSERT INTO `user` VALUES (1234567, '123456', 'chopin1', 'c8575aed-3a0d-460e-9881-1cd894dc0680.jpg');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `UserID` int NOT NULL,
  `UserEml` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `UserTel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`UserID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (123456, 'choopinn@163.com', '12345678901');
INSERT INTO `userinfo` VALUES (1234567, '123456@qq.com', '12345678902');
INSERT INTO `userinfo` VALUES (11619879, '112@qq.com', '12345678901');

SET FOREIGN_KEY_CHECKS = 1;
