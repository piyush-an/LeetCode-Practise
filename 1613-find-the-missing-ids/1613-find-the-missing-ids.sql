-- SCHEMA

-- DROP TABLE Customers
-- Create table Customers (customer_id int, customer_name varchar(20))
-- Truncate table Customers
-- insert into Customers (customer_id, customer_name) values ('1', 'Alice')
-- insert into Customers (customer_id, customer_name) values ('4', 'Bob')
-- insert into Customers (customer_id, customer_name) values ('5', 'Charlie')
-- insert into Customers (customer_id, customer_name) values ('7', 'Anku')

-- SOLUTION 1

WITH 
CTE AS (SELECT MAX(customer_id) AS MAX_ID FROM Customers),

CTE1 AS 
(SELECT 1 as ids
UNION ALL
SELECT ids + 1 FROM CTE1 where ids < (SELECT MAX_ID FROM CTE))


select ids
from CTE1
where ids NOT IN (SELECT customer_id from Customers)
ORDER BY 1

-- END