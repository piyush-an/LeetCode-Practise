-- SCHEMA
-- DROP TABLE Employee
-- Create table Employee (id int, salary int)
-- Truncate table Employee
-- insert into Employee (id, salary) values ('1', '100')
-- insert into Employee (id, salary) values ('2', '200')
-- insert into Employee (id, salary) values ('3', '300')


-- SOLUTION 1 
select MAX(Salary) as SecondHighestSalary
from Employee
where salary < (select MAX(salary)
from employee)


-- SOLUTION 2 - NOT working with null
-- with
--     find_set
--     as
--     (
--         select salary,
--             RANK() OVER (ORDER BY salary desc ) as ranking
--         -- DENSE_RANK() OVER (ORDER BY salary desc) as dense_ranking
--         from Employee
--     )

-- select
--     SecondHighestSalary = CASE WHEN (Select count(*)
--     from find_set) >= 2 THEN salary ELSE null END
-- -- ISNULL (salary, null ) as SecondHighestSalary
-- from find_set
-- where ranking = 2



-- END