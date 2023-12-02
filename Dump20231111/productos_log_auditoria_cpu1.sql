CREATE DATABASE  IF NOT EXISTS `productos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `productos`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: productos
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `log_auditoria_cpu1`
--

DROP TABLE IF EXISTS `log_auditoria_cpu1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria_cpu1` (
  `ID_LOG` int NOT NULL AUTO_INCREMENT,
  `ACCION` varchar(10) DEFAULT NULL,
  `TABLA` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `FECHA_UPD_INS_DEL` date DEFAULT NULL,
  `HORA_UPD_INS_DEL` time DEFAULT NULL,
  PRIMARY KEY (`ID_LOG`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_auditoria_cpu1`
--

LOCK TABLES `log_auditoria_cpu1` WRITE;
/*!40000 ALTER TABLE `log_auditoria_cpu1` DISABLE KEYS */;
INSERT INTO `log_auditoria_cpu1` VALUES (1,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(2,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(3,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(4,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(5,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(6,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(7,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(8,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(9,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(10,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(11,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(12,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(13,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(14,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(15,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(16,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(17,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(18,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(19,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(20,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(21,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(22,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(23,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(24,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(25,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(26,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(27,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47'),(28,'INSERT','PROCESADORES','root@localhost','2023-11-05','11:00:47');
/*!40000 ALTER TABLE `log_auditoria_cpu1` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-11 12:28:21
