-- SCHEMA
-- DROP TABLE IF EXISTS Product
-- DROP TABLE IF EXISTS Invoice
-- Create table Product(product_id int, [name] varchar(15))
-- Create table Invoice(invoice_id int,product_id int,rest int, paid int, canceled int, refunded int)
-- Truncate table Product
-- insert into Product (product_id, [name]) values (0, 'ham')
-- insert into Product (product_id, [name]) values (1, 'bacon')
-- Truncate table Invoice
-- insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values (23, 0, 2, 0, 5, 0)
-- insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values (12, 0, 0, 4, 0, 3)
-- insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values (1, 1, 1, 1, 0, 1)
-- insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values (2, 1, 1, 0, 1, 1)
-- insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values (3, 1, 0, 1, 1, 1)
-- insert into Invoice (invoice_id, product_id, rest, paid, canceled, refunded) values (4, 1, 1, 1, 1, 0)
-- insert into Product (product_id, [name]) values (3, 'onion')
-- SOLUTION 1 
-- Write an SQL query that will, for all products, return each product name with the total amount due, paid, canceled, and refunded across all invoices.
-- Return the result table ordered by product_name.

-- select p.name,
-- ISNULL(SUM(rest), 0 ) as rest, 
-- ISNULL(SUM(paid), 0 ) as paid, 
-- ISNULL(SUM(canceled) , 0 ) as canceled, 
-- ISNULL(SUM(refunded) , 0 ) as refunded  
-- from Invoice i RIGHT JOIN Product p ON i.product_id = p.product_id GROUP BY p.name
-- ORDER BY p.name


-- SOLUTION 2
select DISTINCT(p.name),
ISNULL(SUM(rest) OVER(PARTITION BY p.name), 0 ) as rest, 
ISNULL(SUM(paid) OVER(PARTITION BY p.name), 0 ) as paid, 
ISNULL(SUM(canceled) OVER(PARTITION BY p.name), 0 ) as canceled, 
ISNULL(SUM(refunded) OVER(PARTITION BY p.name), 0 ) as refunded  
from Invoice i RIGHT JOIN Product p ON i.product_id = p.product_id
ORDER BY p.name


-- END