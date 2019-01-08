/*CREATE TABLE transactions (
    transactionid varchar,
    timestampsec timestamp,
    customerid varchar,
    firstname varchar,
    surname varchar,
    shipping_state varchar,
    item varchar,
    description varchar,
    retail_price float(2),
    loyalty_discount float(2)
);

-- WINDOWS
COPY transactions FROM 'C:\Users\loren\Documents\Data Analytics\Databases SQL class\Section 9 Challenge\OLTP.csv' DELIMITER ',' CSV HEADER;
*/


SELECT *
FROM transactions


---- CHECK 1NF ----

-- 1NF: 'Every non-primary attribute must provide a fact about the key'
-- No duplicate rows / every cell contains only one value

SELECT COUNT(*)
FROM Transactions; --3455 rows

SELECT COUNT(*)
FROM
( 	SELECT DISTINCT*
	FROM TRANSACTIONS) AS nf; --# of rows in the table is the same as # of distinct (unique) rows
-- The table is in 1NF --








