/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : practice_1

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 15/06/2021 23:56:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pattern` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of college
-- ----------------------------
BEGIN;
INSERT INTO `college` VALUES (1, '/literature', '文学院');
INSERT INTO `college` VALUES (2, '/math', '数学科学学院');
INSERT INTO `college` VALUES (3, '/chemistry', '化学学院');
INSERT INTO `college` VALUES (4, '/tourism', '旅游学院');
INSERT INTO `college` VALUES (5, '/computer', '计算机与信息科学学院');
INSERT INTO `college` VALUES (6, '/physics', '物理与电子工程学院');
INSERT INTO `college` VALUES (7, NULL, '美术学院');
COMMIT;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `teacher` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `imageUrl` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `collegeId` bigint DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` VALUES (1, '设计模式', '徐传运', 'https://img0.baidu.com/it/u=1833636327,1532683158&fm=224&fmt=auto&gp=0.jpg', 5);
INSERT INTO `course` VALUES (2, '软件测试', '冯骥', 'https://img0.baidu.com/it/u=3344707173,3015676222&fm=224&fmt=auto&gp=0.jpg', 5);
INSERT INTO `course` VALUES (3, '文学基础', '张见过', 'https://img0.baidu.com/it/u=4259926672,1520544321&fm=224&fmt=auto&gp=0.jpg', 1);
INSERT INTO `course` VALUES (4, '学前教育第一版', '刘达斯', 'https://img2.baidu.com/it/u=734695632,1224698756&fm=224&fmt=auto&gp=0.jpg', 2);
INSERT INTO `course` VALUES (5, '开源软件杯', '徐传运', 'https://img1.baidu.com/it/u=2543000902,3462352363&fm=224&fmt=auto&gp=0.jpg', 5);
INSERT INTO `course` VALUES (6, '需求分析', '张杨', 'https://img2.baidu.com/it/u=450267319,2106900508&fm=224&fmt=auto&gp=0.jpg', 5);
INSERT INTO `course` VALUES (7, '软件管理', '张杨', 'https://img2.baidu.com/it/u=150723695,728383380&fm=224&fmt=auto&gp=0.jpg', 5);
INSERT INTO `course` VALUES (8, 'C++面向对象编程', '冯骥', 'https://img1.baidu.com/it/u=4018728060,3332512352&fm=224&fmt=auto&gp=0.jpg', 5);
INSERT INTO `course` VALUES (9, '高等数学（一）', '张三', 'https://img2.baidu.com/it/u=3432723299,1272092050&fm=224&fmt=auto&gp=0.jpg', 2);
INSERT INTO `course` VALUES (10, '高等数学（二）', '张三', 'https://img1.baidu.com/it/u=897133358,1940136062&fm=224&fmt=auto&gp=0.jpg', 2);
INSERT INTO `course` VALUES (11, '高等物理', '李四', 'https://img2.baidu.com/it/u=397553363,3685779531&fm=224&fmt=auto&gp=0.jpg', 6);
INSERT INTO `course` VALUES (12, '旅游学', '王五', 'https://img1.baidu.com/it/u=476692959,2474494726&fm=224&fmt=auto&gp=0.jpg', 4);
COMMIT;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pattern` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parentId` int DEFAULT NULL,
  `enabled` tinyint DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
BEGIN;
INSERT INTO `menu` VALUES (1, '/', NULL, 1, '所有', '');
INSERT INTO `menu` VALUES (2, '/home', 1, 1, '所有管理', 'Home');
INSERT INTO `menu` VALUES (3, '/db/**', 2, 1, '成绩管理', 'Score');
INSERT INTO `menu` VALUES (4, '/admin/**', 2, 1, '基本信息', 'Information');
INSERT INTO `menu` VALUES (5, '/student/**', 2, 1, '学生管理', 'Student');
INSERT INTO `menu` VALUES (6, '/home', 1, 1, '权限管理', 'Home');
INSERT INTO `menu` VALUES (7, '/user/**', 6, 1, '用户管理', 'UserManage');
INSERT INTO `menu` VALUES (8, '/teacher/**', 2, 1, '教师管理', 'Teacher');
INSERT INTO `menu` VALUES (9, '/course/**', 2, 1, '课程管理', 'Course_manager');
INSERT INTO `menu` VALUES (10, '/college/**', 2, 1, '学院管理', 'College_manager');
COMMIT;

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mid` int DEFAULT NULL,
  `rid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
BEGIN;
INSERT INTO `menu_role` VALUES (1, 3, 1);
INSERT INTO `menu_role` VALUES (2, 4, 2);
INSERT INTO `menu_role` VALUES (3, 5, 3);
INSERT INTO `menu_role` VALUES (4, 7, 2);
INSERT INTO `menu_role` VALUES (5, 8, 3);
INSERT INTO `menu_role` VALUES (6, 9, 3);
INSERT INTO `menu_role` VALUES (7, 10, 3);
COMMIT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nameZh` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES (1, 'ROLE_dba', '数据库管理员');
INSERT INTO `role` VALUES (2, 'ROLE_admin', '系统管理员');
INSERT INTO `role` VALUES (3, 'ROLE_user', '用户');
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` VALUES (29, '徐昊', 22, '男');
INSERT INTO `student` VALUES (31, 'hello', 23, '女');
INSERT INTO `student` VALUES (32, '哈哈', 22, '男');
COMMIT;

