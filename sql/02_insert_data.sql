USE optics;

INSERT INTO supplier (name, street, number, city, postal_code, country, phone, fax, tax_id)
VALUES ('VisionPro Ltd.', 'High Street', '12', 'London', 'W1B 3HH', 'UK', '+44 203456789', '+44 203456790',
        'GB1234567'),
       ('OptiWorld GmbH', 'Marktplatz', '8', 'Munich', '80331', 'Germany', '+49 892345678', '+49 892345679',
        'DE7654321'),
       ('Lentix SA', 'Carrer de Mallorca', '240', 'Barcelona', '08008', 'Spain', '+34 932222333', '+34 932222334',
        'ES9988776');

INSERT INTO glasses (brand, right_lens_power, left_lens_power, frame_type, frame_color, right_lens_color,
                     left_lens_color, price, supplier_id)
VALUES ('Ray-Ban', 1.25, 1.50, 'plastic', 'black', 'clear', 'clear', 129.90, 1),
       ('Oakley', -0.75, -0.75, 'metallic', 'silver', 'gray', 'gray', 179.50, 1),
       ('Persol', 0.00, 0.00, 'floating', 'brown', 'clear', 'clear', 199.00, 2),
       ('Vogue', -2.25, -2.00, 'plastic', 'red', 'clear', 'clear', 99.00, 3),
       ('Prada', 0.75, 1.00, 'metallic', 'gold', 'brown', 'brown', 249.99, 3);

INSERT INTO customer (first_name, last_name, address, phone, email, registration_date, referred_by)
VALUES ('John', 'Smith', '123 Oxford St, London', '+44 201234567', 'john.smith@email.com', '2025-01-10', NULL),
       ('Emma', 'Johnson', '45 Green Rd, London', '+44 209876543', 'emma.johnson@email.com', '2025-01-15', 1),
       ('Daniel', 'Martinez', '8 Gran Via, Madrid', '+34 600123456', 'daniel.martinez@email.com', '2025-01-20', 2);
