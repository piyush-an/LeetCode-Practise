-- SCHEMA

-- DROP TABLE Accounts
-- Create table Accounts (account_id int, income int)
-- Truncate table Accounts
-- insert into Accounts (account_id, income) values ('3', '108939')
-- insert into Accounts (account_id, income) values ('2', '12747')
-- insert into Accounts (account_id, income) values ('8', '87709')
-- insert into Accounts (account_id, income) values ('6', '91796')

-- SOLUTION 1

-- SELECT * FROM Accounts


-- Write an SQL query to report the number of bank accounts of each salary category. The salary categories are:
-- "Low Salary": All the salaries strictly less than $20000.
-- "Average Salary": All the salaries in the inclusive range [$20000, $50000].
-- "High Salary": All the salaries strictly greater than $50000.
-- The result table must contain all three categories. If there are no accounts in a category, then report 0.

with cte as (
    SELECT 'Low Salary' category
    UNION
    SELECT 'Average Salary' category
    UNION
    SELECT 'High Salary' category
)

SELECT 
-- * 
cte.category,
ISNULL(COUNT(account_id), 0) as accounts_count
FROM cte LEFT JOIN
(SELECT 
*,
category = 
CASE
WHEN income < 20000 THEN 'Low Salary'
WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
WHEN income > 50000 THEN 'High Salary'
END
FROM Accounts) rs
ON cte.category = rs.category
GROUP BY cte.category






-- END