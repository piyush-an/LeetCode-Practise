-- SCHEMA
-- DROP TABLE Activity
-- Create table Activity (player_id int, device_id int, event_date date, games_played int)
-- Truncate table Activity
-- insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5')
-- insert into Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-05-02', '6')
-- insert into Activity (player_id, device_id, event_date, games_played) values ('1', '3', '2017-06-25', '1')
-- insert into Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0')
-- insert into Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5')

-- SOLUTION 2
with total_players as (
    select COUNT(DISTINCT player_id) as totals from Activity
)

select CAST (ROUND (COUNT(a.player_id) * 1.0 / (SELECT totals from total_players ) , 2, 0) as DECIMAL (10,2)) as fraction
from Activity a RIGHT JOIN
(select player_id, MIN(event_date) start_date from Activity GROUP BY player_id) b
ON a.player_id = b.player_id and a.event_date = DATEADD(day, 1, b.start_date )

-- SOLUTION 1
-- with
--     total_players_count
--     as
--     (
--         SELECT COUNT (DISTINCT player_id) as total_players
--         FROM Activity
--     )

-- -- SELECT * ,
-- -- LEAD (event_date) OVER (ORDER BY player_id, event_date) as next_date
-- -- from Activity 
-- -- order by player_id, event_date


-- SELECT
--     CAST ((ROUND ( (COUNT( DISTINCT a1.player_id) * 1.0 / (SELECT total_players
--     from total_players_count)) , 2)) as DECIMAL (10,5))  as fraction
-- from Activity a1 CROSS JOIN Activity a2 where a2.event_date = DATEADD(day, 1, a1.event_date) and a1.player_id = a2.player_id 


-- END