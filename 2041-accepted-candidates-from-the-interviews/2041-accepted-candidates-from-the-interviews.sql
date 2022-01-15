-- SCHEMA

-- DROP TABLE Candidates
-- DROP TABLE Rounds
-- Create table  Candidates (candidate_id int, name varchar(30), years_of_exp int, interview_id int)
-- Create table  Rounds (interview_id int, round_id int, score int)
-- Truncate table Candidates
-- insert into Candidates (candidate_id, name, years_of_exp, interview_id) values ('11', 'Atticus', '1', '101')
-- insert into Candidates (candidate_id, name, years_of_exp, interview_id) values ('9', 'Ruben', '6', '104')
-- insert into Candidates (candidate_id, name, years_of_exp, interview_id) values ('6', 'Aliza', '10', '109')
-- insert into Candidates (candidate_id, name, years_of_exp, interview_id) values ('8', 'Alfredo', '0', '107')
-- Truncate table Rounds
-- insert into Rounds (interview_id, round_id, score) values ('109', '3', '4')
-- insert into Rounds (interview_id, round_id, score) values ('101', '2', '8')
-- insert into Rounds (interview_id, round_id, score) values ('109', '4', '1')
-- insert into Rounds (interview_id, round_id, score) values ('107', '1', '3')
-- insert into Rounds (interview_id, round_id, score) values ('104', '3', '6')
-- insert into Rounds (interview_id, round_id, score) values ('109', '1', '4')
-- insert into Rounds (interview_id, round_id, score) values ('104', '4', '7')
-- insert into Rounds (interview_id, round_id, score) values ('104', '1', '2')
-- insert into Rounds (interview_id, round_id, score) values ('109', '2', '1')
-- insert into Rounds (interview_id, round_id, score) values ('104', '2', '7')
-- insert into Rounds (interview_id, round_id, score) values ('107', '2', '3')
-- insert into Rounds (interview_id, round_id, score) values ('101', '1', '8')


-- SOLUTION 1

-- SELECT * FROM Candidates
-- SELECT * FROM Rounds

-- Write an SQL query to report the IDs of the candidates who have at least two years of experience and the sum of the score of their interview rounds is strictly greater than 15.
-- Return the result table in any order.


select 
candidate_id
FROM Candidates c
JOIN Rounds r
ON c.interview_id = r.interview_id 
WHERE years_of_exp >= 2
GROUP BY candidate_id
HAVING SUM(score) > 15

-- END