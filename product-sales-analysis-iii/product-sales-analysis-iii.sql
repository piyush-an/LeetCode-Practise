-- SCHEMA
-- DROP TABLE Product
-- DROP TABLE Sales
-- Create table Sales (sale_id int, product_id int, [year] int, quantity int, price int)
-- Create table Product (product_id int, product_name varchar(10))
-- Truncate table Sales
-- insert into Sales (sale_id, product_id, [year], quantity, price) values ('1', '100', '2008', '10', '5000')
-- insert into Sales (sale_id, product_id, [year], quantity, price) values ('2', '100', '2009', '12', '5000')
-- insert into Sales (sale_id, product_id, [year], quantity, price) values ('7', '200', '2011', '15', '9000')
-- Truncate table Product
-- insert into Product (product_id, product_name) values ('100', 'Nokia')
-- insert into Product (product_id, product_name) values ('200', 'Apple')
-- insert into Product (product_id, product_name) values ('300', 'Samsung')

-- SOLUTION 1

-- SELECT * FROM Product
-- SELECT * FROM Sales

with
    result_set
    as
    (
        SELECT product_id, MIN([year]) as [year]
        FROM Sales
        GROUP BY product_id
    )

SELECT s1.product_id , s1.year as first_year, s1.quantity, s1.price
from Sales s1 JOIN result_set rs ON  s1.product_id = rs.product_id and s1.year = rs.year


-- END