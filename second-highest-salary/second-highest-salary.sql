


SELECT MAX(salary) as SecondHighestSalary 
from Employee
where Salary < (select MAX(salary) from Employee)
