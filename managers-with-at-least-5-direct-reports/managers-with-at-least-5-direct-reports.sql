-- SCHEMA
-- DROP TABLE IF EXISTS Employee
-- Create table Employee (id int, [name] varchar(255), department varchar(255), managerId int)
-- Truncate table Employee
-- insert into Employee (id, [name], department, managerId) values ('101', 'John', 'A', null)
-- insert into Employee (id, [name], department, managerId) values ('102', 'Dan', 'A', '101')
-- insert into Employee (id, [name], department, managerId) values ('103', 'James', 'A', '101')
-- insert into Employee (id, [name], department, managerId) values ('104', 'Amy', 'A', '101')
-- insert into Employee (id, [name], department, managerId) values ('105', 'Anne', 'A', '101')
-- insert into Employee (id, [name], department, managerId) values ('106', 'Ron', 'B', '101')


-- SOLUTION 1
SELECT [name]
from Employee
where id in (
SELECT managerId
-- COUNT(*) as [counter] 
from Employee
GROUP BY managerId
having count(*) >  4 )


-- END