-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ulistit
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ulistit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ulistit` DEFAULT CHARACTER SET utf8 ;
USE `ulistit` ;

-- -----------------------------------------------------
-- Table `ulistit`.`security`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ulistit`.`security` (
  `security_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `login_attempts` INT(11) NOT NULL DEFAULT '0',
  `locked` TINYINT(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`security_ID`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ulistit`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ulistit`.`user` (
  `user_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `school_email` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `password` VARCHAR(45) NOT NULL,
  `active` TINYINT(4) NOT NULL,
  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_modified` TIMESTAMP NULL DEFAULT NULL,
  `security_ID` INT(11) NOT NULL,
  PRIMARY KEY (`user_ID`),
  UNIQUE INDEX `user_ID_UNIQUE` (`user_ID` ASC),
  INDEX `fk_user_security1_idx` (`security_ID` ASC),
  CONSTRAINT `fk_user_security1`
    FOREIGN KEY (`security_ID`)
    REFERENCES `ulistit`.`security` (`security_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ulistit`.`listing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ulistit`.`listing` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `userID` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL DEFAULT 'default',
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `category` VARCHAR(45) NOT NULL DEFAULT 'other',
  `price` DOUBLE NOT NULL DEFAULT '0',
  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image_path` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `userID_fk_idx` (`userID` ASC),
  CONSTRAINT `userID_fk`
    FOREIGN KEY (`userID`)
    REFERENCES `ulistit`.`user` (`user_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `ulistit`.`transaction`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ulistit`.`transaction` (
  `transaction_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `buyer_ID` INT(11) NOT NULL,
  `seller_ID` INT(11) NOT NULL,
  `listing_ID` INT(11) NOT NULL,
  `transaction_type` VARCHAR(30) NOT NULL,
  `user_ID` INT(11) NOT NULL,
  `user_security_ID` INT(11) NOT NULL,
  PRIMARY KEY (`transaction_ID`),
  INDEX `fk_transaction_user1_idx` (`user_ID` ASC, `user_security_ID` ASC),
  CONSTRAINT `fk_transaction_user1`
    FOREIGN KEY (`user_ID`)
    REFERENCES `ulistit`.`user` (`user_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
