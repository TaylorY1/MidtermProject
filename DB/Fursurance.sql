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


-- -----------------------------------------------------
-- Table `pet_has_vaccine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pet_has_vaccine` ;

CREATE TABLE IF NOT EXISTS `pet_has_vaccine` (
  `vaccine_id` INT NOT NULL,
  `pet_id` INT NOT NULL,
  PRIMARY KEY (`vaccine_id`, `pet_id`),
  INDEX `fk_vaccine_has_pet_pet1_idx` (`pet_id` ASC),
  INDEX `fk_vaccine_has_pet_vaccine1_idx` (`vaccine_id` ASC),
  CONSTRAINT `fk_vaccine_has_pet_vaccine1`
    FOREIGN KEY (`vaccine_id`)
    REFERENCES `vaccine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vaccine_has_pet_pet1`
    FOREIGN KEY (`pet_id`)
    REFERENCES `pet` (`id`)
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
INSERT INTO `address` (`id`, `street`, `city`, `state`, `postal_code`, `country`) VALUES (1, '11 woof lane', 'Denver', 'CO', '80210', 'USA');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `postal_code`, `country`) VALUES (2, '0900 Merica Lane', 'Detroit', 'MI', '48127', 'USA');
INSERT INTO `address` (`id`, `street`, `city`, `state`, `postal_code`, `country`) VALUES (3, '1883 Prospector Way', 'Portland', 'OR', '97035', 'USA');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `user` (`id`, `password`, `first_name`, `last_name`, `username`, `active`, `role`, `address_id`, `phone`, `photo_url`) VALUES (1, 'admin', NULL, NULL, 'admin', 1, NULL, 1, '7224446767', NULL);
INSERT INTO `user` (`id`, `password`, `first_name`, `last_name`, `username`, `active`, `role`, `address_id`, `phone`, `photo_url`) VALUES (2, 'test', NULL, NULL, 'tester', 2, NULL, 1, '8999988766', NULL);
INSERT INTO `user` (`id`, `password`, `first_name`, `last_name`, `username`, `active`, `role`, `address_id`, `phone`, `photo_url`) VALUES (3, 'test', 'Frank', 'Federschmidt', 'FranktheTank', 2, NULL, 1, '3038675309', NULL);
INSERT INTO `user` (`id`, `password`, `first_name`, `last_name`, `username`, `active`, `role`, `address_id`, `phone`, `photo_url`) VALUES (4, 'test', 'Carrie', 'Carhardt', 'CarsgoFar', 3, NULL, 1, '3038678909', NULL);
INSERT INTO `user` (`id`, `password`, `first_name`, `last_name`, `username`, `active`, `role`, `address_id`, `phone`, `photo_url`) VALUES (5, 'test', 'Beatrice', 'Bumbleburger', 'Betty2Strings', 4, NULL, 1, '3039875309', NULL);
INSERT INTO `user` (`id`, `password`, `first_name`, `last_name`, `username`, `active`, `role`, `address_id`, `phone`, `photo_url`) VALUES (6, 'test', 'Howard', 'Halitosis', 'MasksforLife', 5, NULL, 1, '3038675543', NULL);
INSERT INTO `user` (`id`, `password`, `first_name`, `last_name`, `username`, `active`, `role`, `address_id`, `phone`, `photo_url`) VALUES (7, 'test', 'Jeremy', 'Jenkins', 'Jenkyboy', 6, NULL, 1, '3025375309', NULL);
INSERT INTO `user` (`id`, `password`, `first_name`, `last_name`, `username`, `active`, `role`, `address_id`, `phone`, `photo_url`) VALUES (8, 'test', 'Paul', 'Pumpkinhead', 'PumpandDump', 7, NULL, 1, '3035555309', NULL);

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
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (1, 'Chihuahua', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (2, 'Golden Retriever', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (3, 'Labrador', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (4, 'Poodle', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (5, 'Husky', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (6, 'Aussie', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (7, 'Bernese', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (8, 'Malamute', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (9, 'Mutt', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (10, 'Pitbull', 1);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (11, 'Siamese', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (12, 'Bengal', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (13, 'Persian', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (14, 'Sphynx', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (15, 'Ragdoll', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (16, 'Bombay', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (17, 'Toyger', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (18, 'Kinkalow', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (19, 'Ragamuffin', 2);
INSERT INTO `breed` (`id`, `name`, `species_id`) VALUES (20, 'Korat', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `pet` (`id`, `name`, `gender`, `overview`, `birthdate`, `species_id`, `breed_id`, `user_id`, `photo_url`) VALUES (1, 'Sparky', 'male', NULL, '2018-11-13', 1, 1, 1, NULL);
INSERT INTO `pet` (`id`, `name`, `gender`, `overview`, `birthdate`, `species_id`, `breed_id`, `user_id`, `photo_url`) VALUES (2, 'Rex', 'male', NULL, '2017-09-08', 2, 1, 1, NULL);
INSERT INTO `pet` (`id`, `name`, `gender`, `overview`, `birthdate`, `species_id`, `breed_id`, `user_id`, `photo_url`) VALUES (3, 'LadyBird', 'female', NULL, '2015-11-09', 1, 4, 2, NULL);
INSERT INTO `pet` (`id`, `name`, `gender`, `overview`, `birthdate`, `species_id`, `breed_id`, `user_id`, `photo_url`) VALUES (4, 'Spike', 'male', NULL, '2019-09-14', 1, 6, 3, NULL);
INSERT INTO `pet` (`id`, `name`, `gender`, `overview`, `birthdate`, `species_id`, `breed_id`, `user_id`, `photo_url`) VALUES (5, 'Princess', 'female', NULL, '2017-07-13', 1, 5, 3, NULL);
INSERT INTO `pet` (`id`, `name`, `gender`, `overview`, `birthdate`, `species_id`, `breed_id`, `user_id`, `photo_url`) VALUES (6, 'Darwin', 'male', NULL, '2017-09-19', 2, 12, 3, NULL);
INSERT INTO `pet` (`id`, `name`, `gender`, `overview`, `birthdate`, `species_id`, `breed_id`, `user_id`, `photo_url`) VALUES (7, 'Stella', 'female', NULL, '2020-06-13', 1, 3, 4, NULL);
INSERT INTO `pet` (`id`, `name`, `gender`, `overview`, `birthdate`, `species_id`, `breed_id`, `user_id`, `photo_url`) VALUES (8, 'Ragnar', 'male', NULL, '2019-07-18', 1, 6, 2, NULL);
INSERT INTO `pet` (`id`, `name`, `gender`, `overview`, `birthdate`, `species_id`, `breed_id`, `user_id`, `photo_url`) VALUES (9, 'Lelo', 'female', NULL, '2015-05-12', 2, 10, 5, NULL);
INSERT INTO `pet` (`id`, `name`, `gender`, `overview`, `birthdate`, `species_id`, `breed_id`, `user_id`, `photo_url`) VALUES (10, 'Paris', 'female', NULL, '2017-05-10', 2, 13, 6, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plan`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `plan` (`id`, `name`, `description`, `base_premium`, `deductible`, `base_coverage`) VALUES (1, 'Bronze', 'Covers emergency visits', 30, 700, 2000);
INSERT INTO `plan` (`id`, `name`, `description`, `base_premium`, `deductible`, `base_coverage`) VALUES (2, 'Silver', 'Covers emergency visits, vaccinations', 80, 400, 5000);
INSERT INTO `plan` (`id`, `name`, `description`, `base_premium`, `deductible`, `base_coverage`) VALUES (3, 'Gold', 'Covers emergency visits, vaccinations, dental, and preventative care ', 120, 0, 9999);

COMMIT;


-- -----------------------------------------------------
-- Data for table `plan_tier`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `plan_tier` (`id`, `name`, `coverage_adjustment`, `deductible_adjustment`) VALUES (1, 'Bronze', 80.22, 110.75);
INSERT INTO `plan_tier` (`id`, `name`, `coverage_adjustment`, `deductible_adjustment`) VALUES (2, 'Silver', 99.4, 84.99);
INSERT INTO `plan_tier` (`id`, `name`, `coverage_adjustment`, `deductible_adjustment`) VALUES (3, 'Gold', 117.99, 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `quote`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `quote` (`id`, `deductible`, `risk_score`, `coupon_code`, `user_id`, `premium`, `pet_id`, `quote_date`, `coverage`, `plan_id`, `plan_tier_id`) VALUES (1, 200, 50, 'no', 1, 120.67, 1, '2020-02-23 11:23:14', NULL, 1, 1);
INSERT INTO `quote` (`id`, `deductible`, `risk_score`, `coupon_code`, `user_id`, `premium`, `pet_id`, `quote_date`, `coverage`, `plan_id`, `plan_tier_id`) VALUES (2, 200, 50, 'no', 2, 222.2, 2, '2021-08-27 10:29:18', NULL, 2, 2);
INSERT INTO `quote` (`id`, `deductible`, `risk_score`, `coupon_code`, `user_id`, `premium`, `pet_id`, `quote_date`, `coverage`, `plan_id`, `plan_tier_id`) VALUES (3, 400, 50, 'no', 3, 443.3, 3, '2021-08-24 10:32:18', NULL, 3, 2);
INSERT INTO `quote` (`id`, `deductible`, `risk_score`, `coupon_code`, `user_id`, `premium`, `pet_id`, `quote_date`, `coverage`, `plan_id`, `plan_tier_id`) VALUES (4, 99, 75, 'no', 3, 227.7, 4, '2021-08-21 12:45:18', NULL, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vet`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `vet` (`id`, `name`, `address_id`) VALUES (1, 'Izzy InjectaCat', 1);
INSERT INTO `vet` (`id`, `name`, `address_id`) VALUES (2, 'Sally SavesaDog', 2);
INSERT INTO `vet` (`id`, `name`, `address_id`) VALUES (3, 'Frank Ferret\'Whisperer', 3);
INSERT INTO `vet` (`id`, `name`, `address_id`) VALUES (4, 'Terry Tortoise\'Healer', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `vaccine`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (1, 'Bordetella', 'Non-core dog vaccine. Not usually a serious condition, although it can be dangerous in young puppies. It is usually seen after activities like boarding or showing.');
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (2, 'Rabies', 'Core dog vaccine. Rabies is 100% fatal to dogs, with no treatment available. Prevention is key.');
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (3, 'Distemper', 'Core dog vaccine. Caused by an airborne virus, distemper is a severe disease that, among other problems, may cause permanent brain damage.');
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (4, 'Parvovirus', 'Core dog vaccine. Canine \"parvo\" is contagious, and can cause severe vomiting and bloody diarrhea. Parvo is usually fatal if untreated.');
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (5, 'Parainfluenza', 'Non-core dog vaccine. Parainfluenza infection (not the same as canine influenza) results in cough, fever. It may be associated with Bordetella infection.');
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (6, 'Leptospirosis', 'Non-core dog vaccine. Vaccination is generally restricted to established risk areas. Exposure to rodents and standing water can lead to a leptospirosis infection.');
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (7, 'Lyme disease', 'Non-core dog vaccine. Generally recommended only for dogs with a high risk for exposure to Lyme disease-carrying ticks.');
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (8, 'Adenovirus, type 2 (CAV-2, kennel cough)', 'Core dog vaccine. Spread via coughs and sneezes.');
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (9, 'Adenovirus,  type 1 (CAV-1, canine hepatitis)', 'Core dog vaccine. Spread via infected saliva, urine and feces; canine hepatitis can lead to severe liver damage, and death.');
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (10, 'Feline Herpesvirus', 'Core cat vaccine. Feline herpesvirus causes feline viral rhinotracheitis (FVR), a very contagious upper respiratory condition.');
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (11, 'Calicivirus', 'Core cat vaccine. A very contagious upper respiratory condition that can cause joint pain, oral ulcerations, fever, and anorexia.');
INSERT INTO `vaccine` (`id`, `name`, `description`) VALUES (12, 'Feline Leukemia Virus (FeLV)', 'Non-core cat vaccine.\nShould test FeLV negative first. Transmitted via cat-to-cat contact. Can cause cancer, immunosuppressant');

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet_vaccination`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `pet_vaccination` (`id`, `vax_date`, `pet_id`, `vaccination_id`, `term`) VALUES (1, '2016-08-12', 1, 1, 1);
INSERT INTO `pet_vaccination` (`id`, `vax_date`, `pet_id`, `vaccination_id`, `term`) VALUES (2, '2018-09-23', 2, 2, 2);
INSERT INTO `pet_vaccination` (`id`, `vax_date`, `pet_id`, `vaccination_id`, `term`) VALUES (3, '2021-11-03', 3, 3, 3);
INSERT INTO `pet_vaccination` (`id`, `vax_date`, `pet_id`, `vaccination_id`, `term`) VALUES (4, '2022-01-27', 4, 4, 4);
INSERT INTO `pet_vaccination` (`id`, `vax_date`, `pet_id`, `vaccination_id`, `term`) VALUES (5, '2017-03-08', 5, 5, 5);
INSERT INTO `pet_vaccination` (`id`, `vax_date`, `pet_id`, `vaccination_id`, `term`) VALUES (6, '2020-12-12', 4, 3, 4);
INSERT INTO `pet_vaccination` (`id`, `vax_date`, `pet_id`, `vaccination_id`, `term`) VALUES (7, '2019-09-20', 7, 4, 3);
INSERT INTO `pet_vaccination` (`id`, `vax_date`, `pet_id`, `vaccination_id`, `term`) VALUES (8, '2016-11-24', 8, 3, 4);
INSERT INTO `pet_vaccination` (`id`, `vax_date`, `pet_id`, `vaccination_id`, `term`) VALUES (9, '2020-11-03', 9, 5, 3);
INSERT INTO `pet_vaccination` (`id`, `vax_date`, `pet_id`, `vaccination_id`, `term`) VALUES (10, '2015-07-08', 10, 4, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `medical_condition`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `medical_condition` (`id`, `name`, `description`, `risk_factor`) VALUES (1, 'Worms', 'itchy bum', 50);
INSERT INTO `medical_condition` (`id`, `name`, `description`, `risk_factor`) VALUES (2, 'Cancer', 'abnormal cell growth', 75);
INSERT INTO `medical_condition` (`id`, `name`, `description`, `risk_factor`) VALUES (3, 'Parvovirus', 'acute gastrointestinal illness', 50);
INSERT INTO `medical_condition` (`id`, `name`, `description`, `risk_factor`) VALUES (4, 'Leptospirosis', 'spirochete bacterial infection', 50);
INSERT INTO `medical_condition` (`id`, `name`, `description`, `risk_factor`) VALUES (5, 'Distemper', 'viral disease', 50);
INSERT INTO `medical_condition` (`id`, `name`, `description`, `risk_factor`) VALUES (6, 'Heartworm', 'blood-borne parasitic infection', 50);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet_has_medical_condition`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `pet_has_medical_condition` (`pet_id`, `medical_condition_id`) VALUES (1, 1);
INSERT INTO `pet_has_medical_condition` (`pet_id`, `medical_condition_id`) VALUES (2, 2);
INSERT INTO `pet_has_medical_condition` (`pet_id`, `medical_condition_id`) VALUES (3, 3);
INSERT INTO `pet_has_medical_condition` (`pet_id`, `medical_condition_id`) VALUES (4, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `pet_has_vaccine`
-- -----------------------------------------------------
START TRANSACTION;
USE `fursurancedb`;
INSERT INTO `pet_has_vaccine` (`vaccine_id`, `pet_id`) VALUES (1, 1);
INSERT INTO `pet_has_vaccine` (`vaccine_id`, `pet_id`) VALUES (2, 2);
INSERT INTO `pet_has_vaccine` (`vaccine_id`, `pet_id`) VALUES (3, 3);
INSERT INTO `pet_has_vaccine` (`vaccine_id`, `pet_id`) VALUES (4, 4);
INSERT INTO `pet_has_vaccine` (`vaccine_id`, `pet_id`) VALUES (5, 5);
INSERT INTO `pet_has_vaccine` (`vaccine_id`, `pet_id`) VALUES (6, 6);
INSERT INTO `pet_has_vaccine` (`vaccine_id`, `pet_id`) VALUES (7, 7);
INSERT INTO `pet_has_vaccine` (`vaccine_id`, `pet_id`) VALUES (8, 8);
INSERT INTO `pet_has_vaccine` (`vaccine_id`, `pet_id`) VALUES (9, 9);
INSERT INTO `pet_has_vaccine` (`vaccine_id`, `pet_id`) VALUES (10, 10);

COMMIT;

