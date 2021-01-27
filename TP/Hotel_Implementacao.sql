-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Hotel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Hotel` DEFAULT CHARACTER SET utf8 ;
USE `Hotel` ;

-- -----------------------------------------------------
-- Table `Hotel`.`Hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`Hotel` (
  `Site` VARCHAR(45) NULL,
  `ID` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `Freguesia` VARCHAR(45) NOT NULL,
  `Codigo_Postal` VARCHAR(45) NOT NULL,
  `Localidade` VARCHAR(45) NOT NULL,
  `Estrelas` INT NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`Funcionario` (
  `ID` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Codigo_Postal` VARCHAR(45) NOT NULL,
  `Freguesia` VARCHAR(45) NOT NULL,
  `Rua` VARCHAR(45) NOT NULL,
  `Localidade` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Telemovel` VARCHAR(10) NULL,
  `CC` VARCHAR(15) NOT NULL,
  `Cargo` VARCHAR(45) NOT NULL,
  `Turno` VARCHAR(10) NOT NULL,
  `Hotel` INT NOT NULL,
  PRIMARY KEY (`ID`, `Hotel`),
  INDEX `Hotel_idx` (`Hotel` ASC) VISIBLE,
  CONSTRAINT `Hotel`
    FOREIGN KEY (`Hotel`)
    REFERENCES `Hotel`.`Hotel` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`Tipo_Quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`Tipo_Quarto` (
  `Designacao` VARCHAR(20) NOT NULL,
  `Preco` DECIMAL(5,2) NOT NULL,
  `Capacidade` INT NOT NULL,
  PRIMARY KEY (`Designacao`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`Quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`Quarto` (
  `ID` INT NOT NULL,
  `Hotel_ID` INT NOT NULL,
  `Tipo_de_Quarto` VARCHAR(20) NOT NULL,
  `Ocupado` CHAR(1) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Hotel_idx` (`Hotel_ID` ASC) VISIBLE,
  INDEX `Tipo_Quarto_idx` (`Tipo_de_Quarto` ASC) VISIBLE,
  CONSTRAINT `Hotel_ID`
    FOREIGN KEY (`Hotel_ID`)
    REFERENCES `Hotel`.`Hotel` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Tipo_Quarto`
    FOREIGN KEY (`Tipo_de_Quarto`)
    REFERENCES `Hotel`.`Tipo_Quarto` (`Designacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`Cliente` (
  `ID` INT NOT NULL,
  `CC` VARCHAR(15) NOT NULL,
  `NIF` INT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Morada` VARCHAR(100) NULL,
  `Telemovel` VARCHAR(10) NULL,
  `Email` VARCHAR(45) NULL,
  `País` VARCHAR(30) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`Reserva` (
  `Data_de_Início` DATE NOT NULL,
  `Data_de_Fim` DATE NOT NULL,
  `ID` INT NOT NULL,
  `Preco` DECIMAL(6,2) NOT NULL,
  `Data_De_Reserva` DATE NOT NULL,
  `Cliente` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `Cliente_idx` (`Cliente` ASC) VISIBLE,
  CONSTRAINT `Cliente`
    FOREIGN KEY (`Cliente`)
    REFERENCES `Hotel`.`Cliente` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hotel`.`Quarto_has_Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hotel`.`Quarto_has_Reserva` (
  `Quarto_ID` INT NOT NULL,
  `Reserva_ID` INT NOT NULL,
  PRIMARY KEY (`Quarto_ID`, `Reserva_ID`),
  INDEX `fk_Quarto_has_Reserva_Reserva1_idx` (`Reserva_ID` ASC) VISIBLE,
  INDEX `fk_Quarto_has_Reserva_Quarto1_idx` (`Quarto_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Quarto_has_Reserva_Quarto1`
    FOREIGN KEY (`Quarto_ID`)
    REFERENCES `Hotel`.`Quarto` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Quarto_has_Reserva_Reserva1`
    FOREIGN KEY (`Reserva_ID`)
    REFERENCES `Hotel`.`Reserva` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




