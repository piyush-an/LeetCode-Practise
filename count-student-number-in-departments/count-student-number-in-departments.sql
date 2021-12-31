-- SCHEMA
-- DROP TABLE IF EXISTS Student
-- DROP TABLE IF EXISTS Department
-- Create table Student (student_id int,student_name varchar(45), gender varchar(6), dept_id int)
-- Create table Department (dept_id int, dept_name varchar(255))
-- Truncate table Student
-- insert into Student (student_id, student_name, gender, dept_id) values ('1', 'Jack', 'M', '1')
-- insert into Student (student_id, student_name, gender, dept_id) values ('2', 'Jane', 'F', '1')
-- insert into Student (student_id, student_name, gender, dept_id) values ('3', 'Mark', 'M', '2')
-- Truncate table Department
-- insert into Department (dept_id, dept_name) values ('1', 'Engineering')
-- insert into Department (dept_id, dept_name) values ('2', 'Science')
-- insert into Department (dept_id, dept_name) values ('3', 'Law')

-- SOLUTION 1

-- with find_people as (
-- SELECT dept_id, COUNT(dept_id) OVER (PARTITION BY dept_id) as student_number FROM  Student )

-- select dept_name, ISNULL(student_number, 0) as student_number
-- from find_people fp RIGHT JOIN Department d ON fp.dept_id = d.dept_id
-- group by dept_name, student_number
-- order by student_number desc, dept_name

-- SOLUTION 2
select d.dept_name, COUNT(s.student_id) as student_number
from Department d LEFT JOIN Student s ON d.dept_id = s.dept_id
GROUP BY dept_name
order by student_number desc, d.dept_name

-- END