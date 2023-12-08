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
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `post_code` int(11) NOT NULL,
  `post_title` varchar(200) CHARACTER SET utf8 NOT NULL,
  `post_comment` varchar(500) NOT NULL,
  `thumbnail` varchar(200) CHARACTER SET utf8 NOT NULL,
  `post_cooktime` int(11) NOT NULL,
  `post_cookcat` varchar(20) NOT NULL,
  `post_cookdiff` varchar(20) NOT NULL,
  `post_day` date NOT NULL,
  `post_state` int(11) NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL,
  `u_nick` varchar(100) NOT NULL,
  PRIMARY KEY (`post_code`),
  KEY `post_FK` (`u_nick`),
  CONSTRAINT `post_FK` FOREIGN KEY (`u_nick`) REFERENCES `user` (`u_nick`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'경상도식 소고기 무국이에요','얼큰하니 평소에 먹던 소고기 무국이랑은 다를거에요!','소고기무국.jpg',40,'soup','2','2022-12-15',1,87,'Bedow'),(4,'빨리 지나가서 요리가 멈춰진 백파더 백종원 간단토스트! 에그치즈토스트 만들기','백파더! 백종원의 달걀토스트 너무 빨리지나가서 하다가 움찔! 믿고 먹는 백종원의 간단토스트! 에그치즈토스트 따라하기! 세상의모든레시피 만개의레시피','계란빵.png',20,'dessert','1','2022-12-15',1,2,'Tomcat'),(5,'가지볶음보다 맛있는 가지 스테이크 맛보면 멈출 수 없어요.','가지로 만드는 스테이크입니다. 덮밥으로 만들어도 맛있어요~ 단짠 소스가 아주 좋습니다. 꼭 만들어 보세요.','가지.png',20,'side','1','2022-12-15',1,1,'Tomcat'),(6,'노밀가루 바나나 팬케이크','다이어트 대표 식품인 바나나와 달걀로 만든 팬케이크예요. 밀가루가 들어가지 않아서 밀가루 섭취를 못하시는 분들이나 다이어트 하시는 분들에게 좋아요.','바나나.png',10,'dessert','1','2022-12-15',1,11,'Tomcat'),(7,'오꼬노미야끼 집에서 간단히 만들기~','오늘은 집에서 오꼬노모야끼를 만들어 보았어요 집에 있는 재료와 간편한 레시피로','오코.png',30,'side','2','2022-12-15',1,13,'test'),(8,'박막례 간장비빔국수 맛의 재발견','요 음식은 아는분 통해 알게됫는데 만들기도 간단하면서 너무 맛있다고들 극찬하길래 저도 만들어보았어요 재료도 너무 간단하고 옛날에 만들어먹던 간장국수 느낌도 나니 자주 만들어먹어도 좋을것 같더라구요','국8.png',10,'noodle','1','2022-12-15',1,1,'test');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
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
