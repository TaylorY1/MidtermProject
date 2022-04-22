-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema fursurancedb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `fursurancedb` ;

-- -----------------------------------------------------
-- Schema fursurancedb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `fursurancedb` DEFAULT CHARACTER SET utf8 ;
USE `fursurancedb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quote_id` VARCHAR(45) NULL,
  `password` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `username` VARCHAR(45) NOT NULL,
  `active` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quote` ;

CREATE TABLE IF NOT EXISTS `quote` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pet_id` VARCHAR(45) NULL,
  `deductible` VARCHAR(45) NULL,
  `risk_score` DOUBLE NULL,
  `coupon` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `premium` DOUBLE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_quote_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_quote_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `species`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `species` ;

CREATE TABLE IF NOT EXISTS `species` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `breed`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `breed` ;

CREATE TABLE IF NOT EXISTS `breed` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `species_id` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet` ;

CREATE TABLE IF NOT EXISTS `pet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `conditions` VARCHAR(45) NULL,
  `zodiak` VARCHAR(45) NULL,
  `birthdate` VARCHAR(45) NULL,
  `age` INT NOT NULL,
  `species_id` INT NOT NULL,
  `vaccinated` TINYINT NULL,
  `breed_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `breed_id`, `user_id`),
  INDEX `fk_pet_species_idx` (`species_id` ASC),
  INDEX `fk_pet_breed1_idx` (`breed_id` ASC),
  INDEX `fk_pet_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_pet_species`
    FOREIGN KEY (`species_id`)
    REFERENCES `species` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_breed1`
    FOREIGN KEY (`breed_id`)
    REFERENCES `breed` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `postal_code` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `vet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vet` ;

CREATE TABLE IF NOT EXISTS `vet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vet_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_vet_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `premium`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `premium` ;

CREATE TABLE IF NOT EXISTS `premium` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `amount` DOUBLE NULL,
  `quote_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_premium_quote1_idx` (`quote_id` ASC),
  CONSTRAINT `fk_premium_quote1`
    FOREIGN KEY (`quote_id`)
    REFERENCES `quote` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS insuranceuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'insuranceuser'@'localhost' IDENTIFIED BY 'insurance';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'insuranceuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `user` (`id`, `quote_id`, `password`, `first_name`, `last_name`, `username`, `active`, `role`) VALUES (1, NULL, 'admin', NULL, NULL, 'admin', 1, NULL);
INSERT INTO `user` (`id`, `quote_id`, `password`, `first_name`, `last_name`, `username`, `active`, `role`) VALUES (2, NULL, 'test', NULL, NULL, 'tester', 2, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `quote`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `quote` (`id`, `pet_id`, `deductible`, `risk_score`, `coupon`, `user_id`, `premium`) VALUES (1, '21', '200', 50, 'no', 2, 120.67);

COMMIT;


-- -----------------------------------------------------
-- Data for table `species`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `species` (`id`, `name`) VALUES (1, 'dog');
INSERT INTO `species` (`id`, `name`) VALUES (2, 'cat');
INSERT INTO `species` (`id`, `name`) VALUES (3, 'other');

COMMIT;


-- -----------------------------------------------------
-- Data for table `breed`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (1, 'chihuahua', '1');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (2, 'golden_retriever', '1');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (3, 'labrador', '1');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (4, 'poodle', '1');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (5, 'husky', '1');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (6, 'aussie', '1');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (7, 'bernese', '1');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (8, 'malamute', '1');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (9, 'mutt', '1');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (10, 'pitbull', '1');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (11, 'siamese', '2');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (12, 'bengal', '2');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (13, 'persian', '2');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (14, 'sphynx', '2');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (15, 'ragdoll', '2');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (16, 'bombay', '2');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (17, 'toyger', '2');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (18, 'kinkalow', '2');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (19, 'ragamuffin', '2');
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (20, 'korat', '2');

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `pet` (`id`, `name`, `gender`, `conditions`, `zodiak`, `birthdate`, `age`, `species_id`, `vaccinated`, `breed_id`, `user_id`) VALUES (1, 'sparky', 'male', NULL, NULL, NULL, 7, 1, NULL, 1, DEFAULT);
INSERT INTO `pet` (`id`, `name`, `gender`, `conditions`, `zodiak`, `birthdate`, `age`, `species_id`, `vaccinated`, `breed_id`, `user_id`) VALUES (2, 'rex', 'male', NULL, NULL, NULL, 6, 2, NULL, 2, DEFAULT);

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `address` (`id`, `address`, `city`, `state`, `postal_code`, `country`, `phone`) VALUES (1, '11 woof lane', 'London', 'wa', '80111', 'merica', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `premium`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `premium` (`id`, `name`, `amount`, `quote_id`) VALUES (1, 'bronze', 80.22, DEFAULT);

COMMIT;

