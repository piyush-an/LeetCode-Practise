CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    IF (select COUNT( DISTINCT salary ) from Employee ) < @N
    RETURN NULL;
    
    RETURN (
        /* Write your T-SQL query statement below. */
        select TOP (1) salary from (
SELECT DISTINCT TOP(@N) salary from Employee ORDER BY salary desc) result
ORDER BY salary 
    );
END