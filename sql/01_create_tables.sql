USE optics;

CREATE TABLE supplier
(
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100) NOT NULL,
    street      VARCHAR(100),
    number      VARCHAR(10),
    floor       VARCHAR(10),
    door        VARCHAR(10),
    city        VARCHAR(50)  NOT NULL,
    postal_code VARCHAR(10),
    country     VARCHAR(50)  NOT NULL,
    phone       VARCHAR(20),
    fax         VARCHAR(20),
    tax_id      VARCHAR(15)  NOT NULL UNIQUE
);

CREATE TABLE glasses
(
    glasses_id       INT AUTO_INCREMENT PRIMARY KEY,
    brand            VARCHAR(50)   NOT NULL,
    right_lens_power DECIMAL(4, 2),
    left_lens_power  DECIMAL(4, 2),
    frame_type       VARCHAR(50)   NOT NULL,
    frame_color      VARCHAR(50),
    right_lens_color VARCHAR(50),
    left_lens_color  VARCHAR(50),
    price            DECIMAL(8, 2) NOT NULL,
    supplier_id      INT           NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES supplier (supplier_id)
);

CREATE TABLE customer
(
    customer_id       INT AUTO_INCREMENT PRIMARY KEY,
    first_name        VARCHAR(100) NOT NULL,
    last_name         VARCHAR(100) NOT NULL,
    address           VARCHAR(150),
    phone             VARCHAR(20),
    email             VARCHAR(100) UNIQUE,
    registration_date DATE         NOT NULL,
    referred_by       INT,
    FOREIGN KEY (referred_by)
        REFERENCES customer (customer_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE employee
(
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name  VARCHAR(100) NOT NULL,
    last_name   VARCHAR(100) NOT NULL,
    job_title   VARCHAR(100)
);

CREATE TABLE sale
(
    sale_id     INT AUTO_INCREMENT PRIMARY KEY,
    sale_date   DATE NOT NULL,
    customer_id INT  NOT NULL,
    employee_id INT  NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (employee_id)
        REFERENCES employee (employee_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

CREATE TABLE sale_detail
(
    sale_id    INT NOT NULL,
    glasses_id INT NOT NULL,
    quantity   INT NOT NULL,
    PRIMARY KEY (sale_id, glasses_id),
    FOREIGN KEY (sale_id)
        REFERENCES sale (sale_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (glasses_id)
        REFERENCES glasses (glasses_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);