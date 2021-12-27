-- SCHEMA
-- DROP TABLE IF EXISTS Warehouse
-- DROP TABLE IF EXISTS Products
-- Create table Warehouse ([name] varchar(50), product_id int, units int)
-- Create table Products (product_id int, product_name varchar(50), Width int,[Length] int,Height int)
-- Truncate table Warehouse
-- insert into Warehouse ([name], product_id, units) values ('LCHouse1', 1, 1)
-- insert into Warehouse ([name], product_id, units) values ('LCHouse1', 2, 10)
-- insert into Warehouse ([name], product_id, units) values ('LCHouse1', 3, 5)
-- insert into Warehouse ([name], product_id, units) values ('LCHouse2', 1, 2)
-- insert into Warehouse ([name], product_id, units) values ('LCHouse2', 2, 2)
-- insert into Warehouse ([name], product_id, units) values ('LCHouse3', 4, 1)
-- Truncate table Products
-- insert into Products (product_id, product_name, Width, [Length], Height) values (1, 'LC-TV', 5, 50, 40)
-- insert into Products (product_id, product_name, Width, [Length], Height) values (2, 'LC-KeyChain', 5, 5, 5)
-- insert into Products (product_id, product_name, Width, [Length], Height) values (3, 'LC-Phone', 2, 10, 10)
-- insert into Products (product_id, product_name, Width, [Length], Height) values (4, 'LC-T-Shirt', 4, 10, 20)

-- SOLUTION 1 


-- select *,p.Width * p.[Length] * p.Height as eachsize, p.Width * p.[Length] * p.Height * w.units as lotsize from Warehouse w JOIN Products p ON w.product_id = p.product_id

SELECT resultset.[name] as warehouse_name, sum(lotsize) as volume
from (
select [name],
        -- p.Width * p.[Length] * p.Height as eachsize,
        p.Width * p.[Length] * p.Height * w.units as lotsize
    from Warehouse w JOIN Products p ON w.product_id = p.product_id
) resultset
group by resultset.[name] 

 
-- END