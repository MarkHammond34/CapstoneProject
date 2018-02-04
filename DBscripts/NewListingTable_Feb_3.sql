CREATE TABLE `listing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL DEFAULT 'default',
  `description` varchar(45) DEFAULT NULL,
  `category` varchar(45) NOT NULL DEFAULT 'other',
  `price` double NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `image_path` varchar(45) NOT NULL,
  `highest_bid_userID` int(11) DEFAULT NULL,
  `highest_bid` double DEFAULT NULL,
  `bid_count` int(11) DEFAULT NULL,
  `start_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_timestamp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userID_fk_idx` (`userID`),
  CONSTRAINT `userID_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
)
