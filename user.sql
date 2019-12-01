/*
 Navicat MySQL Data Transfer

 Source Server         : lcl
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3308
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 01/11/2019 13:47:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'lcl', '123');
INSERT INTO `user` VALUES (2, 'gtt', '222');
INSERT INTO `user` VALUES (3, 'fdf', '333');
INSERT INTO `user` VALUES (7, 'liaochanglin', '111');

SET FOREIGN_KEY_CHECKS = 1;
