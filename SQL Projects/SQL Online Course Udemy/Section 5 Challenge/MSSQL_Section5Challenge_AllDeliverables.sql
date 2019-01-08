SELECT*
FROM console_games

--Computing the total sales for each row
ALTER TABLE [dbo].[console_games]
ADD global_sales float --Add a column for global sales
UPDATE console_games --UPDATE creates a new, permanent table
SET global_sales = na_sales + [eu_sales] + [jp_sales] --populate the global sales column 

---- DELIVERABLE 1: Compute % global sales from North America ----
ALTER TABLE [dbo].[console_games]
ADD na_sales_percent float
UPDATE [dbo].[console_games]
SET na_sales_percent = na_sales/global_sales * 100
WHERE global_sales!=0 --necessary to avoid dividing by 0

SELECT*
FROM console_games
ORDER BY global_sales DESC --by default, SQL organizes ascending (ASC)

/* ---- DELIVERABLE 2: Extract a view of the console game titles ----
 ordered by platform name in ascending order and year or release in descending order */
 SELECT*
 FROM console_games
 ORDER BY platform_name, game_year DESC

 ---- DELIVERABLE 3: For each game title, extract the first four letter of the publisher's name ----
 SELECT game_name, publisher, left(publisher,4)
 FROM console_games

 -- Working with Dates
 SELECT *,DATEDIFF(YEAR,first_retail_availability,discontinued) AS years_existed --syntax for DATEDIFF(date range,first event,second event)
 FROM console_dates 
 ORDER BY years_existed DESC

  ---- DELIVERABLE 4: Display all console platforms released either before Black Friday or Christmas ----
  SELECT platform_name, first_retail_availability
  FROM [dbo].[console_dates]
  WHERE DATEPART (MONTH, [first_retail_availability]) - 11=0 OR DATEPART(MONTH,[first_retail_availability]) - 12=0
  --DATEPART extracts the month from a column, then we run our query to find what platform was released before Black Friday or Christmas

  ---- DELIVERABLE 5: Order platform by their longevity in ascending order
 SELECT *, DATEDIFF(YEAR,[first_retail_availability],[discontinued]) AS years_existed
 FROM [dbo].[console_dates]
 ORDER BY years_existed

  ---- DELIVERABLE 6: Demonstrate how to deal with game_year column if the client wants to convert it to a different data type ----
  SELECT *, CAST([game_year] AS decimal) --This is only specific to this query, it does not update it permanently
  FROM [dbo].[console_games]

  ---- DELIVERABLE 7: Provide recommendation on how to deal with missing date in the file ----
  /* 3 ways to deal with NULL data: Either take an average, explore the data and find the exact match or simply delete the row
  it only depends on the relative importance of the row and of the impact on the overall analysis */











