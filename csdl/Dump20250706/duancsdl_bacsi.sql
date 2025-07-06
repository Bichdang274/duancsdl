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
-- Table structure for table `bacsi`
--

DROP TABLE IF EXISTS `bacsi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bacsi` (
  `mabacsi` varchar(255) NOT NULL,
  `tenbacsi` varchar(255) DEFAULT NULL,
  `chuyenkhoa` varchar(255) DEFAULT NULL,
  `luong` int DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `gioitinh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mabacsi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bacsi`
--

LOCK TABLES `bacsi` WRITE;
/*!40000 ALTER TABLE `bacsi` DISABLE KEYS */;
INSERT INTO `bacsi` VALUES ('BS001','Nguyễn Văn A','Chuyên khoa 1',15000000,'Đống Đa, Hà Nội','Nam'),('BS002','Nguyễn Hồng A','Chuyên khoa 7',15000000,'Đông Anh','Nữ'),('BS003','Bac Si C','Chuyen khoa 4',12150000,'Dia chi 3, Quan 4','Nữ'),('BS004','Bac Si D','Chuyen khoa 5',12200000,'Dia chi 4, Quan 5','Nam'),('BS005','Bac Si E','Chuyen khoa 1',12250000,'Dia chi 5, Quan 6','Nữ'),('BS006','Bac Si F','Chuyen khoa 2',12300000,'Dia chi 6, Quan 7','Nam'),('BS007','Bac Si G','Chuyen khoa 3',12350000,'Dia chi 7, Quan 8','Nữ'),('BS008','Bac Si H','Chuyen khoa 4',12400000,'Dia chi 8, Quan 9','Nam'),('BS009','Bac Si I','Chuyen khoa 5',12450000,'Dia chi 9, Quan 10','Nữ'),('BS010','Bac Si J','Chuyen khoa 1',12500000,'Dia chi 10, Quan 1','Nam'),('BS011','Bac Si K','Chuyen khoa 2',12550000,'Dia chi 11, Quan 2','Nữ'),('BS012','Bac Si L','Chuyen khoa 3',12600000,'Dia chi 12, Quan 3','Nam'),('BS013','Bac Si M','Chuyen khoa 4',12650000,'Dia chi 13, Quan 4','Nữ'),('BS014','Bac Si N','Chuyen khoa 5',12700000,'Dia chi 14, Quan 5','Nam'),('BS015','Nguyễn Thị Mai','Chuyên khoa 5',13000000,'TP. Pleiku, Gia Lai','Nữ');
/*!40000 ALTER TABLE `bacsi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-06 18:45:05
