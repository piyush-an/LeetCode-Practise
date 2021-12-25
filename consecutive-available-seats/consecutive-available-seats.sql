-- Schema
-- DROP TABLE IF EXISTS Cinema
-- Create table Cinema (seat_id int, free bit NOT NULL DEFAULT(0)) -- No Boolean datatype in sql server, so use bit with NOT NULL to represent 0 - False | 1 - True
-- Truncate table Cinema
-- insert into Cinema (seat_id, free) values (1, '1')
-- insert into Cinema (seat_id, free) values (2, '0')
-- insert into Cinema (seat_id, free) values (3, '1')
-- insert into Cinema (seat_id, free) values (4, '1')
-- insert into Cinema (seat_id, free) values (5, '1')

-- Solution 1
-- SELECT c1.seat_id
-- FROM Cinema c1 LEFT JOIN Cinema c2 ON c2.seat_id = (c1.seat_id + 1) LEFT JOIN Cinema c3 ON c3.seat_id = (c1.seat_id - 1)
-- WHERE c1.free = 1 AND (c2.free = 1 OR c3.free = 1) 
-- ORDER BY c1.seat_id

-- Solution 2
SELECT DISTINCT (c1.seat_id)
FROM Cinema c1 CROSS JOIN Cinema c2 where abs (c1.seat_id - c2.seat_id) = 1
and c1.free = 1 and c2.free = 1
ORDER BY c1.seat_id

-- End