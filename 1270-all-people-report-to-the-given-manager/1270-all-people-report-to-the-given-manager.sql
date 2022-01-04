-- SCHEMA
-- DROP TABLE Employees
-- Create table Employees (employee_id int, employee_name varchar(30), manager_id int)
-- Truncate table Employees
-- insert into Employees (employee_id, employee_name, manager_id) values ('1', 'Boss', '1')
-- insert into Employees (employee_id, employee_name, manager_id) values ('3', 'Alice', '3')
-- insert into Employees (employee_id, employee_name, manager_id) values ('2', 'Bob', '1')
-- insert into Employees (employee_id, employee_name, manager_id) values ('4', 'Daniel', '2')
-- insert into Employees (employee_id, employee_name, manager_id) values ('7', 'Luis', '4')
-- insert into Employees (employee_id, employee_name, manager_id) values ('8', 'John', '3')
-- insert into Employees (employee_id, employee_name, manager_id) values ('9', 'Angela', '8')
-- insert into Employees (employee_id, employee_name, manager_id) values ('77', 'Robert', '1')


-- SOLUTION 1
-- select employee_id FROM Employees 
-- where manager_id IN
-- (select employee_id FROM Employees 
-- where manager_id IN (SELECT employee_id FROM Employees
-- where manager_id = 1)) and employee_id != 1


-- SOLUTION 2
SELECT
e1.employee_id
FROM Employees e1
JOIN Employees e2
ON e1.manager_id = e2.employee_id
JOIN Employees e3
ON e2.manager_id = e3.employee_id
WHERE e3.manager_id = 1 AND e1.employee_id != 1

-- END
