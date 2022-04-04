/* Write your T-SQL query statement below */
-- SCHEMA
-- Create table Enrollments (student_id int, course_id int, grade int)
-- Truncate table Enrollments
-- insert into Enrollments (student_id, course_id, grade) values ('2', '2', '95')
-- insert into Enrollments (student_id, course_id, grade) values ('2', '3', '95')
-- insert into Enrollments (student_id, course_id, grade) values ('1', '1', '90')
-- insert into Enrollments (student_id, course_id, grade) values ('1', '2', '99')
-- insert into Enrollments (student_id, course_id, grade) values ('3', '1', '80')
-- insert into Enrollments (student_id, course_id, grade) values ('3', '2', '75')
-- insert into Enrollments (student_id, course_id, grade) values ('3', '3', '82')

-- SOLUTION 1
-- select * 
-- from Enrollments

select student_id, course_id, grade from (
select *,
RANK() OVER (PARTITION BY student_id ORDER BY grade desc, course_id ) as rankings
from Enrollments ) resultset
where rankings = 1
