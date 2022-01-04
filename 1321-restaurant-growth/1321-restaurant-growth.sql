-- SCHEMA
-- DROP TABLE Customer
-- Create table Customer (customer_id int, name varchar(20), visited_on date, amount int)
-- Truncate table Customer
-- insert into Customer (customer_id, name, visited_on, amount) values ('1', 'Jhon', '2019-01-01', '100')
-- insert into Customer (customer_id, name, visited_on, amount) values ('2', 'Daniel', '2019-01-02', '110')
-- insert into Customer (customer_id, name, visited_on, amount) values ('3', 'Jade', '2019-01-03', '120')
-- insert into Customer (customer_id, name, visited_on, amount) values ('4', 'Khaled', '2019-01-04', '130')
-- insert into Customer (customer_id, name, visited_on, amount) values ('5', 'Winston', '2019-01-05', '110')
-- insert into Customer (customer_id, name, visited_on, amount) values ('6', 'Elvis', '2019-01-06', '140')
-- insert into Customer (customer_id, name, visited_on, amount) values ('7', 'Anna', '2019-01-07', '150')
-- insert into Customer (customer_id, name, visited_on, amount) values ('8', 'Maria', '2019-01-08', '80')
-- insert into Customer (customer_id, name, visited_on, amount) values ('9', 'Jaze', '2019-01-09', '110')
-- insert into Customer (customer_id, name, visited_on, amount) values ('1', 'Jhon', '2019-01-10', '130')
-- insert into Customer (customer_id, name, visited_on, amount) values ('3', 'Jade', '2019-01-10', '150')


-- SOLUTION 1

-- select MAX(visited_on) from Customer
-- select *,
-- SUM(amount) OVER (ORDER BY visited_on)
-- from Customer
-- select 
-- *
-- -- AVG(amount)
-- from Customer 
-- where visited_on BETWEEN DATEADD(day, -6 , (select MAX(visited_on) from Customer)) and (select MAX(visited_on) from Customer)
-- -- GROUP BY 

-- -- END

select visited_on,amount,average_amount from 
(select 
visited_on,
-- amount,
sum(amount) OVER (ORDER BY visited_on rows between 6 preceding and current row) as amount,
CAST (ROUND(sum(amount) OVER (ORDER BY visited_on rows between 6 preceding and current row) * 1.00 / 7, 2) as DECIMAL(20,2)) as average_amount ,
RANK()  OVER (ORDER BY visited_on) as ranking
from
(select 
visited_on, 
SUM(amount) as amount
from customer
GROUP BY visited_on) result) result_two
where ranking >=7 
ORDER BY visited_on
-- select 
-- visited_on,
-- sum(amount)over(order by visited_on rows between 6 preceding and current row) amount,
-- round(cast(avg(amount*1.00)over(order by visited_on rows between 6 preceding and current row) as float),2) average_amount,
-- rank ()over(order by visited_on)rank
-- from
-- (select 
-- visited_on,
-- sum(amount) amount
-- from customer
-- group by visited_on) rs

-- select 
-- visited_on, 
-- lag(visited_on, 6) over (order by visited_on) as end_date,
-- sum(amount_sum) over (ORDER BY visited_on
-- rows between 6 preceding and current row) as amount_t 
-- from 
-- (--aggregate multiple accounts within one day
--     select visited_on, 
--     sum(amount) as amount_sum from Customer group by visited_on
-- ) T1