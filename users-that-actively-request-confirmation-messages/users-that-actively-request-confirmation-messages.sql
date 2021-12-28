-- SCHEMA
-- DROP TABLE IF EXISTS Signups
-- DROP TABLE IF EXISTS Confirmations
-- Create table Signups ([user_id] int, time_stamp datetime)
-- Create table Confirmations ([user_id] int, time_stamp datetime, [action] varchar(20))
-- Truncate table Signups
-- insert into Signups ([user_id], time_stamp) values (3, '2020-03-21 10:16:13')
-- insert into Signups ([user_id], time_stamp) values (7, '2020-01-04 13:57:59')
-- insert into Signups ([user_id], time_stamp) values (2, '2020-07-29 23:09:44')
-- insert into Signups ([user_id], time_stamp) values (6, '2020-12-09 10:39:37')
-- Truncate table Confirmations
-- insert into Confirmations ([user_id], time_stamp, [action]) values (3, '2021-01-06 03:30:46', 'timeout')
-- insert into Confirmations ([user_id], time_stamp, [action]) values (3, '2021-01-06 03:37:45', 'timeout')
-- insert into Confirmations ([user_id], time_stamp, [action]) values (7, '2021-06-12 11:57:29', 'confirmed')
-- insert into Confirmations ([user_id], time_stamp, [action]) values (7, '2021-06-13 11:57:30', 'confirmed')
-- insert into Confirmations ([user_id], time_stamp, [action]) values (2, '2021-01-22 00:00:00', 'confirmed')
-- insert into Confirmations ([user_id], time_stamp, [action]) values (2, '2021-01-23 00:00:00', 'timeout')
-- insert into Confirmations ([user_id], time_stamp, [action]) values (6, '2021-10-23 14:14:14', 'confirmed')
-- insert into Confirmations ([user_id], time_stamp, [action]) values (6, '2021-10-24 14:14:13', 'timeout')



-- SOLUTION 1 

-- SELECT * FROM Signups
-- SELECT * FROM Confirmations


select DISTINCT(c1.user_id)
-- DATEDIFF(day, MAX(time_stamp),MIN(time_stamp)),
-- DATEDIFF(hour, MAX(time_stamp),MIN(time_stamp)),
-- DATEDIFF(minute, MAX(time_stamp),MIN(time_stamp)),
-- ABS(DATEDIFF(second, MAX(time_stamp),MIN(time_stamp)))
from Confirmations c1 JOIN Confirmations c2
    ON c1.user_id = c2.user_id
        and c1.time_stamp != c2.time_stamp and
        ABS(DATEDIFF(second, c1.time_stamp, c2.time_stamp )) <= 24*60*60*1


-- GROUP BY [user_id]
-- having ABS(DATEDIFF(second, MAX(time_stamp),MIN(time_stamp))) <= 24*60*60*1

-- END, 