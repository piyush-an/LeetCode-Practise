-- SCHEMA
-- DROP TABLE IF EXISTS Products
-- Create table Products (product_id int, store varchar(10), price int)
-- Truncate table Products
-- insert into Products (product_id, store, price) values (0, 'store1', 95)
-- insert into Products (product_id, store, price) values (0, 'store3', 105)
-- insert into Products (product_id, store, price) values (0, 'store2', 100)
-- insert into Products (product_id, store, price) values (1, 'store1', 70)
-- insert into Products (product_id, store, price) values (1, 'store3', 80)


-- SOLUTION 1 

-- WRONG 
-- select product_id ,
-- CASE WHEN store = 'store1' THEN price ELSE NULL END AS store1,
-- CASE WHEN store = 'store2' THEN price ELSE NULL END AS store2,
-- CASE WHEN store = 'store3' THEN price ELSE NULL END AS store3
-- from Products p GROUP BY product_id, store, price

select product_id ,
MAX(CASE WHEN store = 'store1' THEN price END) AS store1,
MAX(CASE WHEN store = 'store2' THEN price END) AS store2,
MAX(CASE WHEN store = 'store3' THEN price END) AS store3
from Products p GROUP BY product_id



-- END