-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: ulistit
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category` varchar(45) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category`),
  KEY `cat_user_fk_idx` (`created_by`),
  CONSTRAINT `cat_user_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('Apparel',9,'2018-02-25 05:53:42'),('Art',9,'2018-02-26 03:55:59'),('Auto',9,'2018-02-26 03:55:19'),('Collectibles',9,'2018-02-26 03:56:17'),('Electronics',9,'2018-02-25 05:53:42'),('Exotic',9,'2018-02-26 03:54:52'),('Furniture',9,'2018-02-25 05:53:42'),('Home Goods',9,'2018-02-26 03:56:48'),('Other',9,'2018-02-25 19:41:53'),('School Supplies',9,'2018-02-25 19:45:43'),('Sporting Goods',9,'2018-02-26 03:56:32');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversation`
--

DROP TABLE IF EXISTS `conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversation` (
  `conversation_ID` int(11) NOT NULL AUTO_INCREMENT,
  `userId_1` int(11) NOT NULL,
  `userId_2` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`conversation_ID`),
  KEY `userID_connect_idx` (`userId_1`),
  KEY `userID2_conect_idx` (`userId_2`),
  CONSTRAINT `userID1_connect` FOREIGN KEY (`userId_1`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID2_conect` FOREIGN KEY (`userId_2`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='fk_conversation_1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversation`
--

LOCK TABLES `conversation` WRITE;
/*!40000 ALTER TABLE `conversation` DISABLE KEYS */;
INSERT INTO `conversation` VALUES (1,9,14,'2018-02-13 17:33:31'),(2,9,12,'2018-02-13 19:03:59');
/*!40000 ALTER TABLE `conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispute`
--

DROP TABLE IF EXISTS `dispute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dispute` (
  `dispute_id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) NOT NULL,
  `accusing_id` int(11) NOT NULL,
  `defending_id` int(11) NOT NULL,
  `complaint` varchar(1000) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(200) NOT NULL DEFAULT 'FILED',
  PRIMARY KEY (`dispute_id`),
  KEY `dispute_listing_fk_idx` (`listing_id`),
  KEY `dispute_accusing_fk_idx` (`accusing_id`),
  KEY `dispute_defending_fk_idx` (`defending_id`),
  CONSTRAINT `dispute_accusing_fk` FOREIGN KEY (`accusing_id`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dispute_defending_fk` FOREIGN KEY (`defending_id`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dispute_listing_fk` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispute`
--

LOCK TABLES `dispute` WRITE;
/*!40000 ALTER TABLE `dispute` DISABLE KEYS */;
INSERT INTO `dispute` VALUES (1,1,9,10,'Test dispute.','2018-02-12 07:27:43','FILED'),(2,1,9,10,'Test dispute.','2018-02-12 07:30:20','FILED'),(3,1,9,10,'dfsdf','2018-02-13 18:43:50','FILED'),(4,1,9,10,'sssssssssssssssssssssssssssssssssssssssss','2018-02-13 18:58:47','FILED'),(5,1,9,10,'','2018-02-16 00:55:43','FILED'),(6,1,9,10,'He lied to me!','2018-02-18 03:00:50','FILED');
/*!40000 ALTER TABLE `dispute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faq` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(150) NOT NULL,
  `answer` varchar(500) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT '1',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`),
  UNIQUE KEY `question_UNIQUE` (`question`),
  KEY `question_creator_idx` (`created_by`),
  CONSTRAINT `question_creator` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,'What Can I Sell On U-ListIt?','You can sell pretty much anything!',9,'2018-02-15 21:30:15'),(2,'Does It Cost Money To Sell My Stuff?','There is a small listing fee taken.',9,'2018-02-15 21:30:55');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite` (
  `favoriteID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `listingID` int(11) DEFAULT NULL,
  `userWatching` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`favoriteID`),
  KEY `userID_fk2_idx` (`userID`),
  KEY `listingID_fk_idx` (`listingID`),
  CONSTRAINT `listingID_fk` FOREIGN KEY (`listingID`) REFERENCES `listing` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID_fk2` FOREIGN KEY (`userID`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing`
--

DROP TABLE IF EXISTS `listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL DEFAULT 'default',
  `description` varchar(45) DEFAULT NULL,
  `category` varchar(45) NOT NULL DEFAULT 'Other',
  `sub_category` varchar(45) NOT NULL DEFAULT 'Other',
  `price` int(11) NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `image_path` varchar(45) NOT NULL,
  `highest_bid_userID` int(11) DEFAULT NULL,
  `highest_bid` int(11) DEFAULT '0',
  `bid_count` int(11) DEFAULT NULL,
  `start_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `ended` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userID_fk_idx` (`userID`),
  KEY `listing_cat_fk_idx` (`category`),
  KEY `listing_subcat_fk_idx` (`sub_category`),
  CONSTRAINT `listing_subcat_fk` FOREIGN KEY (`sub_category`) REFERENCES `sub_category` (`sub_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing`
--

LOCK TABLES `listing` WRITE;
/*!40000 ALTER TABLE `listing` DISABLE KEYS */;
INSERT INTO `listing` VALUES (1,10,'Jersey','Brand New #6 Kings Jersey!','Apparell','Jersey',50,'auction','IMG-3.jpg',9,16,23,'2018-02-04 03:51:17','2018-02-27 04:01:45','2018-02-04 03:51:17',1,0),(2,10,'Desk','Desk','Furniture','Desk',40,'fixed','IMG-4.jpg',10,15,10,'2018-02-05 18:47:26','2018-02-28 18:47:26','2018-02-05 18:47:26',1,0),(3,9,'Test','test','School Supplies','Book',30,'auction','IMG-4.jpg',12,6,10,'2018-02-06 00:54:43','2018-02-27 15:47:26','2018-02-06 00:54:43',1,0),(4,12,'Gray Sofa','Gray Sofa','Furniture','Couch',30,'auction','couch.jpg',12,65,10,'2018-02-06 00:54:43','2018-03-01 00:54:43','2018-02-06 00:54:43',1,0),(5,12,'Couch','Used blue couch','Furniture','Couch',90,'fixed','sofa.jpg',12,20,10,'2018-02-06 00:54:43','2018-02-27 00:54:43','2018-02-06 00:54:43',1,0),(6,9,'Gaming Desk','Listing','Furniture','Desk',400,'auction','IMG-6.jpg',12,5,10,'2018-02-15 17:36:27','2018-02-28 17:36:27','2018-02-15 17:36:27',1,0);
/*!40000 ALTER TABLE `listing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_bid`
--

DROP TABLE IF EXISTS `listing_bid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_bid` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bid_value` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bid_id`),
  KEY `bid_listing_fk_idx` (`listing_id`),
  KEY `bid_user_fk_idx` (`user_id`),
  CONSTRAINT `bid_listing_fk` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `bid_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_bid`
--

LOCK TABLES `listing_bid` WRITE;
/*!40000 ALTER TABLE `listing_bid` DISABLE KEYS */;
INSERT INTO `listing_bid` VALUES (1,1,9,12,0,'2018-02-23 17:33:55'),(2,1,12,15,1,'2018-02-23 17:33:55'),(3,1,9,16,0,'2018-02-23 17:33:55'),(4,1,9,17,0,'2018-02-23 17:35:05'),(5,1,9,18,0,'2018-02-23 17:43:37'),(6,1,9,16,0,'2018-02-23 18:38:50'),(7,1,9,16,0,'2018-02-25 21:33:05'),(8,1,9,16,1,'2018-02-25 21:33:50');
/*!40000 ALTER TABLE `listing_bid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `message_ID` int(11) NOT NULL AUTO_INCREMENT,
  `conversation_ID` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message_body` mediumtext NOT NULL,
  `date_sent` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_ID`),
  KEY `message_Conversation_idx` (`conversation_ID`),
  CONSTRAINT `message_Conversation` FOREIGN KEY (`conversation_ID`) REFERENCES `conversation` (`conversation_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,9,'This is a test message.','2018-02-13 18:29:50');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `listing_id` int(11) NOT NULL,
  `subject` varchar(100) NOT NULL DEFAULT 'U-ListIt Notification',
  `message` varchar(2000) NOT NULL,
  `send_timestamp` timestamp NULL DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sent` tinyint(4) NOT NULL DEFAULT '0',
  `dismissed` tinyint(4) NOT NULL DEFAULT '0',
  `viewed` tinyint(4) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`notification_id`),
  KEY `not_listing_id_idx` (`listing_id`),
  KEY `not_user_id_idx` (`user_id`),
  CONSTRAINT `not_listing_id` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `not_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (59,9,1,'You Won!','You Won! \n Listing: Jersey','2018-02-21 19:06:35',1,'2018-02-21 19:04:34',1,1,1,1),(60,9,1,'Sold!','Sold! \n Listing: Jersey','2018-02-21 19:06:35',1,'2018-02-21 19:04:35',1,0,1,2),(61,9,1,'You Lost!','You Lost! \n Listing: Jersey','2018-02-21 19:06:35',0,'2018-02-21 19:04:35',1,0,0,4),(62,9,1,'Bid Successfully Cancelled','Your bid on listing Jersey has successfully been cancelled.','2018-02-23 17:35:51',1,'2018-02-23 17:35:51',1,0,1,1),(63,9,1,'You\'re Now The Highest Bidder!','Congratulations!\nThe highest bidder for listing Jersey cancelled his/her bid making you the new highest bidder!','2018-02-23 17:35:51',1,'2018-02-23 17:35:58',1,0,1,1),(64,10,1,'Bid Cancelled On Your Listing','The highest bid on listing Jersey has been cancelled.\nThe new highest bid has is ','2018-02-23 17:35:51',1,'2018-02-23 17:36:04',1,0,0,1),(65,9,1,'Bid Successfully Cancelled','Your bid on listing Jersey has successfully been cancelled.','2018-02-23 17:36:10',1,'2018-02-23 17:36:09',1,1,1,1),(66,12,1,'You\'re Now The Highest Bidder!','Congratulations!\nThe highest bidder for listing Jersey cancelled his/her bid making you the new highest bidder!','2018-02-23 17:36:10',1,'2018-02-23 17:36:15',1,0,0,1),(67,10,1,'Bid Cancelled On Your Listing','The highest bid on listing Jersey has been cancelled.\nThe new highest bid has is ','2018-02-23 17:36:10',1,'2018-02-23 17:36:20',1,0,0,1),(68,12,1,'U-ListIt Notification','You\'ve Be Outbit! Listing: Jersey','2018-02-23 18:38:50',1,'2018-02-23 18:38:50',1,0,0,0),(69,12,1,'U-ListIt Notification','You\'ve Be Outbit! Listing: Jersey','2018-02-25 21:33:06',1,'2018-02-25 21:33:05',1,0,0,0),(70,12,1,'U-ListIt Notification','You\'ve Be Outbit! Listing: Jersey','2018-02-25 21:33:51',1,'2018-02-25 21:33:50',1,0,0,0);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer`
--

DROP TABLE IF EXISTS `offer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offer` (
  `offer_id` int(11) NOT NULL AUTO_INCREMENT,
  `offer_amount` int(11) NOT NULL DEFAULT '0',
  `offer_message` varchar(500) DEFAULT NULL,
  `image_path` varchar(45) DEFAULT NULL,
  `listing_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'pending',
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`offer_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `listing_id_fk_idx` (`listing_id`),
  CONSTRAINT `listing_id_fk` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer`
--

LOCK TABLES `offer` WRITE;
/*!40000 ALTER TABLE `offer` DISABLE KEYS */;
INSERT INTO `offer` VALUES (1,50,'Please',NULL,1,9,'pending',1);
/*!40000 ALTER TABLE `offer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `reviewID` int(11) NOT NULL AUTO_INCREMENT,
  `sellerID` int(11) NOT NULL,
  `buyerID` int(11) NOT NULL,
  `review_listing` varchar(45) NOT NULL,
  `review_header` varchar(45) NOT NULL,
  `review_content` varchar(45) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewID`),
  KEY `sellerID` (`sellerID`),
  KEY `buyerID` (`buyerID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`sellerID`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`buyerID`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_searches`
--

DROP TABLE IF EXISTS `saved_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `search` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID_fk_idx` (`userID`),
  KEY `userID_search_fk_idx` (`userID`),
  CONSTRAINT `userID_search_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_searches`
--

LOCK TABLES `saved_searches` WRITE;
/*!40000 ALTER TABLE `saved_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_history`
--

DROP TABLE IF EXISTS `search_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_history` (
  `search_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `search` varchar(100) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `search_count` int(11) NOT NULL DEFAULT '1',
  `search_category` varchar(45) DEFAULT NULL,
  `search_subcategory` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`search_id`),
  KEY `search_h_user_fk_idx` (`user_id`),
  KEY `search_h_cat_fk_idx` (`search_category`),
  KEY `search_h_subcat_fk_idx` (`search_subcategory`),
  CONSTRAINT `search_h_cat_fk` FOREIGN KEY (`search_category`) REFERENCES `category` (`category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `search_h_subcat_fk` FOREIGN KEY (`search_subcategory`) REFERENCES `sub_category` (`sub_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `search_h_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_history`
--

LOCK TABLES `search_history` WRITE;
/*!40000 ALTER TABLE `search_history` DISABLE KEYS */;
INSERT INTO `search_history` VALUES (1,9,'blue couch','2018-02-25 18:09:40',2,NULL,'Couch'),(2,9,'used couch','2018-02-25 18:09:52',1,NULL,'Couch'),(3,9,'large tv','2018-02-25 18:10:05',1,NULL,'TV'),(4,9,'blue couch','2018-02-25 18:25:25',1,NULL,NULL),(5,9,'new jersey','2018-02-25 20:31:43',1,NULL,NULL),(8,9,'jersey','2018-02-25 21:08:26',1,NULL,'Jersey'),(9,9,'listing','2018-02-25 21:16:27',1,NULL,'Desk');
/*!40000 ALTER TABLE `search_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_category`
--

DROP TABLE IF EXISTS `sub_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_category` (
  `sub_category` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `created_by` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sub_category`),
  KEY `sub_cat_fk_idx` (`category`),
  KEY `sub_user_fk_idx` (`created_by`),
  CONSTRAINT `sub_cat_fk` FOREIGN KEY (`category`) REFERENCES `category` (`category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sub_user_fk` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_category`
--

LOCK TABLES `sub_category` WRITE;
/*!40000 ALTER TABLE `sub_category` DISABLE KEYS */;
INSERT INTO `sub_category` VALUES ('Book','School Supplies',9,'2018-02-25 19:47:04'),('Computer','Electronics',9,'2018-02-25 05:54:36'),('Couch','Furniture',9,'2018-02-25 18:33:15'),('Desk','Furniture',9,'2018-02-25 19:45:19'),('Hat','Apparel',9,'2018-02-25 05:54:36'),('Jersey','Apparel',9,'2018-02-25 19:47:36'),('Other','Other',9,'2018-02-25 19:41:58'),('T-Shirt','Apparel',9,'2018-02-25 05:54:36'),('TV','Electronics',9,'2018-02-25 05:54:36');
/*!40000 ALTER TABLE `sub_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction` (
  `transaction_ID` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_ID` int(11) NOT NULL,
  `seller_ID` int(11) NOT NULL,
  `listing_ID` int(11) NOT NULL,
  `transaction_type` varchar(30) DEFAULT NULL,
  `completed` tinyint(4) DEFAULT '0',
  `offer_ID` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transaction_ID`),
  KEY `listing_id_fk_idx` (`listing_ID`),
  CONSTRAINT `listing_fk` FOREIGN KEY (`listing_ID`) REFERENCES `listing` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (1,12,9,1,'pending',0,1,'2018-02-26 03:46:36','2018-02-26 03:46:36');
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `school_email` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `login_attempts` int(11) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '1',
  `admin_level` tinyint(4) NOT NULL DEFAULT '0',
  `image_path` varchar(45) DEFAULT 'default.jpeg',
  PRIMARY KEY (`user_ID`),
  UNIQUE KEY `user_ID_UNIQUE` (`user_ID`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `school_email_UNIQUE` (`school_email`),
  KEY `fk_user_security1_idx` (`login_attempts`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (9,'HamBoner69','Mark','Hammond','b2246523@ben.edu','','test',1,'2018-02-26 03:51:54','2018-02-26 03:51:54',0,0,3,'default.jpeg'),(10,'TrumpADump','Jacob','Trumpis','b2228549@ben.edu','','password',1,'2018-02-26 03:54:38','2018-02-26 03:54:38',0,0,3,'default.jpeg'),(12,'KuehlGuy','Corey','Kuehl','b2193038@ben.edu','kuehlcorey17@gmail.com','password',1,'2018-02-26 03:51:32','2018-02-26 03:51:32',0,0,3,'default.jpeg'),(14,'OnePumpSteve','Steve','Schultz','b2273469@ben.edu','','password',1,'2018-02-26 03:51:32','2018-02-26 03:51:32',0,0,3,'default.jpeg'),(15,'bobjak','Bob','Jak','bobjak@gmail.com','bobjak@gmail.com','password',1,'2018-02-26 03:51:33','2018-02-26 03:51:33',0,0,3,'default.jpeg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-25 22:10:36
