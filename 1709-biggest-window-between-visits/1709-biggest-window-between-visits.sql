-- SCHEMA
-- DROP TABLE UserVisits
-- Create table UserVisits(user_id int, visit_date date)
-- Truncate table UserVisits
-- insert into UserVisits (user_id, visit_date) values ('1', '2020-11-28')
-- insert into UserVisits (user_id, visit_date) values ('1', '2020-10-20')
-- insert into UserVisits (user_id, visit_date) values ('1', '2020-12-3')
-- insert into UserVisits (user_id, visit_date) values ('2', '2020-10-5')
-- insert into UserVisits (user_id, visit_date) values ('2', '2020-12-9')
-- insert into UserVisits (user_id, visit_date) values ('3', '2020-11-11')



-- SOLUTION 1



SELECT 
user_id,
MAX(day_diff) biggest_window
FROM
(SELECT 
* ,
DATEDIFF(day, visit_date, ISNULL(LEAD(visit_date, 1) OVER (PARTITION BY user_id ORDER BY visit_date), '2021-01-01')) as day_diff
-- visit_date - ISNULL(LEAD(visit_date, 1) OVER (PARTITION BY user_id ORDER BY visit_date), '2021-01-01') as difference
from UserVisits) result_set
GROUP BY user_id
ORDER BY user_id
-- END