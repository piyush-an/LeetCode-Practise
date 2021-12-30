CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    IF (select COUNT( DISTINCT salary ) from Employee ) < @N
    RETURN NULL;
    
    RETURN (
        /* Write your T-SQL query statement below. */
        -- SOLUTION 1
        -- select TOP (1) salary from (
        -- SELECT DISTINCT TOP(@N) salary from Employee ORDER BY salary desc) result
        -- ORDER BY salary 
        
        -- SOLUTION 2
        select TOP (1)
            salary
        from
            (SELECT *, DENSE_RANK() OVER (ORDER BY salary desc) as dense_ranking
            from Employee
            ) resultset2
        where dense_ranking = @N
        ORDER BY salary
        
    );
END