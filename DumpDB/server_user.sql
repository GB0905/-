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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `u_id` varchar(100) CHARACTER SET utf8 NOT NULL,
  `u_pw` varchar(500) CHARACTER SET utf8 NOT NULL,
  `u_nick` varchar(100) NOT NULL,
  `u_name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `birth` date NOT NULL,
  `gender` varchar(100) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`u_id`),
  UNIQUE KEY `user_un` (`u_nick`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('qkrgh5549@gmail.com','f0fb396d48199edef86fa4c667cd2ffe5389c8f11a890299ae6212b2149476d00zFIvpaIBPbH','Bedow','박호석','1999-06-02','남성','010-6413-9957'),('security123@naver.com','158adac596cd148c5540af26b4b5bf23660ad459e9dccfc76568cf2916bb1c49vI5vm4tJaiPh','security123','자취생','2002-12-30','남성','010-5134-4684'),('test@hanmail.net','c43f2797ce5aa8f549bb939de6e3327a4857141ebe4a04bf27060b5eaa477818y79QMxmzQuuW','test','테스트','2001-07-21','여성','010-6721-9537'),('Tomcat@naver.com','2ccb421d98bdcc1d8533f4fd0309921ba4fb094bb3d790c5ccb84df50aa5ff55M0P2MdIqS0Gc','Tomcat','톰캣','1997-01-01','남성','010-3487-3159');
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

-- Dump completed on 2022-12-15  7:59:25
