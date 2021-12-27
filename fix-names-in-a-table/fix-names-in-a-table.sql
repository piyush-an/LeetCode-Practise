-- SCHEMA
-- DROP TABLE IF EXISTS Users
-- Create table Users (user_id int, name varchar(40))
-- Truncate table Users
-- insert into Users (user_id, name) values (1, 'aLice')
-- insert into Users (user_id, name) values (2, 'bOB')

-- SOLUTION 1 - LEN to INT not necessary
-- select user_id, UPPER(LEFT([name],1)) + LOWER(RIGHT([name],(CAST((LEN(name)) AS INT) - 1 ))) as name
-- from Users
-- ORDER BY user_id


-- SOLUTION 2 - Using + for concatenation
-- select user_id, UPPER(LEFT(name,1)) +  LOWER(RIGHT(name, LEN(name)-1)) as name
-- from Users
-- ORDER BY user_id


-- SOLUTION 3 - CONCAT function for concatenation
select user_id, CONCAT(UPPER(LEFT(name,1)), LOWER(RIGHT(name, LEN(name)-1))) as name
from Users
ORDER BY user_id

-- END