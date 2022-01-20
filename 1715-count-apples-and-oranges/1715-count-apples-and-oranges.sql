-- SCHEMA
-- DROP TABLE Boxes
-- DROP TABLE Chests
-- Create table  Boxes (box_id int, chest_id int, apple_count int, orange_count int)
-- Create table  Chests (chest_id int, apple_count int, orange_count int)
-- Truncate table Boxes
-- insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('2', null, '6', '15')
-- insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('18', '14', '4', '15')
-- insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('19', '3', '8', '4')
-- insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('12', '2', '19', '20')
-- insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('20', '6', '12', '9')
-- insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('8', '6', '9', '9')
-- insert into Boxes (box_id, chest_id, apple_count, orange_count) values ('3', '14', '16', '7')
-- Truncate table Chests
-- insert into Chests (chest_id, apple_count, orange_count) values ('6', '5', '6')
-- insert into Chests (chest_id, apple_count, orange_count) values ('14', '20', '10')
-- insert into Chests (chest_id, apple_count, orange_count) values ('2', '8', '8')
-- insert into Chests (chest_id, apple_count, orange_count) values ('3', '19', '4')
-- insert into Chests (chest_id, apple_count, orange_count) values ('16', '19', '19')



-- SOLUTION 1

-- SELECT * from Boxes
-- SELECT * from Chests
-- SELECT 
-- SUM(apple_count) apple_count,
-- SUM(orange_count) orange_count 
-- FROM
-- (SELECT
-- ISNULL(b.apple_count, 0) + ISNULL(c.apple_count, 0) apple_count,
-- ISNULL(b.orange_count, 0) + ISNULL(c.orange_count, 0) orange_count
-- FROM Boxes b
-- JOIN Chests c
-- ON b.chest_id = c.chest_id) result_set
-- GROUP BY apple_count, orange_count


-- SOLUTION 2

SELECT 
SUM(apple_count) apple_count,
SUM(orange_count) orange_count 
FROM
(select 
ISNULL(b.apple_count, 0) + ISNULL(c.apple_count, 0) as apple_count,
ISNULL(b.orange_count, 0) + ISNULL(c.orange_count, 0) orange_count
FROM Boxes b
LEFT JOIN Chests c
ON b.chest_id = c.chest_id) result_set

-- END