-- SCHEMA
-- DROP TABLE Follow
-- Create table Seat (id int, student varchar(255))
-- Truncate table Seat
-- insert into Seat (id, student) values ('1', 'Abbot')
-- insert into Seat (id, student) values ('2', 'Doris')
-- insert into Seat (id, student) values ('3', 'Emerson')
-- insert into Seat (id, student) values ('4', 'Green')
-- insert into Seat (id, student) values ('5', 'Jeames')

-- SOLUTION 1

select CASE 
WHEN id % 2 = 0 THEN id-1
WHEN id = (SELECT MAX(id)
        FROM Seat) and id % 2 !=0 THEN id
-- WHEN id % 2 != 0 THEN id+1 
ELSE id+1
END as id , student
from Seat
ORDER BY id


-- END