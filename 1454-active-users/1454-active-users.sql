/* Write your T-SQL query statement below */
-- SCHEMA

-- Create table Accounts (id int, [name] varchar(10))
-- Create table Logins (id int, login_date date)
-- insert into Accounts (id, name) values ('1', 'Winston')
-- insert into Accounts (id, name) values ('7', 'Jonathan')
-- insert into Logins (id, login_date) values ('7', '2020-05-30')
-- insert into Logins (id, login_date) values ('1', '2020-05-30')
-- insert into Logins (id, login_date) values ('7', '2020-05-31')
-- insert into Logins (id, login_date) values ('7', '2020-06-01')
-- insert into Logins (id, login_date) values ('7', '2020-06-02')
-- insert into Logins (id, login_date) values ('7', '2020-06-02')
-- insert into Logins (id, login_date) values ('7', '2020-06-03')
-- insert into Logins (id, login_date) values ('1', '2020-06-07')
-- insert into Logins (id, login_date) values ('7', '2020-06-10')

-- SOLUTION 1
with
    cte
    as
    (
        select
            DISTINCT id, login_date
        -- LEAD(login_date) OVER (ORDER BY id, login_date)
        from Logins
    )

select *
from Accounts
where id IN 
(select id
from
    (
select
        *,
        ROW_NUMBER() OVER (PARTITION by id ORDER BY login_date) as row_num,
        DATEADD(day, - ROW_NUMBER() OVER (PARTITION by id ORDER BY login_date), login_date) as date_diff
    from cte ) resultset
group by id, date_diff
having COUNT(*) > 4)
order by 1