-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: FixFast
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add ticket',7,'add_ticket'),(26,'Can change ticket',7,'change_ticket'),(27,'Can delete ticket',7,'delete_ticket'),(28,'Can view ticket',7,'view_ticket'),(29,'Can add configuracion correo',8,'add_configuracioncorreo'),(30,'Can change configuracion correo',8,'change_configuracioncorreo'),(31,'Can delete configuracion correo',8,'delete_configuracioncorreo'),(32,'Can view configuracion correo',8,'view_configuracioncorreo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$720000$WbtlYXrRnjRbXpHgdWv3Rw$rrKMBmAXinjfezsjVbdmbKA/YEUsV3l3W5xRMgBEEUg=','2024-09-10 16:00:22.425000',1,'davis','','','dhernandezg27@miumg.edu.gt',1,1,'2024-03-05 22:43:22.426000'),(2,'pbkdf2_sha256$720000$j6kACNhZzfp4DGSAaAeFBg$cgwJkPlvh2UCJzdDZdapS8sbpCm8RmYPbaqKH4lwNcU=','2024-03-11 19:46:30.488000',0,'daniel','','','',0,1,'2024-03-06 23:04:00.433000'),(3,'pbkdf2_sha256$720000$bkA55mWf1bSCEOZpfxbVy3$q/0HvVQ+OdAMMo/WKtZmY/r1Ifm9nQqunpmxVfRikxI=','2024-03-11 19:29:32.125000',0,'eunice','','','',0,1,'2024-03-11 19:29:10.617000'),(4,'pbkdf2_sha256$720000$GgSlkXj4tyzsGyViCtkWec$JDa5uziy/rU40r9yMxDVLevHisJpoVq9sVYUwZG+z6g=','2024-05-25 22:20:37.083000',0,'danie.hull','','','',0,1,'2024-05-25 22:20:35.316000'),(5,'pbkdf2_sha256$720000$duS0w8jqFm8d9NIobMBcqc$lw2Hj2RvnEslZ6sZFAto+XBPIBCUpPN9vH8E0tXjuKE=',NULL,0,'francisco','','','',0,1,'2024-09-06 20:38:48.133000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_configuracioncorreo`
--

DROP TABLE IF EXISTS `core_configuracioncorreo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_configuracioncorreo` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int NOT NULL,
  `smtp_user` varchar(255) NOT NULL,
  `smtp_password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_configuracioncorreo`
--

LOCK TABLES `core_configuracioncorreo` WRITE;
/*!40000 ALTER TABLE `core_configuracioncorreo` DISABLE KEYS */;
INSERT INTO `core_configuracioncorreo` VALUES (6,'smtp-mail.outlook.com',587,'soportenatur2024@outlook.es','Invierno.2020');
/*!40000 ALTER TABLE `core_configuracioncorreo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `core_ticket`
--

