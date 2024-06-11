-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: namandu_sarcom
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `id_auditoria` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `query` text DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES (1,'2024-06-10 16:18:30','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'','44'),(2,'2024-06-10 16:18:55','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'45\'','1'),(3,'2024-06-10 16:19:24','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'','45'),(4,'2024-06-10 16:35:39','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','34'),(5,'2024-06-10 16:39:10','INSERT INTO usuarios(usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, ultima_sesion, tipo_usuario, direccion, foto) VALUES(\'repuestosbaratos\',\'Repuestos Baratos Via Chile\', \'auto@toyota\',\'111\', \'111\', \'aa1bb91d337db673c913634999d7b2b2daacca12\', \'1\', NOW(), \'aa1bb91d337db673c913634999d7b2b2daacca12\', NOW(), \'cliente\', \'Una direccion numero 1\', \'archivos/multimedia/perfil/usuario_1_1.jpg\')','16'),(6,'2024-06-10 16:39:10','INSERT INTO clientes (id_usuario, ruc, razon_social, telefono, correo, direccion) VALUES(\'46\',\'111\',\'Repuestos Baratos Via Chile\', \'111\',\'auto@toyota\', \'Una direccion numero 1\')','16'),(7,'2024-06-10 16:39:26','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'46\'','16'),(8,'2024-06-10 16:40:52','INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto) VALUES (\'111\',\'1111\',\'111@111\',\'1111\',\'1111\',\'6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2\',\'1\',NOW(),\'aa1bb91d337db673c913634999d7b2b2daacca12\',\'proveedor\',\'1111\',\'archivos/multimedia/perfil/usuario_1_1.jpg\')','46'),(9,'2024-06-10 16:40:52','INSERT INTO proveedores(ruc, id_usuario , nombre, direccion, telefono, correo, encargado) VALUES(\'1111\',\'47\',\'1111\', \'1111\',\'1111\',\'111@111\',\'1111\')','46'),(10,'2024-06-10 16:52:12','INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto) VALUES (\'toyotoshi\',\'Toyotoshi\',\'partes@toyotoshi\',\'2222\',\'222\',\'aa1bb91d337db673c913634999d7b2b2daacca12\',\'1\',NOW(),\'aa1bb91d337db673c913634999d7b2b2daacca12\',\'proveedor\',\'222\',\'archivos/multimedia/perfil/usuario_1_1.jpg\')','46'),(11,'2024-06-10 16:52:12','INSERT INTO proveedores(ruc, id_usuario , nombre, direccion, telefono, correo, encargado) VALUES(\'2222\',\'48\',\'Toyotoshi\', \'222\',\'222\',\'partes@toyotoshi\',\'Manu Toyotoshi\')','46'),(12,'2024-06-10 16:53:23','UPDATE proveedores SET ruc=\'1111\', nombre=\'Nihao Wo Shu Repuestos \', direccion=\'1111\', telefono=\'1111\', correo=\'111@111\', encargado=\'1111\' WHERE id_proveedor = \'1\'','46'),(13,'2024-06-10 16:53:23','UPDATE usuarios SET usuario=\'nihao\', password=\'aa1bb91d337db673c913634999d7b2b2daacca12\', verificado=\'no\' WHERE id_usuario = \'47\'','46'),(14,'2024-06-10 16:54:14','UPDATE proveedores SET ruc=\'1111\', nombre=\'Nihao Wo Shu Repuestos \', direccion=\'1111\', telefono=\'1111\', correo=\'nihao@repuestos\', encargado=\'1111\' WHERE id_proveedor = \'1\'','46'),(15,'2024-06-10 16:54:56','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','46'),(16,'2024-06-10 16:55:59','UPDATE usuarios SET ci=\'1111\', nombre_apellido=\'Nihao Wo Shu Repuestos\', telefono=\'1111\', direccion=\'1111\', email=\'nihao@repuestos\', tipo_usuario=\'proveedor\' WHERE id_usuario = \'47\'','16'),(17,'2024-06-10 17:01:55','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','16'),(18,'2024-06-10 17:02:08','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'46\'','16'),(19,'2024-06-10 17:02:19','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'48\'','46'),(20,'2024-06-10 17:02:27','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'47\'','48'),(21,'2024-06-10 17:02:39','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'46\'','47'),(22,'2024-06-10 17:03:46','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','46'),(23,'2024-06-10 17:05:15','INSERT INTO usuarios(usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, ultima_sesion, tipo_usuario, direccion, foto) VALUES(\'reparacionmotos\',\'Reparación de Motocicletas Don Ruedas\', \'reparacion@motocicletas\',\'444\', \'444\', \'aa1bb91d337db673c913634999d7b2b2daacca12\', \'1\', NOW(), \'aa1bb91d337db673c913634999d7b2b2daacca12\', NOW(), \'cliente\', \'444\', \'archivos/multimedia/perfil/usuario_1_1.jpg\')','16'),(24,'2024-06-10 17:05:15','INSERT INTO clientes (id_usuario, ruc, razon_social, telefono, correo, direccion) VALUES(\'49\',\'444\',\'Reparación de Motocicletas Don Ruedas\', \'444\',\'reparacion@motocicletas\', \'444\')','16'),(25,'2024-06-10 17:05:25','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','16'),(26,'2024-06-10 17:17:09','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'46\'','49'),(27,'2024-06-10 17:21:08','UPDATE proveedores SET ruc=\'333111\', nombre=\'Toyotoshi\', direccion=\'333111\', telefono=\'333111\', correo=\'partes@toyotoshi\', encargado=\'Manu Toyotoshi\' WHERE id_proveedor = \'2\'','46'),(28,'2024-06-10 17:21:23','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'47\'','46'),(29,'2024-06-10 17:21:32','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','47'),(30,'2024-06-10 17:23:40','INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto) VALUES (\'encomiendaschile\',\'Encomiendas Via Chile\',\'via@chile\',\'555\',\'555\',\'aa1bb91d337db673c913634999d7b2b2daacca12\',\'1\',NOW(),\'aa1bb91d337db673c913634999d7b2b2daacca12\',\'proveedor\',\'555\',\'archivos/multimedia/perfil/usuario_1_1.jpg\')','49'),(31,'2024-06-10 17:23:40','INSERT INTO proveedores(ruc, id_usuario , nombre, direccion, telefono, correo, encargado) VALUES(\'555\',\'50\',\'Encomiendas Via Chile\', \'555\',\'555\',\'via@chile\',\'El Dandi Weon\')','49'),(32,'2024-06-10 17:32:35','INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto) VALUES (\'666\',\'666\',\'66@66\',\'666\',\'666\',\'cd3f0c85b158c08a2b113464991810cf2cdfc387\',\'1\',NOW(),\'aa1bb91d337db673c913634999d7b2b2daacca12\',\'proveedor\',\'666\',\'archivos/multimedia/perfil/usuario_1_1.jpg\')','49'),(33,'2024-06-10 17:32:35','INSERT INTO proveedores(ruc, id_usuario , nombre, direccion, telefono, correo, encargado, id_usuario_creador) VALUES(\'666\',\'51\',\'666\', \'666\',\'666\',\'66@66\',\'666\',\'49\')','49'),(34,'2024-06-10 17:32:57','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'46\'','49'),(35,'2024-06-10 17:33:15','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'47\'','46'),(36,'2024-06-10 17:37:55','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','47'),(37,'2024-06-10 17:38:42','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'46\'','49'),(38,'2024-06-10 17:39:03','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','46'),(39,'2024-06-10 17:39:16','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','49'),(40,'2024-06-10 17:41:39','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','16'),(41,'2024-06-10 17:42:22','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','49'),(42,'2024-06-10 17:44:49','INSERT INTO usuarios(usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, ultima_sesion, tipo_usuario, direccion, foto) VALUES(\'proveedordesarcom\',\'Proveedor creado por sarcom\', \'777@777\',\'7777\', \'777\', \'aa1bb91d337db673c913634999d7b2b2daacca12\', \'1\', NOW(), \'aa1bb91d337db673c913634999d7b2b2daacca12\', NOW(), \'proveedor\', \'777\', \'archivos/multimedia/perfil/usuario_1_1.jpg\')','16'),(43,'2024-06-10 17:44:49','INSERT INTO proveedores (id_usuario, nombre, telefono, correo, direccion) VALUES(\'52\',\'Proveedor creado por sarcom\', \'777\',\'777@777\', \'777\')','16'),(44,'2024-06-10 17:45:03','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'46\'','16'),(45,'2024-06-10 17:45:27','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'47\'','46'),(46,'2024-06-10 17:45:43','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','47'),(47,'2024-06-10 17:48:30','DELETE FROM usuarios WHERE id_usuario = 51','49'),(48,'2024-06-10 17:54:08','DELETE FROM usuarios WHERE id_usuario = 50','49'),(49,'2024-06-10 17:55:16','INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto) VALUES (\'888\',\'888\',\'888@888\',\'888\',\'888\',\'eaa67f3a93d0acb08d8a5e8ff9866f51983b3c3b\',\'1\',NOW(),\'aa1bb91d337db673c913634999d7b2b2daacca12\',\'proveedor\',\'888\',\'archivos/multimedia/perfil/usuario_1_1.jpg\')','49'),(50,'2024-06-10 17:55:16','INSERT INTO proveedores(ruc, id_usuario , nombre, direccion, telefono, correo, encargado, id_usuario_creador) VALUES(\'888\',\'53\',\'888\', \'888\',\'888\',\'888@888\',\'888\',\'49\')','49'),(51,'2024-06-10 17:55:24','DELETE FROM usuarios WHERE id_usuario = 53','49'),(52,'2024-06-10 17:55:24','DELETE FROM proveedores WHERE id_proveedor = 6','49'),(53,'2024-06-10 17:57:47','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'46\'','49'),(54,'2024-06-10 17:57:57','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'47\'','46'),(55,'2024-06-10 17:58:08','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'48\'','47'),(56,'2024-06-10 17:58:17','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','48'),(57,'2024-06-10 17:58:26','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'50\'','49'),(58,'2024-06-10 17:59:57','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','50'),(59,'2024-06-10 18:00:34','INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto) VALUES (\'999\',\'999\',\'999@999\',\'999\',\'999\',\'afc97ea131fd7e2695a98ef34013608f97f34e1d\',\'1\',NOW(),\'aa1bb91d337db673c913634999d7b2b2daacca12\',\'proveedor\',\'999\',\'archivos/multimedia/perfil/usuario_1_1.jpg\')','16'),(60,'2024-06-10 18:00:34','INSERT INTO proveedores(ruc, id_usuario , nombre, direccion, telefono, correo, encargado, id_usuario_creador) VALUES(\'999\',\'54\',\'999\', \'999\',\'999\',\'999@999\',\'999\',\'16\')','16'),(61,'2024-06-10 18:00:45','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','16'),(62,'2024-06-10 18:01:02','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','49'),(63,'2024-06-10 18:01:09','DELETE FROM usuarios WHERE id_usuario = 54','16'),(64,'2024-06-10 18:01:09','DELETE FROM proveedores WHERE id_proveedor = 7','16'),(65,'2024-06-10 18:07:35','INSERT INTO usuarios(usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, ultima_sesion, tipo_usuario, direccion, foto) VALUES(\'1212\',\'121212\', \'12@12\',\'121212\', \'1212\', \'618dcdfb0cd9ae4481164961c4796dd8e3930c8d\', \'1\', NOW(), \'aa1bb91d337db673c913634999d7b2b2daacca12\', NOW(), \'proveedor\', \'1212\', \'archivos/multimedia/perfil/usuario_1_1.jpg\')','16'),(66,'2024-06-10 18:07:35','INSERT INTO proveedores (id_usuario, nombre, telefono, correo, direccion, id_usuario_creador) VALUES(\'55\',\'121212\', \'1212\',\'12@12\', \'1212\', \'16\')','16'),(67,'2024-06-10 18:08:43','UPDATE proveedores SET ruc=\'1212\', nombre=\'121212\', direccion=\'1212\', telefono=\'1212\', correo=\'12@12\', encargado=\'1212\' WHERE id_proveedor = \'8\'','16'),(68,'2024-06-10 18:08:59','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','16'),(69,'2024-06-10 18:09:14','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'46\'','49'),(70,'2024-06-10 18:09:30','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','46'),(71,'2024-06-10 18:09:39','DELETE FROM usuarios WHERE id_usuario = 55','16'),(72,'2024-06-10 18:09:39','DELETE FROM proveedores WHERE id_proveedor = 8','16'),(73,'2024-06-10 18:11:36','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, cantidad_original, fecha_fin, id_usuario) VALUES (\'1\',\'1\',\'2024-06-10\',\'\',\'5\',\'5\',\'2024-06-11\',\'16\')','16'),(74,'2024-06-10 18:11:48','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, cantidad_original, fecha_fin, id_usuario) VALUES (\'1\',\'3\',\'2024-06-10\',\'\',\'10\',\'10\',\'2024-06-11\',\'16\')','16'),(75,'2024-06-10 18:11:56','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, cantidad_original, fecha_fin, id_usuario) VALUES (\'1\',\'4\',\'2024-06-10\',\'\',\'1\',\'1\',\'2024-06-11\',\'16\')','16'),(76,'2024-06-10 18:12:15','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, cantidad_original, fecha_fin, id_usuario) VALUES (\'2\',\'1\',\'2024-06-10\',\'\',\'2\',\'2\',\'2024-06-11\',\'16\')','16'),(77,'2024-06-10 18:12:33','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, cantidad_original, fecha_fin, id_usuario) VALUES (\'1\',\'3\',\'2024-06-10\',\'\',\'4\',\'4\',\'2024-06-11\',\'16\')','16'),(78,'2024-06-10 18:12:52','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','16'),(79,'2024-06-10 18:13:13','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','49'),(80,'2024-06-10 18:13:24','UPDATE cupos SET id_cliente=\'2\', id_puerto=\'3\', fecha=\'2024-06-10\',fecha_fin=\'2024-06-11\', id_proveedor=\'0\', cantidad=\'4\' ,cantidad_original=\'4\', id_usuario=\'16\' , repetir=\'no\', repetir_hasta=null WHERE id_cupo = \'5\'','16'),(81,'2024-06-10 18:13:37','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','16'),(82,'2024-06-10 18:14:11','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada, id_usuario) VALUES (\'5\',\'3\',\'1\',\'DISPONIBLE\',\'1\',\'49\')','49'),(83,'2024-06-10 18:14:11','UPDATE cupos SET cantidad=cantidad-\'1\' WHERE id_cupo = \'5\'','49'),(84,'2024-06-10 18:14:37','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada, id_usuario) VALUES (\'4\',\'2\',\'2\',\'DISPONIBLE\',\'2\',\'49\')','49'),(85,'2024-06-10 18:14:37','UPDATE cupos SET cantidad=cantidad-\'2\' WHERE id_cupo = \'4\'','49'),(86,'2024-06-10 18:14:37','UPDATE cupos SET estado=\'AGOTADO\' WHERE id_cupo = \'4\'','49'),(87,'2024-06-10 18:17:59','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'48\'','49'),(88,'2024-06-10 18:19:15','INSERT INTO choferes (id_proveedor, ci, nombre, telefono, correo, direccion) VALUES(\'2\',\'2323\',\'Chofer de Toyotoshi\', \'232323\',\'23@23\', \'232323\')','48'),(89,'2024-06-10 18:19:33','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado, id_usuario) VALUES (\'2\',\'1\',\'2323\',\'2024-06-29\',\'PENDIENTE\',\'48\')','48'),(90,'2024-06-10 18:19:33','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'2\'','48'),(91,'2024-06-10 18:19:49','UPDATE tickets SET id_chofer=\'1\', chapa=\'2323\', fecha_de_creacion=\'2024-06-10\' WHERE id_ticket = \'1\'','48'),(92,'2024-06-10 18:20:30','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','48'),(93,'2024-06-10 18:20:53','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'48\'','49'),(94,'2024-06-10 18:21:12','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado, id_usuario) VALUES (\'2\',\'1\',\'2323\',\'2024-06-11\',\'PENDIENTE\',\'48\')','48'),(95,'2024-06-10 18:21:12','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'2\'','48'),(96,'2024-06-10 18:22:45','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','48'),(97,'2024-06-10 18:24:49','UPDATE cupos SET cantidad=cantidad+\'-3\' WHERE id_cupo = \'5\'','49'),(98,'2024-06-10 18:24:49','UPDATE cupos_proveedor SET repetir_hasta=null, repetir=\'no\', cantidad=\'4\', cantidad_asignada=\'4\', id_proveedor=\'3\', id_usuario=\'49\' WHERE id_cupos_proveedor = \'1\'','49'),(99,'2024-06-10 18:25:13','UPDATE cupos SET cantidad=cantidad+\'3\' WHERE id_cupo = \'5\'','49'),(100,'2024-06-10 18:25:13','UPDATE cupos_proveedor SET repetir_hasta=null, repetir=\'no\', cantidad=\'1\', cantidad_asignada=\'1\', id_proveedor=\'3\', id_usuario=\'49\' WHERE id_cupos_proveedor = \'1\'','49'),(101,'2024-06-10 18:25:37','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'48\'','49'),(102,'2024-06-10 18:25:46','DELETE FROM tickets WHERE id_ticket = 2','48'),(103,'2024-06-10 18:25:46','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad+1 WHERE id_cupos_proveedor = \'2\'','48'),(104,'2024-06-10 18:25:50','DELETE FROM tickets WHERE id_ticket = 1','48'),(105,'2024-06-10 18:25:50','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad+1 WHERE id_cupos_proveedor = \'2\'','48'),(106,'2024-06-10 18:26:07','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','48'),(107,'2024-06-10 18:35:21','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'50\'','49'),(108,'2024-06-10 18:36:02','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','50'),(109,'2024-06-10 18:36:19','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, cantidad_original, fecha_fin, id_usuario) VALUES (\'1\',\'1\',\'2024-06-10\',\'\',\'5\',\'5\',\'2024-06-15\',\'16\')','16'),(110,'2024-06-10 18:36:32','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, cantidad_original, fecha_fin, id_usuario) VALUES (\'1\',\'3\',\'2024-06-10\',\'\',\'5\',\'5\',\'2024-06-11\',\'16\')','16'),(111,'2024-06-10 18:37:40','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, cantidad_original, fecha_fin, id_usuario) VALUES (\'2\',\'3\',\'2024-06-10\',\'\',\'2\',\'2\',\'2024-06-12\',\'16\')','16'),(112,'2024-06-10 18:37:59','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, cantidad_original, fecha_fin, id_usuario) VALUES (\'2\',\'1\',\'2024-06-10\',\'\',\'8\',\'8\',\'2024-06-11\',\'16\')','16'),(113,'2024-06-10 18:46:48','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'50\'','16'),(114,'2024-06-10 18:47:04','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','50'),(115,'2024-06-10 18:47:55','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(116,'2024-06-10 18:48:23','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'50\'','49'),(117,'2024-06-10 18:50:25','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'48\'','50'),(118,'2024-06-10 18:51:37','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'46\'','16'),(119,'2024-06-10 18:52:05','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada, id_usuario) VALUES (\'2\',\'2\',\'3\',\'DISPONIBLE\',\'3\',\'46\')','46'),(120,'2024-06-10 18:52:05','UPDATE cupos SET cantidad=cantidad-\'3\' WHERE id_cupo = \'2\'','46'),(121,'2024-06-10 18:52:21','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado, id_usuario) VALUES (\'1\',\'1\',\'222\',\'2024-06-10\',\'PENDIENTE\',\'48\')','48'),(122,'2024-06-10 18:52:21','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado, id_usuario) VALUES (\'1\',\'1\',\'222\',\'2024-06-10\',\'PENDIENTE\',\'48\')','48'),(123,'2024-06-10 18:52:21','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-2 WHERE id_cupos_proveedor = \'1\'','48'),(124,'2024-06-10 18:54:07','UPDATE cupos SET cantidad=cantidad+\'3\' WHERE id_cupo = \'2\'','46'),(125,'2024-06-10 18:54:07','DELETE FROM cupos_proveedor WHERE id_cupos_proveedor = 1','46'),(126,'2024-06-10 18:54:07','DELETE FROM tickets WHERE id_cupos_proveedor = 1','46'),(127,'2024-06-10 18:55:21','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','46'),(128,'2024-06-10 18:55:44','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','16'),(129,'2024-06-10 18:56:45','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'49\'','16'),(130,'2024-06-10 18:57:39','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada, id_usuario) VALUES (\'3\',\'2\',\'2\',\'DISPONIBLE\',\'2\',\'49\')','49'),(131,'2024-06-10 18:57:39','UPDATE cupos SET cantidad=cantidad-\'2\' WHERE id_cupo = \'3\'','49'),(132,'2024-06-10 18:57:39','UPDATE cupos SET estado=\'AGOTADO\' WHERE id_cupo = \'3\'','49'),(133,'2024-06-10 18:58:06','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado, id_usuario) VALUES (\'2\',\'1\',\'2\',\'2024-06-10\',\'PENDIENTE\',\'48\')','48'),(134,'2024-06-10 18:58:06','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado, id_usuario) VALUES (\'2\',\'1\',\'2\',\'2024-06-10\',\'PENDIENTE\',\'48\')','48'),(135,'2024-06-10 18:58:06','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-2 WHERE id_cupos_proveedor = \'2\'','48'),(136,'2024-06-10 18:58:39','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada, id_usuario) VALUES (\'4\',\'2\',\'5\',\'DISPONIBLE\',\'5\',\'49\')','49'),(137,'2024-06-10 18:58:39','UPDATE cupos SET cantidad=cantidad-\'5\' WHERE id_cupo = \'4\'','49'),(138,'2024-06-10 19:02:48','DELETE FROM tickets WHERE id_ticket = 4','48'),(139,'2024-06-10 19:02:48','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad+1 WHERE id_cupos_proveedor = \'2\'','48'),(140,'2024-06-10 19:04:48','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','48'),(141,'2024-06-10 19:10:40','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'','16'),(142,'2024-06-10 19:10:56','INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto) VALUES (\'234\',\'234\',\'234@234\',\'234\',\'234\',\'0ec09ef9836da03f1add21e3ef607627e687e790\',\'1\',NOW(),\'aa1bb91d337db673c913634999d7b2b2daacca12\',\'cliente\',\'234\',\'archivos/multimedia/perfil/usuario_1_1.jpg\')','16'),(143,'2024-06-10 19:10:56','INSERT INTO clientes (id_usuario, ruc, razon_social, direccion, telefono, correo, encargado) VALUES (\'56\',\'234\',\'234\',\'234\',\'234\',\'234@234\',\'234\')','16'),(144,'2024-06-10 19:11:02','DELETE FROM usuarios WHERE id_usuario = 56','16'),(145,'2024-06-10 19:11:02','DELETE FROM clientes WHERE id_cliente = 3','16'),(146,'2024-06-10 19:39:17','INSERT INTO usuarios(usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, ultima_sesion, tipo_usuario, direccion, foto) VALUES(\'por_dongauto\',\'El portero Don Gauto\', \'9047@856\',\'9047856\', \'9047856\', \'aa1bb91d337db673c913634999d7b2b2daacca12\', \'1\', NOW(), \'aa1bb91d337db673c913634999d7b2b2daacca12\', NOW(), \'portero\', \'9047856\', \'archivos/multimedia/perfil/usuario_1_1.jpg\')','16'),(147,'2024-06-10 19:39:17','INSERT INTO porteros (id_usuario, id_puerto, portero, telefono, direccion) VALUES(\'57\',\'1\',\'El portero Don Gauto\', \'9047856\',\'9047856\')','16'),(148,'2024-06-10 19:39:39','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'57\'','16'),(149,'2024-06-10 19:40:25','UPDATE tickets SET estado=\'UTILIZADO\', fecha_de_ingreso=NOW() WHERE id_ticket = \'\'','57'),(150,'2024-06-10 19:40:29','UPDATE tickets SET estado=\'UTILIZADO\', fecha_de_ingreso=NOW() WHERE id_ticket = \'\'','57'),(151,'2024-06-10 19:40:31','UPDATE tickets SET estado=\'UTILIZADO\', fecha_de_ingreso=NOW() WHERE id_ticket = \'\'','57'),(152,'2024-06-10 19:40:33','UPDATE tickets SET estado=\'UTILIZADO\', fecha_de_ingreso=NOW() WHERE id_ticket = \'\'','57'),(153,'2024-06-10 19:43:25','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'48\'','49'),(154,'2024-06-10 19:43:46','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado, id_usuario) VALUES (\'3\',\'1\',\'567567\',\'2024-06-10\',\'PENDIENTE\',\'48\')','48'),(155,'2024-06-10 19:43:46','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado, id_usuario) VALUES (\'3\',\'1\',\'567567\',\'2024-06-10\',\'PENDIENTE\',\'48\')','48'),(156,'2024-06-10 19:43:46','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado, id_usuario) VALUES (\'3\',\'1\',\'567567\',\'2024-06-10\',\'PENDIENTE\',\'48\')','48'),(157,'2024-06-10 19:43:46','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado, id_usuario) VALUES (\'3\',\'1\',\'567567\',\'2024-06-10\',\'PENDIENTE\',\'48\')','48'),(158,'2024-06-10 19:43:46','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado, id_usuario) VALUES (\'3\',\'1\',\'567567\',\'2024-06-10\',\'PENDIENTE\',\'48\')','48'),(159,'2024-06-10 19:43:46','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-5 WHERE id_cupos_proveedor = \'3\'','48'),(160,'2024-06-10 19:44:14','UPDATE tickets SET estado=\'UTILIZADO\', fecha_de_ingreso=NOW() WHERE id_ticket = \'9\'','57'),(161,'2024-06-10 19:44:50','UPDATE tickets SET estado=\'UTILIZADO\', fecha_de_ingreso=NOW() WHERE id_ticket = \'8\'','57'),(162,'2024-06-10 19:47:24','UPDATE tickets SET estado=\'UTILIZADO\', fecha_de_ingreso=NOW() WHERE id_ticket = \'7\'','57');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `choferes`
--

DROP TABLE IF EXISTS `choferes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `choferes` (
  `id_chofer` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `ci` varchar(45) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `ubicacion_actual` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'Latitud, Longitud',
  PRIMARY KEY (`id_chofer`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choferes`
--

LOCK TABLES `choferes` WRITE;
/*!40000 ALTER TABLE `choferes` DISABLE KEYS */;
INSERT INTO `choferes` VALUES (1,0,2,'2323','Chofer de Toyotoshi','232323','23@23','232323',NULL);
/*!40000 ALTER TABLE `choferes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `ruc` varchar(50) NOT NULL,
  `razon_social` varchar(50) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `encargado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,46,'111','Repuestos Baratos Via Chile','Una direccion numero 1','111','auto@toyota',NULL),(2,49,'444','Reparación de Motocicletas Don Ruedas','444','444','reparacion@motocicletas',NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupos`
--

DROP TABLE IF EXISTS `cupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupos` (
  `id_cupo` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_puerto` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `id_proveedor` int(11) NOT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT 'DISPONIBLE',
  `cantidad_original` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `repetir_hasta` date DEFAULT NULL,
  `repetir` date DEFAULT NULL,
  PRIMARY KEY (`id_cupo`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupos`
--

LOCK TABLES `cupos` WRITE;
/*!40000 ALTER TABLE `cupos` DISABLE KEYS */;
INSERT INTO `cupos` VALUES (1,1,1,'2024-06-10','2024-06-15',0,'5','DISPONIBLE',5,16,NULL,NULL),(2,1,3,'2024-06-10','2024-06-11',0,'5','DISPONIBLE',5,16,NULL,NULL),(3,2,3,'2024-06-10','2024-06-12',0,'0','AGOTADO',2,16,NULL,NULL),(4,2,1,'2024-06-10','2024-06-11',0,'3','DISPONIBLE',8,16,NULL,NULL);
/*!40000 ALTER TABLE `cupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupos_proveedor`
--

DROP TABLE IF EXISTS `cupos_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cupos_proveedor` (
  `id_cupos_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_cupo` varchar(45) DEFAULT NULL,
  `id_proveedor` varchar(45) DEFAULT NULL,
  `cantidad_asignada` varchar(45) DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `repetir_hasta` date DEFAULT NULL,
  `repetir` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cupos_proveedor`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupos_proveedor`
--

LOCK TABLES `cupos_proveedor` WRITE;
/*!40000 ALTER TABLE `cupos_proveedor` DISABLE KEYS */;
INSERT INTO `cupos_proveedor` VALUES (2,'3','2','2','1','INICIADO',NULL,NULL,49),(3,'4','2','5','0','INICIADO',NULL,NULL,49);
/*!40000 ALTER TABLE `cupos_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porteros`
--

DROP TABLE IF EXISTS `porteros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `porteros` (
  `id_portero` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_puerto` int(11) DEFAULT NULL,
  `portero` varchar(100) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_portero`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `porteros`
--

LOCK TABLES `porteros` WRITE;
/*!40000 ALTER TABLE `porteros` DISABLE KEYS */;
INSERT INTO `porteros` VALUES (1,57,1,'El portero Don Gauto','9047856','9047856');
/*!40000 ALTER TABLE `porteros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `ruc` varchar(50) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `encargado` varchar(100) DEFAULT NULL,
  `id_usuario_creador` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `proveedores_usuarios_FK` (`id_usuario`),
  KEY `proveedores_usuarios_FK_1` (`id_usuario_creador`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,47,'222','Nihao Wo Shu Repuestos ','222','222','nihao@repuestos','Ching Chung',46),(2,48,'333111','Toyotoshi','333111','333111','partes@toyotoshi','Manu Toyotoshi',46),(3,50,'555','Encomiendas Via Chile','555','555','via@chile','El Dandi Weon',49);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puertos`
--

DROP TABLE IF EXISTS `puertos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puertos` (
  `id_puerto` int(11) NOT NULL AUTO_INCREMENT,
  `puerto` varchar(100) DEFAULT NULL,
  `capacidad_estatica` varchar(45) DEFAULT NULL,
  `capacidad_embarque` varchar(45) DEFAULT NULL,
  `capacidad_camiones` varchar(45) DEFAULT NULL,
  `superficie` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_puerto`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puertos`
--

LOCK TABLES `puertos` WRITE;
/*!40000 ALTER TABLE `puertos` DISABLE KEYS */;
INSERT INTO `puertos` VALUES (1,'San Antonio','260.000 Tm','19.500 Tm/día','600 Camiones','18,5 Hectáreas'),(3,'Concepción','53.000 Tm','8.000 Tm/día','155 Camiones','25 Hectáreas'),(4,'Paredón (Hohenau)','58.000 Tm','6.000 Tm/día','213 Camiones','20 Hectáreas'),(5,'Rosario','41.500 Tm','6.000 Tm/día','150 Camiones','12 Hectáreas');
/*!40000 ALTER TABLE `puertos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `id_cupos_proveedor` int(11) DEFAULT NULL,
  `id_chofer` int(11) DEFAULT NULL,
  `chapa` varchar(45) DEFAULT NULL,
  `fecha_de_creacion` date DEFAULT NULL,
  `estado` varchar(45) DEFAULT 'PENDIENTE',
  `fecha_de_ingreso` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ticket`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (5,3,1,'567567','2024-06-10','PENDIENTE',NULL,48),(3,2,1,'2','2024-06-10','PENDIENTE',NULL,48),(6,3,1,'567567','2024-06-10','PENDIENTE',NULL,48),(7,3,1,'567567','2024-06-10','UTILIZADO','2024-06-10 19:47:24',48),(8,3,1,'567567','2024-06-10','UTILIZADO','2024-06-10 19:44:50',48),(9,3,1,'567567','2024-06-10','UTILIZADO','2024-06-10 19:44:14',48);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(249) NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `nombre_apellido` varchar(255) DEFAULT NULL,
  `departamento` varchar(45) DEFAULT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  `ci` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `verified` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `resettable` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `roles_mask` int(10) unsigned NOT NULL DEFAULT 0,
  `registered` int(10) unsigned NOT NULL,
  `last_login` int(10) unsigned DEFAULT NULL,
  `force_logout` mediumint(7) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'soporte@freelancer.com.py','$2y$10$tLZGaaXdtbzx34YUi5DXme42LsgquZTJsJwXKD46qsbGqX/DVryfm','admin','Administrador del Sistema','Sistemas','Analista de Sistemas','2511890','0981900730','Lillo 2173 entre Bélgica y Carmona',1,'dist/images/users/nobody.png',0,1,1,1,1534447970,1591897156,1),(2,'etel@localhost.com','$2y$10$1Dy5ltV6Qmojs.MQF3WFnuNhn6At.Sqn9QdKJKe6dj2FtGraTntY2','etel','ETEL LORENA WENNINGER GASPAR','','','3179791','','',1,'dist/images/users/nobody.png',0,1,1,1,1581453437,1588604886,1),(3,'npalacios@localhost.com','$2y$10$CTUYTokdEYhZxHNr5kbksuA53UnpdGCixbV/ioYr1IlcDSp.JkpH6','npalacios','NICOLÁS PALACIOS','','','0','','',1,'dist/images/users/nobody.png',0,1,1,4,1582033560,1583440395,1),(4,'jcaballero@localhost.com','$2y$10$9xQEZRTn3Fw29QOvnAw8POjOtKBgpcb/NE1WCdquJcxr9exe.BNxO','jcaballero','JORGE CABALLERO','','','0','','',1,'dist/images/users/nobody.png',0,1,1,4,1582033587,1584388654,1),(5,'emendez@localhost.com','$2y$10$fiPqjBFMkFRshcGKScHYyeKfgc7UtD7Bq1e1PxqvcPsiYerbBQLDK','emendez','ENRIQUE MENDEZ','','','0','','',1,'dist/images/users/nobody.png',0,1,1,4,1582033603,1588295709,1),(6,'rayala@localhost.com','$2y$10$hG2Vlp5mVgq2edg7jo06SunaOo9lBm5VSMqtDBLoCK9jwut9Kd37.','rayala','ROBERTO AYALA','','','0','','',1,'dist/images/users/nobody.png',4,1,1,4,1582033614,NULL,0),(7,'carol@localhost.com','$2y$10$nfW4xJeWYeebeHjc7VALnuS3saYBPxDgMOn0NOPV4FPYxIqZd1DJm','carol','CAROLNA W','Ventas','GRENTE DE VENTAS','3179791','','',1,'dist/images/users/nobody.png',0,1,1,6,1588181778,1588181820,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_confirmations`
--

DROP TABLE IF EXISTS `users_confirmations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_confirmations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `email` varchar(249) NOT NULL,
  `selector` varchar(16) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `selector` (`selector`),
  KEY `email_expires` (`email`,`expires`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_confirmations`
--

LOCK TABLES `users_confirmations` WRITE;
/*!40000 ALTER TABLE `users_confirmations` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_confirmations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_remembered`
--

DROP TABLE IF EXISTS `users_remembered`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_remembered` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `selector` varchar(24) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `selector` (`selector`),
  KEY `user` (`user`)
) ENGINE=MyISAM AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_remembered`
--

LOCK TABLES `users_remembered` WRITE;
/*!40000 ALTER TABLE `users_remembered` DISABLE KEYS */;
INSERT INTO `users_remembered` VALUES (51,4,'Bm2_W2Er3O_HJ54rK6TpJ9A9','$2y$10$OWzR47XJJ48cqL6Dv8dKT.xGveCFSrOiNCQb5usqbRxMbUBlaF9t2',1583195778),(4,1,'EFX0ztRgLK7K3_NJzhmIjF5K','$2y$10$s9noB4k0PWs1oBL6ROuhb.fsVQscEixwxpH12/pysVGOzfG/qb6oy',1582078149),(5,1,'vePGE-cPykwUkonWAM2KIz6M','$2y$10$T/38pG6VRNjRLXvcrwFA8OwJZe6YUhQ063WMqRz1GN4QK.6ldSbbS',1582078854),(6,1,'L61MkaJOnRVM5BBYPqxcRF18','$2y$10$4XKZ6uo9RkYFZMCvPS7ZtezSR9A0bs0qo/IAm.581Dy5xJuYsruKW',1582167612),(7,1,'U0c7RQ0nykxlc_GsGd4RmVAt','$2y$10$ccgMou1L76M0frP7o0e.pe.wRx7uRwhXbN/pBadmmJDJ7ee8I8cx.',1582178503),(8,1,'EWqaphtmora3uq4xpvxIUyLZ','$2y$10$jtyoWSFpIEvzABQoWECUEunrFq0RuT0XiMc/R9ga.1cnpxah/jTVi',1582246111),(9,1,'hrV7zpCuWqeF425ziSExcoux','$2y$10$z7YCXk7Q25gPuGMvSgBXjOLiijaZv2QRn./fc6dfQeh9rnOZEVvX6',1582330962),(50,4,'FO3dMwiqNIdaCEThM_NKqsmb','$2y$10$OglpEi3n.RRPuqIylaLUWOqLz7QyKxZ2uVZe/FRA6kHl27czOBJGm',1583194123),(12,1,'jr01eKtNXCSR25PGUatmhMTH','$2y$10$CyZe/WKi72R9Ys3wgcE4eeCGNXXyaHxxg8QbdTMAdBfEGfNor1k9e',1582355430),(13,1,'bJ_D_hU390CzYWyXAsViqPGW','$2y$10$w4UMyI0Hm4yQ8Bxum81GHe7Hg5tO7Z54Zul/zIHgdm9qN4Oy1CDjq',1582359451),(14,1,'xq430D8ytIiJhF6c93sEygHP','$2y$10$1l.u.6v3k9o3YdMipWxNOeQHnmOINxMUV1o/Dm3MZXSNN9KprwLd.',1582362914),(15,1,'QKLkqKp1zwOZ6k6fkVubd-CB','$2y$10$fpcZ0BVpvNoeCXTL06tfleTDiWkfNbZa90lnIBaev23oZZTFQMkgu',1582608272),(16,1,'37MdCC36Y3y0jWCM9FUM_2IV','$2y$10$iXPbydQIAqtkKTaqFz.yP.nQjHHlWFf55M2itClnZhkEralV/H6v2',1582691109),(17,1,'HXkNIoAZRvZ7VbqR4Tx8AxD2','$2y$10$EAB.hBmD9vrpnOvDPoEi/.EZpa3G9duq.Yz6RtsjQxuqCROUKu/1.',1582779904),(18,2,'Dz5pNqO_t9v6o1x7BsdlDAJO','$2y$10$U8ACEnPXL5KvbzPVuQufDOSObA0Hsjm3an4QwIKdKxmUSEQtGA2ci',1582787475),(19,2,'o4xKInlm2U4bT1YgsjbuSCPk','$2y$10$AD94CZeqL7NMMHS0jYQbyOOTQ4KbXYa/n62EawFfFEE9euLXFVdz2',1582932112),(25,1,'QU3GxQimbkfdnlEk42-u8xe-','$2y$10$eRwiXSmg25qEU7eajQ6cOewKNbMabF4YmvqOpcEtXK1oGXamEiDgS',1582945260),(30,4,'Ab1WXtP0Bk9soLrdVoDMHZUc','$2y$10$Z.KWCmnOBH50H1Dmiez3FOTX4UQQsKxJjNSIOYCeeNmad18bZIazO',1582956903),(23,5,'A_ak6IBdIoYWpBVPiMJtsdK-','$2y$10$PEDs1/fDCY8dGbNyizPc..sS6XIj6Cu01S7QEnZhXDz3qiQbyLHxy',1582944039),(28,4,'-CkTRbKWxTNgvQnwXabhQI1k','$2y$10$zBD5w2k1vUQ0B8uwe34ne.hIGeQZ6T7hlVwx7oExETOtQVLVK2sc.',1582956799),(31,4,'H-0xHTOvf47GY65178XBqTs_','$2y$10$8U4y.0ZvpuZbC7Se2mEsd.V2TFEh7UUPVB9U9O0VgUBwq1WQQlvxe',1582957062),(32,4,'BSJXH6ZoEmmD38mv27KTRg27','$2y$10$gyW2DoWDeNDzk5/X9JbG8e726DBE0BUt8LbbE0/lNnX9mHU3nAkr2',1582957063),(33,4,'WCAbgL6YL57sYyHaJM1BZxHU','$2y$10$TYaTIA7yJ2Gp4/iHALxzNOClB8tJmnmyslG4aNnSgR5gxa/NwVHJi',1582957064),(34,4,'z39HJwZmFLMfm4RCcz8pj9RH','$2y$10$TCdISHjZZ4h/enEAgHHlmuh.1E8TaFYrLf0QX4pI9/kl3cVEYi832',1582957328),(35,4,'GXL3cSv7ovfQYfdNg1pz5N4_','$2y$10$NyBmGcdh20zdSbVhWHkLdeVeyCbcfK0CAumJzkg6gTzpJ9ja9YJ4a',1582957329),(36,4,'LkWp16Y0XTmHMiK_NPd7bgF6','$2y$10$qf43Vp.Vx8qUV70iW9b5zebjN4U4u0UGTqTdfRCNFV7Hdrwh4Yf3W',1582959026),(37,4,'eXAB2qGUXA-ZnGphBI5N5-fW','$2y$10$xkXdHD23z7QY7gsIquPWkuQzLJWGYrv9QNiU70rW4TwyqQPhNXabK',1582962315),(38,1,'5m24wDx_OKrv0b9SS2F7obHS','$2y$10$dyfdYSWzaDuDJQlCI7Afd..1uyAXtYZD40s0wqJ6beQv8YQCfcO2G',1582964005),(39,4,'roMwqjKZEtyBVLZvbC_vH_Eo','$2y$10$30U4vbnuuAPIwqWRvwbU0.leOD4bvDDtNj5CfTGyYr.uTFeYhqcye',1583016322),(40,4,'m_A_AD-MKL0ZxZRr7Yg9H7pp','$2y$10$.RUugMkoHteMYd98m31.keAicf6n6GBsJFbRf8nCGUIq0FCpdsaTG',1583019945),(41,1,'qMqAYou_mENes8aQuFEOe1s_','$2y$10$wrsbt6Gkr4v9BbdpMlo5kejar95Ipcw5PajsZmIo//JfdHUHosVtS',1583021025),(42,4,'JnHuqbzkL4KBWX9j-HhTc1jC','$2y$10$KuU2KTkqpb7Tz9TTfugFTuEA4AMmHhvI4fHOY3O6NUT4lkoaS9MjK',1583021605),(43,4,'wIRF3SjM68IYnUk2NFtLKJ2S','$2y$10$pAbxKzN8Cqg0J9UAh8jipeZeReto4pO0R3IGNVsC/.rA0wwac3wLu',1583022562),(44,4,'kMY4tt7q25R7wavS5ibhE3IM','$2y$10$risYGhkppbaF2euczFtBh.GbU0gJDxrcgO72gleSqV4PGbmtryzsm',1583022563),(45,4,'-vcOcctTJIxyL2NjalwLMSna','$2y$10$auHPRlFoFpgeG8E8sSeEye8LWLz7xei/33QJNX8mjAAH5jg/1m16S',1583022564),(49,3,'AfEqtZV-MzVG-0O2Vo8XvLW5','$2y$10$W8G.AdzYRpOhuHT89UQGNOfw4dZ8aTfj6blC8g.4/5t/krXYgdOOm',1583028828),(48,3,'BJfh3rXhQ-rTayeOU_EcsFXk','$2y$10$gKM.L6B1JsO58SONqwWAkeOV0p8wnDe43qhoM4EtTwjRwPKtEwy5i',1583028811),(52,4,'NWmBQe3oh676XerdCxONZJSR','$2y$10$K/kxTaMJBjzNaQNKZ/RMM.lQuxZnmpjN9X9L.ZK8iaHIiHPjgmr8i',1583196715),(53,4,'nJvuwG5PgpvWyq2th82huuu9','$2y$10$NVMbYwnxnFMBEe46KYciPee7zouV8FObhYtOoB7V2AgXZl80jki42',1583196717),(54,4,'R2gDuuDyCoPpV6SvT5LV_rXF','$2y$10$PNHJesMo/i5/Vnnog4aZGePz8.7PLNAtoeQAio.radVIJcoLZePiC',1583196720),(55,4,'1XLUyliZWqhqEiwuhvT7Tc29','$2y$10$Vsm0qJ3fgF5Vdb/mNDRI/ukehiiD89EMFIGRXi5CizlHdTK5fsXSO',1583197255),(56,4,'sQX4tcCBOVs9Ni3oYS8aWm1D','$2y$10$UHjDIkryrBTkaC5d8UYUc.rxx2pnkUAm0Lpg0Z8a3Rcf.VoMfxiBa',1583199574),(57,1,'3pVqRCJZ6kWTqEmzQpbdVKtJ','$2y$10$7ufp3wGTE2UrJ5D0RmUug.BGtpY3bNb4VlDLxCvBrIqtIYIvYxAca',1583200640),(58,1,'H_uIQqXYMGntUHHWXglRhF6I','$2y$10$10SKlsJNGljtiGiK12aDw.ieawDbHXop375aOvsOMS.qMM7.lyT76',1583224646),(59,4,'dMCR_lSvnEvtb9xbA3b-39Sy','$2y$10$gAoRbMRZqLshbe06vr7GkehHvsEbGbAmIhe2if4Hyy0D3iVPorIZC',1583275749),(60,4,'PkejJnmpE9hjJuvluPPzgNDH','$2y$10$t29Hc7ZxgzANGDbQU6ivjumJCWIKyutsUz56/f/Ln4K14wBvVFACS',1583276268),(61,4,'-8kqkTOeOhWwcN-mgplskCxM','$2y$10$W8q3x/VBypvHsvvoy1YdpOmXDRFnGKeiHUofyz26T79k.OfgBJUQW',1583276878),(62,4,'Z3IXEJHHuGxNgTeaf1zu8VCM','$2y$10$U3qVp3PtOoyGj6qsLg7q/OfCex7dbk2auaqKMA9NjcgTEIeUw1wWW',1583277967),(63,4,'EOlKQoLSltmVfRWGJxPf-czf','$2y$10$FwNPklAQMCEyVvqGjrYvbOlgdN0WMcVmNQ3dxRUflLSB503txZXsK',1583278286),(64,4,'YUlr1zkd47DxU5GVDYQOBb6C','$2y$10$ISRPrhnqKKlk4IvsM1WbyOPhMKur/7hYiCyeCfhIkEZlzSIj91w62',1583284883),(65,4,'5b_2kcZqH-gtHgRvtSbHoqry','$2y$10$7rEjgkSROI4pSpzfmjvcmePK1ok5V2Y7alX01YLSAm.6eWIbB4IcC',1583284886),(66,4,'K8i8WbVwpPl1GVnWlVe0_H6j','$2y$10$BSCUVpcTjLMEdYO4428YMekQ6KdqFeJSPjVGTAjZEV9ACk8POYQI.',1583288281),(67,4,'ivO81KJT6m7ot-8OkFFdlubY','$2y$10$RnBW4NbB1Eh6HB5QR3RaGOCxngIb7WbIbuN55rfXAxyZp6qE/am5C',1583288283),(68,4,'aFA2233ivh8PEdZHPjJuFMhH','$2y$10$j94ZCLg7ITztj.QPFmAGcOf020Q.qFjksUJChVIXKX4UBmFd7kbeW',1583288363),(69,4,'jfhs5VAwMSoSBEuJDEIMkcTr','$2y$10$6Ch8PdxuSWwtKZv5I8765ufqG04RDPL80.87pvGk/BP9BAD2s5P..',1583288365),(70,4,'KdaGPcLLUfXcEeTWpFzkqSYR','$2y$10$EWt9CzZaLhi6q1GMOiicVOKeq9bvlURPzj0c1bKHMelCy4XXe833y',1583288787),(71,4,'ao94zizMyF-R_MyaoI5JTKjG','$2y$10$DflH2eK.zWLCqz6XmboKcOarGJRxJUkyB/mbVPRs9nUQFnloST7iq',1583288790),(72,4,'tQxgredWvYhT3VueQjloh1H3','$2y$10$6CxuZ9c2wTvpz2dAKIgbqeI6MpH8WyUHuJtm34E6Q9wjvxHCRefc2',1583295690),(73,4,'_Nmgb3fH3vDjIIxVikV9hC7C','$2y$10$F9A5R9LHVhobqFB2hBPnN.hK2Rjars3APfOa70.Hrgn.JgQ3m36Du',1583295694),(74,4,'JhY-hSeXv6LDuRvu-i23OxMJ','$2y$10$peZevU3JICRk4Uok1s9aBeMHdvIs667HbyvZ4hzWLPdzxk6ly9NVm',1583296970),(75,4,'VbTjYK3SQnYb-gLH3-q_LeCK','$2y$10$cLXTrVUAbvJmhstAuPeuoeIeRRemg8Q.rSCiS4SaAiVORhJsErqvy',1583296971),(76,4,'rMDZD5bT-95YC8wpK1-KcXsi','$2y$10$HulVMDGh3JHphNebYnq4quN6ohR1/N2Qf5jFd6Ad70kEBNil.P5mK',1583296976),(77,4,'F0PNuP3FI5x6d0Ur_MjGIfUZ','$2y$10$nTE/eXUEqiM1yAY2mgX5ZOnINQe1ftdKm.O8ZHN58yp/Yos37lBF6',1583299439),(78,4,'qEjjuExklY7CvNPRZGLp1dyv','$2y$10$IdC2qB3S99fZolw1LonERO8lTBFy1tfyvVpeys99cgUjb.hjghsva',1583299441),(79,4,'XUuIznKAyGtn4b_YqXUo62aB','$2y$10$TmF7Zdu.5xGTwO8tm8zqNekaAA7SEehCLwOwW4ZmE3ALQb4fbaTo6',1583299613),(80,4,'46PHJpQMvko73n2SU4N8haT-','$2y$10$ss5vOMIU8jomRMYk1cyKxef3NsTJwNXQC3sgaah4kHfLJUNXf5ucm',1583299613),(81,4,'j8hiMlY452pXRbMmEOyqs3OB','$2y$10$DAKxfOcn5qI8x39/ryZLWOcH5rxcI2w5xwjPtR/UP0jb6xCq8MIrK',1583299615),(82,4,'rQv8H-1XOMmSEa1bluH3qEf7','$2y$10$pTFYFluus9FNpemIgH6KqeJdi1sr0yuAkWn2Dl1aCvd/oqKtbY3te',1583301817),(83,4,'eyOYHJjoA4IvHpiqUyT0szsh','$2y$10$kQpXBfSbzHCJbijGb8xg3u8f173Mk6AsvEzVIO5P517xVI/xxs7oK',1583304214),(84,4,'_lQuPmsVdyDMhHx2KE4htsUM','$2y$10$1goSD6mPlPILu4sDGY5up.gYluXTzKQZSs5wn8S/rhuS.EaraSc/a',1583304736),(85,4,'hhuut5tGMs-ByYnVFAjnKldU','$2y$10$7u.tWOelsEYRXEn7DuzC8up1QZZ4acjXEVXhc7ZWMVSBJIJ.uMdfa',1583306023),(86,4,'KGMutiSCmeM1QVjZ26KVNITj','$2y$10$OgjJUwDDtd8p3xDopWV62On6Vt.ooE9adrkIPB4IkpwwV8zafXPVi',1583363499),(87,5,'iaxG970PV_ikEv0_92mct8oi','$2y$10$9HfAITcsgKwL4mp.DnaOEe5tGfW14nA5PaWNdIu9jGISrgmZpfef6',1583369327),(88,5,'X-e8BkXif6FSf1uhXCGzHSHH','$2y$10$W3OmRwNh.Ujo//cscGBfReTwCA54A.MfbA6IkvTNQxTC5amO3Nuba',1583370440),(89,5,'LWpXIAScC4Tm5uyKT64r2H0_','$2y$10$EHyx8oRXfkk6fyLVbqbqWujXTvVB1uOsrl7eBhnKCipiTo/dEA3g6',1583370484),(90,4,'_ZlF-iDNdI5GdOFe-8x8U_kY','$2y$10$tztr24fnYjEqUd3OHPcb9OzlkstlXCisz/yCgknSrj2yWdBSpXxce',1583370626),(91,4,'53sZbcPuhacFbuVMnBgb_LDI','$2y$10$hmmSnwgYNXxybnufiiSdMOCzC4MVGvfCNgsPNFCkTp7gy5Sn6l2EK',1583373694),(92,4,'S2oN_CjpLFIKDdW-Eh5nOU7s','$2y$10$IcA8pytPVYa3Ob2St1gvfusKc5tmDTLrRYjeFxZdWOrvBMaw/kV2i',1583374026),(93,4,'dGRhoCqRki9Bv_gIUPh-Ss--','$2y$10$XOtRERYYsCGu/rFsnI6Xiec5DwLyrq0Q/7XuGy4YCciluAbKvRSVC',1583381789),(94,4,'pVWJx2r920vQtXUhj8RmRXpj','$2y$10$UrVDEcp3.NW9ZsXELF2M6O9MLa4MmJBuwSUfVNlhqQfitnoiO408G',1583381791),(95,4,'QG1U9fCzY7NjNIfZ0NJyT4ba','$2y$10$qdcLmMC4/x8LjU97aADQCOzs6C4GI1I4.zR4Oqtw3sbZa1vOrAFbi',1583382119),(96,4,'5t9S8QWuhUT8I-XwRpTAwGOv','$2y$10$Hf72T2lMxX6vXbcnDAd7eeQGoaC5M4VsEm9LQplrWB0qnDRLA3Oee',1583389082),(98,5,'Ge95FG5UtdMrOUVXbOjyPo4a','$2y$10$3mYZTbMRZ8/lNaoWeY/QgusC8BfC5q5prOIbPGbrrJs0evvDUUpgK',1583452917),(99,1,'sLegXXJYTOH1cEJcei76QDRU','$2y$10$je4EZYjvG1ZptQ4GkANwIevDRE8ykdK7V1iYSUtnNG4M5hUGlZvbW',1583456818),(102,3,'FHGZgpdDueZ7SkuLUpV4lSNt','$2y$10$zSQk4RWJzf460bi4N7O2DuVIn9fSXIuwR4CCmzB4r0Vmk5nmxVjta',1583475521),(103,1,'O1FVx8tenjKBBiSjtJJkOCnM','$2y$10$eOi1H9SnO9uQAGTmbo5hRuttC5n.GhzU5zQwx1BL7nqieIX4J5lla',1583478163),(104,5,'OzORjifkBhZ_TljA7521Pd6x','$2y$10$STJlHt4SvC/vtNH2U0jsX.TBvkUE8.1ewSklOXo7RJ2bFnaULDYky',1583535905),(105,5,'AoYsVtoTNuTnTio8YAxWDZDY','$2y$10$vD3xaG/vNenR4/PQBCmabO84xEjZsPgPvEtiG15Qe.WjTEUzs/FQ2',1583535908),(106,5,'UGhtwyeRoF3JO4khK2KS_i6a','$2y$10$zAlETWzBCKljbPZ0GhWC1uYnInN/Vo1RkJ512qVVjPVqKtWygX2kG',1583536760),(107,5,'MCs1n1-bVQw6q3JJEdvtMdRF','$2y$10$Lkrz4t/h6JMeSvBTZ.tABe.zXeyv8noSkHATY9Vbvg8USp0KaiM1u',1583624129),(108,5,'01SCaGSDrtwG7FT1h3pPLOEb','$2y$10$pGNzWt9DZExM99xEzOP/uuTQC8hIHEFCqSX6iXAU.yP/CHLRIYsdK',1583794988),(109,4,'tOcq0HMKr2TR5YQfVw14B0Db','$2y$10$VOZag/ZejDJbXq0OVWPpw.Xa/J.lKnZjWW3g6ZTu7ShEgsLJSn2Sa',1583796595),(110,4,'R_RWEZ7bdXQ5jotFcLvZFKnO','$2y$10$8P4.et27UYxdhRxQuokxzur93x5iiqjmWlVaVhnvR4910bY1pYNh6',1583804639),(111,4,'EXS0gbFtcaSal_KkIB7SPVxL','$2y$10$IeCnr0koqxdOWq2TGdEGxeFO81wE9S6/dBl4S8Ns0oouf061AeRVO',1583806181),(112,4,'RE5v1yklo-q5Rl0MT9fopJE2','$2y$10$Ekr7pWXQCT/3Iba7fVmQT.hqyHOwA0Cylsc97gusrJgRS3ZcxOGs.',1583814555),(113,4,'ZvQojLYVl9tH9wfU8trfTc_q','$2y$10$A5wZ9qUpyLfef2SSlvvc8.6PU0oZOtPQK/.9gZzQ5yyuKDiuK2NLS',1583814652),(114,4,'5o7N4JU-CN0sPAFgkwVaZ9Mt','$2y$10$kKpXd374O9zsZg/cSk/zSuwilWWHMxd18THhD7oFMRUg4.1raOseS',1583816091),(115,4,'cMN4XUyRnsqVVseDoQ3oWzoM','$2y$10$LK/moibvdPe1UW.puJ05m.HSjBG5CrQBcA9EYrBYh9Sgn11/EsTO6',1583825564),(116,4,'4VQPJLtaU3OG9kRXldHRrk5z','$2y$10$XlrTEhleufEUBv.WvZk.su8s0DEIhoVrgyQdyPOnyxyIkYFF.khym',1583881035),(117,5,'w_vYFjVS-VXdOEIpwOEODtDM','$2y$10$uGnHfq8Gwv.uvklax1moMuwSLWIqyp9NEolfkb/o2ONJxPNnaQRTm',1583881427),(118,4,'rzgKkRjIFaLI6D3r_vbAfGlS','$2y$10$gQYSM8PXK2futKhp3ODOpO.chwszFpmTUpAliHdDpZB6eLPLze8/O',1583892966),(119,2,'mjz0k3M-_x0bqXIPxcXMudhy','$2y$10$urHXhIN3Kh7BJLU8xb5ICORHMoWE8XmreWLp04G4GQ4PV/uK1CPpi',1583896916),(120,1,'szwEuBIFLT7fvdFZnV1rJCN1','$2y$10$qlcxfvt9Y679Ys9YE1amGubTDPOAuF74bT5c/9BHMIPnuSsa5amQW',1583918070),(121,5,'8T5SslyygJTT3h9lHjaeHtos','$2y$10$.TDMp7jHeIViKWLXypt.EuVIVqCCsBguzjMy3ZLitbAUNmhhDHXUC',1583967220),(122,4,'d7szFSIKO6hhXRBadDS4qI9p','$2y$10$h05u.ybxdmzJ63xRADxO3ODEGrRybtvAnuLInPWizOJou8AaTuQnO',1583967341),(123,4,'yMoTPJTkO6GeTe6KTua2knI4','$2y$10$xVJd4KEFGggK8J2JZtzzleBoRdCQLifaThmX2Ut1WjuXjNu0Czksu',1583968670),(124,4,'2UbiRkv3FlNQie5KT7pGZKyd','$2y$10$35afA7rO6lpcafisCBxGNObLZY9iN74Ck52.gS6XQpKvAVi78UHOu',1583986064),(125,4,'jpsjbsx8HAoYFbLHMrkjw_0W','$2y$10$FmCH71UqBSVbqLx7ZNww2u3mbozL.i9jsEyjfD2Fwouk13Qriu.u2',1583987812),(126,4,'v85YfZAf0PQSgqyLiqGyud14','$2y$10$owM1m7ofhjUWgEW.YOZXnO9saKFw.RkHMHpDMF4/Ydp4Epn0DQNiW',1583987855),(127,4,'ldrUZ21sYOD9NPkks_74OSfO','$2y$10$m6l5ljoFufCLURqzaq2fNuES5h9dUS03f.ezT4ScCk6LFDVcZ96A2',1583987857),(128,4,'-JFFXbyiEIQArSO7ZU0WBC9m','$2y$10$YyvpbqwFN4FwhJSjNYbgGu2ReyEDHAT0RmjXw5pWHEINJODrqj7zm',1583994450),(129,1,'qwcqsZW60-Zkx2lBfcjowhIc','$2y$10$/as7EMcT9NreKv88L4dFu.2WXQLVVz72uSsXDdosPlwBcPZNFVdk2',1583995052),(130,2,'l73CW7Qgzdq_YgKfNkgdOQ2O','$2y$10$a3iFfavJtaTyjQIkoPiiYuOYCJqOQkHyb8izLlFEfr/Y3G8vqmIYW',1583995780),(131,4,'OEBD2ccMExpYa7YVjeetqOJF','$2y$10$f2RCSHqp2qXeKRJfCrMxxuPYIFIuSsJzfnSJ13ijqUy1cD5fFUtTm',1583998970),(132,4,'bqWJByrwqyUNtrZCYLJhY9uj','$2y$10$X8rskCZg0G1wHkdx1cRLHu/XHXV5vVTUvxZva8FJyoFB0Fx3G0PMS',1584000191),(133,4,'kb94SGUbIhkFfLHSuFNIWEqK','$2y$10$UGeYZE.ZUWydRUhGjv09b.0sJqkOKKUPV9/a8bXgfz8jQz6aD0saS',1584055241),(134,5,'8sPOAXfzVknmH33qYHnn1Z0w','$2y$10$/vt24f4ljTSJ7UuPQwP4pOko8FlAfLh7KeraoB.eriBtz/pfUUGYq',1584058589),(135,4,'OjBfnDEpMwQNhBJyZy9tkROj','$2y$10$nlLShNaHMMtMC37siTDEeuWqB0MCwnmsLu3dZFL2PuiBHbcI9Us6y',1584061599),(136,4,'CeLIVte56saKI22xhW3cJQWG','$2y$10$3rgrEjO8Hv.JuYJtHDfQRu0ddEyKvZIXiyNCOLthuwNeAGPyIozHm',1584063562),(137,5,'JRZLsFIhwTwPatRjfA-uVpiT','$2y$10$xw7s8CxvqWHsxYhDUaIJm.8Ef2UqffatehTtH2s1IkZo.mJBb4imG',1584065026),(138,4,'hwycs59uxfutK7sXrbhOCRk-','$2y$10$NpzxCSP6DHWmAr/JIbMfneyjPyJdY7YNxHvaqW5CPP6ofBygFNble',1584072558),(139,4,'FTwEnutEh-aZGO24QyHi7R_h','$2y$10$3aZ8jKUtsut5RVig6Yp0v.dFbN/.12xRL/IDwAQPQUg0m6e9.vOHS',1584074415),(140,4,'z66tW10Ajzv1tS2ZVEByiRmo','$2y$10$2jjV7wxeJy6z8XTTqPEit.ar/K5k7pOTav6.imPMGnsILmvM4Y7pa',1584075039),(141,4,'ryJXpTTV-duFbFgxLNIevCF0','$2y$10$KGB4iuiJ2wiHk0j0vZwyLO3IM0FTHwM94Qzk.SJCbpS0ijdG4kgSy',1584075098),(142,1,'sVk--CJxCw_Zde_ovQQhV3Gf','$2y$10$8gJaCd4pzYIoP5DCRiL8O.ZZgj.QEPCREt1Qn3fdCerOHC9wHFMgO',1584075120),(143,4,'V9XC9Gmmav3nhLS4ltUKkQgb','$2y$10$ko0qE3kf3.rxizoOCwBqf.p4twKizzHykdlLlVmFf4rqvkMhN6Jv.',1584075774),(144,4,'vJvQravLc2hSGRwCRj_mYpUg','$2y$10$gl6OGrRdqsqaX3QULbKFnO.1k/lAv68DNAJBiJTENRzxvQuLgb4fu',1584078485),(145,1,'ZS08uCKBukMaCBDSls1IdSli','$2y$10$fCRa/ClbvcQkDvOyIS8SDO5aGMLpdmZ2O1P9b2SUM79nhfI9Ctxwe',1584084205),(146,5,'IK1fDrMcICaY_LIUNX-6sUl7','$2y$10$VDvr/laBCVhgkSxnTAuDR.GXB/q0gJeZq0rVEOYI7I9pwnZuKSbAy',1584141058),(147,4,'tYcQxaJMRwGfXkNMNUmEBfd-','$2y$10$rXAzW3cHQQcOF7O/M1/rRe7a16keyBg0.CHZ1Rr2unIkq6TqBroGG',1584144104),(148,2,'MsEGPJC0kI9i6pHHhJc9XmA-','$2y$10$QPhB0/V3QkArf2MkTYuJ2O7MOC93UPKvcSmtbXc2cKLrRu/eY2NRe',1584144914),(149,4,'HHb44jB5a_Oc2lttzocF04lC','$2y$10$jz9OBUO4b.FoLknUXrG3Nu6rxj/.XUW/1WG6aSzniedT1Lv/UpcVC',1584148768),(150,4,'tg_5Asmb_iIS6X0klFgW6yu3','$2y$10$EWnzevHbGxRxFUhXuHnzUeZ3cC/0SWtlMh8oYELc25o39V2gmsIG.',1584163433),(151,4,'q32rXf128Jw41x07oFoYJAAn','$2y$10$WJcY2E8CXNLOZdgqHmkoXeYOwjSfxB5guZD3b3wcPcsehHlZwD5HK',1584166474),(152,4,'Y2_kb8DFfs817uyMKNk6MxoI','$2y$10$r8mYd1yJA.ECw4.YlY31L.zl./UkUeIQzjCap4u8Pj/LiIXvEmMw6',1584171645),(153,4,'TzG1lFx16KBrtEKiCO0VFeS9','$2y$10$j8rvpiKeW7I4OrlIpI93Ke2yvsE0WDkA1.MqEqTUa39DSv75eRcVK',1584228614),(154,5,'7tuLaaNeCQkxSAOXximfR4FQ','$2y$10$dL2i07uD/uMkxJckn199IOKxYEaZICzOxFuLGhUJbyrC0BoVSLixq',1584230194),(155,5,'KVCj0YQU1nHy8Xcr52xBvZ-5','$2y$10$qlmf/3TZyuihQ9xPUpDafOkmoAMyieXqaE7bh6XeyePU0U5iu.c66',1584242625),(156,5,'dS-P2_C2jP2WuTHj9LzVLw1P','$2y$10$TmH58PakW6AwRvTMLWXJK.h79HCydzs5bu7s4LU21IKw1i.is6BLC',1584399668),(157,4,'flvaJg6jh0qmz203Q5lfJykO','$2y$10$EsxBEeegRe9MWl67SAiH7exssf8Y8OsHjNjuhjgniN6BuoRKLLMp2',1584404692),(158,4,'HSqNNtKndpamDkAHgs9Lxs8c','$2y$10$.icgYN8C9UdzlZT/XyLgtuJT8ttJLdRDTVAobVtaSGE6R08VWFb3C',1584408297),(159,4,'gVttC13loUtN046NSS9U8Pb_','$2y$10$OCi751BmhSLR0RNk4ICqwuDRkYWFqCvRoIV3LUM8V1OwTkWuSRAd6',1584411674),(160,4,'RZ_nHkNxM8kEU-IpIGRCEX7S','$2y$10$bAVavhv0Vf2jZR7zbc7C..OPc4wMLFvD4MH4LqW4DYn8MDwazwm5G',1584412745),(161,4,'cHHqQu4lfMdUMlfSKJAK5wYR','$2y$10$hWnjG6DDdnNoZmBEOs6e1OORiPqvBhOa0LAA7H46thulgz8jbardS',1584419488),(162,4,'-qNBB_lAfDZZLG4RfVkrDEB5','$2y$10$oHuY0DlC2Ijl9hFk0KU3zeK8wwkwn18K5SvxGT71zGrZiErSadhAO',1584420550),(163,4,'knK9mP-mCAJE0elkhUR2hFbI','$2y$10$7TH5yKAFg5ePeslDtzV10.sPe8gywPaFyFaixzc2pSBJkNUXgo6yC',1584420571),(164,4,'wxww5oxupwY4hZwFqnHaf-cY','$2y$10$Mws028YsQiAklZoXKcAje./y2p7m4RoNmkaIskDif8cqepSMYFu0a',1584421316),(165,4,'ubAUL9Pt6pMh-NNiTwjyrm85','$2y$10$m1zd7cbAWhmuTtqHPEMxNultiX558A8YJzWmK6zKKavMJ.SXSTXXa',1584422066),(166,1,'o81OQK9zNfGkBSGiuV2LyMLX','$2y$10$AoKpB2GLPdSS7B/Zb5W6z.S9FrdiB9bLMYqo6Cl5xB9.cmNBBys9K',1584422911),(167,5,'8HxXAhBjYv93mKf2AtyH1L5K','$2y$10$s.MpVxbu1YXypIgD0KRm/es.A.FTSCsv6O0vckQRk3aHLDfgNOU9W',1584423071),(168,5,'MLXQBVhZ8QH_XUOhLstHBgSu','$2y$10$/3TaR7WZGEaRgmYlt0xeHuzcwS4D7y5pmuSZmIwYqxKpCdDQT6E2q',1584423210),(169,4,'c7DbJXG8oC9Oq_Gt99lRhKGw','$2y$10$sagjALsgPLmH8sxqUvEu8OYLGE0PKYZ27q0p/6fpGJqa3.snahbii',1584423410),(170,4,'KY1tWopmnJr7ryI3mkdpDkia','$2y$10$M7r0eVUqUTLIFc6ZhkpRYOeLDEyBy.iT3LzBxA1RQDp72bFU/OhK6',1584424281),(171,4,'1cqzu9ZXM8f6HpPqOP-yD8SI','$2y$10$f7oqxJdxQrBXKDcgrq/zrOVTm/jnmaKVDduX0QH/FH7HeEQahH3zq',1584424494),(172,4,'8lAaV452Jaaj54klQS6wy91p','$2y$10$V/Yo5n3mWjkAmTwcU6FXg.mrY1rdhvvaKTGgR8ScvgVWa6L.g1GIa',1584426147),(173,4,'g6mX9CFQ6neN4MCUhhMn7ar7','$2y$10$th.fB1B/cS.6fvV6uqkR4O37Xi3I3eWQbDgebigPVjj8e6ZZPzX5S',1584431854),(174,1,'kLG6Vc7o3UmBZIA1gdi3_tpu','$2y$10$ls4I/J5lsE2NX7fTo0ivIOD2YA/ZOsGvik2PL1H7bZMjFp8BHL/Ee',1584515417),(175,2,'WwHPhBU3se42KW_Z58mldG9s','$2y$10$0xN0nX5093CiQ/CRJLbxcO0fzcJOZ4c/fg6uBihBBPARbdRjDMGum',1584518973),(176,1,'JarVyGc6ApL-daSPi-8GOGEs','$2y$10$VH07PxhBqNs.cCrV22l9VOLnrCpVXikuRxIrsOkHcaNKVNXfw5EjO',1584599878),(177,1,'FlrI-Xq1HCP9bQb9yiBEK2iu','$2y$10$ZgHzTm0zWYb1rfG3B9O.puYzKZNIV4Nsh/zzbi1jcoHg64eqvCMrK',1585111656),(178,1,'ZjpTv9Q4bCaaNNDMwdCAivkr','$2y$10$.sLL44CIRoi9nY/Itb2wLei.x.ogIdH.V57ORAB8AfdNqCn8TxE4a',1585208694),(179,1,'9UU0lGvpoHY65uR13n4ODUZY','$2y$10$gfcdbMKtZ7xYtoA5udsJ5uw/G7ludXAMaFaln3uBrQWFoWy3HlSda',1585297088),(180,1,'O1Gid84FnUoVWshZITiA8Tph','$2y$10$yECUvcGgKmQVY0c2f/pZMuxTuN9buPDXZVAET/TPbAXvePQcfenEe',1585464062),(181,1,'RhY6HXuLNMWlqx2VBELSpRVC','$2y$10$CF2asnKcPDPQ1VPJuHMGnuEOVEy3lgGdj51ekp.dmJKH0NPrpv5U.',1585623710),(182,2,'LXbSwpgsoxQI-H7-jI3zliu-','$2y$10$kAjvbYwTtB3Fu9EudT.d6OuBC9EOuyP7q.NLPS8dCY/40/lqoj2Fm',1585711652),(183,2,'mDcVG89dKK368qzw34767NlQ','$2y$10$iFkTjE3O/NzcmkV1Meb7reubIsw0a2/P35wxHNGUlbf1RLbqYMHZq',1585889126),(184,1,'Il92AQSofwUi9exnLk0XsEo2','$2y$10$4KFPMn5/fPCmm58doSASxeScn516aAwF/o2yB59WwlYkS9bSK6swq',1586010489),(185,1,'9r3vkCk-MFOcEtlx6m5XjtNI','$2y$10$PbpbjwZYQSIfK8i.5.AFWe54jHzSFDZbx/3HhLTQLuV6IcDUelrGC',1587024406),(186,2,'PzV-tV9cFo_X5EvNRrGKe_fQ','$2y$10$HH76pmD7DpsU4KfHnIGZ6OZ66S3Cxb3ufjBhA2jqqghYNW2BkzbVK',1587534357),(187,2,'a0m_ZKhZVCl861Pj4ehLuNsl','$2y$10$qMNTjbyLBMP4qzgNUEauU.fKhx1cX1qFWIzZGNwEZp4aptlB9fzRy',1587891823),(188,2,'MG603C-h-PKT30h78dkXq3T-','$2y$10$WEatFk27dpblvOLxbz0ileaBITKQXzt73osniuDrDi4CoyZRwMXqS',1588131231),(189,2,'L3kqv--onWAalBMZW3oi7uFd','$2y$10$/2oFoRsGWzUXNPIAXSzpwe1hgLTbUsFXz4yNF5Y0AD6esZ4UnI1aO',1588131905),(190,1,'hLvSHUOnhCu3SEovWRyBi4T-','$2y$10$OKuqM6avqdGBVEVfHSoMueXpBLvpaIxcoQm9PULyHWPROVx4Lpn8O',1588132663),(191,2,'o2o9ItqIRUtnSHDapCh70S7E','$2y$10$v/CyfYCMdENZL4eplpcLi.EpvSINRGA.14vabtuGqrxW9JvZDbG/S',1588133937),(192,1,'qbMmavlehY7tGTIGJhPAPET7','$2y$10$W3tALME39swPmw0Alr5wBeShwbAiYO.whSvuTwKeFrSSr56kHNrpu',1588137780),(193,1,'8xdP7YxScIygUBXLxtX0QV6G','$2y$10$qSUBQsJ6PtqEalAxunSOsuP0Ovz.1inDNzmkmXBDbT8hO4Jmrs.EC',1588139541),(199,2,'EB_gfQ6Q65_zsVYdZehXoRim','$2y$10$9mIqpvdJX71HePm6PtdQrOEgZCuP/XMpGNPGzSCWSDN9IzYZO3KRm',1588225366),(198,7,'jJXg387t6NwGqIyQdqUt2dJa','$2y$10$Jln.SC8RM1Vczz8SZEb8S.R5QzP8b4MZV4224dIiXZbNFTXesdAdK',1588225021),(197,7,'3NkYz57sXLxpRp8gBBqTACn9','$2y$10$J3jNURoGnl7nZe2enQJoyumTWBd54FY.V0DhPlY/KE7p6asvbD066',1588225002),(200,2,'AugxLx344wvo32jzwzep8jPc','$2y$10$d9Gj266KdVU4Pwa9i5fyM.OR7YIgNwGccX9EiJy.QXmn0Iy9KFQg6',1588338583),(201,2,'TJWJISMyaj9MeAtCZvbX2e_4','$2y$10$x17WYYk8I8yytOEUW.67LubybSt/GbhkbgrALCe0eZ2dm6mPcZRU2',1588338757),(202,5,'UTaQTFKnWkeWk-pZq30Vf2Pi','$2y$10$W7hGHc8SARhPzlAJm71KlOYWVg71d9007Hpq0rofqnz1p9abI2KUu',1588338909),(203,2,'LV9mwEjXOSz7zhWrOUGwsrWO','$2y$10$Q7bjncwbYnH45HIQ3RrNru4hVUPokALnkYwDe7yBCvUp3ul/ttASG',1588340352),(204,2,'g6lvWph6RpCF7xNC76IHqSOt','$2y$10$SFL6YJk1vP6ByStdpggyB.JNrHIkcYaUzZ23cviEFQ98mNE4qh12C',1588391335),(205,2,'7LSVXCmXKWt3c_klvX442rPC','$2y$10$HrIcBXXq/WYFCjv3.PnsTeYNMunTA0XPXUM7snLyVH002BdEMmdKK',1588408599),(206,2,'Grc9-vWZLY9Mt1YHgmGKzZTv','$2y$10$i6JQAer.LGJ9suzfIQhMzuOJngFC5xEG2xhxzVXj9hOVphxoybZI2',1588648086),(207,1,'oea4dVayNV8r_eREdG-HXGGx','$2y$10$/sOpBxcm97avui.mklLTm.NRRSTafEXDFTznSXa9eosLN3dVLDb2a',1588659387),(208,1,'c79jUZYyGaIz0rKbS2GjZTvP','$2y$10$yBs4d0hjAiP/ZIpqGGWjDux7L5b4KPoiii7FpJnZr6cz./IcPmSem',1588665318),(209,1,'uIvUVR-XpSEPCVM_rrjgnuLA','$2y$10$9movtIvcDVdMgfnX1affruUgWz9GMZboNPSHvJ7Ym2o8CoQPX4GZ6',1590024070),(211,1,'EuUOl7XpKGeCEucTc0hXV96Y','$2y$10$WLSH55OeocdEj94DTgIZDOHUEqM4Bes0IB7J4I6sjtsijga69C/6y',1590031643),(212,1,'nz7nVpg-zBCdvzWOh2hGmMcs','$2y$10$tfuTZ0bDgsDzWm4cFnVLXee.OypG6YLLR97pefbWTcV9nFHujTzne',1590126368),(213,1,'w0zhDGdU42IkhvlbDDmg4S6e','$2y$10$EvNCRSXMHqxAsx.JcTb2JOlwP8w0burQRN6gGEdDrHOUnFIdaPwUq',1590137580),(214,1,'x_lU9MoISqxUTQHofSwyDge2','$2y$10$m5cfQenuu7bNW2dcYlrUguI52W3WmiA5BvFQeqMs/7mU4oDR9T4de',1590137725),(215,1,'qZVym4757AwhuK2CNT8vUCqm','$2y$10$WOu0hUd64KjwyMlv27CWLuWZUKsDL8iFJtNt2oeAV4aFXfNiAfwRm',1590220998),(216,1,'ZvvgLHOXxmHjm0g-Qafe8m-n','$2y$10$ExWuc.NRyz/qJFrgIZCB0e6ISPmyOYglIfVvX5OTQb0FFeDW/xvkK',1590221490),(217,1,'4qGE8tysvqzN7IGhmTKZlLlg','$2y$10$XX7wqGVaxGN5wskj0rxR.uGPWzs19fU9qrcPngY7.VGsKqbeWBuXG',1590222542),(218,1,'S0r_beoW6da4r2BqTiXJZGwS','$2y$10$xUKrwYXFNy7LX1VCtBP9nuPvmakDNXrAFm.6Xca1md47YrvTjkeQ2',1590222718),(219,1,'Q0gKe8C-_BOpIz50QKAi3Dx-','$2y$10$8Txc/AUymGydkuI5AAXAOuEw8fjdoIAOhr13mZdScKPh0ScLLpP1q',1590642067),(220,1,'MyrTmXFdBN8QX0UUJaY36MVB','$2y$10$D7NUvau0nsQTJqUDFPZYQeCyhGZ3p5BQmt4Dqme1gJKYKTiC6e8LK',1591063827),(221,1,'gsgrpHb-_QVkacPy3abqi0Av','$2y$10$Ut2kEeDH5TklvKooFr.ua.koOQgvpnwqJOt3dyiYnC/.8.gArKCm2',1591348263),(222,1,'cfPMUlAxe0TaHkBYn6NeDa8C','$2y$10$wX7cjtoiiFm.xVEii3cq7ey2iKTNH9CusexVR28k9ErskD7AJq.xy',1591406326),(223,1,'Runaozlm-k-96rCkTSkihC_m','$2y$10$bnY/OHlppC2gisfEOAdkjex5yNu5Ap9ifx0OMQ2caduW.oxdO9kE6',1591940356);
/*!40000 ALTER TABLE `users_remembered` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_resets`
--

DROP TABLE IF EXISTS `users_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_resets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `selector` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `selector` (`selector`),
  KEY `user_expires` (`user`,`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_resets`
--

LOCK TABLES `users_resets` WRITE;
/*!40000 ALTER TABLE `users_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_throttling`
--

DROP TABLE IF EXISTS `users_throttling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_throttling` (
  `bucket` varchar(44) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `tokens` float unsigned NOT NULL,
  `replenished_at` int(10) unsigned NOT NULL,
  `expires_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`bucket`),
  KEY `expires_at` (`expires_at`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_throttling`
--

LOCK TABLES `users_throttling` WRITE;
/*!40000 ALTER TABLE `users_throttling` DISABLE KEYS */;
INSERT INTO `users_throttling` VALUES ('ejWtPDKvxt-q7LZ3mFjzUoIWKJYzu47igC8Jd9mffFk',74,1591897155,1592437155),('8JQn3b885sjBhDxNRzXMEJQ5VBlozKipuUYlmSnNZ7I',72.4561,1582309400,1582849400),('uig2Rm3EmdKuCLq6jKYv5_iRDjhZCoeih9IzvI0sGGU',19,1582309394,1582345394),('CPp3likdNEiRsTVt2kj31SFn7Ce2Z4FxbEqjTKB9CoU',499,1582309394,1582482194),('Cfi2W3xt5VR-SVZifU-LqEjpO0wq_DpcwxwpbiallqQ',74,1584379709,1584919709),('qul4wa9ViDILiCV9UYLS0mkpJ-cgZzxjvibgcczgtI0',72.0044,1588604886,1589144886),('j6OF7wdfDb74HPK3Rx2opEIFjNPSb1sjKInMvQmqghQ',18.0067,1588604877,1588640877),('IY64Qd5NIjyG3JMjvqMd3z7GW5d4g5L5RUB3NGsfdPU',498.035,1588604877,1588777677),('5EjxSM6pgP5ZFpeuSWHTHwtthnPpB-QXygGll2BNX2A',71.0211,1582900898,1583440898),('CLFqO-nXkZXA6Sf37SmgR80aG2lI_1Qka3yXjf4fDYw',64.5324,1582919115,1583459115),('y-ts9znHZkoU_Kj5Tdfr02irFFOZsW4v63GwDvkaJvI',19,1582914118,1582950118),('bXGgmyiVy3i89ZLxT_dzUlvyRN4AJyRrNvkiueOkxNg',498.058,1584368463,1584541263),('PgQ6pNsGTSmX0bqEsnQfsfsTDbRcQO1Bo4gGgMftI3Q',69.734,1582979364,1583519364),('Kmw6SLULdy5-mTZC65HAB17EIlHeDDI7e-7r1ReGYAA',19,1582976722,1583012722),('UguX5VwK48wUt8ukMNqSFQg0lM9bCOQPnpcteuTHXBw',74,1588622118,1589162118),('p2xto62HiRU67dG--oVKnUR_byDIv_R4xF2yZMMGBwA',72.005,1582985628,1583525628),('kMF7cUKwH3zP7gzWpo7YlcVDBTCDAcSyqnXdpp2ogBY',69.5142,1583156374,1583696374),('4feUyvL7azRzmTwgI0vPeyD0T7m-PObtxIQqnwdNX5o',56.4096,1583262823,1583802823),('bOB7MGDBkouqSkRoJr8O9jToEJ48UOGsTZrSpvGcuAs',72.1264,1583345881,1583885881),('nOUlHcck4ucm5IDLAdktVzkyCGyc6dtbuUyBI8nf5GQ',71.3214,1583327284,1583867284),('pn2RSaY12uY3VUtUPWhHTxPQICBGagULFbp6FJUDPos',19,1583330818,1583366818),('e2T6WG8S8BgR7C9N7HxmBxUYuBKxHlSmAzdwTLlm_ao',73.6875,1583416130,1583956130),('kf_iIgnbdnQi5_WJ95Ix7W2DAGlQT1hPTlwfy182OVc',74,1583409717,1583949717),('1hUDo-UeZAJq_XTvMuulwjMxkrNOvgxNK6Akhi167pI',74,1583432321,1583972321),('gKpTBjXzKzD7w__08moRsnOf5TrVd-ujUphnZa5P5Yk',72.2375,1583493560,1584033560),('OD0yRitOMvoyXWb5dsX4lhVdr9SCeEiXBT3vmShhAAI',74,1583580928,1584120928),('7v1fWDhy-L5VOZjPsqQnhGREK1sMtcJMR2JcyNRjSBM',74,1583751788,1584291788),('7_xWJOgrlHJjho20H6Yr2lJK0TZDJxQEMMywuVFMOU4',74,1583782364,1584322364),('W0S-m0AdeIPrhVOBHghmj24KOv7LDOh5ZWOxMJRNr70',74,1583849766,1584389766),('d2yKawU-DNfKJKls7kp6KlFsRu3c0kkXoD5faEsGVss',74,1583838227,1584378227),('kixAOJxJYBV2OczYkY9k2Hh9cee8mPXsOrywF9tcW4g',74,1583924020,1584464020),('3wBJVWfhifq1AhO0hg0rzv_ARWr5FjOxM4DH3YD98Zo',71.9243,1583956991,1584496991),('pBjX_dGi8KrUPyUqghvFF5JDi3HQ3xCYtMKb7D2lA2k',72.5175,1584031214,1584571214),('JMRnewiPMqQxXll7gWa7oaPvk_PUwTh5JCDwRVy7FTM',74,1584021825,1584561825),('YygTCXy_tJ1kNZF3kUWPGHfUFFRSnHxjFtfrQjBR3GQ',19,1584029351,1584065351),('wkC70mnFltopjSjWaQAKz-m_D8IyNu8nhDHzUYoarVQ',71.9576,1584035285,1584575285),('qZ5aqmU6aLVwaA-oRjnUM1q97tp3IP0BkhEsRrU3_Ok',74,1584041005,1584581005),('gxhClgUUuxLcu6Em0nCrpdQD9d5E8gZVCuJsyiX24x8',74,1584097858,1584637858),('Gw9JJpj9w9w4pFrfq0rIGzpeYv42CIRg42X1nlnh9r8',74,1584128445,1584668445),('-GE3TX_X2xl05J5Ndrc5wdSu2s8McGW3UyOj-kLIF5M',19,1584100895,1584136895),('TN6U_BBEwxpEmagYV035gPoE5VxBsGW5l8y8zApCw7A',74,1584185414,1584725414),('0Srewc_TKkq-v_na5MLT7Kz0arTVP58mnO6FLhIZYZ0',74,1584199425,1584739425),('mqZqvUp6L3lNFtFYY37wR0RJiyk0WaAlsz252vRaR3Q',73.0386,1584380009,1584920009),('z9MdT3QxjrgxkqxCUbfV7g8rJgj8LpbCdM9-zVGTakY',74,1584365097,1584905097),('tAiAAnxCVaoyU3z1hV8uT-Q3dLAzigApyPNq40Pq3vs',72.0056,1584368473,1584908473),('P2NhkHo7ZHhDc6q6TDKBnTSs-R2U8vQXMu3--cgpqmg',18.0111,1584368463,1584404463),('sUgKd9taC-wLA62ZYeQ0Rc-bVH9l3aq7-p2H0EzZFD8',68.435,1584388654,1584928654),('ICj6Jo14Cx3xvKol-Hf6W-69rfuXD2YwZO3gC5HHkdc',73.4892,1588096341,1588636341),('OtLPxUE8N9I0qsru2RosrPsh_gpmHjJI73U8NUa2MAA',74,1585967289,1586507289),('Jjl8HEbTSJpZBWoyXOajJXqciuUdngUbah061jwhliE',19,1590177794,1590213794),('sy6eH-7PCl70FyuQyo_P6SkhyJgGWhF725QL1j4Yo6M',499,1590177794,1590350594);
/*!40000 ALTER TABLE `users_throttling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) DEFAULT NULL,
  `nombre_apellido` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `ci` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `password` varchar(360) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `token` int(4) NOT NULL,
  `adminpass` varchar(360) NOT NULL,
  `verificado` varchar(2) DEFAULT 'si',
  `ultima_sesion` datetime DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `tipo_usuario` varchar(50) NOT NULL,
  `direccion` varchar(350) NOT NULL,
  `foto` varchar(350) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','Super-Administrador del Sistema','admin@frontliner.com','3640820','555666','aa1bb91d337db673c913634999d7b2b2daacca12',1,'2020-03-20 01:11:10',5763,'aa1bb91d337db673c913634999d7b2b2daacca12','si','2020-09-17 10:21:45','181.238.178.202','superadmin','Wall Street','archivos/multimedia/perfil/usuario_1_1.jpg'),(16,'sarcom','Administrador Sarcom','admin@sarcom.com','333666999','000000','aa1bb91d337db673c913634999d7b2b2daacca12',1,'2020-03-20 01:11:10',5763,'aa1bb91d337db673c913634999d7b2b2daacca12','si','2020-06-11 16:25:48','181.238.147.19','admin','River','archivos/multimedia/perfil/usuario_1_1.jpg'),(46,'cli_repuestosbaratos','Repuestos Baratos Via China','venta@respuestosbaratos','111','111','aa1bb91d337db673c913634999d7b2b2daacca12',1,'2024-06-10 16:39:10',0,'aa1bb91d337db673c913634999d7b2b2daacca12','si','2024-06-10 16:39:10',NULL,'cliente','Una direccion numero 1','archivos/multimedia/perfil/usuario_1_1.jpg'),(47,'pro_nihao','Nihao Wo Shu','nihao@repuestos','2222','2222','aa1bb91d337db673c913634999d7b2b2daacca12',1,'2024-06-10 16:40:52',0,'aa1bb91d337db673c913634999d7b2b2daacca12','si',NULL,NULL,'proveedor','222','archivos/multimedia/perfil/usuario_1_1.jpg'),(48,'pro_toyotoshi','Toyotoshi','partes@toyotoshi','3333','3333','aa1bb91d337db673c913634999d7b2b2daacca12',1,'2024-06-10 16:52:12',0,'aa1bb91d337db673c913634999d7b2b2daacca12','si',NULL,NULL,'proveedor','333','archivos/multimedia/perfil/usuario_1_1.jpg'),(49,'cli_reparacionmotos','Reparación de Motocicletas Don Ruedas','reparacion@motocicletas','444','444','aa1bb91d337db673c913634999d7b2b2daacca12',1,'2024-06-10 17:05:15',0,'aa1bb91d337db673c913634999d7b2b2daacca12','si','2024-06-10 17:05:15',NULL,'cliente','444','archivos/multimedia/perfil/usuario_1_1.jpg'),(50,'pro_encomiendaschile','Encomiendas Via Chile','via@chile','555','555','aa1bb91d337db673c913634999d7b2b2daacca12',1,'2024-06-10 17:23:40',0,'aa1bb91d337db673c913634999d7b2b2daacca12','si',NULL,NULL,'proveedor','555','archivos/multimedia/perfil/usuario_1_1.jpg'),(57,'por_dongauto','El portero Don Gauto','9047@856','9047856','9047856','aa1bb91d337db673c913634999d7b2b2daacca12',1,'2024-06-10 19:39:17',0,'aa1bb91d337db673c913634999d7b2b2daacca12','si','2024-06-10 19:39:17',NULL,'portero','9047856','archivos/multimedia/perfil/usuario_1_1.jpg');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'namandu_sarcom'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-10 20:32:26
