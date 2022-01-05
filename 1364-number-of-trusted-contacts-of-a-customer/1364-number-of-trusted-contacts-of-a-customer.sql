-- SCHEMA
-- DROP TABLE Customers
-- DROP TABLE Contacts
-- DROP TABLE Invoices
-- Create table Customers (customer_id int, customer_name varchar(20), email varchar(30))
-- Create table Contacts (user_id int, contact_name varchar(20), contact_email varchar(30))
-- Create table Invoices (invoice_id int, price int, user_id int)
-- Truncate table Customers
-- insert into Customers (customer_id, customer_name, email) values ('1', 'Alice', 'alice@leetcode.com')
-- insert into Customers (customer_id, customer_name, email) values ('2', 'Bob', 'bob@leetcode.com')
-- insert into Customers (customer_id, customer_name, email) values ('13', 'John', 'john@leetcode.com')
-- insert into Customers (customer_id, customer_name, email) values ('6', 'Alex', 'alex@leetcode.com')
-- Truncate table Contacts
-- insert into Contacts (user_id, contact_name, contact_email) values ('1', 'Bob', 'bob@leetcode.com')
-- insert into Contacts (user_id, contact_name, contact_email) values ('1', 'John', 'john@leetcode.com')
-- insert into Contacts (user_id, contact_name, contact_email) values ('1', 'Jal', 'jal@leetcode.com')
-- insert into Contacts (user_id, contact_name, contact_email) values ('2', 'Omar', 'omar@leetcode.com')
-- insert into Contacts (user_id, contact_name, contact_email) values ('2', 'Meir', 'meir@leetcode.com')
-- insert into Contacts (user_id, contact_name, contact_email) values ('6', 'Alice', 'alice@leetcode.com')
-- Truncate table Invoices
-- insert into Invoices (invoice_id, price, user_id) values ('77', '100', '1')
-- insert into Invoices (invoice_id, price, user_id) values ('88', '200', '1')
-- insert into Invoices (invoice_id, price, user_id) values ('99', '300', '2')
-- insert into Invoices (invoice_id, price, user_id) values ('66', '400', '2')
-- insert into Invoices (invoice_id, price, user_id) values ('55', '500', '13')
-- insert into Invoices (invoice_id, price, user_id) values ('44', '60', '6')


-- SOLUTION 1

-- SELECT * FROM Customers
-- SELECT * FROM Contacts
-- SELECT * FROM Invoices

SELECT
-- *
i.invoice_id,
c.customer_name,
i.price,
-- i.user_id,
-- c.customer_id,
-- c.customer_name
COUNT(co.contact_name) as contacts_cnt,
COUNT(c2.customer_name) as trusted_contacts_cnt
FROM Invoices i
JOIN Customers c
ON i.user_id = c.customer_id
LEFT JOIN Contacts co
ON c.customer_id = co.user_id
LEFT JOIN Customers c2
ON co.contact_name = c2.customer_name
GROUP BY i.invoice_id, c.customer_name, i.price
ORDER BY i.invoice_id

-- END