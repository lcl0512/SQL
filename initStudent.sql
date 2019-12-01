/*
MySQL Backup
Database: students
Backup Time: 2019-12-01 14:40:35
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `students`.`course`;
DROP TABLE IF EXISTS `students`.`sc`;
DROP TABLE IF EXISTS `students`.`stu`;
CREATE TABLE `course` (
  `Cno` char(1) DEFAULT NULL,
  `Cname` char(20) DEFAULT NULL,
  `Cpno` int(11) DEFAULT NULL,
  `Ccredit` int(11) DEFAULT NULL,
  UNIQUE KEY `Cno` (`Cno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `sc` (
  `Sno` char(9) DEFAULT NULL,
  `Cno` char(1) DEFAULT NULL,
  `Grade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `stu` (
  `Sno` char(9) NOT NULL,
  `Sname` char(10) NOT NULL,
  `Ssex` char(2) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `Sdept` char(20) DEFAULT NULL,
  PRIMARY KEY (`Sno`),
  CONSTRAINT `Cage` CHECK ((`age` < 40)),
  CONSTRAINT `CSex` CHECK ((`Ssex` in (_utf8mb4'男',_utf8mb4'女')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
BEGIN;
LOCK TABLES `students`.`course` WRITE;
DELETE FROM `students`.`course`;
INSERT INTO `students`.`course` (`Cno`,`Cname`,`Cpno`,`Ccredit`) VALUES ('1', '数据库', 5, 4),('2', '数学', NULL, 2),('3', '信息系统', 1, 4),('4', '操作系统', 6, 3),('5', '数据结构', 7, 4),('6', '数据处理', NULL, 2),('7', 'PASCAL语言', 6, 4);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `students`.`sc` WRITE;
DELETE FROM `students`.`sc`;
INSERT INTO `students`.`sc` (`Sno`,`Cno`,`Grade`) VALUES ('201515121', '1', 92),('201515121', '2', 85),('201515121', '3', 88),('201515122', '2', 90),('201515122', '3', 80);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `students`.`stu` WRITE;
DELETE FROM `students`.`stu`;
INSERT INTO `students`.`stu` (`Sno`,`Sname`,`Ssex`,`age`,`Sdept`) VALUES ('201515121', '李勇', '男', 20, 'CS'),('201515122', '刘晨', '女', 19, 'CS'),('201515123', '王敏', '女', 18, 'MA'),('201515124', '张立', '男', 19, 'IS');
UNLOCK TABLES;
COMMIT;
