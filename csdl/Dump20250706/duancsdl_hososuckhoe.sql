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
-- Table structure for table `hososuckhoe`
--

DROP TABLE IF EXISTS `hososuckhoe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hososuckhoe` (
  `mahoso` varchar(20) NOT NULL,
  `mabenhnhan` varchar(20) DEFAULT NULL,
  `tiensubenh` text,
  `thuocdangsd` text,
  `diung` text,
  `tiemchung` text,
  `lienhekhancap` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`mahoso`),
  UNIQUE KEY `mabenhnhan` (`mabenhnhan`),
  CONSTRAINT `hososuckhoe_ibfk_1` FOREIGN KEY (`mabenhnhan`) REFERENCES `benhnhan` (`mabenhnhan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hososuckhoe`
--

LOCK TABLES `hososuckhoe` WRITE;
/*!40000 ALTER TABLE `hososuckhoe` DISABLE KEYS */;
INSERT INTO `hososuckhoe` VALUES ('HS001','BN01','Tiểu đường','Metformin','Penicillin','Covid-19, Viêm gan B','0123456789'),('HS002','BN02',NULL,'Paracetamol',NULL,'Cúm mùa','0123456790'),('HS003','BN03','Hen suyễn',NULL,'Hải sản','Uốn ván','0123456791'),('HS004','BN04',NULL,NULL,NULL,NULL,'0123456792'),('HS005','BN05',NULL,'Amoxicillin',NULL,NULL,'0123456793'),('HS006','BN06','Cao huyết áp',NULL,'Thuốc kháng viêm','Bạch hầu','0123456794'),('HS007','BN07',NULL,NULL,NULL,NULL,'0123456795'),('HS008','BN08','Suy tim','Digoxin',NULL,NULL,'0123456796'),('HS009','BN09',NULL,NULL,'Phấn hoa',NULL,'0123456797'),('HS010','BN10',NULL,'Ibuprofen',NULL,'Covid-19','0123456798'),('HS011','BN11',NULL,NULL,NULL,NULL,'0123456799'),('HS012','BN12',NULL,NULL,NULL,NULL,'0123456700'),('HS013','BN13','Viêm gan B',NULL,'Hải sản',NULL,'0123456701'),('HS014','BN14',NULL,NULL,NULL,'Thủy đậu','0123456702'),('HS015','BN15',NULL,'Aspirin',NULL,NULL,'0123456703'),('HS20','BN20','jnjfdnhfjbj','hjbch','dhbnbsh','dhejbjf','bbfn');
/*!40000 ALTER TABLE `hososuckhoe` ENABLE KEYS */;
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
