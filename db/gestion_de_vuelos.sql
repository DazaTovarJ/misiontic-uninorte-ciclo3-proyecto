-- MySQL Script generated by MySQL Workbench
-- Thu Sep 29 19:21:45 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gestion_vuelos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gestion_vuelos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gestion_vuelos` DEFAULT CHARACTER SET utf8mb4 ;
USE `gestion_vuelos` ;

-- -----------------------------------------------------
-- Table `gestion_vuelos`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`roles` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` TEXT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`nacionalidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`nacionalidades` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nacionalidad` VARCHAR(100) NOT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`reservas` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `reserva` VARCHAR(100) NOT NULL,
  `fecha_de_reserva` DATETIME(20) NOT NULL,
  `fecha_de_cancelancion` DATETIME(20) NOT NULL,
  `motivo_de_cancelacion` VARCHAR(100) NOT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`aviones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`aviones` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `avion` VARCHAR(100) NOT NULL,
  `modelo` VARCHAR(100) NOT NULL,
  `capacidad` INT(20) NOT NULL,
  `matricula` VARCHAR(100) NOT NULL,
  `numero_de_silla` VARCHAR(100) NOT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  `reservas_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_aviones_reservas1_idx` (`reservas_id` ASC) VISIBLE,
  CONSTRAINT `fk_aviones_reservas1`
    FOREIGN KEY (`reservas_id`)
    REFERENCES `gestion_vuelos`.`reservas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`estados_de_vuelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`estados_de_vuelos` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `estado_de_vuelo` VARCHAR(100) NOT NULL,
  `detalle` VARCHAR(100) NOT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`vuelos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`vuelos` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `vuelo` INT(20) NOT NULL,
  `destino` VARCHAR(100) NOT NULL,
  `origen` VARCHAR(100) NOT NULL,
  `fecha_salida` DATE NOT NULL,
  `fecha_llegada` DATE NOT NULL,
  `hora_de_salida` TIME NOT NULL,
  `hora_de_llegada` TIME NOT NULL,
  `avion` VARCHAR(100) NOT NULL,
  `estado_de_vuelo` VARCHAR(100) NOT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  `roles_id` BIGINT(20) UNSIGNED NOT NULL,
  `aviones_id` BIGINT(20) UNSIGNED NOT NULL,
  `estados_de_vuelos_id` BIGINT(20) UNSIGNED NOT NULL,
  `reservas_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`, `estados_de_vuelos_id`),
  INDEX `fk_vuelos_roles1_idx` (`roles_id` ASC) VISIBLE,
  INDEX `fk_vuelos_aviones1_idx` (`aviones_id` ASC) VISIBLE,
  INDEX `fk_vuelos_estados_de_vuelos1_idx` (`estados_de_vuelos_id` ASC) VISIBLE,
  INDEX `fk_vuelos_reservas1_idx` (`reservas_id` ASC) VISIBLE,
  CONSTRAINT `fk_vuelos_roles1`
    FOREIGN KEY (`roles_id`)
    REFERENCES `gestion_vuelos`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vuelos_aviones1`
    FOREIGN KEY (`aviones_id`)
    REFERENCES `gestion_vuelos`.`aviones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vuelos_estados_de_vuelos1`
    FOREIGN KEY (`estados_de_vuelos_id`)
    REFERENCES `gestion_vuelos`.`estados_de_vuelos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vuelos_reservas1`
    FOREIGN KEY (`reservas_id`)
    REFERENCES `gestion_vuelos`.`reservas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`ciudades` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ciudad` VARCHAR(100) NOT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  `vuelos_id` BIGINT(20) UNSIGNED NOT NULL,
  `vuelos_estados_de_vuelos_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ciudades_vuelos1_idx` (`vuelos_id` ASC, `vuelos_estados_de_vuelos_id` ASC) VISIBLE,
  CONSTRAINT `fk_ciudades_vuelos1`
    FOREIGN KEY (`vuelos_id` , `vuelos_estados_de_vuelos_id`)
    REFERENCES `gestion_vuelos`.`vuelos` (`id` , `estados_de_vuelos_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`categorias` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(100) NOT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`paises` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pais` VARCHAR(100) NOT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  `vuelos_id` BIGINT(20) UNSIGNED NOT NULL,
  `vuelos_estados_de_vuelos_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_paises_vuelos1_idx` (`vuelos_id` ASC, `vuelos_estados_de_vuelos_id` ASC) VISIBLE,
  CONSTRAINT `fk_paises_vuelos1`
    FOREIGN KEY (`vuelos_id` , `vuelos_estados_de_vuelos_id`)
    REFERENCES `gestion_vuelos`.`vuelos` (`id` , `estados_de_vuelos_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`aerolineas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`aerolineas` (
  `id` BIGINT(20) UNSIGNED NOT NULL,
  `aerolinea` VARCHAR(100) NOT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  `aviones_id` BIGINT(20) UNSIGNED NOT NULL,
  `reservas_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_aerolineas_aviones1_idx` (`aviones_id` ASC) VISIBLE,
  INDEX `fk_aerolineas_reservas1_idx` (`reservas_id` ASC) VISIBLE,
  CONSTRAINT `fk_aerolineas_aviones1`
    FOREIGN KEY (`aviones_id`)
    REFERENCES `gestion_vuelos`.`aviones` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aerolineas_reservas1`
    FOREIGN KEY (`reservas_id`)
    REFERENCES `gestion_vuelos`.`reservas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`servicio_al_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`servicio_al_usuario` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `servicio_al_usuario` VARCHAR(45) NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`pqrs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`pqrs` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pqr` VARCHAR(100) NOT NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  `servicio_al_usuario_id` BIGINT(20) UNSIGNED NOT NULL,
  `aerolineas_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pqrs_servicio_al_usuario1_idx` (`servicio_al_usuario_id` ASC) VISIBLE,
  INDEX `fk_pqrs_aerolineas1_idx` (`aerolineas_id` ASC) VISIBLE,
  CONSTRAINT `fk_pqrs_servicio_al_usuario1`
    FOREIGN KEY (`servicio_al_usuario_id`)
    REFERENCES `gestion_vuelos`.`servicio_al_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pqrs_aerolineas1`
    FOREIGN KEY (`aerolineas_id`)
    REFERENCES `gestion_vuelos`.`aerolineas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`usuarios` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo_documento` BIGINT(20) UNSIGNED NOT NULL,
  `identificacion` VARCHAR(75) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NOT NULL,
  `fecha_de_nacimiento` DATE NOT NULL,
  `genero` ENUM("M", "F", "OTROS") NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `nacionalidad` VARCHAR(100) NOT NULL,
  `tipo_de_sangre` VARCHAR(3) NULL,
  `pais_de_residencia` VARCHAR(100) NOT NULL,
  `ciudad` VARCHAR(100) NOT NULL,
  `categoria` VARCHAR(100) NULL,
  `aerolinea` VARCHAR(100) NULL,
  `creado` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  `actualizado` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP(),
  `estado` TINYINT(1) NOT NULL DEFAULT 1,
  `roles_id` BIGINT(20) UNSIGNED NOT NULL,
  `nacionalidades_id` BIGINT(20) UNSIGNED NOT NULL,
  `ciudades_id` BIGINT(20) UNSIGNED NOT NULL,
  `categorias_id` BIGINT(20) UNSIGNED NOT NULL,
  `paises_id` BIGINT(20) UNSIGNED NOT NULL,
  `aerolineas_id` BIGINT(20) UNSIGNED NOT NULL,
  `reservas_id` BIGINT(20) UNSIGNED NOT NULL,
  `pqrs_id` BIGINT(20) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_usuarios_roles_idx` (`roles_id` ASC) VISIBLE,
  INDEX `fk_usuarios_nacionalidades1_idx` (`nacionalidades_id` ASC) VISIBLE,
  INDEX `fk_usuarios_ciudades1_idx` (`ciudades_id` ASC) VISIBLE,
  INDEX `fk_usuarios_categorias1_idx` (`categorias_id` ASC) VISIBLE,
  INDEX `fk_usuarios_paises1_idx` (`paises_id` ASC) VISIBLE,
  INDEX `fk_usuarios_aerolineas1_idx` (`aerolineas_id` ASC) VISIBLE,
  INDEX `fk_usuarios_reservas1_idx` (`reservas_id` ASC) VISIBLE,
  INDEX `fk_usuarios_pqrs1_idx` (`pqrs_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_roles`
    FOREIGN KEY (`roles_id`)
    REFERENCES `gestion_vuelos`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_nacionalidades1`
    FOREIGN KEY (`nacionalidades_id`)
    REFERENCES `gestion_vuelos`.`nacionalidades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_ciudades1`
    FOREIGN KEY (`ciudades_id`)
    REFERENCES `gestion_vuelos`.`ciudades` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_categorias1`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `gestion_vuelos`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_paises1`
    FOREIGN KEY (`paises_id`)
    REFERENCES `gestion_vuelos`.`paises` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_aerolineas1`
    FOREIGN KEY (`aerolineas_id`)
    REFERENCES `gestion_vuelos`.`aerolineas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_reservas1`
    FOREIGN KEY (`reservas_id`)
    REFERENCES `gestion_vuelos`.`reservas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_pqrs1`
    FOREIGN KEY (`pqrs_id`)
    REFERENCES `gestion_vuelos`.`pqrs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`table1` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gestion_vuelos`.`table2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gestion_vuelos`.`table2` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
