-- SCHEMA
-- DROP TABLE IF EXISTS Employee
-- Create table Employee (employee_id int, department_id int, primary_flag char)
-- Truncate table Employee
-- insert into Employee (employee_id, department_id, primary_flag) values (1, 1, 'N')
-- insert into Employee (employee_id, department_id, primary_flag) values (2, 1, 'Y')
-- insert into Employee (employee_id, department_id, primary_flag) values (2, 2, 'N')
-- insert into Employee (employee_id, department_id, primary_flag) values (3, 3, 'N')
-- insert into Employee (employee_id, department_id, primary_flag) values (4, 2, 'N')
-- insert into Employee (employee_id, department_id, primary_flag) values (4, 3, 'Y')
-- insert into Employee (employee_id, department_id, primary_flag) values (4, 4, 'N')


-- SOLUTION 1 
SELECT employee_id, department_id
FROM (
select
        *,
        COUNT(department_id) OVER(PARTITION BY employee_id ) as group_count
    from Employee ) result_set
WHERE
group_count = 1 OR primary_flag = 'Y'


-- END