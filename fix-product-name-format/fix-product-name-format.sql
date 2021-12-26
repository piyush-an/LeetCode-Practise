-- SCHEMA
-- DROP TABLE IF EXISTS Sales
-- Create table Sales (sale_id int, product_name varchar(30), sale_date date)
-- Truncate table Sales
-- insert into Sales (sale_id, product_name, sale_date) values (1, 'LCPHONE', '2000-01-16')
-- insert into Sales (sale_id, product_name, sale_date) values (2, 'LCPhone', '2000-01-17')
-- insert into Sales (sale_id, product_name, sale_date) values (3, 'LcPhOnE', '2000-02-18')
-- insert into Sales (sale_id, product_name, sale_date) values (4, 'LCKeyCHAiN', '2000-02-19')
-- insert into Sales (sale_id, product_name, sale_date) values (5, 'LCKeyChain', '2000-02-28')
-- insert into Sales (sale_id, product_name, sale_date) values (6, 'Matryoshka', '2000-03-31')

-- SOLUTION 1 


select
    LOWER(TRIM(product_name)) as product_name,
    FORMAT (sale_date, 'yyyy-MM') as sale_date,
    COUNT(*) as total
from Sales
GROUP BY LOWER(TRIM(product_name)), FORMAT (sale_date, 'yyyy-MM')
ORDER BY product_name, sale_date


 
-- END