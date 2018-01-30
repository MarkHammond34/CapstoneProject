CREATE TABLE IF NOT EXISTS `ulistit`.`listing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL DEFAULT 'default',
  `description` varchar(45) DEFAULT NULL,
  `category` varchar(45) NOT NULL DEFAULT 'other',
  `price` double NOT NULL DEFAULT '0',
  `date_created` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `image_path` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userID_fk_idx` (`userID`),
  CONSTRAINT `userID_fk` FOREIGN KEY (`userID`) REFERENCES `user` (`user_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8