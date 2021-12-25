-- SCHEMA
-- DROP TABLE IF EXISTS Delivery
-- Create table Delivery (delivery_id int, customer_id int, order_date date, customer_pref_delivery_date date)
-- Truncate table Delivery
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (1, 1, '2019-08-01', '2019-08-02')
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (2, 5, '2019-08-02', '2019-08-02')
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (3, 1, '2019-08-11', '2019-08-11')
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (4, 3, '2019-08-24', '2019-08-26')
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (5, 4, '2019-08-21', '2019-08-22')
-- insert into Delivery (delivery_id, customer_id, order_date, customer_pref_delivery_date) values (6, 2, '2019-08-11', '2019-08-13')

-- SOLUTION 1 
-- select  ROUND(CAST(((SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END ) * 100 ) / COUNT (*) ) AS DECIMAL(10,2)), 2)  from Delivery

SELECT CAST((ROUND((SELECT COUNT(*)
    FROM Delivery
    WHERE order_date = customer_pref_delivery_date ) * 100.00 / COUNT(*), 2)) AS DECIMAL(5,2)) AS immediate_percentage
FROM Delivery
-- END