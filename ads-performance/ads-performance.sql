-- SCHEMA
-- DROP TABLE IF EXISTS Ads
-- Create table Ads (ad_id int, user_id int, action varchar(20))
-- Truncate table Ads
-- insert into Ads (ad_id, user_id, action) values (1, 1, 'Clicked')
-- insert into Ads (ad_id, user_id, action) values (2, 2, 'Clicked')
-- insert into Ads (ad_id, user_id, action) values (3, 3, 'Viewed')
-- insert into Ads (ad_id, user_id, action) values (5, 5, 'Ignored')
-- insert into Ads (ad_id, user_id, action) values (1, 7, 'Ignored')
-- insert into Ads (ad_id, user_id, action) values (2, 7, 'Viewed')
-- insert into Ads (ad_id, user_id, action) values (3, 5, 'Clicked')
-- insert into Ads (ad_id, user_id, action) values (1, 4, 'Viewed')
-- insert into Ads (ad_id, user_id, action) values (2, 11, 'Viewed')
-- insert into Ads (ad_id, user_id, action) values (1, 2, 'Clicked')

-- SOLUTION 1
select ad_id,
    ctr =
CASE  WHEN (SELECT COUNT(action)
    from Ads
    where  ad_id= a.ad_id and action IN ('Clicked', 'Viewed'))= 0 THEN 0
    -- where ad_id= a.ad_id and action='Clicked') = 0 and (SELECT COUNT(action)
    -- from Ads
    -- where ad_id= a.ad_id and action='Viewed') = 0 THEN 0
ELSE
CAST((ROUND((SELECT COUNT(action)
    from Ads
    where ad_id= a.ad_id and action='Clicked') * 100.00 / ((SELECT COUNT(action)
    from Ads
    where ad_id= a.ad_id and action='Clicked') + 
(SELECT COUNT(action)
    from Ads
    where ad_id= a.ad_id and action='Viewed')), 2)) AS DECIMAL(5,2))  END
from Ads a
GROUP BY ad_id
ORDER BY ctr desc, ad_id asc





-- END