-- SCHEMA
-- DROP TABLE IF EXISTS Employee
-- Create table Employee (employee_id int, team_id int)
-- Truncate table Employee
-- insert into Employee (employee_id, team_id) values (1, 8)
-- insert into Employee (employee_id, team_id) values (2, 8)
-- insert into Employee (employee_id, team_id) values (3, 8)
-- insert into Employee (employee_id, team_id) values (4, 7)
-- insert into Employee (employee_id, team_id) values (5, 9)
-- insert into Employee (employee_id, team_id) values (6, 9)

-- SOLUTION 1
-- select * from Employee
-- select e1.employee_id, COUNT(*) AS team_size
-- from Employee e1 CROSS JOIN Employee e2
-- WHERE e1.team_id = e2.team_id
-- GROUP BY e1.employee_id
-- ORDER BY e1.employee_id

-- SOLUTION 2
select e.employee_id, (select count(team_id)
    from employee
    where team_id = e.team_id) AS team_size
FROM EMPLOYEE e

-- END