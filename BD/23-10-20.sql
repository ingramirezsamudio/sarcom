-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: namandu_sarcom
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `id_auditoria` bigint(20) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `query` text,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES (1,'2020-10-02 13:41:19','UPDATE usuarios SET ci=\'333666999\', nombre_apellido=\'Administrador Sarcom\', telefono=\'000000\', direccion=\'River\', email=\'admin@sarcom.com\', tipo_usuario=\'administrador\', usuario=\'sarcom\', password=\'6c4e0c5614208397072a0cea22d3e601a45831c5\' WHERE id_usuario = \'16\'',''),(2,'2020-10-02 13:42:46','INSERT INTO usuarios(usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, ultima_sesion, tipo_usuario, direccion, foto) VALUES(\'mauramirez\',\'Mauricio Ramirez\', \'mau@ramirez.com\',\'3768826\', \'986532\', \'de5119619d4d830e96256e183aadabe21b494e96\', \'1\', NOW(), \'aa1bb91d337db673c913634999d7b2b2daacca12\', NOW(), \'administrador\', \'direccion1\', \'archivos/multimedia/perfil/usuario_1_1.jpg\')',''),(3,'2020-10-02 13:44:40','UPDATE usuarios SET ci=\'3768826\', nombre_apellido=\'Mauricio Ramirez\', telefono=\'986532\', direccion=\'direccion1\', email=\'mau@ramirez.com\', tipo_usuario=\'encargado\', usuario=\'mauramirez\', password=\'da39a3ee5e6b4b0d3255bfef95601890afd80709\' WHERE id_usuario = \'31\'',''),(4,'2020-10-02 14:41:54','INSERT INTO entidades(ruc, nombre, direccion, telefono, correo, encargado) VALUES(\'123123\',\'123123\', \'123123\',\'123123\',\'123123@123123\',\'123123\')',''),(5,'2020-10-02 14:42:32','INSERT INTO entidades(ruc, nombre, direccion, telefono, correo, encargado) VALUES(\'123123\',\'entidad1\', \'123123\',\'123123\',\'123123@123123\',\'123123123123\')',''),(6,'2020-10-02 14:43:28','INSERT INTO repartidores (nombre, direccion, telefono, correo) VALUES (\'123123\',\'123123\', \'123123\', \'123123@132123\')',''),(7,'2020-10-02 14:50:50','INSERT INTO lotes(id_repartidor, id_entidad, encargado, cantidad, fecha_tope, fecha_registro, estado, id_zona) VALUES(\'\',\'\', \'\',\'\', \'\', NOW(), \'PENDIENTE\', \'\')',''),(8,'2020-10-02 15:09:17','INSERT INTO choferes (id_entidad, nombre, telefono, correo, direccion) VALUES(\'8\',\'123123\', \'123123\',\'123123@123123\', \'123123\')',''),(9,'2020-10-02 15:16:43','UPDATE choferes SET id_entidad=\'6\',ci=\'951\',nombre=\'unodostres\',telefono=\'123123555666\',correo=\'123123@unodostres\',direccion=\'123123\', WHERE id_chofer = \'9\'',''),(10,'2020-10-02 15:18:48','UPDATE choferes SET id_entidad=\'6\', ci=\'951\', nombre=\'unodostres\', telefono=\'123123555666\', correo=\'123123@unodostres\', direccion=\'123123\' WHERE id_chofer = \'9\'',''),(11,'2020-10-02 15:39:08','INSERT INTO entidades(ruc, nombre, direccion, telefono, correo, encargado) VALUES(\'456456\',\'456456\', \'456456\',\'456456\',\'456456@456456\',\'456456\')',''),(12,'2020-10-02 15:49:11','INSERT INTO entidades(ruc, nombre, direccion, telefono, correo, encargado) VALUES(\'999\',\'999\', \'999\',\'999\',\'999@999\',\'999\')',''),(13,'2020-10-02 15:49:28','INSERT INTO entidades(ruc, nombre, direccion, telefono, correo, encargado) VALUES(\'333\',\'333\', \'333\',\'333\',\'333@333\',\'3333\')',''),(14,'2020-10-02 16:15:47','INSERT INTO entidades(ruc, nombre, direccion, telefono, correo, encargado) VALUES(\'987987\',\'987987\', \'987987\',\'987987\',\'987987@987987\',\'987987\')',''),(15,'2020-10-02 16:16:46','UPDATE entidades SET ruc=\'0000\', nombre=\'0000\', direccion=\'0000\', telefono=\'0000\', correo=\'987987@9879870000\', encargado=\'000000\' WHERE id_entidad = \'12\'',''),(16,'2020-10-02 16:56:39','INSERT INTO clientes (ruc, razon_social, direccion, telefono, correo, encargado) VALUES (\'987987\',\'987987\',\'987987\',\'987987\',\'987987@654654\',\'987987\')',''),(17,'2020-10-02 16:59:55','INSERT INTO clientes (ruc, nombre, direccion, telefono, correo, encargado) VALUES (\'654654\',\'654654\',\'654654\',\'654654\',\'654654@654654\',\'654654\')',''),(18,'2020-10-02 17:04:25','INSERT INTO clientes (ruc, razon_social, direccion, telefono, correo, encargado) VALUES (\'987987\',\'987987\',\'987987\',\'987987\',\'987987@987987\',\'987987\')',''),(19,'2020-10-02 17:22:19','INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto) VALUES (\'987987987\',\'987987\',\'987987@987987\',\'987987\',\'987987\',\'a3725688eb00564158ba69cfe4852183676727a0\',\'1\',NOW(),\'aa1bb91d337db673c913634999d7b2b2daacca12\',\'cliente\',\'987987\',\'archivos/multimedia/perfil/usuario_1_1.jpg\')',''),(20,'2020-10-02 17:22:19','INSERT INTO clientes (id_usuario, ruc, razon_social, direccion, telefono, correo, encargado) VALUES (\'32\',\'987987\',\'987987\',\'987987\',\'987987\',\'987987@987987\',\'987987\')',''),(21,'2020-10-02 17:28:39','UPDATE clientes SET ruc=\'987987asd\', razon_social=\'987987asd\', telefono=\'987987asd\', correo=\'987987@987987asd\', direccion=\'987987asd\',encargado=\'987987asd\' WHERE id_cliente = \'15\'',''),(22,'2020-10-02 17:36:21','UPDATE clientes SET ruc=\'987987asdxdxdxd\', razon_social=\'987987asdxdxdxd\', telefono=\'987987asdxdxdxdxd\', correo=\'987987@987987asdxdxdxdxd\', direccion=\'987987asdxdxdxd\',encargado=\'987987asdxdxdxd\' WHERE id_cliente = \'15\'',''),(23,'2020-10-02 17:36:21','UPDATE usuarios SET usuario=\'987987987xdxdxd\', password=\'ba4dc704b63f4234ef678b18d96dadf9c88cff53\' WHERE id_usuario = \'32\'',''),(24,'2020-10-02 17:37:41','UPDATE clientes SET ruc=\'xdddxddd\', razon_social=\'xdddxdddxddd\', telefono=\'xdddxdddxddd\', correo=\'xdddxddd@987987asdxdxdxdxd\', direccion=\'xdddxdddxdddxddd\',encargado=\'xdddxdddxdddxddd\' WHERE id_cliente = \'15\'',''),(25,'2020-10-02 17:37:41','UPDATE usuarios SET usuario=\'xdddxdddxdddxddd\', password=\'afe6dc402144f341b9c543fb49204b8d6e35bded\', nombre_apellido=\'xdddxdddxddd\' WHERE id_usuario = \'32\'',''),(26,'2020-10-06 14:52:27','INSERT INTO puertos (puerto, capacidad_estatica, capacidad_embarque, capacidad_camiones, superficie) VALUES (\'123\',\'123 Tm\',\'123 Tm/día\',\'123 camiones\',\'123 Hectáreas\')',''),(27,'2020-10-06 14:55:02','DELETE FROM puertoes WHERE id_puerto = 2',''),(28,'2020-10-06 14:55:15','UPDATE puertoes SET ruc=\'\', puerto=\'123\', telefono=\'\', direccion=\'\',email=\'\', contacto=\'\' WHERE id_puerto = \'\'',''),(29,'2020-10-06 14:55:48','UPDATE puertos SET ruc=\'\', puerto=\'123\', telefono=\'\', direccion=\'\',email=\'\', contacto=\'\' WHERE id_puerto = \'\'',''),(30,'2020-10-06 14:58:32','DELETE FROM puertos WHERE id_puerto = 2',''),(31,'2020-10-06 14:59:15','INSERT INTO puertos (puerto, capacidad_estatica, capacidad_embarque, capacidad_camiones, superficie) VALUES (\'Concepción\',\'53.000 Tm\',\'8.000 Tm/día\',\'155 Camiones\',\'25 Hectáreas\')',''),(32,'2020-10-06 14:59:22','UPDATE puertos SET puerto=\'San Antonio\', capacidad_estatica=\'260.000 Tm\', capacidad_embarque=\'19.500 Tm/día\', capacidad_camiones=\'600 Camiones\', superficie=\'18,5 Hectáreas\' WHERE id_puerto = \'1\'',''),(33,'2020-10-06 14:59:52','INSERT INTO puertos (puerto, capacidad_estatica, capacidad_embarque, capacidad_camiones, superficie) VALUES (\'Paredón (Hohenau)\',\'58.000 Tm\',\'6.000 Tm/día\',\'213 Camiones\',\'20 Hectáreas\')',''),(34,'2020-10-06 15:00:33','INSERT INTO puertos (puerto, capacidad_estatica, capacidad_embarque, capacidad_camiones, superficie) VALUES (\'Rosario\',\'41.500 Tm\',\'6.000 Tm/día\',\'150 Camiones\',\'12 Hectáreas\')',''),(35,'2020-10-06 16:51:01','INSERT INTO proveedores(ruc, nombre, direccion, telefono, correo, encargado) VALUES(\'987987\',\'987987\', \'987987\',\'987987\',\'987987@654\',\'987987987987\')',''),(36,'2020-10-06 16:51:21','UPDATE proveedores SET ruc=\'0000\', nombre=\'0000\', direccion=\'0000\', telefono=\'0000\', correo=\'000@000\', encargado=\'000000\' WHERE id_proveedor = \'12\'',''),(37,'2020-10-06 16:53:44','DELETE FROM proveedores WHERE id_proveedor = 13',''),(38,'2020-10-06 16:53:48','DELETE FROM proveedores WHERE id_proveedor = 12',''),(39,'2020-10-06 16:53:51','DELETE FROM proveedores WHERE id_proveedor = 11',''),(40,'2020-10-06 16:53:55','DELETE FROM proveedores WHERE id_proveedor = 10',''),(41,'2020-10-06 18:11:03','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad) VALUES (\'13\',\'1\',\'2020-10-06\',\'6\',\'5000\')',''),(42,'2020-10-06 18:11:22','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad) VALUES (\'15\',\'3\',\'2020-10-22\',\'8\',\'1000\')',''),(43,'2020-10-06 18:17:09','UPDATE cupos SET puerto=\'\', capacidad_estatica=\' Tm\', capacidad_embarque=\' Tm/día\', capacidad_camiones=\' Camiones\', superficie=\' Hectáreas\' WHERE id_puerto = \'\'',''),(44,'2020-10-06 18:19:22','UPDATE cupos SET id_cliente=\'15\', id_puerto=\'3\', fecha=\'2020-10-22\', id_proveedor=\'8\', cantidad=\'1000\' WHERE id_cupo = \'3\'',''),(45,'2020-10-06 18:19:38','UPDATE cupos SET id_cliente=\'13\', id_puerto=\'4\', fecha=\'2020-10-30\', id_proveedor=\'6\', cantidad=\'666\' WHERE id_cupo = \'3\'',''),(46,'2020-10-06 18:21:23','DELETE FROM cupos WHERE id_cupo = 3',''),(47,'2020-10-07 16:12:40','INSERT INTO usuarios(usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, ultima_sesion, tipo_usuario, direccion, foto) VALUES(\'superadmin\',\'Superadmin\', \'superadmin@sarcom.com\',\'666999666\', \'Superadmin\', \'889a3a791b3875cfae413574b53da4bb8a90d53e\', \'1\', NOW(), \'aa1bb91d337db673c913634999d7b2b2daacca12\', NOW(), \'cliente\', \'Superadmin\', \'archivos/multimedia/perfil/usuario_1_1.jpg\')',''),(48,'2020-10-07 16:12:40','INSERT INTO clientes (id_usuario, ruc, razon_social, telefono, correo, direccion) VALUES(\'33\',\'666999666\',\'Superadmin\', \'Superadmin\',\'superadmin@sarcom.com\', \'Superadmin\')',''),(49,'2020-10-07 17:09:37','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'33\'',''),(50,'2020-10-07 17:10:12','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(51,'2020-10-07 17:10:46','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(52,'2020-10-07 17:11:07','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(53,'2020-10-07 17:12:24','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(54,'2020-10-07 17:14:01','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(55,'2020-10-07 17:14:28','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'33\'',''),(56,'2020-10-07 17:14:38','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(57,'2020-10-07 17:39:01','INSERT INTO proveedores(ruc, nombre, direccion, telefono, correo, encargado) VALUES(\'234234\',\'234234\', \'234234\',\'234234\',\'234@234234\',\'234234\')',''),(58,'2020-10-07 17:40:58','DELETE FROM proveedores WHERE id_proveedor = 14',''),(59,'2020-10-07 17:41:02','DELETE FROM proveedores WHERE id_proveedor = 9',''),(60,'2020-10-07 17:41:05','DELETE FROM proveedores WHERE id_proveedor = 8',''),(61,'2020-10-07 17:41:09','DELETE FROM proveedores WHERE id_proveedor = 7',''),(62,'2020-10-07 17:41:51','INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto) VALUES (\'proveedor\',\'Transportes S.A\',\'Transportess@Transportess\',\'999888\',\'Transportess\',\'3711da0958245dc019c4a9348ee9f09e3b2250ee\',\'1\',NOW(),\'aa1bb91d337db673c913634999d7b2b2daacca12\',\'proveedor\',\'Transportess\',\'archivos/multimedia/perfil/usuario_1_1.jpg\')',''),(63,'2020-10-07 17:41:51','INSERT INTO proveedores(ruc, id_usuario , nombre, direccion, telefono, correo, encargado) VALUES(\'999888\',\'34\',\'Transportes S.A\', \'Transportess\',\'Transportess\',\'Transportess@Transportess\',\'Transportess\')',''),(64,'2020-10-07 17:42:50','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(65,'2020-10-07 17:43:02','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(66,'2020-10-07 17:43:47','DELETE FROM clientes WHERE id_cliente = 15',''),(67,'2020-10-07 17:44:24','INSERT INTO usuarios (usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, tipo_usuario, direccion, foto) VALUES (\'cliente\',\'Semillas del PY\',\'Semillas@Semillas\',\'888555222\',\'Semillas\',\'d94019fd760a71edf11844bb5c601a4de95aacaf\',\'1\',NOW(),\'aa1bb91d337db673c913634999d7b2b2daacca12\',\'cliente\',\'Semillas\',\'archivos/multimedia/perfil/usuario_1_1.jpg\')',''),(68,'2020-10-07 17:44:24','INSERT INTO clientes (id_usuario, ruc, razon_social, direccion, telefono, correo, encargado) VALUES (\'35\',\'888555222\',\'Semillas del PY\',\'Semillas\',\'Semillas\',\'Semillas@Semillas\',\'Semillas\')',''),(69,'2020-10-07 18:30:23','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(70,'2020-10-07 18:32:22','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(71,'2020-10-07 19:19:26','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(72,'2020-10-07 19:20:01','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(73,'2020-10-07 19:22:07','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad) VALUES (\'17\',\'1\',\'2020-10-09\',\'\',\'666\')',''),(74,'2020-10-07 19:22:44','UPDATE cupos SET id_cliente=\'17\', id_puerto=\'1\', fecha=\'2020-10-09\', id_proveedor=\'0\', cantidad=\'6666\' WHERE id_cupo = \'5\'',''),(75,'2020-10-07 19:22:56','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(76,'2020-10-08 00:12:38','INSERT INTO cupos_proveedor (id_cupos_proveedor, id_cupo, id_proveedor, cantidad) VALUES (\'\',\'\',\'\',\'6\',\'5000\')',''),(77,'2020-10-08 00:12:44','INSERT INTO cupos_proveedor (id_cupos_proveedor, id_cupo, id_proveedor, cantidad) VALUES (\'\',\'\',\'\',\'6\',\'5000\')',''),(78,'2020-10-08 00:17:59','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad) VALUES (\'5\',\'6\',\'5000\')',''),(79,'2020-10-08 00:17:59','UPDATE cupos SET cantidad=cantidad-\'5000\' WHERE id_cupo = \'5\'',''),(80,'2020-10-08 00:18:29','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad) VALUES (\'5\',\'6\',\'1000\')',''),(81,'2020-10-08 00:18:29','UPDATE cupos SET cantidad=cantidad-\'1000\' WHERE id_cupo = \'5\'',''),(82,'2020-10-08 00:19:13','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad) VALUES (\'5\',\'6\',\'600\')',''),(83,'2020-10-08 00:19:13','UPDATE cupos SET cantidad=cantidad-\'600\' WHERE id_cupo = \'5\'',''),(84,'2020-10-08 00:19:28','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad) VALUES (\'5\',\'15\',\'60\')',''),(85,'2020-10-08 00:19:28','UPDATE cupos SET cantidad=cantidad-\'60\' WHERE id_cupo = \'5\'',''),(86,'2020-10-08 10:47:05','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(87,'2020-10-08 10:47:20','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(88,'2020-10-08 15:41:02','UPDATE cupos SET cantidad=cantidad+\'66\' WHERE id_cupo = \'5\'',''),(89,'2020-10-08 15:41:02','UPDATE cupos_proveedor SET cantidad=\'66\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'4\'',''),(90,'2020-10-08 15:42:57','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(91,'2020-10-08 15:43:12','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad) VALUES (\'17\',\'1\',\'2020-10-15\',\'\',\'10000\')',''),(92,'2020-10-08 15:43:21','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad) VALUES (\'17\',\'1\',\'2020-10-22\',\'\',\'5000\')',''),(93,'2020-10-08 15:43:34','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad) VALUES (\'17\',\'1\',\'2020-10-29\',\'\',\'500\')',''),(94,'2020-10-08 15:43:42','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(95,'2020-10-08 15:43:56','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad) VALUES (\'3\',\'15\',\'100\')',''),(96,'2020-10-08 15:43:56','UPDATE cupos SET cantidad=cantidad-\'100\' WHERE id_cupo = \'3\'',''),(97,'2020-10-08 15:45:05','UPDATE cupos SET cantidad=cantidad+\'50\' WHERE id_cupo = \'3\'',''),(98,'2020-10-08 15:45:06','UPDATE cupos_proveedor SET cantidad=\'50\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'1\'',''),(99,'2020-10-08 15:46:18','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad) VALUES (\'3\',\'15\',\'400\')',''),(100,'2020-10-08 15:46:18','UPDATE cupos SET cantidad=cantidad-\'400\' WHERE id_cupo = \'3\'',''),(101,'2020-10-08 15:47:06','UPDATE cupos SET cantidad=cantidad+\'350\' WHERE id_cupo = \'3\'',''),(102,'2020-10-08 15:47:06','UPDATE cupos_proveedor SET cantidad=\'350\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'2\'',''),(103,'2020-10-08 15:48:17','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(104,'2020-10-08 15:48:34','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(105,'2020-10-08 15:48:46','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad) VALUES (\'3\',\'15\',\'500\')',''),(106,'2020-10-08 15:48:46','UPDATE cupos SET cantidad=cantidad-\'500\' WHERE id_cupo = \'3\'',''),(107,'2020-10-08 15:48:59','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad) VALUES (\'3\',\'15\',\'100\')',''),(108,'2020-10-08 15:48:59','UPDATE cupos SET cantidad=cantidad-\'100\' WHERE id_cupo = \'3\'',''),(109,'2020-10-08 15:49:11','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad) VALUES (\'3\',\'15\',\'200\')',''),(110,'2020-10-08 15:49:12','UPDATE cupos SET cantidad=cantidad-\'200\' WHERE id_cupo = \'3\'',''),(111,'2020-10-08 15:49:47','UPDATE cupos SET cantidad=cantidad+\'250\' WHERE id_cupo = \'3\'',''),(112,'2020-10-08 15:49:47','UPDATE cupos_proveedor SET cantidad=\'250\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'3\'',''),(113,'2020-10-08 15:50:14','UPDATE cupos SET cantidad=cantidad+\'200\' WHERE id_cupo = \'3\'',''),(114,'2020-10-08 15:50:14','UPDATE cupos_proveedor SET cantidad=\'200\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'4\'',''),(115,'2020-10-08 15:50:41','UPDATE cupos SET cantidad=cantidad+\'500\' WHERE id_cupo = \'3\'',''),(116,'2020-10-08 15:50:41','UPDATE cupos_proveedor SET cantidad=\'500\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'5\'',''),(117,'2020-10-08 15:50:52','UPDATE cupos SET cantidad=cantidad+\'250\' WHERE id_cupo = \'3\'',''),(118,'2020-10-08 15:50:52','UPDATE cupos_proveedor SET cantidad=\'250\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'4\'',''),(119,'2020-10-08 15:52:16','UPDATE cupos SET cantidad=cantidad+\'100\' WHERE id_cupo = \'3\'',''),(120,'2020-10-08 15:52:16','UPDATE cupos_proveedor SET cantidad=\'400\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'5\'',''),(121,'2020-10-08 15:52:28','UPDATE cupos SET cantidad=cantidad+\'150\' WHERE id_cupo = \'3\'',''),(122,'2020-10-08 15:52:28','UPDATE cupos_proveedor SET cantidad=\'100\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'4\'',''),(123,'2020-10-08 15:52:33','UPDATE cupos SET cantidad=cantidad+\'150\' WHERE id_cupo = \'3\'',''),(124,'2020-10-08 15:52:33','UPDATE cupos_proveedor SET cantidad=\'100\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'3\'',''),(125,'2020-10-08 15:52:49','UPDATE cupos SET cantidad=cantidad+\'-100\' WHERE id_cupo = \'3\'',''),(126,'2020-10-08 15:52:50','UPDATE cupos_proveedor SET cantidad=\'500\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'5\'',''),(127,'2020-10-08 15:52:56','UPDATE cupos SET cantidad=cantidad+\'-150\' WHERE id_cupo = \'3\'',''),(128,'2020-10-08 15:52:56','UPDATE cupos_proveedor SET cantidad=\'250\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'4\'',''),(129,'2020-10-08 15:53:00','UPDATE cupos SET cantidad=cantidad+\'-150\' WHERE id_cupo = \'3\'',''),(130,'2020-10-08 15:53:00','UPDATE cupos_proveedor SET cantidad=\'250\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'3\'',''),(131,'2020-10-08 17:57:46','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(132,'2020-10-08 18:04:57','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(133,'2020-10-09 10:32:57','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(134,'2020-10-09 10:33:12','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad) VALUES (\'2\',\'15\',\'500\')',''),(135,'2020-10-09 10:33:12','UPDATE cupos SET cantidad=cantidad-\'500\' WHERE id_cupo = \'2\'',''),(136,'2020-10-09 10:33:49','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(137,'2020-10-09 11:48:54','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso) VALUES (\'5\',\'8\',\'asdasd\',\'2020-10-09\')',''),(138,'2020-10-09 11:48:54','UPDATE cupos_proveedor SET estado=\'ASIGNADO\' WHERE id_cupos_proveedor = \'5\'',''),(139,'2020-10-09 11:51:06','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso) VALUES (\'3\',\'5\',\'AAA005\',\'2020-10-09\')',''),(140,'2020-10-09 11:51:06','UPDATE cupos_proveedor SET estado=\'ASIGNADO\' WHERE id_cupos_proveedor = \'3\'',''),(141,'2020-10-09 11:51:31','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso) VALUES (\'6\',\'5\',\'OOO555\',\'2020-10-09\')',''),(142,'2020-10-09 11:51:31','UPDATE cupos_proveedor SET estado=\'ASIGNADO\' WHERE id_cupos_proveedor = \'6\'',''),(143,'2020-10-09 13:42:23','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso) VALUES (\'4\',\'5\',\'999999\',\'2020-10-09\')',''),(144,'2020-10-09 13:42:24','UPDATE cupos_proveedor SET estado=\'ASIGNADO\' WHERE id_cupos_proveedor = \'4\'',''),(145,'2020-10-09 13:47:39','DELETE FROM cupos WHERE id_cupo =',''),(146,'2020-10-09 13:52:59','DELETE FROM tickets WHERE id_ticket = 5',''),(147,'2020-10-09 13:52:59','UPDATE cupos_proveedor SET estado=\'DISPONIBLE\' WHERE id_cupos_proveedor = \'\'',''),(148,'2020-10-09 13:53:49','DELETE FROM tickets WHERE id_ticket = 4',''),(149,'2020-10-09 13:53:49','UPDATE cupos_proveedor SET estado=\'DISPONIBLE\' WHERE id_cupos_proveedor = \'\'',''),(150,'2020-10-09 13:55:41','DELETE FROM tickets WHERE id_ticket = 3',''),(151,'2020-10-09 13:55:41','UPDATE cupos_proveedor SET estado=\'DISPONIBLE\' WHERE id_cupos_proveedor = \'3\'',''),(152,'2020-10-09 13:58:52','UPDATE tickets SET id_chofer=\'6\', chapa=\'AAA111\', fecha_ingreso=\'2020-10-09\' WHERE id_ticket = \'2\'',''),(153,'2020-10-09 13:59:10','UPDATE tickets SET id_chofer=\'5\', chapa=\'AAA001\', fecha_ingreso=\'2020-10-09\' WHERE id_ticket = \'1\'',''),(154,'2020-10-09 14:29:37','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(155,'2020-10-09 14:35:14','INSERT INTO choferes (id_entidad, ci, nombre, telefono, correo, direccion) VALUES(\'6\',\'555\',\'555\', \'555\',\'555@555\', \'555\')',''),(156,'2020-10-09 14:35:31','INSERT INTO choferes (id_proveedor, ci, nombre, telefono, correo, direccion) VALUES(\'6\',\'555\',\'555\', \'555\',\'555@555\', \'555\')',''),(157,'2020-10-09 14:35:42','INSERT INTO choferes (id_proveedor, ci, nombre, telefono, correo, direccion) VALUES(\'15\',\'234234\',\'234234\', \'234234\',\'234234@243234\', \'234234\')',''),(158,'2020-10-09 14:35:46','DELETE FROM lotes WHERE id_lote = 11',''),(159,'2020-10-09 14:35:51','DELETE FROM lotes WHERE id_lote = 11',''),(160,'2020-10-09 14:36:04','DELETE FROM lotes WHERE id_lote = 11',''),(161,'2020-10-09 14:36:31','DELETE FROM choferes WHERE id_chofer = 11',''),(162,'2020-10-09 14:36:34','UPDATE choferes SET id_entidad=\'15\', ci=\'555\', nombre=\'555\', telefono=\'555\', correo=\'555@555\', direccion=\'555\' WHERE id_chofer = \'10\'',''),(163,'2020-10-09 14:36:40','DELETE FROM choferes WHERE id_chofer = 10',''),(164,'2020-10-09 14:36:43','DELETE FROM choferes WHERE id_chofer = 9',''),(165,'2020-10-09 14:37:08','UPDATE choferes SET id_proveedor=\'15\', ci=\'333\', nombre=\'Ignacio Ignis\', telefono=\'666\', correo=\'696969@666\', direccion=\'666\' WHERE id_chofer = \'8\'',''),(166,'2020-10-09 14:37:20','UPDATE choferes SET id_proveedor=\'15\', ci=\'333\', nombre=\'Ignacio Ignis666\', telefono=\'666333\', correo=\'696969@666333\', direccion=\'666333\' WHERE id_chofer = \'8\'',''),(167,'2020-10-09 14:39:57','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(168,'2020-10-09 14:39:57','UPDATE repartidores SET ubicacion_actual=\'-25.291460200000003,-57.567438100000004\' WHERE id_repartidor = \'\'',''),(169,'2020-10-09 14:40:04','UPDATE repartidores SET ubicacion_actual=\'-25.291407500000005,-57.56747316666667\' WHERE id_repartidor = \'\'',''),(170,'2020-10-09 14:40:04','UPDATE repartidores SET ubicacion_actual=\'-25.291407500000005,-57.56747316666667\' WHERE id_repartidor = \'\'',''),(171,'2020-10-09 14:40:04','UPDATE repartidores SET ubicacion_actual=\'-25.291407500000005,-57.56747316666667\' WHERE id_repartidor = \'\'',''),(172,'2020-10-09 14:40:11','UPDATE repartidores SET ubicacion_actual=\'-25.29143159333959,-57.567414888133214\' WHERE id_repartidor = \'\'',''),(173,'2020-10-09 14:40:11','UPDATE repartidores SET ubicacion_actual=\'-25.29143159333959,-57.567414888133214\' WHERE id_repartidor = \'\'',''),(174,'2020-10-09 14:40:11','UPDATE repartidores SET ubicacion_actual=\'-25.29143159333959,-57.567414888133214\' WHERE id_repartidor = \'\'',''),(175,'2020-10-09 14:40:20','UPDATE repartidores SET ubicacion_actual=\'-25.291412643994438,-57.567479961663324\' WHERE id_repartidor = \'\'',''),(176,'2020-10-09 14:40:20','UPDATE repartidores SET ubicacion_actual=\'-25.291412643994438,-57.567479961663324\' WHERE id_repartidor = \'\'',''),(177,'2020-10-09 14:40:20','UPDATE repartidores SET ubicacion_actual=\'-25.291412643994438,-57.567479961663324\' WHERE id_repartidor = \'\'',''),(178,'2020-10-09 14:40:29','UPDATE repartidores SET ubicacion_actual=\'-25.291399899999995,-57.567502299999994\' WHERE id_repartidor = \'\'',''),(179,'2020-10-09 14:40:29','UPDATE repartidores SET ubicacion_actual=\'-25.291399899999995,-57.567502299999994\' WHERE id_repartidor = \'\'',''),(180,'2020-10-09 14:40:29','UPDATE repartidores SET ubicacion_actual=\'-25.291399899999995,-57.567502299999994\' WHERE id_repartidor = \'\'',''),(181,'2020-10-09 14:40:41','UPDATE repartidores SET ubicacion_actual=\'-25.291401857142862,-57.56746942857144\' WHERE id_repartidor = \'\'',''),(182,'2020-10-09 14:40:41','UPDATE repartidores SET ubicacion_actual=\'-25.291401857142862,-57.56746942857144\' WHERE id_repartidor = \'\'',''),(183,'2020-10-09 14:40:41','UPDATE repartidores SET ubicacion_actual=\'-25.291401857142862,-57.56746942857144\' WHERE id_repartidor = \'\'',''),(184,'2020-10-09 14:47:12','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(185,'2020-10-09 14:53:11','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(186,'2020-10-09 15:44:48','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(187,'2020-10-09 15:48:18','INSERT INTO choferes (id_proveedor, ci, nombre, telefono, correo, direccion) VALUES(\'15\',\'234234\',\'234234\', \'234234\',\'234234@234234\', \'234234\')',''),(188,'2020-10-09 15:48:24','DELETE FROM choferes WHERE id_chofer = 12',''),(189,'2020-10-09 15:48:45','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(190,'2020-10-09 15:50:08','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(191,'2020-10-09 15:51:57','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(192,'2020-10-09 15:57:05','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, fecha_fin) VALUES (\'13\',\'5\',\'2020-10-09\',\'\',\'5000\',\'2020-10-10\')',''),(193,'2020-10-09 15:57:18','UPDATE cupos SET id_cliente=\'13\', id_puerto=\'5\', fecha=\'2020-10-01\',fecha_fin=\'2020-10-30\', id_proveedor=\'0\', cantidad=\'5000\' WHERE id_cupo = \'4\'',''),(194,'2020-10-12 14:14:45','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(195,'2020-10-12 14:21:48','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, fecha_fin) VALUES (\'17\',\'1\',\'2020-10-12\',\'\',\'100\',\'2020-10-13\')',''),(196,'2020-10-12 14:23:09','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(197,'2020-10-12 14:25:15','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'5\',\'15\',\'50\',\'DISPONIBLE\')',''),(198,'2020-10-12 14:25:15','UPDATE cupos SET cantidad=cantidad-\'50\' WHERE id_cupo = \'5\'',''),(199,'2020-10-12 14:26:14','UPDATE cupos SET cantidad=cantidad+\'10\' WHERE id_cupo = \'5\'',''),(200,'2020-10-12 14:26:14','UPDATE cupos_proveedor SET cantidad=\'40\', id_proveedor=\'6\' WHERE id_cupos_proveedor = \'8\'',''),(201,'2020-10-12 14:27:06','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'5\',\'15\',\'55\',\'DISPONIBLE\')',''),(202,'2020-10-12 14:27:06','UPDATE cupos SET cantidad=cantidad-\'55\' WHERE id_cupo = \'5\'',''),(203,'2020-10-12 14:27:56','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(204,'2020-10-12 14:29:58','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso) VALUES (\'9\',\'2\',\'AAA555\',\'2020-10-13\')',''),(205,'2020-10-12 14:29:58','UPDATE cupos_proveedor SET estado=\'ASIGNADO\' WHERE id_cupos_proveedor = \'9\'',''),(206,'2020-10-12 14:32:22','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(207,'2020-10-12 14:33:21','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(208,'2020-10-13 09:24:00','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(209,'2020-10-13 09:26:20','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso) VALUES (\'3\',\'\',\'\',\'2020-10-13\')',''),(210,'2020-10-13 09:26:20','UPDATE cupos_proveedor SET estado=\'ASIGNADO\' WHERE id_cupos_proveedor = \'3\'',''),(211,'2020-10-13 09:27:04','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso) VALUES (\'6\',\'\',\'\',\'2020-10-13\')',''),(212,'2020-10-13 09:27:04','UPDATE cupos_proveedor SET estado=\'ASIGNADO\' WHERE id_cupos_proveedor = \'6\'',''),(213,'2020-10-13 16:48:35','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(214,'2020-10-13 16:49:15','DELETE FROM tickets WHERE id_ticket = 8',''),(215,'2020-10-13 16:49:15','UPDATE cupos_proveedor SET estado=\'DISPONIBLE\' WHERE id_cupos_proveedor = \'6\'',''),(216,'2020-10-13 17:01:08','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso, estado) VALUES (\'6\',\'0\',\'\',\'2020-10-13\',\'PENDIENTE\')',''),(217,'2020-10-13 17:01:08','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'6\'',''),(218,'2020-10-13 17:02:05','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso, estado) VALUES (\'6\',\'0\',\'\',\'2020-10-13\',\'PENDIENTE\')',''),(219,'2020-10-13 17:02:05','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'6\'',''),(220,'2020-10-13 17:02:19','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso, estado) VALUES (\'6\',\'0\',\'\',\'2020-10-13\',\'PENDIENTE\')',''),(221,'2020-10-13 17:02:19','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'6\'',''),(222,'2020-10-13 17:07:36','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso, estado) VALUES (\'6\',\'\',\'\',\'2020-10-13\',\'PENDIENTE\')',''),(223,'2020-10-13 17:07:36','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'6\'',''),(224,'2020-10-13 17:07:53','UPDATE tickets SET id_chofer=\'0\', chapa=\'\', fecha_ingreso=\'2020-10-13\' WHERE id_ticket = \'7\'',''),(225,'2020-10-13 17:08:43','UPDATE tickets SET id_chofer=\'8\', chapa=\'\', fecha_ingreso=\'2020-10-13\' WHERE id_ticket = \'12\'',''),(226,'2020-10-13 17:12:51','UPDATE tickets SET id_chofer=\'8\', chapa=\'AUY652\', fecha_ingreso=\'2020-10-13\' WHERE id_ticket = \'12\'',''),(227,'2020-10-13 17:13:19','DELETE FROM tickets WHERE id_ticket = 11',''),(228,'2020-10-13 17:13:19','UPDATE cupos_proveedor SET estado=\'DISPONIBLE\' WHERE id_cupos_proveedor = \'6\'',''),(229,'2020-10-13 17:13:58','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso, estado) VALUES (\'6\',\'\',\'\',\'2020-10-13\',\'PENDIENTE\')',''),(230,'2020-10-13 17:13:58','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'6\'',''),(231,'2020-10-13 17:14:04','DELETE FROM tickets WHERE id_ticket = 13',''),(232,'2020-10-13 17:14:04','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad+1 WHERE id_cupos_proveedor = \'6\'',''),(233,'2020-10-14 10:17:24','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(234,'2020-10-14 10:17:46','INSERT INTO usuarios(usuario, nombre_apellido, email, ci, telefono, password, estado, fecha_registro, adminpass, ultima_sesion, tipo_usuario, direccion, foto) VALUES(\'portero\',\'Portero\', \'portero@portero\',\'987654\', \'portero\', \'803762734d378fbf888101eb93cd66d0a5cd343e\', \'1\', NOW(), \'aa1bb91d337db673c913634999d7b2b2daacca12\', NOW(), \'encargado\', \'portero\', \'archivos/multimedia/perfil/usuario_1_1.jpg\')',''),(235,'2020-10-14 10:18:41','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'36\'',''),(236,'2020-10-14 10:28:01','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'36\'',''),(237,'2020-10-14 10:28:24','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'36\'',''),(238,'2020-10-14 10:28:49','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'36\'',''),(239,'2020-10-14 10:30:12','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(240,'2020-10-14 10:30:20','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'36\'',''),(241,'2020-10-14 15:17:33','UPDATE tickets SET estado=\'UTILIZADO\' WHERE id_tickets = \'12\'',''),(242,'2020-10-14 15:17:46','UPDATE tickets SET estado=\'UTILIZADO\' WHERE id_ticket = \'12\'',''),(243,'2020-10-14 15:19:04','UPDATE tickets SET estado=\'UTILIZADO\' WHERE id_ticket = \'12\'',''),(244,'2020-10-14 15:27:58','UPDATE tickets SET estado=\'UTILIZADO\' WHERE id_ticket = \'6\'',''),(245,'2020-10-14 15:30:40','UPDATE tickets SET estado=\'UTILIZADO\' WHERE id_ticket = \'9\'',''),(246,'2020-10-14 15:33:41','UPDATE tickets SET estado=\'UTILIZADO\' WHERE id_ticket = \'\'',''),(247,'2020-10-14 15:33:50','UPDATE tickets SET estado=\'UTILIZADO\' WHERE id_ticket = \'\'',''),(248,'2020-10-14 15:34:12','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(249,'2020-10-14 15:34:49','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, fecha_fin) VALUES (\'17\',\'3\',\'2020-10-14\',\'\',\'10\',\'2020-10-15\')',''),(250,'2020-10-14 15:34:59','DELETE FROM cupos WHERE id_cupo = 5',''),(251,'2020-10-14 15:35:03','DELETE FROM cupos WHERE id_cupo = 3',''),(252,'2020-10-14 15:35:07','DELETE FROM cupos WHERE id_cupo = 4',''),(253,'2020-10-14 15:35:11','DELETE FROM cupos WHERE id_cupo = 2',''),(254,'2020-10-14 15:35:14','DELETE FROM cupos WHERE id_cupo = 1',''),(255,'2020-10-14 15:35:29','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(256,'2020-10-14 15:37:25','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'6\',\'15\',\'5\',\'DISPONIBLE\')',''),(257,'2020-10-14 15:37:25','UPDATE cupos SET cantidad=cantidad-\'5\' WHERE id_cupo = \'6\'',''),(258,'2020-10-14 15:37:43','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'6\',\'6\',\'2\',\'DISPONIBLE\')',''),(259,'2020-10-14 15:37:43','UPDATE cupos SET cantidad=cantidad-\'2\' WHERE id_cupo = \'6\'',''),(260,'2020-10-14 15:37:55','UPDATE cupos SET cantidad=cantidad+\'-3\' WHERE id_cupo = \'6\'',''),(261,'2020-10-14 15:37:55','UPDATE cupos_proveedor SET cantidad=\'8\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'10\'',''),(262,'2020-10-14 15:39:24','UPDATE cupos_proveedor SET cantidad=\'2\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'11\'',''),(263,'2020-10-14 15:40:07','UPDATE cupos_proveedor SET cantidad=\'2\', id_proveedor=\'6\' WHERE id_cupos_proveedor = \'11\'',''),(264,'2020-10-14 15:40:53','UPDATE cupos_proveedor SET cantidad=\'2\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'11\'',''),(265,'2020-10-14 15:40:59','UPDATE cupos_proveedor SET cantidad=\'2\', id_proveedor=\'6\' WHERE id_cupos_proveedor = \'11\'',''),(266,'2020-10-14 15:41:25','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(267,'2020-10-14 15:42:05','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso, estado) VALUES (\'10\',\'2\',\'AAA565\',\'2020-10-14\',\'PENDIENTE\')',''),(268,'2020-10-14 15:42:05','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'10\'',''),(269,'2020-10-14 15:42:43','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso, estado) VALUES (\'10\',\'7\',\'POV896\',\'2020-10-14\',\'PENDIENTE\')',''),(270,'2020-10-14 15:42:43','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'10\'',''),(271,'2020-10-14 15:42:59','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_ingreso, estado) VALUES (\'10\',\'6\',\'UIG555\',\'2020-10-14\',\'PENDIENTE\')',''),(272,'2020-10-14 15:42:59','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'10\'',''),(273,'2020-10-14 15:43:31','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'36\'',''),(274,'2020-10-14 15:43:51','UPDATE tickets SET estado=\'UTILIZADO\' WHERE id_ticket = \'16\'',''),(275,'2020-10-14 15:44:09','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(276,'2020-10-14 16:06:49','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(277,'2020-10-14 16:06:58','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(278,'2020-10-14 16:07:15','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(279,'2020-10-14 16:08:22','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(280,'2020-10-14 16:18:16','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'36\'',''),(281,'2020-10-14 16:23:25','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(282,'2020-10-16 15:14:43','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'36\'',''),(283,'2020-10-16 15:55:18','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(284,'2020-10-16 15:55:25','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(285,'2020-10-16 16:04:16','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(286,'2020-10-16 17:24:27','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(287,'2020-10-16 17:25:14','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(288,'2020-10-16 17:25:39','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, fecha_fin) VALUES (\'17\',\'3\',\'2020-10-16\',\'\',\'10\',\'2020-10-17\')',''),(289,'2020-10-16 17:25:58','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, fecha_fin) VALUES (\'17\',\'3\',\'2020-10-17\',\'\',\'50\',\'2020-10-18\')',''),(290,'2020-10-16 17:26:16','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'8\',\'15\',\'15\',\'DISPONIBLE\')',''),(291,'2020-10-16 17:26:17','UPDATE cupos SET cantidad=cantidad-\'15\' WHERE id_cupo = \'8\'',''),(292,'2020-10-16 17:26:30','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'7\',\'6\',\'8\',\'DISPONIBLE\')',''),(293,'2020-10-16 17:26:30','UPDATE cupos SET cantidad=cantidad-\'8\' WHERE id_cupo = \'7\'',''),(294,'2020-10-16 17:51:27','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'7\',\'15\',\'2\',\'DISPONIBLE\')',''),(295,'2020-10-16 17:51:27','UPDATE cupos SET cantidad=cantidad-\'2\' WHERE id_cupo = \'7\'',''),(296,'2020-10-16 17:52:55','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'6\',\'15\',\'2\',\'DISPONIBLE\')',''),(297,'2020-10-16 17:52:55','UPDATE cupos SET cantidad=cantidad-\'2\' WHERE id_cupo = \'6\'',''),(298,'2020-10-16 17:56:20','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'7\',\'15\',\'2\',\'DISPONIBLE\')',''),(299,'2020-10-16 17:56:20','UPDATE cupos SET cantidad=cantidad-\'2\' WHERE id_cupo = \'7\'',''),(300,'2020-10-19 15:21:27','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(301,'2020-10-19 15:25:30','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(302,'2020-10-19 15:25:39','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(303,'2020-10-19 15:26:40','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(304,'2020-10-19 15:34:16','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'36\'',''),(305,'2020-10-19 15:36:24','UPDATE tickets SET estado=\'UTILIZADO\' WHERE id_ticket = \'14\'',''),(306,'2020-10-19 15:39:42','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(307,'2020-10-19 15:40:35','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(308,'2020-10-19 15:41:23','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(309,'2020-10-20 15:06:09','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(310,'2020-10-20 15:06:32','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'6\',\'15\',\'2\',\'DISPONIBLE\')',''),(311,'2020-10-20 15:06:32','UPDATE cupos SET cantidad=cantidad-\'2\' WHERE id_cupo = \'6\'',''),(312,'2020-10-20 15:09:06','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'8\',\'6\',\'5\',\'DISPONIBLE\')',''),(313,'2020-10-20 15:09:06','UPDATE cupos SET cantidad=cantidad-\'5\' WHERE id_cupo = \'8\'',''),(314,'2020-10-20 15:12:36','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'8\',\'6\',\'5\',\'DISPONIBLE\')',''),(315,'2020-10-20 15:12:36','UPDATE cupos SET cantidad=cantidad-\'5\' WHERE id_cupo = \'8\'',''),(316,'2020-10-20 15:12:59','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'8\',\'6\',\'25\',\'DISPONIBLE\')',''),(317,'2020-10-20 15:12:59','UPDATE cupos SET cantidad=cantidad-\'25\' WHERE id_cupo = \'8\'',''),(318,'2020-10-20 15:17:57','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado) VALUES (\'8\',\'15\',\'5\',\'DISPONIBLE\')',''),(319,'2020-10-20 15:17:57','UPDATE cupos SET cantidad=cantidad-\'5\' WHERE id_cupo = \'8\'',''),(320,'2020-10-20 15:17:57','UPDATE cupos SET estado=\'AGOTADO\' WHERE id_cupo = \'8\'',''),(321,'2020-10-20 15:33:16','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'36\'',''),(322,'2020-10-20 15:47:09','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'36\'',''),(323,'2020-10-20 19:06:22','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(324,'2020-10-21 16:45:13','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(325,'2020-10-22 16:28:16','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(326,'2020-10-22 16:28:41','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, fecha_fin) VALUES (\'17\',\'1\',\'2020-10-22\',\'\',\'50\',\'2020-10-23\')',''),(327,'2020-10-22 16:28:57','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, fecha_fin) VALUES (\'17\',\'1\',\'2020-10-24\',\'\',\'35\',\'2020-10-25\')',''),(328,'2020-10-22 16:29:10','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, fecha_fin) VALUES (\'17\',\'3\',\'2020-10-22\',\'\',\'50\',\'2020-10-23\')',''),(329,'2020-10-22 16:29:32','INSERT INTO cupos (id_cliente, id_puerto, fecha, id_proveedor, cantidad, fecha_fin) VALUES (\'17\',\'1\',\'2020-10-24\',\'\',\'100\',\'2020-10-25\')',''),(330,'2020-10-22 16:51:26','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(331,'2020-10-22 16:51:58','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada) VALUES (\'1\',\'15\',\'25\',\'DISPONIBLE\',\'25\')',''),(332,'2020-10-22 16:51:58','UPDATE cupos SET cantidad=cantidad-\'25\' WHERE id_cupo = \'1\'',''),(333,'2020-10-22 16:52:19','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada) VALUES (\'1\',\'15\',\'20\',\'DISPONIBLE\',\'20\')',''),(334,'2020-10-22 16:52:19','UPDATE cupos SET cantidad=cantidad-\'20\' WHERE id_cupo = \'1\'',''),(335,'2020-10-22 16:52:34','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada) VALUES (\'1\',\'6\',\'5\',\'DISPONIBLE\',\'5\')',''),(336,'2020-10-22 16:52:34','UPDATE cupos SET cantidad=cantidad-\'5\' WHERE id_cupo = \'1\'',''),(337,'2020-10-22 16:52:34','UPDATE cupos SET estado=\'AGOTADO\' WHERE id_cupo = \'1\'',''),(338,'2020-10-22 16:55:29','UPDATE cupos SET cantidad=cantidad+\'5\' WHERE id_cupo = \'1\'',''),(339,'2020-10-22 16:55:29','UPDATE cupos_proveedor SET cantidad=\'15\', cantidad_asignada=\'15\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'2\'',''),(340,'2020-10-22 16:55:38','UPDATE cupos SET cantidad=cantidad+\'-5\' WHERE id_cupo = \'1\'',''),(341,'2020-10-22 16:55:38','UPDATE cupos_proveedor SET cantidad=\'10\', cantidad_asignada=\'10\', id_proveedor=\'6\' WHERE id_cupos_proveedor = \'3\'',''),(342,'2020-10-22 16:55:50','UPDATE cupos SET cantidad=cantidad+\'5\' WHERE id_cupo = \'1\'',''),(343,'2020-10-22 16:55:50','UPDATE cupos_proveedor SET cantidad=\'20\', cantidad_asignada=\'20\', id_proveedor=\'15\' WHERE id_cupos_proveedor = \'1\'',''),(344,'2020-10-22 16:56:12','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada) VALUES (\'1\',\'15\',\'5\',\'DISPONIBLE\',\'5\')',''),(345,'2020-10-22 16:56:12','UPDATE cupos SET cantidad=cantidad-\'5\' WHERE id_cupo = \'1\'',''),(346,'2020-10-22 16:56:12','UPDATE cupos SET estado=\'AGOTADO\' WHERE id_cupo = \'1\'',''),(347,'2020-10-22 16:56:27','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'1\'',''),(348,'2020-10-22 17:00:29','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'35\'',''),(349,'2020-10-22 17:00:46','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada) VALUES (\'2\',\'6\',\'30\',\'DISPONIBLE\',\'30\')',''),(350,'2020-10-22 17:00:46','UPDATE cupos SET cantidad=cantidad-\'30\' WHERE id_cupo = \'2\'',''),(351,'2020-10-22 17:00:57','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada) VALUES (\'2\',\'15\',\'5\',\'DISPONIBLE\',\'5\')',''),(352,'2020-10-22 17:00:57','UPDATE cupos SET cantidad=cantidad-\'5\' WHERE id_cupo = \'2\'',''),(353,'2020-10-22 17:00:57','UPDATE cupos SET estado=\'AGOTADO\' WHERE id_cupo = \'2\'',''),(354,'2020-10-22 17:01:14','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada) VALUES (\'4\',\'6\',\'50\',\'DISPONIBLE\',\'50\')',''),(355,'2020-10-22 17:01:14','UPDATE cupos SET cantidad=cantidad-\'50\' WHERE id_cupo = \'4\'',''),(356,'2020-10-22 17:01:25','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada) VALUES (\'3\',\'6\',\'25\',\'DISPONIBLE\',\'25\')',''),(357,'2020-10-22 17:01:25','UPDATE cupos SET cantidad=cantidad-\'25\' WHERE id_cupo = \'3\'',''),(358,'2020-10-22 17:01:36','INSERT INTO cupos_proveedor (id_cupo, id_proveedor, cantidad, estado, cantidad_asignada) VALUES (\'3\',\'15\',\'25\',\'DISPONIBLE\',\'25\')',''),(359,'2020-10-22 17:01:36','UPDATE cupos SET cantidad=cantidad-\'25\' WHERE id_cupo = \'3\'',''),(360,'2020-10-22 17:01:36','UPDATE cupos SET estado=\'AGOTADO\' WHERE id_cupo = \'3\'',''),(361,'2020-10-22 17:01:48','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(362,'2020-10-22 17:06:51','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'34\'',''),(363,'2020-10-22 17:07:14','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado) VALUES (\'1\',\'2\',\'AAA111\',\'2020-10-22\',\'PENDIENTE\')',''),(364,'2020-10-22 17:07:14','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'1\'',''),(365,'2020-10-22 17:07:35','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado) VALUES (\'1\',\'8\',\'AAB222\',\'2020-10-22\',\'PENDIENTE\')',''),(366,'2020-10-22 17:07:35','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'1\'',''),(367,'2020-10-22 17:07:47','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado) VALUES (\'1\',\'7\',\'ABB333\',\'2020-10-22\',\'PENDIENTE\')',''),(368,'2020-10-22 17:07:47','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'1\'',''),(369,'2020-10-22 17:08:15','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado) VALUES (\'1\',\'5\',\'AMOKOSE666\',\'2020-10-22\',\'PENDIENTE\')',''),(370,'2020-10-22 17:08:15','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'1\'',''),(371,'2020-10-22 17:08:36','INSERT INTO tickets (id_cupos_proveedor, id_chofer, chapa, fecha_de_creacion, estado) VALUES (\'1\',\'6\',\'ACV369\',\'2020-10-23\',\'PENDIENTE\')',''),(372,'2020-10-22 17:08:36','UPDATE cupos_proveedor SET estado=\'INICIADO\', cantidad=cantidad-1 WHERE id_cupos_proveedor = \'1\'',''),(373,'2020-10-22 17:08:58','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'16\'',''),(374,'2020-10-23 09:55:52','UPDATE usuarios SET ultima_sesion=now() WHERE SHA2(CONCAT(\'Ñ@m@ndu-2020\',id_usuario), 512)=\'36\'','');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculos_precios`
--

DROP TABLE IF EXISTS `calculos_precios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calculos_precios` (
  `id_calculo_precio` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) DEFAULT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `tipo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL COMMENT 'Precio Efectivo, Precio Lista, Precio Mayorista, Precio Distribuidor',
  `precio_desde` int(11) DEFAULT NULL,
  `precio_hasta` int(11) DEFAULT NULL,
  `incremento` decimal(4,2) DEFAULT NULL COMMENT 'Ejemplo: 1.30, 1.40, 1.15',
  `redondeo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL COMMENT 'Redondeo de moneda. Ej: 50,100,500',
  PRIMARY KEY (`id_calculo_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=327 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculos_precios`
--

LOCK TABLES `calculos_precios` WRITE;
/*!40000 ALTER TABLE `calculos_precios` DISABLE KEYS */;
INSERT INTO `calculos_precios` VALUES (3,1,1,'Efectivo',1951,29000,1.30,'500'),(4,1,1,'Efectivo',29001,100000,1.25,'500'),(5,1,1,'Efectivo',100001,179999,1.18,'500'),(6,1,1,'Efectivo',180000,99999999,1.14,'500'),(7,1,2,'Efectivo',100,1950,1.40,'500'),(8,1,2,'Efectivo',1951,29000,1.25,'500'),(9,1,2,'Efectivo',29001,100000,1.22,'500'),(10,1,2,'Efectivo',100001,200000,1.18,'500'),(11,1,2,'Efectivo',200001,99999999,1.15,'500'),(25,1,1,'Lista',1,99999999,1.05,'500'),(26,1,2,'Lista',100,99999999,1.05,'500'),(31,1,1,'Mayorista',1,99,1.25,'50'),(32,1,1,'Mayorista',100,1950,1.25,'100'),(33,1,1,'Mayorista',1951,100000,1.15,'100'),(34,1,1,'Mayorista',100001,99999999,1.12,'100'),(35,1,2,'Mayorista',100,1950,1.25,'100'),(36,1,2,'Mayorista',1951,100000,1.15,'100'),(37,1,2,'Mayorista',100001,99999999,1.12,'100'),(40,3,1,'Mayorista',100,1950,1.20,'100'),(41,3,1,'Mayorista',1951,100000,1.14,'100'),(42,3,1,'Mayorista',100001,99999999,1.12,'100'),(47,1,2,'Distribuidor',100,99999999,1.11,'100'),(49,3,1,'Distribuidor',100,99999999,1.11,'100'),(51,4,2,'Mayorista',1,29999,1.15,'500'),(52,4,1,'Efectivo',1,99,1.80,'50'),(53,4,1,'Efectivo',300,699,1.40,'50'),(54,4,1,'Efectivo',100,299,1.60,'50'),(55,4,1,'Efectivo',700,1999,1.35,'100'),(56,4,1,'Efectivo',2000,99999999,1.30,'100'),(57,4,1,'Mayorista',1,299,1.40,'10'),(58,4,1,'Mayorista',300,699,1.35,'10'),(59,4,1,'Mayorista',700,1999,1.35,'10'),(60,4,1,'Mayorista',2000,99999999,1.28,'10'),(61,4,2,'Efectivo',1,29999,1.25,'500'),(62,4,2,'Efectivo',30000,89999,1.20,'500'),(63,4,2,'Efectivo',90000,179999,1.18,'500'),(64,4,2,'Efectivo',180000,99999999,1.15,'500'),(65,4,2,'Mayorista',30000,99999999,1.12,'500'),(66,4,2,'Distribuidor',100,99999999,1.11,'500'),(67,3,1,'Efectivo',1,2999,1.40,'500'),(68,3,1,'Efectivo',3000,19999,1.30,'500'),(69,3,1,'Efectivo',20000,99999,1.25,'500'),(70,3,1,'Efectivo',100000,179999,1.20,'500'),(71,3,1,'Efectivo',180000,99999999,1.15,'500'),(72,5,1,'Efectivo',1,29999,1.35,'500'),(73,5,1,'Efectivo',30000,99999999,1.28,'500'),(74,5,2,'Efectivo',1,99999999,1.23,'500'),(75,5,2,'Mayorista',1,99999999,1.12,'500'),(76,5,2,'Distribuidor',1,99999999,1.11,'500'),(77,2,1,'Efectivo',1,1999,1.40,'500'),(78,2,1,'Efectivo',2000,29999,1.30,'500'),(79,2,1,'Efectivo',30000,99999,1.25,'500'),(80,2,1,'Efectivo',100000,179999,1.20,'500'),(81,2,1,'Efectivo',180000,99999999,1.15,'500'),(82,2,2,'Efectivo',100000,99999999,1.15,'500'),(83,2,1,'Mayorista',10000,29999,1.15,'500'),(84,2,1,'Mayorista',30000,99999999,1.12,'500'),(85,2,2,'Efectivo',1,29999,1.25,'500'),(86,2,2,'Efectivo',30000,99999,1.20,'500'),(87,2,2,'Mayorista',100000,99999999,1.12,'500'),(88,2,2,'Mayorista',1,99999,1.15,'500'),(89,2,2,'Distribuidor',1,99999999,1.11,'500'),(90,7,1,'Efectivo',1,9999,1.25,'500'),(91,7,1,'Efectivo',10000,99999,1.25,'500'),(92,7,1,'Efectivo',100000,999999,1.15,'500'),(93,7,1,'Mayorista',1,9999,1.15,'500'),(96,7,1,'Mayorista',10000,99999999,1.12,'500'),(97,7,1,'Distribuidor',1,99999999,1.11,'500'),(99,6,1,'Efectivo',1,9999,1.25,'500'),(100,6,1,'Efectivo',10000,29999,1.15,'500'),(101,6,1,'Efectivo',30000,99999999,1.12,'500'),(102,6,1,'Mayorista',1,99999999,1.12,'500'),(103,6,1,'Distribuidor',1,99999999,1.11,'500'),(104,59,1,'Efectivo',1,9999,1.35,'500'),(105,59,1,'Efectivo',10000,29999,1.30,'500'),(106,59,1,'Efectivo',30000,99999,1.25,'500'),(107,59,1,'Efectivo',100000,179999,1.20,'500'),(108,59,1,'Efectivo',180000,99999999,1.15,'500'),(109,59,1,'Mayorista',1,9999,1.15,'500'),(111,59,1,'Mayorista',10000,99999999,1.12,'500'),(112,59,1,'Distribuidor',1,99999999,1.11,'500'),(113,57,1,'Efectivo',1,9999,1.30,'500'),(114,57,1,'Efectivo',10000,29999,1.20,'500'),(115,57,1,'Efectivo',30000,99999999,1.15,'500'),(116,57,1,'Mayorista',1,99999999,1.12,'500'),(117,57,1,'Distribuidor',1,99999999,1.11,'500'),(118,58,1,'Efectivo',1,9999,1.25,'500'),(119,58,1,'Efectivo',10000,29999,1.20,'500'),(120,58,1,'Efectivo',30000,99999,1.15,'500'),(121,58,1,'Efectivo',100000,99999999,1.12,'500'),(122,58,1,'Mayorista',1,99999999,1.12,'500'),(123,58,1,'Distribuidor',1,99999999,1.11,'100'),(124,43,1,'Efectivo',1,9999,1.28,'500'),(125,43,1,'Efectivo',10000,29999,1.25,'500'),(126,43,1,'Efectivo',30000,99999,1.20,'500'),(127,43,1,'Efectivo',100000,99999999,1.15,'500'),(128,43,1,'Mayorista',1,9999,1.15,'100'),(129,43,1,'Mayorista',10000,99999999,1.12,'500'),(130,43,1,'Distribuidor',1,99999999,1.11,'500'),(131,44,1,'Efectivo',1,29999,1.30,'500'),(132,44,1,'Efectivo',30000,99999,1.25,'500'),(133,44,1,'Efectivo',100000,179999,1.20,'500'),(134,44,1,'Efectivo',180000,99999999,1.15,'500'),(135,44,1,'Mayorista',1,99999999,1.12,'500'),(136,44,1,'Distribuidor',1,99999999,1.11,'500'),(137,45,1,'Efectivo',1,999,1.30,'50'),(138,45,1,'Efectivo',1000,1999,1.25,'50'),(139,45,1,'Efectivo',2000,6999,1.25,'100'),(141,45,1,'Efectivo',7000,99999999,1.22,'100'),(142,45,2,'Efectivo',1,99999999,1.15,'500'),(143,45,2,'Mayorista',1,99999999,1.11,'500'),(144,45,2,'Distribuidor',1,99999999,1.08,'500'),(145,46,1,'Efectivo',1,999,1.30,'100'),(147,46,1,'Efectivo',1000,99999999,1.25,'100'),(148,46,1,'Efectivo',1,99999999,1.20,'500'),(149,46,1,'Mayorista',1,99999999,1.12,'500'),(150,46,1,'Distribuidor',1,99999999,1.11,'100'),(151,47,1,'Efectivo',1,999,1.30,'100'),(152,61,1,'Efectivo',1,999,1.30,'100'),(153,61,1,'Efectivo',1,2999,1.30,'100'),(154,61,1,'Efectivo',3000,9999,1.25,'500'),(155,61,1,'Efectivo',10000,99999999,1.23,'500'),(157,61,2,'Mayorista',1,99999999,1.12,'500'),(159,61,2,'Efectivo',1,99999,1.18,'500'),(160,61,2,'Efectivo',100000,99999999,1.12,'500'),(161,61,2,'Distribuidor',1,99999999,1.10,'500'),(162,48,1,'Efectivo',1,2999,1.33,'500'),(163,48,1,'Efectivo',3000,9999,1.30,'500'),(165,48,1,'Efectivo',10000,39999,1.30,'500'),(166,48,1,'Efectivo',40000,99999,1.25,'500'),(168,48,1,'Efectivo',100000,179999,1.20,'500'),(169,48,1,'Efectivo',180000,99999999,1.15,'500'),(170,48,1,'Mayorista',1,29999,1.15,'500'),(171,48,1,'Mayorista',30000,99999999,1.12,'500'),(173,48,1,'Distribuidor',1,99999999,1.11,'100'),(174,65,1,'Efectivo',1,9999,1.35,'500'),(175,65,1,'Efectivo',10000,29999,1.30,'500'),(176,65,1,'Efectivo',30000,79999,1.25,'500'),(177,65,1,'Efectivo',80000,179999,1.20,'500'),(178,65,1,'Efectivo',180000,99999999,1.15,'500'),(179,65,1,'Mayorista',1,19999,1.15,'100'),(180,65,1,'Mayorista',20000,99999999,1.13,'100'),(181,51,1,'Efectivo',1,29999,1.35,'500'),(182,51,1,'Efectivo',30000,79999,1.28,'500'),(183,51,1,'Efectivo',80000,99999999,1.20,'500'),(184,51,1,'Mayorista',1,99999999,1.15,'500'),(185,51,1,'Distribuidor',1,99999999,1.11,'500'),(186,65,1,'Distribuidor',1,99999999,1.11,'500'),(187,53,1,'Efectivo',1,29999,1.30,'500'),(188,53,1,'Efectivo',30000,99999999,1.25,'500'),(189,52,1,'Efectivo',1,29999,1.30,'500'),(190,52,1,'Efectivo',30000,79999,1.25,'500'),(191,52,1,'Efectivo',80000,179999,1.20,'500'),(192,52,1,'Efectivo',180000,99999999,1.15,'500'),(193,52,1,'Mayorista',1,29999,1.15,'100'),(194,52,1,'Mayorista',30000,99999999,1.12,'100'),(195,52,1,'Distribuidor',1,99999999,1.11,'100'),(196,33,1,'Efectivo',1,29999,1.30,'500'),(197,33,1,'Efectivo',30000,79999,1.25,'500'),(198,33,1,'Efectivo',80000,129999,1.20,'500'),(199,33,1,'Efectivo',130000,99999999,1.15,'500'),(200,33,1,'Mayorista',1,9999,1.15,'500'),(201,33,1,'Mayorista',10000,99999999,1.12,'500'),(202,33,1,'Distribuidor',1,99999999,1.11,'100'),(203,34,1,'Efectivo',1,79999,1.25,'500'),(204,34,1,'Efectivo',80000,179999,1.20,'500'),(205,34,1,'Efectivo',180000,99999999,1.15,'500'),(206,34,1,'Mayorista',1,99999999,1.12,'100'),(207,34,1,'Distribuidor',1,99999999,1.11,'100'),(208,60,1,'Efectivo',1,9999,1.25,'100'),(209,60,1,'Efectivo',10000,99999999,1.20,'100'),(210,60,1,'Mayorista',1,99999999,1.15,'100'),(211,60,2,'Efectivo',1,99999999,1.18,'500'),(212,60,2,'Mayorista',1,99999999,1.12,'100'),(213,60,2,'Distribuidor',1,99999999,1.11,'100'),(215,32,1,'Efectivo',1,99999999,1.25,'500'),(218,27,2,'Mayorista',1,99999999,1.12,'100'),(219,27,1,'Efectivo',1,99999999,1.25,'500'),(220,27,1,'Mayorista',1,99999999,1.12,'500'),(221,27,1,'Mayorista',1,99999999,1.12,'500'),(223,27,2,'Efectivo',1,99999999,1.20,'500'),(224,26,2,'Efectivo',1,9999,1.30,'500'),(225,26,2,'Efectivo',10000,99999999,1.25,'500'),(226,26,1,'Efectivo',10000,99999999,1.25,'500'),(227,26,1,'Efectivo',1,9999,1.30,'500'),(228,26,2,'Efectivo',1,9999,1.25,'500'),(229,26,2,'Efectivo',10000,99999999,1.18,'500'),(230,24,1,'Efectivo',1,9999,1.20,'500'),(232,24,1,'Efectivo',10000,29999,1.15,'500'),(233,24,1,'Efectivo',30000,99999999,1.12,'500'),(234,24,1,'Mayorista',1,99999999,1.10,'500'),(235,24,1,'Distribuidor',1,99999999,1.07,'500'),(236,23,1,'Efectivo',1,9999,1.20,'500'),(237,23,1,'Mayorista',1,99999999,1.10,'500'),(238,23,1,'Distribuidor',1,99999999,1.07,'500'),(239,23,1,'Efectivo',10000,29999,1.15,'500'),(240,23,1,'Efectivo',30000,99999999,1.12,'500'),(241,21,1,'Efectivo',1,9999,1.20,'500'),(242,21,1,'Efectivo',10000,29999,1.15,'500'),(243,21,1,'Efectivo',30000,99999999,1.12,'500'),(244,22,1,'Efectivo',1,9999,1.15,'500'),(245,22,1,'Efectivo',10000,29999,1.18,'500'),(246,22,1,'Efectivo',30000,129999,1.12,'500'),(247,22,1,'Efectivo',130000,99999999,1.11,'500'),(248,22,1,'Mayorista',1,99999999,1.10,'500'),(249,22,1,'Distribuidor',1,99999999,1.07,'500'),(251,21,1,'Mayorista',1,99999999,1.10,'500'),(252,21,1,'Distribuidor',1,99999999,1.05,'500'),(253,40,1,'Efectivo',1,99999999,1.25,'500'),(254,40,1,'Mayorista',1,99999999,1.12,'500'),(255,64,1,'Efectivo',1,9999,1.30,'500'),(256,64,1,'Efectivo',10000,79999,1.25,'500'),(257,64,1,'Efectivo',80000,99999999,1.18,'500'),(258,64,1,'Mayorista',1,99999999,1.12,'500'),(259,20,1,'Efectivo',1,99999999,1.15,'500'),(260,20,1,'Mayorista',1,99999999,1.10,'500'),(261,20,1,'Distribuidor',1,99999999,1.05,'500'),(262,63,1,'Efectivo',1,9999,1.30,'500'),(263,63,1,'Efectivo',10000,29999,1.28,'500'),(264,63,1,'Efectivo',30000,79999,1.25,'500'),(265,63,1,'Efectivo',80000,180000,1.20,'500'),(266,63,1,'Efectivo',180001,99999999,1.15,'500'),(267,9,1,'Efectivo',1,39999,1.25,'500'),(268,9,1,'Efectivo',40000,89999,1.20,'500'),(269,9,1,'Efectivo',90000,99999999,1.15,'500'),(270,9,1,'Mayorista',1,99999999,1.12,'500'),(271,9,1,'Distribuidor',1,99999999,1.10,'100'),(272,13,1,'Efectivo',1,9999,1.25,'500'),(273,13,1,'Efectivo',10000,29999,1.20,'500'),(274,13,1,'Efectivo',30000,79999,1.20,'500'),(275,13,1,'Efectivo',80000,99999999,1.15,'500'),(276,13,1,'Mayorista',1,99999999,1.12,'500'),(277,13,1,'Distribuidor',1,99999999,1.10,'100'),(278,14,1,'Efectivo',1,9999,1.25,'500'),(279,14,1,'Efectivo',10000,79999,1.20,'500'),(280,14,1,'Efectivo',80000,99999999,1.15,'500'),(281,14,1,'Mayorista',1,99999999,1.12,'500'),(282,14,1,'Distribuidor',1,99999999,1.10,'100'),(283,11,1,'Efectivo',1,9999,1.25,'500'),(284,11,1,'Efectivo',10000,79999,1.20,'500'),(285,11,1,'Efectivo',80000,99999999,1.15,'500'),(286,12,1,'Efectivo',1,9999,1.25,'500'),(287,12,1,'Efectivo',10000,79999,1.20,'500'),(288,12,1,'Efectivo',80000,99999999,1.15,'500'),(289,12,1,'Mayorista',1,99999999,1.12,'500'),(290,12,1,'Distribuidor',1,99999999,1.10,'100'),(291,10,1,'Efectivo',1,9999,1.25,'500'),(292,10,1,'Efectivo',10000,79999,1.20,'500'),(293,10,1,'Efectivo',80000,99999999,1.15,'500'),(294,10,1,'Mayorista',1,99999999,1.12,'500'),(296,10,1,'Distribuidor',1,99999999,1.10,'100'),(297,11,1,'Distribuidor',1,99999999,1.10,'100'),(298,11,1,'Mayorista',1,99999999,1.12,'500'),(299,15,1,'Efectivo',1,9999,1.30,'500'),(300,15,1,'Efectivo',10000,79999,1.25,'500'),(301,15,1,'Efectivo',80000,139999,1.20,'500'),(302,15,1,'Efectivo',140000,99999999,1.15,'500'),(303,15,1,'Mayorista',1,99999999,1.12,'500'),(304,15,1,'Distribuidor',1,99999999,1.10,'100'),(305,17,1,'Efectivo',1,9999,1.30,'500'),(306,17,1,'Efectivo',10000,29999,1.25,'500'),(308,17,1,'Efectivo',180000,99999999,1.15,'500'),(309,17,1,'Mayorista',1,99999999,1.12,'500'),(310,17,1,'Distribuidor',1,99999999,1.10,'100'),(311,17,1,'Efectivo',30000,79999,1.25,'500'),(312,17,1,'Efectivo',80000,179999,1.20,'500'),(313,16,1,'Efectivo',1,29999,1.30,'500'),(314,16,1,'Efectivo',30000,79999,1.25,'500'),(315,16,1,'Efectivo',80000,179999,1.20,'500'),(316,16,1,'Efectivo',180000,99999999,1.15,'500'),(317,16,1,'Mayorista',1,99999999,1.12,'500'),(318,16,1,'Distribuidor',1,99999999,1.10,'100'),(319,18,1,'Efectivo',1,9999,1.25,'100'),(320,18,1,'Efectivo',10000,99999999,1.20,'100'),(321,18,1,'Mayorista',1,99999999,1.15,'100'),(322,18,2,'Efectivo',1,29999,1.20,'500'),(323,18,2,'Efectivo',30000,79999,1.15,'500'),(324,18,2,'Efectivo',80000,99999999,1.12,'500'),(325,18,2,'Mayorista',1,99999999,1.12,'100'),(326,18,2,'Distribuidor',1,99999999,1.10,'100');
/*!40000 ALTER TABLE `calculos_precios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria_padre` int(11) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `CATEGORIA_YA_EXISTE` (`id_categoria_padre`,`categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (57,NULL,'AUTOMOTIVA'),(61,NULL,'CAÑOS'),(42,NULL,'ELECTRICIDAD'),(1,NULL,'FERRETERÍA'),(50,NULL,'HOGAR'),(54,NULL,'INSECTICIDAS'),(31,NULL,'JARDINERÍA'),(25,NULL,'LIBRERÍA'),(28,NULL,'LIMPIEZA'),(56,NULL,'MÁQUINAS'),(66,NULL,'MASCOTAS'),(49,NULL,'MAT. CONST.'),(19,NULL,'PINTURAS'),(35,NULL,'PISCINA'),(38,NULL,'REPUESTOS'),(62,NULL,'RODADOS'),(8,NULL,'SANITARIOS'),(55,NULL,'SOLVENTES'),(4,1,'BULONERÍA'),(3,1,'CERRAJERÍA'),(5,1,'CLAVOS'),(2,1,'HERRAMIENTAS'),(7,1,'PEGAMENTOS'),(6,1,'QUIMICOS'),(59,1,'SEGURIDAD'),(65,1,'VARIOS'),(9,8,'ACC. DESAGUE'),(13,8,'ACC. FUSIÓN'),(14,8,'ACC. GALVANIZADO'),(11,8,'ACC. PPR'),(12,8,'ACC. ROSCABLE'),(10,8,'ACC. SOLDABLE'),(15,8,'ACCESORIOS'),(17,8,'GRIFERIAS'),(16,8,'REPUESTOS'),(18,8,'TUBERÍA'),(24,19,'ESPECIALES'),(23,19,'IMPERMEABILIZANTE'),(21,19,'LATEX'),(22,19,'SINTETICO'),(20,19,'SOLVENTES'),(27,25,'PAPELERÍA'),(26,25,'ÚTILES'),(30,28,'ARTÍCULO'),(29,28,'QUIMICOS'),(33,31,'ARTÍCULOS'),(60,31,'MANGUERA'),(34,31,'QUIMICOS'),(32,31,'SEMILLAS'),(37,35,'ACCESORIO'),(36,35,'QUIMICOS'),(40,38,'MAQUINAS'),(43,42,'ACCESORIOS'),(44,42,'ARTEFACTOS'),(45,42,'CABLES'),(48,42,'ILUMINACIÓN'),(51,50,'BAZAR'),(53,50,'JUGUETERÍA'),(52,50,'REPUESTOS'),(58,57,'QUIMICO'),(64,62,'ACCESORIOS'),(63,62,'REPUESTOS');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choferes`
--

LOCK TABLES `choferes` WRITE;
/*!40000 ALTER TABLE `choferes` DISABLE KEYS */;
INSERT INTO `choferes` VALUES (2,19,6,'666','Carlos Beast','666666','666@666','','-25.335553,-57.562555'),(8,26,15,'333','Ignacio Ignis666','666333','696969@666333','666333',NULL),(7,25,6,'222','Half Beast','333333','333333@333','333333',NULL),(5,22,6,'111','Eduardo Lemus Boli','0984956306','elemus@localhost.com','','-25.3036704,-57.5998198'),(6,23,6,'000','Luis Andres Frutos','0985474878','lfrutos@localhost.com','','-25.3517212,-57.5012255');
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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (13,31,'3768826','Mauriflex','direccion1','telefono1','correo1@fake','mauri'),(16,33,'666999666','Superadmin','Superadmin','Superadmin','superadmin@sarcom.com',NULL),(17,35,'888555222','Semillas del PY','Semillas','Semillas','Semillas@Semillas','Semillas');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_detalle`
--

DROP TABLE IF EXISTS `compra_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_detalle` (
  `id_compra_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_compra` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `producto` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo_unitario` int(11) DEFAULT NULL,
  `costo_total` int(11) DEFAULT NULL,
  `id_ubicacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_compra_detalle`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_detalle`
--

LOCK TABLES `compra_detalle` WRITE;
/*!40000 ALTER TABLE `compra_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra_productos`
--

DROP TABLE IF EXISTS `compra_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra_productos` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `nro_factura` varchar(45) DEFAULT NULL,
  `condicion_compra` varchar(45) DEFAULT NULL,
  `vencimiento` date DEFAULT NULL,
  `total_gs` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra_productos`
--

LOCK TABLES `compra_productos` WRITE;
/*!40000 ALTER TABLE `compra_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizaciones`
--

DROP TABLE IF EXISTS `cotizaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cotizaciones` (
  `id_cotizacion` int(11) NOT NULL AUTO_INCREMENT,
  `moneda` varchar(45) DEFAULT NULL,
  `compra` int(11) DEFAULT NULL,
  `venta` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cotizacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizaciones`
--

LOCK TABLES `cotizaciones` WRITE;
/*!40000 ALTER TABLE `cotizaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizaciones` ENABLE KEYS */;
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
  `cantidad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8mb4_spanish_ci DEFAULT 'DISPONIBLE',
  PRIMARY KEY (`id_cupo`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupos`
--

LOCK TABLES `cupos` WRITE;
/*!40000 ALTER TABLE `cupos` DISABLE KEYS */;
INSERT INTO `cupos` VALUES (1,17,1,'2020-10-22','2020-10-23',0,'0','AGOTADO'),(2,17,1,'2020-10-24','2020-10-25',0,'0','AGOTADO'),(3,17,3,'2020-10-22','2020-10-23',0,'0','AGOTADO'),(4,17,1,'2020-10-24','2020-10-25',0,'50','DISPONIBLE');
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
  PRIMARY KEY (`id_cupos_proveedor`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupos_proveedor`
--

LOCK TABLES `cupos_proveedor` WRITE;
/*!40000 ALTER TABLE `cupos_proveedor` DISABLE KEYS */;
INSERT INTO `cupos_proveedor` VALUES (1,'1','15','20','15','INICIADO'),(2,'1','15','15','15','DISPONIBLE'),(3,'1','6','10','10','DISPONIBLE'),(4,'1','15','5','5','DISPONIBLE'),(5,'2','6','30','30','DISPONIBLE'),(6,'2','15','5','5','DISPONIBLE'),(7,'4','6','50','50','DISPONIBLE'),(8,'3','6','25','25','DISPONIBLE'),(9,'3','15','25','25','DISPONIBLE');
/*!40000 ALTER TABLE `cupos_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depositos`
--

DROP TABLE IF EXISTS `depositos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `depositos` (
  `id_deposito` int(11) NOT NULL AUTO_INCREMENT,
  `deposito` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_deposito`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depositos`
--

LOCK TABLES `depositos` WRITE;
/*!40000 ALTER TABLE `depositos` DISABLE KEYS */;
INSERT INTO `depositos` VALUES (1,'Local',1),(2,'Depósito',1);
/*!40000 ALTER TABLE `depositos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones`
--

DROP TABLE IF EXISTS `direcciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones` (
  `id_direccion` int(11) NOT NULL AUTO_INCREMENT,
  `direccion` varchar(50) NOT NULL,
  `nro_casa` varchar(45) DEFAULT NULL,
  `id_zona` varchar(50) NOT NULL,
  `observacion` varchar(500) NOT NULL,
  PRIMARY KEY (`id_direccion`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones`
--

LOCK TABLES `direcciones` WRITE;
/*!40000 ALTER TABLE `direcciones` DISABLE KEYS */;
INSERT INTO `direcciones` VALUES (1,'Nilo Meyer esq. Carmen de Lara Castro','2306','5',' '),(3,'Av. El Maestro esq. Notario',NULL,'5',' '),(4,'Acaray e/ Saavedra',NULL,'5','En frente al Colegio de la Asunción'),(14,'Tte Benitez esq España',NULL,'5','Local los hermanos'),(15,'España esq. Sargento Silva',NULL,'5',''),(16,'San Fernando c/ Julian Rejala',NULL,'5','esquina'),(17,'202 Nivacle e/ Comendador Bo y Durazno Lambare',NULL,'5',''),(38,'Mcal Lopez e/ Ingavi','','5',''),(37,'Tte Benitez e/ Sgto Silva','','5',''),(35,'Domingo Montanaro c/ San Martin','','5',''),(36,'Gabriel Pellon y Calle Sanlorenzo','','5',''),(33,'Saturio Ríos y de las Residentas','555','5','Universidad San Sebastán'),(39,'Eusebio Ayala e/ Ingavi','','5',''),(40,'Av el agronomo e/ Sgto Silva','','5',''),(41,'Corpus Christi 1757 casi Luis a. del Paraná.','1757','5','Fernando de la Mora zona norte'),(42,'29 DE SEPTIEMBRE CASI LAS PALMAS','876','5','lambare'),(43,'Jose Asuncion Flores casi Inocencio Lezcano','3985','5','Asuncion'),(44,'AVDA. SACRAMENTO 1639','1639','5','EN EL LABORATORIO ORTEGA BIOLAB, FRENTE A IPS CENTRAL'),(45,'Mayor sinforiano Rodríguez','2638','5','Asuncion San  Vicente'),(46,'Prof Carmen Garcete 978 casi Prof Chávez','978','5','barrio Sacramento Asunción'),(47,'eusebio ayala esq santa cruz de la sierra','','5','asuncion'),(48,'Av Republica Argentina 1616','1616','5','Asuncion'),(49,'Toribio pacheco y Legion civil extranjera','','5',''),(50,'Mcal Lopez esq santa teresa','666','5',''),(51,'Florida, San Lorenzo','','5','NOTARIO Building'),(52,'doctor sosa c/ itapua','','5','25°15\'39.7\"S 57°34\'43.5\"W'),(53,'Avenida Aviadores del Chaco 1727, Asunción','1727','5',''),(54,'Campos cervera  4538 casi legion civil extranjera','4538','5',''),(55,'Santiago 1275 barrio jara','1275','5',''),(56,'Tte. 1ro. Adalberto Ramírez Franco, Asunción','','5',''),(57,'Santa Cruz de la Sierra 2013, Asunción','2013','5',''),(58,'La Paz 330 casi Padre Rafael Elizeche','330','5',''),(59,'22 de setiembre 784 c/ herminio gimenez','784','5',''),(60,'Capitán carpinelli 3746 entre cecilio Avila y teni','3746','5',''),(61,'Heroes del 70','1017','5','Ejemplo'),(62,'Heroes del 70','1017','5',''),(63,'Heroes','1017','5',''),(64,'Mcal Estigarribia 419 c/ Concepcion, Fernando de l','419','5',''),(65,'Mayor Mazó 386 Esq. Río Montelindo','386','5',''),(66,'Avenida General José Gervasio Artigas, Asunción','','5',''),(67,'Dr. Telmo Aquino 3821 casi Chaco Boreal','3821','5',''),(68,'Santisima Trinidad 2521 esquina pasaje francia','2521','5',''),(69,'Capitán Vicente Suarez 2489 esq Goicochea Menéndez','2489','5',''),(70,'San Alfonso 4660 Casi Legión civil extranjera','4660','5',''),(71,'Luis Morales 851, Asunción 1701','1701','5','');
/*!40000 ALTER TABLE `direcciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_detalle`
--

DROP TABLE IF EXISTS `factura_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura_detalle` (
  `id_factura_detalle` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_factura` int(11) NOT NULL,
  `id_producto` bigint(20) DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(12,2) DEFAULT NULL,
  `descuento_porc` int(3) DEFAULT NULL,
  `descuento_monto` decimal(12,2) DEFAULT NULL COMMENT 'En guaraníes',
  `total_venta` decimal(12,2) DEFAULT NULL COMMENT 'Total a pagar con el descuento incluido',
  `iva` int(11) DEFAULT NULL COMMENT '10, 5  y 0 para exenta',
  PRIMARY KEY (`id_factura_detalle`),
  KEY `indexes_fd` (`id_factura`,`id_factura_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_detalle`
--

LOCK TABLES `factura_detalle` WRITE;
/*!40000 ALTER TABLE `factura_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `factura_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_factura` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_sucursal` int(8) DEFAULT NULL,
  `id_timbrado` int(8) NOT NULL COMMENT 'ID Timbrado al que corresponde la factura',
  `numero` int(7) unsigned zerofill NOT NULL COMMENT 'Nro de factura o ticket',
  `fecha` datetime DEFAULT NULL,
  `condicion_venta` varchar(45) DEFAULT 'Contado' COMMENT 'Credito, Contado',
  `vencimiento` date DEFAULT NULL COMMENT 'El monto total que corresponde con exenta de IVA',
  `id_cliente` int(11) DEFAULT NULL,
  `ruc` varchar(45) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `cantidad` int(8) DEFAULT '0',
  `concepto` text COMMENT 'En caso de facturación manual y concepto personalizado',
  `descuento` decimal(12,2) DEFAULT '0.00' COMMENT 'Valor descontado (ya incluido en total_a_pagar y gravada, no volver a sumar)',
  `nota_credito_gs` int(11) DEFAULT NULL,
  `id_nota_credito` int(11) DEFAULT NULL,
  `total_costo` decimal(12,2) DEFAULT '0.00',
  `total_costo_gs` int(11) DEFAULT NULL,
  `exenta` decimal(12,2) DEFAULT '0.00',
  `gravada_5` decimal(12,2) DEFAULT '0.00' COMMENT 'Valor a pagar con gravada 5% (IVA 5% incluido)',
  `gravada_10` decimal(12,2) DEFAULT '0.00' COMMENT 'Valor a pagar con gravada 10% (IVA 10% incluido)',
  `total_venta_usd` decimal(12,2) DEFAULT NULL,
  `total_a_pagar` decimal(12,2) DEFAULT '0.00' COMMENT 'Suma de la exenta, gravada 5% y gravada 10%',
  `saldo` decimal(12,2) DEFAULT NULL,
  `id_recibo` int(11) DEFAULT NULL,
  `estado` varchar(30) DEFAULT 'Pagada' COMMENT 'Pendiente, Pagada, Pagada parcialmente, Anulada',
  `usuario` varchar(45) DEFAULT NULL COMMENT 'Nombre de usuario del sistema',
  `moneda` varchar(4) DEFAULT NULL,
  `id_vendedora` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `indexes_f` (`id_factura`,`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `cantidad` varchar(45) DEFAULT NULL,
  `total_gs` varchar(45) DEFAULT NULL,
  `total_costo_usd` decimal(12,2) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_detalle`
--

DROP TABLE IF EXISTS `inventario_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventario_detalle` (
  `id_inventario_detalle` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_inventario` int(11) NOT NULL,
  `id_producto` bigint(20) DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `venta_gs` int(11) DEFAULT NULL,
  `total_venta_gs` int(11) DEFAULT NULL,
  `total_costo_usd` decimal(12,2) DEFAULT NULL,
  `dolar_venta` int(6) DEFAULT NULL,
  `total_costo_gs` int(11) DEFAULT NULL,
  `stock_actual` int(11) DEFAULT NULL,
  `reemplazado` varchar(2) DEFAULT 'NO' COMMENT 'SI: si el stock actual ya fue reemplazado por el inventariado',
  `fecha_reemplazo` datetime DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_inventario_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_detalle`
--

LOCK TABLES `inventario_detalle` WRITE;
/*!40000 ALTER TABLE `inventario_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventario_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_pedidos`
--

DROP TABLE IF EXISTS `lista_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lista_pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ruc` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `direccion` int(12) DEFAULT NULL,
  `ubicacion` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nro_casa` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `zona` int(12) DEFAULT NULL,
  `fecha_tope` datetime DEFAULT NULL,
  `id_lote` int(11) DEFAULT NULL,
  `id_repartidor` int(11) DEFAULT NULL,
  `estado` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'PENDIENTE, ENTREGADO, NO ENTREGADO',
  `firma` blob,
  `foto_cedula` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `foto_cedula2` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `foto_cedula3` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `foto_cedula4` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `foto_cedula5` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `pin` int(6) DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `observaciones` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cantidad_reprogramaciones` int(50) NOT NULL DEFAULT '0',
  `entidad` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL COMMENT 'TAMBIEN GUARDA FECHA DE NO ENTREGA',
  `hora_confirmacion` time DEFAULT NULL,
  `consideraciones` varchar(500) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_pedidos`
--

LOCK TABLES `lista_pedidos` WRITE;
/*!40000 ALTER TABLE `lista_pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lotes`
--

DROP TABLE IF EXISTS `lotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lotes` (
  `id_lote` int(11) NOT NULL AUTO_INCREMENT,
  `id_repartidor` int(11) DEFAULT NULL,
  `id_entidad` int(11) DEFAULT NULL,
  `encargado` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `cantidad_actual` int(50) DEFAULT '0',
  `fecha_tope` date DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `estado` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'PENDIENTE, ENTREGADO',
  `id_zona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lote`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes`
--

LOCK TABLES `lotes` WRITE;
/*!40000 ALTER TABLE `lotes` DISABLE KEYS */;
INSERT INTO `lotes` VALUES (1,0,0,'',0,0,'0000-00-00','2020-10-02 14:50:50','PENDIENTE',0);
/*!40000 ALTER TABLE `lotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_marca`),
  UNIQUE KEY `MARCA_EXISTENTE` (`marca`)
) ENGINE=MyISAM AUTO_INCREMENT=150 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
INSERT INTO `marcas` VALUES (1,'CISER'),(2,'AMANECER'),(3,'ALBA'),(4,'BAMBI'),(5,'QUIMAFLEX'),(6,'BLASCOR'),(7,'AEROFLEX'),(8,'ALBORADA'),(9,'IPS'),(10,'PENETRIT'),(11,'ACEITODO'),(12,'TRUPER'),(13,'GLADIATOR'),(14,'GAMMA'),(15,'PRETUL'),(16,'FOREST&GARDEN'),(17,'PRESSURE SPRAYER'),(18,'BRUDDEN'),(19,'KNSPSACK'),(20,'KNAPSACK'),(21,'TRAMONTINA'),(22,'IMACASA'),(23,'KLINTEK'),(24,'MAX'),(25,'VCP'),(26,'CORNETA'),(27,'BELLOTA'),(28,'RAMADA'),(29,'NACIONAL'),(30,'EL SALVADOR'),(31,'BIEHL'),(32,'COCK BRAND'),(33,'HERRAGRO'),(34,'IRWIN'),(35,'BIASSONI'),(36,'MR COCK'),(37,'FAMASTIL'),(38,'BELLOTO'),(39,'MDM'),(40,'D&P'),(41,'ESTRELLA'),(42,'MEBRASI'),(43,'PLASTICOS KENDY'),(44,'CIPLA'),(45,'OPTIMA'),(46,'SUPRABOND'),(47,'DOW'),(48,'RESICOLOR'),(49,'SOPRANO'),(50,'DAILY'),(51,'PARANA'),(52,'GENERAL'),(53,'COLOR'),(54,'ASATEX'),(55,'HUACAI'),(56,'LONGYING'),(57,'AIFA'),(58,'PROFIELD'),(59,'GARDEN'),(60,'DI'),(61,'FAIRMAX'),(62,'INOFIX'),(63,'SANILAR'),(64,'AGROFIELD'),(65,'FASCY'),(66,'AMC'),(67,'ATLAS'),(68,'PINAS'),(69,'SOLMAX'),(70,'AGUA VIVA'),(71,'EVEREADY'),(72,'RAYOVAC'),(73,'POWERPACK'),(74,'PRASONIC'),(75,'HW'),(76,'ENERGIZER'),(77,'DURACELL'),(78,'ULTRAFIRE'),(79,'SINGWAY'),(80,'BARU'),(81,'POWERVILLE'),(82,'ZIHANG'),(83,'SC'),(84,'EL ABUELO'),(85,'MAXELL'),(86,'GLN'),(87,'DA VINCI'),(88,'SUN KING'),(89,'SONGLE'),(90,'VIRUTEX'),(91,'BEHL'),(92,'GDR'),(93,'GARDEX'),(94,'ASTRA'),(95,'GP'),(96,'T&E'),(97,'PLASBOHN'),(98,'WANJIA'),(99,'HERC'),(100,'GIBER'),(101,'DEL REY'),(102,'JASPE'),(103,'CASINO'),(104,'ONE'),(105,'GERDAU'),(106,'BASE BASE'),(107,'AMANCAY'),(108,'GUARANI'),(109,'TRI-STAR'),(110,'MONTEBELO'),(111,'KARAM'),(112,'FAMPITA'),(113,'LUCERO'),(114,'PLASVALE LTDA'),(115,'DELTA'),(116,'ERICHKRAUSE'),(117,'INCOLMA'),(118,'DUSON'),(119,'ALAMO'),(120,'FENGLIN'),(121,'THE DOG'),(122,'BOWTIE'),(123,'PET & GARDENS'),(124,'BOMEI'),(125,'CONDOR'),(126,'COMBS'),(127,'PRIMAFER'),(128,'DINGLI'),(129,'PEGAMIL'),(130,'JIANGRUI'),(131,'TISSOT'),(132,'DIN'),(133,'LY'),(134,'GAZARRA'),(135,'COARTE'),(136,'TIGRE'),(137,'GOLDEN PHOENIX'),(138,'DIVAR'),(139,'RECORD'),(140,'MUNDIAL'),(141,'YOUNG-J'),(142,'DJ'),(143,'ECO'),(144,'TUPY'),(145,'ELEKTRON'),(146,'CONATEL'),(147,'VIMAR'),(148,'GALUX'),(149,'FORMUL');
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `menu` varchar(100) NOT NULL,
  `submenu` varchar(100) DEFAULT '-',
  `titulo` varchar(100) DEFAULT NULL,
  `url` varchar(50) DEFAULT '-',
  `icono` varchar(45) DEFAULT NULL,
  `orden` int(4) DEFAULT NULL,
  `estado` varchar(15) NOT NULL DEFAULT 'Activo',
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Clientes','Clientes','Clientes','clientes',NULL,1,'Activo'),(2,'Productos','Productos','Administrar Productos','productos',NULL,2,'Activo'),(3,'Pesajes','Pesar','Pesar','pesar',NULL,3,'Activo'),(4,'Pesajes','Administrar Pesajes','Administrar Pesajes','administrar-pesajes',NULL,4,'Activo'),(5,'Ventas','Facturación','Facturación','facturacion',NULL,5,'Activo');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_cr_detalle`
--

DROP TABLE IF EXISTS `notas_cr_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_cr_detalle` (
  `id_nota_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_nota_credito` int(11) NOT NULL,
  `id_producto` bigint(20) DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `total_venta` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_nota_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_cr_detalle`
--

LOCK TABLES `notas_cr_detalle` WRITE;
/*!40000 ALTER TABLE `notas_cr_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_cr_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_credito`
--

DROP TABLE IF EXISTS `notas_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_credito` (
  `id_nota_credito` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(7) unsigned zerofill DEFAULT NULL,
  `id_factura_origen` int(11) DEFAULT NULL,
  `id_factura_destino` int(11) DEFAULT NULL COMMENT 'El ID de la factura que utilizó esta nota de crédito',
  `id_cliente` int(11) DEFAULT NULL,
  `ruc` varchar(40) DEFAULT NULL,
  `razon_social` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'Pendiente' COMMENT 'Pendiente, Utilizada, Anulada',
  `fecha` datetime DEFAULT NULL,
  `id_timbrado` int(11) DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `usuario` varchar(200) DEFAULT NULL,
  `usuario_anulo` varchar(200) DEFAULT NULL,
  `fecha_anulo` datetime DEFAULT NULL,
  PRIMARY KEY (`id_nota_credito`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_credito`
--

LOCK TABLES `notas_credito` WRITE;
/*!40000 ALTER TABLE `notas_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notas_remision`
--

DROP TABLE IF EXISTS `notas_remision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notas_remision` (
  `id_nota_remision` int(11) NOT NULL AUTO_INCREMENT,
  `id_timbrado` int(11) DEFAULT NULL,
  `id_sucursal_origen` int(11) DEFAULT NULL,
  `id_sucursal_destino` int(11) DEFAULT NULL,
  `numero` int(7) unsigned zerofill DEFAULT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `ruc_rtte` varchar(45) DEFAULT NULL,
  `razon_social_rtte` varchar(255) DEFAULT NULL,
  `domicilio_rtte` varchar(255) DEFAULT NULL,
  `ruc_destino` varchar(45) DEFAULT NULL,
  `razon_social_destino` varchar(255) DEFAULT NULL,
  `domicilio_destino` varchar(255) DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  `comprobante_venta` varchar(45) DEFAULT NULL COMMENT 'Ej: Factura',
  `comprobante_nro` varchar(45) DEFAULT NULL,
  `comprobante_timbrado` varchar(45) DEFAULT NULL,
  `fecha_expedicion` date DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `km` varchar(45) DEFAULT NULL,
  `marca_vehiculo` varchar(150) DEFAULT NULL,
  `rua` varchar(15) DEFAULT NULL,
  `rua_remolque` varchar(45) DEFAULT NULL,
  `ruc_chofer` varchar(45) DEFAULT NULL,
  `razon_social_chofer` varchar(255) DEFAULT NULL,
  `domicilio_chofer` varchar(255) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL COMMENT 'En Proceso, Anulada, Recibida',
  `obs` text,
  `usuario_carga` varchar(45) DEFAULT NULL,
  `usuario_recepcion` varchar(45) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_nota_remision`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notas_remision`
--

LOCK TABLES `notas_remision` WRITE;
/*!40000 ALTER TABLE `notas_remision` DISABLE KEYS */;
/*!40000 ALTER TABLE `notas_remision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id_pago` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_factura` int(11) NOT NULL,
  `metodo_pago` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `detalles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `monto` int(11) DEFAULT NULL,
  `id_recibo` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `idx_if_factura` (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
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
INSERT INTO `porteros` VALUES (1,36,1,'portero','portero','portero');
/*!40000 ALTER TABLE `porteros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` bigint(13) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `producto` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `costo` int(11) DEFAULT NULL,
  `precio_lista` int(11) DEFAULT NULL COMMENT 'Precio de lista, el descuento segun tipo de cliente se va a realizar en Facturación',
  `precio_efectivo` int(11) DEFAULT NULL COMMENT 'Precio efectivo',
  `precio_mayorista` int(11) DEFAULT NULL COMMENT 'Precio mayorista',
  `precio_distribuidor` int(11) DEFAULT NULL COMMENT 'precio distribuidor',
  `iva` int(2) DEFAULT NULL COMMENT '10, 5 y 0 para exenta',
  `id_unidad` int(2) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL COMMENT 'Cantidad contenida en un paquete o caja',
  `stock_minimo` int(4) DEFAULT NULL,
  `id_producto_asociado` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL COMMENT 'Activo, Inactivo',
  PRIMARY KEY (`id_producto`),
  KEY `idx_id_lote` (`id_categoria`,`id_proveedor`,`id_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_fotos`
--

DROP TABLE IF EXISTS `productos_fotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_fotos` (
  `id_producto_foto` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_producto_foto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_fotos`
--

LOCK TABLES `productos_fotos` WRITE;
/*!40000 ALTER TABLE `productos_fotos` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_fotos` ENABLE KEYS */;
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
  PRIMARY KEY (`id_proveedor`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (6,NULL,'8000xxxxx','INTERFISA BANCO','XXXXX','XXXXXX','INTERFISA@XXXX.COM.PY','XXXXXX'),(15,34,'999888','Transportes S.A','Transportess','Transportess','Transportess@Transportess','Transportess');
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
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
-- Table structure for table `recibos`
--

DROP TABLE IF EXISTS `recibos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recibos` (
  `id_recibo` int(11) NOT NULL AUTO_INCREMENT,
  `nro_recibo` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `ruc` varchar(45) DEFAULT NULL,
  `razon_social` varchar(45) DEFAULT NULL,
  `metodo_pago` varchar(45) DEFAULT NULL COMMENT 'Efectivo, Cheque',
  `moneda` varchar(45) DEFAULT NULL,
  `total_a_pagar` decimal(12,2) DEFAULT NULL,
  `monto_pagado` decimal(12,2) DEFAULT NULL,
  `saldo` decimal(12,2) DEFAULT NULL,
  `nro_cheque` varchar(45) DEFAULT NULL,
  `banco` varchar(100) DEFAULT NULL,
  `concepto` varchar(255) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL COMMENT 'Pagado, Anulado',
  PRIMARY KEY (`id_recibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recibos`
--

LOCK TABLES `recibos` WRITE;
/*!40000 ALTER TABLE `recibos` DISABLE KEYS */;
/*!40000 ALTER TABLE `recibos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remision_detalle`
--

DROP TABLE IF EXISTS `remision_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remision_detalle` (
  `id_remision_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_nota_remision` int(11) DEFAULT NULL,
  `id_producto` bigint(20) DEFAULT NULL,
  `cantidad` int(4) DEFAULT NULL,
  `producto` text,
  `precio_unitario` int(11) DEFAULT NULL,
  `total_gs` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_remision_detalle`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remision_detalle`
--

LOCK TABLES `remision_detalle` WRITE;
/*!40000 ALTER TABLE `remision_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `remision_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remision_transportista`
--

DROP TABLE IF EXISTS `remision_transportista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remision_transportista` (
  `id_remision_transportista` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(45) DEFAULT NULL,
  `razon_social` varchar(200) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `ruc_chofer` varchar(45) DEFAULT NULL,
  `nombre_chofer` varchar(255) DEFAULT NULL,
  `domicilio_chofer` varchar(255) DEFAULT NULL,
  `marca_vehiculo` varchar(255) DEFAULT NULL,
  `chapa` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_remision_transportista`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remision_transportista`
--

LOCK TABLES `remision_transportista` WRITE;
/*!40000 ALTER TABLE `remision_transportista` DISABLE KEYS */;
/*!40000 ALTER TABLE `remision_transportista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(100) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL COMMENT 'Activo, Inactivo',
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador del Sistema','Activo');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_menu`
--

DROP TABLE IF EXISTS `roles_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_menu` (
  `id_rol_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  PRIMARY KEY (`id_rol_menu`),
  KEY `id_usuarios_rol` (`id_rol`,`id_menu`),
  KEY `id_menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_menu`
--

LOCK TABLES `roles_menu` WRITE;
/*!40000 ALTER TABLE `roles_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `id_deposito` int(11) DEFAULT NULL,
  `id_ubicacion` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `usuario` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id_stock`),
  UNIQUE KEY `id_prod_unique` (`id_producto`,`id_sucursal`,`id_ubicacion`),
  KEY `idx_stock_id_prod` (`id_producto`,`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_historial`
--

DROP TABLE IF EXISTS `stock_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_historial` (
  `id_stock_historial` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_producto` bigint(20) DEFAULT NULL,
  `producto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `operacion` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `detalles` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `motivo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `usuario` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_vendedora` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id_stock_historial`),
  KEY `idx_stock_prod` (`id_producto`,`id_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_historial`
--

LOCK TABLES `stock_historial` WRITE;
/*!40000 ALTER TABLE `stock_historial` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursales`
--

DROP TABLE IF EXISTS `sucursales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursales` (
  `id_sucursal` int(4) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ruc` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `razon_social` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sucursal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logo_texto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logo_icono` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `favicon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `colores` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'Hasta 2 colores HTML separado por comas',
  `nombre_sistema` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `subtitulo_sistema` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ciudad` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `departamento` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pais` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telefono` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `moneda` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL COMMENT '1 Activo, 0 Inactivo',
  PRIMARY KEY (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursales`
--

LOCK TABLES `sucursales` WRITE;
/*!40000 ALTER TABLE `sucursales` DISABLE KEYS */;
INSERT INTO `sucursales` VALUES (1,'ETCA',NULL,'ETCA S.A.','Casa Matriz','dist/images/logo.png','dist/images/logo-text.png','dist/images/logo-icon.png','dist/images/favicon.png','#664d4d, #352828','Bienvenidos al Sistema Ñamandu',NULL,NULL,'Asunción','Central','Paraguay',NULL,'','Gs.',1);
/*!40000 ALTER TABLE `sucursales` ENABLE KEYS */;
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
  PRIMARY KEY (`id_ticket`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,1,2,'AAA111','2020-10-22','PENDIENTE',NULL),(2,1,8,'AAB222','2020-10-22','PENDIENTE',NULL),(3,1,7,'ABB333','2020-10-22','PENDIENTE',NULL),(4,1,5,'AMOKOSE666','2020-10-22','PENDIENTE',NULL),(5,1,6,'ACV369','2020-10-23','PENDIENTE',NULL);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timbrados`
--

DROP TABLE IF EXISTS `timbrados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timbrados` (
  `id_timbrado` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(45) DEFAULT NULL,
  `timbrado` int(8) NOT NULL COMMENT 'Número de Timbrado',
  `id_sucursal` int(3) NOT NULL COMMENT 'Establecimiento declarado en el RUC',
  `cod_establecimiento` int(3) unsigned zerofill DEFAULT NULL COMMENT 'Corresponde al numero del local y sucursales',
  `punto_de_expedicion` int(3) unsigned zerofill NOT NULL DEFAULT '001' COMMENT 'En un mismo establecimiento, corresponde al numero de caja, tipo de pago, entre otros',
  `inicio_vigencia` date NOT NULL COMMENT 'Inicio de vigencia de la factura',
  `fin_vigencia` date NOT NULL COMMENT 'Fin de vigencia de la factura',
  `desde` int(7) unsigned zerofill NOT NULL COMMENT 'Inicio de numero de factura',
  `hasta` int(7) unsigned zerofill NOT NULL COMMENT 'Fin de numero de factura',
  `estado` enum('Activo','Baja','Caducó') NOT NULL,
  `tipo` varchar(45) DEFAULT NULL COMMENT 'Factura, Nota de Remisión, Nota de Crédito',
  `membrete` text,
  PRIMARY KEY (`id_timbrado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timbrados`
--

LOCK TABLES `timbrados` WRITE;
/*!40000 ALTER TABLE `timbrados` DISABLE KEYS */;
/*!40000 ALTER TABLE `timbrados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones` (
  `id_ubicacion` int(11) NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL COMMENT '1: activo, 0:inactivo',
  PRIMARY KEY (`id_ubicacion`),
  UNIQUE KEY `UBICACION_EXISTENTE` (`ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades_medida`
--

DROP TABLE IF EXISTS `unidades_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades_medida` (
  `id_unidad` int(11) NOT NULL AUTO_INCREMENT,
  `unidad_medida` varchar(50) NOT NULL,
  `estado` smallint(6) NOT NULL,
  PRIMARY KEY (`id_unidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades_medida`
--

LOCK TABLES `unidades_medida` WRITE;
/*!40000 ALTER TABLE `unidades_medida` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidades_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(249) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_cs NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nombre_apellido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `departamento` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cargo` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ci` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_sucursal` int(11) DEFAULT NULL,
  `foto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `verified` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `resettable` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `roles_mask` int(10) unsigned NOT NULL DEFAULT '0',
  `registered` int(10) unsigned NOT NULL,
  `last_login` int(10) unsigned DEFAULT NULL,
  `force_logout` mediumint(7) unsigned NOT NULL DEFAULT '0',
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
  `email` varchar(249) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `usuario` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_apellido` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `ci` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(360) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `token` int(4) NOT NULL,
  `adminpass` varchar(360) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `verificado` varchar(2) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `ultima_sesion` datetime DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `tipo_usuario` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `direccion` varchar(350) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `foto` varchar(350) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','Super-Administrador del Sistema','admin@frontliner.com','3640820','555666','aa1bb91d337db673c913634999d7b2b2daacca12',1,'2020-03-20 01:11:10',5763,'aa1bb91d337db673c913634999d7b2b2daacca12','si','2020-09-17 10:21:45','181.238.178.202','superadmin','Wall Street','archivos/multimedia/perfil/usuario_1_1.jpg'),(16,'sarcom','Administrador Sarcom','admin@sarcom.com','333666999','000000','6c4e0c5614208397072a0cea22d3e601a45831c5',1,'2020-03-20 01:11:10',5763,'aa1bb91d337db673c913634999d7b2b2daacca12','si','2020-06-11 16:25:48','181.238.147.19','admin','River','archivos/multimedia/perfil/usuario_1_1.jpg'),(31,'mauramirez','Mauricio Ramirez','mau@ramirez.com','3768826','986532','da39a3ee5e6b4b0d3255bfef95601890afd80709',1,'2020-10-02 13:42:46',0,'aa1bb91d337db673c913634999d7b2b2daacca12',NULL,'2020-10-02 13:42:46',NULL,'encargado','direccion1','archivos/multimedia/perfil/usuario_1_1.jpg'),(33,'superadmin','Superadmin','superadmin@sarcom.com','666999666','Superadmin','889a3a791b3875cfae413574b53da4bb8a90d53e',1,'2020-10-07 16:12:40',0,'aa1bb91d337db673c913634999d7b2b2daacca12',NULL,'2020-10-07 16:12:40',NULL,'cliente','Superadmin','archivos/multimedia/perfil/usuario_1_1.jpg'),(34,'proveedor','Transportes S.A','Transportess@Transportess','999888','Transportess','3711da0958245dc019c4a9348ee9f09e3b2250ee',1,'2020-10-07 17:41:51',0,'aa1bb91d337db673c913634999d7b2b2daacca12',NULL,NULL,NULL,'proveedor','Transportess','archivos/multimedia/perfil/usuario_1_1.jpg'),(35,'cliente','Semillas del PY','Semillas@Semillas','888555222','Semillas','d94019fd760a71edf11844bb5c601a4de95aacaf',1,'2020-10-07 17:44:24',0,'aa1bb91d337db673c913634999d7b2b2daacca12',NULL,NULL,NULL,'cliente','Semillas','archivos/multimedia/perfil/usuario_1_1.jpg'),(36,'portero','Portero','portero@portero','987654','portero','803762734d378fbf888101eb93cd66d0a5cd343e',1,'2020-10-14 10:17:46',0,'aa1bb91d337db673c913634999d7b2b2daacca12',NULL,'2020-10-14 10:17:46',NULL,'portero','portero','archivos/multimedia/perfil/usuario_1_1.jpg');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_finales`
--

DROP TABLE IF EXISTS `usuarios_finales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_finales` (
  `id_usuario_final` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `razon_social` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `direccion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `zona` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `celular` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `ubicacion_uno` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'ULTIMA UBICACION',
  `ubicacion_dos` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'PENULTIMA UBICACION',
  `ubicacion_tres` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL COMMENT 'ANTEPENULTIMA UBICACION',
  PRIMARY KEY (`id_usuario_final`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_finales`
--

LOCK TABLES `usuarios_finales` WRITE;
/*!40000 ALTER TABLE `usuarios_finales` DISABLE KEYS */;
INSERT INTO `usuarios_finales` VALUES (1,'3768826','MAURICIO FERNANDO RAMIREZ SAMUDIO','44','5','mauramirez93@gmail.com','0981650043','-25.277026992078312, -57.5858615109164','',NULL),(2,'123123','OSCAR PAI PEREIRA','35','5','123123@123123','0981650043','-25.31967230800026, -57.56453861262889','',NULL),(3,'','JORGE RAMIREZ RAMIREZ','4','5','ingramirezsamudio@gmail.com','','-25.318601342462426, -57.5306604585958','-25.318521382355197, -57.5305854311766','-25.318601342462426, -57.5306604585958'),(4,'','VALERIE HURARD','41','5','','0983110810','-25.306134514028496, -57.5439432263374','',NULL),(5,'','ARAMI LUGO','42','5','','0985212889','-25.332860827042495, -57.6225592711887','',NULL),(6,'','DUSTIN RANGEL','43','5','dusrangel@hotmail.com','0992964528','-25.306555299614175, -57.5988392265530','',NULL),(7,'','GONZALO MANUEL BOGARIN ORTEGA','44','5','','0981835171','-25.31820187911497, -57.62371659848393','',NULL),(8,'','SOFIA BRITOS','45','5','','0991202105','-25.28439382549322, -57.58932114930692','',NULL),(9,'','LUZ MARINA BENITEZ  CATTEBEKE','46','5','','0991700229','-25.276527359109124, -57.5859085394505','',NULL),(10,'','rodrigo berni','47','5','','0972171017','-25.309137313384127, -57.5944936393116','',NULL),(16,'','SORAYA CHAMORRO','52','5','','0973564545','-25.260970676570363, -57.5788577647004',NULL,NULL),(13,'','DIEGO LOPEZ','43','5','','0991702241','-25.306394720530463, -57.5991713100274',NULL,NULL),(14,'','HERNAN ORTIZ MOREIRA','50','5','ingramirezsamudio@gmail.com','','-25.30391082642718, -57.53765503548297',NULL,NULL),(15,'','LAURA NOTARIO','51','5','','0981432343','-25.35609117036234, -57.50204443931579',NULL,NULL),(11,'','MARIA VERONICA  PORRO ACOSTA','48','5','','0984339222','-25.307869295287286, -57.5847357026104',NULL,NULL),(17,'','DIEGO VAESKEN','54','5','','0992282045','-25.295341585936875, -57.5865950731353',NULL,NULL),(12,'','MATIAS JACQUET','49','5','','0981650043','-25.296850319720733, -57.5875233900671',NULL,NULL),(18,NULL,'MIGUEL SEBASTIAN CARDOZO','53','5',NULL,'0984186725','-25.284979, -57.569247',NULL,NULL),(19,'','JORGE  CARRON','55','5','','0981192172','-25.273898975909656, -57.6021422928234',NULL,NULL),(20,'','FRANCISCO MONTAñEZ','56','5','','0982122003','-25.320017937307906, -57.5631479192030',NULL,NULL),(21,'','CARLOS FRIAS FERRARI','57','5','','0981230687','-25.307759912159987, -57.5948354029508',NULL,NULL),(22,'','ALICIA BEATRIZ DUARTE ALUM','58','5','','0971850201','-25.31417840761135, -57.61624054555001',NULL,NULL),(23,'','ALEJANDRA SAGUIER','59','5','','0981815326','-25.297620900705525, -57.6163135195446',NULL,NULL),(24,'','PAOLA EULERICH','60','5','','0971703624','-25.295625471014905, -57.5977574606107',NULL,NULL),(25,'4324112','ISAURA FLORES','63','5','florezozuna@gmail.com','0971608560','-25.32664152331328, -57.55245634815612',NULL,NULL),(26,'','DAVID ALEJANDRO IRRAZABAL SAMANIEGO','64','5','','0982440707','-25.321584729293598, -57.5575739174671',NULL,NULL),(27,'','MATHIAS IVAN MELGAREJO SALUM','65','5','','0971265550','-25.345992722655858, -57.6027455501299',NULL,NULL),(28,'','RAQUEL LEAÑO','66','5','','0991889824','-25.27385330213355, -57.60793744915703',NULL,NULL),(29,'','MIRNA GABRIELA GODOY RIVAS','67','5','','0981454818','-25.29310418356756, -57.59743245814167',NULL,NULL),(30,'','MARIO CHELLI','68','5','','0981541053','-25.259651767093686, -57.5790445771165',NULL,NULL),(31,'','LAURA AYALA DE MONFREDINI','69','5','','0972440010','-25.265535981657223, -57.5746975494828',NULL,NULL),(32,'','LETICIA CAROLINA DUARTE HELMAN','70','5','','0971714123','-25.30032891172236, -57.58919708009998',NULL,NULL),(33,'','ALEXANDRA QUINTANA','71','5','','0981609702','-25.281644992833876, -57.5996358088061',NULL,NULL),(34,'1366340','DIEGO LOPEZ','','','diegol77@hotmail.com','0991702241','-25.277026992078312, -57.5858615109164',NULL,NULL);
/*!40000 ALTER TABLE `usuarios_finales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zonas`
--

DROP TABLE IF EXISTS `zonas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zonas` (
  `id_zona` int(11) NOT NULL AUTO_INCREMENT,
  `zona` varchar(50) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zonas`
--

LOCK TABLES `zonas` WRITE;
/*!40000 ALTER TABLE `zonas` DISABLE KEYS */;
INSERT INTO `zonas` VALUES (5,'Zona de Reparto 1 (Gran Asunción)','Incluye a todas las grandes ciudades de central'),(6,'Zona de Reparto 2 (Interior)','Incluye a todas las grandes ciudades del este del país');
/*!40000 ALTER TABLE `zonas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-23 11:25:27
