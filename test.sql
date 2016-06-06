-- MySQL dump 10.13  Distrib 5.6.19, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: goethe
-- ------------------------------------------------------
-- Server version	5.6.19-1~exp1ubuntu2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colors`
--

LOCK TABLES `colors` WRITE;
/*!40000 ALTER TABLE `colors` DISABLE KEYS */;
INSERT INTO `colors` VALUES (1,'#ff1945','#ff1945','2016-03-05 22:14:16','2016-03-05 22:14:16'),(2,'#ff6555','#ff6555','2016-03-05 22:14:16','2016-03-05 22:14:16'),(3,'#cd4e00','#cd4e00','2016-03-05 22:14:16','2016-03-05 22:14:16'),(4,'#f58414','#f58414','2016-03-05 22:14:16','2016-03-05 22:14:16'),(5,'#ffb204','#ffb204','2016-03-05 22:14:16','2016-03-05 22:14:16'),(6,'#ffdd19','#ffdd19','2016-03-05 22:14:16','2016-03-05 22:14:16'),(7,'#dac900','#dac900','2016-03-05 22:14:16','2016-03-05 22:14:16'),(8,'#b8da00','#b8da00','2016-03-05 22:14:16','2016-03-05 22:14:16'),(9,'#a1ba19','#a1ba19','2016-03-05 22:14:16','2016-03-05 22:14:16'),(10,'#9dd637','#9dd637','2016-03-05 22:14:16','2016-03-05 22:14:16'),(11,'#11b421','#11b421','2016-03-05 22:14:16','2016-03-05 22:14:16'),(12,'#35d286','#35d286','2016-03-05 22:14:16','2016-03-05 22:14:16'),(13,'#30b294','#30b294','2016-03-05 22:14:16','2016-03-05 22:14:16'),(14,'#3f93a1','#3f93a1','2016-03-05 22:14:16','2016-03-05 22:14:16'),(15,'#287dc2','#287dc2','2016-03-05 22:14:16','2016-03-05 22:14:16'),(16,'#7288d5','#7288d5','2016-03-05 22:14:16','2016-03-05 22:14:16'),(17,'#8329c1','#8329c1','2016-03-05 22:14:16','2016-03-05 22:14:16'),(18,'#bd5ca0','#bd5ca0','2016-03-05 22:14:16','2016-03-05 22:14:16'),(19,'#ff5a8c','#ff5a8c','2016-03-05 22:14:16','2016-03-05 22:14:16');
/*!40000 ALTER TABLE `colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitions`
--

DROP TABLE IF EXISTS `competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competitions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_id` int(10) unsigned NOT NULL,
  `users_limit` tinyint(1) NOT NULL DEFAULT '0',
  `users_amount` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `rules` longtext COLLATE utf8_unicode_ci,
  `event_date` datetime DEFAULT NULL,
  `cover_photo` mediumtext COLLATE utf8_unicode_ci,
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `hashtag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `youtube` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(10) unsigned DEFAULT NULL,
  `modified_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title_en` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_de` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_en` longtext COLLATE utf8_unicode_ci,
  `description_de` longtext COLLATE utf8_unicode_ci,
  `rules_en` longtext COLLATE utf8_unicode_ci,
  `rules_de` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `competitions_region_id_foreign` (`region_id`),
  KEY `competitions_location_id_foreign` (`location_id`),
  KEY `competitions_created_by_foreign` (`created_by`),
  KEY `competitions_modified_by_foreign` (`modified_by`),
  CONSTRAINT `competitions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `competitions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  CONSTRAINT `competitions_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`),
  CONSTRAINT `competitions_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitions`
--

