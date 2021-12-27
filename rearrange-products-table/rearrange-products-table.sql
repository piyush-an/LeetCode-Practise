-- SCHEMA
-- DROP TABLE IF EXISTS Products
-- Create table Products (product_id int, store1 int, store2 int, store3 int)
-- Truncate table Products
-- insert into Products (product_id, store1, store2, store3) values (0, 95, 100, 105)
-- insert into Products (product_id, store1, store2, store3) values (1, 70, null, 80)


-- SOLUTION 1 
-- SELECT product_id, 'store1' as store, store1 as price from Products where store1 is not NULL
-- union
-- SELECT product_id, 'store2' as store, store2 as price from Products where store2 is not NULL
-- union
-- SELECT product_id, 'store3' as store, store3 as price from Products where store3 is not NULL


-- SOLUTION 2
SELECT product_id, store, price 
FROM Products 
UNPIVOT (
    price
    for store in (store1, store2, store3)
) as unpivot_example


-- END