-- SCHEMA
-- DROP TABLE Product
-- DROP TABLE Customer
-- Create table Customer (customer_id int, product_key int)
-- Create table Product (product_key int)
-- Truncate table Customer
-- insert into Customer (customer_id, product_key) values ('1', '5')
-- insert into Customer (customer_id, product_key) values ('2', '6')
-- insert into Customer (customer_id, product_key) values ('3', '5')
-- insert into Customer (customer_id, product_key) values ('3', '6')
-- insert into Customer (customer_id, product_key) values ('1', '6')
-- insert into Customer (customer_id, product_key) values ('1', '6')
-- Truncate table Product
-- insert into Product (product_key) values ('5')
-- insert into Product (product_key) values ('6')

-- SOLUTION 1

-- SELECT * FROM Product
-- SELECT * FROM Customer

-- SELECT *, COUNT(product_key) OVER (PARTITION BY customer_id) as buy_count FROM Customer

-- SELECT DISTINCT (customer_id) FROM (
-- SELECT *, COUNT(product_key) OVER (PARTITION BY customer_id) as buy_count FROM (
-- select DISTINCT customer_id, product_key from Customer ) result_set ) result_set_two where buy_count = (SELECT COUNT(product_key) from Product )



-- SOLUTION 2

SELECT customer_id
from Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key ) = (SELECT COUNT ( product_key)
from Product )
-- END