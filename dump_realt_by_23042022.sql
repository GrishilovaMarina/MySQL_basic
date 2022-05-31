-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: realt_by
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_application` bigint DEFAULT NULL,
  `body` char(250) DEFAULT NULL,
  `date_placement` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_update` datetime DEFAULT NULL,
  `activity` bit(1) DEFAULT (1),
  PRIMARY KEY (`id`),
  KEY `id_application` (`id_application`),
  CONSTRAINT `ads_ibfk_1` FOREIGN KEY (`id_application`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,2,NULL,'2022-04-11 21:03:14',NULL,_binary ''),(2,6,NULL,'2022-04-11 21:03:14',NULL,_binary ''),(3,4,NULL,'2022-04-11 21:03:14','2022-04-11 21:22:30',_binary ''),(4,1,NULL,'2022-04-11 21:03:14',NULL,_binary ''),(5,5,NULL,'2022-04-11 21:03:14',NULL,_binary '\0'),(6,3,NULL,'2022-04-11 21:03:14','2022-04-11 21:22:30',_binary '');
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `type_id` int unsigned DEFAULT NULL,
  `name_id` int unsigned DEFAULT NULL,
  `price` int DEFAULT NULL,
  `id_locality` int DEFAULT NULL,
  `specifications` char(250) NOT NULL,
  `date_submission` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_review` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `type_id` (`type_id`),
  KEY `name_id` (`name_id`),
  KEY `id_locality` (`id_locality`),
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `type_advertisement` (`id`),
  CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`name_id`) REFERENCES `estate_object` (`id`),
  CONSTRAINT `applications_ibfk_4` FOREIGN KEY (`id_locality`) REFERENCES `locality` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,5,1,4,15000,10,'год постройки - 1977, 58 кв.м., все коммуникации','2022-04-11 20:59:51','2022-04-11 21:20:49'),(2,2,1,1,82000,1,'год постройки - 2021,  60 кв.м., 2-хкомнатная, 3 этаж, с отделкой','2022-04-11 20:59:51',NULL),(3,6,1,1,96000,1,'год постройки - 2020,  78 кв.м., 2-хкомнатная, 5 этаж, с отделкой','2022-04-11 20:59:51','2022-04-11 21:18:52'),(4,3,1,8,55000,1,'год постройки - 2005,  34 кв.м., с отделкой','2022-04-11 20:59:51',NULL),(5,7,1,5,7000,8,'6 соток, без коммуникаций','2022-04-11 20:59:51','2022-04-11 21:20:49'),(6,1,2,5,NULL,7,'без построек','2022-04-11 20:59:57',NULL);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complaint`
--

DROP TABLE IF EXISTS `complaint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complaint` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `ads_id` bigint unsigned DEFAULT NULL,
  `date_complaint` datetime DEFAULT CURRENT_TIMESTAMP,
  `body` char(250) DEFAULT NULL,
  `consideration` bit(1) DEFAULT (0),
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ads_id` (`ads_id`),
  CONSTRAINT `complaint_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `complaint_ibfk_2` FOREIGN KEY (`ads_id`) REFERENCES `ads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complaint`
--

