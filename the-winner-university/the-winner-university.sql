-- SCHEMA
-- DROP TABLE IF EXISTS NewYork
-- DROP TABLE IF EXISTS California
-- Create table  NewYork (student_id int, score int)
-- Create table  California (student_id int, score int)
-- Truncate table NewYork
-- insert into NewYork (student_id, score) values (1, 90)
-- insert into NewYork (student_id, score) values (2, 87)
-- Truncate table California
-- insert into California (student_id, score) values (2, 89)
-- insert into California (student_id, score) values (3, 88)

-- SOLUTION 1 


-- SELECT COUNT(student_id) FROM  NewYork where score >= 90
-- SELECT COUNT(student_id) FROM  California where score >= 90

SELECT winner = CASE
WHEN (SELECT COUNT(student_id)
    FROM NewYork
    where score >= 90) = (SELECT COUNT(student_id)
    FROM California
    where score >= 90 ) THEN 'No Winner' 
WHEN (SELECT COUNT(student_id)
    FROM NewYork
    where score >= 90) > (SELECT COUNT(student_id)
    FROM California
    where score >= 90 ) THEN 'New York University'  ELSE 'California University'
END 


-- END, 