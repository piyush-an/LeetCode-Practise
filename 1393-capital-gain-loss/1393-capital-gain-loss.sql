-- SCHEMA
-- DROP TABLE Customers
-- DROP TABLE Stocks
-- Create Table Stocks (stock_name varchar(15), operation varchar(20), operation_day int, price int)
-- Truncate table Stocks
-- insert into Stocks (stock_name, operation, operation_day, price) values ('Leetcode', 'Buy', '1', '1000')
-- insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '2', '10')
-- insert into Stocks (stock_name, operation, operation_day, price) values ('Leetcode', 'Sell', '5', '9000')
-- insert into Stocks (stock_name, operation, operation_day, price) values ('Handbags', 'Buy', '17', '30000')
-- insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '3', '1010')
-- insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '4', '1000')
-- insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '5', '500')
-- insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Buy', '6', '1000')
-- insert into Stocks (stock_name, operation, operation_day, price) values ('Handbags', 'Sell', '29', '7000')
-- insert into Stocks (stock_name, operation, operation_day, price) values ('Corona Masks', 'Sell', '10', '10000')



-- SOLUTION 1
-- Runtime: 1889 ms, faster than 52.89% of MS SQL Server online submissions for Capital Gain/Loss.
-- SELECT
--  buys.stock_name,
--  sells.total_sales - buys.total_buys as capital_gain_loss
-- FROM 
-- (SELECT 
-- stock_name, operation,
-- SUM(price) as total_buys
-- FROM Stocks
-- where operation = 'Buy'
-- GROUP BY stock_name, operation) buys
-- JOIN
-- (SELECT 
-- stock_name, operation,
-- SUM(price) as total_sales
-- FROM Stocks
-- where operation = 'Sell'
-- GROUP BY stock_name, operation) sells
-- ON buys.stock_name = sells.stock_name


-- SOLUTION 2

select
stock_name, 
capital_gain_loss = 
SUM(CASE 
WHEN operation = 'Buy' THEN -price ELSE price
END)
FROM Stocks
GROUP BY stock_name
-- END