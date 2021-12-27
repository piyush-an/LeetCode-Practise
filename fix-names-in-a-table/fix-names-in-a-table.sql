-- SCHEMA
-- DROP TABLE IF EXISTS Users
-- Create table Users (user_id int, name varchar(40))
-- Truncate table Users
-- insert into Users (user_id, name) values (1, 'aLice')
-- insert into Users (user_id, name) values (2, 'bOB')

-- SOLUTION 1


select user_id, UPPER(LEFT([name],1)) + LOWER(RIGHT([name],(CAST((LEN(name)) AS INT) - 1 ))) as name
from Users
ORDER BY user_id


-- 'end'