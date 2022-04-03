-- SCHEMA
-- DROP TABLE Logs
-- Create table Logs (id int, num int)
-- Truncate table Logs
-- insert into Logs (id, num) values ('1', '1')
-- insert into Logs (id, num) values ('2', '1')
-- insert into Logs (id, num) values ('3', '1')
-- insert into Logs (id, num) values ('4', '2')
-- insert into Logs (id, num) values ('5', '1')
-- insert into Logs (id, num) values ('6', '2')
-- insert into Logs (id, num) values ('7', '2')
-- DELETE FROM Employee where id IN (2,3)


-- SOLUTION 1
-- Select DISTINCT (num) as ConsecutiveNums
-- from (
-- SELECT *,
--         LEAD(num) OVER (ORDER BY id) as next_one_line,
--         LEAD(num, 2) OVER (ORDER BY id) as next_two_line
--     FROM Logs )  result_set
-- where num = next_one_line and next_one_line = next_two_line

-- SOLUTION 2
-- SELECT DISTINCT(num) as ConsecutiveNums from (
-- SELECT num, sum([check]) OVER (ORDER BY id) as rolling_sum from (
-- select *, case when LAG(num) OVER (ORDER BY id) = num THEN 0 ELSE 1 END as [check] from logs ) result_set_A ) result_set_B
-- GROUP BY num, rolling_sum having count(*) > 2



-- SOLUTION 3
select DISTINCT l1.num as ConsecutiveNums
from Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1
JOIN Logs l3 ON l2.id = l3.id - 1
where 
l1.num = l2.num and l2.num = l3.num


-- END