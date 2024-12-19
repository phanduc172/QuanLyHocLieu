-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: qlhoclieu
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `binhluan`
--

DROP TABLE IF EXISTS `binhluan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `binhluan` (
  `MaBinhLuan` int NOT NULL AUTO_INCREMENT,
  `MaTaiLieu` int NOT NULL,
  `MaNguoiDung` int NOT NULL,
  `NgayBinhLuan` datetime NOT NULL,
  `NoiDung` text NOT NULL,
  PRIMARY KEY (`MaBinhLuan`),
  KEY `MaTaiLieu` (`MaTaiLieu`),
  KEY `MaNguoiDung` (`MaNguoiDung`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binhluan`
--

LOCK TABLES `binhluan` WRITE;
/*!40000 ALTER TABLE `binhluan` DISABLE KEYS */;
INSERT INTO `binhluan` VALUES (1,4,2,'2024-04-25 00:00:00','Bài giảng rất chi tiết và dễ hiểu.'),(2,4,1,'2024-03-13 00:00:00','Giáo trình rất hữu ích cho người mới học C#.'),(3,2,4,'2024-03-12 00:00:00','Tiểu luận này cung cấp cái nhìn tổng quan về lịch sử Việt Nam.'),(4,1,5,'2024-03-13 00:00:00','Sách này rất hữu ích cho sinh viên ngành kinh tế.'),(5,4,4,'2024-03-13 00:00:00','Sách này rất hữu ích cho sinh.'),(6,1,5,'2024-03-13 00:00:00','Sách này rất hữu ích cho sinh.'),(7,2,6,'2024-03-13 00:00:00','Bài giảng rất chi tiết và dễ hiểu.'),(8,3,7,'2024-03-13 00:00:00','Bài giảng rất chi tiết và dễ hiểu.'),(9,1,3,'2024-03-13 00:00:00','Sách này rất hữu ích cho sinh.'),(10,4,5,'2024-04-28 23:22:06','123123'),(11,4,17,'2024-04-28 23:24:24','Tài liệu hợp lý đối với tôi'),(12,1,17,'2024-04-28 23:24:51','Hợp lý dành cho tôi'),(13,7,13,'2024-04-28 23:25:48','Tuyệt vời'),(14,3,5,'2024-04-28 23:53:38','test'),(15,5,5,'2024-04-28 23:56:15','Very good!'),(16,7,5,'2024-04-29 00:19:47','Hay lắm'),(17,4,5,'2024-05-03 01:10:57','123'),(18,20,5,'2024-05-14 23:43:59','Tài liệu hay <3'),(19,4,13,'2024-05-16 23:20:54','Tài liệu hay'),(20,4,13,'2024-05-16 23:21:05','Tài liệu tuyệt vời'),(21,2,5,'2024-05-18 13:33:40',''),(22,2,5,'2024-05-18 13:37:49','Tài liệu hay '),(23,59,5,'2024-05-25 12:13:12','Tài liệu hay'),(24,57,5,'2024-05-26 12:55:04','Tài liệu rất phù hợp với tôi '),(25,56,17,'2024-05-26 13:27:37','Very good!'),(26,66,17,'2024-05-26 13:33:25','Tôi đã tìm thầy tài liệu cần tìm. \r\nCảm ơn bạn!\r\n'),(27,64,17,'2024-05-26 13:34:08','Bài tập phù hợp với tôi'),(28,54,20,'2024-05-26 13:34:29','Đúng tài liệu tôi cần tìm'),(29,77,20,'2024-05-26 13:34:54','Cảm ơn bạn đã chia sẻ tài liệu này'),(30,82,16,'2024-05-26 13:35:47','Tôi đã tìm kiếm nó vài hôm nay!'),(31,84,16,'2024-05-26 13:36:10','Đúng nội dung tôi cần tìm'),(32,65,5,'2024-06-03 00:04:37','Very good!'),(33,77,5,'2024-06-03 00:05:00','Tài liệu hay '),(34,73,5,'2024-06-05 05:28:08','Tài liệu hay '),(35,73,5,'2024-06-05 07:46:04','Tài liệu hay aaa');
/*!40000 ALTER TABLE `binhluan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chuyennganh`
--

DROP TABLE IF EXISTS `chuyennganh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chuyennganh` (
  `MaChuyenNganh` varchar(50) NOT NULL,
  `TenChuyenNganh` varchar(250) NOT NULL,
  `MaKhoa` int NOT NULL,
  PRIMARY KEY (`MaChuyenNganh`),
  KEY `MaKhoa` (`MaKhoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chuyennganh`
--

LOCK TABLES `chuyennganh` WRITE;
/*!40000 ALTER TABLE `chuyennganh` DISABLE KEYS */;
INSERT INTO `chuyennganh` VALUES ('BC','Báo chí',2),('CNKTDTVT','Công nghệ kỹ thuật điện tử - Viễn thông',15),('CNKTHH','Công nghệ kỹ thuật hóa học',9),('CNPM','Công nghệ phần mềm',1),('CNSH','Công nghệ sinh học',10),('CTXH','Công tác xã hội',6),('DKTMX','Địa kỹ thuật xây dựng',11),('DPH','Đông phương học',14),('HH','Hóa học',9),('HN','Hán - Nôm',14),('KHMT','Khoa học máy tính',1),('KHMTR','Khoa học môi trường',12),('KT','Kiến trúc',3),('KTPM','Kỹ thuật phần mềm',1),('KTTDBD','Kỹ thuật trắc địa - bản đồ',11),('LS','Lịch sử',14),('MMT','Mạng máy tính',1),('NO','Khác',17),('PHD','Phan Đức',1),('QLATSKMT','Quản lý an toàn, sức khỏe và môi trường',12),('TCC','Toán',7),('TH','Triết học',4),('TTS','Truyền thông số',2),('VH','Văn học',13),('VLH','Vật lý học',8),('XHH','Xã hội học',5);
/*!40000 ALTER TABLE `chuyennganh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhgia`
--

DROP TABLE IF EXISTS `danhgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhgia` (
  `MaDanhGia` int NOT NULL AUTO_INCREMENT,
  `MaTaiLieu` int NOT NULL,
  `MaNguoiDung` int NOT NULL,
  `GiaTriDanhGia` int NOT NULL DEFAULT '5',
  PRIMARY KEY (`MaDanhGia`),
  KEY `MaTaiLieu` (`MaTaiLieu`),
  KEY `MaNguoiDung` (`MaNguoiDung`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhgia`
--

LOCK TABLES `danhgia` WRITE;
/*!40000 ALTER TABLE `danhgia` DISABLE KEYS */;
INSERT INTO `danhgia` VALUES (1,4,2,5),(2,4,1,3),(3,2,4,4),(4,1,5,4),(5,4,4,5),(6,1,5,3),(7,2,6,5),(8,3,7,4),(9,1,3,2),(10,4,5,5),(11,4,17,4),(12,1,17,3),(13,1,13,6),(14,3,5,4),(15,5,5,3),(16,7,5,4),(17,4,5,4),(18,20,5,4),(19,4,13,5),(20,4,13,4),(21,2,5,5),(22,2,5,5),(23,59,5,5),(24,57,5,5),(25,56,17,5),(26,66,17,5),(27,64,17,4),(28,54,20,5),(29,77,20,5),(30,82,16,5),(31,84,16,5),(32,65,5,5),(33,77,5,5),(34,73,5,5),(35,73,5,4);
/*!40000 ALTER TABLE `danhgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danhmuc`
--

DROP TABLE IF EXISTS `danhmuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danhmuc` (
  `MaDanhMuc` int NOT NULL AUTO_INCREMENT,
  `TenDanhMuc` varchar(50) NOT NULL,
  PRIMARY KEY (`MaDanhMuc`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danhmuc`
--

LOCK TABLES `danhmuc` WRITE;
/*!40000 ALTER TABLE `danhmuc` DISABLE KEYS */;
INSERT INTO `danhmuc` VALUES (1,'Bài giảng'),(2,'Giáo trình'),(3,'Đề thi'),(4,'Luận văn'),(5,'Bài tham khảo'),(6,'Đề cương'),(7,'Khóa luận'),(13,'Bài tập');
/*!40000 ALTER TABLE `danhmuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoatdongganday`
--

DROP TABLE IF EXISTS `hoatdongganday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hoatdongganday` (
  `MaHoatDong` int NOT NULL AUTO_INCREMENT,
  `MaNguoiDung` int NOT NULL,
  `LoaiHoatDong` varchar(255) NOT NULL,
  `MoTaHoatDong` text NOT NULL,
  `Ngay` datetime DEFAULT NULL,
  PRIMARY KEY (`MaHoatDong`)
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoatdongganday`
--

LOCK TABLES `hoatdongganday` WRITE;
/*!40000 ALTER TABLE `hoatdongganday` DISABLE KEYS */;
INSERT INTO `hoatdongganday` VALUES (1,5,'Đăng nhập','Người dùng \"phanduc\" đã đăng nhập vào hệ thống','2024-05-06 23:04:20'),(2,17,'Đăng nhập','Người dùng minhhang đã đăng nhập vào hệ thống','2024-05-06 23:04:20'),(3,15,'Đăng nhập','Người dùng @maidung đã đăng nhập vào hệ thống','2024-05-06 23:04:20'),(4,5,'Đăng nhập','Người dùng @phanduc đã đăng nhập vào hệ thống','2024-05-06 23:04:20'),(5,13,'Đăng nhập','Người dùng @test đã đăng nhập vào hệ thống','2024-05-06 23:04:20'),(6,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-06 23:04:20'),(7,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-06 23:04:20'),(8,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-07 23:04:20'),(9,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-07 23:04:20'),(10,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-07 23:04:20'),(11,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-07 23:04:20'),(12,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-09 23:04:20'),(13,13,'Tải lên','Vừa tải lên tài liệu: taiLieu','2024-05-09 23:04:20'),(14,17,'Tải lên','Người dùng @minhhang đã tải lên tài liệu: Opp Service','2024-05-09 23:04:20'),(15,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-09 23:04:20'),(16,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-10 23:04:20'),(17,5,'Cập nhật','Vừa cập nhật tài liệu: Tài liệu mẫu','2024-05-10 23:04:20'),(18,5,'Tải lên','Vừa tải lên tài liệu: Quản lý học liệu CSDL','2024-05-10 23:04:20'),(19,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-10 23:04:20'),(20,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-10 23:04:20'),(21,5,'Cập nhật','Vừa cập nhật tài liệu: Tài liệu mẫu','2024-05-11 23:04:20'),(22,5,'Cập nhật','Vừa cập nhật tài liệu: Tài liệu mẫu','2024-05-11 23:04:20'),(23,5,'Cập nhật','Vừa cập nhật tài liệu: Tài liệu mẫu','2024-05-11 23:04:20'),(24,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-12 23:04:20'),(25,14,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-12 23:04:20'),(26,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-12 23:04:20'),(27,13,'Đăng nhập','Vừa đăng nhập vào hệ thống',NULL),(28,13,'Đăng nhập','Vừa đăng nhập vào hệ thống',NULL),(29,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-14 00:45:45'),(30,13,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-14 00:47:26'),(31,13,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-14 00:47:47'),(32,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-14 00:49:47'),(33,5,'Cập nhật','Vừa cập nhật tài liệu: Tài liệu mẫu','2024-05-14 00:50:10'),(34,5,'Tải lên','Vừa tải lên tài liệu: Giáo trình Quá trình và Thiết bị','2024-05-14 00:52:36'),(35,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-14 23:39:26'),(36,5,'Tải lên','Vừa tải lên tài liệu: Cơ sở dữ liệu quan hệ và phân tích thiết kế','2024-05-14 23:46:50'),(37,5,'Cập nhật','Vừa cập nhật tài liệu: Cơ sở dữ liệu quan hệ và phân tích thiết kế','2024-05-14 23:53:49'),(38,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 00:42:35'),(39,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 00:51:31'),(40,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 00:52:56'),(41,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 00:53:01'),(42,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 00:53:52'),(43,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 00:57:50'),(44,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 01:00:54'),(45,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 01:04:58'),(46,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 01:06:30'),(47,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 01:11:23'),(48,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 01:16:29'),(49,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 01:21:41'),(50,5,'Tải lên','Vừa tải lên tài liệu: Cơ sở dữ liệu quan hệ','2024-05-15 01:21:56'),(51,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 01:25:41'),(52,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 01:28:09'),(53,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 01:33:09'),(54,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 01:36:21'),(55,17,'Tải lên','Vừa tải lên tài liệu: Cơ sở dữ liệu','2024-05-15 01:36:43'),(56,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 01:51:25'),(57,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 18:49:12'),(58,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:00:49'),(59,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:05:45'),(60,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:11:13'),(61,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:13:13'),(62,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:17:37'),(63,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:23:37'),(64,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:26:26'),(65,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:29:44'),(66,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:32:22'),(67,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:35:10'),(68,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:38:16'),(69,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:41:38'),(70,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:43:51'),(71,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:45:16'),(72,5,'Tải lên','Vừa tải lên tài liệu: Mạng truyền thông','2024-05-15 19:45:55'),(73,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:50:21'),(74,5,'Tải lên','Vừa tải lên tài liệu: 123','2024-05-15 19:50:28'),(75,18,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:53:24'),(76,18,'Tải lên','Vừa tải lên tài liệu: Công nghệ','2024-05-15 19:54:01'),(77,18,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 19:55:55'),(78,18,'Tải lên','Vừa tải lên tài liệu: Coong nghẹ 12312','2024-05-15 19:56:23'),(79,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 20:45:24'),(80,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-15 23:53:51'),(81,13,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-16 00:11:43'),(82,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-16 00:13:43'),(83,19,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-16 00:16:06'),(84,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-16 21:53:19'),(85,13,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-16 23:14:29'),(86,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-17 13:28:31'),(87,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-17 15:19:21'),(88,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-03 00:45:19'),(89,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-03 00:45:19'),(90,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-18 13:18:30'),(91,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-19 17:08:14'),(92,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-19 19:49:33'),(93,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-19 21:26:48'),(94,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-19 22:13:27'),(95,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-03 00:45:19'),(96,13,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-20 10:52:42'),(97,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-23 22:25:42'),(98,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-23 22:30:14'),(99,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-24 00:31:50'),(100,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-24 00:32:26'),(101,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-24 10:43:52'),(102,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-24 10:53:42'),(103,20,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-24 19:44:58'),(104,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 00:02:31'),(105,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 00:59:07'),(106,19,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:00:00'),(107,19,'Cập nhật','Vừa cập nhật tài liệu: Cơ sở dữ liệu quan hệ và phân tích thiết kế','2024-05-25 01:00:26'),(108,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:01:20'),(109,20,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:09:45'),(110,20,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:11:37'),(111,20,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:14:38'),(112,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:19:53'),(113,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:22:18'),(114,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:23:48'),(115,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:30:36'),(116,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:35:25'),(117,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:37:41'),(118,20,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:39:00'),(119,20,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:39:46'),(120,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:42:06'),(121,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:42:06'),(122,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:48:12'),(123,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 01:49:53'),(124,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 08:21:09'),(125,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 08:33:41'),(126,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 08:34:26'),(127,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 08:38:24'),(128,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 10:18:21'),(129,21,'Đăng ký','Đăng ký thành viên hệ thống','2024-05-25 10:24:58'),(130,19,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 10:27:49'),(131,19,'Tải lên','Tải lên tài liệu: XSTK: Bài tập và lời giải xác suất thống kê','2024-05-25 10:29:48'),(132,19,'Cập nhật','Vừa cập nhật tài liệu: Cơ sở dữ liệu quan hệ và phân tích thiết kế','2024-05-25 10:30:59'),(133,19,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 10:32:33'),(134,19,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 10:36:23'),(135,19,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 10:46:23'),(136,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 10:50:39'),(137,19,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 10:52:08'),(138,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 11:33:14'),(139,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 11:36:59'),(140,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 11:37:00'),(141,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 11:38:15'),(142,5,'Cập nhật','Vừa cập nhật tài liệu: Từ vựng TOEIC 600','2024-05-25 11:38:40'),(143,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 12:06:04'),(144,13,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 12:09:58'),(145,13,'Cập nhật','Vừa cập nhật ảnh đại diện','2024-05-25 12:10:19'),(146,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 12:10:47'),(147,17,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 12:33:53'),(148,17,'Tải lên','Tải lên tài liệu: Đại số tuyến tình | Tuần 1','2024-06-02 00:45:19'),(149,17,'Tải lên','Tải lên tài liệu: Đại số tuyến tình | Tuần 2','2024-06-02 00:45:19'),(150,17,'Tải lên','Tải lên tài liệu: Đại số tuyến tình | Tuần 3','2024-06-02 00:45:19'),(151,17,'Tải lên','Tải lên tài liệu: Đại số tuyến tình | Tuần 4','2024-06-02 00:45:19'),(152,17,'Tải lên','Tải lên tài liệu: Đại số tuyến tình | Tuần 5','2024-06-02 00:45:19'),(153,17,'Tải lên','Tải lên tài liệu: Đại số tuyến tình | Tuần 6','2024-06-02 00:45:19'),(154,17,'Tải lên','Tải lên tài liệu: Đại số tuyến tình | Tuần 7','2024-06-02 00:45:19'),(155,17,'Tải lên','Tải lên tài liệu: Đề cương Triết học','2024-05-25 12:41:21'),(156,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 12:48:17'),(162,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 12:57:54'),(163,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 12:59:24'),(164,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 13:09:40'),(165,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 13:13:59'),(166,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 17:28:35'),(167,20,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 17:29:21'),(168,20,'Cập nhật','Vừa cập nhật tài liệu: KTMT | Hệ thống số và ','2024-06-02 00:45:19'),(169,20,'Cập nhật','Vừa cập nhật tài liệu: KTMT | Chương 1: Hệ thống số và mạch logic ','2024-06-02 00:45:19'),(170,20,'Tải lên','Tải lên tài liệu: LT | Nhập môn lập trình - Chương 1','2024-06-03 00:45:19'),(171,20,'Tải lên','Tải lên tài liệu: LT | Nhập môn lập trình - Chương 2','2024-06-03 00:45:19'),(172,20,'Tải lên','Tải lên tài liệu: LT | Nhập môn lập trình - Chương 3','2024-06-03 00:45:19'),(173,20,'Tải lên','Tải lên tài liệu: LT | Nhập môn lập trình - Chương 4','2024-06-03 00:45:19'),(174,20,'Tải lên','Tải lên tài liệu: LT | Nhập môn lập trình - Chương 5','2024-06-03 00:45:19'),(175,20,'Tải lên','Tải lên tài liệu: LT | Nhập môn lập trình - Chương 6','2024-06-03 00:45:19'),(176,20,'Tải lên','Tải lên tài liệu: LT | Nhập môn lập trình - Chương 7','2024-06-03 00:45:19'),(177,20,'Tải lên','Tải lên tài liệu: LT | Nhập môn lập trình - Chương 8','2024-06-03 00:45:19'),(178,20,'Tải lên','Tải lên tài liệu: LT | Nhập môn lập trình - Chương 9','2024-06-03 00:45:19'),(179,20,'Tải lên','Tải lên tài liệu: KTMT | Chương 2: Tổng quan về máy tính điện tử','2024-05-25 17:40:10'),(180,20,'Tải lên','Tải lên tài liệu: KTMT | Chương 3: Tổ chức hoạt động của VXL','2024-05-25 17:40:49'),(181,20,'Tải lên','Tải lên tài liệu: Bài tập KTMT: Kiến trúc bộ lệnh','2024-05-25 17:45:17'),(182,20,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 17:46:19'),(183,20,'Cập nhật','Vừa cập nhật ảnh đại diện','2024-05-25 17:47:17'),(184,20,'Cập nhật','Vừa cập nhật ảnh đại diện','2024-05-25 17:47:46'),(185,19,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-25 17:47:58'),(186,19,'Cập nhật','Vừa cập nhật ảnh đại diện','2024-05-25 17:48:22'),(187,19,'Tải lên','Tải lên tài liệu: CSDL&GT: Độ phức tạp của thuật toán | Bài tập','2024-06-01 00:45:19'),(188,19,'Cập nhật','Vừa cập nhật tài liệu: CSDL: Độ phức tạp của thuật toán | Bài tập','2024-06-01 00:45:19'),(189,19,'Tải lên','Tải lên tài liệu: CSDL&GT: Lập trình đệ quy | Bài tập','2024-06-01 00:45:19'),(190,19,'Tải lên','Tải lên tài liệu: CSDL&GT: Danh sách liên kết | Bài tập','2024-06-01 00:45:19'),(191,19,'Tải lên','Tải lên tài liệu: CSDL&GT: Danh sách đa liên kết | Bài tập','2024-06-01 00:45:19'),(192,19,'Tải lên','Tải lên tài liệu: CSDL&GT: Cây nhị phân | Bài tập','2024-06-01 00:45:19'),(193,19,'Cập nhật','Vừa cập nhật tài liệu: CTGL&GT: Danh sách liên kết | Bài tập','2024-06-01 00:45:19'),(194,16,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-01 00:45:19'),(195,16,'Cập nhật','Vừa cập nhật ảnh đại diện','2024-06-01 00:45:19'),(196,16,'Tải lên','Tải lên tài liệu: QUẢN LÝ NGHIỆP VỤ KHÁM CHỮA BỆNH VÀ QUẢN LÝ GIƯỜNG BỆNH TẠI BỆNH VIỆN HOÀNG VIỆT THẮNG','2024-06-01 00:45:19'),(203,16,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-05-26 10:48:39'),(204,16,'Cập nhật','Vừa cập nhật tài liệu: Quản lý nghiệp vụ khám chữa bênh và quản lý giường bệnh tại bệnh viên Hoàng Việt Thắng','2024-05-26 10:49:29'),(418,5,'Tải lên','Tải lên tài liệu: NMTL | Nhập môn lập trình','2024-06-02 23:56:50'),(419,16,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-03 00:07:38'),(420,16,'Cập nhật','Vừa cập nhật ảnh đại diện','2024-06-03 00:07:54'),(421,19,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-03 00:27:35'),(422,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-03 00:38:56'),(423,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-03 00:44:05'),(424,5,'Tải lên','Tải lên tài liệu: NMTL | Các khái niệm cơ bản về lập trình','2024-06-03 00:45:19'),(426,26,'Đăng ký','Đăng ký thành viên hệ thống','2024-06-04 14:52:01'),(427,26,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-04 14:52:12'),(428,26,'Cập nhật','Vừa cập nhật ảnh đại diện','2024-06-04 14:52:35'),(430,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-04 15:11:09'),(431,5,'Tải lên','Tải lên tài liệu:  NMTL | Giới thiệu về ngôn ngữ lập trình C','2024-06-04 15:13:12'),(432,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-05 05:26:48'),(433,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-05 07:45:32'),(434,5,'Cập nhật','Vừa cập nhật ảnh đại diện','2024-06-05 07:46:25'),(435,5,'Tải lên','Tải lên tài liệu: Các kiểu Dữ liệu cơ số','2024-06-05 07:48:07'),(436,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-06-05 07:55:07'),(437,5,'Đăng nhập','Vừa đăng nhập vào hệ thống','2024-12-19 23:21:44'),(438,5,'Cập nhật','Vừa cập nhật ảnh đại diện','2024-12-19 23:22:38');
/*!40000 ALTER TABLE `hoatdongganday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoa` (
  `MaKhoa` int NOT NULL AUTO_INCREMENT,
  `TenKhoa` varchar(250) NOT NULL,
  PRIMARY KEY (`MaKhoa`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES (1,'Công nghệ thông tin'),(2,'Báo chí - Truyền thông'),(3,'Kiến trúc'),(4,'Lý luận chính trị'),(5,'Xã hội học'),(6,'Công tác xã hội'),(7,'Toán'),(8,'Vật lý'),(9,'Hóa học'),(10,'Sinh học'),(11,'Địa lý - Địa chất'),(12,'Môi trường'),(13,'Ngữ văn'),(14,'Lịch sử'),(15,'Điện tử - Viễn thông'),(16,'Địa lý - Địa chất'),(17,'Khác');
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoidung`
--

DROP TABLE IF EXISTS `nguoidung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoidung` (
  `MaNguoiDung` int NOT NULL AUTO_INCREMENT,
  `TenNguoiDung` varchar(50) NOT NULL,
  `MatKhau` varchar(255) NOT NULL,
  `HoTen` varchar(50) NOT NULL,
  `Anh` varchar(255) DEFAULT '/images/avt.png',
  `Email` varchar(50) DEFAULT NULL,
  `MaVaiTro` int NOT NULL DEFAULT '2',
  PRIMARY KEY (`MaNguoiDung`),
  KEY `MaVaiTro` (`MaVaiTro`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoidung`
--

LOCK TABLES `nguoidung` WRITE;
/*!40000 ALTER TABLE `nguoidung` DISABLE KEYS */;
INSERT INTO `nguoidung` VALUES (1,'admin','123','Admin','/images/avt.png','admin@admin.com',1),(2,'user','1234','User','/images/avt.png','email@gmai.com',2),(3,'thanhtruc','truc123','Nguyễn Thanh Trúc','/images/avt.png','thanhtruc@gmai.com',2),(4,'thanhson','son123','Nguyễn Thanh Sơn','/images/avt.png','thanhson@gmai.com',2),(5,'phanduc','123','Phan Đức','/upload/images/3dfdadf7-0ce6-45f9-b3ae-4ccada297cc5_Sưu tầm bởi tiktok tập làm designer (1).png','phanduc172@gmail.com',2),(6,'thanhhoa','hoa123','Nguyễn Thanh Hòa','/images/avt.png','thanhhoa@gmai.com',2),(8,'phuongthao','thao123','Nguyễn Phương Thảo','/images/avt.png','phuongthao@gmai.com',2),(13,'test','123','test','/upload/images/155ce9b9-88b4-444c-9a36-a1883ee4045b_avt.jpg','test@test.com',2),(14,'thuytrang ','123','Thùy Trang ','/upload/images/3d033e36-5471-4506-8f42-33d7d28ae827_avt.jpg','thuytrang@gmail.com',2),(16,'meocon','123a','Mèo','/upload/images/8fdbb610-3d8e-4c53-b3eb-99e3f58054a5_1.jpg','meo@gmail.com',2),(17,'minhhang','123','Minh Hằng ','/upload/images/da07cc40-4517-4fda-8776-58a4dc08ab2a_avt.jpg','minhhang2410@gmail.com',2),(19,'maidung','123','Nguyễn Mai Dũng','/upload/images/828ad7e9-1184-4f23-9634-73403a73518f_z5474241278766_a75bc60791241d2bfac802148a1305fc.jpg','maidung@gmail.com',2),(20,'ngockieu','123','Ngọc Kiều','/upload/images/0b7d7dd9-1cf7-4b91-9610-a04d19b27902_441548571_1865788543892315_3946523533866373111_n.jpg','ngockieu@gmail.com',2),(21,'tuedang','$2a$10$lLfo929zqXFvmScDBSrdcugFuocrv6CN99v3XfwyKTIcsXm7UJagW','Tuệ Đăng','/images/avt.png',NULL,2),(24,'thanhvien','$2a$10$r9s.ue/ZV2X8e9LwLBdKVetOlBIrTu2nubtMfqnLxX0GLkstNmNH.','Thành viên','/images/avt.png',NULL,2),(25,'nguyendung','$2a$10$CxvwY5qiZtvyiM5E1ZB9CeujD5Gdsl7ZT6iOYLmD9JJxQ9KXdRbau','Nguyễn Dũng','/upload/images/6d9115f4-8c35-40eb-a45b-9e2083adc5e3_Hinh-anh-avatar-nam-cool-ngau-dep.jpg',NULL,2),(26,'hoailinh','$2a$10$OnGtgeJ09k.Mps0dIi3L4.GwnTciN78zoWSz81vQIkry0PPZo3y/m','Hoài Linh','/upload/images/ad419681-ec18-4d1b-8a8d-a7fc3fb5b680_2.jpg','hoailinh@gmail.com',2);
/*!40000 ALTER TABLE `nguoidung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tailieu`
--

DROP TABLE IF EXISTS `tailieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tailieu` (
  `MaTaiLieu` int NOT NULL AUTO_INCREMENT,
  `TieuDe` varchar(255) NOT NULL,
  `MoTa` text NOT NULL,
  `DuongDanTep` varchar(255) NOT NULL,
  `AnhTaiLieu` varchar(255) NOT NULL,
  `TaiLenBoi` int NOT NULL,
  `NgayTaiLen` datetime NOT NULL,
  `SLTaiXuong` int NOT NULL DEFAULT '0',
  `MaDanhMuc` int NOT NULL,
  `MaChuyenNganh` varchar(50) DEFAULT NULL,
  `SoLuotTruyCap` int NOT NULL DEFAULT '0',
  `MaTrangThai` int NOT NULL DEFAULT '2',
  PRIMARY KEY (`MaTaiLieu`),
  KEY `MaDanhMuc` (`MaDanhMuc`),
  KEY `MaChuyenNganh` (`MaChuyenNganh`),
  KEY `TaiLenBoi` (`TaiLenBoi`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tailieu`
--

LOCK TABLES `tailieu` WRITE;
/*!40000 ALTER TABLE `tailieu` DISABLE KEYS */;
INSERT INTO `tailieu` VALUES (4,'Từ vựng TOEIC 600','Từ vựng TOEIC 600','/documents/tuvungtoeic.pdf','/images/toeic.png',17,'2024-03-10 00:00:00',6,5,'NO',106,1),(54,'Cơ sở dữ liệu quan hệ và phân tích thiết kế','Cơ sở dữ liệu quan hệ và phân tích thiết kế','/upload/documents/403a4920-7709-4747-abd1-0db6eeb3bc00_C%C6%A1+s%E1%BB%9F+d%E1%BB%AF+li%E1%BB%87u+quan+h%E1%BB%87+v%C3%A0+c%C3%B4ng+ngh%E1%BB%87+ph%C3%A2n+t%C3%ADch+-+thi%E1%BA%BFt+k%E1%BA%BF.pdf','/upload/images/thumbnail_1715777782941.jpg',19,'2024-05-15 19:56:22',0,2,'CNPM',41,1),(56,'Bài giảng Kỹ năng mềm','Bài giảng Kỹ năng mềm','/upload/documents/4f929545-7cd2-449f-b973-21d1a450d6a7_Bai+giang+ky+nang+mem+Online.pdf','/upload/images/thumbnail_1716573729569.jpg',17,'2024-05-25 01:02:09',0,1,'CTXH',42,1),(57,'KTMT | Chương 1: Hệ thống số và mạch logic ','KTMT | Hệ thống số và ','/upload/documents/0fd3f445-9753-453a-92b0-eeaac2441bbc_Ch%C6%B0%C6%A1ng+0_HeThongSo.pdf','/upload/images/thumbnail_1716574532737.jpg',20,'2024-05-25 01:15:31',2,1,'CNPM',32,2),(58,'Giáo trình Kiến trúc máy tính','Giáo trình Kiến trúc máy tính','/upload/documents/c8d3261d-9d74-4161-a301-96b22e842738_Kien+truc+may+tinh.pdf','/upload/images/thumbnail_1716575047123.jpg',17,'2024-05-25 01:24:07',7,1,'CNPM',11,2),(59,'Đề cương Lập trình hướng đối tượng','Đề cương Lập trình hướng đối tượng','/upload/documents/32c03631-9ba8-45c1-bf93-bc4ed3beb3ba_DeCuongLapTrinhHuongDoiTuong.pdf','/upload/images/thumbnail_1716575563294.jpg',17,'2024-05-25 01:32:43',0,6,'CNPM',5,2),(60,'Chương 1: Hệ thống số','Chương 1: Hệ thống số','/upload/documents/edae504d-f3c2-4b94-a0f2-ea0d8b948d06_Ch%C6%B0%C6%A1ng+0_HeThongSo.pdf','/upload/images/thumbnail_1716576628192.jpg',5,'2024-05-25 01:50:27',0,1,'CNPM',8,3),(63,'Đề cương Học phần CTDL và TT','Đề cương Học phần CTDL và TT','/upload/documents/da015172-ec4d-4d27-ad34-70fc66b0ff4a_Decuong+HP+CTDL+va+TT.doc','/upload/images/thumbnail_1716601268634.jpg',17,'2024-05-25 08:40:57',0,3,'CNPM',33,2),(64,'XSTK: Bài tập và lời giải xác suất thống kê','XSTK: Bài tập và lời giải xác suất thống kê','/upload/documents/b5dc0a9f-3c4a-423f-a196-61c1f38ba4a8_bai-tap-va-loi-giai-xac-suat-thong-ke.pdf','/upload/images/thumbnail_1716607787297.jpg',19,'2024-05-23 10:29:47',0,13,'TCC',10,2),(65,'Đại số tuyến tính | Tuần 1','Đại số tuyến tính | Tuần 1','/upload/documents/bdac7caf-b5bd-4110-9e72-c5c91ced0012_Tu%E1%BA%A7n+1.pdf','/upload/images/thumbnail_1716615397438.jpg',5,'2024-05-23 10:29:47',0,1,'TCC',39,1),(66,'Đại số tuyến tính | Tuần 2','Đại số tuyến tính | Tuần 2','/upload/documents/fc04ca08-13be-4f7a-9367-368df021429a_Tu%E1%BA%A7n+2.pdf','/upload/images/thumbnail_1716615431895.jpg',5,'2024-05-23 10:29:47',0,1,'TCC',8,1),(67,'Đại số tuyến tính | Tuần 3','Đại số tuyến tính | Tuần 3','/upload/documents/26b8481a-653d-4318-a0e6-51d3d87c6164_Tu%E1%BA%A7n+3.pdf','/upload/images/thumbnail_1716615451337.jpg',5,'2024-05-23 10:29:47',1,1,'TCC',6,1),(68,'Đại số tuyến tính | Tuần 4','Đại số tuyến tính | Tuần 4','/upload/documents/63bbf96f-e224-45fc-af66-0829a9eb4dbf_Tu%E1%BA%A7n+4.pdf','/upload/images/thumbnail_1716615470927.jpg',5,'2024-05-23 10:29:47',0,1,'TCC',1,1),(69,'Đại số tuyến tính | Tuần 5','Đại số tuyến tính | Tuần 5','/upload/documents/db6e4de1-2d58-4588-9175-a37862c473e2_Tu%E1%BA%A7n+5.pdf','/upload/images/thumbnail_1716615484947.jpg',5,'2024-05-23 10:29:47',0,1,'TCC',1,1),(70,'Đại số tuyến tính | Tuần 6','Đại số tuyến tính | Tuần 6','/upload/documents/9a247cfc-535d-428e-98b3-8acc73f03042_Tu%E1%BA%A7n+6.pdf','/upload/images/thumbnail_1716615499750.jpg',5,'2024-05-23 10:29:47',0,1,'TCC',2,1),(71,'Đại số tuyến tính | Tuần 7','Đại số tuyến tính | Tuần 7','/upload/documents/8615b6b8-5658-4e4b-b0a8-3adf698308ef_Tu%E1%BA%A7n+7.pdf','/upload/images/thumbnail_1716615516730.jpg',5,'2024-05-23 10:29:47',0,1,'TCC',2,1),(73,'LT | Nhập môn lập trình - Chương 1','LT | Nhập môn lập trình - Chương 1','/upload/documents/aef329da-ee19-4c73-81b2-8c321a824514_Chuong_01.pdf','/upload/images/thumbnail_1716633128175.jpg',20,'2024-05-24 17:32:07',0,2,'CNPM',5,1),(74,'LT | Nhập môn lập trình - Chương 2','LT | Nhập môn lập trình - Chương 2','/upload/documents/c1b6e224-2107-418b-bfd3-a697c94ec3ca_Chuong_02.pdf','/upload/images/thumbnail_1716633144974.jpg',20,'2024-05-24 17:32:25',0,2,'CNPM',1,1),(75,'LT | Nhập môn lập trình - Chương 3','LT | Nhập môn lập trình - Chương 3','/upload/documents/20781ad1-db0b-44c9-abe4-9a06e67b5d5e_Chuong_03.pdf','/upload/images/thumbnail_1716633157880.jpg',20,'2024-05-24 17:32:25',0,2,'CNPM',1,1),(76,'LT | Nhập môn lập trình - Chương 4','LT | Nhập môn lập trình - Chương 4','/upload/documents/7667b97b-c71d-4ab7-845d-d92cb076efb1_Chuong_04.pdf','/upload/images/thumbnail_1716633173008.jpg',20,'2024-05-24 17:32:25',0,2,'CNPM',0,1),(77,'LT | Nhập môn lập trình - Chương 5','LT | Nhập môn lập trình - Chương 5','/upload/documents/c144c055-3c0d-4a98-9136-90b6858abbf4_Chuong_05.pdf','/upload/images/thumbnail_1716633184764.jpg',20,'2024-05-24 17:32:25',0,2,'CNPM',9,1),(78,'LT | Nhập môn lập trình - Chương 6','LT | Nhập môn lập trình - Chương 6','/upload/documents/8e45acbd-5aa2-4564-802b-0190abc3da88_Chuong_06.pdf','/upload/images/thumbnail_1716633197113.jpg',20,'2024-05-24 17:32:25',0,2,'CNPM',0,1),(79,'LT | Nhập môn lập trình - Chương 7','LT | Nhập môn lập trình - Chương 7','/upload/documents/87982fa7-28a3-43d9-bd10-9cde468bb8dc_Chuong_07.pdf','/upload/images/thumbnail_1716633211178.jpg',20,'2024-05-24 17:32:25',0,2,'CNPM',0,1),(80,'LT | Nhập môn lập trình - Chương 8','LT | Nhập môn lập trình - Chương 8','/upload/documents/109aad41-9c42-4bce-bfd6-c4aea640204a_Chuong_08.pdf','/upload/images/thumbnail_1716633224195.jpg',20,'2024-05-24 17:32:25',0,2,'CNPM',3,1),(81,'LT | Nhập môn lập trình - Chương 9','LT | Nhập môn lập trình - Chương 9','/upload/documents/9bfaab02-f121-4128-a29f-a05560f2be23_Chuong_09.pdf','/upload/images/thumbnail_1716633243544.jpg',20,'2024-05-24 17:32:25',0,2,'CNPM',0,1),(82,'KTMT | Chương 2: Tổng quan về máy tính điện tử','KTMT | Chương 2: Tổng quan về máy tính điện tử','/upload/documents/d6cbd0ed-4f0b-4f23-8acf-25bf9598c8d9_Ch%C6%B0%C6%A1ng+2.pdf','/upload/images/thumbnail_1716633609768.jpg',20,'2024-05-25 17:40:09',0,2,'CNPM',3,1),(83,'KTMT | Chương 3: Tổ chức hoạt động của VXL','KTMT | Chương 3: Tổ chức hoạt động của VXL','/upload/documents/ce254045-a698-4bef-beaf-88cf5bcda160_Ch%C6%B0%C6%A1ng+3.pdf','/upload/images/thumbnail_1716633649039.jpg',20,'2024-05-25 17:40:48',0,1,'CNPM',1,1),(84,'Bài tập KTMT: Kiến trúc bộ lệnh','Bài tập KTMT: Kiến trúc bộ lệnh','/upload/documents/39c8a990-2c7e-4d57-96d9-c885458cf074_BaiTapTuHoc_KienTrucBoLenh.pdf','/upload/images/thumbnail_1716633916760.jpg',20,'2024-05-25 17:45:17',0,13,'CNPM',2,1),(85,'CSDGTL: Độ phức tạp của thuật toán | Bài tập','CSDLGT: Độ phức tạp của thuật toán | Bài tập','/upload/documents/62d75fae-4f08-4aca-b846-6e53901194b3_Bai+tap+1+-+Do+phuc+tap+TT.docx','/upload/images/thumbnail_1716634311568.jpg',19,'2024-05-23 17:51:51',1,13,'KTPM',7,1),(86,'CSDLGT: Lập trình đệ quy | Bài tập','CSDL&GT: Lập trình đệ quy | Bài tập','/upload/documents/deeb1231-aca5-45f8-8f6e-42a9139c94ea_Bai+tap+2+-+Lap+trinh+De+quy.docx','/upload/images/thumbnail_1716634376784.jpg',19,'2024-05-23 17:51:51',0,13,'KTPM',4,1),(87,'CSDLGT: Danh sách liên kết | Bài tập','CTGL&GT:: Danh sách liên kết | Bài tập','/upload/documents/4568203f-3fbe-4daf-857d-521286e1545a_Bai+tap+3+-+Danh+sach+lien+ket.docx','/upload/images/thumbnail_1716634404815.jpg',19,'2024-05-23 17:51:51',0,13,'KTPM',1,1),(88,'CSDLGT: Danh sách đa liên kết | Bài tập','CSDL&GT: Danh sách đa liên kết | Bài tập','/upload/documents/404f7077-1133-4c88-ae20-1fdb0d1aef9e_Bai+tap+4+-+Danh+sach+da+lien+ket.docx','/upload/images/thumbnail_1716634420632.jpg',19,'2024-05-23 17:51:51',0,13,'KTPM',1,1),(89,'CSDLGT: Cây nhị phân | Bài tập','CSDL&GT: Cây nhị phân | Bài tập','/upload/documents/7525c74f-3006-499a-87dc-f2a6e1b3b6e6_Bai+tap+5+-+Cay+nhi+phan.docx','/upload/images/thumbnail_1716634441924.jpg',19,'2024-05-23 17:51:51',0,13,'KTPM',0,2),(90,'Quản lý nghiệp vụ khám chữa bênh và quản lý giường bệnh tại bệnh viên Hoàng Việt Thắng','Quản lý nghiệp vụ khám chữa bênh và quản lý giường bệnh tại bệnh viên Hoàng Việt Thắng','/upload/documents/c01a4d29-d730-49c1-91d4-fa41b7c763e7_B%E1%BB%86NH+VI%E1%BB%86N+HO%C3%80NG+VI%E1%BB%86T+TH%E1%BA%AENG.pdf','/upload/images/thumbnail_1716634831153.jpg',16,'2024-05-25 18:00:30',0,5,'CNPM',2,2),(91,'NMTL | Nhập môn lập trình','NMTL | Nhập môn lập trình','/upload/documents/129ba1ef-ff96-4e16-b9cb-99eae15ace68_NMLT_C00_GioiThieuMonHoc.pdf','/upload/images/thumbnail_1717347409864.jpg',5,'2024-06-02 23:56:49',0,1,'KHMT',3,1),(92,'NMTL | Các khái niệm cơ bản về lập trình','NMTL | Các khái niệm cơ bản về lập trình','/upload/documents/d0b80397-35dd-48d8-b7f7-ba13d5d469e3_NMLT_C05_CacKhaiNiemCoBanVeLapTrinh.pdf','/upload/images/thumbnail_1717350319141.jpg',5,'2024-06-03 00:45:18',0,1,'CNPM',3,1),(93,' NMTL | Giới thiệu về ngôn ngữ lập trình C',' NMTL | Giới thiệu về ngôn ngữ lập trình C','/upload/documents/2d220440-37c5-4009-ac70-2b57e5191d2a_NMLT_C06_GioiThieuNNLTC.pdf','/upload/images/thumbnail_1717488792228.jpg',5,'2024-06-04 15:13:11',0,1,'CNPM',0,1),(94,'Các kiểu Dữ liệu cơ số','Các kiểu Dữ liệu cơ số','/upload/documents/cb0a2baa-aa6d-48f9-bf95-a31ac22ff868_NMLT_C07_CacKieuDuLieuCoSo.pdf','/upload/images/thumbnail_1717548487000.jpg',5,'2024-06-05 07:48:06',0,1,'KHMT',1,1);
/*!40000 ALTER TABLE `tailieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trangthaitailieu`
--

DROP TABLE IF EXISTS `trangthaitailieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trangthaitailieu` (
  `MaTrangThai` int NOT NULL AUTO_INCREMENT,
  `MoTaTrangThai` varchar(45) NOT NULL,
  PRIMARY KEY (`MaTrangThai`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trangthaitailieu`
--

LOCK TABLES `trangthaitailieu` WRITE;
/*!40000 ALTER TABLE `trangthaitailieu` DISABLE KEYS */;
INSERT INTO `trangthaitailieu` VALUES (1,'Đã duyệt'),(2,'Chờ duyệt'),(3,'Từ chối');
/*!40000 ALTER TABLE `trangthaitailieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truycaptailieu`
--

DROP TABLE IF EXISTS `truycaptailieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truycaptailieu` (
  `MaTruyCapTaiLieu` int NOT NULL AUTO_INCREMENT,
  `MaTaiLieu` int DEFAULT NULL,
  `MaNguoiDung` int DEFAULT NULL,
  `NgayTruyCap` date DEFAULT NULL,
  `SoLanTruyCap` int DEFAULT NULL,
  PRIMARY KEY (`MaTruyCapTaiLieu`),
  KEY `MaTaiLieu` (`MaTaiLieu`),
  KEY `MaNguoiDung` (`MaNguoiDung`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truycaptailieu`
--

LOCK TABLES `truycaptailieu` WRITE;
/*!40000 ALTER TABLE `truycaptailieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `truycaptailieu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vaitro`
--

DROP TABLE IF EXISTS `vaitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vaitro` (
  `MaVaiTro` int NOT NULL AUTO_INCREMENT,
  `TenVaiTro` varchar(50) NOT NULL,
  PRIMARY KEY (`MaVaiTro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaitro`
--

LOCK TABLES `vaitro` WRITE;
/*!40000 ALTER TABLE `vaitro` DISABLE KEYS */;
INSERT INTO `vaitro` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `vaitro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'qlhoclieu'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-19 23:30:56
