-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: forum
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `forums`
--

DROP TABLE IF EXISTS `forums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forums` (
  `Forum_id` int(11) NOT NULL AUTO_INCREMENT,
  `Forum_title` varchar(45) DEFAULT NULL,
  `Forum_info` varchar(45) DEFAULT NULL,
  `Forum_type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Forum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='板块列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forums`
--

LOCK TABLES `forums` WRITE;
/*!40000 ALTER TABLE `forums` DISABLE KEYS */;
INSERT INTO `forums` VALUES (1,'Windows','Windows专区',1),(2,'Linux','Linux专区',1),(3,'macOS','macOS专区',1),(4,'数码3C','数码3C资讯',1),(5,'Windows 7','Win7交流区',0),(6,'Windows 10','Win10交流区',0),(7,'Ubuntu','Ubuntu交流区',0),(8,'Deepin','Deepin交流区',0),(9,'Mojave','macOS Mojave 10.14',0),(10,'Catalina','macOS Catalina 10.15',0),(11,'电脑','PC交流区',0),(12,'手机','手机交流区',0);
/*!40000 ALTER TABLE `forums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `replies`
--

DROP TABLE IF EXISTS `replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `replies` (
  `Reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `Forum_big` varchar(45) DEFAULT NULL,
  `Forum_small` varchar(45) DEFAULT NULL,
  `Thread_id` int(11) DEFAULT NULL,
  `Reply_content` varchar(1000) DEFAULT NULL,
  `Reply_writer` varchar(45) DEFAULT NULL,
  `Reply_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Reply_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='回帖列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `replies`
--

LOCK TABLES `replies` WRITE;
/*!40000 ALTER TABLE `replies` DISABLE KEYS */;
INSERT INTO `replies` VALUES (1,'Windows','Windows 7',1,'这边建议您换Win10呢','test','2019-09-16 19:49:00'),(2,'Windows','Windows 7',1,'同意楼上','test','2019-09-16 19:49:30'),(3,'Linux','Deepin',2,'建议重装系统','test','2019-09-16 19:51:00'),(4,'Linux','Deepin',2,'或者换Ubuntu也不错','test','2019-09-16 19:51:30'),(5,'macOS','Mojave',3,'更新一下clover引导和驱动','test','2019-09-16 19:53:00'),(6,'macOS','Mojave',3,'或者干脆回退10.13.6','test','2019-09-16 19:53:30'),(7,'数码3C','电脑',5,'测试删帖1 回复1','user','2019-09-16 19:56:00'),(8,'数码3C','电脑',5,'测试删帖1 回复2','user','2019-09-16 19:56:30'),(9,'数码3C','手机',6,'测试删帖2 回复1','user','2019-09-16 19:58:00'),(10,'数码3C','手机',6,'测试删帖2 回复2','user','2019-09-16 19:58:30'),(11,'Deepin','Deepin',2,'可以按照教程在grub界面修复引导','无名氏','2019-09-21 14:40:26');
/*!40000 ALTER TABLE `replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `threads`
--

DROP TABLE IF EXISTS `threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `threads` (
  `Thread_id` int(11) NOT NULL AUTO_INCREMENT,
  `Forum_big` varchar(45) DEFAULT NULL,
  `Forum_small` varchar(45) DEFAULT NULL,
  `Thread_title` varchar(45) DEFAULT NULL,
  `Thread_content` varchar(1000) DEFAULT NULL,
  `Thread_writer` varchar(45) DEFAULT NULL,
  `Thread_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Thread_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='帖子列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `threads`
--

LOCK TABLES `threads` WRITE;
/*!40000 ALTER TABLE `threads` DISABLE KEYS */;
INSERT INTO `threads` VALUES (1,'Windows','Windows 7','Win7蓝屏','大哥们，我的电脑蓝屏了，该怎么办？','user','2019-09-16 19:46:00'),(2,'Linux','Deepin','Deepin进不去','各位，我的Deepin开机就是grub界面，该怎么办......','user','2019-09-16 19:48:00'),(3,'macOS','Mojave','更新到10.14无限重启','大佬们，我尝试升级10.14翻车了，开机无限重启，该怎么办？','user','2019-09-16 19:50:00'),(4,'数码3C','手机','三星Note7自燃','我的电池炸了......','user','2019-09-16 19:52:00'),(5,'数码3C','电脑','测试删帖1','测试删帖1','test','2019-09-16 19:55:00'),(6,'数码3C','手机','测试删帖2','测试删帖2','test','2019-09-16 19:59:59');
/*!40000 ALTER TABLE `threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_id` int(11) NOT NULL AUTO_INCREMENT,
  `User_name` varchar(45) DEFAULT NULL,
  `User_pwd` varchar(45) DEFAULT NULL,
  `Admin` tinyint(4) DEFAULT NULL,
  `Register_date` date DEFAULT NULL,
  `Phone_number` varchar(45) DEFAULT NULL,
  `E_mail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`User_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin',1,'2019-08-30','11111111111','1@a.com'),(2,'user','user',0,'2019-08-31','22222222222','2@b.com'),(3,'test','test',0,'2019-09-01','33333333333','3@c.com'),(4,'中文测试','test',0,'2019-09-21','44444444444','4@d.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-12 19:43:50
