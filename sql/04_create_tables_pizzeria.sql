CREATE DATABASE IF NOT EXISTS pizzeria;
USE pizzeria;

CREATE TABLE province
(
    province_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL
);

CREATE TABLE locality
(
    locality_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    province_id INT          NOT NULL,
    FOREIGN KEY (province_id) REFERENCES province (province_id)
);