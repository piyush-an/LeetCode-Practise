-- SCHEMA
-- DROP TABLE IF EXISTS Employees
-- Create table Employees (employee_id int, [name] varchar(20), manager_id int, salary int)
-- Truncate table Employees
-- insert into Employees (employee_id, [name], manager_id, salary) values (3, 'Mila', 9, 60301)
-- insert into Employees (employee_id, [name], manager_id, salary) values (12, 'Antonella', null, 31000)
-- insert into Employees (employee_id, [name], manager_id, salary) values (13, 'Emery', null, 67084)
-- insert into Employees (employee_id, [name], manager_id, salary) values (1, 'Kalel', 11, 21241)
-- insert into Employees (employee_id, [name], manager_id, salary) values (9, 'Mikaela', null, 50937)
-- insert into Employees (employee_id, [name], manager_id, salary) values (11, 'Joziah', 6, 28485)

-- Truncate table Employees
-- insert into Employees (employee_id, [name], manager_id, salary) values (4, 'Maddox', null, 79405)
-- insert into Employees (employee_id, [name], manager_id, salary) values (10, 'Trinity', null, 55230)
-- insert into Employees (employee_id, [name], manager_id, salary) values (14, 'Judah', 9, 48967)
-- insert into Employees (employee_id, [name], manager_id, salary) values (1, 'Aden', 4, 77162)
-- insert into Employees (employee_id, [name], manager_id, salary) values (12, 'Chase', 5, 69979)
-- insert into Employees (employee_id, [name], manager_id, salary) values (11, 'Cassius', 6, 37762)
-- insert into Employees (employee_id, [name], manager_id, salary) values (8, 'Lyra', 3, 53001)
-- insert into Employees (employee_id, [name], manager_id, salary) values (13, 'Giovanni', 4, 37083)

-- SOLUTION 1 


SELECT e1.employee_id
FROM Employees e1 LEFT JOIN Employees e2 ON e1.manager_id = e2.employee_id
WHERE 
e1.manager_id is not null 
and e2.employee_id is null
and e1.salary < 30000
ORDER BY 1




-- END, 