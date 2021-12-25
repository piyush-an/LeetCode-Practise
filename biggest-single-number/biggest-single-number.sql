-- SCHEMA
-- DROP TABLE IF EXISTS MyNumbers
-- Create table MyNumbers (num int)
-- Truncate table MyNumbers
-- insert into MyNumbers (num) values (8)
-- insert into MyNumbers (num) values (8)
-- insert into MyNumbers (num) values (3)
-- insert into MyNumbers (num) values (3)
-- insert into MyNumbers (num) values (1)
-- insert into MyNumbers (num) values (4)
-- insert into MyNumbers (num) values (5)
-- insert into MyNumbers (num) values (6)


-- SOLUTION 1
SELECT MAX(result.num) AS num
FROM (
SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1 ) AS result


-- END