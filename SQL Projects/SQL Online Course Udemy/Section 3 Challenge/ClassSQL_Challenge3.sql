--show companies with an issue and its product name
SELECT product_name, issue, company
FROM [Consumer_Complaints]

--show sub issues for product and company by state
SELECT product_name, sub_product, issue, state_name
FROM Consumer_Complaints --way too many rows, not suitable for analysis

--issues from products from NY
SELECT product_name, issue, state_name
FROM Consumer_Complaints
WHERE state_name = 'NY' OR state_name='CA'

--Show complaints received the same day they were sent
SELECT company, issue, date_sent, date_received
FROM Consumer_Complaints
WHERE date_sent = date_received

--products, issues and companies in states of NY and CA
SELECT product_name, issue, company, state_name
FROM Consumer_Complaints
WHERE state_name='NY' OR state_name='CA'

--display all products from NY with  a timely response
SELECT product_name, company, state_name, timely_response, tags
FROM Consumer_Complaints
WHERE state_name = 'NY' AND timely_response = 'Yes' AND tags = 'Older American'

-- find the consumer complaints related to credit
SELECT *
FROM Consumer_Complaints
--WHERE product_name LIKE 'credit' --no word for credit by itself in the table
--WHERE product_name LIKE '%Credit%' --%% any number of character - credit - any number of character
WHERE LOWER(product_name) LIKE '%Credit%'




