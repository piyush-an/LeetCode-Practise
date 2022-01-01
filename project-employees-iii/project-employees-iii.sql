-- SCHEMA
-- DROP TABLE Project
-- DROP TABLE Employee
-- Create table Project (project_id int, employee_id int)
-- Create table Employee (employee_id int, [name] varchar(10), experience_years int)
-- Truncate table Project
-- insert into Project (project_id, employee_id) values ('1', '1')
-- insert into Project (project_id, employee_id) values ('1', '2')
-- insert into Project (project_id, employee_id) values ('1', '3')
-- insert into Project (project_id, employee_id) values ('2', '1')
-- insert into Project (project_id, employee_id) values ('2', '4')
-- Truncate table Employee
-- insert into Employee (employee_id, [name], experience_years) values ('1', 'Khaled', '3')
-- insert into Employee (employee_id, [name], experience_years) values ('2', 'Ali', '2')
-- insert into Employee (employee_id, [name], experience_years) values ('3', 'John', '3')
-- insert into Employee (employee_id, [name], experience_years) values ('4', 'Doe', '2')

-- SOLUTION 1

-- SELECT * FROM Project
-- SELECT * FROM Employee


-- with result_set (
-- SELECT p.project_id as project_id, MAX(experience_years) as max_year_exp
-- -- p.employee_id 
-- FROM Project p JOIN Employee e ON p.employee_id = e.employee_id GROUP BY project_id )


SELECT p.project_id, p.employee_id
from Project p JOIN Employee e ON p.employee_id = e.employee_id JOIN (
SELECT p.project_id as project_id, MAX(experience_years) as max_year_exp
    -- p.employee_id 
    FROM Project p JOIN Employee e ON p.employee_id = e.employee_id
    GROUP BY project_id ) result_set ON p.project_id = result_set.project_id
where result_set.max_year_exp = e.experience_years

-- END