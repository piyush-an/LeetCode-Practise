/* Write your T-SQL query statement below */


SELECT 
-- * 
sale_date,
diff = 
SUM(
CASE
WHEN fruit = 'apples' THEN sold_num ELSE -sold_num
END
)
FROM Sales
GROUP BY sale_date
ORDER BY sale_date

