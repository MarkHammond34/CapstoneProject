ALTER TABLE `ulistit`.`listing` 
ADD COLUMN `ended` TINYINT(4) NOT NULL DEFAULT 0 AFTER `active`;

ALTER TABLE `ulistit`.`notification` 
ADD COLUMN `sent` TINYINT(4) NOT NULL DEFAULT 0 AFTER `date_created`;