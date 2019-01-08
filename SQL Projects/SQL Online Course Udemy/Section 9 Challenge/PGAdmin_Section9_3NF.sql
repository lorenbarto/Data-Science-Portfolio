---- CHECK 3NF ----
--3NF: Every non-prime attributes is non-transitively dependent on every candidate key
-- We must check if both tables are in 3NF

SELECT *
FROM customers --3NF confirmed

SELECT*
FROM transactions 
/* non prime attributes: item,description,retail_price
item: dependent on transactionid
descrpition / retail_price: dependent on item, which is dependent on transactionid, thus transitively dependent, must modificate */

--Create table with item as PK 
CREATE TABLE TMP AS 
SELECT item, description, retail_price
FROM transactions

SELECT *
FROM TMP --3455 rows
ORDER BY item --many duplicates

CREATE TABLE items AS
SELECT DISTINCT *
FROM TMP 

SELECT *
FROM items --126 items, is it in 3NF? Yes

--Now remove the extracted rows from the transactions tables, keeping FK item
ALTER TABLE transactions
DROP COLUMN description,
DROP COLUMN retail_price;

SELECT*
FROM transactions

DROP TABLE TMP

---- CHECK 3NF ----

---- Now, the whole Database is normalized to the 3NF ----

