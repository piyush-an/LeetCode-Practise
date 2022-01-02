-- SCHEMA
-- DROP TABLE Events
-- Create table Events (business_id int, event_type varchar(10), occurences int)
-- Truncate table Events
-- insert into Events (business_id, event_type, occurences) values ('1', 'reviews', '7')
-- insert into Events (business_id, event_type, occurences) values ('3', 'reviews', '3')
-- insert into Events (business_id, event_type, occurences) values ('1', 'ads', '11')
-- insert into Events (business_id, event_type, occurences) values ('2', 'ads', '7')
-- insert into Events (business_id, event_type, occurences) values ('3', 'ads', '6')
-- insert into Events (business_id, event_type, occurences) values ('1', 'page views', '3')
-- insert into Events (business_id, event_type, occurences) values ('2', 'page views', '12')

-- SOLUTION 1
with avg_calc as (
select event_type, CAST (AVG (occurences * 1.00) as DECIMAL(10,2)) as avg_occ
from Events 
GROUP BY event_type )

select business_id from Events e JOIN avg_calc ac ON e.event_type = ac.event_type where occurences > avg_occ
GROUP BY business_id having COUNT(DISTINCT e.event_type) > 1






-- END
