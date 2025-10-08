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
    FOREIGN KEY (province_id)
        REFERENCES province (province_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
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
    FOREIGN KEY (locality_id)
        REFERENCES locality (locality_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE TABLE store
(
    store_id    INT AUTO_INCREMENT PRIMARY KEY,
    address     VARCHAR(150) NOT NULL,
    postal_code VARCHAR(10),
    locality_id INT          NOT NULL,
    FOREIGN KEY (locality_id)
        REFERENCES locality (locality_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
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
    FOREIGN KEY (store_id)
        REFERENCES store (store_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE category
(
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL
);

CREATE TABLE product
(
    product_id   INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100)  NOT NULL,
    description  TEXT,
    image        VARCHAR(255),
    price        DECIMAL(8, 2) NOT NULL,
    product_type ENUM('pizza', 'burger', 'drink') NOT NULL,
    category_id  INT NULL,
    FOREIGN KEY (category_id)
        REFERENCES category (category_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE customer_order
(
    order_id             INT AUTO_INCREMENT PRIMARY KEY,
    date_time_order      DATETIME      NOT NULL,
    order_type           ENUM('delivery', 'pickup') NOT NULL,
    total_price          DECIMAL(8, 2) NOT NULL,
    customer_id          INT           NOT NULL,
    store_id             INT           NOT NULL,
    delivery_employee_id INT NULL,
    delivery_date_time   DATETIME NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (store_id)
        REFERENCES store (store_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (delivery_employee_id)
        REFERENCES employee (employee_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE order_detail
(
    order_id   INT NOT NULL,
    product_id INT NOT NULL,
    quantity   INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id)
        REFERENCES customer_order (order_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (product_id)
        REFERENCES product (product_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);