-- SCHEMA
-- DROP TABLE IF EXISTS TVProgram
-- DROP TABLE IF EXISTS Content
-- Create table TVProgram (program_date datetime, content_id int, channel varchar(30))
-- Create table Content (content_id varchar(30), title varchar(30), Kids_content char(1), content_type varchar(30))
-- Truncate table TVProgram
-- insert into TVProgram (program_date, content_id, channel) values ('2020-06-10 08:00', 1, 'LC-Channel')
-- insert into TVProgram (program_date, content_id, channel) values ('2020-05-11 12:00', 2, 'LC-Channel')
-- insert into TVProgram (program_date, content_id, channel) values ('2020-05-12 12:00', 3, 'LC-Channel')
-- insert into TVProgram (program_date, content_id, channel) values ('2020-05-13 14:00', 4, 'Disney Ch')
-- insert into TVProgram (program_date, content_id, channel) values ('2020-06-18 14:00', 4, 'Disney Ch')
-- insert into TVProgram (program_date, content_id, channel) values ('2020-07-15 16:00', 5, 'Disney Ch')
-- Truncate table Content
-- insert into Content (content_id, title, Kids_content, content_type) values (1, 'Leetcode Movie', 'N', 'Movies')
-- insert into Content (content_id, title, Kids_content, content_type) values (2, 'Alg. for Kids', 'Y', 'Series')
-- insert into Content (content_id, title, Kids_content, content_type) values (3, 'Database Sols', 'N', 'Series')
-- insert into Content (content_id, title, Kids_content, content_type) values (4, 'Aladdin', 'Y', 'Movies')
-- insert into Content (content_id, title, Kids_content, content_type) values (5, 'Cinderella', 'Y', 'Movies')

-- SOLUTION 1 

-- Write an SQL query to report the distinct titles of the kid-friendly movies streamed in June 2020.
select distinct c.title
from Content c JOIN TVProgram tvp ON c.content_id = tvp.content_id
where c.content_type = 'Movies' and c.Kids_content = 'Y' and MONTH(tvp.program_date) = 6 and YEAR(tvp.program_date) = 2020



-- END