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
-- Table structure for table `nguoithan`
--

DROP TABLE IF EXISTS `nguoithan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoithan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mabenhnhan` varchar(20) NOT NULL,
  `hoten` varchar(100) NOT NULL,
  `moiquanhe` varchar(50) DEFAULT NULL,
  `sdt` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoithan`
--

LOCK TABLES `nguoithan` WRITE;
/*!40000 ALTER TABLE `nguoithan` DISABLE KEYS */;
INSERT INTO `nguoithan` VALUES (2,'BN02','Tran Van B','Bố','0987654302'),(3,'BN03','Le Thi C','Chị gái','0987654303'),(4,'BN04','Pham Van D','Anh trai','0987654304'),(5,'BN05','Hoang Thi E','Vợ','0987654305'),(6,'BN06','Do Van F','Chồng','0987654306'),(7,'BN07','Nguyen Van G','Con trai','0987654307'),(8,'BN08','Trinh Thi H','Con gái','0987654308'),(9,'BN09','Pham Thi I','Em gái','0987654309'),(10,'BN10','Nguyen Van J','Em trai','0987654310'),(11,'BN11','Bui Thi K','Mẹ','0987654311'),(12,'BN12','Le Van L','Bố','0987654312'),(13,'BN13','Nguyen Thi M','Chị gái','0987654313'),(14,'BN14','Tran Van N','Anh trai','0987654314'),(15,'BN15','Pham Thi O','Bạn đời','0987654315'),(21,'BN01','Đặng Thị A','bố','0974012674');
/*!40000 ALTER TABLE `nguoithan` ENABLE KEYS */;
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