DROP TABLE IF EXISTS `core_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `core_ticket` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `priority` varchar(10) NOT NULL,
  `asignar` varchar(20) NOT NULL,
  `categorias` varchar(30) NOT NULL,
  `closed` tinyint(1) NOT NULL,
  `body` longtext NOT NULL DEFAULT (_utf8mb3' '),
  `sender` varchar(254) NOT NULL,
  `subject` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `core_ticket`
--

LOCK TABLES `core_ticket` WRITE;
/*!40000 ALTER TABLE `core_ticket` DISABLE KEYS */;
INSERT INTO `core_ticket` VALUES (1,'hola','hola','low','','',1,' ',' ',' '),(2,'hola','hola prueba 2','low','','',1,' ',' ',' '),(3,'hola','hola','medium','','',0,' ',' ',' '),(4,'hola','hola4','high','','',1,' ',' ',' '),(5,'josdi','hlksdjlk','low','','',0,' ',' ',' '),(6,'prueba de nuevo','kjkld','low','','',0,' ',' ',' '),(7,'hola de nuevo','hola de nuevo','low','','',0,' ',' ',' '),(8,'davis','davis','low','','',0,' ',' ',' '),(9,'hola davis','davis','high','','',0,' ',' ',' '),(10,'problema con la impresora','problema con la impresora','low','','',0,' ',' ',' '),(11,'s','s','low','uno','red',0,' ',' ',' '),(12,'prueba de tickets','tickets','high','Davis Hernandez','Disco_duro',0,' ',' ',' '),(13,'hola davis','hola davis','high','Davis Hernandez','red',0,' ',' ',' '),(14,'es otra prueba','hola prueba','high','Davis Hernandez','red',0,' ',' ',' '),(15,'hola','hola','medium','Libby Arias','Disco_duro',1,' ',' ',' '),(16,'NUEVO TICKET DE PRUEBA','DASDSADSADAD','low','Katherine Monterroso','Impresoras',0,' ',' ',' '),(17,'Problemas con la impresora','tenemos problemas con la impresora, el cabezal dejo de funcionar y la tinta ya se acabo, por favor nos pueden apoyar con este tema, el cableado esta daÃ±ado','high','Davis Hernandez','Impresoras',1,' ',' ',' '),(18,'sprint 3','sprint 3','high','Davis Hernandez','Aplicaciones',0,' ',' ',' '),(19,'hola','\nhola\n\n','','','',0,' ',' ',' '),(20,'esto es una prueba de correo pop','\nhola prueba pop\n','','','',0,' ',' ',' '),(21,'segunda prueba de pop3','\nhola\n','','','',0,' ',' ',' '),(22,'hola','\nhola\n\n','','','',0,' ',' ',' '),(23,'hola','\nroot\n\n','','','',0,' ',' ',' '),(24,'prueba 25-05-2024','\nholaaaaaaaaaa\n','','','',0,' ',' ',' '),(25,'libby','\nhola\n','','','',0,' ',' ',' '),(26,'hola','\nholaaaaa\n','','','',0,' ',' ',' '),(27,'analisis de sistemas','con la impresora','high','Davis Hernandez','Impresoras',0,' ',' ',' '),(28,'analisis de sistemas prueba','\nholaaaaaaaaaaaaa\n\n','','','',0,' ',' ',' '),(29,'prueba davis','hola','medium','Davis Hernandez','Impresoras',0,' ',' ',' '),(30,'hola','\nhola\n','','','',0,' ',' ',' '),(31,'prueba de plataforma','\nhola\n','','','',0,' ',' ',' '),(32,'test test','\nholahola\n\n','','','',0,' ',' ',' '),(33,'que tal','\nhola\n','','','',0,' ',' ',' '),(34,'test','\ntest\n','','','',0,' ',' ',' '),(35,'test de notificaciones','\ntest de noti\n','','','',0,' ',' ',' '),(36,'test noti','\ntest noti\n','','','',0,' ',' ',' '),(37,'test noti 3','\n Â Â Â  test noti 3\n','','','',0,' ',' ',' '),(38,'test noti 4','\ntest noti 4\n','','','',0,' ',' ',' '),(39,'test 5','\n Â Â Â  test 5 noti\n','','','',0,' ',' ',' '),(40,'test test','\ntest tes\n','','','',0,' ',' ',' '),(41,'test','\ntest\n','','','',0,' ',' ',' ');
/*!40000 ALTER TABLE `core_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-03-06 23:04:01.024000','2','daniel',1,'[{\"added\": {}}]',4,1),(2,'2024-09-06 20:38:48.650000','5','francisco',1,'[{\"added\": {}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'core','configuracioncorreo'),(7,'core','ticket'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-09-10 17:52:28.101175'),(2,'auth','0001_initial','2024-09-10 17:52:28.683319'),(3,'admin','0001_initial','2024-09-10 17:52:28.787085'),(4,'admin','0002_logentry_remove_auto_add','2024-09-10 17:52:28.794741'),(5,'admin','0003_logentry_add_action_flag_choices','2024-09-10 17:52:28.814414'),(6,'contenttypes','0002_remove_content_type_name','2024-09-10 17:52:28.902238'),(7,'auth','0002_alter_permission_name_max_length','2024-09-10 17:52:28.952405'),(8,'auth','0003_alter_user_email_max_length','2024-09-10 17:52:28.976539'),(9,'auth','0004_alter_user_username_opts','2024-09-10 17:52:28.990692'),(10,'auth','0005_alter_user_last_login_null','2024-09-10 17:52:29.080428'),(11,'auth','0006_require_contenttypes_0002','2024-09-10 17:52:29.086564'),(12,'auth','0007_alter_validators_add_error_messages','2024-09-10 17:52:29.104105'),(13,'auth','0008_alter_user_username_max_length','2024-09-10 17:52:29.208407'),(14,'auth','0009_alter_user_last_name_max_length','2024-09-10 17:52:29.274467'),(15,'auth','0010_alter_group_name_max_length','2024-09-10 17:52:29.296179'),(16,'auth','0011_update_proxy_permissions','2024-09-10 17:52:29.303984'),(17,'auth','0012_alter_user_first_name_max_length','2024-09-10 17:52:29.358364'),(18,'core','0001_initial','2024-09-10 17:52:29.375583'),(19,'core','0002_ticket_asignar_ticket_categorias','2024-09-10 17:52:29.413491'),(20,'core','0003_alter_ticket_asignar','2024-09-10 17:52:29.418423'),(21,'core','0004_ticket_closed','2024-09-10 17:52:29.437939'),(22,'core','0005_ticket_body_ticket_sender_ticket_subject','2024-09-10 17:52:29.510830'),(23,'core','0006_configuracioncorreo','2024-09-10 17:52:29.526915'),(24,'core','0007_rename_email_host_password_configuracioncorreo_smtp_password','2024-09-10 17:52:29.542885'),(25,'core','0008_alter_configuracioncorreo_smtp_host_and_more','2024-09-10 17:52:29.570709'),(26,'sessions','0001_initial','2024-09-10 17:52:29.600543');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('02ggluisd6cvbym1r5y0bg5dpzw83ttd','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rvLQX:GxFmFZx8JZRBqSbCbjFDSRTDRI2L-0So0Tu_QNP_K24','2024-04-26 18:15:05.662000'),('089sg3v3mx5p9u21trx1q3jp4mnsw1dw','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1s8BDR:xfWTIqR-qITzOT92Em5VAQ3y3X8n8gSVryQfcElOpzk','2024-06-01 03:58:37.021000'),('0buqrl0obnrwvxk72kz5gm732o728gtw','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rjjtR:li3oaJfaI97scs0_X5_NBhqHSs9YgFMyvu2TsvAubPk','2024-03-25 17:56:57.261000'),('0qmgaaujy5wod9w2z6sx87ovxojgpuh0','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rud6i:oQkQREUdnII9jpH4z3V9jUIQqgGY2lxyVLM6nfFo454','2024-04-24 18:55:40.298000'),('1ne38z6ikymzj8wq3pz6t7vavniekai6','.eJxVjEEOwiAQAP_C2RB2gUI9evcNhGWpVA1NSnsy_l1JetDrzGReIsR9K2FveQ0zi7NAcfplFNMj1y74HuttkWmp2zqT7Ik8bJPXhfPzcrR_gxJb6VtLyIMxCZOdwFnrlB5VxqyMJgLwiOA1sSLnzLcEIO0HTI7BT6M14v0BspY2cA:1ri0JF:c1Qvl4forrIgQVflm3DCxOANMIA5OICIBFH0SbTq4d4','2024-03-20 23:04:25.238000'),('2c4m1rvtmyuytgfivvkg15ym1k8oz37p','.eJxVjDsOwjAQBe_iGllZL_5R0nMGa71ecAA5UpxUiLtDpBTQvpl5L5VoXWpau8xpLOqkQB1-t0z8kLaBcqd2mzRPbZnHrDdF77Try1Tked7dv4NKvX7rcGU2RAY8G_YcEcEOGAScExYUG72EENGBxzhg9JYkA4ZS6BgYRb0_2Sk3hA:1sUV5H:4rO63MB99KCuGEcNfrkjSIGsJnBKjiJ8KPnT3iBG6LI','2024-08-01 17:38:27.349000'),('335t4ushcaf6rcdypokorp4gykb4ed8q','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rwk2J:J9pDhZNM-t-d3aNaktb1lSXykr35MIv_TH_6p4YQJ1c','2024-04-30 14:43:51.881000'),('3or7w4kv0qnr6qrrrvrgmixfd1y5u5ll','.eJxVjDsOwjAQBe_iGllZL_5R0nMGa71ecAA5UpxUiLtDpBTQvpl5L5VoXWpau8xpLOqkQB1-t0z8kLaBcqd2mzRPbZnHrDdF77Try1Tked7dv4NKvX7rcGU2RAY8G_YcEcEOGAScExYUG72EENGBxzhg9JYkA4ZS6BgYRb0_2Sk3hA:1smQUH:T2I6v1VH4JaRmCZJlxxe8botv9aQ3piGfrDc8JygWTM','2024-09-20 04:22:21.481000'),('4ux1a3bijufjglbela6g2o7ccvkai9w9','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rzJSe:9FE84zmlwThpqkL8Af6h38Zdv-4Wt2oey-CSCHsA4Wg','2024-05-07 16:57:40.850000'),('5cmh0arnenp6usguou506bf62pi09bla','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rvKXZ:EMigdtDw1o-YIWsYefNg1tSD-m046jmeSK-ligM5wlg','2024-04-26 17:18:17.481000'),('757bqccatlzql82jzmchhu5w3ggwlv4i','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ryID4:KAkwhR5TKPGg2EOS3JlB5jD-0UOR8ADAUBmHQfYKXqQ','2024-05-04 21:25:22.605000'),('7790t2rix5yntb7nyyw0b7qv06xqi3ip','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rjifx:PCgPh_ZxfW1NeQepndPpRmyVWTu5OCQ9CqfVUW5M5gE','2024-03-25 16:38:57.898000'),('7kaxny8lxpea48vz87x8xqzee7sdejpj','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rt8br:3JFfIhQptuSrQYMKa9P5ThRBU2QuD9aWvkbMqRbYdlw','2024-04-20 16:09:39.815000'),('9r2zbvlwv4d1pn53hagibithtfv9ngrc','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1s8Bck:BmH8XGg8J2B5qRN6aJyTEvqRVHgDZC6mbKc1RE3v4ug','2024-06-01 04:24:46.829000'),('9vmj25dkuodt1kdnatdgddn7wpn07l7w','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1roqY3:7138Xv7-w8nPUi9-3wwccmiluZjRWTREatdRirvagC4','2024-04-08 20:03:59.663000'),('apcp4jphqm7mdel0tkooii4tsoamjz9r','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rvIVx:irAwAKzY5mPycaHI_EQJEJqNl1ZtoKggTNxfNZuMzB0','2024-04-26 15:08:29.421000'),('artlqrtdqc8z4idk0iqbpxrk3p4qjk0d','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ryJkS:GxYJ0MlXPPAjCNqqrcuKcTxlhUsB9MXrDzybp6LJN1Q','2024-05-04 23:03:56.209000'),('bakzir5yvjaoe2l9odlcwtwu52yhl7as','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1roqCT:jgy4itOzO67mV64x2YN5d5ZVkFdjeJxoEoDr_pqBgKY','2024-04-08 19:41:41.434000'),('bt20e67brhwg7m5c1c46r3c743d41irf','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ro3An:7MRt-C023_P7TwtfB5VaBgSqTuQBEYAzrE0uLZF7nVc','2024-04-06 15:20:41.982000'),('cb8wmods0tv7cviuuuvnbbdj94esr5sa','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ruEBk:k9NkRAxoCmmKmsj9L0jevwQh9R1j-eOCEjuUjwcNcJw','2024-04-23 16:19:12.463000'),('d6eiwhljzo6uanszw5bjffa4v76by689','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rjkKr:iYZbPYqp-EpW-q-l6Gu_kNlLzw2z7RIpJuNJ8x5IprA','2024-03-25 18:25:17.197000'),('frcf91lw91gfabmciblt8jgsbu65qh7g','.eJxVjDsOwjAQBe_iGllZL_5R0nMGa71ecAA5UpxUiLtDpBTQvpl5L5VoXWpau8xpLOqkQB1-t0z8kLaBcqd2mzRPbZnHrDdF77Try1Tked7dv4NKvX7rcGU2RAY8G_YcEcEOGAScExYUG72EENGBxzhg9JYkA4ZS6BgYRb0_2Sk3hA:1smd6l:bUn-Ph9m43APQ6yDY8P4Vm-C6xFj3yFYgazDqQG2ep4','2024-09-20 17:50:55.964000'),('gyf3h8ojc0tlt05yfhxmvhk5d3gibern','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ryD1c:z-vnDG2UqyueEg39FHgAmjmj_WCLM7_QlzlJMUFBrkc','2024-05-04 15:53:12.826000'),('hw9xyzqfbhiod5v219c5dzkuwd4wmhx1','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1riIBU:sZ0DZCBD5qyopKGP4n5G1bgRI19trMRT4_yaVU7p_FE','2024-03-21 18:09:36.341000'),('icta6pj5vff82k0gj0q6o3is9try1u30','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rzHcD:PX7VSSlIRz6zjPYvGx7YxA4HLuY9hkZLgqzOXgEO278','2024-05-07 14:59:25.687000'),('je1ncq05t02tv779jn35g4kssbj3k8hk','.eJxVjDsOwjAQBe_iGllZL_5R0nMGa71ecAA5UpxUiLtDpBTQvpl5L5VoXWpau8xpLOqkQB1-t0z8kLaBcqd2mzRPbZnHrDdF77Try1Tked7dv4NKvX7rcGU2RAY8G_YcEcEOGAScExYUG72EENGBxzhg9JYkA4ZS6BgYRb0_2Sk3hA:1shxqM:T2LC6SmFPzuy4nuAW3fq4QvucszY4l5Vy9nZ9oRBIks','2024-09-07 20:58:42.062000'),('jravx0aiy74tbee3qc7x000p127imi94','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ruFQl:nf8dwHMlFflMYNlAF5diu5Muqj6XdrfZhJUQ2pGrE0E','2024-04-23 17:38:47.886000'),('jvn1zx4axld9mfa9sgynl43l4q93erh1','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1riH56:8HM3XS7DVbm4ku-YycSw9tLYOgh10Eibe7nHj3CZbbQ','2024-03-21 16:58:56.328000'),('kdaqws1x5mq75zcx3a3t1iorhekgf020','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1s8BLd:BJpP6HpbIb2OLqswxGBAJryCVDGcImY2wpBt1V4-vOk','2024-06-01 04:07:05.652000'),('kidx8tobzps0el1gp3pp1a0xbw5jvdb0','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rt8by:ljgpI0QWmAji7YX3TKIpJziSfcRS3c_mZATul3LY_fg','2024-04-20 16:09:46.425000'),('kw7vh0y3miwfhy9swbzpe7nt8eg0vjvw','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ryzEH:dEsox1Nko35XSI1BZF_DytvtXxYv9jMn5i1idSF3GTI','2024-05-06 19:21:29.060000'),('l1eprpc1isdtff613i1awqks3elizt9v','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rt8c8:9NKYvtNto2lgN_Xx4Rp0qkcEbczD-E79x-PxI0WQGhA','2024-04-20 16:09:56.093000'),('loasupigpkrg26y9iqveifu97jbq000f','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rjjtP:oB0qt36FMbZ4K2uru71aEZJMBqjlAip2Ry2d6Ka3jHE','2024-03-25 17:56:55.748000'),('mapw8p64aaf7ezsgt9j91y9orjk8z30x','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rzHWw:vpFHMVtKpWTKvWXXwBnrcL4aaGW2fqjKPQr5hFSkWOo','2024-05-07 14:53:58.046000'),('mlalc8qgmczxt9k0lq2759o4ljxra36a','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ruI3D:_hFVY_YJLSqujiK21uxhspjEt_NGRxgs_hWhaaN24N8','2024-04-23 20:26:39.218000'),('mn37vruqb55zdh9vvs5iibsaz6yqqfp5','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rjjtR:li3oaJfaI97scs0_X5_NBhqHSs9YgFMyvu2TsvAubPk','2024-03-25 17:56:57.225000'),('nc6pw6r11kj8mbfvddjaig48ia3x6hb6','.eJxVjDsOwjAQBe_iGllZL_5R0nMGa71ecAA5UpxUiLtDpBTQvpl5L5VoXWpau8xpLOqkQB1-t0z8kLaBcqd2mzRPbZnHrDdF77Try1Tked7dv4NKvX7rcGU2RAY8G_YcEcEOGAScExYUG72EENGBxzhg9JYkA4ZS6BgYRb0_2Sk3hA:1smPz6:VrXUBp8jyzQG-FY9eCgVreR_bV-xD6PaE1X0js0egBo','2024-09-20 03:50:08.713000'),('nchdln7m5tbqy68jayj0vngk8jv0icfz','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ruDpW:hm2vk8ht7EnWX_fs4MY6oDodtBuR4yBVriCDJcDlF60','2024-04-23 15:56:14.606000'),('nkxaux22b8zdywi6e9pftaig984bca3c','.eJxVjDsOwjAQBe_iGllZL_5R0nMGa71ecAA5UpxUiLtDpBTQvpl5L5VoXWpau8xpLOqkQB1-t0z8kLaBcqd2mzRPbZnHrDdF77Try1Tked7dv4NKvX7rcGU2RAY8G_YcEcEOGAScExYUG72EENGBxzhg9JYkA4ZS6BgYRb0_2Sk3hA:1smOpC:_XXqI0Asjdx41SWADyjl0LwQHMupqhTC_60jWMgSEo8','2024-09-20 02:35:50.782000'),('nrujjq87jp77wn8k4owp60a1xwwoq40l','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rv39Z:2acG8Q21PMlGE9qTSk7gyKOMBDqvpnOrHzoQmoPVIM8','2024-04-25 22:44:21.892000'),('nvvsi4pk3wd2pntkmkzke4lca5smndh0','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ruZDa:0v1btN0bKv6kfstSlwWqoLvsUma77rbrBstBGtWp2yk','2024-04-24 14:46:30.902000'),('o4ukfhm2x0o2tgp52jpxl5ut59jmwgse','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1riGt1:Yu4GZPWDCiptVlXCI-dBnbl8aBielYzCy_a43lz9rlc','2024-03-21 16:46:27.119000'),('ojeruxeo2wso09kssnu6teljfx0w613m','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rzHXi:YpqC6C_BK_uLViO-j2aSc5sJbbCkDz2UVQ4hjEC6rkY','2024-05-07 14:54:46.943000'),('oly89hk59s0uip96ozvh6qmtxq3bn3c7','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1s8CFX:yfkOj7i7wJLPiG8D9h2zvBt8rSTDkiB51LNMNddnmrg','2024-06-01 05:04:51.828000'),('p07w0y98z5ic42843uk06gq9jrvkrizi','.eJxVjDsOwjAQBe_iGllZL_5R0nMGa71ecAA5UpxUiLtDpBTQvpl5L5VoXWpau8xpLOqkQB1-t0z8kLaBcqd2mzRPbZnHrDdF77Try1Tked7dv4NKvX7rcGU2RAY8G_YcEcEOGAScExYUG72EENGBxzhg9JYkA4ZS6BgYRb0_2Sk3hA:1smPKg:b4oMN5EhCCgWVCgRFbzZGMF4vrcRpQN3T1XBVlG96Ho','2024-09-20 03:08:22.680000'),('p3fmet0mvhukxsvv7a2w33gjpzjyyqow','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rt8c1:Z8hkWCNiNixsgDwk5iOHgQci9WN9qZ9luvFLyzBtvMo','2024-04-20 16:09:49.898000'),('p5bx7t8xlu6bt7x8snqlknajo3mvhvms','.eJxVjDsOwjAQBe_iGllZL_5R0nMGa71ecAA5UpxUiLtDpBTQvpl5L5VoXWpau8xpLOqkQB1-t0z8kLaBcqd2mzRPbZnHrDdF77Try1Tked7dv4NKvX7rcGU2RAY8G_YcEcEOGAScExYUG72EENGBxzhg9JYkA4ZS6BgYRb0_2Sk3hA:1shygX:-QCx2ieEZw85_OzgHCxgfXr9akn0QzCuoObm5RypHNY','2024-09-07 21:52:37.847000'),('pd0f0zozo5a3ssl3f2kvbr4e3rwohx4r','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rvL8a:pb7j12xRfw7gub2whkUJ4WlfVUZigkYCKQckYnIrOVg','2024-04-26 17:56:32.565000'),('pksns5z9rlyyorh6r2akf0ke0v6r6avq','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rzHbd:N6OOY3VTP7LyB6brHDj3ea67Ou9scCjK4c9uodqWA-o','2024-05-07 14:58:49.121000'),('rno1wn3bow29mhivzvx40vbu507lhs2v','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ruwGw:HXlAS8SLnAuQxVT0gmg90hdNPeDoxceSBZt4gxKv0l0','2024-04-25 15:23:30.966000'),('s4ohfjk4mt77nm0rr0umczt9smd21y5g','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rv2xp:yDsir1lNoERchxYNrLAUSEOQOsl0YzjIAaRN8KmZzQw','2024-04-25 22:32:13.935000'),('s6w8qktcpwdjmdop60lkznbss5b7tmb6','.eJxVjDsOwjAQBe_iGllZL_5R0nMGa71ecAA5UpxUiLtDpBTQvpl5L5VoXWpau8xpLOqkQB1-t0z8kLaBcqd2mzRPbZnHrDdF77Try1Tked7dv4NKvX7rcGU2RAY8G_YcEcEOGAScExYUG72EENGBxzhg9JYkA4ZS6BgYRb0_2Sk3hA:1smfMz:vTmfUAQ5vLWs9wt8z5oWxtHyhYoUp5vviYmr3ZsuXaE','2024-09-20 20:15:49.586000'),('t12bcf88hcyocj0evykmykecl1m0b649','.eJxVjDsOwjAQBe_iGllZL_5R0nMGa71ecAA5UpxUiLtDpBTQvpl5L5VoXWpau8xpLOqkQB1-t0z8kLaBcqd2mzRPbZnHrDdF77Try1Tked7dv4NKvX7rcGU2RAY8G_YcEcEOGAScExYUG72EENGBxzhg9JYkA4ZS6BgYRb0_2Sk3hA:1smQfr:16Fvhyg14hj90ybNdEbThLRGWWmyGlRvA26gUC15d78','2024-09-20 04:34:19.834000'),('tp1dvnlvkgimx3epgmrwsedeqshwqyq4','.eJxVjDsOwjAQBe_iGllZL_5R0nMGa71ecAA5UpxUiLtDpBTQvpl5L5VoXWpau8xpLOqkQB1-t0z8kLaBcqd2mzRPbZnHrDdF77Try1Tked7dv4NKvX7rcGU2RAY8G_YcEcEOGAScExYUG72EENGBxzhg9JYkA4ZS6BgYRb0_2Sk3hA:1so3Hy:4pePKK6oTubWAMFTHRJwfJp5zpfk-jw8ny_kdrldG2c','2024-09-24 16:00:22.432000'),('tpuk49omty81rlnb2ije461ovq6z0p2u','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rpWXp:tsvjsgCaMr2eXPAqgk250Vr7-lxFwdlXwe_5brFB4io','2024-04-10 16:54:33.532000'),('v4af4wpoen72jwe83jdxtq1y3zmf3xv4','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rxAni:sw2uMmeSW_Tod7ACsbGfWDzq1ga294mZ9bdS51PnGAY','2024-05-01 19:18:34.099000'),('vgckyc0ryo52c38j7dz4z386de8plds9','.eJxVjDsOwjAQBe_iGllZL_5R0nMGa71ecAA5UpxUiLtDpBTQvpl5L5VoXWpau8xpLOqkQB1-t0z8kLaBcqd2mzRPbZnHrDdF77Try1Tked7dv4NKvX7rcGU2RAY8G_YcEcEOGAScExYUG72EENGBxzhg9JYkA4ZS6BgYRb0_2Sk3hA:1sUUit:EfCKnLEeYtisY2xneK0C5_1KkUZRqh1bSPeLzrYxvJ8','2024-08-01 17:15:19.485000'),('xbsaa65fcevbsiumod3byknedni5vqdn','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ryD1e:V3NXu5CDFgItdflvZII1JiPyB0VKFwPUfG66sMMJHFg','2024-05-04 15:53:14.502000'),('xjajcst6gymxq2fhclad1tif1jlmkoag','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rvLHL:KouP-yjP6Y-lGMi1RdMyBnb8-YEJKHFMewpNYgi-J_A','2024-04-26 18:05:35.268000'),('yujiuhpzyi7utf092whid5e13tmm56pa','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1ruZyw:lHhf_GhQGcVIoKYEs-USXWRzs3-uRAgoyQVjldQE8Sk','2024-04-24 15:35:26.814000'),('zs3o1ge01nhww95xq0fz0xjn8vlp6n47','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rpVUX:oRYIG2BkkaCAM16SOOdk0Qm8a46i-Tx1p239vOTYfAc','2024-04-10 15:47:05.172000'),('zw6o24vq30ot00tsr5zidkx1ze1ahjh9','.eJxVjEEOwiAQRe_C2hCgZECX7j0DmYEZqRqalHZlvLsh6UK3_7333yrhvtW0d17TXNRFWXX63Qjzk9sA5YHtvui8tG2dSQ9FH7Tr21L4dT3cv4OKvY7agYiHYLw3JVAGG3iKgk6gIJHxQRhInHeRmCNJtgiTp8D2bEoE9fkC-Sw4lg:1rvKzx:FIulW_-EbRSisDOU87qqVlr4Qkr6eCvFMO9z0kw7wr4','2024-04-26 17:47:37.449000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-10 12:10:07
