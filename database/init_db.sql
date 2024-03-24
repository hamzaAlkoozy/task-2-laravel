-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: task_2_laravel
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `migrations`
--
DROP DATABASE IF EXISTS task_2_laravel;
CREATE DATABASE task_2_laravel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

USE task_2_laravel;

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2019_12_14_000001_create_personal_access_tokens_table',1),(3,'2024_03_24_064158_create_projects_table',1),(4,'2024_03_24_064630_create_user_project_table',1),(5,'2024_03_24_064635_create_timesheets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'authToken','d5974c696159a4cac2a1acdd2296f4b7f3f8eb5f23d8e0b92c95ad9eb1b8f6bd','[\"*\"]','2024-03-24 05:08:25',NULL,'2024-03-24 05:08:13','2024-03-24 05:08:25');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_user`
--

DROP TABLE IF EXISTS `project_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_user_user_id_foreign` (`user_id`),
  KEY `project_user_project_id_foreign` (`project_id`),
  CONSTRAINT `project_user_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `project_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_user`
--

LOCK TABLES `project_user` WRITE;
/*!40000 ALTER TABLE `project_user` DISABLE KEYS */;
INSERT INTO `project_user` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,2,4,NULL,NULL),(5,2,5,NULL,NULL),(6,2,6,NULL,NULL),(7,2,7,NULL,NULL),(8,2,8,NULL,NULL),(9,2,9,NULL,NULL);
/*!40000 ALTER TABLE `project_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Laboriosam velit quo accusantium necessitatibus.','a','1972-12-07','2022-10-09','completed','2024-03-24 05:07:57','2024-03-24 05:07:57'),(2,'Reiciendis occaecati vel distinctio.','sed','1979-09-15','1970-10-29','active','2024-03-24 05:07:57','2024-03-24 05:07:57'),(3,'Animi perferendis sit asperiores error reiciendis id ipsam reiciendis.','voluptatibus','1980-01-03','2015-11-18','inactive','2024-03-24 05:07:57','2024-03-24 05:07:57'),(4,'Ea minus quis et molestiae et natus.','dolorum','1998-05-18','2006-03-18','inactive','2024-03-24 05:07:57','2024-03-24 05:07:57'),(5,'Adipisci provident perferendis illo cumque rerum et illo.','voluptate','2017-12-03','1992-10-17','active','2024-03-24 05:07:57','2024-03-24 05:07:57'),(6,'Quia et qui enim sit aut esse.','sunt','1983-12-18','1975-09-14','inactive','2024-03-24 05:07:57','2024-03-24 05:07:57'),(7,'Harum aut qui sequi vel.','vitae','1978-10-18','2010-03-18','active','2024-03-24 05:07:57','2024-03-24 05:07:57'),(8,'Nostrum qui qui cumque dolores.','fugit','1994-10-25','1990-02-03','completed','2024-03-24 05:07:57','2024-03-24 05:07:57'),(9,'Tempore incidunt consequatur nesciunt ducimus inventore quo.','omnis','2019-04-20','2008-06-11','inactive','2024-03-24 05:07:57','2024-03-24 05:07:57');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timesheets`
--

DROP TABLE IF EXISTS `timesheets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timesheets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `hours` int NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timesheets_user_id_foreign` (`user_id`),
  KEY `timesheets_project_id_foreign` (`project_id`),
  CONSTRAINT `timesheets_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`),
  CONSTRAINT `timesheets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timesheets`
--

LOCK TABLES `timesheets` WRITE;
/*!40000 ALTER TABLE `timesheets` DISABLE KEYS */;
INSERT INTO `timesheets` VALUES (1,'Cupiditate ad dolore ducimus quibusdam.','1973-01-14',6,1,1,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(2,'Ut sit aut perspiciatis voluptates vel reiciendis.','2007-09-24',7,1,1,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(3,'Sit asperiores voluptatem qui aut.','1976-05-15',4,1,1,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(4,'Vel iure esse quis at similique qui.','2018-08-30',2,1,1,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(5,'Repellendus occaecati rem vel omnis dolores eum ipsa.','1998-03-27',2,1,1,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(6,'Consequatur iure recusandae quis nihil.','2001-09-01',2,1,1,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(7,'Ut expedita esse quasi id.','2019-10-16',1,1,1,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(8,'Non est officiis aliquid commodi.','2012-07-26',5,1,1,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(9,'Aut dolores et dolore suscipit.','2018-12-11',2,1,1,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(10,'Voluptatem dolorem dolore aspernatur similique cupiditate rerum.','2004-12-19',2,1,1,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(11,'Natus est qui et.','1987-12-30',4,1,2,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(12,'Architecto optio fugit itaque velit.','1972-06-06',5,1,2,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(13,'Commodi possimus cum porro repellat sit provident a.','1973-04-24',3,1,2,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(14,'Mollitia omnis excepturi minima numquam.','1974-07-31',7,1,2,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(15,'Voluptas minus ipsum eligendi rerum nihil tempore.','2002-08-08',3,1,2,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(16,'Ut modi esse qui dolore voluptatem et.','1987-05-17',3,1,2,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(17,'Sunt sit repellendus qui quasi voluptas nihil enim.','1974-09-10',4,1,2,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(18,'Dicta repudiandae voluptatem dignissimos repudiandae quasi.','1982-01-31',6,1,2,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(19,'Veniam laborum officiis asperiores est.','1982-08-17',2,1,2,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(20,'Exercitationem est et aliquid qui.','1970-03-05',3,1,2,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(21,'Qui ut voluptatibus et sed sint id ut.','2002-03-30',5,1,3,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(22,'Voluptatibus odio excepturi numquam in et ut.','2011-02-15',2,1,3,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(23,'Ab et perspiciatis excepturi qui et.','2018-12-22',7,1,3,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(24,'Aspernatur enim consequuntur repudiandae voluptate quos voluptatem.','1986-02-01',8,1,3,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(25,'Totam cumque iure voluptas est porro labore et.','2013-12-14',7,1,3,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(26,'Ut voluptatum aliquid itaque aut ducimus.','1981-06-27',8,1,3,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(27,'Sit ut quod et architecto aut.','1979-02-22',1,1,3,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(28,'Et odit ut vel molestiae repellat.','1984-05-26',3,1,3,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(29,'Reiciendis nihil aut soluta sed sint et.','1986-08-16',5,1,3,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(30,'Aut veritatis commodi assumenda debitis ut voluptates fugiat.','1999-11-10',5,1,3,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(31,'Voluptates nihil ea consequatur laudantium assumenda aperiam corporis.','1983-02-18',7,2,4,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(32,'Porro mollitia est iusto blanditiis hic illum fugiat.','1992-05-18',6,2,4,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(33,'Animi praesentium cupiditate id eum aut quia quo expedita.','1988-02-03',4,2,4,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(34,'Voluptate modi non recusandae nam sed.','1992-01-13',1,2,4,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(35,'Quia recusandae et vel ut.','2014-05-20',4,2,4,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(36,'Odio laboriosam esse sit beatae id aliquam illo.','1971-06-30',8,2,4,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(37,'Atque culpa odio est et aliquam laboriosam rem.','1985-07-04',6,2,4,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(38,'Aut nobis et consequuntur omnis.','2000-08-21',4,2,4,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(39,'Libero aut qui sit explicabo necessitatibus repellat quia aut.','2020-07-23',2,2,4,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(40,'Exercitationem consequatur architecto magnam molestiae laudantium hic.','2013-04-30',2,2,4,'2024-03-24 05:07:57','2024-03-24 05:07:57'),(41,'Quam ducimus officia mollitia soluta iste ratione.','1972-09-19',8,2,5,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(42,'Culpa autem est veritatis vel exercitationem.','2018-04-20',2,2,5,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(43,'Qui voluptates tempora temporibus eius.','1993-11-07',5,2,5,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(44,'Earum cumque vel autem quasi.','2008-09-16',4,2,5,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(45,'Incidunt suscipit voluptates dignissimos eius similique voluptas.','2016-12-01',8,2,5,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(46,'Beatae sit omnis est.','2014-03-27',6,2,5,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(47,'Voluptas iure beatae voluptate temporibus id rerum.','2018-06-09',8,2,5,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(48,'Ducimus id non at blanditiis qui omnis.','2019-11-18',8,2,5,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(49,'Est repudiandae tempore consequatur.','2003-12-16',2,2,5,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(50,'Consequatur officiis quis atque repellat.','1985-09-26',4,2,5,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(51,'Corporis repellat incidunt tenetur sunt.','1970-07-04',5,2,6,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(52,'Qui nisi doloribus deleniti.','1987-06-28',5,2,6,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(53,'At dolorem tempora vero et sint quaerat.','2004-08-08',3,2,6,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(54,'Et ut sint quam corporis eum debitis ea pariatur.','2004-12-20',5,2,6,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(55,'Molestias iste harum voluptate neque.','1985-12-27',5,2,6,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(56,'Fugiat temporibus voluptas consectetur qui aspernatur labore.','1976-05-11',2,2,6,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(57,'Odit consectetur molestiae aperiam.','1980-03-29',1,2,6,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(58,'Quia est qui quam possimus ullam nemo rerum.','1975-04-24',6,2,6,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(59,'Blanditiis cum aperiam qui quae porro nihil velit.','1994-12-27',4,2,6,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(60,'Omnis quidem laboriosam ullam nihil dicta.','2008-01-10',1,2,6,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(61,'Voluptas ea harum eius accusamus dolorum porro.','2005-01-24',5,2,7,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(62,'Veritatis ea unde quia nam deserunt nulla beatae.','2018-09-22',1,2,7,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(63,'Velit est corrupti omnis.','1995-03-23',5,2,7,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(64,'Natus ratione fuga deserunt incidunt labore maxime accusantium.','2002-07-16',1,2,7,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(65,'Atque laudantium inventore a quaerat architecto aut.','2015-12-05',8,2,7,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(66,'Autem at eos quis dolorem enim similique quis.','1983-01-31',4,2,7,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(67,'Doloremque rerum saepe quod minus deleniti.','2000-02-04',7,2,7,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(68,'Provident quod et et voluptas fuga est ab.','2023-12-07',1,2,7,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(69,'Quasi aliquid sit excepturi doloribus labore et fuga.','2013-09-25',4,2,7,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(70,'Optio velit omnis quis hic dignissimos tempora est.','1997-02-19',7,2,7,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(71,'Nostrum ex impedit aliquid culpa cum fugiat.','1990-08-20',6,2,8,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(72,'Excepturi deserunt laboriosam nesciunt vel et ad voluptate ea.','2001-10-14',7,2,8,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(73,'Ipsam qui aliquam consequatur rerum.','2010-12-29',2,2,8,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(74,'Blanditiis ut esse dolore dolorem.','1998-03-19',6,2,8,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(75,'Atque et molestiae odit repellendus nihil molestias velit.','2004-01-24',8,2,8,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(76,'Expedita architecto labore autem quisquam.','2012-02-19',5,2,8,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(77,'Voluptatem expedita eaque et magni mollitia dolores iure.','1990-08-16',1,2,8,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(78,'Repellat assumenda et doloribus qui in unde.','2002-11-29',8,2,8,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(79,'Eum quam qui mollitia rerum earum.','1984-06-20',1,2,8,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(80,'Consequatur neque atque odit.','2008-08-15',3,2,8,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(81,'Asperiores ducimus id distinctio ipsam eum cum porro.','2018-01-09',3,2,9,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(82,'Qui corrupti sunt est fugit ex.','1978-05-11',6,2,9,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(83,'Quia quidem id cupiditate sed eum et.','2009-03-03',1,2,9,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(84,'Consequuntur voluptas ut doloremque repellat.','2003-01-18',7,2,9,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(85,'In placeat odio et similique.','1981-10-09',8,2,9,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(86,'Et culpa facere laborum odio.','1983-07-25',5,2,9,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(87,'Sint commodi nihil et sed quam accusamus.','1999-09-06',7,2,9,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(88,'Consequatur vero est suscipit quaerat.','2007-12-11',7,2,9,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(89,'Et officiis sit iusto ducimus omnis saepe.','2010-08-05',4,2,9,'2024-03-24 05:07:58','2024-03-24 05:07:58'),(90,'Possimus eius consequuntur et sed architecto.','1993-04-18',1,2,9,'2024-03-24 05:07:58','2024-03-24 05:07:58');
/*!40000 ALTER TABLE `timesheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jeremie','Sauer','2006-02-02','male','hamza@gmail.com','$2y$12$WRoUnK.faABk8V1TeC3vgOBDnSCUIkqudOYQjcbC3UWJOARWZyFgm','2024-03-24 05:07:56','2024-03-24 05:07:56'),(2,'Keshawn','Robel','2002-03-21','male','john@gmail.com','$2y$12$CmDR2A4UKqFSWtfsmEOr9.JN13nQWhGplAMe0zG.sljCrPqS0p4zG','2024-03-24 05:07:57','2024-03-24 05:07:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-24 13:08:49
