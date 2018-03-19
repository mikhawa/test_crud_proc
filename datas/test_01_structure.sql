
/**
 * Author:  Michael
 * Created: 19 mars 2018
 */

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema test_01
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema test_01
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `test_01` DEFAULT CHARACTER SET utf8 ;
USE `test_01` ;

-- -----------------------------------------------------
-- Table `test_01`.`auteur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_01`.`auteur` (
  `idauteur` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(80) NOT NULL,
  `pwd` VARCHAR(64) NOT NULL,
  `nomComplet` VARCHAR(200) NOT NULL,
  `lemail` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idauteur`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `lemail_UNIQUE` (`lemail` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test_01`.`article`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_01`.`article` (
  `idarticle` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(150) NOT NULL,
  `texte` TEXT NOT NULL,
  `date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `auteur_idauteur` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idarticle`),
  INDEX `fk_article_auteur_idx` (`auteur_idauteur` ASC),
  CONSTRAINT `fk_article_auteur`
    FOREIGN KEY (`auteur_idauteur`)
    REFERENCES `test_01`.`auteur` (`idauteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test_01`.`rubrique`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_01`.`rubrique` (
  `idrubrique` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `intitule` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idrubrique`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `test_01`.`article_has_rubrique`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `test_01`.`article_has_rubrique` (
  `article_idarticle` INT UNSIGNED NOT NULL,
  `rubrique_idrubrique` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`article_idarticle`, `rubrique_idrubrique`),
  INDEX `fk_article_has_rubrique_rubrique1_idx` (`rubrique_idrubrique` ASC),
  INDEX `fk_article_has_rubrique_article1_idx` (`article_idarticle` ASC),
  CONSTRAINT `fk_article_has_rubrique_article1`
    FOREIGN KEY (`article_idarticle`)
    REFERENCES `test_01`.`article` (`idarticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_article_has_rubrique_rubrique1`
    FOREIGN KEY (`rubrique_idrubrique`)
    REFERENCES `test_01`.`rubrique` (`idrubrique`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
