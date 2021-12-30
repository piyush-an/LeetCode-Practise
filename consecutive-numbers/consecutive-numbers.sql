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
Select DISTINCT (num) as ConsecutiveNums
from (
SELECT *,
        LEAD(num) OVER (ORDER BY id) as next_one_line,
        LEAD(num, 2) OVER (ORDER BY id) as next_two_line
    FROM Logs )  result_set
where num = next_one_line and next_one_line = next_two_line


-- END