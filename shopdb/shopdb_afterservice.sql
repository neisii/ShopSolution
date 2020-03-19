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
-- Table structure for table `afterservice`
--

DROP TABLE IF EXISTS `afterservice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `afterservice` (
  `aCode` int(15) NOT NULL,
  `aModel` varchar(12) NOT NULL,
  `aProb` varchar(45) NOT NULL,
  `aID` varchar(45) NOT NULL,
  `aDate` varchar(45) NOT NULL,
  `aState` varchar(45) NOT NULL,
  PRIMARY KEY (`aCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='신청서={신청코드+신청모델+신청사유+신청자아이디}';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `afterservice`
--

LOCK TABLES `afterservice` WRITE;
/*!40000 ALTER TABLE `afterservice` DISABLE KEYS */;
INSERT INTO `afterservice` VALUES (1311190001,'iPhone5c','액정 파손','dhkdhk32','13/11/19','완료'),(1311210001,'GALAXY_Note2','안 켜져!!!','dhkdhk32','13/11/21','대기'),(1311210002,'GALAXY_Pop','소리가 안 남','dhkdhk32','13/11/21','완료'),(1311210003,'Vu3','터치 안됨','dhkdhk32','13/11/21','대기'),(1311220001,'Vu3','999','test','13/11/22','대기'),(1311230001,'VEGA_R3','폰이 안 켜져','test','13/11/23','대기'),(1311230002,'GALAXY_Grand','무한 재부팅','dhkdhk32','13/11/23','대기'),(1311240001,'GALAXY_Grand','폰 침수','user3','13/11/24','취소'),(1311240002,'G_Flex','소리 안 남','jjung','13/11/24','대기'),(1311240003,'G_Flex','소리 안 남','jjung','13/11/24','취소'),(1311280001,'GALAXY_Note2','터치 펜이 없는데요.','ki0058','13/11/28','대기');
/*!40000 ALTER TABLE `afterservice` ENABLE KEYS */;
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
