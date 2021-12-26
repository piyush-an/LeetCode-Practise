-- SCHEMA
-- DROP TABLE IF EXISTS [Sessions]
-- Create table [Sessions] ([session_id] int, duration int)
-- Truncate table [Sessions]
-- insert into [Sessions] ([session_id], duration) values (1, 30)
-- insert into [Sessions] ([session_id], duration) values (2, 199)
-- insert into [Sessions] ([session_id], duration) values (3, 299)
-- insert into [Sessions] ([session_id], duration) values (4, 580)
-- insert into [Sessions] ([session_id], duration) values (5, 1000)

-- SOLUTION 1


select '[0-5>' AS bin, ISNULL(SUM(CASE WHEN duration < 5*60 THEN 1 END),0) as total from [Sessions]
UNION
select '[5-10>' AS bin, ISNULL(SUM(CASE WHEN duration >= 5*60 and duration < 10*60 THEN 1 END),0) as total from [Sessions]
UNION
select '[10-15>' AS bin, ISNULL(SUM(CASE WHEN duration >= 10*60 and duration < 15*60 THEN 1 END),0) as total from [Sessions]
UNION
select '15 or more' AS bin, ISNULL(SUM(CASE WHEN duration >= 15*60 THEN 1 END),0) as total from [Sessions]


-- select '[0-5>' as bin, COUNT(*) AS total from (
-- select 
-- bin = CASE 
-- WHEN CAST((ROUND(duration * 1.00 / 60, 2)) AS DECIMAL(5,2)) < 5.0 THEN '[0-5>'
-- WHEN CAST((ROUND(duration * 1.00 / 60, 2)) AS DECIMAL(5,2)) BETWEEN 5.0 and 9.9 THEN '[5-10>'
-- WHEN CAST((ROUND(duration * 1.00 / 60, 2)) AS DECIMAL(5,2)) BETWEEN 10.0 and 14.9 THEN '[10-15>'
-- WHEN CAST((ROUND(duration * 1.00 / 60, 2)) AS DECIMAL(5,2)) >= 15.0 THEN '15 or more'
-- END
-- from [Sessions] ) resultset group by bin




-- END