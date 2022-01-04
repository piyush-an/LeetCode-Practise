-- SCHEMA
-- DROP TABLE Logs
-- Create table Logs (log_id int)
-- Truncate table Logs
-- insert into Logs (log_id) values ('1')
-- insert into Logs (log_id) values ('2')
-- insert into Logs (log_id) values ('3')
-- insert into Logs (log_id) values ('7')
-- insert into Logs (log_id) values ('8')
-- insert into Logs (log_id) values ('10')


-- SOLUTION 1
-- select * from 
-- (select
-- *,
-- -- LEAD(log_id) OVER (ORDER BY log_id) as next_num,
-- conti = 
-- CASE
-- WHEN LEAD(log_id) OVER (ORDER BY log_id) = log_id + 1 THEN 1
-- END
-- from Logs) result_set
-- where conti = 1 or next_num is null


select
    MIN(log_id) as start_id,
    MAX(log_id) as end_id
from
    (select log_id,
        -- ROW_NUMBER() OVER (ORDER BY log_id) as row_num,
        log_id - ROW_NUMBER() OVER (ORDER BY log_id) as row_num_diff
    from Logs) result_set
GROUP BY row_num_diff
ORDER BY start_id


-- END
