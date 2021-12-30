-- SCHEMA
-- DROP TABLE Scores
-- Create table Scores (id int, score DECIMAL(3,2))
-- Truncate table Scores
-- insert into Scores (id, score) values ('1', '3.5')
-- insert into Scores (id, score) values ('2', '3.65')
-- insert into Scores (id, score) values ('3', '4.0')
-- insert into Scores (id, score) values ('4', '3.85')
-- insert into Scores (id, score) values ('5', '4.0')
-- insert into Scores (id, score) values ('6', '3.65')
-- DELETE FROM Employee where id IN (2,3)


-- SOLUTION 1

select score, DENSE_RANK() OVER (ORDER BY score desc) as [rank] from Scores
ORDER BY score desc
-- END, 