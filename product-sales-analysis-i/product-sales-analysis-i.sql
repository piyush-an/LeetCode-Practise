-- SCHEMA
-- DROP TABLE IF EXISTS Sales
-- DROP TABLE IF EXISTS Product
-- Create table Sales (sale_id int, product_id int, year int, quantity int, price int)
-- Create table Product (product_id int, product_name varchar(10))
-- Truncate table Sales
-- insert into Sales (sale_id, product_id, year, quantity, price) values (1, 100, 2008, 10, 5000)
-- insert into Sales (sale_id, product_id, year, quantity, price) values (2, 100, 2009, 12, 5000)
-- insert into Sales (sale_id, product_id, year, quantity, price) values (7, 200, 2011, 15, 9000)
-- Truncate table Product
-- insert into Product (product_id, product_name) values (100, 'Nokia')
-- insert into Product (product_id, product_name) values (200, 'Apple')
-- insert into Product (product_id, product_name) values (300, 'Samsung')


-- SOLUTION 1
-- SELECT * FROM Sales
-- SELECT * FROM Product

-- Write an SQL query that reports the product_name, year, and price for each sale_id in the Sales table.

SELECT p.product_name, s.year, s.price
FROM Sales s INNER JOIN Product p ON s.product_id = p.product_id

-- END