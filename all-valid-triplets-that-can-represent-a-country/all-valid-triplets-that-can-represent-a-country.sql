-- SCHEMA
-- DROP TABLE IF EXISTS SchoolA
-- DROP TABLE IF EXISTS SchoolB
-- DROP TABLE IF EXISTS SchoolC
-- Create table SchoolA (student_id int, student_name varchar(20))
-- Create table SchoolB (student_id int, student_name varchar(20))
-- Create table SchoolC (student_id int, student_name varchar(20))
-- Truncate table SchoolA
-- insert into SchoolA (student_id, student_name) values (1, 'Alice')
-- insert into SchoolA (student_id, student_name) values (2, 'Bob')
-- Truncate table SchoolB
-- insert into SchoolB (student_id, student_name) values (3, 'Tom')
-- Truncate table SchoolC
-- insert into SchoolC (student_id, student_name) values (3, 'Tom')
-- insert into SchoolC (student_id, student_name) values (2, 'Jerry')
-- insert into SchoolC (student_id, student_name) values (10, 'Alice')

-- SOLUTION 1 

SELECT a.student_name as member_A, b.student_name as member_B, c.student_name as member_C
FROM SchoolA a CROSS JOIN SchoolB b CROSS JOIN SchoolC c
where 
a.student_name != b.student_name and b.student_name != c.student_name and a.student_name != c.student_name
and
a.student_id != b.student_id and b.student_id != c.student_id and a.student_id != c.student_id



-- END