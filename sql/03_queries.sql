USE optics;

SELECT c.first_name,
       c.last_name,
       COUNT(s.sale_id) AS total_invoices
FROM sale s
         JOIN customer c ON s.customer_id = c.customer_id
WHERE c.first_name = 'John'
  AND c.last_name = 'Smith'
  AND s.sale_date BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY c.customer_id;


SELECT DISTINCT g.brand AS glasses_brand
FROM sale s
         JOIN sale_detail sd ON s.sale_id = sd.sale_id
         JOIN glasses g ON sd.glasses_id = g.glasses_id
         JOIN employee e ON s.employee_id = e.employee_id
WHERE e.first_name = 'Laura'
          AND e.last_name = 'Gomez'
          AND YEAR (s.sale_date) = 2025
ORDER BY g.brand;


SELECT DISTINCT su.name,
                su.country,
                su.city
FROM supplier su
         JOIN glasses g ON su.supplier_id = g.supplier_id
         JOIN sale_detail sd ON g.glasses_id = sd.glasses_id
         JOIN sale s ON sd.sale_id = s.sale_id
ORDER BY su.name;