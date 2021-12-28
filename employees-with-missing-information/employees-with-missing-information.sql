-- SCHEMA
-- DROP TABLE IF EXISTS Employees
-- DROP TABLE IF EXISTS Salaries
-- Create table Employees (employee_id int, name varchar(30))
-- Create table Salaries (employee_id int, salary int)
-- Truncate table Employees
-- insert into Employees (employee_id, name) values (2, 'Crew')
-- insert into Employees (employee_id, name) values (4, 'Haven')
-- insert into Employees (employee_id, name) values (5, 'Kristian')
-- Truncate table Salaries
-- insert into Salaries (employee_id, salary) values (5, 76071)
-- insert into Salaries (employee_id, salary) values (1, 22517)
-- insert into Salaries (employee_id, salary) values (4, 63539)



-- SOLUTION 1 


    select e.employee_id as employee_id
    from Employees e FULL JOIN Salaries s ON e.employee_id = s.employee_id
    where s.salary is NULL
UNION
    select s.employee_id as employee_id
    from Employees e FULL JOIN Salaries s ON e.employee_id = s.employee_id
    where e.name is NULL
ORDER BY employee_id


-- END, 