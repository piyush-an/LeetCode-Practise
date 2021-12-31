-- SCHEMA
-- DROP TABLE Insurance
-- Create Table Insurance (pid int, tiv_2015 float, tiv_2016 float, lat float, lon float)
-- Truncate table Insurance
-- insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('1', '10', '5', '10', '10')
-- insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('2', '20', '20', '20', '20')
-- insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('3', '10', '30', '20', '20')
-- insert into Insurance (pid, tiv_2015, tiv_2016, lat, lon) values ('4', '10', '40', '40', '40')

-- SOLUTION 1
SELECT (ROUND(SUM(TIV_2016) ,2)) AS tiv_2016 from (
SELECT pid, tiv_2015, tiv_2016, lat, lon,
CONCAT(lat, lon) as [address], 
COUNT(*) OVER (PARTITION BY tiv_2015 ) as count_one,
COUNT(*) OVER (PARTITION BY lat, lon ) as count_two
FROM Insurance ) result_set where count_one > 1 and count_two = 1


-- END