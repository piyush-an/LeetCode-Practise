-- SCHEMA
-- DROP TABLE Delivery
-- Create table Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date)
-- Truncate table Delivery
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('1', '1', '2019-08-01', '2019-08-02')
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('2', '2', '2019-08-02', '2019-08-02')
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('3', '1', '2019-08-11', '2019-08-12')
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('4', '3', '2019-08-24', '2019-08-24')
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('5', '3', '2019-08-21', '2019-08-22')
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('6', '2', '2019-08-11', '2019-08-13')
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values ('7', '4', '2019-08-09', '2019-08-09')

-- SOLUTION 1

-- Write an SQL query to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10.
-- Return the result table in any order.

SELECT ROUND(AVG(delivery_type * 1.00) * 100 , 2)  as immediate_percentage FROM 
(SELECT 
delivery_type = 
CASE
WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0
END
FROM Delivery d JOIN
(SELECT customer_id, MIN(order_date) as first_order_date
FROM Delivery 
GROUP BY customer_id) rs
ON d.customer_id = rs.customer_id
and d.order_date = rs.first_order_date) rs_two



-- END
