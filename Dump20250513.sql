-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: movieticketbooking
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `booking_combo`
--

DROP TABLE IF EXISTS `booking_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_combo` (
  `booking_id` int NOT NULL,
  `combo_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`booking_id`,`combo_id`),
  KEY `booking_combo_ibfk_2_idx` (`combo_id`),
  CONSTRAINT `booking_combo_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `ticket` (`booking_id`),
  CONSTRAINT `booking_combo_ibfk_2` FOREIGN KEY (`combo_id`) REFERENCES `combo` (`combo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `booking_seat`
--

DROP TABLE IF EXISTS `booking_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_seat` (
  `booking_id` int NOT NULL,
  `seat_id` int NOT NULL,
  PRIMARY KEY (`booking_id`,`seat_id`),
  CONSTRAINT `booking_seat_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `ticket` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `booking_snack`
--

DROP TABLE IF EXISTS `booking_snack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_snack` (
  `booking_id` int NOT NULL,
  `snack_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`booking_id`,`snack_id`),
  KEY `booking_snack_ibfk_2_idx` (`snack_id`),
  CONSTRAINT `booking_snack_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `ticket` (`booking_id`),
  CONSTRAINT `booking_snack_ibfk_2` FOREIGN KEY (`snack_id`) REFERENCES `snack` (`snack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `description` text,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cinema`
--

DROP TABLE IF EXISTS `cinema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cinema` (
  `cinema_id` int NOT NULL AUTO_INCREMENT,
  `cinema_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `city_id` int DEFAULT NULL,
  `image_path` varchar(100) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  PRIMARY KEY (`cinema_id`),
  KEY `city_id` (`city_id`),
  CONSTRAINT `cinema_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo`
--

DROP TABLE IF EXISTS `combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo` (
  `combo_id` int NOT NULL AUTO_INCREMENT,
  `combo_name` varchar(100) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`combo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `combo_item`
--

DROP TABLE IF EXISTS `combo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `combo_item` (
  `combo_id` int NOT NULL,
  `snack_id` int NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`combo_id`,`snack_id`),
  KEY `snack_id` (`snack_id`),
  CONSTRAINT `combo_item_ibfk_1` FOREIGN KEY (`combo_id`) REFERENCES `combo` (`combo_id`),
  CONSTRAINT `combo_item_ibfk_2` FOREIGN KEY (`snack_id`) REFERENCES `snack` (`snack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `device_token`
--

DROP TABLE IF EXISTS `device_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device_token` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(45) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  `device_type` varchar(45) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `token_user_fk_idx` (`user_id`),
  CONSTRAINT `token_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `discount_id` int NOT NULL AUTO_INCREMENT,
  `discount_method` varchar(50) DEFAULT NULL,
  `discount_percentage` int DEFAULT '0',
  `discount_amount` int DEFAULT '0',
  `quantity` int DEFAULT '0',
  `expired_in` date DEFAULT NULL,
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `favourite`
--

DROP TABLE IF EXISTS `favourite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite` (
  `user_id` varchar(32) NOT NULL,
  `movie_id` int NOT NULL,
  `added_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `favourite_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `favourite_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `movie_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `release_date` date DEFAULT NULL,
  `duration` int NOT NULL,
  `rating` float DEFAULT '0',
  `synopsis` text,
  `poster_url` varchar(255) DEFAULT NULL,
  `trailer_url` varchar(255) DEFAULT NULL,
  `censor` varchar(10) DEFAULT NULL,
  `cast` text,
  `directors` text,
  `genre` varchar(100) DEFAULT NULL,
  `is_special` tinyint DEFAULT '0',
  `showing_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `showing_status` enum('upcoming','showing','ended') DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` varchar(50) NOT NULL,
  `booking_id` int(10) unsigned zerofill DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `bank_code` varchar(20) DEFAULT '0',
  `payment_status` varchar(50) DEFAULT NULL,
  `response_code` varchar(45) NOT NULL,
  `order_info` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `booking_id` (`booking_id`),
  KEY `payment_ibfk_2` (`payment_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ranking`
--

DROP TABLE IF EXISTS `ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranking` (
  `rank_name` varchar(50) NOT NULL,
  `discount_percent` int DEFAULT NULL,
  `discount_amount` int DEFAULT NULL,
  `min_point` int DEFAULT NULL,
  `rankcol` varchar(45) DEFAULT NULL,
  `rank_id` int NOT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) DEFAULT NULL,
  `movie_id` int DEFAULT NULL,
  `rating` int NOT NULL,
  `review_content` text,
  `review_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `user_id` (`user_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `review_chk_1` CHECK (((`rating` >= 0) and (`rating` <= 10)))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screen`
--

DROP TABLE IF EXISTS `screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen` (
  `screen_id` int NOT NULL AUTO_INCREMENT,
  `cinema_id` int NOT NULL,
  `screen_name` varchar(20) NOT NULL,
  `aisle_pos` json DEFAULT NULL,
  PRIMARY KEY (`screen_id`,`cinema_id`),
  KEY `screen_ibfk_1` (`cinema_id`),
  CONSTRAINT `screen_ibfk_1` FOREIGN KEY (`cinema_id`) REFERENCES `cinema` (`cinema_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `screen_row`
--

DROP TABLE IF EXISTS `screen_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen_row` (
  `row_id` int NOT NULL AUTO_INCREMENT,
  `row_name` varchar(10) NOT NULL,
  `seat_type` enum('Regular','VIP','Couple') NOT NULL DEFAULT 'Regular',
  `seat_count` int NOT NULL,
  `screen_id` int DEFAULT NULL,
  PRIMARY KEY (`row_id`),
  KEY `screen_id` (`screen_id`),
  CONSTRAINT `screen_row_ibfk_1` FOREIGN KEY (`screen_id`) REFERENCES `screen` (`screen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat` (
  `seat_id` int NOT NULL AUTO_INCREMENT,
  `row_id` int NOT NULL,
  `seat_number` int NOT NULL,
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seat_price`
--

DROP TABLE IF EXISTS `seat_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seat_price` (
  `seat_type` enum('Regular','VIP','Couple') NOT NULL DEFAULT 'Regular',
  `showing_format` enum('2D','3D','4D','IMAX') NOT NULL DEFAULT '2D',
  `price` bigint DEFAULT NULL,
  PRIMARY KEY (`seat_type`,`showing_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `showing_movie`
--

DROP TABLE IF EXISTS `showing_movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showing_movie` (
  `showing_id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int DEFAULT NULL,
  `screen_id` int DEFAULT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `showing_date` date DEFAULT NULL,
  `showing_format` enum('2D','3D','4D','IMAX') DEFAULT '2D',
  `language` varchar(50) DEFAULT NULL,
  `subtitle_language` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`showing_id`),
  KEY `movie_id` (`movie_id`),
  KEY `screen_id` (`screen_id`),
  KEY `showing_format` (`showing_format`),
  KEY `idx_showing_start_time` (`start_time`),
  CONSTRAINT `showing_movie_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  CONSTRAINT `showing_movie_ibfk_2` FOREIGN KEY (`screen_id`) REFERENCES `screen` (`screen_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `showing_seat`
--

DROP TABLE IF EXISTS `showing_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showing_seat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `showing_id` int DEFAULT NULL,
  `seat_id` int DEFAULT NULL,
  `status` enum('Available','Reserved','Sold') DEFAULT 'Available',
  `reserved_by` varchar(45) DEFAULT NULL,
  `reserved_at` datetime DEFAULT NULL,
  `reservation_expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`showing_id`,`seat_id`),
  KEY `showing_seat_user_fk_idx` (`reserved_by`),
  KEY `idx_showing_seat_expiration` (`reservation_expires_at`),
  KEY `idx_showing_seat_status` (`status`),
  CONSTRAINT `showing_seat_user_fk` FOREIGN KEY (`reserved_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `showing_seat_user_fk1` FOREIGN KEY (`showing_id`) REFERENCES `showing_movie` (`showing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `snack`
--

DROP TABLE IF EXISTS `snack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `snack` (
  `snack_id` int NOT NULL AUTO_INCREMENT,
  `subcategory_id` int NOT NULL,
  `snack_name` varchar(100) NOT NULL,
  `description` text,
  `size` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`snack_id`),
  KEY `subcategory_id` (`subcategory_id`),
  CONSTRAINT `snack_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`subcategory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subcategory`
--

DROP TABLE IF EXISTS `subcategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subcategory` (
  `subcategory_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `subcategory_name` varchar(100) NOT NULL,
  PRIMARY KEY (`subcategory_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `subcategory_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(32) NOT NULL,
  `showing_id` int NOT NULL,
  `booking_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_amount` int DEFAULT NULL,
  `discount_id` int DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `discount_id` (`discount_id`),
  KEY `booking_ibfk_1` (`user_id`),
  KEY `booking_ibfk_2` (`showing_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`showing_id`) REFERENCES `showing_movie` (`showing_id`),
  CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(32) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `password` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `account_status` enum('Active','Deleted','Banned','Pending') NOT NULL DEFAULT 'Active',
  `refresh_token` varchar(255) DEFAULT NULL,
  `refresh_token_expiry` datetime DEFAULT NULL,
  `gender` enum('Nam','Nữ','Khác') NOT NULL DEFAULT 'Nam',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `photo_url` varchar(500) DEFAULT NULL,
  `rank_id` int NOT NULL DEFAULT '1',
  `total_point` int DEFAULT '0',
  `total_paid` bigint DEFAULT '0',
  `role` enum('Admin','User') DEFAULT 'User',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_number` (`phone_number`),
  KEY `fk_user_ranking_idx` (`rank_id`),
  CONSTRAINT `fk_user_ranking` FOREIGN KEY (`rank_id`) REFERENCES `ranking` (`rank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-13  8:49:56
