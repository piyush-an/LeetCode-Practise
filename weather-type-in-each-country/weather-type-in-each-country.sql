-- SCHEMA
-- DROP TABLE IF EXISTS Countries
-- DROP TABLE IF EXISTS Weather
-- Create table Countries (country_id int, country_name varchar(20))
-- Create table Weather (country_id int, weather_state int, day date)
-- Truncate table Countries
-- insert into Countries (country_id, country_name) values (2, 'USA')
-- insert into Countries (country_id, country_name) values (3, 'Australia')
-- insert into Countries (country_id, country_name) values (7, 'Peru')
-- insert into Countries (country_id, country_name) values (5, 'China')
-- insert into Countries (country_id, country_name) values (8, 'Morocco')
-- insert into Countries (country_id, country_name) values (9, 'Spain')
-- Truncate table Weather
-- insert into Weather (country_id, weather_state, day) values (2, 15, '2019-11-01')
-- insert into Weather (country_id, weather_state, day) values (2, 12, '2019-10-28')
-- insert into Weather (country_id, weather_state, day) values (2, 12, '2019-10-27')
-- insert into Weather (country_id, weather_state, day) values (3, -2, '2019-11-10')
-- insert into Weather (country_id, weather_state, day) values (3, 0, '2019-11-11')
-- insert into Weather (country_id, weather_state, day) values (3, 3, '2019-11-12')
-- insert into Weather (country_id, weather_state, day) values (5, 16, '2019-11-07')
-- insert into Weather (country_id, weather_state, day) values (5, 18, '2019-11-09')
-- insert into Weather (country_id, weather_state, day) values (5, 21, '2019-11-23')
-- insert into Weather (country_id, weather_state, day) values (7, 25, '2019-11-28')
-- insert into Weather (country_id, weather_state, day) values (7, 22, '2019-12-01')
-- insert into Weather (country_id, weather_state, day) values (7, 20, '2019-12-02')
-- insert into Weather (country_id, weather_state, day) values (8, 25, '2019-11-05')
-- insert into Weather (country_id, weather_state, day) values (8, 27, '2019-11-15')
-- insert into Weather (country_id, weather_state, day) values (8, 31, '2019-11-25')
-- insert into Weather (country_id, weather_state, day) values (9, 7, '2019-10-23')
-- insert into Weather (country_id, weather_state, day) values (9, 3, '2019-12-23')

-- SOLUTION 1
-- SELECT * FROM Countries
-- SELECT * FROM Weather

SELECT c.country_name,
    weather_type = CASE 
WHEN AVG(w.weather_state * 1.00) <= 15.0 THEN 'Cold' 
WHEN AVG(w.weather_state * 1.00) >= 25.0 THEN 'Hot'  
ELSE 'Warm' END
-- AVG(w.weather_state * 1.00) AS avg_weather,
-- ROUND(AVG(w.weather_state * 1.00), 0) AS avg_weather_round
FROM Weather w JOIN Countries c ON w.country_id = c.country_id and w.day BETWEEN '2019-11-01' and '2019-11-30'
GROUP BY c.country_name
ORDER BY weather_type

-- END