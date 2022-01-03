-- SCHEMA
-- DROP TABLE Views
-- Create table Views (article_id int, author_id int, viewer_id int, view_date date)
-- Truncate table Views
-- insert into Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '5', '2019-08-01')
-- insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '5', '2019-08-01')
-- insert into Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '6', '2019-08-02')
-- insert into Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '7', '2019-08-01')
-- insert into Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '6', '2019-08-02')
-- insert into Views (article_id, author_id, viewer_id, view_date) values ('4', '7', '1', '2019-07-22')
-- insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21')
-- insert into Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21')

-- SOLUTION 1

-- Write an SQL query to find all the people who viewed more than one article on the same date.
-- Return the result table sorted by id in ascending order.

SELECT DISTINCT viewer_id as id
-- , view_date, COUNT(DISTINCT article_id) 
FROM Views
GROUP BY viewer_id, view_date 
HAVING COUNT(DISTINCT article_id)  >= 2
ORDER BY id


-- END
