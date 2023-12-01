-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema coetagri
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `coetagri` DEFAULT CHARACTER SET utf8 ;
USE `coetagri` ;

-- -----------------------------------------------------
-- Table `coetagri`.`LOGIN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `coetagri`.`LOGIN` (
  `idLOGIN` INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idLOGIN`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `coetagri`.`LOGIN`
-- -----------------------------------------------------
INSERT INTO coetagri.LOGIN (user, password) VALUES ('usuario1', 'senha123');
INSERT INTO coetagri.LOGIN (user, password) VALUES ('joao123', 'abc456');
INSERT INTO coetagri.LOGIN (user, password) VALUES ('maria_user', 'senha789');
INSERT INTO coetagri.LOGIN (user, password) VALUES ('admin', 'admin123');
INSERT INTO coetagri.LOGIN (user, password) VALUES ('user_teste', 'teste123');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;