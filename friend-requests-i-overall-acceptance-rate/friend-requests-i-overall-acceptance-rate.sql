-- Schema
-- DROP TABLE IF EXISTS FriendRequest
-- DROP TABLE IF EXISTS RequestAccepted
-- Create table FriendRequest (sender_id int, send_to_id int, request_date date)
-- Create table RequestAccepted (requester_id int, accepter_id int, accept_date date)
-- Truncate table FriendRequest
-- insert into FriendRequest (sender_id, send_to_id, request_date) values (1, 2, '2016/06/01')
-- insert into FriendRequest (sender_id, send_to_id, request_date) values (1, 3, '2016/06/01')
-- insert into FriendRequest (sender_id, send_to_id, request_date) values (1, 4, '2016/06/01')
-- insert into FriendRequest (sender_id, send_to_id, request_date) values (2, 3, '2016/06/02')
-- insert into FriendRequest (sender_id, send_to_id, request_date) values (3, 4, '2016/06/09')
-- Truncate table RequestAccepted
-- insert into RequestAccepted (requester_id, accepter_id, accept_date) values (1, 2, '2016/06/03')
-- insert into RequestAccepted (requester_id, accepter_id, accept_date) values (1, 3, '2016/06/08')
-- insert into RequestAccepted (requester_id, accepter_id, accept_date) values (2, 3, '2016/06/08')
-- insert into RequestAccepted (requester_id, accepter_id, accept_date) values (3, 4, '2016/06/09')
-- insert into RequestAccepted (requester_id, accepter_id, accept_date) values (3, 4, '2016/06/10')

-- Solution 1
-- select * from FriendRequest
-- select * from RequestAccepted;

-- Individual counts SQL
-- select COUNT ( DISTINCT CONCAT(requester_id, accepter_id) ) from RequestAccepted 
-- SELECT COUNT(*) from FriendRequest

SELECT accept_rate = 
CASE request_count WHEN '0' THEN '0.00' -- Divisor must be non zero, in such case default value
ELSE
CAST
( (CAST
(accepted_count AS float)/CAST
(request_count AS float)) AS decimal
(10,2))     -- scale is upto 2 digits
END
FROM
    (SELECT (
    SELECT COUNT ( DISTINCT CONCAT(requester_id, accepter_id) ) -- to count more then 2 distinct columns, use CONCAT to consider them as one column
        FROM RequestAccepted ) AS accepted_count,
        (SELECT COUNT( DISTINCT CONCAT(sender_id, send_to_id) ) -- As above
        FROM FriendRequest ) AS request_count
)
result


-- select COUNT ( DISTINCT CONCAT(requester_id, accepter_id) ) from RequestAccepted 
-- SELECT COUNT(*) from FriendRequest

-- End
