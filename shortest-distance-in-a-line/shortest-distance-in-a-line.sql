
-- SCHEMA
-- DROP TABLE IF EXISTS Point
-- Create Table Point (x int not null)
-- Truncate table Point
-- insert into Point (x) values (-1)
-- insert into Point (x) values (0)
-- insert into Point (x) values (2)

-- SOLUTION 1
-- SELECT TOP 1
--     -- p1.x as PointA, p2.x as PointB, 
--     ABS(p1.x - p2.x) AS shortest
-- FROM Point p1 CROSS JOIN Point p2
-- where p1.x != p2.x
-- ORDER BY shortest

-- SOLUTION 2
SELECT MIN(ABS(p1.x - p2.x)) as shortest
FROM Point p1 JOIN Point p2
ON p1.x != p2.x

-- END