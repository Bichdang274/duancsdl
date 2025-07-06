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
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `maNV` varchar(20) NOT NULL,
  `hoten` varchar(100) DEFAULT NULL,
  `luong` int DEFAULT NULL,
  `diachi` varchar(200) DEFAULT NULL,
  `gioitinh` varchar(10) DEFAULT NULL,
  `chucvu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`maNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES ('NV001','Nguyen Van A',10000000,'Hà Nội','Nam','Lễ tân'),('NV002','Tran Thi B',11000000,'TP. HCM','Nữ','Kế toán'),('NV003','Le Van C',10500000,'Đà Nẵng','Nam','Y tá'),('NV004','Pham Thi D',9500000,'Cần Thơ','Nữ','Thủ kho'),('NV005','Hoang Van E',12000000,'Hải Phòng','Nam','Lễ tân'),('NV006','Do Thi F',9800000,'Bắc Ninh','Nữ','Y tá'),('NV007','Nguyen Van G',12500000,'Thanh Hóa','Nam','Nhân sự'),('NV008','Trinh Thi H',10100000,'Vĩnh Phúc','Nữ','Lễ tân'),('NV009','Pham Van I',11500000,'Nghệ An','Nam','Quản lý'),('NV010','Nguyen Thi J',9600000,'Nam Định','Nữ','Y tá'),('NV011','Bui Van K',11700000,'Quảng Ninh','Nam','Kế toán'),('NV012','Le Thi L',9900000,'Bình Dương','Nữ','Tiếp tân'),('NV013','Nguyen Van M',10300000,'Long An','Nam','Bảo vệ'),('NV014','Tran Thi N',9700000,'Bến Tre','Nữ','Lễ tân'),('NV015','Pham Van O',10800000,'Huế','Nam','Thủ kho');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
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
