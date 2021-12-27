-- SCHEMA
-- DROP TABLE IF EXISTS Playback
-- DROP TABLE IF EXISTS Ads
-- Create table Playback([session_id] int,customer_id int,start_time int,end_time int)
-- Create table Ads (ad_id int, customer_id int, [timestamp] int)
-- Truncate table Playback
-- insert into Playback ([session_id], customer_id, start_time, end_time) values (1, 1, 1, 5)
-- insert into Playback ([session_id], customer_id, start_time, end_time) values (2, 1, 15, 23)
-- insert into Playback ([session_id], customer_id, start_time, end_time) values (3, 2, 10, 12)
-- insert into Playback ([session_id], customer_id, start_time, end_time) values (4, 2, 17, 28)
-- insert into Playback ([session_id], customer_id, start_time, end_time) values (5, 2, 2, 8)
-- Truncate table Ads
-- insert into Ads (ad_id, customer_id, [timestamp]) values (1, 1, 5)
-- insert into Ads (ad_id, customer_id, [timestamp]) values (2, 2, 17)
-- insert into Ads (ad_id, customer_id, [timestamp]) values (3, 2, 20)


-- SOLUTION 1 
-- SELECT * from Playback
-- SELECT * from Ads

select DISTINCT [session_id]
-- DISTINCT [session_id], p.customer_id, start_time, end_time, [timestamp]
-- ,
-- CASE 
-- WHEN a.timestamp BETWEEN p.start_time and p.end_time THEN 'y' ELSE 'n'
-- END as isBetween 
from Playback p LEFT JOIN Ads a ON p.customer_id = a.customer_id
        and a.timestamp BETWEEN p.start_time and p.end_time
where a.timestamp is null

-- END