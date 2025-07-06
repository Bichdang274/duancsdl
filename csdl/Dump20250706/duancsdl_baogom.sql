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
-- Table structure for table `baogom`
--

DROP TABLE IF EXISTS `baogom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `baogom` (
  `madonthuoc` varchar(20) NOT NULL,
  `mathuoc` varchar(20) NOT NULL,
  PRIMARY KEY (`madonthuoc`,`mathuoc`),
  KEY `mathuoc` (`mathuoc`),
  CONSTRAINT `baogom_ibfk_1` FOREIGN KEY (`madonthuoc`) REFERENCES `donthuoc` (`madonthuoc`),
  CONSTRAINT `baogom_ibfk_2` FOREIGN KEY (`mathuoc`) REFERENCES `thuoc` (`mathuoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baogom`
--

LOCK TABLES `baogom` WRITE;
/*!40000 ALTER TABLE `baogom` DISABLE KEYS */;
INSERT INTO `baogom` VALUES ('DT01','T001'),('DT03','T001'),('DT01','T002'),('DT05','T002'),('DT02','T003'),('DT08','T003'),('DT04','T004'),('DT13','T004'),('DT06','T005'),('DT07','T006'),('DT14','T006'),('DT09','T007'),('DT10','T008'),('DT11','T009'),('DT12','T010');
/*!40000 ALTER TABLE `baogom` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-06 18:45:04
