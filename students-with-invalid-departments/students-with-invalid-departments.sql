-- SCHEMA
-- DROP TABLE IF EXISTS Departments
-- DROP TABLE IF EXISTS Students
-- Create table Departments (id int, name varchar(30))
-- Create table Students (id int, name varchar(30), department_id int)
-- Truncate table Departments
-- insert into Departments (id, name) values (1, 'Electrical Engineering')
-- insert into Departments (id, name) values (7, 'Computer Engineering')
-- insert into Departments (id, name) values (13, 'Bussiness Administration')
-- Truncate table Students
-- insert into Students (id, name, department_id) values (23, 'Alice', 1)
-- insert into Students (id, name, department_id) values (1, 'Bob', 7)
-- insert into Students (id, name, department_id) values (5, 'Jennifer', 13)
-- insert into Students (id, name, department_id) values (2, 'John', 14)
-- insert into Students (id, name, department_id) values (4, 'Jasmine', 77)
-- insert into Students (id, name, department_id) values (3, 'Steve', 74)
-- insert into Students (id, name, department_id) values (6, 'Luis', 1)
-- insert into Students (id, name, department_id) values (8, 'Jonathan', 7)
-- insert into Students (id, name, department_id) values (7, 'Daiana', 33)
-- insert into Students (id, name, department_id) values (11, 'Madelynn', 1)

-- SOLUTION 1
-- select DISTINCT (s.id), s.name
-- from Students s LEFT JOIN Departments d ON s.department_id = d.id
-- where d.id is null
-- ORDER BY s.id


-- SOLUTION 2
select id, [name] from Students where department_id NOT IN (select id from Departments)

-- END