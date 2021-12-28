-- SCHEMA
-- DROP TABLE IF EXISTS Problems
-- Create table Problems (problem_id int, likes int, dislikes int)
-- Truncate table Problems
-- insert into Problems (problem_id, likes, dislikes) values (6, 1290, 425)
-- insert into Problems (problem_id, likes, dislikes) values (11, 2677, 8659)
-- insert into Problems (problem_id, likes, dislikes) values (1, 4446, 2760)
-- insert into Problems (problem_id, likes, dislikes) values (7, 8569, 6086)
-- insert into Problems (problem_id, likes, dislikes) values (13, 2050, 4164)
-- insert into Problems (problem_id, likes, dislikes) values (10, 9002, 7446)

-- SOLUTION 1 


SELECT problem_id
-- , (likes * 100.0) / (likes + dislikes ) as ratio 
FROM Problems
where (likes * 100.0) / (likes + dislikes ) < 60.0
ORDER BY problem_id


-- END, 