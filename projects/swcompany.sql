-- MySQL Script generated by MySQL Workbench
-- Tue May 18 18:07:58 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `swcompanydb` ;
CREATE DATABASE  swcompanydb;
USE swcompanydb;

-- -----------------------------------------------------
-- Table `Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Address` ;

CREATE TABLE IF NOT EXISTS `Address` (
  `addr_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `zipcode` TINYINT(5) UNSIGNED ZEROFILL NULL,
  `country` VARCHAR(45) NOT NULL,
  `state` CHAR(10) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`addr_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Company` ;

CREATE TABLE IF NOT EXISTS `Company` (
  `name` VARCHAR(55) NOT NULL,
  `company_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`company_id`),
  UNIQUE INDEX `company_id_UNIQUE` (`company_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `User` ;

CREATE TABLE IF NOT EXISTS `User` (
  `user_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL DEFAULT 'CONCAT(fname,\' \',middlename,\' \',lname)',
  `fname` VARCHAR(45) NOT NULL,
  `middlename` VARCHAR(45) NOT NULL,
  `addr_id` TINYINT UNSIGNED NULL,
  `lname` VARCHAR(45) NOT NULL,
  `company_id` TINYINT UNSIGNED NULL,
  PRIMARY KEY (`user_id`, `email`),
  INDEX `FK_addr_id_idx` (`addr_id` ASC) VISIBLE,
  INDEX `FK_company_id_idx` (`company_id` ASC) VISIBLE,
  UNIQUE INDEX `company_id_UNIQUE` (`company_id` ASC) VISIBLE,
  CONSTRAINT `FK_addr_id`
    FOREIGN KEY (`addr_id`)
    REFERENCES `Address` (`addr_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `Company` (`company_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Employee` ;

CREATE TABLE IF NOT EXISTS `Employee` (
  `employee_id` TINYINT UNSIGNED NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `fname` VARCHAR(45) NOT NULL DEFAULT 'CONCAT(name,\" \", middlename,\" \",lname)',
  `middlename` VARCHAR(45) NULL,
  `lname` VARCHAR(45) NOT NULL,
  `salary` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Account` ;

CREATE TABLE IF NOT EXISTS `Account` (
  `acc_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_date` VARCHAR(45) NULL,
  `user_id` TINYINT UNSIGNED NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`acc_id`),
  UNIQUE INDEX `password_UNIQUE` (`password` ASC) VISIBLE,
  INDEX `FK_acc_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_acc_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `User` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegisteredUser`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RegisteredUser` ;

CREATE TABLE IF NOT EXISTS `RegisteredUser` (
  `reg_acc_id` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  INDEX `FK_user_id_idx` (`reg_acc_id` ASC) VISIBLE,
  CONSTRAINT `FK_user_id`
    FOREIGN KEY (`reg_acc_id`)
    REFERENCES `Account` (`user_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Profile`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Profile` ;

CREATE TABLE IF NOT EXISTS `Profile` (
  `avatar` TINYBLOB NOT NULL,
  `profile_id` TINYINT UNSIGNED NOT NULL,
  `alias` VARCHAR(45) NOT NULL,
  CONSTRAINT `FK_profile_id`
    FOREIGN KEY (`profile_id`)
    REFERENCES `Account` (`acc_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Manager`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Manager` ;

CREATE TABLE IF NOT EXISTS `Manager` (
  `manager_id` TINYINT NOT NULL,
  `employee_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`manager_id`, `employee_id`),
  INDEX `FK_employee_id_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `FK_employee_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CompanyProjects`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CompanyProjects` ;

CREATE TABLE IF NOT EXISTS `CompanyProjects` (
  `work_id` TINYINT NOT NULL,
  `employee_id` TINYINT UNSIGNED NOT NULL,
  `pid` TINYINT UNSIGNED NOT NULL,
  `manager_id` TINYINT NULL,
  PRIMARY KEY (`work_id`, `pid`, `employee_id`),
  INDEX `FK_employeeid_idx` (`employee_id` ASC) VISIBLE,
  INDEX `FK_company_id_idx` (`pid` ASC) VISIBLE,
  INDEX `FK_manager_id_idx` (`manager_id` ASC) VISIBLE,
  UNIQUE INDEX `pid_UNIQUE` (`pid` ASC) VISIBLE,
  UNIQUE INDEX `manager_id_UNIQUE` (`manager_id` ASC) VISIBLE,
  CONSTRAINT `FK_employeeid`
    FOREIGN KEY (`employee_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_status_pid`
    FOREIGN KEY (`pid`)
    REFERENCES `Company` (`company_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_manager_id`
    FOREIGN KEY (`manager_id`)
    REFERENCES `Manager` (`manager_id`)
    ON DELETE CASCADE
    ON UPDATE SET NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Device`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Device` ;

CREATE TABLE IF NOT EXISTS `Device` (
  `device_id` TINYINT UNSIGNED NOT NULL,
  `complete` TINYINT NOT NULL,
  `pid` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`device_id`, `complete`),
  UNIQUE INDEX `device_id_UNIQUE` (`device_id` ASC) VISIBLE,
  CONSTRAINT `FK_device_pid`
    FOREIGN KEY (`device_id`)
    REFERENCES `CompanyProjects` (`pid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Device_Log`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Device_Log` ;

CREATE TABLE IF NOT EXISTS `Device_Log` (
  `reg_acc_id` TINYINT UNSIGNED NULL,
  `device_id` TINYINT UNSIGNED NULL,
  INDEX `FK_device_id_idx` (`device_id` ASC) VISIBLE,
  CONSTRAINT `FK_reg_acc_id`
    FOREIGN KEY (`reg_acc_id`)
    REFERENCES `RegisteredUser` (`reg_acc_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_device_id`
    FOREIGN KEY (`device_id`)
    REFERENCES `Device` (`device_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ProcessPayment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ProcessPayment` ;

CREATE TABLE IF NOT EXISTS `ProcessPayment` (
  `device_id` TINYINT UNSIGNED NULL,
  `employee_id` TINYINT UNSIGNED NULL,
  `ProcessPaymentcol` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  INDEX `FK_employee_id_idx` (`employee_id` ASC) VISIBLE,
  PRIMARY KEY (`ProcessPaymentcol`),
  CONSTRAINT `FK_pp_id`
    FOREIGN KEY (`device_id`)
    REFERENCES `Device` (`device_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_employe_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PaymentInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PaymentInfo` ;

CREATE TABLE IF NOT EXISTS `PaymentInfo` (
  `payment_id` TINYINT NOT NULL,
  `device_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`payment_id`, `device_id`),
  INDEX `FK_ppid_idx` (`device_id` ASC) VISIBLE,
  CONSTRAINT `FK_ppid`
    FOREIGN KEY (`device_id`)
    REFERENCES `ProcessPayment` (`ProcessPaymentcol`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CreditCard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CreditCard` ;

CREATE TABLE IF NOT EXISTS `CreditCard` (
  `card_id` TINYINT NOT NULL,
  CONSTRAINT `FK_credit_card`
    FOREIGN KEY (`card_id`)
    REFERENCES `PaymentInfo` (`payment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bank_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `bank_account` ;

CREATE TABLE IF NOT EXISTS `bank_account` (
  `bank_id` TINYINT NOT NULL,
  CONSTRAINT `FK_bank_id`
    FOREIGN KEY (`bank_id`)
    REFERENCES `PaymentInfo` (`payment_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `HireDate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HireDate` ;

CREATE TABLE IF NOT EXISTS `HireDate` (
  `Date` TIMESTAMP NOT NULL,
  `eid` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`eid`),
  CONSTRAINT `FK_eid`
    FOREIGN KEY (`eid`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `employeeAdr`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `employeeAdr` ;

CREATE TABLE IF NOT EXISTS `employeeAdr` (
  `employee_id` TINYINT UNSIGNED NOT NULL,
  `addr_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`addr_id`, `employee_id`),
  INDEX `FK_addr_id_idx` (`addr_id` ASC) VISIBLE,
  CONSTRAINT `FK_employee_adr_id`
    FOREIGN KEY (`employee_id`)
    REFERENCES `Employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_employee_address`
    FOREIGN KEY (`addr_id`)
    REFERENCES `Address` (`addr_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Joblist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Joblist` ;

CREATE TABLE IF NOT EXISTS `Joblist` (
  `work_id` TINYINT NOT NULL,
  `manager_id` TINYINT NOT NULL,
  PRIMARY KEY (`work_id`),
  INDEX `FK_manager_id_idx` (`manager_id` ASC) VISIBLE,
  CONSTRAINT `FK_manager_job_id`
    FOREIGN KEY (`manager_id`)
    REFERENCES `Manager` (`manager_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Task` ;

CREATE TABLE IF NOT EXISTS `Task` (
  `Job_id` TINYINT NOT NULL,
  `contract` BLOB NOT NULL,
  `fulltime` VARCHAR(20) NOT NULL,
  `partime` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Job_id`),
  CONSTRAINT `FK_work_id`
    FOREIGN KEY (`Job_id`)
    REFERENCES `Joblist` (`work_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `WorkHours`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `WorkHours` ;

CREATE TABLE IF NOT EXISTS `WorkHours` (
  `hours` TINYINT NOT NULL,
  `jobid` TINYINT NOT NULL,
  `workid` TINYINT NOT NULL,
  INDEX `FK_jobid_idx` (`jobid` ASC) VISIBLE,
  INDEX `FK_workid_idx` (`workid` ASC) VISIBLE,
  CONSTRAINT `FK_jobid`
    FOREIGN KEY (`jobid`)
    REFERENCES `Task` (`Job_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_workid`
    FOREIGN KEY (`workid`)
    REFERENCES `CompanyProjects` (`work_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Status` ;

CREATE TABLE IF NOT EXISTS `Status` (
  `pid` TINYINT UNSIGNED NOT NULL,
  `complete` TINYINT NOT NULL,
  `incomplete` TINYINT NOT NULL,
  INDEX `FK_pid_idx` (`pid` ASC) VISIBLE,
  PRIMARY KEY (`pid`),
  UNIQUE INDEX `pid_UNIQUE` (`pid` ASC) VISIBLE,
  CONSTRAINT `FK_pid`
    FOREIGN KEY (`pid`)
    REFERENCES `CompanyProjects` (`pid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BoardofDirectors`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BoardofDirectors` ;

CREATE TABLE IF NOT EXISTS `BoardofDirectors` (
  `board_addr` VARCHAR(45) NOT NULL,
  `phone_numner` TINYINT NOT NULL,
  `company_id` TINYINT UNSIGNED NOT NULL,
  `dept_addrs` VARCHAR(255) NOT NULL,
  `announcement` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`board_addr`, `company_id`, `announcement`, `dept_addrs`),
  UNIQUE INDEX `company_id_UNIQUE` (`company_id` ASC) VISIBLE,
  UNIQUE INDEX `dept_addr_UNIQUE` (`dept_addrs` ASC) VISIBLE,
  UNIQUE INDEX `announcement_UNIQUE` (`announcement` ASC) VISIBLE,
  CONSTRAINT `FK_borad_company_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `Company` (`company_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CEO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CEO` ;

CREATE TABLE IF NOT EXISTS `CEO` (
  `name` VARCHAR(255) NOT NULL DEFAULT 'DEFAULT \'Mr/Mrs\'',
  `email` VARCHAR(45) NOT NULL,
  `phone_number` TINYINT NOT NULL,
  `firstname` VARCHAR(45) NOT NULL DEFAULT 'CONCAT(name,\" \",middlename,\" \",l',
  `midllename` VARCHAR(45) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `dept_addr` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`name`, `email`, `dept_addr`),
  UNIQUE INDEX `dept_addr_UNIQUE` (`dept_addr` ASC) VISIBLE,
  CONSTRAINT `FK_address`
    FOREIGN KEY (`dept_addr`)
    REFERENCES `BoardofDirectors` (`dept_addrs`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CompanyRules`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CompanyRules` ;

CREATE TABLE IF NOT EXISTS `CompanyRules` (
  `privacypolicy` VARCHAR(255) NOT NULL,
  `termsofuse` VARCHAR(255) NOT NULL,
  `announcement_id` TINYINT UNSIGNED NOT NULL,
  CONSTRAINT `FK_announce`
    FOREIGN KEY (`announcement_id`)
    REFERENCES `BoardofDirectors` (`announcement`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MessageBoard`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `MessageBoard` ;

CREATE TABLE IF NOT EXISTS `MessageBoard` (
  `date` TIMESTAMP NOT NULL,
  `Message` VARCHAR(45) NOT NULL,
  `annoncement_id` TINYINT UNSIGNED NULL,
  INDEX `FK_announcement_idx` (`annoncement_id` ASC) VISIBLE,
  UNIQUE INDEX `annoncement_id_UNIQUE` (`annoncement_id` ASC) VISIBLE,
  CONSTRAINT `FK_announcement`
    FOREIGN KEY (`annoncement_id`)
    REFERENCES `BoardofDirectors` (`announcement`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Client` ;

CREATE TABLE IF NOT EXISTS `Client` (
  `clientID` TINYINT UNSIGNED NOT NULL,
  INDEX `FK_client_idx` (`clientID` ASC) VISIBLE,
  CONSTRAINT `FK_client`
    FOREIGN KEY (`clientID`)
    REFERENCES `Account` (`acc_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CustomerOrder`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CustomerOrder` ;

CREATE TABLE IF NOT EXISTS `CustomerOrder` (
  `order_id` TINYINT UNSIGNED NOT NULL,
  `project_type` VARCHAR(45) NOT NULL,
  `client_id` TINYINT UNSIGNED NOT NULL,
  `company_id` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`company_id`, `order_id`),
  INDEX `FK_compay_id_idx` (`company_id` ASC) VISIBLE,
  UNIQUE INDEX `company_id_UNIQUE` (`company_id` ASC) VISIBLE,
  INDEX `FK_clien_id_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `FK_compay_id`
    FOREIGN KEY (`company_id`)
    REFERENCES `Company` (`company_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_clien_id`
    FOREIGN KEY (`client_id`)
    REFERENCES `Client` (`clientID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
