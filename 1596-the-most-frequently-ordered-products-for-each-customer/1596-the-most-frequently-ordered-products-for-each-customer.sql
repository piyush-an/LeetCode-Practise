-- SCHEMA
-- DROP TABLE Customers
-- DROP TABLE Orders
-- DROP TABLE Products
-- Create table Customers (customer_id int, name varchar(10))
-- Create table Orders (order_id int, order_date date, customer_id int, product_id int)
-- Create table Products (product_id int, product_name varchar(20), price int)

-- Truncate table Customers
-- insert into Customers (customer_id, name) values ('1', 'Alice')
-- insert into Customers (customer_id, name) values ('2', 'Bob')
-- insert into Customers (customer_id, name) values ('3', 'Tom')
-- insert into Customers (customer_id, name) values ('4', 'Jerry')
-- insert into Customers (customer_id, name) values ('5', 'John')
-- Truncate table Orders
-- insert into Orders (order_id, order_date, customer_id, product_id) values ('1', '2020-07-31', '1', '1')
-- insert into Orders (order_id, order_date, customer_id, product_id) values ('2', '2020-7-30', '2', '2')
-- insert into Orders (order_id, order_date, customer_id, product_id) values ('3', '2020-08-29', '3', '3')
-- insert into Orders (order_id, order_date, customer_id, product_id) values ('4', '2020-07-29', '4', '1')
-- insert into Orders (order_id, order_date, customer_id, product_id) values ('5', '2020-06-10', '1', '2')
-- insert into Orders (order_id, order_date, customer_id, product_id) values ('6', '2020-08-01', '2', '1')
-- insert into Orders (order_id, order_date, customer_id, product_id) values ('7', '2020-08-01', '3', '3')
-- insert into Orders (order_id, order_date, customer_id, product_id) values ('8', '2020-08-03', '1', '2')
-- insert into Orders (order_id, order_date, customer_id, product_id) values ('9', '2020-08-07', '2', '3')
-- insert into Orders (order_id, order_date, customer_id, product_id) values ('10', '2020-07-15', '1', '2')
-- Truncate table Products
-- insert into Products (product_id, product_name, price) values ('1', 'keyboard', '120')
-- insert into Products (product_id, product_name, price) values ('2', 'mouse', '80')
-- insert into Products (product_id, product_name, price) values ('3', 'screen', '600')
-- insert into Products (product_id, product_name, price) values ('4', 'hard disk', '450')



-- SOLUTION 1


select
customer_id, result_set.product_id, p.product_name
from 
(SELECT 
-- *
customer_id, product_id, COUNT(product_id) as qty, DENSE_RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(product_id) desc) as ranking
FROM Orders
GROUP BY customer_id, product_id) result_set 
JOIN Products p 
ON result_set.product_id = p.product_id
-- ORDER BY customer_id, qty desc
where ranking = 1

-- END