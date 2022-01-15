-- SCHEMA
-- DROP TABLE Members
-- DROP TABLE Visits
-- DROP TABLE Purchases
-- Create table Members (member_id int, name varchar(30))
-- Create table Visits (visit_id int, member_id int, visit_date date)
-- Create table Purchases (visit_id int, charged_amount int)
-- Truncate table Members
-- insert into Members (member_id, name) values ('9', 'Alice')
-- insert into Members (member_id, name) values ('11', 'Bob')
-- insert into Members (member_id, name) values ('3', 'Winston')
-- insert into Members (member_id, name) values ('8', 'Hercy')
-- insert into Members (member_id, name) values ('1', 'Narihan')
-- Truncate table Visits
-- insert into Visits (visit_id, member_id, visit_date) values ('22', '11', '2021-10-28')
-- insert into Visits (visit_id, member_id, visit_date) values ('16', '11', '2021-01-12')
-- insert into Visits (visit_id, member_id, visit_date) values ('18', '9', '2021-12-10')
-- insert into Visits (visit_id, member_id, visit_date) values ('19', '3', '2021-10-19')
-- insert into Visits (visit_id, member_id, visit_date) values ('12', '11', '2021-03-01')
-- insert into Visits (visit_id, member_id, visit_date) values ('17', '8', '2021-05-07')
-- insert into Visits (visit_id, member_id, visit_date) values ('21', '9', '2021-05-12')
-- Truncate table Purchases
-- insert into Purchases (visit_id, charged_amount) values ('12', '2000')
-- insert into Purchases (visit_id, charged_amount) values ('18', '9000')
-- insert into Purchases (visit_id, charged_amount) values ('17', '7000')


-- SOLUTION 1

-- SELECT * FROM Members
-- SELECT * FROM Visits
-- SELECT * FROM Purchases

-- A store wants to categorize its members. There are three tiers:

-- "Diamond": if the conversion rate is greater than or equal to 80.
-- "Gold": if the conversion rate is greater than or equal to 50 and less than 80.
-- "Silver": if the conversion rate is less than 50.
-- "Bronze": if the member never visited the store.
-- The conversion rate of a member is (100 * total number of purchases for the member) / total number of visits for the member.

-- Write an SQL query to report the id, the name, and the category of each member.

-- Return the result table in any order.


select 
-- * 
m.member_id,
m.name,
-- COUNT(v.visit_id) visit_count,
-- COUNT(charged_amount) purchase_count,
-- (COUNT(charged_amount) * 100 ) / COUNT(v.visit_id) as conversion,
category = CASE 
WHEN  COUNT(v.visit_id) = 0 THEN 'Bronze'
WHEN (COUNT(charged_amount) * 100 ) / COUNT(v.visit_id) >= 80 THEN 'Diamond'
WHEN (COUNT(charged_amount) * 100 ) / COUNT(v.visit_id) >= 50 AND (COUNT(charged_amount) * 100 ) / COUNT(v.visit_id) < 80 THEN 'Gold'
WHEN (COUNT(charged_amount) * 100 ) / COUNT(v.visit_id) < 50 THEN 'Silver'
WHEN (COUNT(charged_amount) * 100 ) / COUNT(v.visit_id) = 0 THEN 'Bronze'
END 
from Visits v
LEFT JOIN Purchases p
ON v.visit_id = p.visit_id
RIGHT JOIN Members m
ON v.member_id = m.member_id
GROUP BY m.member_id, m.name
ORDER BY m.member_id





-- END