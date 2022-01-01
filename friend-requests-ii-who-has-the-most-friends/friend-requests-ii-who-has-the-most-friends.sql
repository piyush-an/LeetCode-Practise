-- SCHEMA
-- DROP TABLE RequestAccepted
-- Create table RequestAccepted (requester_id int, accepter_id int, accept_date date )
-- Truncate table RequestAccepted
-- insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '2', '2016/06/03')
-- insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('1', '3', '2016/06/08')
-- insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('2', '3', '2016/06/08')
-- insert into RequestAccepted (requester_id, accepter_id, accept_date) values ('3', '4', '2016/06/09')

-- SOLUTION 1
SELECT TOP 1 person_id as id , SUM (count_requester_id) as num FROM (
SELECT DISTINCT (accepter_id) as person_id,
-- COUNT(accepter_id) OVER (PARTITION BY requester_id) as count_accepter_id,
COUNT(requester_id) OVER (PARTITION BY accepter_id) as count_requester_id
 from RequestAccepted
UNION ALL

SELECT DISTINCT (requester_id) as person_id,
COUNT(accepter_id) OVER (PARTITION BY requester_id) as count_accepter_id
-- COUNT(requester_id) OVER (PARTITION BY accepter_id) as count_requester_id
 from RequestAccepted ) result_set
 GROUP BY person_id
 ORDER BY num desc
 
--  SELECT * FROM RequestAccepted
--  SELECT * FROM RequestAccepted r1 JOIN RequestAccepted r2 ON r1.accepter_id = r2.requester_id


-- END