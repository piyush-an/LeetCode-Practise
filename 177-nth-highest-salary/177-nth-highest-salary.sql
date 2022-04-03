-- SCHEMA
-- DROP TABLE Employee
-- Create table Employee (id int, salary int)
-- Truncate table Employee
-- insert into Employee (id, salary) values ('1', '100')
-- insert into Employee (id, salary) values ('2', '200')
-- insert into Employee (id, salary) values ('3', '300')


-- SOLUTION 1
-- GO;
CREATE OR ALTER FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
RETURN (SELECT DISTINCT salary FROM Employee ORDeR BY salary desc OFFSET (@N-1) ROW FETCH NEXT(1) ROW ONLY);
END
-- GO;

-- select dbo.getNthHighestSalary(2)

-- SOLUTION 2
-- CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
-- BEGIN
--     IF (select COUNT( DISTINCT salary ) from Employee ) < @N
--     RETURN NULL;
    
--     RETURN (
--         /* Write your T-SQL query statement below. */
--         -- SOLUTION 1
--         -- select TOP (1) salary from (
--         -- SELECT DISTINCT TOP(@N) salary from Employee ORDER BY salary desc) result
--         -- ORDER BY salary 
        
--         -- SOLUTION 2
--         select TOP (1)
--             salary
--         from
--             (SELECT *, DENSE_RANK() OVER (ORDER BY salary desc) as dense_ranking
--             from Employee
--             ) resultset2
--         where dense_ranking = @N
--         ORDER BY salary
        
--     );
-- END