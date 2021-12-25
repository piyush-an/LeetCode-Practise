-- Schema
-- Create table orders (order_number int, customer_number int)
-- Truncate table orders
-- insert into orders (order_number, customer_number) values (1, 1)
-- insert into orders (order_number, customer_number) values (2, 2)
-- insert into orders (order_number, customer_number) values (3, 3)
-- insert into orders (order_number, customer_number) values (4, 3)

-- Solution 1

-- SELECT customer_number
-- FROM (SELECT TOP 1
--         customer_number, count(order_number) AS total_order
--     FROM orders
--     GROUP BY customer_number
--     ORDER BY total_order DESC) result

-- Solution 2

SELECT TOP 1 customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC


-- End