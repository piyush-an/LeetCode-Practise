-- SCHEMA
-- DROP TABLE IF EXISTS Students
-- DROP TABLE IF EXISTS Subjects
-- DROP TABLE IF EXISTS Examinations
-- Create table Students (student_id int, student_name varchar(20))
-- Create table Subjects (subject_name varchar(20))
-- Create table Examinations (student_id int, subject_name varchar(20))
-- Truncate table Students
-- insert into Students (student_id, student_name) values (1, 'Alice')
-- insert into Students (student_id, student_name) values (2, 'Bob')
-- insert into Students (student_id, student_name) values (13, 'John')
-- insert into Students (student_id, student_name) values (6, 'Alex')
-- Truncate table Subjects
-- insert into Subjects (subject_name) values ('Math')
-- insert into Subjects (subject_name) values ('Physics')
-- insert into Subjects (subject_name) values ('Programming')
-- Truncate table Examinations
-- insert into Examinations (student_id, subject_name) values (1, 'Math')
-- insert into Examinations (student_id, subject_name) values (1, 'Physics')
-- insert into Examinations (student_id, subject_name) values (1, 'Programming')
-- insert into Examinations (student_id, subject_name) values (2, 'Programming')
-- insert into Examinations (student_id, subject_name) values (1, 'Physics')
-- insert into Examinations (student_id, subject_name) values (1, 'Math')
-- insert into Examinations (student_id, subject_name) values (13, 'Math')
-- insert into Examinations (student_id, subject_name) values (13, 'Programming')
-- insert into Examinations (student_id, subject_name) values (13, 'Physics')
-- insert into Examinations (student_id, subject_name) values (2, 'Math')
-- insert into Examinations (student_id, subject_name) values (1, 'Math')

-- SOLUTION 1

-- SELECT * FROM Students
-- SELECT * FROM Subjects
-- SELECT * FROM Examinations
SELECT st.student_id , st.student_name , su.subject_name, ISNULL(attended_exams, 0) AS attended_exams
from Students st CROSS JOIN  Subjects su LEFT JOIN (
SELECT student_id, subject_name, COUNT(subject_name) AS attended_exams
    FROM Examinations
    GROUP BY student_id, subject_name  ) resultset ON st.student_id = resultset.student_id AND su.subject_name = resultset.subject_name
ORDER BY st.student_id, su.subject_name


-- END