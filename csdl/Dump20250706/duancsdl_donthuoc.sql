-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: duancsdl
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `donthuoc`
--

DROP TABLE IF EXISTS `donthuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donthuoc` (
  `madonthuoc` varchar(20) NOT NULL,
  `cachdung` varchar(100) DEFAULT NULL,
  `lieuluong` varchar(100) DEFAULT NULL,
  `maphieukham` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`madonthuoc`),
  KEY `maphieukham` (`maphieukham`),
  CONSTRAINT `donthuoc_ibfk_1` FOREIGN KEY (`maphieukham`) REFERENCES `phieukham` (`maphieukham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donthuoc`
--

LOCK TABLES `donthuoc` WRITE;
/*!40000 ALTER TABLE `donthuoc` DISABLE KEYS */;
INSERT INTO `donthuoc` VALUES ('DT01','Uống trước ăn','2 viên/ngày','PK01'),('DT02','Uống sáng','1 viên/ngày','PK02'),('DT03','Uống trước ăn','1 viên/lần','PK03'),('DT04','Tiêm','1 ống/ngày','PK04'),('DT05','Uống sau ăn','3 viên/ngày','PK05'),('DT06','Xịt mũi','2 lần/ngày','PK06'),('DT07','Uống sáng tối','2 viên/lần','PK07'),('DT08','Bôi ngoài da','2 lần/ngày','PK08'),('DT09','Uống sau ăn','1 viên/ngày','PK09'),('DT10','Uống sáng','2 viên/ngày','PK10'),('DT11','Ngậm dưới lưỡi','3 lần/ngày','PK11'),('DT12','Uống nhiều nước','1 viên/lần','PK12'),('DT13','Tiêm','1 lần/ngày','PK13'),('DT14','Bôi ngoài da','3 lần/ngày','PK14'),('DT15','Uống buổi tối','2 viên/ngày','PK15'),('DT20','fjdb','hfjrj','PK020');
/*!40000 ALTER TABLE `donthuoc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-06 18:45:06
