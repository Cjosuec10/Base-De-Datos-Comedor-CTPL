-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_comedor_ctpl
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asistencias_comedor`
--

DROP TABLE IF EXISTS `asistencias_comedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencias_comedor` (
  `asistencia_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador de la asistencia',
  `estudiante_id` int(11) NOT NULL COMMENT 'identificador del estudiante',
  `numero_asistencia` int(11) NOT NULL COMMENT 'numero de asistencia',
  `fecha_asistencia` datetime NOT NULL COMMENT 'fecha de la asistencia',
  PRIMARY KEY (`asistencia_id`),
  KEY `asistencias_comedor_FK` (`estudiante_id`),
  CONSTRAINT `asistencias_comedor_FK` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`estudiante_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='contiene las asistencias al comedor';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencias_comedor`
--

LOCK TABLES `asistencias_comedor` WRITE;
/*!40000 ALTER TABLE `asistencias_comedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencias_comedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiantes` (
  `estudiante_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador unico de estudiantes',
  `primero_nombre_estudiante` varchar(30) NOT NULL COMMENT 'primer nombre de estudiante',
  `segundo_nombre_estudiante` varchar(30) NOT NULL COMMENT 'segundo nombre de estudiante',
  `primero_apellido_estudiante` varchar(30) NOT NULL COMMENT 'primer apellido de estudiante',
  `segundo_apellido_estudiante` varchar(30) NOT NULL COMMENT 'segundo apellido de estudiante',
  `telefono_estudiante` varchar(8) NOT NULL COMMENT 'telefono del estudiante',
  `pais_id` int(11) NOT NULL COMMENT 'pais del estudiante',
  `genero_estudiante` enum('MASCULINO','FEMENINO') NOT NULL COMMENT 'genero del estudiante',
  `turno_id` int(11) NOT NULL COMMENT 'id del turno',
  PRIMARY KEY (`estudiante_id`),
  UNIQUE KEY `estudiantes_un` (`telefono_estudiante`),
  KEY `estudiantes_FK` (`turno_id`),
  KEY `estudiantes_FK_1` (`pais_id`),
  CONSTRAINT `estudiantes_FK` FOREIGN KEY (`turno_id`) REFERENCES `turnos` (`turno_id`),
  CONSTRAINT `estudiantes_FK_1` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='contiene a los estudiantes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paises` (
  `pais_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del pais',
  `nombre_pais` varchar(30) NOT NULL COMMENT 'nombre del pais',
  PRIMARY KEY (`pais_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='paises de los estudiantes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permisos`
--

DROP TABLE IF EXISTS `permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permisos` (
  `permiso_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del permiso',
  `tipo_permiso` varchar(30) NOT NULL COMMENT 'tipo de permiso',
  `descripcion_permiso` text NOT NULL COMMENT 'descripcion del permiso',
  PRIMARY KEY (`permiso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='contiene los permisos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permisos`
--

LOCK TABLES `permisos` WRITE;
/*!40000 ALTER TABLE `permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del rol',
  `tipo_rol` varchar(30) NOT NULL COMMENT 'tipo del rol',
  `descripcion_rol` text NOT NULL COMMENT 'descripcion del rol',
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='contiene los roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_permisos`
--

DROP TABLE IF EXISTS `roles_permisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_permisos` (
  `rol_permiso_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del permiso de rol',
  `rol_id` int(11) NOT NULL COMMENT 'identificador del rol',
  `permiso_id` int(11) NOT NULL COMMENT 'identificador del permiso',
  PRIMARY KEY (`rol_permiso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='contiene los permisos para los roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_permisos`
--

LOCK TABLES `roles_permisos` WRITE;
/*!40000 ALTER TABLE `roles_permisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_permisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_usuarios`
--

DROP TABLE IF EXISTS `roles_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_usuarios` (
  `rol_usuario_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del rol del usuario',
  `usuario_id` int(11) NOT NULL COMMENT 'identificador del usuario',
  `rol_id` int(11) NOT NULL COMMENT 'identificador del rol',
  PRIMARY KEY (`rol_usuario_id`),
  KEY `roles_usuarios_FK` (`usuario_id`),
  KEY `roles_usuarios_FK_1` (`rol_id`),
  CONSTRAINT `roles_usuarios_FK` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `roles_usuarios_FK_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='contiene los roles de los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_usuarios`
--

LOCK TABLES `roles_usuarios` WRITE;
/*!40000 ALTER TABLE `roles_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos` (
  `turno_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del turno',
  `tipo_turno` varchar(10) NOT NULL COMMENT 'tipo de turno',
  PRIMARY KEY (`turno_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='turnos dia o noche';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'identificador del usuario',
  `nombre_usuario` varchar(30) NOT NULL COMMENT 'nombre del usuario',
  `contrasenia_usuario` varchar(30) NOT NULL COMMENT 'contrasenia del usuario',
  `correo_usuario` varchar(50) NOT NULL COMMENT 'correo del usuario',
  `activo` tinyint(1) NOT NULL COMMENT 'estado del usuario',
  `fecha_creacion_usuario` date NOT NULL COMMENT 'fecha de creacion del usuario',
  `fecha_actualizacion_usuario` date NOT NULL COMMENT 'fecha de actualizacion del usuario',
  PRIMARY KEY (`usuario_id`),
  UNIQUE KEY `usuarios_un` (`correo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='contiene a los usuarios';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sistema_comedor_ctpl'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-25 23:33:47
