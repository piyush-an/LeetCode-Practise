-- SCHEMA
-- DROP TABLE Friendship
-- DROP TABLE Likes
-- Create table Friendship (user1_id int, user2_id int)
-- Create table Likes (user_id int, page_id int)
-- Truncate table Friendship
-- insert into Friendship (user1_id, user2_id) values ('1', '2')
-- insert into Friendship (user1_id, user2_id) values ('1', '3')
-- insert into Friendship (user1_id, user2_id) values ('1', '4')
-- insert into Friendship (user1_id, user2_id) values ('2', '3')
-- insert into Friendship (user1_id, user2_id) values ('2', '4')
-- insert into Friendship (user1_id, user2_id) values ('2', '5')
-- insert into Friendship (user1_id, user2_id) values ('6', '1')
-- Truncate table Likes
-- insert into Likes (user_id, page_id) values ('1', '88')
-- insert into Likes (user_id, page_id) values ('2', '23')
-- insert into Likes (user_id, page_id) values ('3', '24')
-- insert into Likes (user_id, page_id) values ('4', '56')
-- insert into Likes (user_id, page_id) values ('5', '11')
-- insert into Likes (user_id, page_id) values ('6', '33')
-- insert into Likes (user_id, page_id) values ('2', '77')
-- insert into Likes (user_id, page_id) values ('3', '77')
-- insert into Likes (user_id, page_id) values ('6', '88')


-- SOLUTION 1

-- Write an SQL query to recommend pages to the user with user_id = 1 using the pages that your friends liked. It should not recommend pages you already liked.
-- Return result table in any order without duplicates.

-- SELECT * FROM Friendship
-- SELECT * FROM Likes

-- page user 1 likes
-- select page_id from Likes where user_id = 1 

-- friends of user 1
with find_friends as 
(select user2_id from Friendship where user1_id = 1 
union
select user1_id from Friendship where user2_id = 1) 


-- select * from find_friends
select DISTINCT page_id as recommended_page from Likes where user_id IN (select * from find_friends)
EXCEPT
select page_id from Likes where user_id = 1 






-- END
