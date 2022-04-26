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
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` CHAR(2) NULL,
  `postal_code` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `password` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `username` VARCHAR(45) NOT NULL,
  `active` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  `address_id` INT NOT NULL,
  `phone` VARCHAR(45) NULL,
  `photo_url` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_user_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_user_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
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
  `species_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_breed_species1_idx` (`species_id` ASC),
  CONSTRAINT `fk_breed_species1`
    FOREIGN KEY (`species_id`)
    REFERENCES `species` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet` ;

CREATE TABLE IF NOT EXISTS `pet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `overview` TEXT NULL,
  `birthdate` DATE NOT NULL,
  `species_id` INT NOT NULL,
  `breed_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `photo_url` VARCHAR(1000) NULL,
  PRIMARY KEY (`id`),
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
-- Table `plan`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plan` ;

CREATE TABLE IF NOT EXISTS `plan` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(500) NULL,
  `base_premium` DOUBLE NULL,
  `deductible` DOUBLE NULL,
  `base_coverage` DOUBLE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `plan_tier`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plan_tier` ;

CREATE TABLE IF NOT EXISTS `plan_tier` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `coverage_adjustment` DOUBLE NULL,
  `deductible_adjustment` DOUBLE NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `quote`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `quote` ;

CREATE TABLE IF NOT EXISTS `quote` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `deductible` DECIMAL(8,2) NULL,
  `risk_score` DOUBLE NULL,
  `coupon_code` VARCHAR(45) NULL,
  `user_id` INT NOT NULL,
  `premium` DOUBLE NULL,
  `pet_id` INT NOT NULL,
  `quote_date` DATETIME NULL,
  `coverage` INT NULL,
  `plan_id` INT NOT NULL,
  `plan_tier_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_quote_user1_idx` (`user_id` ASC),
  INDEX `fk_quote_pet1_idx` (`pet_id` ASC),
  INDEX `fk_quote_plan1_idx` (`plan_id` ASC),
  INDEX `fk_quote_plan_tier1_idx` (`plan_tier_id` ASC),
  CONSTRAINT `fk_quote_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quote_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `pet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quote_plan1`
    FOREIGN KEY (`plan_id`)
    REFERENCES `plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quote_plan_tier1`
    FOREIGN KEY (`plan_tier_id`)
    REFERENCES `plan_tier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
-- Table `vaccine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `vaccine` ;

CREATE TABLE IF NOT EXISTS `vaccine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_vaccination`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet_vaccination` ;

CREATE TABLE IF NOT EXISTS `pet_vaccination` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vax_date` DATE NULL,
  `pet_id` INT NOT NULL,
  `vaccination_id` INT NOT NULL,
  `term` INT NULL COMMENT 'Time until next shot',
  PRIMARY KEY (`id`),
  INDEX `fk_pet_vaccination_pet1_idx` (`pet_id` ASC),
  INDEX `fk_pet_vaccination_vaccination1_idx` (`vaccination_id` ASC),
  CONSTRAINT `fk_pet_vaccination_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `pet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_vaccination_vaccination1`
    FOREIGN KEY (`vaccination_id`)
    REFERENCES `vaccine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `medical_condition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `medical_condition` ;

CREATE TABLE IF NOT EXISTS `medical_condition` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `risk_factor` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pet_has_medical_condition`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet_has_medical_condition` ;

CREATE TABLE IF NOT EXISTS `pet_has_medical_condition` (
  `pet_id` INT NOT NULL,
  `medical_condition_id` INT NOT NULL,
  PRIMARY KEY (`pet_id`, `medical_condition_id`),
  INDEX `fk_pet_has_medical_condition_medical_condition1_idx` (`medical_condition_id` ASC),
  INDEX `fk_pet_has_medical_condition_pet1_idx` (`pet_id` ASC),
  CONSTRAINT `fk_pet_has_medical_condition_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `pet` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pet_has_medical_condition_medical_condition1`
    FOREIGN KEY (`medical_condition_id`)
    REFERENCES `medical_condition` (`id`)
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
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `address` (`id`, `street`, `city`, `state`, `postal_code`, `country`) VALUES (1, '11 woof lane', 'London', 'wa', '80111', 'merica');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `user` (`id`, `password`, `first_name`, `last_name`, `username`, `active`, `role`, `address_id`, `phone`, `photo_url`) VALUES (1, 'admin', NULL, NULL, 'admin', 1, NULL, 1, NULL, NULL);
INSERT INTO `user` (`id`, `password`, `first_name`, `last_name`, `username`, `active`, `role`, `address_id`, `phone`, `photo_url`) VALUES (2, 'test', NULL, NULL, 'tester', 2, NULL, 1, NULL, NULL);

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
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (1, 'chihuahua', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (2, 'golden_retriever', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (3, 'labrador', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (4, 'poodle', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (5, 'husky', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (6, 'aussie', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (7, 'bernese', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (8, 'malamute', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (9, 'mutt', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (10, 'pitbull', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (11, 'siamese', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (12, 'bengal', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (13, 'persian', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (14, 'sphynx', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (15, 'ragdoll', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (16, 'bombay', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (17, 'toyger', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (18, 'kinkalow', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (19, 'ragamuffin', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (20, 'korat', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `pet` (`id`, `name`, `gender`, `overview`, `birthdate`, `species_id`, `breed_id`, `user_id`, `photo_url`) VALUES (1, 'sparky', 'male', NULL, '2018-11-13', 1, 1, 1, NULL);
INSERT INTO `pet` (`id`, `name`, `gender`, `overview`, `birthdate`, `species_id`, `breed_id`, `user_id`, `photo_url`) VALUES (2, 'rex', 'male', NULL, '2017-09-08', 2, 1, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plan`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `plan` (`id`, `name`, `description`, `base_premium`, `deductible`, `base_coverage`) VALUES (1, 'bronze', 'Covers emergency visits', 30, 700, 2000);
INSERT INTO `plan` (`id`, `name`, `description`, `base_premium`, `deductible`, `base_coverage`) VALUES (2, 'silver', 'Covers emergency visits, vaccinations', 80, 400, 5000);
INSERT INTO `plan` (`id`, `name`, `description`, `base_premium`, `deductible`, `base_coverage`) VALUES (3, 'gold', 'Covers emergency visits, vaccinations, dental, and preventative care ', 120, 0, 9999);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plan_tier`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `plan_tier` (`id`, `name`, `coverage_adjustment`, `deductible_adjustment`) VALUES (1, 'bronze', 80.22, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `quote`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `quote` (`id`, `deductible`, `risk_score`, `coupon_code`, `user_id`, `premium`, `pet_id`, `quote_date`, `coverage`, `plan_id`, `plan_tier_id`) VALUES (1, 200, 50, 'no', 2, 120.67, 1, NULL, NULL, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vet`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `vet` (`id`, `name`, `address_id`) VALUES (1, 'harry', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vaccine`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (1, 'bordetella', 'desc');

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet_vaccination`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `pet_vaccination` (`id`, `vax_date`, `pet_id`, `vaccination_id`, `term`) VALUES (1, '2016-08-12', 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `medical_condition`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `medical_condition` (`id`, `name`, `description`, `risk_factor`) VALUES (1, 'worms', 'itchy bum', 50);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet_has_medical_condition`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `pet_has_medical_condition` (`pet_id`, `medical_condition_id`) VALUES (1, 1);

COMMIT;