-- ----------------------------
-- Table structure for student_count
-- ----------------------------
DROP TABLE IF EXISTS `student_count`;
CREATE TABLE `student_count` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of student_count
-- ----------------------------
BEGIN;
INSERT INTO `student_count` VALUES (1, 3);
COMMIT;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `uid` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `gender` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `course` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salary` bigint DEFAULT NULL,
  `retired` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `teaching_age` int DEFAULT NULL,
  `tel_number` bigint DEFAULT NULL,
  `politics_sta` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `house_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `native_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `stu_estimate` int DEFAULT NULL,
  `dateofentry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dateofbirth` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `edu_background` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `motto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `trait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of teacher
-- ----------------------------
BEGIN;
INSERT INTO `teacher` VALUES (36, '等等待', 21, '女', '教育学院/艺术教育', 10902, '已退休', 11, 13555555555, '党员', 'gdg', ',大二,大四', 'eggs发发发', '', 6, NULL, NULL, '博士研究生', '哈哈哈哈great', '幽默');
INSERT INTO `teacher` VALUES (37, '姐姐', 31, '男', '计信学院/计算机科学与技术', 13665, '已退休', 2, 15688888888, '团员', '我', '大一,大二,大三,大四', 'i', '', 7, NULL, NULL, '博士研究生', 'j', NULL);
INSERT INTO `teacher` VALUES (38, '郭胤豪', 21, '男', '计信学院/软件工程', 14241, '未退休', 2, 15666666666, '党员', '红旗河沟', '大二,大三', '', '', 9, NULL, NULL, '本科', NULL, NULL);
INSERT INTO `teacher` VALUES (39, '嘎嘎嘎', 45, '女', '计信学院/智能科学与技术', 21045, '未退休', 4, 13999999999, '团员', '大大', '大二,大三', '财政赤字', '11@qq.com', 3, NULL, NULL, '硕士研究生', '周小川指出', NULL);
INSERT INTO `teacher` VALUES (41, '周青青', 19, '女', '美术学院/美术学', 31695, '未退休', 2, 13555555555, '党员', '水水水水', '大二,大三', '顶顶顶顶', '1111111111@qq.com', 10, NULL, NULL, '博士研究生', '看就看就看感慨感慨一番', '活泼');
INSERT INTO `teacher` VALUES (42, '李夏花', 26, '女', '文学院/汉语言文学', 13280, '未退休', 3, 13896544887, '党员', '重庆市渝北区', '大二,大三', '重庆市垫江县', '33656684@qq.com', 8, NULL, NULL, '硕士研究生', '严于律己，以身示范，教书育人。', '友善');
INSERT INTO `teacher` VALUES (43, '的结果', 45, '男', '计信学院/软件工程', 18319, '未退休', 2, 13896533662, '党员', 'u素如下图', '大二,大三,大四', '微软热爱', '11@qq.com', 10, NULL, NULL, '硕士研究生', '的X在X在X等我热热', '幽默');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'userID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, '超级管理员', '18568887789', '029-82881234', '哈尔滨', 1, 'admin', '$2a$10$m2pydRCGxJtOwG2YB2TZWOOqo.3rDrH4nTcguM8sh5MwpFW8dUUYi', NULL);
INSERT INTO `user` VALUES (2, '徐昊', '18568123489', '029-82123434', '重庆', 1, 'xuhao', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', NULL);
INSERT INTO `user` VALUES (3, '老王', '18568123666', '029-82111555', '广州', 1, 'laowang', '$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.', NULL);
INSERT INTO `user` VALUES (8, '老张', NULL, NULL, NULL, 1, 'laozhang', '$2a$10$lv5kCzOsIVXVrYSOxykyGOUPpW.AIJ9.rAIVk6EJ6nxOyFGVmC0Zq', NULL);
INSERT INTO `user` VALUES (9, '老李', NULL, NULL, NULL, 0, 'laoli', '$2a$10$s3.qcTY9tw9egA.UoyBZ8Oyi6.NVAW84P6mN.A8wcgzXJQho.Ck9i', NULL);
INSERT INTO `user` VALUES (10, '小程', NULL, NULL, NULL, 1, 'xiaocheng', '$2a$10$9WvViONP7a.VcId3ktgg.Odj.WJExpc./j/eSNv2bSa8nArwfGGY2', NULL);
INSERT INTO `user` VALUES (11, '哈哈哈', NULL, NULL, NULL, 1, 'hhh', '$2a$10$30.wi4mGO6.wWgG2TEVw/O5glfMG1TWpgeEi7xK5Y5GvrQglQlH86', NULL);
COMMIT;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` int DEFAULT NULL,
  `rid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
BEGIN;
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (3, 2, 2);
INSERT INTO `user_role` VALUES (4, 3, 3);
INSERT INTO `user_role` VALUES (5, 1, 3);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
