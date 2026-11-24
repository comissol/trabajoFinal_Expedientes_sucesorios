CREATE DATABASE  IF NOT EXISTS `estudio_sucesiones` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `estudio_sucesiones`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: estudio_sucesiones
-- ------------------------------------------------------
-- Server version	8.4.11

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
-- Table structure for table `bienes`
--

DROP TABLE IF EXISTS `bienes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bienes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expedienteId` int NOT NULL,
  `tipo` enum('Inmueble','Automotor','Otro') COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Por ejemplo dirección o dominio',
  `creadoPor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modificadoPor` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_bienes_expediente` (`expedienteId`,`tipo`),
  CONSTRAINT `fk_bienes_expedientes` FOREIGN KEY (`expedienteId`) REFERENCES `expedientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bienes`
--

LOCK TABLES `bienes` WRITE;
/*!40000 ALTER TABLE `bienes` DISABLE KEYS */;
INSERT INTO `bienes` VALUES (1,1,'Inmueble','Casa en calle Alsina 450, Bahía Blanca','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(2,3,'Inmueble','Departamento en Zelarrayán 220, Bahía Blanca','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(3,3,'Automotor','Dominio AB123CD','mlopez','Lucila Comisso','2026-11-10 20:08:07','2026-11-23 14:51:37'),(4,4,'Inmueble','Casa en Brown 1350, Bahía Blanca','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(5,5,'Otro','Acciones de S.A.','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(6,9,'Inmueble','Lote en Ingeniero White','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(7,9,'Automotor','Dominio AC456EF','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(8,9,'Automotor','Dominio AD789GH','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(9,10,'Inmueble','Departamento en Chiclana 780, Bahía Blanca','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(10,13,'Otro','Depósito a plazo fijo','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(11,18,'Inmueble','Casa en Donado 95, Bahía Blanca','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(12,19,'Automotor','Dominio AE321IJ','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(13,23,'Inmueble','Cuota parte indivisa sobre campo','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(14,29,'Inmueble','Casa en Estomba 610, Bahía Blanca','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(15,33,'Automotor','Dominio AF654KL','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(16,34,'Inmueble','Departamento en Sarmiento 143, Bahía Blanca','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(17,1,'Inmueble','Dpto Sarmiento oficina','mlopez','mlopez','2026-11-17 21:50:59','2026-11-17 21:50:59'),(18,1,'Inmueble','Dpto Sarmiento oficina','mlopez','mlopez','2026-11-17 21:51:46','2026-11-17 21:51:46'),(19,1,'Inmueble','Dpto Sarmiento oficina','mlopez','mlopez','2026-11-17 21:52:27','2026-11-17 21:52:27'),(20,1,'Automotor','fiat','mlopez','mlopez','2026-11-17 21:55:36','2026-11-17 21:55:36'),(25,35,'Otro','batata','Lucila Comisso',NULL,'2026-11-23 15:01:49','2026-11-23 15:01:49'),(26,34,'Otro','batata','Lucila Comisso',NULL,'2026-11-23 15:08:46','2026-11-23 15:08:46');
/*!40000 ALTER TABLE `bienes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentos`
--

DROP TABLE IF EXISTS `documentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expedienteId` int NOT NULL,
  `tipoDocumentoId` int NOT NULL,
  `personaId` int DEFAULT NULL COMMENT 'RN-07: persona o bien, nunca ambos (lo valida la API)',
  `bienId` int DEFAULT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` enum('Pendiente','Recibido','Validado','No aplica') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pendiente',
  `obligatorio` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 = generado por la plantilla; 0 = Otros (RN-12)',
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Obligatorio al rechazar o marcar No aplica (lo valida la API)',
  `estadoActualizadoPor` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estadoActualizadoEn` datetime DEFAULT NULL,
  `creadoPor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modificadoPor` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_documentos_tipos` (`tipoDocumentoId`),
  KEY `fk_documentos_personas` (`personaId`),
  KEY `fk_documentos_bienes` (`bienId`),
  KEY `idx_documentos_estado` (`expedienteId`,`estado`),
  CONSTRAINT `fk_documentos_bienes` FOREIGN KEY (`bienId`) REFERENCES `bienes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_documentos_expedientes` FOREIGN KEY (`expedienteId`) REFERENCES `expedientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_documentos_personas` FOREIGN KEY (`personaId`) REFERENCES `personas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_documentos_tipos` FOREIGN KEY (`tipoDocumentoId`) REFERENCES `tipos_documento` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentos`
--

LOCK TABLES `documentos` WRITE;
/*!40000 ALTER TABLE `documentos` DISABLE KEYS */;
INSERT INTO `documentos` VALUES (2,2,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(3,3,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(4,4,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(5,5,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(6,6,5,NULL,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(7,7,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(8,8,5,NULL,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(9,9,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(10,10,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(11,11,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(12,12,5,NULL,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(13,13,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(14,14,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(15,15,5,NULL,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(16,16,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(17,1,5,1,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','Lucila Comisso','2026-11-10 20:08:07','2026-11-22 19:26:24'),(18,18,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(19,19,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(20,20,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(21,21,5,NULL,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(22,22,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(23,23,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(24,24,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(25,25,5,NULL,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(26,26,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(27,27,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(28,28,5,NULL,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(29,29,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(30,30,5,NULL,NULL,NULL,'No aplica',1,'Actuó por derecho propio, sin apoderado','mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(31,31,5,NULL,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(32,32,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(33,33,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(34,34,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(35,35,5,NULL,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(36,1,1,1,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(37,1,4,1,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(38,1,4,64,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(39,1,3,64,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(40,2,1,2,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(41,2,4,2,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(42,2,4,69,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(43,2,2,69,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(44,3,1,3,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(45,3,4,3,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(46,3,4,70,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(47,3,2,70,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(48,3,4,71,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(49,3,2,71,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(50,4,1,4,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(51,4,4,4,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(52,4,4,65,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(53,4,3,65,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(54,5,1,5,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(55,5,4,5,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(56,6,1,6,NULL,NULL,'Recibido',1,NULL,'sherrera','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(57,6,4,6,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(58,7,1,7,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(59,7,4,7,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(60,7,4,72,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(61,7,2,72,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(62,7,4,66,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(63,7,3,66,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(64,8,1,8,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(65,8,4,8,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(66,9,1,9,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(67,9,4,9,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(68,10,1,10,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(69,10,4,10,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(70,11,1,11,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(71,11,4,11,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(72,11,4,73,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(73,11,2,73,NULL,NULL,'Pendiente',1,'Rechazada: falta el sellado del Registro Civil','mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(74,12,1,12,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(75,12,4,12,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(76,13,1,13,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(77,13,4,13,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(78,14,1,14,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(79,14,4,14,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(80,14,4,74,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(81,14,2,74,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(82,15,1,15,NULL,NULL,'Recibido',1,NULL,'sherrera','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(83,15,4,15,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(84,16,1,16,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(85,16,4,16,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(86,16,4,75,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(87,16,2,75,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(88,17,1,17,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(89,17,4,17,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(90,18,1,18,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(91,18,4,18,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(92,19,1,19,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(93,19,4,19,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(94,20,1,20,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(95,20,4,20,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(96,21,1,21,NULL,NULL,'Recibido',1,NULL,'sherrera','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(97,21,4,21,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(98,22,1,22,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(99,22,4,22,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(100,22,4,76,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(101,22,2,76,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(102,23,1,23,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(103,23,4,23,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(104,24,1,24,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(105,24,4,24,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(106,25,1,25,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(107,25,4,25,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(108,26,1,26,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(109,26,4,26,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(110,26,4,67,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(111,26,3,67,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(112,27,1,27,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(113,27,4,27,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(114,28,1,28,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(115,28,4,28,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(116,29,1,29,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(117,29,4,29,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(118,30,1,30,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(119,30,4,30,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(120,31,1,31,NULL,NULL,'Recibido',1,NULL,'sherrera','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(121,31,4,31,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(122,31,4,77,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(123,31,2,77,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(124,32,1,32,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(125,32,4,32,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(126,32,4,68,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(127,32,3,68,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(128,33,1,33,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(129,33,4,33,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(130,34,1,34,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(131,34,4,34,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(132,35,1,35,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(133,35,4,35,NULL,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(134,3,6,NULL,2,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(135,3,7,NULL,3,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(136,4,6,NULL,4,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(137,9,6,NULL,6,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(138,9,7,NULL,7,NULL,'Recibido',1,NULL,'sherrera','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(139,9,7,NULL,8,NULL,'Recibido',1,NULL,'sherrera','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(140,10,6,NULL,9,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(141,18,6,NULL,11,NULL,'Recibido',1,NULL,'sherrera','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(142,19,7,NULL,12,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(143,23,6,NULL,13,NULL,'Pendiente',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(144,29,6,NULL,14,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(145,33,7,NULL,15,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(146,34,6,NULL,16,NULL,'Validado',1,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(256,5,8,NULL,5,'Acciones de S.A. verificadas','Validado',0,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(257,13,8,NULL,10,'Certificado de depósito a plazo fijo','Pendiente',0,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(258,23,8,NULL,13,'Boleto de compraventa histórico','Recibido',0,NULL,'mlopez','2026-11-10 20:08:07','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(259,1,5,NULL,NULL,NULL,'Validado',1,NULL,'mlopez','2026-11-10 23:08:07','mlopez','mlopez','2026-11-20 23:04:30','2026-11-20 23:04:30'),(260,1,5,1,NULL,NULL,'Pendiente',1,NULL,NULL,NULL,'mlopez',NULL,'2026-11-20 23:22:05','2026-11-20 23:22:05'),(261,1,5,1,NULL,NULL,'Pendiente',1,NULL,NULL,NULL,'mlopez',NULL,'2026-11-20 23:22:05','2026-11-20 23:22:05');
/*!40000 ALTER TABLE `documentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expedientes`
--

DROP TABLE IF EXISTS `expedientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expedientes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `caratula` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoProceso` enum('Ab Intestato','Testamentaria') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Ab Intestato',
  `numeroExpediente` int unsigned NOT NULL,
  `juzgadoId` int NOT NULL,
  `etapa` enum('Iniciado','Declaratoria de Herederos','Inscripción de DH/Adjudicación de bienes','Finalizado') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Iniciado',
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `fechaBaja` datetime DEFAULT NULL COMMENT 'RN-09: NULL = activo; con fecha = dado de baja',
  `creadoPor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modificadoPor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `claveActiva` tinyint GENERATED ALWAYS AS (if((`fechaBaja` is null),1,NULL)) STORED,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_expediente_activo` (`juzgadoId`,`numeroExpediente`,`claveActiva`),
  KEY `idx_expedientes_etapa` (`etapa`),
  KEY `idx_expedientes_tipo` (`tipoProceso`),
  CONSTRAINT `fk_expedientes_juzgados` FOREIGN KEY (`juzgadoId`) REFERENCES `juzgados` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expedientes`
