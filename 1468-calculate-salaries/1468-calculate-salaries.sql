/* Write your T-SQL query statement below */

with tax_slab as
(
select 
-- * ,
company_id,
tax = 
CASE
WHEN MAX(salary) < 1000 THEN 1
WHEN MAX(salary) BETWEEN 1000 AND 10000 THEN 0.76
WHEN MAX(salary) > 10000 THEN 0.51
END
FROM Salaries
GROUP BY company_id
)



select 
s.company_id, 
s.employee_id, 
s.employee_name, 
CAST(ROUND((s.salary * ts.tax),0) as INT) as salary
from Salaries s
JOIN (SELECT * FROM tax_slab) as ts
-- JOIN ts
ON s.company_id = ts.company_id

