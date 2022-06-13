CREATE DATABASE  db_operation;                      --CREAR BASE DE DATOS

CREATE DATABASE IF NOT EXISTS db_operation;         -- CREAR BASE DE DATOS SI NO EXISTE
SHOW WARNINGS;                                      -- MOSTRAR MENSAJES DE ERROR

SHOW DATABASES;                                     -- MOSTRAR BASES DE DATOS

USE db_operation ;                                   -- usar base de datos

SHOW TABLES;                                       -- MOSTRAR TABLAS EXISTENTES



CREATE TABLE IF NOT EXISTS author(
	`author_id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `nationality` VARCHAR(3)
);
CREATE TABLE db_operation.books(
`book_id` INTEGER  UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
`author` INTEGER UNSIGNED NOT NULL,
`title` VARCHAR(100) NOT NULL,
`year` INTEGER UNSIGNED NOT NULL DEFAULT 1900,
`language` VARCHAR(2) NOT NULL DEFAULT 'es' COMMENT 'ISO 639-1 language',
`cover_url` VARCHAR(500),
`price` DOUBLE(6,2) NOT NULL DEFAULT 10.0,
`selleable` TINYINT(1) DEFAULT 1,
`copies` INTEGER NOT NULL DEFAULT 1,
`description` TEXT
);                      -- crear tabla


-- crear tabla clientes
CREATE TABLE clientes(
    client_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(100) NOT NULL UNIQUE,
    birthdate DATETIME,
    `gender` ENUM('M','F', 'ND') NOT NULL,
    active TINYINT(1) NOT NULL DEFAULT 1,
    `created_at`    TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP
);

ALTER TABLE clients
ADD `updated_at`    TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP;

CREATE TABLE operations(
    operation_id INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
    book_id  INTEGER  UNSIGNED NOT NULL, 
    client_id INTEGER  UNSIGNED NOT NULL ,
    type_operation ENUM('lend', 'returned', 'sell') NOT NULL ,
    created_at TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP 
        ON UPDATE CURRENT_TIMESTAMP,
    finished TINYINT(1) NOT NULL
);
