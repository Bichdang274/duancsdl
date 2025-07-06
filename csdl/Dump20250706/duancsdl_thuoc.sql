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
-- Table structure for table `thuoc`
--

DROP TABLE IF EXISTS `thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoc` (
  `mathuoc` varchar(20) NOT NULL,
  `tenthuoc` varchar(100) DEFAULT NULL,
  `hansudung` date DEFAULT NULL,
  `huongdansudung` text,
  PRIMARY KEY (`mathuoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoc`
--

LOCK TABLES `thuoc` WRITE;
/*!40000 ALTER TABLE `thuoc` DISABLE KEYS */;
INSERT INTO `thuoc` VALUES ('T001','Paracetamol','2026-12-31','Uống sau khi ăn, ngày 2 lần'),('T002','Amoxicillin','2025-08-15','Uống trước bữa ăn, ngày 3 lần'),('T003','Vitamin C','2027-03-10','Ngậm hoặc uống 1 viên/ngày'),('T004','Ibuprofen','2026-06-20','Uống sau khi ăn, không quá 3 viên/ngày'),('T005','Azithromycin','2025-11-01','Uống 1 viên mỗi ngày trong 3 ngày'),('T006','Omeprazole','2026-01-01','Uống trước bữa sáng 30 phút'),('T007','Loperamide','2027-04-22','Dùng khi bị tiêu chảy, không quá 2 viên/ngày'),('T008','Aspirin','2026-09-09','Uống sau khi ăn, ngày 1 viên'),('T009','Cetirizine','2027-02-18','Dùng để chống dị ứng, 1 viên/ngày'),('T010','Metformin','2025-10-10','Uống sau khi ăn, 2 lần/ngày'),('T011','Simvastatin','2026-07-07','Uống vào buổi tối, 1 viên/ngày'),('T012','Losartan','2027-01-15','Uống mỗi sáng, không bỏ liều'),('T013','Diazepam','2025-09-01','Uống trước khi ngủ, không lái xe sau khi dùng'),('T014','Ranitidine','2026-04-30','Uống trước khi ăn 30 phút'),('T015','Ciprofloxacin','2025-12-12','Uống xa bữa ăn, ngày 2 lần');
/*!40000 ALTER TABLE `thuoc` ENABLE KEYS */;
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
