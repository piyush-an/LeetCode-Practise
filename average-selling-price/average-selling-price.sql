-- SCHEMA
-- DROP TABLE IF EXISTS Prices
-- DROP TABLE IF EXISTS UnitsSold
-- Create table Prices (product_id int, [start_date] date, end_date date, price int)
-- Create table UnitsSold (product_id int, purchase_date date, units int)
-- Truncate table Prices
-- insert into Prices (product_id, [start_date], end_date, price) values (1, '2019-02-17', '2019-02-28', 5)
-- insert into Prices (product_id, [start_date], end_date, price) values (1, '2019-03-01', '2019-03-22', 20)
-- insert into Prices (product_id, [start_date], end_date, price) values (2, '2019-02-01', '2019-02-20', 15)
-- insert into Prices (product_id, [start_date], end_date, price) values (2, '2019-02-21', '2019-03-31', 30)
-- Truncate table UnitsSold
-- insert into UnitsSold (product_id, purchase_date, units) values (1, '2019-02-25', 100)
-- insert into UnitsSold (product_id, purchase_date, units) values (1, '2019-03-01', 15)
-- insert into UnitsSold (product_id, purchase_date, units) values (2, '2019-02-10', 200)
-- insert into UnitsSold (product_id, purchase_date, units) values (2, '2019-03-22', 30)

-- SOLUTION 1

select product_id, CAST((ROUND(sum(sales) * 1.00 / sum(units), 2)) AS DECIMAL(5,2)) as average_price
from (select u.product_id, u.units, units * price AS sales
    from UnitsSold u JOIN Prices p on u.product_id = p.product_id and u.purchase_date BETWEEN p.[start_date] and  p.end_date
) resultset
GROUP BY product_id

-- END