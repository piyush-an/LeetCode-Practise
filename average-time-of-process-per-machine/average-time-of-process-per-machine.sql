-- SCHEMA
-- DROP TABLE IF EXISTS Activity
-- Create table Activity (machine_id int, process_id int, activity_type varchar(10), [timestamp] float)
-- Truncate table Activity
-- insert into Activity (machine_id, process_id, activity_type, [timestamp]) values (0, 0, 'start', 0.712)
-- insert into Activity (machine_id, process_id, activity_type, [timestamp]) values (0, 0, 'end', 1.52)
-- insert into Activity (machine_id, process_id, activity_type, [timestamp]) values (0, 1, 'start', 3.14)
-- insert into Activity (machine_id, process_id, activity_type, [timestamp]) values (0, 1, 'end', 4.12)
-- insert into Activity (machine_id, process_id, activity_type, [timestamp]) values (1, 0, 'start', 0.55)
-- insert into Activity (machine_id, process_id, activity_type, [timestamp]) values (1, 0, 'end', 1.55)
-- insert into Activity (machine_id, process_id, activity_type, [timestamp]) values (1, 1, 'start', 0.43)
-- insert into Activity (machine_id, process_id, activity_type, [timestamp]) values (1, 1, 'end', 1.42)
-- insert into Activity (machine_id, process_id, activity_type, [timestamp]) values (2, 0, 'start', 4.1)
-- insert into Activity (machine_id, process_id, activity_type, [timestamp]) values (2, 0, 'end', 4.512)
-- insert into Activity (machine_id, process_id, activity_type, [timestamp]) values (2, 1, 'start', 2.5)
-- insert into Activity (machine_id, process_id, activity_type, [timestamp]) values (2, 1, 'end', 5)

-- SOLUTION 1 

select
    a.machine_id as machine_id,
    -- a.process_id, 
    ROUND(AVG (b.timestamp - a.timestamp), 3) as processing_time
-- b.timestamp - a.timestamp as processtime2 
from Activity a
    JOIN Activity b
    ON a.machine_id = b.machine_id and a.process_id = b.process_id and a.activity_type = 'start' and b.activity_type = 'end'
GROUP BY a.machine_id

-- select machine_id, process_id,  from Activity GROUP BY machine_id, process_id

-- 'end'