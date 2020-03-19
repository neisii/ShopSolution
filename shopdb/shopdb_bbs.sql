CREATE DATABASE  IF NOT EXISTS `shopdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shopdb`;
-- MySQL dump 10.13  Distrib 5.6.11, for Win64 (x86_64)
--
-- Host: localhost    Database: shopdb
-- ------------------------------------------------------
-- Server version	5.6.11-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bbs`
--

DROP TABLE IF EXISTS `bbs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bbs` (
  `bCategory` varchar(45) NOT NULL,
  `bNum` int(11) NOT NULL,
  `bTitle` varchar(45) NOT NULL,
  `bContent` mediumtext NOT NULL,
  `bID` varchar(45) NOT NULL,
  `bDate` varchar(45) NOT NULL,
  PRIMARY KEY (`bNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='게시판={분류+글번호+제목+내용+작성자+작성일}';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bbs`
--

LOCK TABLES `bbs` WRITE;
/*!40000 ALTER TABLE `bbs` DISABLE KEYS */;
INSERT INTO `bbs` VALUES ('공지',1,'봉돌 전자에 오신 것을 환영합니다.','많은 이용 바랍니다.','admin','13/11/19'),('공지',2,'탈퇴한 회원의 글은','작성자가 Unknown으로 표시됩니다.','admin','13/11/19'),('일반',3,'1등!!!','우하하하ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','ki0058','13/11/20'),('일반',4,'밤되니까 배고파요^^;;','야식 추천해주세요!','dhkdhk32','13/11/22'),('질문',5,'감기에 좋은 과일은?','배? 사과?','dhkdhk32','13/11/21'),('질문',6,'할부금이 어떻게 되나요?','ㅇㅇ?','test','13/11/23'),('일반',7,'가입했습니다.','잘 부탁해요 ㅋ','Unknown','13/11/24'),('질문',8,'벨소리 지정','벨소리 지정은 어떻게 하나요?','Unknown','13/11/24'),('일반',9,'신입이에요~^^*','ㅎ.ㅎ','jjung','13/11/24'),('질문',10,'usb 연결이 안되요!','ㅇㅇㅇㅇ','jjung','13/11/24'),('일반',11,'이 몸이 랩을 한다','홍~홍~홍~','admin','13/11/24'),('공지',12,'게시물 삭제','자신이 작성한 글만 삭제할 수 있습니다.\r\n\r\n글을 삭제하려면 로그인 해주세요!','admin','13/11/30');
/*!40000 ALTER TABLE `bbs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-30 12:06:49
