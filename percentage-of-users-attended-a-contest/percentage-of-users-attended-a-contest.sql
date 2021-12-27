-- SCHEMA
-- DROP TABLE IF EXISTS Users
-- DROP TABLE IF EXISTS Register
-- Create table Users ([user_id] int, [user_name] varchar(20))
-- Create table Register (contest_id int, [user_id] int)
-- Truncate table Users
-- insert into Users ([user_id], [user_name]) values (6, 'Alice')
-- insert into Users ([user_id], [user_name]) values (2, 'Bob')
-- insert into Users ([user_id], [user_name]) values (7, 'Alex')
-- Truncate table Register
-- insert into Register (contest_id, [user_id]) values (215, 6)
-- insert into Register (contest_id, [user_id]) values (209, 2)
-- insert into Register (contest_id, [user_id]) values (208, 2)
-- insert into Register (contest_id, [user_id]) values (210, 6)
-- insert into Register (contest_id, [user_id]) values (208, 6)
-- insert into Register (contest_id, [user_id]) values (209, 7)
-- insert into Register (contest_id, [user_id]) values (209, 6)
-- insert into Register (contest_id, [user_id]) values (215, 7)
-- insert into Register (contest_id, [user_id]) values (208, 7)
-- insert into Register (contest_id, [user_id]) values (210, 2)
-- insert into Register (contest_id, [user_id]) values (207, 2)
-- insert into Register (contest_id, [user_id]) values (210, 7)

-- SOLUTION 1 

-- SELECT * FROM Users
-- SELECT * FROM Register

-- Write an SQL query to find the percentage of the users registered in each contest rounded to two decimals.
-- Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.
with
    total_user_count
    as
    (
        SELECT COUNT(*) as total_user
        FROM Users
    )

SELECT DISTINCT(contest_id),
    CAST((ROUND(COUNT([user_id]) OVER(PARTITION BY contest_id) * 100.0 / (SELECT total_user
    from total_user_count), 2)) AS DECIMAL(5,2)) as [percentage]
FROM Register
ORDER BY [percentage] DESC, contest_id


-- SELECT contest_id, COUNT(*) FROM Register GROUP BY contest_id


-- END