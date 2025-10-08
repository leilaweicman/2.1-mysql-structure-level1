USE pizzeria;

INSERT INTO province (name) VALUES ('Barcelona'), ('Madrid');

INSERT INTO locality (name, province_id)
VALUES ('Terrassa', 1), ('Sabadell', 1), ('Getafe', 2);

INSERT INTO store (address, postal_code, locality_id)
VALUES ('Carrer de la Pau 12', '08001', 1),
       ('Avinguda del Mar 45', '08301', 2);

INSERT INTO employee (first_name, last_name, tax_id, phone, employee_role, store_id)
VALUES ('Carlos', 'Ruiz', '12345678A', '612345678', 'cook', 1),
       ('Ana', 'Martinez', '87654321B', '622334455', 'delivery', 1),
       ('Jordi', 'Perez', '99999999C', '633445566', 'cook', 2);

INSERT INTO category (name) VALUES ('Classic'), ('Gourmet'), ('Drinks');

INSERT INTO product (name, description, image, price, category_id)
VALUES ('Margherita', 'Tomato, mozzarella, basil', 'margherita.jpg', 8.50, 1),
       ('Pepperoni', 'Pepperoni, cheese', 'pepperoni.jpg', 9.50, 1),
       ('Coca-Cola', 'Soft drink', 'coke.jpg', 2.00, 3);

INSERT INTO customer (first_name, last_name, address, postal_code, phone, locality_id)
VALUES ('Ana', 'Lopez', 'Carrer Sol 15', '08002', '600123123', 1),
       ('Miguel', 'Torres', 'Carrer Mar 8', '08301', '600234234', 2);

INSERT INTO customer_order (date_time_order, order_type, total_price, customer_id, store_id, employee_id, delivery_employee_id, delivery_date_time)
VALUES ('2025-10-06 13:30:00', 'delivery', 20.00, 1, 1, 1, 2, '2025-10-06 14:00:00'),
       ('2025-10-06 19:00:00', 'pickup', 10.50, 2, 2, 3, NULL, NULL);

INSERT INTO order_detail (order_id, product_id, quantity)
VALUES (1, 1, 1),
       (1, 3, 2),
       (2, 2, 1);
