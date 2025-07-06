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
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoadon` (
  `mahoadon` varchar(20) NOT NULL,
  `maphieukham` varchar(20) DEFAULT NULL,
  `mabenhnhan` varchar(20) DEFAULT NULL,
  `ngaylap` date DEFAULT NULL,
  `trangthai` varchar(20) DEFAULT NULL,
  `soluong` int DEFAULT NULL,
  `donvitinh` varchar(20) DEFAULT NULL,
  `tenthuoc` varchar(100) DEFAULT NULL,
  `dongia` varchar(20) DEFAULT NULL,
  `giadichvu` int DEFAULT NULL,
  `thanhtien` int DEFAULT NULL,
  PRIMARY KEY (`mahoadon`),
  KEY `maphieukham` (`maphieukham`),
  KEY `mabenhnhan` (`mabenhnhan`),
  CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`maphieukham`) REFERENCES `phieukham` (`maphieukham`),
  CONSTRAINT `hoadon_ibfk_2` FOREIGN KEY (`mabenhnhan`) REFERENCES `benhnhan` (`mabenhnhan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES ('HD01','PK01','BN01','2025-07-01','Đã thanh toán',10,'viên','Paracetamol','3000',100000,130000),('HD02','PK02','BN02','2025-07-01','Chưa thanh toán',5,'viên','Vitamin B1','2000',100000,110000),('HD03','PK03','BN03','2025-07-02','Đã thanh toán',7,'viên','Amoxicillin','5000',100000,135000),('HD04','PK04','BN04','2025-07-02','Đã thanh toán',1,'ống','Vitamin C','10000',100000,110000),('HD05','PK05','BN05','2025-07-02','Đã thanh toán',3,'viên','Berberin','4000',100000,112000),('HD06','PK06','BN06','2025-07-03','Chưa thanh toán',2,'chai','Xịt mũi','25000',100000,150000),('HD07','PK07','BN07','2025-07-03','Đã thanh toán',6,'viên','Clarithromycin','10000',100000,160000),('HD08','PK08','BN08','2025-07-04','Đã thanh toán',4,'viên','Sắt bổ sung','3000',100000,112000),('HD09','PK09','BN09','2025-07-04','Chưa thanh toán',1,'tuýp','Thuốc bôi da','15000',100000,115000),('HD10','PK10','BN10','2025-07-04','Đã thanh toán',3,'viên','Norfloxacin','7000',100000,121000),('HD11','PK11','BN11','2025-07-05','Chưa thanh toán',2,'viên','Thuốc ngậm','5000',100000,110000),('HD12','PK12','BN12','2025-07-05','Đã thanh toán',5,'viên','Smecta','4000',100000,120000),('HD13','PK13','BN13','2025-07-06','Đã thanh toán',2,'ống','Thuốc tai','8000',100000,116000),('HD14','PK14','BN14','2025-07-06','Đã thanh toán',2,'viên','Melatonin','15000',100000,130000),('HD15','PK15','BN15','2025-07-07','Đã thanh toán',3,'viên','Thuốc giảm đau','6000',100000,118000),('HD20','PK020','BN20','2025-07-24','bcd',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
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
