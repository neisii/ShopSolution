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
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `sCode` int(15) NOT NULL,
  `sModel` varchar(45) NOT NULL,
  `sQty` varchar(45) NOT NULL,
  `sID` varchar(45) NOT NULL,
  `sDate` varchar(45) NOT NULL,
  `sState` varchar(45) NOT NULL,
  PRIMARY KEY (`sCode`),
  KEY `pCode_idx` (`sModel`),
  KEY `mID_idx` (`sID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='주문서={주문코드+주문모델+주문수량+주문자아이디+처리상태}';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1311170001,'GALAXY_Pop','111','dhkdhk32','13/11/17','완료'),(1311190001,'OptimusG','9','dhkdhk32','13/11/19','완료'),(1311190002,'GALAXY_Note2','2','ki0058','13/11/19','완료'),(1311190003,'iPhone5c','3','dhkdhk32','13/11/19','완료'),(1311200001,'Vu3','350','test','13/11/20','완료'),(1311210001,'iPhone5c','5','dhkdhk32','13/11/21','완료'),(1311210011,'GALAXY_Note2','11','dhkdhk32','13/11/21','배송'),(1311210012,'GALAXY_Grand','12','dhkdhk32','13/11/21','배송'),(1311210105,'iPhone5c','1','dhkdhk32','13/11/21','준비'),(1311230001,'VEGA_R3','3','test','13/11/23','배송'),(1311230002,'OptimusG','1','test','13/11/23','완료'),(1311230003,'GALAXY_Grand','11','dhkdhk32','13/11/23','준비'),(1311240001,'GALAXY_Grand','12','user3','13/11/24','취소'),(1311240002,'G_Flex','10','jjung','13/11/24','배송'),(1311280001,'GALAXY_Note3','3','ki0058','13/11/28','대기');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
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
