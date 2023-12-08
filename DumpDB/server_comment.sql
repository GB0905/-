-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: server
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `comm_num` int(11) NOT NULL AUTO_INCREMENT,
  `coment` varchar(200) CHARACTER SET utf8 NOT NULL,
  `comm_day` date NOT NULL,
  `comm_report` int(11) NOT NULL DEFAULT '0',
  `post_code` int(11) NOT NULL,
  `u_nick` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`comm_num`),
  KEY `comment_FK` (`u_nick`),
  KEY `comment_FK_1` (`post_code`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (57,'ㄴㅇㅁㄹㅁㄹ','2022-12-15',0,1,'Bedow'),(58,'asdfsadfsadgdsa','2022-12-15',0,1,'Bedow'),(59,'adfgasfa','2022-12-15',0,1,'Bedow'),(60,'생각보다 번거롭네요','2022-12-15',1,7,'test'),(62,'딸기로도 만들어주세요\r\n','2022-12-15',0,6,'Tomcat'),(63,'키위로는 못만드나요?','2022-12-15',0,6,'Bedow'),(64,'그냥 내려와버려요\r\n이러면 안좋은데','2022-12-15',0,6,'Bedow');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-15  7:59:24
