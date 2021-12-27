-- SCHEMA
-- DROP TABLE IF EXISTS Tweets
-- Create table Tweets(tweet_id int, content varchar(50))
-- Truncate table Tweets
-- insert into Tweets (tweet_id, content) values (1, 'Vote for Biden')
-- insert into Tweets (tweet_id, content) values (2, 'Let us make America great again!')


-- SOLUTION 1 
-- Write an SQL query to find the IDs of the invalid tweets. 
-- The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

select tweet_id
-- , LEN(content) as lengthoftweet 
from Tweets where LEN(content) > 15

-- END