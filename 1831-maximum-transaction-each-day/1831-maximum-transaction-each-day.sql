-- SCHEMA

-- DROP TABLE Transactions
-- Create table Transactions (transaction_id int, day datetime, amount int)
-- Truncate table Transactions
-- insert into Transactions (transaction_id, day, amount) values ('8', '2021-4-3 15:57:28', '57')
-- insert into Transactions (transaction_id, day, amount) values ('9', '2021-4-28 08:47:25', '21')
-- insert into Transactions (transaction_id, day, amount) values ('1', '2021-4-29 13:28:30', '58')
-- insert into Transactions (transaction_id, day, amount) values ('5', '2021-4-28 16:39:59', '40')
-- insert into Transactions (transaction_id, day, amount) values ('6', '2021-4-29 23:39:28', '58')

-- SOLUTION 1


SELECT transaction_id FROM 
(SELECT 
*,
DENSE_RANK() OVER (PARTITION BY CAST([day] as DATE)  ORDER BY amount desc) as ranking
FROM Transactions) result_set
where ranking = 1
ORDER BY transaction_id

-- GROUP BY CAST([day] as DATE)






-- END