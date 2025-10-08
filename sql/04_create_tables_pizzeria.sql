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

CREATE TABLE customer
(
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(100) NOT NULL,
    last_name   VARCHAR(100) NOT NULL,
    address     VARCHAR(150) NOT NULL,
    postal_code VARCHAR(10),
    phone       VARCHAR(20)  NOT NULL,
    locality_id INT          NOT NULL,
    FOREIGN KEY (locality_id) REFERENCES locality (locality_id)
);

CREATE TABLE store
(
    store_id    INT AUTO_INCREMENT PRIMARY KEY,
    address     VARCHAR(150) NOT NULL,
    postal_code VARCHAR(10),
    locality_id INT          NOT NULL,
    FOREIGN KEY (locality_id) REFERENCES locality (locality_id)
);

CREATE TABLE employee
(
    employee_id   INT AUTO_INCREMENT PRIMARY KEY,
    first_name    VARCHAR(100) NOT NULL,
    last_name     VARCHAR(100) NOT NULL,
    tax_id        VARCHAR(20)  NOT NULL UNIQUE,
    phone         VARCHAR(20)  NOT NULL,
    employee_role ENUM('cook', 'delivery') NOT NULL,
    store_id      INT          NOT NULL,
    FOREIGN KEY (locality_id) REFERENCES locality (locality_id)
);

CREATE TABLE category
(
    category_id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);