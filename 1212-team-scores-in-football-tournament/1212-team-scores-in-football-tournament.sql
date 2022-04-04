-- SCHEMA
-- DROP TABLE Teams
-- DROP TABLE Matches
-- Create table Teams (team_id int, team_name varchar(30))
-- Create table Matches (match_id int, host_team int, guest_team int, host_goals int, guest_goals int)
-- Truncate table Teams
-- insert into Teams (team_id, team_name) values ('10', 'Leetcode FC')
-- insert into Teams (team_id, team_name) values ('20', 'NewYork FC')
-- insert into Teams (team_id, team_name) values ('30', 'Atlanta FC')
-- insert into Teams (team_id, team_name) values ('40', 'Chicago FC')
-- insert into Teams (team_id, team_name) values ('50', 'Toronto FC')
-- Truncate table Matches
-- insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('1', '10', '20', '3', '0')
-- insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('2', '30', '10', '2', '2')
-- insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('3', '10', '50', '5', '1')
-- insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('4', '20', '30', '1', '0')
-- insert into Matches (match_id, host_team, guest_team, host_goals, guest_goals) values ('5', '50', '30', '1', '0')



-- SOLUTION 3
SELECT team_id, team_name,
SUM(
    CASE WHEN team_id = host_team AND host_goals > guest_goals THEN 3
         WHEN team_id = guest_team AND guest_goals > host_goals THEN 3
         WHEN host_goals = guest_goals THEN 1
         ELSE 0
    END          
) AS "num_points"
FROM Teams t
LEFT JOIN Matches m ON t.team_id = m.host_team OR t.team_id = m.guest_team
GROUP BY team_id, team_name
ORDER BY num_points DESC, team_id

-- -- SOLUTION 2
-- with points as (
-- select host_team, guest_team,
-- host_team_points =
-- CASE
-- WHEN host_goals > guest_goals THEN 3
-- WHEN host_goals < guest_goals THEN 0
-- WHEN host_goals = guest_goals THEN 1
-- END,
-- guest_team_points =
-- CASE
-- WHEN host_goals > guest_goals THEN 0
-- WHEN host_goals < guest_goals THEN 3
-- WHEN host_goals = guest_goals THEN 1
-- END
-- from Matches )

-- select t.team_id, team_name, ISNULL(scorepointss, 0) num_points from Teams t LEFT JOIN (
-- select teamid, SUM(scorepoints) as scorepointss from (
-- select host_team as teamid, host_team_points as scorepoints from points
-- UNION ALL
-- select guest_team as teamid, guest_team_points as scorepoints from points ) resuktset
-- group by teamid ) result_set_3
-- ON t.team_id = result_set_3.teamid
-- ORDER BY 3 desc, 1

-- SOLUTION 1
-- SELECT * FROM Teams
-- SELECT
-- winner,
-- COUNT(winner) * 3 as points
-- FROM 
-- (SELECT
-- *,
-- winner = 
-- CASE
-- WHEN host_goals > guest_goals THEN host_team
-- WHEN host_goals < guest_goals THEN guest_team
-- END
-- FROM Matches ) result_set
-- where winner is not null
-- GROUP BY winner

-- END
