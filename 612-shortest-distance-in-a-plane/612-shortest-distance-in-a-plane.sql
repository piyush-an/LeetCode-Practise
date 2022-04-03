-- SCHEMA
-- DROP TABLE Point2D
-- Create Table Point2D (x int not null, y int not null)
-- Truncate table Point2D
-- insert into Point2D (x, y) values ('-1', '-1')
-- insert into Point2D (x, y) values ('0', '0')
-- insert into Point2D (x, y) values ('-1', '-2')



-- SOLUTION 2
select TOP 1 
CAST (ROUND(SQRT(POWER((p2.x - p1.x),2) + POWER((p2.y - p1.y),2)),2) as DECIMAL(10,2)) as shortest 
from Point2D p1
JOIN Point2D p2
ON (p1.x != p2.x or p1.y != p2.y)
ORDER BY 1 


-- SOLUTION 1

-- sqrt((x2 - x1)2 + (y2 - y1)2)

-- with
--     two_points
--     as
--     (
--         select t1.x as x1,
--             t1.y as y1,
--             t2.x as x2,
--             t2.y as y2
--         from Point2D t1 JOIN Point2D t2 ON t1.x != t2.x or t1.y != t2.y
--     )

-- select TOP 1
--     CAST (( ROUND(SQRT(
--  POWER((x2 - x1), 2) + POWER((y2 - y1), 2)), 2)) as decimal(20,2)) as shortest
-- from two_points
-- ORDER BY 1



-- END