---- CHECK 2NF ----
--2NF: Non primary attribute of the table is dependent on the whole of every candidate key
-- Find prime and non-prime attributes (find candidate keys)
SELECT *
FROM transactions
-- firstname,surname,shippingstate,loyaltydiscount do not dependent on the whole of every candidate key

-- So we must separate the columns, creating a new table
CREATE TABLE TMP AS 
SELECT customerid, firstname, surname, shipping_state, loyalty_discount
FROM transactions

SELECT *
FROM TMP --3455 rows, but is it in 2NF?
ORDER BY customerid --lots of duplicate rows, so we use the TMP temporary table to create the final table

CREATE TABLE customers AS
SELECT DISTINCT * 
FROM TMP --942 rows, 942 customers

SELECT *
FROM customers --Is it in 2NF? candidate key=customerid, every other non attribute depends on that one
-- 2NF Check for customers
DROP TABLE TMP

--Now back to transactions table
-- We must remove customer specific columns but leave the customer id
ALTER TABLE transactions
DROP COLUMN firstname, 
DROP COLUMN surname,
DROP COLUMN shipping_state,
DROP COLUMN loyalty_discount

SELECT*
FROM Transactions

-- Tables transactions and customers are now both in 2NF