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
-- Table structure for table `benhnhan`
--

DROP TABLE IF EXISTS `benhnhan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `benhnhan` (
  `mabenhnhan` varchar(20) NOT NULL,
  `socccd` int DEFAULT NULL,
  `sothebaohiemyte` varchar(50) DEFAULT NULL,
  `tenbenhnhan` varchar(100) DEFAULT NULL,
  `ngaysinh` date DEFAULT NULL,
  `gioitinh` varchar(10) DEFAULT NULL,
  `diachi` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`mabenhnhan`),
  UNIQUE KEY `socccd` (`socccd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `benhnhan`
--

LOCK TABLES `benhnhan` WRITE;
/*!40000 ALTER TABLE `benhnhan` DISABLE KEYS */;
INSERT INTO `benhnhan` VALUES ('BN01',12345678,'BHYT001','Nguyen Van A','2000-05-12','Nam','Hà Nội'),('BN02',112345679,'BHYT002','Tran Thi B','1998-11-22','Nữ','TP. HCM'),('BN03',212345680,'BHYT003','Le Van C','2001-03-18','Nam','Đà Nẵng'),('BN04',312345681,'BHYT004','Pham Thi D','1995-08-30','Nữ','Cần Thơ'),('BN05',412345682,'BHYT005','Hoang Van E','1989-12-05','Nam','Hải Phòng'),('BN06',512345683,'BHYT006','Do Thi F','1996-07-14','Nữ','Bắc Ninh'),('BN07',612345684,'BHYT007','Nguyen Van G','2002-02-02','Nam','Thanh Hóa'),('BN08',712345685,'BHYT008','Trinh Thi H','1993-04-20','Nữ','Vĩnh Phúc'),('BN09',812345686,'BHYT009','Pham Van I','2000-09-09','Nam','Nghệ An'),('BN10',912345687,'BHYT010','Nguyen Thi J','1997-10-17','Nữ','Nam Định'),('BN11',123456788,'BHYT011','Bui Van K','1994-01-25','Nam','Quảng Ninh'),('BN12',223456789,'BHYT012','Le Thi L','1992-06-06','Nữ','Bình Dương'),('BN13',323456780,'BHYT013','Nguyen Van M','1999-11-11','Nam','Long An'),('BN14',423456781,'BHYT014','Tran Thi N','2001-01-01','Nữ','Bến Tre'),('BN15',523456782,'BHYT015','Pham Van O','1988-03-03','Nam','Huế'),('BN20',21155,'14455','jhdcbjhbc','2006-04-27','nữ','Đông Anh');
/*!40000 ALTER TABLE `benhnhan` ENABLE KEYS */;
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
