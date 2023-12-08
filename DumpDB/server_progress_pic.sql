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
-- Table structure for table `progress_pic`
--

DROP TABLE IF EXISTS `progress_pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `progress_pic` (
  `pic_num` int(11) NOT NULL AUTO_INCREMENT,
  `pic_name` varchar(200) CHARACTER SET utf8 NOT NULL,
  `pic_content` varchar(1000) CHARACTER SET utf8 NOT NULL,
  `post_code` int(11) NOT NULL,
  PRIMARY KEY (`pic_num`),
  KEY `progress_pic_FK` (`post_code`)
) ENGINE=InnoDB AUTO_INCREMENT=1386 DEFAULT CHARSET=euckr;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `progress_pic`
--

LOCK TABLES `progress_pic` WRITE;
/*!40000 ALTER TABLE `progress_pic` DISABLE KEYS */;
INSERT INTO `progress_pic` VALUES (1341,'소고기무국1.png','소고기 국거리는 물에 담궈서 핏물을 제거해주세요. 양에 따라 다르지만 제 손에 한줌 기준으로 30분 정도면 충분해요. (물을 여러번 자주 갈아주면 좋아요.)',1),(1342,'소고기무국2.png','무는 납닥하게 먹기 좋은 크기로 썰어주고, 대파는 어슷썰어서 준비해주세요.',1),(1343,'소고기무국3.png','콩나물은 씻어서 머리나 꼬리를 떼도 되고 안떼도 되는데 귀찮으면 그대로 드셔도됩니다.',1),(1344,'소고기무국4.png','버섯은 쭉쭉 찢어서 준비해주세요.',1),(1345,'소고기무국5.png','달군 냄비에 소고기를 넣고 참기름과 함께 볶아주세요.',1),(1346,'소고기무국6.png','소고기에 핏기가 어느정도 사라졌다 싶으면, 무를 넣고 함께 볶아주세요.',1),(1347,'소고기무국7.png','고추가루 2스푼정도 넣고 무 표면이 살짝 익을때까지 볶아줍니다.',1),(1348,'소고기무국8.png','경상도식 소고기 무국을 끓일때 간혹 고추기름을 넣기도 하는데, 참기름을 조금 넉넉하게 넣어서 고추가루와 볶으면 고추기름을 굳이 넣지않아도 되요.',1),(1349,'소고기무국9.png','육수를 넣고 콩나물을 넣은 다음 재빨리 뚜껑을 닫고, (육수가 없으면 맹물이나 쌀뜨물을 넣어도 상관없어요.) 끓을때까지 뚜껑을 절대! 열지마세요! 콩나물 비린내가 날수도 있어요.',1),(1350,'소고기무국10.png','물이 끓어오르면 버섯, 대파, 다진마늘을 넣고 다시 중불에 끓여주세요.',1),(1351,'소고기무국11.png','20분정도 끓고나니 색깔이 제법 먹음직스러워졌죠? 소금, 국간장으로 간을 한다음 약불에서 20분정도 더 끓여주면 완성! 경상도식 소고기 무국은 오래 끓일수록 맛있어요.',1),(1353,'김치밥11.png','김치 1컵을 잘게 썬다. 새김치는 안되지만 살짝 익은 정도의 김치면 가능. 레시피에 쓰인 김치는 마트표 종xx 표 김치~',3),(1354,'김치밥21.png','김치에 모든 양념을 넣고 잘 비벼준 다음 식용유 3스푼을 붓고 달군 팬에 재료를 고루 펴서 부어준다.\r\n그리고 뚜껑을 덮고 약 1분간 그대로 둔다.\r\n김치말고 살짝 익은 깍두기를 잘게 다져서 해도 완전 맛있어요~\r\n--양념무게 환산\r\n고추가루 1스푼 (6~7g)\r\n설탕 1스푼 (10g)\r\n진간장 1스푼 (8g)\r\n참기름 2스푼(12~14g)\r\n마요네즈 1스푼 (15g)\r\n된장 1/3스푼 (10g)\r\n다진대파 2큰술 ( 5~6g)',3),(1355,'김치밥31.png','뚜껑을 열고 수분이 거의 남지 않는 꾸덕한 상태가 되었는지 확인하고 수분이 많이 남아 있으면 1분정도 더 볶아 주고 수분이 거의 날아간 상태라면 밥 2공기를 넣고 볶는다.\r\n밥2공기는 햇반 한개 210g 짜리 2개 분량입니다.',3),(1356,'김치밥41.png','흰밥이 보이지 않을 정도로 고루 섞어 준 다음 팬에 골고루 밥을 편다음 뚜껑을 덮고 쎈불에 그대로 20~30초간 둔다.',3),(1357,'김치밥53.png','전혀 새로운 맛의 김치 볶음밥이 완성 되었습니다~',3),(1358,'계란빵1.png',' 볼에 달걀과 소금을 약간 넣어 잘 풀어요',4),(1359,'계란빵2.png','예열된 팬에 기름을 두르고 달걀물을 넣어요',4),(1360,'계란빵3.png','달걀이 다 익기 전에 식빵을 올려요.',4),(1361,'계란빵4.png','달걀과 식빵이 붙으면 뒤집어 식빵 사이즈에 맞게 달걀을 올려 접어요.',4),(1362,'계란빵5.png','달걀 위에 치즈를 올리고 설탕을 뿌려요.',4),(1363,'계란빵6.png','반을 접어 완성해요.',4),(1364,'가지1.png','가지의 꼭지 부분은 자르고 통으로 두께 1~2cm 크기로 자른다.',5),(1365,'가지2.png','자른 가지는 그릇에 담아 전자레인지에 4~5분 정도 돌린다.',5),(1366,'가지3.png','간장, 설탕, 식초, 다진 마늘을 넣고 양념을 만든다.',5),(1367,'가지4.png','팬에 버터를 넣고 가지를 약불에서 앞뒤로 굽는다.',5),(1368,'가지5.png','가지의 수분이 빠지고 노릇해지면 양념을 바른다.',5),(1369,'가지6.png','양념을 바른 가지는 약불에서 앞뒤로 굽는다.',5),(1370,'바나나1.png','바나나를 잘라서 볼에 넣어 줍니다.',6),(1371,'바나나2.png','잘라진 바나나에 달걀도 넣어 줍니다.',6),(1372,'바나나3.png','바나나와 달걀이 잘 섞이도록 섞어줍니다.',6),(1373,'바나나4.png','먹기 좋은 크기로 미리 예열한 후라이팬에 구워 줍니다.',6),(1374,'오코1.png','양배추는 얇게 채 썰어 준비합니다. 다른 재료들도 적당항 크기로 잘라서 준비해줘요',7),(1375,'오코2.png','가쓰오부시를 듬뿍 올려주니\r\n다코야끼랑 맛이 거의 비슷하다고 하네요\r\n그러니 많이 준비해줍니다',7),(1376,'오코3.png','밀가루에 물은 180ml 정도 넣고 달걀도\r\n넣습니다',7),(1377,'오코4.png','야채와 해산물을 넣어 반죽하기',7),(1378,'오코6.png','달구어진 팬에 기름을 넉넉히 두르고\r\n앞뒤 노릇하게 구워주기',7),(1379,'오코8.png','잘 익은 오코노미야키 위에\r\n소스를 바르고 가쓰오부시를 올려줍니다',7),(1380,'오코10.png','마지막에 마요네즈로 먹음직스럽게\r\n뿌려주면 됩니다',7),(1381,'국13.png','먼저 애호박과 당근은 채썰어 준비해주세요.',8),(1382,'국23.png','냄비에 물이 끓으면 소면을 넣어주고 끓어오르면 찬물 반컵 부어주고, 또 끓어오르면 찬물 반컵 부어주고, 그렇게 2-3번의 과정을 반복해주세요',8),(1383,'국33.png','면이 거의 익었을때쯤 썰어둔 애호박과 당근을 넣고 1-2분정도 더 끓여주고 면과 야채는 빠르게 찬물로 이동해 전분기를 빼주고 채에 받쳐 물기를 빼주세요',8),(1384,'국43.png','진간장 3스푼, 설탕 3스푼, 식초 1스푼, 다진마늘 1스푼, 참기름 2스푼, 통깨 1스푼, 물 1스푼을 섞어 간장양념을 만들어주세요',8),(1385,'국53.png','그릇에 물기를 뺀 면과 야채를 담고 분량의 양념을 올려 슥슥 비벼주기만 하면 맛있는 간장국수 완성이에요♥',8);
/*!40000 ALTER TABLE `progress_pic` ENABLE KEYS */;
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
