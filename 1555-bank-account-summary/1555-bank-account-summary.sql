-- SCHEMA
-- DROP TABLE Users
-- DROP TABLE Transactions
-- Create table Users (user_id int, user_name varchar(20), credit int)
-- Create table Transactions (trans_id int, paid_by int, paid_to int, amount int, transacted_on date)
-- Truncate table Users
-- insert into Users (user_id, user_name, credit) values ('1', 'Moustafa', '100')
-- insert into Users (user_id, user_name, credit) values ('2', 'Jonathan', '200')
-- insert into Users (user_id, user_name, credit) values ('3', 'Winston', '10000')
-- insert into Users (user_id, user_name, credit) values ('4', 'Luis', '800')
-- Truncate table Transactions
-- insert into Transactions (trans_id, paid_by, paid_to, amount, transacted_on) values ('1', '1', '3', '400', '2020-08-01')
-- insert into Transactions (trans_id, paid_by, paid_to, amount, transacted_on) values ('2', '3', '2', '500', '2020-08-02')
-- insert into Transactions (trans_id, paid_by, paid_to, amount, transacted_on) values ('3', '2', '1', '200', '2020-08-03')



-- SOLUTION 1


SELECT 
-- * 
u.user_id,
u.user_name,
(u.credit + ISNULL(t.net_total, 0)) as credit,
credit_limit_breached = 
CASE
WHEN (u.credit + ISNULL(t.net_total, 0)) < 0 THEN 'Yes' ELSE 'No'
END
FROM Users u 
LEFT JOIN 
(SELECT 
user_id,
SUM(total) as net_total
FROM
(SELECT 
paid_by as user_id,
SUM(-amount) as total
FROM Transactions
GROUP BY paid_by
UNION ALL
SELECT 
paid_to user_id,
SUM(amount) as total
FROM Transactions
GROUP BY paid_to) result_set
GROUP BY user_id ) t
ON u.user_id = t.user_id




-- END