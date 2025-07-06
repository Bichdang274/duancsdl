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
-- Table structure for table `phieukham`
--

DROP TABLE IF EXISTS `phieukham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieukham` (
  `maphieukham` varchar(20) NOT NULL,
  `trieuchung` text,
  `chuandoan` text,
  `ghichu` text,
  `malichhen` varchar(20) DEFAULT NULL,
  `mabacsi` varchar(20) DEFAULT NULL,
  `mahoso` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`maphieukham`),
  KEY `malichhen` (`malichhen`),
  KEY `mabacsi` (`mabacsi`),
  KEY `fk_phieukham_mahoso` (`mahoso`),
  CONSTRAINT `fk_phieukham_mahoso` FOREIGN KEY (`mahoso`) REFERENCES `hososuckhoe` (`mahoso`),
  CONSTRAINT `phieukham_ibfk_1` FOREIGN KEY (`malichhen`) REFERENCES `lichhen` (`malichhen`),
  CONSTRAINT `phieukham_ibfk_2` FOREIGN KEY (`mabacsi`) REFERENCES `bacsi` (`mabacsi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieukham`
--

LOCK TABLES `phieukham` WRITE;
/*!40000 ALTER TABLE `phieukham` DISABLE KEYS */;
INSERT INTO `phieukham` VALUES ('PK01','Sốt, ho','Cảm cúm','Uống thuốc, nghỉ ngơi','LH01','BS001','HS001'),('PK02','Đau đầu','Thiếu ngủ',NULL,'LH02','BS002','HS002'),('PK020','hdbchb','dhebfbh','jnnmdfn','LH20','BS001','HS20'),('PK03','Đau họng','Viêm họng','Đã kê đơn thuốc','LH03','BS003','HS003'),('PK04','Mệt mỏi','Căng thẳng',NULL,'LH04','BS004','HS004'),('PK05','Đau bụng','Rối loạn tiêu hóa','Hẹn tái khám sau 3 ngày','LH05','BS005','HS005'),('PK06','Khó thở','Hen suyễn','Theo dõi thêm','LH06','BS006','HS006'),('PK07','Đau ngực','Viêm phổi','Chụp X-quang','LH07','BS007','HS007'),('PK08','Chóng mặt','Thiếu máu','Bổ sung sắt','LH08','BS008','HS008'),('PK09','Ngứa da','Dị ứng','Đã kê thuốc bôi','LH09','BS009','HS009'),('PK10','Tiểu buốt','Viêm đường tiết niệu',NULL,'LH10','BS010','HS010'),('PK11','Khàn tiếng','Viêm thanh quản',NULL,'LH11','BS011','HS011'),('PK12','Buồn nôn','Ngộ độc thực phẩm','Yêu cầu nghỉ ngơi','LH12','BS012','HS012'),('PK13','Đau tai','Viêm tai giữa','Làm sạch tai','LH13','BS013','HS013'),('PK14','Khó ngủ','Rối loạn giấc ngủ','Tư vấn tâm lý','LH14','BS014','HS014'),('PK15','Đau khớp','Viêm khớp','Hẹn tái khám','LH15','BS015','HS015');
/*!40000 ALTER TABLE `phieukham` ENABLE KEYS */;
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
