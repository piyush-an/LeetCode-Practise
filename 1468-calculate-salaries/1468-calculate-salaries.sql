/* Write your T-SQL query statement below */

-- SOLUTION 1
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



-- SOLUTION 2
-- with temp as 
-- (select company_id,employee_id,employee_name, salary,
--               max(salary) over (partition by company_id) as max_salary from Salaries)

-- select company_id,employee_id,employee_name,
-- case 
--     when max_salary < 1000 then salary
--     when max_salary >= 1000 and max_salary <= 10000 then Convert(int,round(salary - (salary*.24),0))
--     when max_salary > 10000 then Convert(int,round(salary - (salary*.49),0))
-- end as salary
-- from temp

