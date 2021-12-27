-- SCHEMA
-- DROP TABLE IF EXISTS Employees
-- Create table Employees(employee_id int, [name] varchar(20), reports_to int, age int)
-- Truncate table Employees
-- insert into Employees (employee_id, [name], reports_to, age) values (9, 'Hercy', null, 43)
-- insert into Employees (employee_id, [name], reports_to, age) values (6, 'Alice', 9, 41)
-- insert into Employees (employee_id, [name], reports_to, age) values (4, 'Bob', 9, 36)
-- insert into Employees (employee_id, [name], reports_to, age) values (2, 'Winston', null, 37)


-- SOLUTION 1 
-- Write an SQL query to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
-- Return the result table ordered by employee_id.
-- select * from Employees
select e2.employee_id, e2.name, COUNT(e1.employee_id) as reports_count, CAST(ROUND(AVG(e1.age * 1.0), 0) AS int)  as average_age
from Employees e1 JOIN Employees e2 ON e1.reports_to = e2.employee_id
GROUP BY e2.employee_id,  e2.name
order by e2.employee_id


-- END