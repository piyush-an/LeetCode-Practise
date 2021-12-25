-- SCHEMA
-- DROP TABLE IF EXISTS Activity
-- Create table Activity ([user_id] int, [session_id] int, activity_date date, activity_type varchar(50))
-- Truncate table Activity
-- insert into Activity ([user_id], [session_id], activity_date, activity_type) values (1, 1, '2019-07-20', 'open_session')
-- insert into Activity ([user_id], [session_id], activity_date, activity_type) values (1, 1, '2019-07-20', 'scroll_down')
-- insert into Activity ([user_id], [session_id], activity_date, activity_type) values (1, 1, '2019-07-20', 'end_session')
-- insert into Activity ([user_id], [session_id], activity_date, activity_type) values (2, 4, '2019-07-20', 'open_session')
-- insert into Activity ([user_id], [session_id], activity_date, activity_type) values (2, 4, '2019-07-21', 'send_message')
-- insert into Activity ([user_id], [session_id], activity_date, activity_type) values (2, 4, '2019-07-21', 'end_session')
-- insert into Activity ([user_id], [session_id], activity_date, activity_type) values (3, 2, '2019-07-21', 'open_session')
-- insert into Activity ([user_id], [session_id], activity_date, activity_type) values (3, 2, '2019-07-21', 'send_message')
-- insert into Activity ([user_id], [session_id], activity_date, activity_type) values (3, 2, '2019-07-21', 'end_session')
-- insert into Activity ([user_id], [session_id], activity_date, activity_type) values (4, 3, '2019-06-25', 'open_session')
-- insert into Activity ([user_id], [session_id], activity_date, activity_type) values (4, 3, '2019-06-25', 'end_session')


-- SOLUTION 1
SELECT activity_date as [day], count(DISTINCT[user_id]) as active_users from Activity group by activity_date  having activity_date BETWEEN DATEADD(day, -29, '2019-07-27') and '2019-07-27'

-- END