USE pizzeria;

SELECT l.name           AS locality,
       c.name,
       SUM(od.quantity) AS total_sold
FROM category c
         JOIN product p ON c.category_id = p.category_id
         JOIN order_detail od ON p.product_id = od.product_id
         JOIN customer_order co ON od.order_id = co.order_id
         JOIN store s ON co.store_id = s.store_id
         JOIN locality l ON s.locality_id = l.locality_id
WHERE c.name = 'Drinks'
  AND l.name = 'Terrassa'
GROUP BY l.name, c.name;

SELECT
    e.first_name,
    e.last_name,
    COUNT(o.order_id) AS total_orders_delivered
FROM employee e
         JOIN customer_order o
              ON e.employee_id = o.delivery_employee_id
WHERE e.first_name = 'Ana'
GROUP BY e.first_name, e.last_name;