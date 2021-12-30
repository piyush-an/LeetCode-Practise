-- SCHEMA
-- DROP TABLE Employee
-- DROP TABLE Department
-- Create table Employee (id int, [name] varchar(255), salary int, departmentId int)
-- Create table Department (id int, [name] varchar(255))
-- Truncate table Employee
-- insert into Employee (id, [name], salary, departmentId) values ('1', 'Joe', '70000', '1')
-- insert into Employee (id, [name], salary, departmentId) values ('2', 'Jim', '90000', '1')
-- insert into Employee (id, [name], salary, departmentId) values ('3', 'Henry', '80000', '2')
-- insert into Employee (id, [name], salary, departmentId) values ('4', 'Sam', '60000', '2')
-- insert into Employee (id, [name], salary, departmentId) values ('5', 'Max', '90000', '1')
-- Truncate table Department
-- insert into Department (id, [name]) values ('1', 'IT')
-- insert into Department (id, [name]) values ('2', 'Sales')


-- SOLUTION 1

SELECT d.name as Department, rs.name as Employee, rs.salary as Salary
from (
SELECT name, departmentId, salary,
        DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary desc) as ranking
    FROM Employee )rs JOIN Department d ON rs.departmentId = d.id
where ranking = 1


-- END