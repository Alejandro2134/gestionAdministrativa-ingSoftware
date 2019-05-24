-- MySQL Script generated by MySQL Workbench
-- Fri May 24 15:48:01 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema gestionbd
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gestionbd
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gestionbd` DEFAULT CHARACTER SET utf8 ;
USE `gestionbd` ;

-- -----------------------------------------------------
-- Table `gestionbd`.`ConjuntosCerrados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`ConjuntosCerrados` (
  `idConjuntosCerrados` INT NOT NULL AUTO_INCREMENT,
  `nombreConjunto` VARCHAR(45) NULL,
  `direccionConjunto` VARCHAR(70) NULL,
  `telefonoConjunto` VARCHAR(45) NULL,
  PRIMARY KEY (`idConjuntosCerrados`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionbd`.`EmpresaAseo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`EmpresaAseo` (
  `idEmpresaAseo` INT NOT NULL AUTO_INCREMENT,
  `idConjuntoA` INT NULL,
  `nombreAseo` VARCHAR(45) NULL,
  `direccionAseo` VARCHAR(45) NULL,
  `telefonoAseo` VARCHAR(45) NULL,
  `celularAseo` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpresaAseo`),
  INDEX `idConjunto_idx` (`idConjuntoA` ASC),
  CONSTRAINT `idConjunto`
    FOREIGN KEY (`idConjuntoA`)
    REFERENCES `gestionbd`.`ConjuntosCerrados` (`idConjuntosCerrados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionbd`.`EmpresaVigilancia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`EmpresaVigilancia` (
  `idEmpresaVigilancia` INT NOT NULL AUTO_INCREMENT,
  `idConjuntoV` INT NULL,
  `nombreVig` VARCHAR(45) NULL,
  `direccionVig` VARCHAR(45) NULL,
  `telefonoVig` VARCHAR(45) NULL,
  `celularVig` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpresaVigilancia`),
  INDEX `idConjuntov_idx` (`idConjuntoV` ASC),
  CONSTRAINT `idConjuntov`
    FOREIGN KEY (`idConjuntoV`)
    REFERENCES `gestionbd`.`ConjuntosCerrados` (`idConjuntosCerrados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionbd`.`InformacionSocial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`InformacionSocial` (
  `idInformacionSocial` INT NOT NULL AUTO_INCREMENT,
  `idConjuntoI` INT NULL,
  `nombreInfo` VARCHAR(45) NULL,
  `contenidoInfo` VARCHAR(45) NULL,
  PRIMARY KEY (`idInformacionSocial`),
  INDEX `idConjuntoI_idx` (`idConjuntoI` ASC),
  CONSTRAINT `idConjuntoI`
    FOREIGN KEY (`idConjuntoI`)
    REFERENCES `gestionbd`.`ConjuntosCerrados` (`idConjuntosCerrados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionbd`.`Eventos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`Eventos` (
  `idEventos` INT NOT NULL AUTO_INCREMENT,
  `idConjuntoE` INT NULL,
  `nombreEvento` VARCHAR(45) NULL,
  `contenidoEvento` TEXT NULL,
  `fechaEvento` DATE NULL,
  PRIMARY KEY (`idEventos`),
  INDEX `idConjuntoE_idx` (`idConjuntoE` ASC),
  CONSTRAINT `idConjuntoE`
    FOREIGN KEY (`idConjuntoE`)
    REFERENCES `gestionbd`.`ConjuntosCerrados` (`idConjuntosCerrados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionbd`.`Noticias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`Noticias` (
  `idNoticias` INT NOT NULL AUTO_INCREMENT,
  `idConjuntoN` INT NULL,
  `nombreEvento` VARCHAR(45) NULL,
  `contenioNoticia` TEXT NULL,
  PRIMARY KEY (`idNoticias`),
  INDEX `idConjuntoN_idx` (`idConjuntoN` ASC),
  CONSTRAINT `idConjuntoN`
    FOREIGN KEY (`idConjuntoN`)
    REFERENCES `gestionbd`.`ConjuntosCerrados` (`idConjuntosCerrados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionbd`.`Torres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`Torres` (
  `idTorres` INT NOT NULL AUTO_INCREMENT,
  `idConjuntoT` INT NULL,
  `nombreTorre` VARCHAR(45) NULL,
  PRIMARY KEY (`idTorres`),
  INDEX `idConjuntoT_idx` (`idConjuntoT` ASC),
  CONSTRAINT `idConjuntoT`
    FOREIGN KEY (`idConjuntoT`)
    REFERENCES `gestionbd`.`ConjuntosCerrados` (`idConjuntosCerrados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionbd`.`Propietarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`Propietarios` (
  `idPropietarios` INT NOT NULL AUTO_INCREMENT,
  `contraseña` VARCHAR(45) NULL,
  `nombres` VARCHAR(45) NULL,
  `apellidos` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `celular` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `userName` VARCHAR(45) NULL,
  PRIMARY KEY (`idPropietarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionbd`.`Apartamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`Apartamentos` (
  `idApartamentos` INT NOT NULL AUTO_INCREMENT,
  `idTorreA` INT NULL,
  `idPropietario` INT NULL,
  `tipoApartamento` VARCHAR(45) NULL,
  `areaApartamento` VARCHAR(45) NULL,
  `numeroPersonas` INT NULL,
  `tipoVivienda` VARCHAR(45) NULL,
  `numeroParqueadero` INT NULL,
  PRIMARY KEY (`idApartamentos`),
  INDEX `idTorreA_idx` (`idTorreA` ASC),
  INDEX `idPropietarioA_idx` (`idPropietario` ASC),
  CONSTRAINT `idTorreA`
    FOREIGN KEY (`idTorreA`)
    REFERENCES `gestionbd`.`Torres` (`idTorres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idPropietarioA`
    FOREIGN KEY (`idPropietario`)
    REFERENCES `gestionbd`.`Propietarios` (`idPropietarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionbd`.`SalonComunal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`SalonComunal` (
  `idSalonComunal` INT NOT NULL AUTO_INCREMENT,
  `idConjuntoS` INT NULL,
  `nombreSalon` VARCHAR(45) NULL,
  `pisoSalon` VARCHAR(45) NULL,
  `alquilerSalon` VARCHAR(45) NULL,
  PRIMARY KEY (`idSalonComunal`),
  INDEX `idConjuntoS_idx` (`idConjuntoS` ASC),
  CONSTRAINT `idConjuntoS`
    FOREIGN KEY (`idConjuntoS`)
    REFERENCES `gestionbd`.`ConjuntosCerrados` (`idConjuntosCerrados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionbd`.`PrestamoSalon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`PrestamoSalon` (
  `idPrestamoSalon` INT NOT NULL AUTO_INCREMENT,
  `idSalonP` INT NULL,
  `nombreEvento` VARCHAR(45) NULL,
  `fechaEvento` DATE NULL,
  `nomResponsable` VARCHAR(45) NULL,
  `apeResponsable` VARCHAR(45) NULL,
  `torre` VARCHAR(45) NULL,
  `apartamento` VARCHAR(45) NULL,
  PRIMARY KEY (`idPrestamoSalon`),
  INDEX `idSalonP_idx` (`idSalonP` ASC),
  CONSTRAINT `idSalonP`
    FOREIGN KEY (`idSalonP`)
    REFERENCES `gestionbd`.`SalonComunal` (`idSalonComunal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionbd`.`Informes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`Informes` (
  `idInformes` INT NOT NULL AUTO_INCREMENT,
  `idConjuntoI` INT NULL,
  `nombreInforme` VARCHAR(45) NULL,
  `ubicacionInforme` VARCHAR(45) NULL,
  `fechaPublicacion` DATE NULL,
  PRIMARY KEY (`idInformes`),
  INDEX `idConjuntoI_idx` (`idConjuntoI` ASC),
  CONSTRAINT `idConjuntoI`
    FOREIGN KEY (`idConjuntoI`)
    REFERENCES `gestionbd`.`ConjuntosCerrados` (`idConjuntosCerrados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestionbd`.`Administradores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestionbd`.`Administradores` (
  `idAdministradores` INT NOT NULL AUTO_INCREMENT,
  `usuarioAdmin` VARCHAR(45) NULL,
  `contraseñaAdmin` VARCHAR(45) NULL,
  PRIMARY KEY (`idAdministradores`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
