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
-- Table structure for table `log_auditoria_graf2`
--

DROP TABLE IF EXISTS `log_auditoria_graf2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_auditoria_graf2` (
  `ID_LOG2` int NOT NULL AUTO_INCREMENT,
  `LOG_MODELO` varchar(50) DEFAULT NULL,
  `LOG_idgraf` int DEFAULT NULL,
  `CAMPO_NUEVO` varchar(300) DEFAULT NULL,
  `CAMPO_ANTERIOR` varchar(300) DEFAULT NULL,
  `ACCION` varchar(10) DEFAULT NULL,
  `TABLA` varchar(50) DEFAULT NULL,
  `USUARIO` varchar(100) DEFAULT NULL,
  `FECHA_UPD_INS_DEL` date DEFAULT NULL,
  `HORA_UPD_INS_DEL` time DEFAULT NULL,
  PRIMARY KEY (`ID_LOG2`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_auditoria_graf2`
--

LOCK TABLES `log_auditoria_graf2` WRITE;
/*!40000 ALTER TABLE `log_auditoria_graf2` DISABLE KEYS */;
INSERT INTO `log_auditoria_graf2` VALUES (1,'ASUS TUF GAMING GEFORCE RTX 4080 ',1,NULL,NULL,'INSERT','GRAFICAS','root@localhost','2023-11-05','11:00:47'),(2,'Sapphire Pulse AMD Radeon RX 7900 XTX 24GB GDDR6',2,NULL,NULL,'INSERT','GRAFICAS','root@localhost','2023-11-05','11:00:47'),(3,'Sapphire Pulse AMD Radeon RX 7900 XT 20GB GDDR6',3,NULL,NULL,'INSERT','GRAFICAS','root@localhost','2023-11-05','11:00:47'),(4,NULL,NULL,'GRAFICA_NUEVA: Sapphire Pulse AMD Radeon RX 7900 XTX 24GB GDDR6 ID_GRAF_NUEVA : 2','GRAFICA_ANTERIOR: Sapphire Pulse AMD Radeon RX 7900 XTX 24GB GDDR6 ID_GRAF_ANTERIOR : 2','UPDATE','GRAFICAS',NULL,'2023-11-05','11:02:23');
/*!40000 ALTER TABLE `log_auditoria_graf2` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-11 12:28:22
