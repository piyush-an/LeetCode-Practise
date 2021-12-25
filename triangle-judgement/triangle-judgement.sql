
-- SCHEMA
-- DROP TABLE IF EXISTS Triangle
-- Create table Triangle (x int, y int, z int)
-- Truncate table Triangle
-- insert into Triangle (x, y, z) values (13, 15, 30)
-- insert into Triangle (x, y, z) values (10, 20, 15)

-- SOLUTION

--  Triangle Length sum rule
-- x + y > z
-- y + z > x
-- x + z > y

SELECT *, triangle = 
CASE WHEN
x + y > z and y + z > x and x + z > y THEN 'Yes'
ELSE 'No'
END
FROM Triangle


-- END