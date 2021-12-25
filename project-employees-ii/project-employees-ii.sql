-- SCHEMA
-- DROP TABLE IF EXISTS Project
-- DROP TABLE IF EXISTS Employee
-- Create table Project (project_id int, employee_id int)
-- Create table Employee (employee_id int, name varchar(10), experience_years int)
-- Truncate table Project
-- insert into Project (project_id, employee_id) values (1, 1)
-- insert into Project (project_id, employee_id) values (1, 2)
-- insert into Project (project_id, employee_id) values (1, 3)
-- insert into Project (project_id, employee_id) values (2, 1)
-- insert into Project (project_id, employee_id) values (2, 4)
-- Truncate table Employee
-- insert into Employee (employee_id, name, experience_years) values (1, 'Khaled', 3)
-- insert into Employee (employee_id, name, experience_years) values (2, 'Ali', 2)
-- insert into Employee (employee_id, name, experience_years) values (3, 'John', 1)
-- insert into Employee (employee_id, name, experience_years) values (4, 'Doe', 2)


-- SOLUTION 1
-- SELECT * FROM Project
-- SELECT * FROM Employee
-- https://stackoverflow.com/questions/5159928/sql-displaying-entries-that-are-the-max-of-a-count/5160004

SELECT project_id FROM Project GROUP BY project_id HAVING COUNT(employee_id) = ( SELECT MAX(emp_count) FROM 
(SELECT project_id, COUNT(employee_id) as emp_count FROM Project GROUP BY project_id ) resultset)

-- END