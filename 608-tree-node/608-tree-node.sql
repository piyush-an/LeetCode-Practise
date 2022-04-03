/* Write your T-SQL query statement below */
-- SCHEMA
-- Create table Tree (id int, p_id int)
-- Truncate table Tree
-- insert into Tree (id, p_id) values ('1', 'None')
-- insert into Tree (id, p_id) values ('2', '1')
-- insert into Tree (id, p_id) values ('3', '1')
-- insert into Tree (id, p_id) values ('4', '2')
-- insert into Tree (id, p_id) values ('5', '2')

-- SOLUTION 1
select DISTINCT(t1.id),
CASE    
WHEN t1.p_id is null THEN 'Root' 
WHEN t2.id is null THEN 'Leaf' ELSE 'Inner'
END [type]
from Tree t1
LEFT JOIN Tree t2
ON t1.id = t2.p_id