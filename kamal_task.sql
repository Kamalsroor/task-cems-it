-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: kamal_task
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

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
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_08_08_100000_create_telescope_entries_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2019_12_14_000001_create_personal_access_tokens_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries`
--

DROP TABLE IF EXISTS `telescope_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries` (
  `sequence` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_family_hash_index` (`family_hash`),
  KEY `telescope_entries_created_at_index` (`created_at`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries`
--

LOCK TABLES `telescope_entries` WRITE;
/*!40000 ALTER TABLE `telescope_entries` DISABLE KEYS */;
INSERT INTO `telescope_entries` VALUES (1,'997ac90d-8cc3-40b3-ae59-238fbf6f4f32','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from information_schema.tables where table_schema = \'kamal_task\' and table_name = \'migrations\' and table_type = \'BASE TABLE\'\",\"time\":\"17.14\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"ad7d07e5104cadcc6e9623dfc5fefdd8\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:41'),(2,'997ac90d-b20f-4c7d-bbd9-e0da47c6440c','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `migrations` (`id` int unsigned not null auto_increment primary key, `migration` varchar(255) not null, `batch` int not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"39.99\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"246242198a8fbc1beb167611385ac644\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:41'),(3,'997ac90d-de26-4669-af91-8c96e3d6801c','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from information_schema.tables where table_schema = \'kamal_task\' and table_name = \'migrations\' and table_type = \'BASE TABLE\'\",\"time\":\"11.23\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"ad7d07e5104cadcc6e9623dfc5fefdd8\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:41'),(4,'997ac90d-ea43-4519-8abd-9506b2634d26','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"15.39\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:41'),(5,'997ac90d-ed30-4b0b-ac7a-0be5894d2f24','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"1.18\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:41'),(6,'997ac90d-f045-4bf5-822a-c07da0c5495d','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`batch`) as aggregate from `migrations`\",\"time\":\"1.30\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"06e60d7b3d1a0c2de504de4e6f27735e\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:41'),(7,'997ac90e-007f-4b8a-aef2-e813c099b47c','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `users` (`id` bigint unsigned not null auto_increment primary key, `name` varchar(255) not null, `email` varchar(255) not null, `mobile_verified_at` timestamp null, `password` varchar(255) not null, `remember_token` varchar(100) null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"31.42\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\database\\\\migrations\\\\2014_10_12_000000_create_users_table.php\",\"line\":16,\"hash\":\"47c20151560e04dbf058d1eaaf31fc80\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:41'),(8,'997ac90e-0e2d-47e5-be8c-b0804e57c18f','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `users` add unique `users_email_unique`(`email`)\",\"time\":\"33.79\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\database\\\\migrations\\\\2014_10_12_000000_create_users_table.php\",\"line\":16,\"hash\":\"0648806a3d18c0f5b81e2257de64675e\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(9,'997ac90e-3143-4f82-93ed-9a650175ceae','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2014_10_12_000000_create_users_table\', 1)\",\"time\":\"10.69\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(10,'997ac90e-3d8e-4cf1-a615-72c64ed928d8','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `password_resets` (`email` varchar(255) not null, `token` varchar(255) not null, `created_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"27.47\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\database\\\\migrations\\\\2014_10_12_100000_create_password_resets_table.php\",\"line\":16,\"hash\":\"6a64d07661eabf9849c9a4281ec344ad\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(11,'997ac90e-4f7a-465d-98c5-835f1a7658c7','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `password_resets` add index `password_resets_email_index`(`email`)\",\"time\":\"45.00\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\database\\\\migrations\\\\2014_10_12_100000_create_password_resets_table.php\",\"line\":16,\"hash\":\"e47bfd004ad9142afc1b2460960fbe08\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(12,'997ac90e-69fe-47bc-99f0-a4ef970c17a5','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2014_10_12_100000_create_password_resets_table\', 1)\",\"time\":\"6.83\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(13,'997ac90e-76ce-4cb6-82b4-a119928c6ce5','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries` (`sequence` bigint unsigned not null auto_increment primary key, `uuid` char(36) not null, `batch_id` char(36) not null, `family_hash` varchar(255) null, `should_display_on_index` tinyint(1) not null default \'1\', `type` varchar(20) not null, `content` longtext not null, `created_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"28.91\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"d9429550f8856c1af1c89f24a6440cb5\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(14,'997ac90e-8801-44a9-963e-e24822a4a65d','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add unique `telescope_entries_uuid_unique`(`uuid`)\",\"time\":\"42.48\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"9fb859ae1faff74c6b9e0b70dfd8eea9\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(15,'997ac90e-9098-4e25-af84-16accbc21966','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_batch_id_index`(`batch_id`)\",\"time\":\"20.98\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"2b075509a9242d6e3f622536c5ccca07\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(16,'997ac90e-9972-4b67-8bc0-7b9b4a0fd73b','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_family_hash_index`(`family_hash`)\",\"time\":\"21.61\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"3d25a2a244bd2028dfa0326d3dbf7f4c\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(17,'997ac90e-a6bf-4650-b6b7-4833c9d3f789','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_created_at_index`(`created_at`)\",\"time\":\"33.13\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"7352e7f84460fb7ffc450e7ea4de9dc7\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(18,'997ac90e-b414-42b7-ab5b-57288b7395a5','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`)\",\"time\":\"32.90\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"7317a4cad2dfa1a5167548a6acd0b6a5\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(19,'997ac90e-c03d-460f-bdce-af0cfd5a678b','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries_tags` (`entry_uuid` char(36) not null, `tag` varchar(255) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"28.53\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"5ed47d3cfcd3051674e3cb7b613f0fba\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(20,'997ac90e-d16c-40dc-a45a-8212fc496938','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`)\",\"time\":\"43.04\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"d77cdf5585b51f60954d40e76786e20f\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(21,'997ac90e-d972-44b7-b02b-4f7d88e241b2','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_tag_index`(`tag`)\",\"time\":\"19.60\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"0bdb35d17e876d6225a7774a2c17647d\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(22,'997ac90e-fe1d-4115-bdb4-98bea89b43d6','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add constraint `telescope_entries_tags_entry_uuid_foreign` foreign key (`entry_uuid`) references `telescope_entries` (`uuid`) on delete cascade\",\"time\":\"92.71\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"662a818f80a3a9ba2570081fd7a6af2f\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(23,'997ac90f-0751-4014-9c04-df2b14263036','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_monitoring` (`tag` varchar(255) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"22.00\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"8cddf327ba1b3bd52637b409200a4c1f\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(24,'997ac90f-2320-4b79-b9b3-999981f69dba','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_08_08_100000_create_telescope_entries_table\', 1)\",\"time\":\"4.96\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(25,'997ac90f-2dd2-4a93-a04d-aeaa4c473f81','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `failed_jobs` (`id` bigint unsigned not null auto_increment primary key, `uuid` varchar(255) not null, `connection` text not null, `queue` text not null, `payload` longtext not null, `exception` longtext not null, `failed_at` timestamp default CURRENT_TIMESTAMP not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"23.61\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\database\\\\migrations\\\\2019_08_19_000000_create_failed_jobs_table.php\",\"line\":16,\"hash\":\"b4213f3d9cf0b0646ce18d265d239ccd\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(26,'997ac90f-38ac-4157-bed9-a66709517301','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `failed_jobs` add unique `failed_jobs_uuid_unique`(`uuid`)\",\"time\":\"26.81\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\database\\\\migrations\\\\2019_08_19_000000_create_failed_jobs_table.php\",\"line\":16,\"hash\":\"f851653a45d1f2394473d70db5636fd3\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(27,'997ac90f-56ab-4513-b024-3abcb1eb30e8','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2019_08_19_000000_create_failed_jobs_table\', 1)\",\"time\":\"8.17\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(28,'997ac90f-6286-4e8a-8dfc-3fc1038835c7','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `personal_access_tokens` (`id` bigint unsigned not null auto_increment primary key, `tokenable_type` varchar(255) not null, `tokenable_id` bigint unsigned not null, `name` varchar(255) not null, `token` varchar(64) not null, `abilities` text null, `last_used_at` timestamp null, `created_at` timestamp null, `updated_at` timestamp null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"27.31\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\database\\\\migrations\\\\2019_12_14_000001_create_personal_access_tokens_table.php\",\"line\":16,\"hash\":\"b19e5f841ad4fcd02c415deb62fcdce3\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(29,'997ac90f-743e-466e-b8d5-5fe744ad29b3','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `personal_access_tokens` add index `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`)\",\"time\":\"44.23\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\database\\\\migrations\\\\2019_12_14_000001_create_personal_access_tokens_table.php\",\"line\":16,\"hash\":\"23e16d13faedc7fd756b258a984d3cad\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(30,'997ac90f-7fd5-46c0-959e-be49b5018d39','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `personal_access_tokens` add unique `personal_access_tokens_token_unique`(`token`)\",\"time\":\"28.68\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\database\\\\migrations\\\\2019_12_14_000001_create_personal_access_tokens_table.php\",\"line\":16,\"hash\":\"6d0025967d6eebfcb6fddf6dcb6ed14c\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:42'),(31,'997ac90f-9b24-4b87-bc5b-101706b6608f','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'query','{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2019_12_14_000001_create_personal_access_tokens_table\', 1)\",\"time\":\"7.42\",\"slow\":false,\"file\":\"C:\\\\laragon\\\\www\\\\kamal_task\\\\artisan\",\"line\":35,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"ASMH\"}','2023-06-23 13:19:43'),(32,'997ac90f-9c3e-442e-bf29-95eb83ef6a86','997ac90f-9f70-4ae3-8797-a994428ed9ec',NULL,1,'command','{\"command\":\"migrate\",\"exit_code\":0,\"arguments\":{\"command\":\"migrate\"},\"options\":{\"database\":null,\"force\":false,\"path\":[],\"realpath\":false,\"schema-path\":null,\"pretend\":false,\"seed\":false,\"seeder\":null,\"step\":false,\"isolated\":false,\"help\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":null,\"no-interaction\":false,\"env\":null},\"hostname\":\"ASMH\"}','2023-06-23 13:19:43');
/*!40000 ALTER TABLE `telescope_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_entries_tags`
--

DROP TABLE IF EXISTS `telescope_entries_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_entries_tags`
--

LOCK TABLES `telescope_entries_tags` WRITE;
/*!40000 ALTER TABLE `telescope_entries_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_entries_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telescope_monitoring`
--

DROP TABLE IF EXISTS `telescope_monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telescope_monitoring`
--

LOCK TABLES `telescope_monitoring` WRITE;
/*!40000 ALTER TABLE `telescope_monitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `telescope_monitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2023-06-23 16:20:58
