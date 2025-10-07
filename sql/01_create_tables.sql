USE
optics;

CREATE TABLE supplier
(
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(100),
    street      VARCHAR(100),
    number      VARCHAR(10),
    floor       VARCHAR(10),
    door        VARCHAR(10),
    city        VARCHAR(50),
    postal_code VARCHAR(10),
    country     VARCHAR(50),
    phone       VARCHAR(20),
    fax         VARCHAR(20),
    tax_id      VARCHAR(15)
);

CREATE TABLE glasses
(
    glasses_id       INT AUTO_INCREMENT PRIMARY KEY,
    brand            VARCHAR(50),
    right_lens_power DECIMAL(4, 2),
    left_lens_power  DECIMAL(4, 2),
    frame_type       VARCHAR(50),
    frame_color      VARCHAR(50),
    right_lens_color VARCHAR(50),
    left_lens_color  VARCHAR(50),
    price            DECIMAL(8, 2),
    supplier_id      INT
        FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);