/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : student_manager

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 25/06/2022 00:52:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `aid` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adminName` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE,
  UNIQUE INDEX `aid`(`aid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1', '202cb962ac59075b964b07152d234b70');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `clano` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `claname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `master` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`clano`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('J2001', '计科一班', '朱权');
INSERT INTO `class` VALUES ('R2001', '软件一班', '普京');
INSERT INTO `class` VALUES ('R2002', '软件二班', '张海英');
INSERT INTO `class` VALUES ('R2003', '软件三班', '宋亮');

-- ----------------------------
-- Table structure for co_d
-- ----------------------------
DROP TABLE IF EXISTS `co_d`;
CREATE TABLE `co_d`  (
  `cono` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院号',
  `dno` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系号',
  PRIMARY KEY (`dno`) USING BTREE,
  INDEX `cono`(`cono`) USING BTREE,
  CONSTRAINT `co_d_ibfk_1` FOREIGN KEY (`cono`) REFERENCES `college` (`cono`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `co_d_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `dept` (`dno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of co_d
-- ----------------------------
INSERT INTO `co_d` VALUES ('CO1', 'D1');
INSERT INTO `co_d` VALUES ('CO1', 'D2');
INSERT INTO `co_d` VALUES ('CO3', 'D3');

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college`  (
  `cono` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学院号',
  `coname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学院名',
  `coadd` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学院地址',
  PRIMARY KEY (`cono`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES ('CO1', '信息工程学院', '扬子津西');
INSERT INTO `college` VALUES ('CO2', '建筑工程学院', '扬子津西');
INSERT INTO `college` VALUES ('CO3', '医学院', '荷花池');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `ccredit` int NULL DEFAULT NULL,
  `cteacher` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cno` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cterm` enum('大一上','大一下','大二上','大二下','大三上','大三下','大四上','大四下') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cnote` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cno`) USING BTREE,
  UNIQUE INDEX `cno`(`cno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (3, '徐永安', 'C01', 'c++', '大一上', 'null');
INSERT INTO `course` VALUES (4, '徐向英', 'C02', '操作系统', '大一下', 'null');
INSERT INTO `course` VALUES (5, '葛桂萍', 'C03', '计算机组成原理', '大二下', 'null');
INSERT INTO `course` VALUES (4, 'yfkhj', 'c04', 'hgk', '大一上', '%5');

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`  (
  `dno` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系号',
  `dname` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系名',
  `dadd` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '系地址',
  PRIMARY KEY (`dno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('D1', '计算机类', '电工楼');
INSERT INTO `dept` VALUES ('D2', '自动化', '电工楼');
INSERT INTO `dept` VALUES ('D3', '临床医学', '1号教学楼');

-- ----------------------------
-- Table structure for dept_class
-- ----------------------------
DROP TABLE IF EXISTS `dept_class`;
CREATE TABLE `dept_class`  (
  `dno` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clano` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`clano`) USING BTREE,
  INDEX `clano`(`clano`) USING BTREE,
  INDEX `dno`(`dno`) USING BTREE,
  CONSTRAINT `dept_class_ibfk_1` FOREIGN KEY (`clano`) REFERENCES `class` (`clano`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dept_class_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `dept` (`dno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dept_class
-- ----------------------------
INSERT INTO `dept_class` VALUES ('D1', 'R2001');
INSERT INTO `dept_class` VALUES ('D1', 'R2002');
INSERT INTO `dept_class` VALUES ('D1', 'R2003');
INSERT INTO `dept_class` VALUES ('D2', 'j2001');

-- ----------------------------
-- Table structure for dept_course
-- ----------------------------
DROP TABLE IF EXISTS `dept_course`;
CREATE TABLE `dept_course`  (
  `dcid` int NOT NULL AUTO_INCREMENT,
  `dno` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cno` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`dcid`) USING BTREE,
  INDEX `cno`(`cno`) USING BTREE,
  INDEX `dno`(`dno`) USING BTREE,
  CONSTRAINT `dept_course_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `dept` (`dno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `dept_course_ibfk_2` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dept_course
-- ----------------------------
INSERT INTO `dept_course` VALUES (1, 'D1', 'C01');
INSERT INTO `dept_course` VALUES (2, 'D1', 'C03');
INSERT INTO `dept_course` VALUES (4, 'D2', 'C01');
INSERT INTO `dept_course` VALUES (5, 'd1', 'c04');

-- ----------------------------
-- Table structure for sc
-- ----------------------------
DROP TABLE IF EXISTS `sc`;
CREATE TABLE `sc`  (
  `sno` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cno` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `scgrade` int NULL DEFAULT NULL,
  `scnote` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sno`, `cno`) USING BTREE,
  INDEX `cno`(`cno`) USING BTREE,
  CONSTRAINT `sc_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sc_ibfk_2` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sc
-- ----------------------------
INSERT INTO `sc` VALUES ('1', 'C01', 60, NULL);
INSERT INTO `sc` VALUES ('1', 'C02', 62, NULL);
INSERT INTO `sc` VALUES ('1', 'C03', 90, NULL);
INSERT INTO `sc` VALUES ('2', 'C01', 61, NULL);
INSERT INTO `sc` VALUES ('3', 'C01', 67, NULL);
INSERT INTO `sc` VALUES ('7', 'C02', 100, NULL);
INSERT INTO `sc` VALUES ('7', 'c03', 100, NULL);

-- ----------------------------
-- Table structure for stu_sid
-- ----------------------------
DROP TABLE IF EXISTS `stu_sid`;
CREATE TABLE `stu_sid`  (
  `sno` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sid` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sno`) USING BTREE,
  CONSTRAINT `stu_sid_ibfk_1` FOREIGN KEY (`sno`) REFERENCES `student` (`sno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of stu_sid
-- ----------------------------
INSERT INTO `stu_sid` VALUES ('1', '320923200104073315');
INSERT INTO `stu_sid` VALUES ('2', '315179200108150037');
INSERT INTO `stu_sid` VALUES ('3', '210640311567310064');
INSERT INTO `stu_sid` VALUES ('7', '320988200103450434');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `sno` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `clano` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sname` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ssex` enum('男','女') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sbirth` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sorigin` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sstatus` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `s_year` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shome` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `szipcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `snote` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `spassword` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `suserstatus` enum('正常','冻结') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '正常',
  PRIMARY KEY (`sno`) USING BTREE,
  INDEX `clano`(`clano`) USING BTREE,
  UNIQUE INDEX `sno`(`sno`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`clano`) REFERENCES `class` (`clano`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', 'J2001', '严清兰', '女', '2002', '江苏苏州', '共青团员', '2022', '江苏', '335540', '人才', 'e10adc3949ba59abbe56e057f20f883e', '正常');
INSERT INTO `student` VALUES ('2', 'R2002', '李滢', '女', '2001', '江苏盐城', '群众', '2022', '江苏', '224400', '转专业', 'e10adc3949ba59abbe56e057f20f883e', '正常');
INSERT INTO `student` VALUES ('3', 'J2001', '王冬', '男', '2002', '江苏无锡', '群众', '2021', '江苏', '446600', '留级', 'e10adc3949ba59abbe56e057f20f883e', '正常');
INSERT INTO `student` VALUES ('4', 'R2002', '李新宇', '男', '200108', '江苏盐城', '群众', '2020', '江苏', '221144', '转专业', 'e10adc3949ba59abbe56e057f20f883e', '正常');
INSERT INTO `student` VALUES ('5', 'R2002', '乔原', '男', '2001', '江苏盐城', '共青团员', '2021', '阜宁', '224400', '无', '123456', '正常');
INSERT INTO `student` VALUES ('6', 'J2001', '仇皓', '男', '1999', '', '', '', '', '', '', 'e10adc3949ba59abbe56e057f20f883e', '正常');
INSERT INTO `student` VALUES ('7', 'J2001', '王查询', '男', '2001', '江苏盐城', '共青团员', '2020', '江苏', '224400', '无', 'e10adc3949ba59abbe56e057f20f883e', '正常');

-- ----------------------------
-- View structure for co_dept_class_student_view
-- ----------------------------
DROP VIEW IF EXISTS `co_dept_class_student_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `co_dept_class_student_view` AS select distinct `student`.`sno` AS `sno`,`class`.`clano` AS `clano`,`dept_class`.`dno` AS `dept_class_dno`,`dept_class`.`clano` AS `dept_class_clano`,`dept`.`dno` AS `dno`,`co_d`.`cono` AS `co_d_cono`,`co_d`.`dno` AS `co_d_dno`,`college`.`cono` AS `cono` from (((((`dept_class` join `class` on((`dept_class`.`clano` = `class`.`clano`))) join `student` on((`student`.`clano` = `class`.`clano`))) join `dept` on((`dept_class`.`dno` = `dept`.`dno`))) join `co_d` on((`dept`.`dno` = `co_d`.`dno`))) join `college` on((`co_d`.`cono` = `college`.`cono`)));

-- ----------------------------
-- View structure for co_dept_class_view
-- ----------------------------
DROP VIEW IF EXISTS `co_dept_class_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `co_dept_class_view` AS select distinct `co_d`.`cono` AS `cono_co_d`,`co_d`.`dno` AS `dno_co_d`,`dept_class`.`dno` AS `dno_dept_class`,`dept_class`.`clano` AS `clano_dept_class`,`college`.`cono` AS `cono`,`college`.`coname` AS `coname`,`college`.`coadd` AS `coadd`,`dept`.`dno` AS `dno`,`dept`.`dname` AS `dname`,`dept`.`dadd` AS `dadd`,`class`.`clano` AS `clano`,`class`.`claname` AS `claname`,`class`.`master` AS `master` from ((((`co_d` join `college` on((`co_d`.`cono` = `college`.`cono`))) join `dept` on((`co_d`.`dno` = `dept`.`dno`))) join `dept_class` on((`dept`.`dno` = `dept_class`.`dno`))) join `class` on((`dept_class`.`clano` = `class`.`clano`)));

-- ----------------------------
-- View structure for dept_course_view
-- ----------------------------
DROP VIEW IF EXISTS `dept_course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `dept_course_view` AS select distinct `dept`.`dno` AS `dno`,`dept`.`dname` AS `dname`,`dept_course`.`dno` AS `dept_course_dno`,`dept_course`.`cno` AS `dept_course_cno`,`course`.`cno` AS `cno`,`course`.`cname` AS `cname`,`course`.`cteacher` AS `cteacher`,`course`.`cterm` AS `cterm`,`course`.`ccredit` AS `ccredit`,`course`.`cnote` AS `cnote` from ((`dept` join `dept_course` on((`dept`.`dno` = `dept_course`.`dno`))) join `course` on((`dept_course`.`cno` = `course`.`cno`)));

-- ----------------------------
-- View structure for stu_stu_sid_view
-- ----------------------------
DROP VIEW IF EXISTS `stu_stu_sid_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `stu_stu_sid_view` AS select `stu_sid`.`sno` AS `sno_stu_sid`,`student`.`sno` AS `sno`,`stu_sid`.`sid` AS `sid`,`student`.`clano` AS `clano`,`student`.`sname` AS `sname`,`student`.`ssex` AS `ssex`,`student`.`sbirth` AS `sbirth`,`student`.`sorigin` AS `sorigin`,`student`.`sstatus` AS `sstatus`,`student`.`s_year` AS `s_year`,`student`.`shome` AS `shome`,`student`.`szipcode` AS `szipcode`,`student`.`snote` AS `snote`,`student`.`spassword` AS `spassword`,`student`.`suserstatus` AS `suserstatus` from (`student` join `stu_sid` on((`student`.`sno` = `stu_sid`.`sno`)));

-- ----------------------------
-- View structure for student_class_view
-- ----------------------------
DROP VIEW IF EXISTS `student_class_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `student_class_view` AS select `student`.`sno` AS `sno`,`class`.`clano` AS `clano_cla`,`student`.`clano` AS `clano`,`class`.`claname` AS `claname`,`class`.`master` AS `master`,`student`.`sname` AS `sname`,`student`.`ssex` AS `ssex`,`student`.`sbirth` AS `sbirth`,`student`.`sorigin` AS `sorigin`,`student`.`sstatus` AS `sstatus`,`student`.`s_year` AS `s_year`,`student`.`shome` AS `shome`,`student`.`szipcode` AS `szipcode`,`student`.`snote` AS `snote`,`student`.`spassword` AS `spassword`,`student`.`suserstatus` AS `suserstatus` from (`class` join `student` on((`class`.`clano` = `student`.`clano`)));

-- ----------------------------
-- View structure for student_sc_course_view
-- ----------------------------
DROP VIEW IF EXISTS `student_sc_course_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `student_sc_course_view` AS select `student`.`sno` AS `sno`,`sc`.`sno` AS `sno_sc`,`sc`.`cno` AS `cno_sc`,`course`.`cno` AS `cno`,`student`.`clano` AS `clano`,`student`.`sname` AS `sname`,`student`.`ssex` AS `ssex`,`student`.`sbirth` AS `sbirth`,`student`.`sorigin` AS `sorigin`,`student`.`sstatus` AS `sstatus`,`student`.`s_year` AS `s_year`,`student`.`shome` AS `shome`,`student`.`szipcode` AS `szipcode`,`student`.`snote` AS `snote`,`student`.`spassword` AS `spassword`,`student`.`suserstatus` AS `suserstatus`,`sc`.`scgrade` AS `scgrade`,`sc`.`scnote` AS `scnote`,`course`.`cname` AS `cname`,`course`.`cterm` AS `cterm`,`course`.`cnote` AS `cnote`,`course`.`cteacher` AS `cteacher` from ((`course` join `sc` on((`course`.`cno` = `sc`.`cno`))) join `student` on((`student`.`sno` = `sc`.`sno`)));

SET FOREIGN_KEY_CHECKS = 1;
