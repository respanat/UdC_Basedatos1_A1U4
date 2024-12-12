-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bd_ramiro_espana_ejercicio11
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Articulo`
--

DROP TABLE IF EXISTS `Articulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Articulo` (
  `id_articulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `id_estado_articulo` int(11) DEFAULT NULL,
  `precio_inicial` decimal(10,2) DEFAULT NULL,
  `fecha_limite` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_articulo`),
  KEY `idx_estado_articulo` (`id_estado_articulo`),
  KEY `idx_usuario_articulo` (`id_usuario`),
  KEY `idx_categoria_articulo` (`id_categoria`),
  CONSTRAINT `fk_categoria_articulo` FOREIGN KEY (`id_categoria`) REFERENCES `Categoria` (`id_categoria`) ON UPDATE CASCADE,
  CONSTRAINT `fk_estado_articulo` FOREIGN KEY (`id_estado_articulo`) REFERENCES `EstadoArticulo` (`id_estado_articulo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_articulo` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Categoria`
--

DROP TABLE IF EXISTS `Categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Comentario`
--

DROP TABLE IF EXISTS `Comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comentario` (
  `id_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_articulo` int(11) DEFAULT NULL,
  `texto_comentario` text DEFAULT NULL,
  `fecha_comentario` date DEFAULT NULL,
  `id_comentario_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `idx_usuario_comentario` (`id_usuario`),
  KEY `idx_articulo_comentario` (`id_articulo`),
  KEY `idx_comentario_tipo` (`id_comentario_tipo`),
  CONSTRAINT `fk_articulo_comentario` FOREIGN KEY (`id_articulo`) REFERENCES `Articulo` (`id_articulo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_comentario_tipo` FOREIGN KEY (`id_comentario_tipo`) REFERENCES `ComentarioTipo` (`id_comentario_tipo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_comentario` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ComentarioTipo`
--

DROP TABLE IF EXISTS `ComentarioTipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ComentarioTipo` (
  `id_comentario_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `comentario_tipo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_comentario_tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EstadoArticulo`
--

DROP TABLE IF EXISTS `EstadoArticulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstadoArticulo` (
  `id_estado_articulo` int(11) NOT NULL AUTO_INCREMENT,
  `estado_articulo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_estado_articulo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EstadoCaso`
--

DROP TABLE IF EXISTS `EstadoCaso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstadoCaso` (
  `id_estado_caso` int(11) NOT NULL AUTO_INCREMENT,
  `estado_caso` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_estado_caso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EstadoSubasta`
--

DROP TABLE IF EXISTS `EstadoSubasta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstadoSubasta` (
  `id_estado_subasta` int(11) NOT NULL AUTO_INCREMENT,
  `estado_subasta` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_estado_subasta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `EstadoUsuario`
--

DROP TABLE IF EXISTS `EstadoUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EstadoUsuario` (
  `id_estado_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `estado_usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_estado_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Oferta`
--

DROP TABLE IF EXISTS `Oferta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Oferta` (
  `id_oferta` int(11) NOT NULL AUTO_INCREMENT,
  `id_subasta` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `precio_ofertado` decimal(10,2) DEFAULT NULL,
  `fecha_oferta` date DEFAULT NULL,
  PRIMARY KEY (`id_oferta`),
  KEY `idx_subasta_oferta` (`id_subasta`),
  KEY `idx_usuario_oferta` (`id_usuario`),
  CONSTRAINT `fk_subasta_oferta` FOREIGN KEY (`id_subasta`) REFERENCES `Subasta` (`id_subasta`) ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_oferta` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Operacion`
--

DROP TABLE IF EXISTS `Operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Operacion` (
  `id_operacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_subasta` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_operacion` date DEFAULT NULL,
  `precio_final` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_operacion`),
  KEY `idx_subasta_operacion` (`id_subasta`),
  KEY `idx_usuario_operacion` (`id_usuario`),
  CONSTRAINT `fk_subasta_operacion` FOREIGN KEY (`id_subasta`) REFERENCES `Subasta` (`id_subasta`) ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_operacion` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Satisfaccion`
--

DROP TABLE IF EXISTS `Satisfaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Satisfaccion` (
  `id_satisfaccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `fecha_satisfaccion` date DEFAULT NULL,
  PRIMARY KEY (`id_satisfaccion`),
  KEY `idx_usuario_satisfaccion` (`id_usuario`),
  CONSTRAINT `fk_usuario_satisfaccion` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Soporte`
--

DROP TABLE IF EXISTS `Soporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Soporte` (
  `id_caso` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `asunto` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `fecha_solicitud` date DEFAULT NULL,
  `id_estado_caso` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_caso`),
  KEY `idx_usuario_soporte` (`id_usuario`),
  KEY `idx_estado_caso` (`id_estado_caso`),
  CONSTRAINT `fk_estado_caso` FOREIGN KEY (`id_estado_caso`) REFERENCES `EstadoCaso` (`id_estado_caso`) ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_soporte` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Subasta`
--

DROP TABLE IF EXISTS `Subasta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subasta` (
  `id_subasta` int(11) NOT NULL AUTO_INCREMENT,
  `id_articulo` int(11) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_limite` date DEFAULT NULL,
  `id_estado_subasta` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_subasta`),
  KEY `idx_articulo_subasta` (`id_articulo`),
  KEY `idx_estado_subasta` (`id_estado_subasta`),
  KEY `idx_usuario_subasta` (`id_usuario`),
  CONSTRAINT `fk_articulo_subasta` FOREIGN KEY (`id_articulo`) REFERENCES `Articulo` (`id_articulo`) ON UPDATE CASCADE,
  CONSTRAINT `fk_estado_subasta` FOREIGN KEY (`id_estado_subasta`) REFERENCES `EstadoSubasta` (`id_estado_subasta`) ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_subasta` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TablaY`
--

DROP TABLE IF EXISTS `TablaY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TablaY` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `asignatura` varchar(50) DEFAULT NULL,
  `nota1` decimal(5,2) DEFAULT NULL,
  `nota2` decimal(5,2) DEFAULT NULL,
  `nota3` decimal(5,2) DEFAULT NULL,
  `nota_definitiva` decimal(5,2) DEFAULT NULL,
  `promedio` decimal(5,2) DEFAULT NULL,
  `mensaje` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TipoUsuario`
--

DROP TABLE IF EXISTS `TipoUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TipoUsuario` (
  `id_tipo_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `id_estado_usuario` int(11) DEFAULT NULL,
  `id_tipo_usuario` int(11) DEFAULT NULL,
  `contrasena` varchar(100) DEFAULT NULL,
  `preferencias` text DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `idx_estado_usuario` (`id_estado_usuario`),
  KEY `idx_tipo_usuario` (`id_tipo_usuario`),
  CONSTRAINT `fk_estado_usuario` FOREIGN KEY (`id_estado_usuario`) REFERENCES `EstadoUsuario` (`id_estado_usuario`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tipo_usuario` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `TipoUsuario` (`id_tipo_usuario`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-19 16:16:15
