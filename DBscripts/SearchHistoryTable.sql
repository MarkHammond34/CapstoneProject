CREATE TABLE IF NOT EXISTS `ulistit`.`search_history` (
  `search_id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `search` VARCHAR(100) NOT NULL,
  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`search_id`));
  
ALTER TABLE `ulistit`.`search_history` 
ADD COLUMN `search_count` INT(11) NOT NULL DEFAULT 1 AFTER `date_created`;

ALTER TABLE `ulistit`.`search_history` 
ADD INDEX `search_h_user_fk_idx` (`user_id` ASC);
ALTER TABLE `ulistit`.`search_history` 
ADD CONSTRAINT `search_h_user_fk`
  FOREIGN KEY (`user_id`)
  REFERENCES `ulistit`.`user` (`user_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
  ALTER TABLE `ulistit`.`search_history` 
ADD COLUMN `search_category` VARCHAR(45) NULL AFTER `search_count`;

ALTER TABLE `ulistit`.`search_history` 
ADD COLUMN `search_subcategory` VARCHAR(45) NULL AFTER `search_category`;

ALTER TABLE `ulistit`.`search_history` 
ADD INDEX `search_h_subcat_fk_idx` (`search_subcategory` ASC);
ALTER TABLE `ulistit`.`search_history` 
ADD CONSTRAINT `search_h_subcat_fk`
  FOREIGN KEY (`search_subcategory`)
  REFERENCES `ulistit`.`sub_category` (`sub_category`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
  
ALTER TABLE `ulistit`.`search_history` 
ADD INDEX `search_h_cat_fk_idx` (`search_category` ASC);
ALTER TABLE `ulistit`.`search_history` 
ADD CONSTRAINT `search_h_cat_fk`
  FOREIGN KEY (`search_category`)
  REFERENCES `ulistit`.`category` (`category`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;