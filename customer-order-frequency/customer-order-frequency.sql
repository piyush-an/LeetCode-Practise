-- SCHEMA
-- DROP TABLE IF EXISTS Customers
-- DROP TABLE IF EXISTS Product
-- DROP TABLE IF EXISTS Orders

-- Create table  Customers (customer_id int, [name] varchar(30), country varchar(30))
-- Create table  Product (product_id int, [description] varchar(30), price int)
-- Create table  Orders (order_id int, customer_id int, product_id int, order_date date, quantity int)
-- Truncate table Customers
-- insert into Customers (customer_id, [name], country) values (1, 'Winston', 'USA')
-- insert into Customers (customer_id, [name], country) values (2, 'Jonathan', 'Peru')
-- insert into Customers (customer_id, [name], country) values (3, 'Moustafa', 'Egypt')
-- Truncate table Product
-- insert into Product (product_id, [description], price) values (10, 'LC Phone', 300)
-- insert into Product (product_id, [description], price) values (20, 'LC T-Shirt', 10)
-- insert into Product (product_id, [description], price) values (30, 'LC Book', 45)
-- insert into Product (product_id, [description], price) values (40, 'LC Keychain', 2)
-- Truncate table Orders
-- insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (1, 1, 10, '2020-06-10', 1)
-- insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (2, 1, 20, '2020-07-01', 1)
-- insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (3, 1, 30, '2020-07-08', 2)
-- insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (4, 2, 10, '2020-06-15', 2)
-- insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (5, 2, 40, '2020-07-01', 10)
-- insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (6, 3, 20, '2020-06-24', 2)
-- insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (7, 3, 30, '2020-06-25', 2)
-- insert into Orders (order_id, customer_id, product_id, order_date, quantity) values (9, 3, 30, '2020-05-08', 3)

-- SOLUTION 1 

-- SELECT * FROM Customers
-- SELECT * FROM Product
-- SELECT * FROM Orders

-- Write an SQL query to report the customer_id and customer_name of customers who have spent at least $100 in each month of June and July 2020.
-- select c.customer_id, MONTH(o.order_date), o.quantity * p.price as sales from Orders o LEFT JOIN Customers c ON o.customer_id = c.customer_id LEFT JOIN Product p ON o.product_id = p.product_id 
-- where MONTH(o.order_date) BETWEEN 6 and 7 and YEAR(o.order_date) = 2020

-- SELECT customer_id, [name] from (
-- SELECT customer_id, [name], order_date, sum(sales) as sales from
-- (select c.customer_id, c.[name], MONTH(o.order_date) as order_date, o.quantity * p.price as sales from Orders o LEFT JOIN Customers c ON o.customer_id = c.customer_id LEFT JOIN Product p ON o.product_id = p.product_id 
-- where MONTH(o.order_date) BETWEEN 6 and 7 and YEAR(o.order_date) = 2020 ) resultset group by customer_id, [name], order_date ) resultset2  where (order_date = 6 and sales > 100) and (order_date = 7 and sales > 100 )


with
    temp_result_set
    as
    (
        select
            c.customer_id, c.[name]
        from Orders o LEFT JOIN Customers c ON o.customer_id = c.customer_id LEFT JOIN Product p ON o.product_id = p.product_id
        where ((MONTH(o.order_date) BETWEEN 6 and 7) and (YEAR(o.order_date) = 2020))
        GROUP BY c.customer_id, c.[name], month(order_date)
        having 
sum(o.quantity * p.price) >= 100
    )


select customer_id, [name]
from temp_result_set
group by customer_id, [name]
having count(*) >= 2
 
-- END