-- SCHEMA
-- DROP TABLE IF EXISTS cinema
-- Create table cinema (id int, movie varchar(255), [description] varchar(255), rating DECIMAL (2, 1))
-- Truncate table cinema
-- insert into cinema (id, movie, description, rating) values (1, 'War', 'great 3D', 8.9)
-- insert into cinema (id, movie, description, rating) values (2, 'Science', 'fiction', 8.5)
-- insert into cinema (id, movie, description, rating) values (3, 'irish', 'boring', 6.2)
-- insert into cinema (id, movie, description, rating) values (4, 'Ice song', 'Fantacy', 8.6)
-- insert into cinema (id, movie, description, rating) values (5, 'House card', 'Interesting', 9.1)


-- SOLUTION 1

SELECT *
FROM cinema
WHERE (id % 2 != 0 ) AND description NOT LIKE '%boring%'
ORDER BY rating DESC

-- END