-- SCHEMA
-- DROP TABLE Transactions
-- Create table Transactions (id int, country varchar(4), [state] varchar(20), amount int, trans_date date)
-- Truncate table Transactions
-- insert into Transactions (id, country, [state], amount, trans_date) values ('121', 'US', 'approved', '1000', '2018-12-18')
-- insert into Transactions (id, country, [state], amount, trans_date) values ('122', 'US', 'declined', '2000', '2018-12-19')
-- insert into Transactions (id, country, [state], amount, trans_date) values ('123', 'US', 'approved', '2000', '2019-01-01')
-- insert into Transactions (id, country, [state], amount, trans_date) values ('124', 'DE', 'approved', '2000', '2019-01-07')

-- SOLUTION 1

SELECT
    FORMAT(trans_date, 'yyyy-MM') as month,
    country,
    COUNT(*) as trans_count,
    ISNULL(SUM 
(CASE
WHEN state = 'approved' THEN 1
END), 0) as approved_count,
    SUM(amount) as trans_total_amount,
    ISNULL (SUM(
CASE
WHEN state = 'approved' THEN amount
END), 0 ) as approved_total_amount
FROM Transactions
-- where state = 'approved'
GROUP BY FORMAT(trans_date, 'yyyy-MM'), country



-- END
