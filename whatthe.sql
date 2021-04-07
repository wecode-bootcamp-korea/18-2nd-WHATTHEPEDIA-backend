-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: whatthe
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `account_types`
--

DROP TABLE IF EXISTS `account_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_type` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_types`
--

LOCK TABLES `account_types` WRITE;
/*!40000 ALTER TABLE `account_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `image_url` varchar(3000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
INSERT INTO `actors` VALUES (1,'홍래영','https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(2,'최인아','https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(3,'예병수','https://images.unsplash.com/photo-1604426633861-11b2faead63c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(4,'강준우','https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NXx8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(5,'남궁선아','https://images.unsplash.com/photo-1592124549776-a7f0cc973b24?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nnx8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(6,'김우영','https://images.unsplash.com/photo-1557296387-5358ad7997bb?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(7,'김세형','https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OXx8ZmFjZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(8,'배담호','https://images.unsplash.com/photo-1509967419530-da38b4704bc6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTJ8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(9,'허정원','https://images.unsplash.com/photo-1545996124-0501ebae84d0?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTR8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(10,'윤찬호','https://images.unsplash.com/photo-1509460913899-515f1df34fea?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTl8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(11,'이수진','https://images.unsplash.com/photo-1544348817-5f2cf14b88c8?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjB8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(12,'정수빈','https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(13,'박경현','https://images.unsplash.com/photo-1550639524-a6f58345a2ca?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjZ8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(14,'김현중','https://images.unsplash.com/photo-1441786485319-5e0f0c092803?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mjh8fGZhY2V8ZW58MHx8MHw%3D&auto=format&fit=crop&w=500&q=60'),(15,'김규동','https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzJ8fGZhY2V8ZW58MHx8MHw%3D&auto=format&fit=crop&w=500&q=60'),(16,'권유진','https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzV8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(17,'김미현','https://images.unsplash.com/photo-1559750965-99605627de70?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mzl8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(18,'이왕록','https://images.unsplash.com/photo-1493106819501-66d381c466f1?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDN8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(19,'최송희','https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NDl8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(20,'정승옥','https://images.unsplash.com/photo-1585675100414-add2e465a136?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NTJ8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(21,'김택향','https://images.unsplash.com/photo-1563310035-a7ade6111c6c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NTZ8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(22,'박국현','https://images.unsplash.com/photo-1548946526-f69e2424cf45?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NjB8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(23,'김상연','https://images.unsplash.com/photo-1546456073-ea246a7bd25f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NjR8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(24,'양지은','https://images.unsplash.com/photo-1596243651159-908a16206cab?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Njd8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(25,'정재욱','https://images.unsplash.com/photo-1571816119553-df62a2eedf56?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Njl8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(26,'송다혜','https://images.unsplash.com/photo-1542131597-a4390333d136?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NzJ8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(27,'이대희','https://images.unsplash.com/photo-1594540637720-9b14714212f4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8Nzh8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(28,'안다민','https://images.unsplash.com/photo-1548543604-a87c9909abec?ixid=MXwxMjA3fDB8MHxzZWFyY2h8ODN8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(29,'배성훈','https://images.unsplash.com/photo-1562087926-662f8573327b?ixid=MXwxMjA3fDB8MHxzZWFyY2h8ODl8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(30,'송나은','https://images.unsplash.com/photo-1578069187179-16318dcdd0ed?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OTV8fGZhY2V8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(31,'이호열','https://images.unsplash.com/photo-1577202214328-c04b77cefb5d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTE1fHxmYWNlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(32,'한지영','https://images.unsplash.com/photo-1587085580271-cf1389892268?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTU0fHxmYWNlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(33,'이근화','https://images.unsplash.com/photo-1612041720569-7e67f4061729?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTU1fHxmYWNlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'),(34,'권영균','https://images.unsplash.com/photo-1604634395907-7c7ccefdeae4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTAzfHxmYWNlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'영화'),(2,'TV 프로그램'),(3,'책');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collections`
--

DROP TABLE IF EXISTS `collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `movie_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `collections_movie_id_22944b4e_fk_movies_id` (`movie_id`),
  KEY `collections_user_id_155c6d5e_fk_users_id` (`user_id`),
  CONSTRAINT `collections_movie_id_22944b4e_fk_movies_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `collections_user_id_155c6d5e_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collections`
--

LOCK TABLES `collections` WRITE;
/*!40000 ALTER TABLE `collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_likes`
--

DROP TABLE IF EXISTS `comment_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_likes_comment_id_46bef86d_fk_comments_id` (`comment_id`),
  KEY `comment_likes_user_id_c5a9587c_fk_users_id` (`user_id`),
  CONSTRAINT `comment_likes_comment_id_46bef86d_fk_comments_id` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`id`),
  CONSTRAINT `comment_likes_user_id_c5a9587c_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_likes`
--

LOCK TABLES `comment_likes` WRITE;
/*!40000 ALTER TABLE `comment_likes` DISABLE KEYS */;
INSERT INTO `comment_likes` VALUES (1,3,1),(2,4,1),(3,1,2),(4,2,2);
/*!40000 ALTER TABLE `comment_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_movie_id_e3755094_fk_movies_id` (`movie_id`),
  KEY `comments_user_id_b8fd0b64_fk_users_id` (`user_id`),
  CONSTRAINT `comments_movie_id_e3755094_fk_movies_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `comments_user_id_b8fd0b64_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'재밌어요',1,1),(2,'좋았어요',2,1),(3,'신났어요',3,2),(4,'그냥 그랬어요',4,2);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'contenttypes','contenttype'),(5,'movie','actor'),(6,'movie','category'),(7,'movie','collection'),(8,'movie','comment'),(18,'movie','commentlike'),(17,'movie','gallery'),(9,'movie','genre'),(10,'movie','mainsort'),(11,'movie','movie'),(16,'movie','moviegenre'),(15,'movie','movieimage'),(14,'movie','movielike'),(13,'movie','panel'),(12,'movie','userstar'),(2,'sessions','session'),(3,'user','accounttype'),(4,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-03-31 22:21:18.712413'),(2,'contenttypes','0002_remove_content_type_name','2021-03-31 22:21:19.836874'),(3,'user','0001_initial','2021-03-31 22:21:20.201436'),(4,'movie','0001_initial','2021-03-31 22:21:25.405152'),(5,'sessions','0001_initial','2021-03-31 22:21:31.113052'),(6,'user','0002_auto_20210401_1610','2021-04-01 07:10:32.811424'),(7,'movie','0002_auto_20210331_1945','2021-04-03 03:48:43.389226'),(8,'movie','0003_auto_20210403_1248','2021-04-03 03:48:44.066701');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(3000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `video_url` varchar(3000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `movie_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_movie_id_c8ef885f_fk_movies_id` (`movie_id`),
  CONSTRAINT `galleries_movie_id_c8ef885f_fk_movies_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` VALUES (1,'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true','https://youtu.be/doAzL3mY9zo',1),(2,'https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true','https://youtu.be/doAzL3mY9zo',1),(3,'https://github.com/InahChoi/project_whatthe/blob/main/banner3.jpg?raw=true','https://youtu.be/doAzL3mY9zo',2),(4,'https://github.com/InahChoi/project_whatthe/blob/main/banner4.jpg?raw=true','https://youtu.be/doAzL3mY9zo',2),(5,'https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true','https://youtu.be/doAzL3mY9zo',3),(6,'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true','https://youtu.be/doAzL3mY9zo',3),(7,'https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true','https://youtu.be/doAzL3mY9zo',4),(8,'https://github.com/InahChoi/project_whatthe/blob/main/banner3.jpg?raw=true','https://youtu.be/doAzL3mY9zo',4),(9,'https://github.com/InahChoi/project_whatthe/blob/main/banner4.jpg?raw=true','https://youtu.be/doAzL3mY9zo',5),(10,'https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true','https://youtu.be/doAzL3mY9zo',5),(11,'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true','https://youtu.be/doAzL3mY9zo',6),(12,'https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true','https://youtu.be/doAzL3mY9zo',6),(13,'https://github.com/InahChoi/project_whatthe/blob/main/banner3.jpg?raw=true','https://youtu.be/doAzL3mY9zo',7),(14,'https://github.com/InahChoi/project_whatthe/blob/main/banner4.jpg?raw=true','https://youtu.be/doAzL3mY9zo',7),(15,'https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true','https://youtu.be/doAzL3mY9zo',8),(16,'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true','https://youtu.be/doAzL3mY9zo',8),(17,'https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true','https://youtu.be/doAzL3mY9zo',9),(18,'https://github.com/InahChoi/project_whatthe/blob/main/banner3.jpg?raw=true','https://youtu.be/doAzL3mY9zo',9),(19,'https://github.com/InahChoi/project_whatthe/blob/main/banner4.jpg?raw=true','https://youtu.be/doAzL3mY9zo',10),(20,'https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true','https://youtu.be/doAzL3mY9zo',10),(21,'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true','https://youtu.be/doAzL3mY9zo',11),(22,'https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true','https://youtu.be/doAzL3mY9zo',11),(23,'https://github.com/InahChoi/project_whatthe/blob/main/banner3.jpg?raw=true','https://youtu.be/doAzL3mY9zo',12),(24,'https://github.com/InahChoi/project_whatthe/blob/main/banner4.jpg?raw=true','https://youtu.be/doAzL3mY9zo',12),(25,'https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true','https://youtu.be/doAzL3mY9zo',13),(26,'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true','https://youtu.be/doAzL3mY9zo',13),(27,'https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true','https://youtu.be/doAzL3mY9zo',14),(28,'https://github.com/InahChoi/project_whatthe/blob/main/banner3.jpg?raw=true','https://youtu.be/doAzL3mY9zo',14),(29,'https://github.com/InahChoi/project_whatthe/blob/main/banner4.jpg?raw=true','https://youtu.be/doAzL3mY9zo',15),(30,'https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true','https://youtu.be/doAzL3mY9zo',15),(31,'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true','https://youtu.be/doAzL3mY9zo',16),(32,'https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true','https://youtu.be/doAzL3mY9zo',16),(33,'https://github.com/InahChoi/project_whatthe/blob/main/banner3.jpg?raw=true','https://youtu.be/doAzL3mY9zo',17),(34,'https://github.com/InahChoi/project_whatthe/blob/main/banner4.jpg?raw=true','https://youtu.be/doAzL3mY9zo',17),(35,'https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true','https://youtu.be/doAzL3mY9zo',18),(36,'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true','https://youtu.be/doAzL3mY9zo',18),(37,'https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true','https://youtu.be/doAzL3mY9zo',19),(38,'https://github.com/InahChoi/project_whatthe/blob/main/banner3.jpg?raw=true','https://youtu.be/doAzL3mY9zo',19),(39,'https://github.com/InahChoi/project_whatthe/blob/main/banner4.jpg?raw=true','https://youtu.be/doAzL3mY9zo',20),(40,'https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true','https://youtu.be/doAzL3mY9zo',20),(41,'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true','https://youtu.be/doAzL3mY9zo',21),(42,'https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true','https://youtu.be/doAzL3mY9zo',21),(43,'https://github.com/InahChoi/project_whatthe/blob/main/banner3.jpg?raw=true','https://youtu.be/doAzL3mY9zo',22),(44,'https://github.com/InahChoi/project_whatthe/blob/main/banner4.jpg?raw=true','https://youtu.be/doAzL3mY9zo',22),(45,'https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true','https://youtu.be/doAzL3mY9zo',23),(46,'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true','https://youtu.be/doAzL3mY9zo',23),(47,'https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true','https://youtu.be/doAzL3mY9zo',24),(48,'https://github.com/InahChoi/project_whatthe/blob/main/banner3.jpg?raw=true','https://youtu.be/doAzL3mY9zo',24),(49,'https://github.com/InahChoi/project_whatthe/blob/main/banner4.jpg?raw=true','https://youtu.be/doAzL3mY9zo',25),(50,'https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true','https://youtu.be/doAzL3mY9zo',25),(51,'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true','https://youtu.be/doAzL3mY9zo',26),(52,'https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true','https://youtu.be/doAzL3mY9zo',26),(53,'https://github.com/InahChoi/project_whatthe/blob/main/banner3.jpg?raw=true','https://youtu.be/doAzL3mY9zo',27),(54,'https://github.com/InahChoi/project_whatthe/blob/main/banner4.jpg?raw=true','https://youtu.be/doAzL3mY9zo',27),(55,'https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true','https://youtu.be/doAzL3mY9zo',28),(56,'https://github.com/InahChoi/project_whatthe/blob/main/banner1.jpg?raw=true','https://youtu.be/doAzL3mY9zo',28),(57,'https://github.com/InahChoi/project_whatthe/blob/main/banner2.jpg?raw=true','https://youtu.be/doAzL3mY9zo',29),(58,'https://github.com/InahChoi/project_whatthe/blob/main/banner3.jpg?raw=true','https://youtu.be/doAzL3mY9zo',29),(59,'https://github.com/InahChoi/project_whatthe/blob/main/banner4.jpg?raw=true','https://youtu.be/doAzL3mY9zo',30),(60,'https://github.com/InahChoi/project_whatthe/blob/main/banner5.png?raw=true','https://youtu.be/doAzL3mY9zo',30);
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'로맨스'),(2,'액션'),(3,'코미디'),(4,'SF');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_sorts`
--

DROP TABLE IF EXISTS `main_sorts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `main_sorts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_sorts`
--

LOCK TABLES `main_sorts` WRITE;
/*!40000 ALTER TABLE `main_sorts` DISABLE KEYS */;
INSERT INTO `main_sorts` VALUES (1,'박스오피스'),(2,'CGV 왓챠관');
/*!40000 ALTER TABLE `main_sorts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genres`
--

DROP TABLE IF EXISTS `movie_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `genre_id` int NOT NULL,
  `movie_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_genres_genre_id_3f892aeb_fk_genres_id` (`genre_id`),
  KEY `movie_genres_movie_id_cafd9509_fk_movies_id` (`movie_id`),
  CONSTRAINT `movie_genres_genre_id_3f892aeb_fk_genres_id` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`),
  CONSTRAINT `movie_genres_movie_id_cafd9509_fk_movies_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genres`
--

LOCK TABLES `movie_genres` WRITE;
/*!40000 ALTER TABLE `movie_genres` DISABLE KEYS */;
INSERT INTO `movie_genres` VALUES (1,1,1),(2,2,2),(3,3,4),(4,1,3),(5,2,5),(6,3,6),(7,4,7),(8,2,8),(9,3,9),(10,1,10),(11,2,11),(12,3,12),(13,1,13),(14,4,14),(15,3,15),(16,1,16),(17,2,17),(18,4,18),(19,1,19),(20,2,20),(21,3,21),(22,4,22),(23,2,23),(24,3,24),(25,1,25),(26,4,26),(27,3,27),(28,1,28),(29,4,29),(30,3,30);
/*!40000 ALTER TABLE `movie_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_images`
--

DROP TABLE IF EXISTS `movie_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `image_url` varchar(3000) COLLATE utf8mb4_general_ci NOT NULL,
  `movie_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_images_movie_id_0a9ee73e_fk_movies_id` (`movie_id`),
  CONSTRAINT `movie_images_movie_id_0a9ee73e_fk_movies_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_images`
--

LOCK TABLES `movie_images` WRITE;
/*!40000 ALTER TABLE `movie_images` DISABLE KEYS */;
INSERT INTO `movie_images` VALUES (1,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20ADS%20PLAYBILL%20Cover%20-%20Made%20with%20PosterMyWall.jpg?raw=true',1),(2,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Adventure%20Movie%20Poster%20Template%20-%20Made%20with%20PosterMyWall.jpg?raw=true',2),(3,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Dramatic%20Movie%20Poster%20Template%20-%20Made%20with%20PosterMyWall.jpg?raw=true',3),(4,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Drowning%20Book%20Cover%20Design%20Template%20-%20Made%20with%20PosterMyWall.jpg?raw=true',4),(5,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Fantasy%20-%20Made%20with%20PosterMyWall.jpg?raw=true',5),(6,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20MOVIE%20POSTER%20-%20Made%20with%20PosterMyWall.jpg?raw=true',6),(7,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Mary%20Poppins%20Theater%20Poster%20Template%20-%20Made%20with%20PosterMyWall.jpg?raw=true',7),(8,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Movie%20Night%20Poster%20-%20Made%20with%20PosterMyWall.jpg?raw=true',8),(9,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Movie%20Poster%20Template%20-%20Made%20with%20PosterMyWall(1).jpg?raw=true',9),(10,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Movie%20Poster%20Template%20-%20Made%20with%20PosterMyWall.jpg?raw=true',10),(11,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Mystery%20Movie%20Poster%20-%20Made%20with%20PosterMyWall.jpg?raw=true',11),(12,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Puppet%20Show%20Flyer%20Template%20-%20Made%20with%20PosterMyWall.jpg?raw=true',12),(13,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Red%20Mary%20Poppins%20Poster%20Template%20-%20Made%20with%20PosterMyWall.jpg?raw=true',13),(14,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Sonic%20HedgeHog%20Fast%20Boy%20Birthday%20Invite%20Party%20-%20Made%20with%20PosterMyWall.jpg?raw=true',14),(15,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Urban%20Movie%20Invitation%20Newsletter%20Graphic%20-%20Made%20with%20PosterMyWall.jpg?raw=true',15),(16,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20Wizard%20of%20Oz%20Dorothy%20Poster%20Template%20-%20Made%20with%20PosterMyWall.jpg?raw=true',16),(17,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20book%20cover%20or%20movie%20film%20theatre%20flyer%20template%20-%20Made%20with%20PosterMyWall.jpg?raw=true',17),(18,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20in%20memory%20of%20Chadwick%20Boseman%20black%20panther%20-%20Made%20with%20PosterMyWall.jpg?raw=true',18),(19,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20movie%20film%20cinema%20poster%20template%20-%20Made%20with%20PosterMyWall.jpg?raw=true',19),(20,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Copy%20of%20movie%20night%20out%20family%20event%20flyer%20-%20Made%20with%20PosterMyWall.jpg?raw=true',20),(21,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Couple%20Romantic%20Movie%20Poster.jpg?raw=true',21),(22,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Dark%20slate%20Gray%20Couple%20Movie%20Poster.jpg?raw=true',22),(23,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Mountain%20and%20Sea%20Photo%20Merge%20Movie%20Poster.jpg?raw=true',23),(24,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/Nordic%20Photo%20Background%20Movie%20Poster.jpg?raw=true',24),(25,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/The%20Way%20We%20Get%20By%20Blue%20Vertical%20Text%20Movie%20Poster.jpg?raw=true',25),(26,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/%EB%8B%A8%EC%83%89%20%EC%98%81%ED%99%94%20%EC%82%AC%EC%9D%B8%20%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg?raw=true',26),(27,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/%EB%8B%A8%EC%88%9C%ED%95%9C%20%EC%82%AC%EC%A7%84%20%EC%98%81%ED%99%94%20%EB%A7%90%20%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg?raw=true',27),(28,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/%EB%B9%88%ED%8B%B0%EC%A7%80%20%EA%B2%80%EC%9D%80%EC%83%89%EA%B3%BC%20%ED%9D%B0%EC%83%89%20%ED%83%80%EC%9E%90%EA%B8%B0%20%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg?raw=true',28),(29,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/%EC%96%B4%EB%91%90%EC%9A%B4%20%EB%A1%9C%EB%A7%A8%EC%8A%A4%20%EC%98%81%ED%99%94%20%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg?raw=true',29),(30,'https://github.com/DevelopSoo/WatchaPedia-project-image/blob/main/%ED%9D%91%EB%B0%9C%20%EC%97%AC%EC%9E%90%20%ED%96%87%EB%B9%9B%20%EC%98%81%ED%99%94%20%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg?raw=true',30);
/*!40000 ALTER TABLE `movie_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_likes`
--

DROP TABLE IF EXISTS `movie_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_likes_movie_id_67085467_fk_movies_id` (`movie_id`),
  KEY `movie_likes_user_id_5f7c7f07_fk_users_id` (`user_id`),
  CONSTRAINT `movie_likes_movie_id_67085467_fk_movies_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `movie_likes_user_id_5f7c7f07_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_likes`
--

LOCK TABLES `movie_likes` WRITE;
/*!40000 ALTER TABLE `movie_likes` DISABLE KEYS */;
INSERT INTO `movie_likes` VALUES (1,1,1),(2,2,1),(3,3,2),(4,4,2);
/*!40000 ALTER TABLE `movie_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `korean_title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `english_title` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `release_date` date NOT NULL,
  `nationality` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `number_of_audience` int unsigned NOT NULL,
  `description` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `running_time` smallint unsigned NOT NULL,
  `is_watcha` tinyint(1) NOT NULL,
  `category_id` int NOT NULL,
  `main_sort_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movies_main_sort_id_fc579845_fk_main_sorts_id` (`main_sort_id`),
  KEY `movies_category_id_8672f94f_fk_categories_id` (`category_id`),
  CONSTRAINT `movies_category_id_8672f94f_fk_categories_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `movies_main_sort_id_fc579845_fk_main_sorts_id` FOREIGN KEY (`main_sort_id`) REFERENCES `main_sorts` (`id`),
  CONSTRAINT `movies_chk_1` CHECK ((`number_of_audience` >= 0)),
  CONSTRAINT `movies_chk_2` CHECK ((`running_time` >= 0)),
  CONSTRAINT `movies_running_time_2769e271_check` CHECK ((`running_time` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'장고','Django','2018-01-01','미국',25000,'프랑코 네로가 주연한, 60년대 마카로니 웨스턴의 붐을 일으킨 작품.\n멕시코 국경지대. 각각 미국인인 웬체스터 잭과 멕시코인인 H.로드리게스를 우두머리로 한 두 라이벌 갱단은 장고라는 총잡이의 출현에 놀란다. 그는 노마라는 여인을 데리고 막 그곳에 도착했는데 사랑하는 아내의 죽음에 복수를 하기 위해 윈체스터 패거리들을 거의 일망타진한다. 그리고 나선 로드리게스 일당과 총과 금을 두고 결전을 펼친다.',130,0,1,1),(2,'아쳐','Archer','2019-01-01','미국',30000,'드워프의 퓨전 판타지 장편소설. 세계를 들썩이게 만들었던 신궁 김성환. 그의 화살이 이번엔 이계를 흔들어 놓는다. 런던에서 형과 함께 교통사고를 당한 성환. 다시 눈을 떴을 때 그의 눈앞에 펼쳐진 낯선 세상. 하지만 그곳에 형의 흔적들이 있었다. \"지금 그 화살을 쏜다면 자네는 죽을 걸세.\" \"그래도 저는 쏴야 합니다.\" 이계의 신궁이 거대한 폭풍의 중심으로 활을 겨눈다.',120,0,1,1),(3,'캐슬록','The story of CastleRock','2015-01-01','영국',23000,'가상의 도시인 캐슬록을 배경으로 한 심리 공포 드라마',125,0,1,1),(4,'드라우닝','Drowning','2018-01-01','프랑스',24000,'전형적인 작은 마을에 난데없는 사건 하나가 발생한다. 동네의 왈가닥으로 소문난 모나가 자동차를 타고 가다가 언덕에서 굴러 물에 빠져 죽은 것이다. 온 마을은 벌집을 쑤셔 놓은 듯 소동이 벌어진다. 그도 그럴 것이 모나의 사고는 부주의가 아니라 누군가 미리 브레이크로 연결되는 케이블을 교묘히 잘나 놓아 있어난 사건으로 판명된 까닭이다. 이에 경찰관 텍스는 탐문 수사에 들어간다.',120,0,1,1),(5,'판타지','Fantasy','2017-01-01','영국',3000,'환상적인 리조트에 초대된 콘테스트 우승자들은 아름다운 섬이 점점 악몽과도 같이 변하게 되는 것을 경험하게 된다.',121,0,1,1),(6,'교수','Professor','2016-01-02','스페인',2999,'전형적인 작은 마을에 난데없는 사건 하나가 발생한다. 동네의 왈가닥으로 소문난 모나가 자동차를 타고 가다가 언덕에서 굴러 물에 빠져 죽은 것이다. 온 마을은 벌집을 쑤셔 놓은 듯 소동이 벌어진다. 그도 그럴 것이 모나의 사고는 부주의가 아니라 누군가 미리 브레이크로 연결되는 케이블을 교묘히 잘나 놓아 있어난 사건으로 판명된 까닭이다. 이에 경찰관 텍스는 탐문 수사에 들어간다.',122,0,1,1),(7,'메리 포핀스','Marry Poppins','2020-01-03','미국',12303,'영국 런던의 브리티쉬 뱅크에 다니고 있는 조지 뱅크스, 여성 참정권을 주장하고 다니는 그의 아내 위니프레드 뱅크스, 그리고 매번 유모들을 쫓아내다시피 하는 말썽꾸러기 아이들 제인과 마이클. 그 날도 아이들은 유모 몰래 사라져 버리고 유모는 더 이상 못 참겠다며 가방을 싸들고 집을 나선다. 집으로 돌아오던 뱅크스 부인은 유모를 말려보지만 소용이 없다. 결국 유모는 뱅크스댁을 떠나게 되고, 그제서야 아이들이 돌아온다. 뱅크스씨는 신문에 유모를 구한다는 기사를 내려하고, 아이들은 자신들이 원하는 유모의 조건을 적어가지고 온다. 붉은 뺨을 하고 있어야 하고, 재미있는 놀이를 많이 알고 있는 유모를 원한다는 것이다. 그러나 뱅크스씨는 이 종이를 찢어버린다.\n 다음날, 면접을 보러 많은 사람들이 몰려오지만, 우산을 타고 내려온 메리 포핀스의 바람에 모두들 날아가 버린다. 어떨결에 메리 포핀스를 유모로 정하게 된 뱅크스씨. 아이들은 가방에서 옷걸이며, 화분이며 이것 저것을 꺼내는 메리 포핀스를 보며 신기해 한다. 메리 포핀스와 노래를 부르며 방을 치우고 굴뚝 청소부 버트와 함께 그림속 축제가 열리는 마을로 여행도 가고, 웃으면 붕 뜨는 알버트를 만나 함께 웃으며 즐거운 시간을 보낸다.\n 어느날 아이들은 아버지를 따라 브리티쉬 은행에 가게 되는데, 그곳에서 마이클이 가진 2펜스 때문에 소동이 벌어지는데...',123,0,1,1),(8,'어벤져스 엔드게임','Avengers','2015-01-04','미국',2000000,'인피니티 워 이후 절반만 살아남은 지구, 마지막 희망이 된 어벤져스, 먼저 떠난 그들을 위해 모든 것을 걸었다. 위대한 어벤져스, 운명을 바꿀 최후의 전쟁이 펼쳐진다.',124,0,1,1),(9,'코드','Code','2016-01-05','영국',21834,'거대한 비밀 앞에 전세계가 숨죽인다!\n 루브르 박물관 대화랑에서 발견된 시체…\n 천재화가 다 빈치의 작품 속에 숨겨진 충격적인 코드…  특별강연을 위해 파리에 체류중이던 하버드대 기호학자 로버트 랭던(톰 행크스)은 깊은 밤 급박한 호출을 받는다. 루브르 박물관의 수석 큐레이터 자크 소니에르가 박물관 내에서 살해당한 시체로 발견된 것이다. 시체 주변에 가득한 이해할 수 없는 암호들… 그중 ‘P.S. 로버트 랭던을 찾아라’는 암호 때문에 살인누명까지 뒤집어쓴 랭던은 자크의 손녀이자 기호학자인 소피 느뷔(오드리 토투)와 함께 자크가 남긴 불가사의한 수수께끼를 풀어나가기 시작한다.  인류역사를 뒤바꿀 거대한 비밀이 벗겨지는 순간,\n 최초의 목격자는 당신이다!  랭던과 소피는 시시각각 좁혀오는 경찰 조직과 파슈 국장(장 르노)의 숨가쁜 포위망을 피하면서, ‘모나리자’, ‘암굴의 성모’ 등 천재화가 레오나르도 다 빈치의 작품들 속에 숨겨진 충격적인 비밀을 추적한다. 하지만 코드 속에 감춰진 실마리를 쫓아 진실에 접근할수록 비밀단체 시온 수도회가 지켜온 비밀을 지워버리려는 ‘오푸스 데이’의 추격은 더욱 격렬해지고, 마침내 두 사람은 인류 역사를 송두리째 뒤바꿀 거대한 비밀과 마주하게 되는데...',125,0,1,1),(10,'프리덤','Our Freedom','2015-01-06','프랑스',12555,'1856년 흑인 노예인 사무엘은 가족과 함께 농장에서 도망친다. 자유를 향한 흑인 노예는 탈출을 돕는 비밀조직의 도움으로 캐나다로 떠날 계획을 세우지만, 악명 높은 노예사냥꾼 플림튼의 추적은 계속된다. 탈출구 없는 도망자의 삶, 가족조차 지킬 수 없는 위기에 빠진 사무엘은 자신을 노예로 만든 하나님을 원망하던 중 100여년 전 자신의 조상과 관련된 하나의 이야기를 듣게 된다. 한편, 1748년 노예를 가득 실은 배의 선장 존 뉴턴은 미국을 향해 닻을 올린다. 사랑하는 연인의 만류에도 불구하고 노예 운반책을 맡은 그는 배에서 알게 된 한 노예와의 운명적인 만남으로 항해자와 인간으로서의 신념 사이에서 깊은 고뇌에 빠진다. 그러던 어느 날, 갑작스런 폭풍우로 배가 좌초될 위기에 처하게 되고, 그는 그 누구도 상상하지 못했던 놀라운 선택을 감행하게 되는데...',126,0,1,1),(11,'더 다크','The Dark','2018-01-07','미국',12345,'10대 빈집털이범 록키, 알렉스, 머니는 밑바닥 삶을 청산하기 위해 눈 먼 노인을 겨냥한 마지막 한 탕을 준비한다. 노인이 잠 든 사이 거액의 현금을 쟁취하려던 순간 마침내 그가 깨어나게 되고, 이들의 치밀한 계획은 아무것도 보이지 않는 암전 속에서 모두 역전되기 시작하는데…',127,0,1,1),(12,'인형극','Puppet Show','2017-01-08','미국',53221,'인도의 전통 거리예술을 지켜온 인형사, 마술사, 곡예사들의 고향 카트푸트리. 정부의 뉴델리 재개발 계획 하에 사라질 위기에 처한다. 화려한 고층 건물과 대규모 상업 단지에 밀려나는 슬럼가의 가난한 예술가들. 유일한 거처를 지키려는 그들의 소박한 투쟁이 세련된 영상 속에 역동적으로 펼쳐진다. ',128,0,1,1),(13,'메리 포핀스 리턴즈','Marry Poppins Returns','2010-01-09','미국',32532,'행복한 상상을 이루어주는 해피메이커 ‘메리 포핀스’\n모두가 기다려온 가장 황홀한 경험이 펼쳐진다\n\n체리트리 가 17번지에 살고 있는 마이클과 세 아이들은 아내와 엄마를 잃고, 집까지 빼앗길 위기에 처해 슬픔에 잠긴다. 어느 날, 바람의 방향이 바뀌고 마이클의 가족에게 다시 돌아온 ‘메리 포핀스’는 사랑스러운 마법으로 가득 찬 황홀한 경험을 선사하는데…',129,0,1,1),(14,'소닉','Sonic','2013-01-10','미국',234555,'세상을 구할 초고속 히어로의 탄생! 소리보다 빠른 초고속 고슴도치 히어로 \'소닉\'은 지구에 불시착한다. 그의 특별한 능력을 감지한 과학자 ‘닥터 로보트닉’은 세계 정복의 야욕을 채우려 하고, 경찰관 ‘톰’은 위험에 빠진 ‘소닉’을 돕기 위해 나서는데…! 과연, ‘소닉\'은 천재 악당에 맞서 지구를 지킬 수 있을까?',130,0,1,1),(15,'소울','Soul','2020-01-11','미국',12344,'나는 어떻게 ‘나’로 태어나게 되었을까? 지구에 오기 전 영혼들이 머무는 ‘태어나기 전 세상’이 있다면? \n\n뉴욕에서 음악 선생님으로 일하던 ‘조’는 꿈에 그리던 최고의 밴드와 재즈 클럽에서 연주하게 된 그 날, 예기치 못한 사고로 영혼이 되어 ‘태어나기 전 세상’에 떨어진다. 탄생 전 영혼들이 멘토와 함께 자신의 관심사를 발견하면 지구 통행증을 발급하는 ‘태어나기 전 세상’. ‘조’는 그 곳에서 유일하게 지구에 가고 싶어하지 않는 시니컬한 영혼 ‘22’의 멘토가 된다. \n\n링컨, 간디, 테레사 수녀도 멘토되길 포기한 영혼 ‘22’. 꿈의 무대에 서려면 ‘22’의 지구 통행증이 필요한 ‘조’. 그는 다시 지구로 돌아가 꿈의 무대에 설 수 있을까?',131,0,1,1),(16,'오즈의 마법사','The Wizard of OZ','2018-01-12','미국',23555,'오즈에 대해 이야기하는 도로시를 정신착란으로 알고 고치기 위해 삼촌부부는 그녀를 치료 전문가에게 맡긴다. 그곳에서 탈출하던 도로시는 빗물에 휩쓸려 강물에 떠내려가게 되고 정신을 차려보니 또다시 \'오즈\'의 땅으로 와있다. 그런데 \'에레랄드시\'를 찾아가보니 옛친구들 세명은 물론이고 도시의 모두가 마법에 걸려 돌처럼 굳어있고, 나쁜 마녀는 도로시를 괴롭힌다. 그곳에서 경비병 로보트와 호박 인형과 순록 침대라는 새로운 친구들을 만나 그들의 도움으로 간신히 탈출한다. 결국 도로시는 새로운 친구들의 도움으로 나쁜 마녀와 바위괴물의 마법을 물리쳐 다시 한번 \'에레랄드시\'와 그녀의 옛친구 세명을 구해낸다.',132,1,1,NULL),(17,'헤더','Header','2013-01-13','미국',23455,'‘시빌 워’ 이후 와칸다의 왕위를 계승한 티찰라(채드윅 보스만)는 와칸다에만 존재하는 최강 희귀 금속 ‘비브라늄’과 왕좌를 노리는 숙적들의 음모가 전세계적인 위협으로 번지자 세상을 구할 히어로 ‘블랙 팬서’로서 피할 수 없는 전쟁에 나서는데… 마블의 가장 혁신적인 히어로가 온다.',133,1,1,NULL),(18,'블랙 펜서','Black Panther','2019-01-14','미국',1233555,'‘시빌 워’ 이후 와칸다의 왕위를 계승한 티찰라(채드윅 보스만)는 와칸다에만 존재하는 최강 희귀 금속 ‘비브라늄’과 왕좌를 노리는 숙적들의 음모가 전세계적인 위협으로 번지자 세상을 구할 히어로 ‘블랙 팬서’로서 피할 수 없는 전쟁에 나서는데… 마블의 가장 혁신적인 히어로가 온다.',134,1,1,NULL),(19,'헝거 게임','Hunger Game','2021-01-15','영국',1451234,'두 번의 헝거게임에서 살아남은 생존자 캣니스 에버딘. 그런 그녀를 향한 스노우 대통령의 공격은 더욱 거세지고 캣니스의 분노는 폭발한다. 캣니스는 그를 멈추고 모든 것을 끝낼 수 있는 사람이 바로 자신임을 깨닫고, 13구역 군단에 합류한다. 철저하게 준비를 끝낸 캣니스와 최정예 요원들은 캐피톨 입성에 성공하지만 스노우 대통령이 설치한 함정들로 인해 목숨을 위협받는 위험한 상황에 처하게 된다. 희생된 동료들을 뒤로한 채 가까스로 스노우 대통령과의 대결을 앞둔 캣니스에게 또 다른 충격적인 사건이 벌어지는데...',135,1,1,NULL),(20,'라이온 킹','The Lion King','2020-01-16','미국',123232,'새로운 세상, 너의 시대가 올 것이다! 어린 사자 ‘심바’는 프라이드 랜드의 왕인 아버지 ‘무파사’를 야심과 욕망이 가득한 삼촌 ‘스카’의 음모로 잃고 왕국에서도 쫓겨난다. 기억해라! 네가 누군지. 아버지의 죽음에 대한 죄책감에 시달리던 ‘심바’는 의욕 충만한 친구들 ‘품바’와 ‘티몬’의 도움으로 희망을 되찾는다. 어느 날 우연히 옛 친구 ‘날라’를 만난 ‘심바’는 과거를 마주할 용기를 얻고, 진정한 자신의 모습을 찾아 위대하고도 험난한 도전을 떠나게 되는데…',136,1,1,NULL),(21,'로맨스','Romance','2018-01-17','프랑스',123125,'책을 만들었는데, 로맨스가 따라왔다?\' 책을 읽지 않는 세상에서 책을 만드는 사람들의 이야기를 담은 로맨틱 코미디',137,1,1,NULL),(22,'나의 사랑','The love of mine','2017-01-18','미국',123123,'운명처럼 세상에서 가장 작은집에서 만난 에버렛과 모드. 혼자인 게 익숙했던 이들은 서서히 서로에게 물들어가며 깊은 사랑을 하게 되고 서로의 사랑을 풍경처럼 담는다.',138,1,1,NULL),(23,'땅과 바다','Land and Sea','2015-01-19','영국',123134,'칼 슈미트는 펠로폰네소스 전쟁에서부터 자본주의가 고통스럽게 태동하는 유럽의 식민주의 팽창 시기까지, 베네치아의 등장, 해적, 약탈 자본주의, 유럽의 공간혁명, 영국제국의 발흥과 같은 \'지구의 노모스Nomos\'에 대한 이론적 배경과 더불어 나치 독일을 해양의 적으로서 영국과 미국에 맞서는 대륙의 땅 권력으로 설정하면서 고유의 견해를 펼쳐 보인다. 슈미트는 세네카, 셰익스피어, 허먼 멜빌, 벤야민, 디즈레일리 같은 다양한 지성인들의 사상을 인용하며, 이들을 통해 철학적인 어조로 깊은 역사 인식적 해석을 제시한다. 21세기를 형성하는 힘들에 대한 심오한 숙고를 통해 우리로 하여금 지구의 미래의 가능성(그리고 위험성)에 대해 새롭게 생각하도록 한다.',139,1,1,NULL),(24,'정상','The Top of the World','2013-01-20','미국',23423,'북미 평화협정 체결을 위한 대한민국 대통령(정우성), 북한의 최고지도자인 위원장(유연석)과 미국 대통령(앵거스 맥페이든)간의 남북미 정상회담이 북한 원산에서 열린다. 북미 사이 좀처럼 이견이 좁혀지지 않는 가운데, 핵무기 포기와 평화체제 수립에 반발하는 북 호위총국장(곽도원)의 쿠데타가 발생하고, 납치된 세 정상은 북한 핵잠수함에 인질로 갇힌다. 그리고, 좁디 좁은 함장실 안, 예기치 못한 진정한 정상회담이 벌어지게 되는데… 동북아시아의 운명이 핵잠수함에 갇혔다! 과연, 남북미 세 지도자는 전쟁 위기를 막을 수 있을 것인가?',140,1,1,NULL),(25,'우리가 가는 길 ','The way we get','2017-01-21','일본',234234,'창비 \'20세기 한국소설 전집\' 제37권. 자신의 정체성을 찾아가는 과정을 다룬 작품들을 실었다. 청년기의 고뇌와 방황, 신과 인간의 문제, 예술가의 길, 분단과 이데올로기 갈등, 절대 권력의 허구성 등 다양한 소재와 주제를 해박한 지식과 능란한 솜씨로 다루어 온 작가 이문열을 비롯, 총 세 명 작가의 다섯 작품이 실렸다.',141,1,1,NULL),(26,'조용히 하세요','Be Quiet','2018-01-22','한국',234234,'예병수의 블록버스터급 \"조용히 하세요\"가 시작된다!',142,1,1,NULL),(27,'꿈 꾸는 자들의 산맥','','2019-01-23','한국',235543,'예병수가 꿈꾸는 개발산맥! 그의 조울증을 담은 꿈 꾸는 자들의 산맥',143,1,1,NULL),(28,'다이나마이트','dynamite','2017-01-24','한국',145551,'Cause I-I-I\'m in the stars tonight\nSo watch me bring the fire and set the night alight\nShoes on, get up in the morn\'\nCup of milk, let\'s rock and roll\nKing Kong, kick the drum, rolling on like a Rolling Stone\nSing song when I\'m walking home\nJump up to the top, LeBron\nDing dong, call me on my phone\nIce tea and a game of ping pong, huh',144,1,1,NULL),(29,'상상더하기','sangsangplus','2020-01-25','한국',342345,'떠나는 거야\n상상에 상상에 상상을 더해서\n어머 깜짝야\n눈부셔 눈부셔 눈부셔 이건 뭐\nOh Hello New World\n두 손 모아 소리치면\n푸른 하늘이 내게로 와',145,1,1,NULL),(30,'그녀','','2017-01-26','한국',12323,'다른 사람의 편지를 써주는 대필 작가로 일하고 있는 ‘테오도르’는 타인의 마음을 전해주는 일을 하고 있지만 정작 자신은 아내와 별거 중인 채 외롭고 공허한 삶을 살아가고 있다. 어느 날, 스스로 생각하고 느끼는 인공지능 운영체제 ‘사만다’를 만나게 되고, 자신의 말에 귀를 기울이며 이해해주는 ‘사만다’로 인해 조금씩 상처를 회복하고 행복을 되찾기 시작한 ‘테오도르’는 어느새 점점 그녀에게 사랑의 감정을 느끼게 되는데...',120,1,1,NULL);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panels`
--

DROP TABLE IF EXISTS `panels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `panels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `character` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `actor_id` int NOT NULL,
  `movie_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `panels_actor_id_bc8c3d72_fk_actors_id` (`actor_id`),
  KEY `panels_movie_id_5e21de93_fk_movies_id` (`movie_id`),
  CONSTRAINT `panels_actor_id_bc8c3d72_fk_actors_id` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`),
  CONSTRAINT `panels_movie_id_5e21de93_fk_movies_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panels`
--

LOCK TABLES `panels` WRITE;
/*!40000 ALTER TABLE `panels` DISABLE KEYS */;
INSERT INTO `panels` VALUES (1,'감독','',1,1),(2,'주연','홍길동',2,1),(3,'조연','전우치',3,1),(4,'조연','찰리채플린',4,1),(5,'감독','',5,2),(6,'주연','송강호',6,2),(7,'조연','소유',7,2),(8,'조연','손예진',8,2),(9,'감독','',9,3),(10,'주연','전도연',10,3),(11,'조연','전지현',11,3),(12,'조연','이소룡',12,3),(13,'감독','',13,4),(14,'주연','공유',14,4),(15,'조연','하정우',15,4),(16,'조연','이병헌',16,4),(17,'감독','',17,5),(18,'주연','황정민',18,5),(19,'조연','조승우',19,5),(20,'조연','김고은',20,5),(21,'감독','',21,6),(22,'주연','스칼렛 요한슨',22,6),(23,'조연','송혜교',23,6),(24,'조연','이순재',24,6),(25,'감독','',25,7),(26,'주연','변요한',26,7),(27,'조연','차태현',27,7),(28,'조연','설경우',28,7),(29,'감독','',29,8),(30,'주연','강동원',30,8),(31,'조연','이민호',31,8),(32,'조연','이정재',32,8),(33,'감독','',33,9),(34,'주연','나문희',34,9),(35,'조연','박중훈',1,9),(36,'조연','감우성',2,9),(37,'감독','',3,10),(38,'주연','아유미',4,10),(39,'조연','박중훈',5,10),(40,'조연','송중기',6,10),(41,'감독','',7,11),(42,'주연','신민아',8,11),(43,'조연','마동석',9,11),(44,'조연','스파이더맨',10,11),(45,'감독','',11,12),(46,'주연','블랙팬서',12,12),(47,'조연','브래드피트',13,12),(48,'조연','더락',14,12),(49,'감독','',15,13),(50,'주연','윌스미스',16,13),(51,'조연','로버트 다우니 주니어',17,13),(52,'조연','조니 뎁',18,13),(53,'감독','',19,14),(54,'주연','톰 행크스',20,14),(55,'조연','디카프리오',21,14),(56,'조연','알 파치노',22,14),(57,'감독','',23,15),(58,'주연','모건 프리먼',24,15),(59,'조연','해리슨 포드',25,15),(60,'조연','브래들리 쿠퍼',26,15),(61,'감독','',27,16),(62,'주연','톰 크루즈',28,16),(63,'조연','잭 니컬슨',29,16),(64,'조연','브루스 윌리스',30,16),(65,'감독','',31,17),(66,'주연','제임스 딘',32,17),(67,'조연','드웨인 존슨',33,17),(68,'조연','니콜라스 케이지',34,17),(69,'감독','',1,18),(70,'주연','존 웨인',2,18),(71,'조연','맷 데이먼',3,18),(72,'조연','돈 치들',4,18),(73,'감독','',5,19),(74,'주연','토미 리 존스',6,19),(75,'조연','마크 윌버그',7,19),(76,'조연','케빈 스페이시',8,19),(77,'감독','',9,20),(78,'주연','앤서니 홉킨스',10,20),(79,'조연','마릴린 먼로',11,20),(80,'조연','숀 펜',12,20),(81,'감독','',13,21),(82,'주연','존 아모스',14,21),(83,'조연','시드니 포이티머',15,21),(84,'조연','마틴 스코세이지',16,21),(85,'감독','로버트 레드퍼드',17,22),(86,'주연','마허셜라 알리',18,22),(87,'조연','제이크 질런 홀',19,22),(88,'조연','',20,22),(89,'감독','',21,23),(90,'주연','톰 크루즈',22,23),(91,'조연','잭 니컬슨',23,23),(92,'조연','브루스 윌리스',24,23),(93,'감독','',25,24),(94,'주연','제임스 딘',26,24),(95,'조연','드웨인 존슨',27,24),(96,'조연','니콜라스 케이지',28,24),(97,'감독','',29,25),(98,'주연','존 웨인',30,25),(99,'조연','맷 데이먼',31,25),(100,'조연','돈 치들',32,25),(101,'감독','',33,26),(102,'주연','토미 리 존스',34,26),(103,'조연','마크 윌버그',1,26),(104,'조연','케빈 스페이시',2,26),(105,'감독','',3,27),(106,'주연','앤서니 홉킨스',4,27),(107,'조연','마릴린 먼로',5,27),(108,'조연','숀 펜',6,27),(109,'감독','',7,28),(110,'주연','존 아모스',8,28),(111,'조연','시드니 포이티머',9,28),(112,'조연','마틴 스코세이지',10,28),(113,'감독','',11,29),(114,'주연','마허셜라 알리',12,29),(115,'조연','제이크 질런 홀',13,29),(116,'조연','에디 머피',14,29),(117,'감독','',15,30),(118,'주연','로버트 레드퍼드',16,30),(119,'조연','맬 깁슨',17,30),(120,'조연','메릴 스트립',18,30);
/*!40000 ALTER TABLE `panels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_stars`
--

DROP TABLE IF EXISTS `user_stars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_stars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `star` int NOT NULL,
  `movie_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_stars_movie_id_160305b2_fk_movies_id` (`movie_id`),
  KEY `user_stars_user_id_bdf83b12_fk_users_id` (`user_id`),
  CONSTRAINT `user_stars_movie_id_160305b2_fk_movies_id` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`),
  CONSTRAINT `user_stars_user_id_bdf83b12_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_stars`
--

LOCK TABLES `user_stars` WRITE;
/*!40000 ALTER TABLE `user_stars` DISABLE KEYS */;
INSERT INTO `user_stars` VALUES (1,5,1,1),(2,4,2,1),(3,3,3,1),(4,2,1,2),(5,5,2,2),(6,3,3,2);
/*!40000 ALTER TABLE `user_stars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(300) COLLATE utf8mb4_general_ci NOT NULL,
  `profile_image_url` varchar(3000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `maketing_is_agreed` tinyint(1) NOT NULL,
  `account_type_id` int DEFAULT NULL,
  `kakao_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `kakao_id` (`kakao_id`),
  KEY `users_account_type_id_e7aec632_fk_account_types_id` (`account_type_id`),
  CONSTRAINT `users_account_type_id_e7aec632_fk_account_types_id` FOREIGN KEY (`account_type_id`) REFERENCES `account_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'홍길동','dhnp1102@naver.com','123123123','https://images.unsplash.com/photo-1470093851219-69951fcbb533?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',1,NULL,NULL),(2,'김길동','dhnp1103@naver.com','123123123','https://images.unsplash.com/photo-1425082661705-1834bfd09dca?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1055&q=80',0,NULL,NULL);
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

-- Dump completed on 2021-04-07 16:58:10
