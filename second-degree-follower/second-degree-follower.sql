-- SCHEMA
-- DROP TABLE Follow
-- Create table Follow (followee varchar(255), follower varchar(255))
-- Truncate table Follow
-- insert into Follow (followee, follower) values ('Alice', 'Bob')
-- insert into Follow (followee, follower) values ('Bob', 'Cena')
-- insert into Follow (followee, follower) values ('Bob', 'Donald')
-- insert into Follow (followee, follower) values ('Donald', 'Edward')

-- SOLUTION 1



SELECT followee as follower, COUNT(*) as num
from Follow
where followee IN (SELECT DISTINCT follower
from Follow )
GROUP BY followee
ORDER BY followee

-- END