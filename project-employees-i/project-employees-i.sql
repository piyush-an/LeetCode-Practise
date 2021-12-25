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

SELECT p.project_id, 
ROUND(CAST(CAST(SUM(e.experience_years) AS DECIMAL(15,5)) / COUNT(e.experience_years) AS DECIMAL (15,5)), 2) AS average_years
-- ROUND(AVG(), 2)AS average_years
from Project p JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id 
ORDER BY p.project_id 


-- select project_id, Round(Avg(1.00 * experience_years),2) as average_years from Project as P join Employee as E on P.employee_id=E.employee_id
-- group by project_id

-- END