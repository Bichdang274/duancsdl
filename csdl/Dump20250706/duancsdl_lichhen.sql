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
-- Table structure for table `lichhen`
--

DROP TABLE IF EXISTS `lichhen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lichhen` (
  `malichhen` varchar(20) NOT NULL,
  `mabacsi` varchar(20) DEFAULT NULL,
  `mabenhnhan` varchar(20) DEFAULT NULL,
  `thoigianhen` date DEFAULT NULL,
  `tinhtrang` text,
  `ghichu` text,
  `maNV` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`malichhen`),
  KEY `mabacsi` (`mabacsi`),
  KEY `mabenhnhan` (`mabenhnhan`),
  KEY `fk_lichhen_manv` (`maNV`),
  CONSTRAINT `fk_lichhen_manv` FOREIGN KEY (`maNV`) REFERENCES `nhanvien` (`maNV`),
  CONSTRAINT `lichhen_ibfk_1` FOREIGN KEY (`mabacsi`) REFERENCES `bacsi` (`mabacsi`),
  CONSTRAINT `lichhen_ibfk_2` FOREIGN KEY (`mabenhnhan`) REFERENCES `benhnhan` (`mabenhnhan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lichhen`
--

LOCK TABLES `lichhen` WRITE;
/*!40000 ALTER TABLE `lichhen` DISABLE KEYS */;
INSERT INTO `lichhen` VALUES ('LH01','BS001','BN01','2025-07-01','Đã xác nhận','Khám tổng quát','NV001'),('LH02','BS002','BN02','2025-07-01','Chưa xác nhận',NULL,'NV002'),('LH03','BS003','BN03','2025-07-02','Đã hủy','Bệnh nhân xin hủy','NV003'),('LH04','BS004','BN04','2025-07-02','Đã xác nhận','Khám tai mũi họng','NV004'),('LH05','BS005','BN05','2025-07-02','Đã xác nhận',NULL,'NV005'),('LH06','BS006','BN06','2025-07-03','Chưa xác nhận',NULL,'NV006'),('LH07','BS007','BN07','2025-07-03','Đã xác nhận','Khám nội tổng quát','NV007'),('LH08','BS008','BN08','2025-07-04','Đã xác nhận',NULL,'NV008'),('LH09','BS009','BN09','2025-07-04','Chưa xác nhận',NULL,'NV009'),('LH10','BS010','BN10','2025-07-04','Đã xác nhận',NULL,'NV010'),('LH11','BS011','BN11','2025-07-05','Đã hủy','Bận việc cá nhân','NV011'),('LH12','BS012','BN12','2025-07-05','Đã xác nhận',NULL,'NV012'),('LH13','BS013','BN13','2025-07-06','Chưa xác nhận',NULL,'NV013'),('LH14','BS014','BN14','2025-07-06','Đã xác nhận','Tái khám định kỳ','NV014'),('LH15','BS015','BN15','2025-07-07','Đã xác nhận',NULL,'NV015'),('LH20','BS001','BN20','2006-07-10','fhngbfgc','bjbjgjhxhs','NV001');
/*!40000 ALTER TABLE `lichhen` ENABLE KEYS */;
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
