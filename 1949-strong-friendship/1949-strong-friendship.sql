-- SCHEMA

-- DROP TABLE Friendship
-- Create table Friendship (user1_id int, user2_id int)
-- Truncate table Friendship
-- insert into Friendship (user1_id, user2_id) values ('1', '2')
-- insert into Friendship (user1_id, user2_id) values ('1', '3')
-- insert into Friendship (user1_id, user2_id) values ('2', '3')
-- insert into Friendship (user1_id, user2_id) values ('1', '4')
-- insert into Friendship (user1_id, user2_id) values ('2', '4')
-- insert into Friendship (user1_id, user2_id) values ('1', '5')
-- insert into Friendship (user1_id, user2_id) values ('2', '5')
-- insert into Friendship (user1_id, user2_id) values ('1', '7')
-- insert into Friendship (user1_id, user2_id) values ('3', '7')
-- insert into Friendship (user1_id, user2_id) values ('1', '6')
-- insert into Friendship (user1_id, user2_id) values ('3', '6')
-- insert into Friendship (user1_id, user2_id) values ('2', '6')


-- SOLUTION 1

with cte as (select
user1_id, 
user2_id
from Friendship
UNION
select
user2_id user1_id, 
user1_id user2_id
from Friendship)


select
-- *
a.user1_id, a.user2_id, COUNT(c.user2_id) as common_friend
from Friendship a
JOIN cte b
ON a.user1_id = b.user1_id
JOIN cte c
ON a.user2_id = c.user1_id
and b.user2_id = c.user2_id
GROUP BY a.user1_id, a.user2_id
HAVING COUNT(c.user2_id) >= 3



-- END