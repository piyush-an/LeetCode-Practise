-- SCHEMA
-- DROP TABLE IF EXISTS Product
-- DROP TABLE IF EXISTS Sales
-- Create table Product (product_id int, product_name varchar(10), unit_price int)
-- Create table Sales (seller_id int, product_id int, buyer_id int, sale_date date, quantity int, price int)
-- Truncate table Product
-- insert into Product (product_id, product_name, unit_price) values (1, 'S8', 1000)
-- insert into Product (product_id, product_name, unit_price) values (2, 'G4', 800)
-- insert into Product (product_id, product_name, unit_price) values (3, 'iPhone', 1400)
-- Truncate table Sales
-- insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values (1, 1, 1, '2019-01-21', 2, 2000)
-- insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values (1, 2, 2, '2019-02-17', 1, 800)
-- insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values (2, 2, 3, '2019-06-02', 1, 800)
-- insert into Sales (seller_id, product_id, buyer_id, sale_date, quantity, price) values (3, 3, 4, '2019-05-13', 2, 2800)


-- SOLUTION 1
-- SELECT * FROM Product
-- SELECT * FROM Sales

select seller_id
from Sales
group by seller_id
having sum(price) = (
    SELECT MAX(total_sales)
from (
select seller_id, sum(price) as total_sales
    from Sales
    group by seller_id) resultset )

-- END