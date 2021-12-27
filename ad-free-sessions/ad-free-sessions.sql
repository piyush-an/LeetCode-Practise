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


-- For submission Test cases
-- Truncate table Playback
-- insert into Playback values (7, 5, 329, 355)
-- insert into Playback values (1, 4, 100, 169)
-- insert into Playback values (6, 5, 789, 894)
-- insert into Playback values (4, 5, 553, 655)
-- insert into Playback values (13, 4, 399, 399)
-- insert into Playback values (8, 5, 69, 183)
-- insert into Playback values (14, 4, 583, 610)

-- Truncate table Ads
-- insert into Ads values (9, 5, 863)
-- insert into Ads values (5, 4, 123)
-- insert into Ads values (8, 4, 399)
-- insert into Ads values (12, 5, 152)
-- insert into Ads values (14, 4, 102)
-- insert into Ads values (7, 5, 348)
-- insert into Ads values (10, 5, 850)
-- insert into Ads values (11, 5, 799)
-- insert into Ads values (13, 5, 161)
-- insert into Ads values (3, 5, 82)
-- insert into Ads values (4, 5, 85)
-- insert into Ads values (2, 4, 593)


-- SOLUTION 1 

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
