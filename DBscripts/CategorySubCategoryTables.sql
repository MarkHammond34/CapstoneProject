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
-- Table `ulistit`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ulistit`.`category` (
  `category` VARCHAR(45) NOT NULL,
  `created_by` INT NOT NULL,
  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category`),
  INDEX `cat_user_fk_idx` (`created_by` ASC),
  CONSTRAINT `cat_user_fk`
    FOREIGN KEY (`created_by`)
    REFERENCES `ulistit`.`user` (`user_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `ulistit`.`sub_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ulistit`.`sub_category` (
  `sub_category` VARCHAR(45) NOT NULL,
  `category` VARCHAR(45) NOT NULL,
  `created_by` INT NOT NULL,
  `date_created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sub_category`),
  INDEX `sub_cat_fk_idx` (`category` ASC),
  INDEX `sub_user_fk_idx` (`created_by` ASC),
  CONSTRAINT `sub_cat_fk`
    FOREIGN KEY (`category`)
    REFERENCES `ulistit`.`category` (`category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sub_user_fk`
    FOREIGN KEY (`created_by`)
    REFERENCES `ulistit`.`user` (`user_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
