-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: db_books
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book_borrowing_status`
--

DROP TABLE IF EXISTS `book_borrowing_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book_borrowing_status` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_id` bigint(20) DEFAULT NULL,
  `user_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `appoint_time` timestamp NULL DEFAULT NULL,
  `book_state` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_borrowing_status`
--

LOCK TABLES `book_borrowing_status` WRITE;
/*!40000 ALTER TABLE `book_borrowing_status` DISABLE KEYS */;
INSERT INTO `book_borrowing_status` VALUES (11,1000,'user','2020-07-17 15:22:56','0'),(14,1002,'admin','2020-07-10 09:07:44','0'),(15,1003,'admin','2020-07-10 09:09:55','0');
/*!40000 ALTER TABLE `book_borrowing_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_info`
--

DROP TABLE IF EXISTS `book_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book_info` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `type` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `press` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `author` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_info`
--

LOCK TABLES `book_info` WRITE;
/*!40000 ALTER TABLE `book_info` DISABLE KEYS */;
INSERT INTO `book_info` VALUES (1000,'计算机网络',10,'技术','电子工业出版社','谢希仁'),(1001,'浮生六记',10,'技术','人民出版社','沈复'),(1002,'Java程序设计',9,'技术','人民出版社','张三'),(1003,'法国文学',7,'技术','北京联合出版社','Jessis');
/*!40000 ALTER TABLE `book_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooter`
--

DROP TABLE IF EXISTS `rooter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rooter` (
  `admin_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `admin_password` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`admin_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooter`
--

LOCK TABLES `rooter` WRITE;
/*!40000 ALTER TABLE `rooter` DISABLE KEYS */;
INSERT INTO `rooter` VALUES ('admin','admin');
/*!40000 ALTER TABLE `rooter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_name` varchar(45) COLLATE utf8_bin NOT NULL,
  `user_password` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `phone_number` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `day` tinyint(4) DEFAULT NULL,
  `overdue` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','admin',NULL,5,2),('asd','asd','138***',5,0),('user','user','1111',0,0),('youzi','youzi','',5,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-20 18:04:57
