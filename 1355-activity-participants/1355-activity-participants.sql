/* Write your T-SQL query statement below */

-- SELECT 
-- name as activity 
-- FROM Activities
-- WHERE name NOT IN
-- (
-- SELECT activity FROM 
-- (SELECT
-- activity,
-- DENSE_RANK() OVER (ORDER BY COUNT(id)) as ranking
-- FROM Friends
-- GROUP BY activity) top
-- where ranking = 1
-- union
-- SELECT activity FROM 
-- (SELECT
-- activity,
-- DENSE_RANK() OVER (ORDER BY COUNT(id) desc) as ranking
-- FROM Friends
-- GROUP BY activity) bottom
-- where ranking = 1
-- )


SELECT 
name as activity 
FROM Activities
WHERE name NOT IN
(
SELECT activity FROM 
(SELECT
activity,
DENSE_RANK() OVER (ORDER BY COUNT(id)) as ranking
FROM Friends
GROUP BY activity) rtop
where ranking = 1
union
SELECT activity FROM 
(SELECT
activity,
DENSE_RANK() OVER (ORDER BY COUNT(id) desc) as ranking
FROM Friends
GROUP BY activity) rbottom
where ranking = 1
)
