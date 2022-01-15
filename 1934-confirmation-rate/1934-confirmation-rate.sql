-- SCHEMA

-- DROP TABLE Signups
-- DROP TABLE Confirmations
-- Create table Signups (user_id int, time_stamp datetime)
-- Create table Confirmations (user_id int, time_stamp datetime, action varchar(20))
-- Truncate table Signups
-- insert into Signups (user_id, time_stamp) values ('3', '2020-03-21 10:16:13')
-- insert into Signups (user_id, time_stamp) values ('7', '2020-01-04 13:57:59')
-- insert into Signups (user_id, time_stamp) values ('2', '2020-07-29 23:09:44')
-- insert into Signups (user_id, time_stamp) values ('6', '2020-12-09 10:39:37')
-- Truncate table Confirmations
-- insert into Confirmations (user_id, time_stamp, action) values ('3', '2021-01-06 03:30:46', 'timeout')
-- insert into Confirmations (user_id, time_stamp, action) values ('3', '2021-07-14 14:00:00', 'timeout')
-- insert into Confirmations (user_id, time_stamp, action) values ('7', '2021-06-12 11:57:29', 'confirmed')
-- insert into Confirmations (user_id, time_stamp, action) values ('7', '2021-06-13 12:58:28', 'confirmed')
-- insert into Confirmations (user_id, time_stamp, action) values ('7', '2021-06-14 13:59:27', 'confirmed')
-- insert into Confirmations (user_id, time_stamp, action) values ('2', '2021-01-22 00:00:00', 'confirmed')
-- insert into Confirmations (user_id, time_stamp, action) values ('2', '2021-02-28 23:59:59', 'timeout')

-- SOLUTION 1

-- SELECT * FROM Signups
-- SELECT * FROM Confirmations


-- The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. 
-- The confirmation rate of a user that did not request any confirmation messages is 0. 
-- Round the confirmation rate to two decimal places.
-- Write an SQL query to find the confirmation rate of each user.
-- Return the result table in any order.

-- SELECT 
-- * 
-- FROM Signups s
-- LEFT JOIN Confirmations c
-- ON s.user_id = c.user_id



SELECT 
-- *
s.user_id,
ISNULL(confirmation_rate, 0.00) confirmation_rate
FROM Signups s
LEFT JOIN 
(select 
-- * 
user_id,
CAST (ROUND(SUM(CASE
WHEN action = 'confirmed' THEN 1 ELSE 0
END) * 1.00/COUNT([action]), 2) as DECIMAL(20,2)) confirmation_rate
from Confirmations c
GROUP BY user_id) rs
ON s.user_id = rs.user_id
ORDER BY s.user_id




-- END