LOCK TABLES `complaint` WRITE;
/*!40000 ALTER TABLE `complaint` DISABLE KEYS */;
INSERT INTO `complaint` VALUES (1,9,3,'2022-04-11 21:12:36','Rfchcg',_binary ''),(2,8,6,'2022-04-11 21:12:36','GTcdvjh',_binary '\0');
/*!40000 ALTER TABLE `complaint` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estate_object`
--

DROP TABLE IF EXISTS `estate_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estate_object` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` char(150) NOT NULL,
  `id_view` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_view` (`id_view`),
  CONSTRAINT `estate_object_ibfk_1` FOREIGN KEY (`id_view`) REFERENCES `view_estate_object` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estate_object`
--

LOCK TABLES `estate_object` WRITE;
/*!40000 ALTER TABLE `estate_object` DISABLE KEYS */;
INSERT INTO `estate_object` VALUES (1,'квартира',1),(2,'комната',1),(3,'коттедж',2),(4,'дом',2),(5,'участок',2),(6,'бизнес-центр',3),(7,'кафе',3),(8,'офис',3),(9,'магазин',3),(10,'склад',3);
/*!40000 ALTER TABLE `estate_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locality`
--

DROP TABLE IF EXISTS `locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locality` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name_locality` char(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locality`
--

LOCK TABLES `locality` WRITE;
/*!40000 ALTER TABLE `locality` DISABLE KEYS */;
INSERT INTO `locality` VALUES (1,'г.Минск'),(2,'г.Витебск'),(3,'г.Гродно'),(4,'г.Могилев'),(5,'г.Брест'),(6,'г.Гомель'),(7,'СТ Вишневка'),(8,'СТ Озерцо'),(9,'пос.Радужный'),(10,'д.Михалёво');
/*!40000 ALTER TABLE `locality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `from_user_id` bigint unsigned DEFAULT NULL,
  `to_user_id` bigint unsigned DEFAULT NULL,
  `body` char(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,4,7,'Gjbmscghfc svgc scvghv'),(2,8,5,'E cghv schb sxsfcf'),(3,7,4,'Pdfxgsk hjyvj sgvf skl'),(4,7,3,'Wcgf kjbdc snl'),(5,6,1,'Ihgcv fcgfc 99 kjbh'),(6,1,6,'Qfcgf dkjn 6548 kjbdk'),(7,1,9,'Gjhvjh vgh sknc'),(8,1,3,'Dgtygcf lghsvc swcoi'),(9,7,5,'Zgvc gfn 878 dhb 54 skjb');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `my_view_1`
--

DROP TABLE IF EXISTS `my_view_1`;
/*!50001 DROP VIEW IF EXISTS `my_view_1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_view_1` AS SELECT 
 1 AS `Автор объявления`,
 1 AS `Объект сделки`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `my_view_2`
--

DROP TABLE IF EXISTS `my_view_2`;
/*!50001 DROP VIEW IF EXISTS `my_view_2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `my_view_2` AS SELECT 
 1 AS `Месторасположение объекта`,
 1 AS `Количество заявок`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `ads_id` bigint unsigned DEFAULT NULL,
  `date_payment` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ads_id` (`ads_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`ads_id`) REFERENCES `ads` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,5,1,'2022-04-11 21:06:01'),(2,2,2,'2022-04-11 21:06:01'),(3,6,3,'2022-04-11 21:06:01'),(4,3,4,'2022-04-11 21:07:43'),(5,7,5,'2022-04-11 21:07:43'),(6,1,6,'2022-04-11 21:07:43');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `del_p` BEFORE DELETE ON `payments` FOR EACH ROW begin
	declare error_del_p condition for sqlstate '50000';
    set @del_id_p = old.id;
	set @act = (select activity from ads
				join payments on payments.ads_id = ads.id
				where payments.id = @del_id_p);
    if  @act = 1 then
        signal error_del_p
        set message_text = 'Нельзя удалить запись об оплате активного объявления';
     end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `type_advertisement`
--

DROP TABLE IF EXISTS `type_advertisement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_advertisement` (
  `id` int unsigned NOT NULL,
  `type_ad` char(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_advertisement`
--

LOCK TABLES `type_advertisement` WRITE;
/*!40000 ALTER TABLE `type_advertisement` DISABLE KEYS */;
INSERT INTO `type_advertisement` VALUES (1,'продажа'),(2,'покупка'),(3,'аренда');
/*!40000 ALTER TABLE `type_advertisement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` char(150) NOT NULL,
  `phone` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Иван Иванов',158976523),(2,'Агентство Этажи',785369124),(3,'Агентство Твоя Столица',746988533),(4,'Николай Степанов',228774369),(5,'Алла Чижик',478996574),(6,'Агентство Час пик',788996005),(7,'Светлана Суворова',889630102),(8,'Агентство Мариэлт',300951667),(9,'Анатолий Синица',698220576),(10,'Петр Васильев',749862357);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view_estate_object`
--

DROP TABLE IF EXISTS `view_estate_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view_estate_object` (
  `id` int unsigned NOT NULL,
  `view_object` char(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view_estate_object`
--

LOCK TABLES `view_estate_object` WRITE;
/*!40000 ALTER TABLE `view_estate_object` DISABLE KEYS */;
INSERT INTO `view_estate_object` VALUES (1,'жилая'),(2,'загородная'),(3,'коммерческая');
/*!40000 ALTER TABLE `view_estate_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `my_view_1`
--

/*!50001 DROP VIEW IF EXISTS `my_view_1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_view_1` AS select `users`.`name` AS `Автор объявления`,`estate_object`.`name` AS `Объект сделки` from ((`users` join `applications` on((`applications`.`user_id` = `users`.`id`))) join `estate_object` on((`estate_object`.`id` = `applications`.`name_id`))) where (`applications`.`date_review` is not null) order by 'Автор объявления' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `my_view_2`
--

/*!50001 DROP VIEW IF EXISTS `my_view_2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `my_view_2` AS select `locality`.`name_locality` AS `Месторасположение объекта`,count(0) AS `Количество заявок` from (`applications` join `locality` on((`locality`.`id` = `applications`.`id_locality`))) group by `locality`.`name_locality` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-23 20:05:04
