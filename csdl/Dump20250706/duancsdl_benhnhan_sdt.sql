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
-- Table structure for table `benhnhan_sdt`
--

DROP TABLE IF EXISTS `benhnhan_sdt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benhnhan_sdt` (
  `mabenhnhan` varchar(20) NOT NULL,
  `sdt` varchar(15) NOT NULL,
  PRIMARY KEY (`mabenhnhan`,`sdt`),
  CONSTRAINT `benhnhan_sdt_ibfk_1` FOREIGN KEY (`mabenhnhan`) REFERENCES `benhnhan` (`mabenhnhan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benhnhan_sdt`
--

LOCK TABLES `benhnhan_sdt` WRITE;
/*!40000 ALTER TABLE `benhnhan_sdt` DISABLE KEYS */;
INSERT INTO `benhnhan_sdt` VALUES ('BN01','0912345670'),('BN02','0912345671'),('BN03','0912345672'),('BN04','0912345673'),('BN05','0912345674'),('BN06','0912345675'),('BN07','0912345676'),('BN08','0912345677'),('BN09','0912345678'),('BN10','0912345679'),('BN11','0912345680'),('BN12','0912345681'),('BN13','0912345682'),('BN14','0912345683'),('BN15','0912345684'),('BN20','0974012674');
/*!40000 ALTER TABLE `benhnhan_sdt` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-06 18:45:03