--

LOCK TABLES `expedientes` WRITE;
/*!40000 ALTER TABLE `expedientes` DISABLE KEYS */;
INSERT INTO `expedientes` (`id`, `caratula`, `tipoProceso`, `numeroExpediente`, `juzgadoId`, `etapa`, `observaciones`, `fechaBaja`, `creadoPor`, `modificadoPor`, `createdAt`, `updatedAt`) VALUES (1,'Gómez, Roberto s/ Sucesión Ab Intestato','Ab Intestato',101,1,'Iniciado','Pendiente abonar bono de ley',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(2,'Martínez, Ana María s/ Sucesión Testamentaria','Testamentaria',102,2,'Declaratoria de Herederos','Testamento por acto público presentado',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(3,'Fernández, Pedro s/ Sucesión Ab Intestato','Ab Intestato',103,3,'Inscripción de DH/Adjudicación de bienes','Inmueble único en Bahía Blanca',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(4,'Rodríguez, Jorge Luis s/ Sucesión Ab Intestato','Ab Intestato',104,4,'Inscripción de DH/Adjudicación de bienes','Oficio enviado al Registro de la Propiedad',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(5,'López, Elena s/ Sucesión Testamentaria','Testamentaria',105,5,'Finalizado','Archivado en legajo general',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(6,'Sánchez, Carlos Eduardo s/ Sucesión Ab Intestato','Ab Intestato',106,6,'Iniciado','Falta constancia de AORT',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(7,'Pérez, María Cristina s/ Sucesión Ab Intestato','Ab Intestato',107,7,'Declaratoria de Herederos','Edictos publicados en Boletín Oficial',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(8,'González, Alberto s/ Sucesión Testamentaria','Testamentaria',108,8,'Iniciado','Testamento ológrafo a peritar',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(9,'Díaz, Raúl Osvaldo s/ Sucesión Ab Intestato','Ab Intestato',109,1,'Inscripción de DH/Adjudicación de bienes','Dos automotores y un lote',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(10,'Álvarez, Rosa Isabel s/ Sucesión Ab Intestato','Ab Intestato',110,2,'Inscripción de DH/Adjudicación de bienes','Tasa de justicia abonada',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(11,'Romero, Miguel Ángel s/ Sucesión Ab Intestato','Ab Intestato',111,3,'Declaratoria de Herederos','Plazo de edictos vencido',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(12,'Sosa, Beatriz s/ Sucesión Testamentaria','Testamentaria',112,4,'Iniciado','Se requiere citar a albacea',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(13,'Torres, Hugo René s/ Sucesión Ab Intestato','Ab Intestato',113,5,'Inscripción de DH/Adjudicación de bienes','Pendiente informe de inhibiciones',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(14,'Ramírez, Alicia s/ Sucesión Ab Intestato','Ab Intestato',114,6,'Finalizado','Inscripción registral concluida',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(15,'Flores, Gustavo s/ Sucesión Ab Intestato','Ab Intestato',115,7,'Iniciado','Averiguación de herederos',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(16,'Benítez, Norma s/ Sucesión Testamentaria','Testamentaria',116,8,'Declaratoria de Herederos','Legítima hereditaria respetada',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(17,'Acosta, Daniel Eduardo s/ Sucesión Ab Intestato','Ab Intestato',117,1,'Iniciado','Presentación de escrito de apertura',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(18,'Medina, Carmen s/ Sucesión Ab Intestato','Ab Intestato',118,2,'Inscripción de DH/Adjudicación de bienes','Valuación fiscal recibida de ARBA',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(19,'Castro, Mario s/ Sucesión Ab Intestato','Ab Intestato',119,3,'Inscripción de DH/Adjudicación de bienes','Testimonio elaborado para firma',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(20,'Suárez, Olga Esther s/ Sucesión Testamentaria','Testamentaria',120,4,'Finalizado','Regulación de honorarios firme',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(21,'Blanco, Esteban s/ Sucesión Ab Intestato','Ab Intestato',121,5,'Iniciado','A la espera de orden de edictos',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(22,'Morales, Patricia s/ Sucesión Ab Intestato','Ab Intestato',122,6,'Declaratoria de Herederos','Vista fiscal conferida',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(23,'Giménez, Ricardo s/ Sucesión Ab Intestato','Ab Intestato',123,7,'Inscripción de DH/Adjudicación de bienes','Cuota parte indivisa sobre campo',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(24,'Ríos, Susana s/ Sucesión Testamentaria','Testamentaria',124,8,'Inscripción de DH/Adjudicación de bienes','Cesión de derechos hereditarios adjunta',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(25,'Mendoza, Javier s/ Sucesión Ab Intestato','Ab Intestato',125,1,'Iniciado','Falta acordar patrocinio unificado',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(26,'Aguirre, Marta Silvia s/ Sucesión Ab Intestato','Ab Intestato',126,2,'Declaratoria de Herederos','Autos para dictar declaratoria',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(27,'Ferreyra, Héctor s/ Sucesión Ab Intestato','Ab Intestato',127,3,'Inscripción de DH/Adjudicación de bienes','Depósito judicial de cuentas bancarias',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(28,'Pereyra, Claudia s/ Sucesión Testamentaria','Testamentaria',128,4,'Iniciado','Citación a legatarios',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(29,'Peralta, Francisco s/ Sucesión Ab Intestato','Ab Intestato',129,5,'Inscripción de DH/Adjudicación de bienes','Pago de contribución de bonos',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(30,'Cabrera, Valeria s/ Sucesión Ab Intestato','Ab Intestato',130,6,'Finalizado','Hijuelas adjudicadas',NULL,'mlopez','Lucila C','2026-11-10 20:08:07','2026-11-22 19:29:10'),(31,'Santillán, Horacio s/ Sucesión Ab Intestato','Ab Intestato',131,7,'Iniciado','Acreditación de vínculo en curso',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(32,'Juárez, Mónica s/ Sucesión Ab Intestato','Ab Intestato',132,8,'Declaratoria de Herederos','Población de edictos sin oposición',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(33,'Godoy, Andrés s/ Sucesión Testamentaria','Testamentaria',133,1,'Inscripción de DH/Adjudicación de bienes','Inventario y avalúo presentado',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(34,'Vargas, Lucía s/ Sucesión Ab Intestato','Ab Intestato',134,2,'Inscripción de DH/Adjudicación de bienes','Inscripción por tracto abreviado',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44'),(35,'Navarro, Gabriel s/ Sucesión Ab Intestato','Ab Intestato',135,3,'Iniciado','Reserva de derecho de acreedores',NULL,'mlopez','mlopez','2026-11-10 20:08:07','2026-11-16 21:14:44');
/*!40000 ALTER TABLE `expedientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juzgados`
--

DROP TABLE IF EXISTS `juzgados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juzgados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` tinyint unsigned NOT NULL,
  `descripcion` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juzgados`
--

LOCK TABLES `juzgados` WRITE;
/*!40000 ALTER TABLE `juzgados` DISABLE KEYS */;
INSERT INTO `juzgados` VALUES (1,1,'Juzgado de 1° Instancia en lo Civil y Comercial N° 1',1),(2,2,'Juzgado de 1° Instancia en lo Civil y Comercial N° 2',1),(3,3,'Juzgado de 1° Instancia en lo Civil y Comercial N° 3',1),(4,4,'Juzgado de 1° Instancia en lo Civil y Comercial N° 4',1),(5,5,'Juzgado de 1° Instancia en lo Civil y Comercial N° 5',1),(6,6,'Juzgado de 1° Instancia en lo Civil y Comercial N° 6',1),(7,7,'Juzgado de 1° Instancia en lo Civil y Comercial N° 7',1),(8,8,'Juzgado de 1° Instancia en lo Civil y Comercial N° 8',1);
/*!40000 ALTER TABLE `juzgados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `expedienteId` int NOT NULL,
  `nombreCompleto` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rol` enum('Causante','Heredero','Cónyuge') COLLATE utf8mb4_unicode_ci NOT NULL,
  `creadoPor` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modificadoPor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_personas_expediente` (`expedienteId`,`rol`),
  CONSTRAINT `fk_personas_expedientes` FOREIGN KEY (`expedienteId`) REFERENCES `expedientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES (1,1,'Gómez, Roberto',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(2,2,'Martínez, Ana María',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(3,3,'Fernández, Pedro',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(4,4,'Rodríguez, Jorge Luis',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(5,5,'López, Elena',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(6,6,'Sánchez, Carlos Eduardo',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(7,7,'Pérez, María Cristina',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(8,8,'González, Alberto',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(9,9,'Díaz, Raúl Osvaldo',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(10,10,'Álvarez, Rosa Isabel',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(11,11,'Romero, Miguel Ángel',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(12,12,'Sosa, Beatriz',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(13,13,'Torres, Hugo René',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(14,14,'Ramírez, Alicia',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(15,15,'Flores, Gustavo',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(16,16,'Benítez, Norma',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(17,1,'Acosta, Daniel Eduardo',NULL,'Causante','mlopez','Luci','2026-11-10 20:08:07','2026-11-22 19:27:34'),(18,18,'Medina, Carmen',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(19,19,'Castro, Mario',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(20,20,'Suárez, Olga Esther',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(21,21,'Blanco, Esteban',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(22,22,'Morales, Patricia',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(23,23,'Giménez, Ricardo',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(24,24,'Ríos, Susana',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(25,25,'Mendoza, Javier Antonio',NULL,'Causante','mlopez','Lucila','2026-11-10 20:08:07','2026-11-22 20:49:51'),(26,26,'Aguirre, Marta Silvia',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(27,27,'Ferreyra, Héctor',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(28,28,'Pereyra, Claudia',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(29,29,'Peralta, Francisco',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(30,30,'Cabrera, Valeria',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(31,31,'Santillán, Horacio',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(32,32,'Juárez, Mónica',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(33,33,'Godoy, Andrés',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(34,34,'Vargas, Lucía',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(35,35,'Navarro, Gabriel',NULL,'Causante','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(64,1,'Marta Susana Rossi',NULL,'Cónyuge','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(65,4,'Nélida Beatriz Cortés',NULL,'Cónyuge','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(66,7,'Juan Carlos Ibarra',NULL,'Cónyuge','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(67,26,'Roberto Aníbal Lemos',NULL,'Cónyuge','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(68,32,'Gloria Inés Paz',NULL,'Cónyuge','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(69,2,'Julián Ferrero',NULL,'Heredero','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(70,3,'Pablo Fernández',NULL,'Heredero','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(71,3,'Verónica Fernández',NULL,'Heredero','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(72,7,'Diego Pérez',NULL,'Heredero','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(73,11,'Silvia Romero',NULL,'Heredero','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(74,14,'Gabriela Ramírez',NULL,'Heredero','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(75,16,'Andrea Benítez',NULL,'Heredero','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(76,22,'Nicolás Morales',NULL,'Heredero','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(77,31,'Hernán Santillán',NULL,'Heredero','mlopez','mlopez','2026-11-10 20:08:07','2026-11-10 20:08:07'),(87,34,'Laura Lopez',NULL,'Heredero','Lucila Comisso',NULL,'2026-11-23 15:42:20','2026-11-23 15:42:20');
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plantilla_documentacion`
--

DROP TABLE IF EXISTS `plantilla_documentacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plantilla_documentacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipoProceso` enum('Ab Intestato','Testamentaria','Ambos') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Ambos',
  `tipoDocumentoId` int NOT NULL,
  `aplicaA` enum('Expediente','Causante','Heredero','Cónyuge','Inmueble','Automotor') COLLATE utf8mb4_unicode_ci NOT NULL,
  `etapa` enum('Iniciado','Declaratoria de Herederos','Inscripción de DH/Adjudicación de bienes','Finalizado') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_plantilla` (`tipoProceso`,`tipoDocumentoId`,`aplicaA`),
  KEY `fk_plantilla_tipo_documento` (`tipoDocumentoId`),
  CONSTRAINT `fk_plantilla_tipo_documento` FOREIGN KEY (`tipoDocumentoId`) REFERENCES `tipos_documento` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plantilla_documentacion`
--

LOCK TABLES `plantilla_documentacion` WRITE;
/*!40000 ALTER TABLE `plantilla_documentacion` DISABLE KEYS */;
INSERT INTO `plantilla_documentacion` VALUES (1,'Ambos',1,'Causante','Iniciado'),(2,'Ambos',4,'Causante','Iniciado'),(3,'Ambos',4,'Heredero','Iniciado'),(4,'Ambos',4,'Cónyuge','Iniciado'),(5,'Ambos',2,'Heredero','Iniciado'),(6,'Ambos',3,'Cónyuge','Iniciado'),(7,'Ambos',5,'Expediente','Iniciado'),(8,'Ambos',6,'Inmueble','Inscripción de DH/Adjudicación de bienes'),(9,'Ambos',7,'Automotor','Inscripción de DH/Adjudicación de bienes');
/*!40000 ALTER TABLE `plantilla_documentacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_documento`
--

DROP TABLE IF EXISTS `tipos_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_documento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_documento`
--

LOCK TABLES `tipos_documento` WRITE;
/*!40000 ALTER TABLE `tipos_documento` DISABLE KEYS */;
INSERT INTO `tipos_documento` VALUES (4,'DNI'),(8,'Otros'),(1,'Partida de defunción'),(3,'Partida de matrimonio'),(2,'Partida de nacimiento'),(5,'Poder'),(7,'Título automotor'),(6,'Título de propiedad inmueble');
/*!40000 ALTER TABLE `tipos_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Hash bcrypt, nunca texto plano',
  `rol` enum('Administrador','Secretaria','Pasante') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pasante',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Laura Giménez','lgimenez','$2b$10$EzuZUX9FKMc/P5xG5pJbI.qDyazJdikb8dp6FdZhsZW2riB5ySNxe','Administrador',1,'2026-11-10 20:08:07','2026-11-10 20:08:07'),(2,'Carlos Ruiz','cruiz','$2b$10$EzuZUX9FKMc/P5xG5pJbI.qDyazJdikb8dp6FdZhsZW2riB5ySNxe','Administrador',1,'2026-11-10 20:08:07','2026-11-10 20:08:07'),(3,'Mariana López','mlopez','$2b$10$EzuZUX9FKMc/P5xG5pJbI.qDyazJdikb8dp6FdZhsZW2riB5ySNxe','Secretaria',1,'2026-11-10 20:08:07','2026-11-10 20:08:07'),(4,'Sofía Herrera','sherrera','$2b$10$EzuZUX9FKMc/P5xG5pJbI.qDyazJdikb8dp6FdZhsZW2riB5ySNxe','Pasante',1,'2026-11-10 20:08:07','2026-11-10 20:08:07'),(5,'Lucila Comisso','comissol','pepito252627','Pasante',1,'2026-11-22 21:22:56','2026-11-22 21:22:56'),(6,'Pedrita','Pepa Pig','$2b$12$dnam8uu1hIDG46xpI7HCUu0eqBujyj52SKtlicM8nFe7yhnyIfTsK','Pasante',1,'2026-11-22 21:47:29','2026-11-22 21:47:29'),(8,'Lalo Quita','LaLo','$2b$12$wv1thacDJjgGkWt9vFg7quLqWExU.H9GDKkXWD6vD67NfuPxAooOS','Pasante',1,'2026-11-22 22:09:36','2026-11-22 22:09:36'),(9,'Pedro Gonzalez','Pedro el Escamoso','$2b$12$C0AGaOKBTAQYDfKS66VC4uUyjmln.gOepUmlSRM9u7gU4wF7xenBm','Pasante',1,'2026-11-22 22:15:42','2026-11-22 22:15:42'),(10,'Lucila Comisso','comissol92','$2b$12$AViEx7rzsHFzE2QjSBdMt.UDZf0LMBLtIbw67WI/ChA1NqDUzeeNO','Administrador',1,'2026-11-23 14:44:27','2026-11-23 11:45:46');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;