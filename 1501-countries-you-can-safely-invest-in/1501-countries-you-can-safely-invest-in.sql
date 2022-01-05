/* Write your T-SQL query statement below */

-- -- Global Call Average
-- select 
-- AVG(duration * 1.00)
-- FROM Calls

select name as country FROM Country where country_code IN
(
select
cc
from 
( 
select
-- c.caller_id,
-- p.phone_number,
SUBSTRING(p.phone_number, 1,3) as cc,
c.duration
from Calls c
JOIN Person p
ON c.caller_id = p.id
UNION ALL
select
-- c.caller_id,
-- p.phone_number,
SUBSTRING(p.phone_number, 1,3) as cc,
c.duration
from Calls c
JOIN Person p
ON c.callee_id = p.id 
) result_set
GROUP BY cc
HAVING AVG(duration * 1.00) > (SELECT AVG(duration * 1.00) FROM Calls) )




