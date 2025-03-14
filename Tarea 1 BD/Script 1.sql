-- MySQL Script generated by MySQL Workbench
-- Thu Mar  6 10:19:12 2025
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Historial Medico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Historial Medico` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Historial Medico` (
  `id_Historial Medico` INT NOT NULL,
  `Fecha` VARCHAR(45) NULL,
  `Detalles` VARCHAR(45) NULL,
  `created` DATETIME NOT NULL,
  PRIMARY KEY (`id_Historial Medico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Prescripciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Prescripciones` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Prescripciones` (
  `id_Prescripciones` INT NOT NULL,
  `Medicamentos` VARCHAR(45) NULL,
  `Dosis` VARCHAR(45) NULL,
  `Frecuencias` VARCHAR(45) NULL,
  `created` DATETIME NOT NULL,
  PRIMARY KEY (`id_Prescripciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pagos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pagos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pagos` (
  `id_Pagos` INT NOT NULL,
  `Monto` VARCHAR(45) NULL,
  `Fecha_pago` VARCHAR(45) NULL,
  `Metodo_pago` VARCHAR(45) NULL,
  `created` DATETIME NOT NULL,
  PRIMARY KEY (`id_Pagos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consultas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Consultas` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Consultas` (
  `id_Consultas` INT NOT NULL,
  `Fecha` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Motivo_consulta` VARCHAR(45) NULL,
  `Diagnostico` VARCHAR(45) NULL,
  `Tratamiento` VARCHAR(45) NULL,
  `Observaciones` VARCHAR(45) NULL,
  `Prescripciones_id_Prescripciones` INT NOT NULL,
  `Pagos_id_Pagos` INT NOT NULL,
  `created` DATETIME NOT NULL,
  PRIMARY KEY (`id_Consultas`),
  CONSTRAINT `fk_Consultas_Prescripciones1`
    FOREIGN KEY (`Prescripciones_id_Prescripciones`)
    REFERENCES `mydb`.`Prescripciones` (`id_Prescripciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consultas_Pagos1`
    FOREIGN KEY (`Pagos_id_Pagos`)
    REFERENCES `mydb`.`Pagos` (`id_Pagos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Consultas_Prescripciones1_idx` ON `mydb`.`Consultas` (`Prescripciones_id_Prescripciones` ASC) VISIBLE;

CREATE INDEX `fk_Consultas_Pagos1_idx` ON `mydb`.`Consultas` (`Pagos_id_Pagos` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Expecialidades`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Expecialidades` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Expecialidades` (
  `id_Expecialidades` INT NOT NULL,
  `Nombre_expecialidad` VARCHAR(45) NULL,
  `Descripción` VARCHAR(45) NULL,
  `created` DATETIME NOT NULL,
  PRIMARY KEY (`id_Expecialidades`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pacientes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Pacientes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Pacientes` (
  `id_Pacientes` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Fecha de nacimiento` VARCHAR(45) NULL,
  `Genero` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Dirección` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Historial Medico_id_Historial Medico` INT NOT NULL,
  `Consultas_id_Consultas` INT NOT NULL,
  `Expecialidades_id_Expecialidades` INT NOT NULL,
  `created` DATETIME NOT NULL,
  PRIMARY KEY (`id_Pacientes`, `Expecialidades_id_Expecialidades`),
  CONSTRAINT `fk_Pacientes_Historial Medico1`
    FOREIGN KEY (`Historial Medico_id_Historial Medico`)
    REFERENCES `mydb`.`Historial Medico` (`id_Historial Medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacientes_Consultas1`
    FOREIGN KEY (`Consultas_id_Consultas`)
    REFERENCES `mydb`.`Consultas` (`id_Consultas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pacientes_Expecialidades1`
    FOREIGN KEY (`Expecialidades_id_Expecialidades`)
    REFERENCES `mydb`.`Expecialidades` (`id_Expecialidades`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Pacientes_Historial Medico1_idx` ON `mydb`.`Pacientes` (`Historial Medico_id_Historial Medico` ASC) VISIBLE;

CREATE INDEX `fk_Pacientes_Consultas1_idx` ON `mydb`.`Pacientes` (`Consultas_id_Consultas` ASC) VISIBLE;

CREATE INDEX `fk_Pacientes_Expecialidades1_idx` ON `mydb`.`Pacientes` (`Expecialidades_id_Expecialidades` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Medicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Medicos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Medicos` (
  `id_Medicos` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NULL,
  `Expecialidad` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Consultas_id_Consultas` INT NOT NULL,
  `created` DATETIME NOT NULL,
  PRIMARY KEY (`id_Medicos`),
  CONSTRAINT `fk_Medicos_Consultas1`
    FOREIGN KEY (`Consultas_id_Consultas`)
    REFERENCES `mydb`.`Consultas` (`id_Consultas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Medicos_Consultas1_idx` ON `mydb`.`Medicos` (`Consultas_id_Consultas` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `mydb`.`Citas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Citas` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Citas` (
  `id_Citas` INT NOT NULL,
  `Estado_cita` VARCHAR(45) NULL,
  `Fecha_programada` VARCHAR(45) NULL,
  `Hora_programada` VARCHAR(45) NULL,
  `Consultas_id_Consultas` INT NOT NULL,
  `created` DATETIME NOT NULL,
  PRIMARY KEY (`id_Citas`),
  CONSTRAINT `fk_Citas_Consultas`
    FOREIGN KEY (`Consultas_id_Consultas`)
    REFERENCES `mydb`.`Consultas` (`id_Consultas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Citas_Consultas_idx` ON `mydb`.`Citas` (`Consultas_id_Consultas` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