LOCK TABLES `competitions` WRITE;
/*!40000 ALTER TABLE `competitions` DISABLE KEYS */;
INSERT INTO `competitions` VALUES (1,'Activitdad',1,0,NULL,'Descripcio','Detallamos','2016-03-24 09:05:00','goethe_media_7.jpeg','32',3,1,'343','434343','434343','4443','434334',NULL,NULL,'2016-03-14 09:10:02','2016-04-16 09:05:09','Activity','Acdaritir','Description','DescDeustchdd',NULL,NULL);
/*!40000 ALTER TABLE `competitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cups`
--

DROP TABLE IF EXISTS `cups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `competition_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cups_competition_id_foreign` (`competition_id`),
  CONSTRAINT `cups_competition_id_foreign` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cups`
--

LOCK TABLES `cups` WRITE;
/*!40000 ALTER TABLE `cups` DISABLE KEYS */;
/*!40000 ALTER TABLE `cups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `icons`
--

DROP TABLE IF EXISTS `icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_region` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `icons`
--

LOCK TABLES `icons` WRITE;
/*!40000 ALTER TABLE `icons` DISABLE KEYS */;
INSERT INTO `icons` VALUES (1,'icon-comentarios',0,'icon-comentarios','2016-03-05 22:14:16','2016-03-05 22:14:16'),(2,'icon-video',0,'icon-video','2016-03-05 22:14:16','2016-03-05 22:14:16'),(3,'icon-slam-x-o',0,'icon-slam-x-o','2016-03-05 22:14:16','2016-03-05 22:14:16'),(4,'icon-slam-x',0,'icon-slam-x','2016-03-05 22:14:16','2016-03-05 22:14:16'),(5,'icon-slam-black',0,'icon-slam-black','2016-03-05 22:14:16','2016-03-05 22:14:16'),(6,'icon-slam-arg',0,'icon-slam-arg','2016-03-05 22:14:16','2016-03-05 22:14:16'),(7,'icon-slam',0,'icon-slam','2016-03-05 22:14:16','2016-03-05 22:14:16'),(8,'icon-provincia-cordoba',1,'icon-provincia-cordoba','2016-03-05 22:14:16','2016-03-05 22:14:16'),(9,'icon-provincia-entrerios',1,'icon-provincia-entrerios','2016-03-05 22:14:16','2016-03-05 22:14:16'),(10,'icon-provincia-formosa',1,'icon-provincia-formosa','2016-03-05 22:14:16','2016-03-05 22:14:16'),(11,'icon-provincia-jujuy',1,'icon-provincia-jujuy','2016-03-05 22:14:16','2016-03-05 22:14:16'),(12,'icon-provincia-lapampa',1,'icon-provincia-lapampa','2016-03-05 22:14:16','2016-03-05 22:14:16'),(13,'icon-provincia-larioja',1,'icon-provincia-larioja','2016-03-05 22:14:16','2016-03-05 22:14:16'),(14,'icon-provincia-malvinas',1,'icon-provincia-malvinas','2016-03-05 22:14:16','2016-03-05 22:14:16'),(15,'icon-provincia-mendoza',1,'icon-provincia-mendoza','2016-03-05 22:14:16','2016-03-05 22:14:16'),(16,'icon-provincia-misiones',1,'icon-provincia-misiones','2016-03-05 22:14:16','2016-03-05 22:14:16'),(17,'icon-provincia-neuquen',1,'icon-provincia-neuquen','2016-03-05 22:14:16','2016-03-05 22:14:16'),(18,'icon-provincia-rionegro',1,'icon-provincia-rionegro','2016-03-05 22:14:16','2016-03-05 22:14:16'),(19,'icon-provincia-salta',1,'icon-provincia-salta','2016-03-05 22:14:16','2016-03-05 22:14:16'),(20,'icon-provincia-sanjuan',1,'icon-provincia-sanjuan','2016-03-05 22:14:16','2016-03-05 22:14:16'),(21,'icon-provincia-sanluis',1,'icon-provincia-sanluis','2016-03-05 22:14:16','2016-03-05 22:14:16'),(22,'icon-provincia-santacruz',1,'icon-provincia-santacruz','2016-03-05 22:14:16','2016-03-05 22:14:16'),(23,'icon-provincia-santafe',1,'icon-provincia-santafe','2016-03-05 22:14:16','2016-03-05 22:14:16'),(24,'icon-provincia-stgodelestero',1,'icon-provincia-stgodelestero','2016-03-05 22:14:16','2016-03-05 22:14:16'),(25,'icon-provincia-tierradelfuego',1,'icon-provincia-tierradelfuego','2016-03-05 22:14:16','2016-03-05 22:14:16'),(26,'icon-provincia-tucuman',1,'icon-provincia-tucuman','2016-03-05 22:14:16','2016-03-05 22:14:16'),(27,'icon-revista',0,'icon-revista','2016-03-05 22:14:16','2016-03-05 22:14:16'),(28,'icon-provincia-chubut',1,'icon-provincia-chubut','2016-03-05 22:14:16','2016-03-05 22:14:16'),(29,'icon-provincia-chaco',1,'icon-provincia-chaco','2016-03-05 22:14:16','2016-03-05 22:14:16'),(30,'icon-provincia-catamarca',1,'icon-provincia-catamarca','2016-03-05 22:14:16','2016-03-05 22:14:16'),(31,'icon-provincia-capital',1,'icon-provincia-capital','2016-03-05 22:14:16','2016-03-05 22:14:16'),(32,'icon-provincia-ba',1,'icon-provincia-ba','2016-03-05 22:14:16','2016-03-05 22:14:16'),(33,'icon-prototipo',0,'icon-prototipo','2016-03-05 22:14:16','2016-03-05 22:14:16'),(34,'icon-notificaciones',0,'icon-notificaciones','2016-03-05 22:14:16','2016-03-05 22:14:16'),(35,'icon-mencion',0,'icon-mencion','2016-03-05 22:14:16','2016-03-05 22:14:16'),(36,'icon-mapa',0,'icon-mapa','2016-03-05 22:14:16','2016-03-05 22:14:16'),(37,'icon-jugadores',0,'icon-jugadores','2016-03-05 22:14:16','2016-03-05 22:14:16'),(38,'icon-jugador',0,'icon-jugador','2016-03-05 22:14:16','2016-03-05 22:14:16'),(39,'icon-inicio',0,'icon-inicio','2016-03-05 22:14:16','2016-03-05 22:14:16'),(40,'icon-hashtag',0,'icon-hashtag','2016-03-05 22:14:16','2016-03-05 22:14:16'),(41,'icon-foto',0,'icon-foto','2016-03-05 22:14:16','2016-03-05 22:14:16'),(42,'icon-copa-3',0,'icon-copa-3','2016-03-05 22:14:16','2016-03-05 22:14:16'),(43,'icon-copa-2',0,'icon-copa-2','2016-03-05 22:14:16','2016-03-05 22:14:16'),(44,'icon-copa-1',0,'icon-copa-1','2016-03-05 22:14:16','2016-03-05 22:14:16'),(45,'icon-copa',0,'icon-copa','2016-03-05 22:14:16','2016-03-05 22:14:16'),(46,'icon-comentarios-o',0,'icon-comentarios-o','2016-03-05 22:14:16','2016-03-05 22:14:16');
/*!40000 ALTER TABLE `icons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `iso_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `google_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `place_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sublocality` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locality` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `administrative_area_level_2` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `administrative_area_level_1` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `formatted_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'e637fa1d79aeebe7da9b42bc74dae3407b6876de','EjZBcm1hZGEgQXJnZW50aW5hIDY4NiwgVWRhb25kbywgQnVlbm9zIEFpcmVzLCBBcmdlbnRpbmE','Armada Argentina 686','','Udaondo','Ituzaingó','Buenos Aires','AR','Armada Argentina 686, Udaondo, Buenos Aires, Argentina','','',0,'2016-03-12 22:32:44','2016-03-12 22:32:44'),(2,'e637fa1d79aeebe7da9b42bc74dae3407b6876de','EjZBcm1hZGEgQXJnZW50aW5hIDY4NiwgVWRhb25kbywgQnVlbm9zIEFpcmVzLCBBcmdlbnRpbmE','Armada Argentina 686','','Udaondo','Ituzaingó','Buenos Aires','AR','Armada Argentina 686, Udaondo, Buenos Aires, Argentina','-34.6082517','-58.6980597',0,'2016-03-13 13:15:03','2016-03-13 13:15:03'),(3,'5cab3c1e91cf3ce05c0738d50d6b6deafc58467f','ChIJMWwimy20vJUReXvgvN8n8D4','Arribeños','','Buenos Aires','','CABA','AR','Arribeños, Cdad. Autónoma de Buenos Aires, Argentina','-34.5552979','-58.4524803',0,'2016-03-14 09:10:02','2016-03-14 09:10:02');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medias`
--

DROP TABLE IF EXISTS `medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medias` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` enum('VIDEO','IMAGE','DATA') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'IMAGE',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ext` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci,
  `path` mediumtext COLLATE utf8_unicode_ci,
  `tags` mediumtext COLLATE utf8_unicode_ci,
  `bucket` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb_path` mediumtext COLLATE utf8_unicode_ci,
  `url` mediumtext COLLATE utf8_unicode_ci,
  `users_id` int(10) unsigned NOT NULL,
  `users_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cloud` tinyint(1) NOT NULL DEFAULT '0',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `competition_id` int(10) unsigned DEFAULT NULL,
  `region_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `medias_user_id_foreign` (`user_id`),
  KEY `medias_users_id_users_type_index` (`users_id`,`users_type`),
  KEY `medias_competition_id_foreign` (`competition_id`),
  KEY `medias_region_id_foreign` (`region_id`),
  CONSTRAINT `medias_competition_id_foreign` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`),
  CONSTRAINT `medias_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`),
  CONSTRAINT `medias_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medias`
--

LOCK TABLES `medias` WRITE;
/*!40000 ALTER TABLE `medias` DISABLE KEYS */;
INSERT INTO `medias` VALUES (1,2,'IMAGE','torneo_media_1.png','png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,'2016-03-12 22:31:43','2016-03-12 22:31:43'),(2,2,'IMAGE','torneo_media_2.png','png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,'2016-03-13 11:24:51','2016-03-13 11:24:51'),(3,2,'IMAGE','torneo_media_3.png','png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,'2016-03-13 11:33:42','2016-03-13 11:33:42'),(4,2,'IMAGE','goethe_media_4.jpeg','jpeg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,'2016-03-13 11:44:16','2016-03-13 11:44:16'),(5,2,'IMAGE','goethe_media_5.png','png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,'2016-03-13 11:47:53','2016-03-13 11:47:53'),(6,2,'IMAGE','goethe_media_6.png','png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,'2016-03-13 11:49:02','2016-03-13 11:49:02'),(7,2,'IMAGE','goethe_media_7.jpeg','jpeg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,'2016-03-14 09:09:14','2016-03-14 09:09:14'),(8,2,'IMAGE','goethe_media_8.jpeg','jpeg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,'2016-03-14 09:10:36','2016-03-14 09:10:36'),(9,2,'IMAGE','goethe_media_9.png','png',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'',0,0,NULL,NULL,'2016-03-14 22:04:38','2016-03-14 22:04:38');
/*!40000 ALTER TABLE `medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mentions`
--

DROP TABLE IF EXISTS `mentions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mentions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `competition_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mentions_competition_id_foreign` (`competition_id`),
  CONSTRAINT `mentions_competition_id_foreign` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mentions`
--

LOCK TABLES `mentions` WRITE;
/*!40000 ALTER TABLE `mentions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mentions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2014_10_12_200000_create_roles_table',1),('2014_10_12_300000_create_colors_table',1),('2014_10_12_300000_create_users_roles_table',1),('2014_10_12_400000_create_iconos_table',1),('2014_10_12_400000_create_locations_table',1),('2014_10_13_100000_create_regions_table',1),('2014_10_13_200000_create_competitions_table',1),('2014_10_13_300000_create_medias_table',1),('2014_10_14_400000_create_cups_table',1),('2014_10_14_500000_create_mentions_table',1),('2014_10_15_200000_create_settings_table',1),('2014_10_16_200000_create_users_competitions_table',1),('2014_10_16_300000_create_users_regions_table',1),('2014_10_16_400000_create_users_medias_table',1),('2014_10_17_100000_create_notifications_table',1),('2014_10_18_100000_create_sliders_table',1),('2015_05_15_173943_create_languages_table',2),('2015_05_18_10000_create_translate_namespaces_table',2),('2015_05_18_20000_create_translate_values_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `object_id` int(10) unsigned NOT NULL,
  `object_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_activity` tinyint(1) NOT NULL DEFAULT '0',
  `sent_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `notifications_user_id_foreign` (`user_id`),
  KEY `notifications_sender_id_foreign` (`sender_id`),
  CONSTRAINT `notifications_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  CONSTRAINT `notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `regions_code_unique` (`code`),
  UNIQUE KEY `regions_name_unique` (`name`),
  KEY `regions_parent_id_foreign` (`parent_id`),
  CONSTRAINT `regions_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `regions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
INSERT INTO `regions` VALUES (1,'ARG','Argentina','Nacional','#37ABC8','argentina',NULL,'2016-03-05 22:14:16','2016-03-05 22:14:16'),(2,'CCC','Centro Cultural de la Cooperación','Centro Cultural de la Cooperación','#EE441E','cordoba',1,'2016-03-05 22:14:16','2016-03-05 22:14:16'),(3,'IG','Instituto Goethe','Instituto Goethe','#8FC521','santa_fe',1,'2016-03-05 22:14:16','2016-03-05 22:14:16'),(4,'LUC','La Usina Cultura','La Usina Cultura','#F3558A','mendoza',1,'2016-03-05 22:14:16','2016-03-05 22:14:16'),(5,'CCM','Club Cultural Matienzo','Club Cultural Matienzo','#F3558A','chubut',1,'2016-03-05 22:14:16','2016-03-05 22:14:16');
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'edit_site','Editar Sitio','2016-03-05 22:14:16','2016-03-05 22:14:16'),(2,'crud_user','Manejo Usuarios','2016-03-05 22:14:16','2016-03-05 22:14:16'),(3,'create_region','Administrar Regiones','2016-03-05 22:14:16','2016-03-05 22:14:16'),(4,'create_competition','Crear Competiciones','2016-03-05 22:14:16','2016-03-05 22:14:16'),(5,'edit_region','Editar Region','2016-03-05 22:14:16','2016-03-05 22:14:16'),(6,'crud_region_user','Administrar Participantes','2016-03-05 22:14:16','2016-03-05 22:14:16');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8_unicode_ci,
  `media_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `settings_media_id_foreign` (`media_id`),
  CONSTRAINT `settings_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `medias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('QUOTE','EVENT','SIMPLE') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SIMPLE',
  `title` mediumtext COLLATE utf8_unicode_ci,
  `subtitle` mediumtext COLLATE utf8_unicode_ci,
  `quote_author` mediumtext COLLATE utf8_unicode_ci,
  `event_date` date DEFAULT NULL,
  `event_place` mediumtext COLLATE utf8_unicode_ci,
  `cover_photo` mediumtext COLLATE utf8_unicode_ci,
  `signup_action` tinyint(1) NOT NULL DEFAULT '0',
  `schedule_action` tinyint(1) NOT NULL DEFAULT '0',
  `about_action` tinyint(1) NOT NULL DEFAULT '0',
  `players_action` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translate_namespaces`
--

DROP TABLE IF EXISTS `translate_namespaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translate_namespaces` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('EMAIL','MOBILE','WEB','NOTIFICATION','SETTING','GLOBAL') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'GLOBAL',
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translate_namespaces`
--

LOCK TABLES `translate_namespaces` WRITE;
/*!40000 ALTER TABLE `translate_namespaces` DISABLE KEYS */;
/*!40000 ALTER TABLE `translate_namespaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translate_values`
--

DROP TABLE IF EXISTS `translate_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translate_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(10) unsigned NOT NULL,
  `namespace_id` int(10) unsigned NOT NULL,
  `text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `translate_values_language_id_foreign` (`language_id`),
  KEY `translate_values_namespace_id_foreign` (`namespace_id`),
  CONSTRAINT `translate_values_namespace_id_foreign` FOREIGN KEY (`namespace_id`) REFERENCES `translate_namespaces` (`id`),
  CONSTRAINT `translate_values_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translate_values`
--

LOCK TABLES `translate_values` WRITE;
/*!40000 ALTER TABLE `translate_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `translate_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `coperable_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_photo` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  `activation_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `participant` tinyint(1) NOT NULL DEFAULT '0',
  `place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about` mediumtext COLLATE utf8_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `about_en` mediumtext COLLATE utf8_unicode_ci,
  `about_de` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Leo','','',NULL,'aito0077@gmail.com','$2y$10$zi5AUO3ZNLgncig3hwr0CeOJa3IHRspyE1.tY6/WGYx7DLHFNgNSC',NULL,NULL,NULL,NULL,NULL,'','20546340a89b2e415a28cd493867191e',NULL,NULL,0,0,NULL,NULL,'2016-03-05 22:14:16','2016-03-12 23:08:24',NULL,NULL),(2,'usuario1','','',NULL,'usuario1@test.com','$2y$10$.Edxq8HwvFxy4yZbcJAvluI9Von8p23N3gUvMcC89jw2nHTvWGkjO',NULL,NULL,NULL,NULL,NULL,'','9e20b0137fc53c408258703c6db61c7b',NULL,NULL,0,0,NULL,NULL,'2016-03-05 22:14:16','2016-03-05 22:14:46',NULL,NULL),(4,'martin-melconian','Martin','Melconian',NULL,'melco@nian.com','$2y$10$5qaRZQea5fSWaY6I246JtuHUQLUi3Ocfd/IP2LJuupX2AypDbNwua',NULL,'fbmelco','g+cemelco','twmelco','insmeclo','goethe_media_6.png','goethe_media_6.png',NULL,NULL,0,1,'USA','Vamos a privatizar el país','2016-03-13 11:36:02','2016-03-13 11:51:28',NULL,NULL),(5,'martin-redrado','Martin','Redrado',NULL,'marrint@le.co','$2y$10$cMoHGiC037cMXWSmwC1/IOUwHIJESTv5LSzdFyJNVkzfNHwporRSq',NULL,'eweew.e','2www.wwewew','wewew','ewew','goethe_media_8.jpeg','goethe_media_8.jpeg',NULL,NULL,0,1,'BCRA','Luciana Zalazar','2016-03-14 09:10:53','2016-04-16 09:04:26','Bcarre re','deutscggg'),(6,'ll-leo','LL','LEO',NULL,'ll-leo@test.com','$2y$10$I6ppSBnXauTzr3kni1RzW.YjqWEvNcvnhiafYxZ06NhFatAAwObk2',NULL,NULL,NULL,NULL,NULL,'goethe_media_9.png','goethe_media_9.png',NULL,NULL,0,1,'le','le','2016-03-14 22:05:39','2016-03-14 22:05:39',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_competitions`
--

DROP TABLE IF EXISTS `users_competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_competitions` (
  `user_id` int(10) unsigned NOT NULL,
  `competition_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `media_id` int(10) unsigned DEFAULT NULL,
  `mention_id` int(10) unsigned DEFAULT NULL,
  `cups_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`,`competition_id`),
  KEY `users_competitions_competition_id_foreign` (`competition_id`),
  KEY `users_competitions_media_id_foreign` (`media_id`),
  KEY `users_competitions_mention_id_foreign` (`mention_id`),
  KEY `users_competitions_cups_id_foreign` (`cups_id`),
  CONSTRAINT `users_competitions_competition_id_foreign` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`),
  CONSTRAINT `users_competitions_cups_id_foreign` FOREIGN KEY (`cups_id`) REFERENCES `cups` (`id`),
  CONSTRAINT `users_competitions_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `medias` (`id`),
  CONSTRAINT `users_competitions_mention_id_foreign` FOREIGN KEY (`mention_id`) REFERENCES `mentions` (`id`),
  CONSTRAINT `users_competitions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_competitions`
--

LOCK TABLES `users_competitions` WRITE;
/*!40000 ALTER TABLE `users_competitions` DISABLE KEYS */;
INSERT INTO `users_competitions` VALUES (4,1,NULL,NULL,NULL,NULL,'2016-03-14 09:10:11','2016-03-14 09:10:11'),(5,1,NULL,NULL,NULL,NULL,'2016-03-14 09:37:20','2016-03-14 09:37:20');
/*!40000 ALTER TABLE `users_competitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_medias`
--

DROP TABLE IF EXISTS `users_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_medias` (
  `user_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`,`media_id`),
  KEY `users_medias_media_id_foreign` (`media_id`),
  CONSTRAINT `users_medias_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `medias` (`id`),
  CONSTRAINT `users_medias_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_medias`
--

LOCK TABLES `users_medias` WRITE;
/*!40000 ALTER TABLE `users_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_regions`
--

DROP TABLE IF EXISTS `users_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_regions` (
  `user_id` int(10) unsigned NOT NULL,
  `region_id` int(10) unsigned NOT NULL,
  `admin` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`,`region_id`),
  KEY `users_regions_region_id_foreign` (`region_id`),
  CONSTRAINT `users_regions_region_id_foreign` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`),
  CONSTRAINT `users_regions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_regions`
--

LOCK TABLES `users_regions` WRITE;
/*!40000 ALTER TABLE `users_regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `users_roles_role_id_foreign` (`role_id`),
  CONSTRAINT `users_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `users_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1,'2016-03-05 22:14:16','2016-03-05 22:14:16'),(1,2,'2016-03-05 22:14:16','2016-03-05 22:14:16'),(2,2,'2016-03-05 22:14:16','2016-03-05 22:14:16'),(2,3,'2016-03-05 22:14:16','2016-03-05 22:14:16');
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-16 12:10:06
