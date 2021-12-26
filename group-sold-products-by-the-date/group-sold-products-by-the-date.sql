-- SCHEMA
-- DROP TABLE IF EXISTS Activities
-- Create table Activities (sell_date date, product varchar(20))
-- Truncate table Activities
-- insert into Activities (sell_date, product) values ('2020-05-30', 'Headphone')
-- insert into Activities (sell_date, product) values ('2020-06-01', 'Pencil')
-- insert into Activities (sell_date, product) values ('2020-06-02', 'Mask')
-- insert into Activities (sell_date, product) values ('2020-05-30', 'Basketball')
-- insert into Activities (sell_date, product) values ('2020-06-01', 'Bible')
-- insert into Activities (sell_date, product) values ('2020-06-02', 'Mask')
-- insert into Activities (sell_date, product) values ('2020-05-30', 'T-Shirt')


-- SOLUTION 1 
select sell_date,
    COUNT(*) as num_sold,
    -- STRING_AGG(product, ',') as products
    STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product) as products
from (SELECT DISTINCT sell_date, product
    from Activities ) resultset
GROUP BY sell_date
ORDER BY sell_date


-- END