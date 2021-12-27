-- SCHEMA
-- DROP TABLE IF EXISTS Followers
-- Create table Followers([user_id] int, follower_id int)
-- Truncate table Followers
-- insert into Followers ([user_id], follower_id) values (0, 1)
-- insert into Followers ([user_id], follower_id) values (1, 0)
-- insert into Followers ([user_id], follower_id) values (2, 0)
-- insert into Followers ([user_id], follower_id) values (2, 1)


-- SOLUTION 1 

-- no duplicate
-- Write an SQL query that will, for each user, return the number of followers.
-- Return the result table ordered by user_id.


select [user_id], COUNT(follower_id) as followers_count
from Followers
GROUP BY [user_id]
order by [user_id]


-- END