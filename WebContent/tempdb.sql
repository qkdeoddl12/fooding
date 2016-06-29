-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: foodingdb
-- ------------------------------------------------------
-- Server version	5.7.12-log

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
-- Table structure for table `appraisalinfo`
--

DROP TABLE IF EXISTS `appraisalinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appraisalinfo` (
  `AppraisalNumber` int(11) NOT NULL AUTO_INCREMENT,
  `FoodNumber` int(11) DEFAULT NULL,
  `UserNumber` int(11) DEFAULT NULL,
  `AppraisalStar` int(11) DEFAULT NULL,
  `AppraisalReply` varchar(6000) DEFAULT NULL,
  `AppraisalImg` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`AppraisalNumber`),
  KEY `FoodNumber` (`FoodNumber`),
  KEY `UserNumber` (`UserNumber`),
  CONSTRAINT `appraisalinfo_ibfk_1` FOREIGN KEY (`FoodNumber`) REFERENCES `foodinfo` (`FoodNumber`),
  CONSTRAINT `appraisalinfo_ibfk_2` FOREIGN KEY (`UserNumber`) REFERENCES `userinfo` (`UserNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appraisalinfo`
--

LOCK TABLES `appraisalinfo` WRITE;
/*!40000 ALTER TABLE `appraisalinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `appraisalinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baskeinfo`
--

DROP TABLE IF EXISTS `baskeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baskeinfo` (
  `UserNumber` int(11) DEFAULT NULL,
  `FoodNumber` int(11) DEFAULT NULL,
  `BasketNumber` int(11) NOT NULL AUTO_INCREMENT,
  `BasketUserNumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BasketNumber`),
  KEY `FoodNumber` (`FoodNumber`),
  KEY `UserNumber` (`UserNumber`),
  CONSTRAINT `baskeinfo_ibfk_1` FOREIGN KEY (`FoodNumber`) REFERENCES `foodinfo` (`FoodNumber`),
  CONSTRAINT `baskeinfo_ibfk_2` FOREIGN KEY (`UserNumber`) REFERENCES `userinfo` (`UserNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baskeinfo`
--

LOCK TABLES `baskeinfo` WRITE;
/*!40000 ALTER TABLE `baskeinfo` DISABLE KEYS */;
INSERT INTO `baskeinfo` VALUES (1,1,1,NULL),(2,2,2,NULL),(2,3,3,NULL);
/*!40000 ALTER TABLE `baskeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookinginfo`
--

DROP TABLE IF EXISTS `bookinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookinginfo` (
  `BookingNumber` int(11) NOT NULL AUTO_INCREMENT,
  `FoodNumber` int(11) DEFAULT NULL,
  `UserNumber` int(11) DEFAULT NULL,
  `BookingPeopleNumber` int(11) DEFAULT NULL,
  `BookingUserCheck` tinyint(1) DEFAULT NULL,
  `BookingDate` date DEFAULT NULL,
  `BookingTime` date DEFAULT NULL,
  `BookingPersonNumber` int(11) DEFAULT NULL,
  `BookingPersonName` varchar(30) DEFAULT NULL,
  `BookingRequestContent` varchar(2200) DEFAULT NULL,
  PRIMARY KEY (`BookingNumber`),
  KEY `FoodNumber` (`FoodNumber`),
  KEY `UserNumber` (`UserNumber`),
  CONSTRAINT `bookinginfo_ibfk_1` FOREIGN KEY (`FoodNumber`) REFERENCES `foodinfo` (`FoodNumber`),
  CONSTRAINT `bookinginfo_ibfk_2` FOREIGN KEY (`UserNumber`) REFERENCES `userinfo` (`UserNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookinginfo`
--

LOCK TABLES `bookinginfo` WRITE;
/*!40000 ALTER TABLE `bookinginfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookinginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commentinfo`
--

DROP TABLE IF EXISTS `commentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commentinfo` (
  `CommentNumber` int(11) NOT NULL AUTO_INCREMENT,
  `AppraisalNumber` int(11) DEFAULT NULL,
  `UserNumber` int(11) DEFAULT NULL,
  `CommentContent` varchar(6000) DEFAULT NULL,
  PRIMARY KEY (`CommentNumber`),
  KEY `AppraisalNumber` (`AppraisalNumber`),
  KEY `UserNumber` (`UserNumber`),
  CONSTRAINT `commentinfo_ibfk_1` FOREIGN KEY (`AppraisalNumber`) REFERENCES `appraisalinfo` (`AppraisalNumber`),
  CONSTRAINT `commentinfo_ibfk_2` FOREIGN KEY (`UserNumber`) REFERENCES `userinfo` (`UserNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commentinfo`
--

LOCK TABLES `commentinfo` WRITE;
/*!40000 ALTER TABLE `commentinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `commentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companyinfo`
--

DROP TABLE IF EXISTS `companyinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companyinfo` (
  `UserNumber` int(11) DEFAULT NULL,
  `FoodNumber` int(11) DEFAULT NULL,
  `CompanyBooking` tinyint(1) DEFAULT NULL,
  KEY `FoodNumber` (`FoodNumber`),
  KEY `UserNumber` (`UserNumber`),
  CONSTRAINT `companyinfo_ibfk_1` FOREIGN KEY (`FoodNumber`) REFERENCES `foodinfo` (`FoodNumber`),
  CONSTRAINT `companyinfo_ibfk_2` FOREIGN KEY (`UserNumber`) REFERENCES `userinfo` (`UserNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companyinfo`
--

LOCK TABLES `companyinfo` WRITE;
/*!40000 ALTER TABLE `companyinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `companyinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodinfo`
--

DROP TABLE IF EXISTS `foodinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodinfo` (
  `FoodMenu` varchar(5000) DEFAULT NULL,
  `FoodPhoneNumber` varchar(50) DEFAULT NULL,
  `FoodAddr` varchar(300) DEFAULT NULL,
  `FoodAddrX` varchar(40) DEFAULT NULL,
  `FoodAddrY` varchar(40) DEFAULT NULL,
  `FoodType` varchar(20) DEFAULT NULL,
  `FoodTime` int(11) DEFAULT NULL,
  `FoodMenuPrice` int(11) DEFAULT NULL,
  `FoodStoreName` varchar(30) DEFAULT NULL,
  `FoodContent` varchar(6000) DEFAULT NULL,
  `FoodNumber` int(11) NOT NULL AUTO_INCREMENT,
  `FoodImg` varchar(1000) DEFAULT NULL,
  `FoodServicePWTGBAD` varchar(50) DEFAULT NULL,
  `FoodClickNumber` int(11) DEFAULT '0',
  PRIMARY KEY (`FoodNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodinfo`
--

LOCK TABLES `foodinfo` WRITE;
/*!40000 ALTER TABLE `foodinfo` DISABLE KEYS */;
INSERT INTO `foodinfo` VALUES ('봉피양 세트 메뉴','025129593','서울시 강남구 청담동 118-4 조은빌등 1F','한식',3,65000,'청미심','서울 대표 갈비 명가 ‘벽제갈비’가 특급 한우를 더욱 저렴한 가격에 즐길 수 있',1,'food5.jpg',3.8,'0111001',3),('스파게티세트A','0314445555','경기도 광명시','일식',2,71000,'스파게티','진짜 맛있음 !!! 싸다 !!!',2,NULL,2.5,'0111110',2),('스테이크세트B','0328889999','경기도 부천시','중식',1,75000,'스테이크','무한리필임 ! 시간이 한정되어있지만 짱짱입니다!',3,NULL,4.1,'1000001',9);
/*!40000 ALTER TABLE `foodinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestinfo`
--

DROP TABLE IF EXISTS `guestinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guestinfo` (
  `UserNumber` int(11) DEFAULT NULL,
  `GuestPhone` int(11) DEFAULT NULL,
  `GuestAddr` varchar(20) DEFAULT NULL,
  KEY `UserNumber` (`UserNumber`),
  CONSTRAINT `guestinfo_ibfk_1` FOREIGN KEY (`UserNumber`) REFERENCES `userinfo` (`UserNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestinfo`
--

LOCK TABLES `guestinfo` WRITE;
/*!40000 ALTER TABLE `guestinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `guestinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imageinfo`
--

DROP TABLE IF EXISTS `imageinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imageinfo` (
  `ImageNumber` int(11) NOT NULL AUTO_INCREMENT,
  `FoodNumber` int(11) DEFAULT NULL,
  `ImageSrc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ImageNumber`)
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageinfo`
--

LOCK TABLES `imageinfo` WRITE;
/*!40000 ALTER TABLE `imageinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `imageinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userinfo` (
  `UserNumber` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(30) DEFAULT NULL,
  `UserPassword` varchar(40) DEFAULT NULL,
  `UserAuthority` tinyint(1) DEFAULT NULL,
  `UserName` varchar(30) DEFAULT NULL,
  `UserBirthDaty` date DEFAULT NULL,
  `UserAddr` varchar(100) DEFAULT NULL,
  `UserPhoneNumber` varchar(30) DEFAULT NULL,
  `UserEmail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UserNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,'a1','111',0,'test','1991-04-03','test','01011111111','aaa@aa'),(2,'a2','222',1,'김민정','1991-04-01','경기도 안양시','01011112222','bbb@bb'),(3,'a3','333',0,'우병수','1990-05-09','경기도 부천시','01011113333','ccc@cc'),(4,'a4','444',1,'조일선','1993-10-11','경기도 광명시','01011114444','ddd@dd'),(5,'a5','555',0,'김우준','1992-11-12','서울시 강동구','01011115555','eee@ee'),(6,'test1','111',1,'test','1991-04-03','test','010111','test@test');
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

