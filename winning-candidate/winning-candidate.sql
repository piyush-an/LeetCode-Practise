-- SCHEMA
-- DROP TABLE IF EXISTS Candidate
-- DROP TABLE IF EXISTS Vote
-- Create table Candidate (id int, [name] varchar(255))
-- Create table Vote (id int, candidateId int)
-- Truncate table Candidate
-- insert into Candidate (id, [name]) values ('1', 'A')
-- insert into Candidate (id, [name]) values ('2', 'B')
-- insert into Candidate (id, [name]) values ('3', 'C')
-- insert into Candidate (id, [name]) values ('4', 'D')
-- insert into Candidate (id, [name]) values ('5', 'E')
-- Truncate table Vote
-- insert into Vote (id, candidateId) values ('1', '2')
-- insert into Vote (id, candidateId) values ('2', '4')
-- insert into Vote (id, candidateId) values ('3', '3')
-- insert into Vote (id, candidateId) values ('4', '2')
-- insert into Vote (id, candidateId) values ('5', '5')


-- SOLUTION 1

select name
from Candidate
where id = 
(
SELECT TOP 1
    candidateId
-- , COUNT (*) as no_of_votes 
FROM Vote
GROUP BY candidateId
ORDER BY COUNT (*) desc )


-- END