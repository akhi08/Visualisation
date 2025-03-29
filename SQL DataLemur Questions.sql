

-- *******************  question-1 Active User Retention  "Facebook" SQL Interview Question *************************************************************************

-- -- ----------------------- Active User Retention  Facebook SQL Interview Question--------------------------------------------------------------------------

-- -- Assume you're given a table containing information on Facebook user actions. Write a query to obtain number of monthly active users (MAUs) in July 2022, including the month in numerical format "1, 2, 3".

-- -- Hint:

-- -- An active user is defined as a user who has performed actions such as 'sign-in', 'like', or 'comment' in both the current month and the previous month.
-- -- user_actions Table:
-- -- Column Name	Type
-- -- user_id	integer
-- -- event_id	integer
-- -- event_type	string ("sign-in, "like", "comment")
-- -- event_date	datetime



-- -- CREATE TABLE Facebook_MAU (
-- --     user_id INTEGER,
-- --     event_id SERIAL PRIMARY KEY,
-- --     event_type VARCHAR(20),
-- --     event_date TIMESTAMP
-- -- );


-- -- Insert 300 Random Values

-- -- INSERT INTO Facebook_MAU (user_id, event_type, event_date)
-- -- SELECT 
-- --     FLOOR(RAND() * 50) + 1 AS user_id,  -- Random user IDs between 1 and 50
-- --     CASE 
-- --         WHEN RAND() < 0.33 THEN 'sign-in' 
-- --         WHEN RAND() < 0.66 THEN 'like' 
-- --         ELSE 'comment' 
-- --     END AS event_type,
-- --     DATE_ADD('2022-06-01', INTERVAL FLOOR(RAND() * 60) DAY) AS event_date  -- Random dates in June & July
-- -- FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL 
-- --       SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS a
-- -- CROSS JOIN 
-- --      (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL 
-- --       SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) AS b
-- -- CROSS JOIN 
-- --      (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) AS c;  -- Generates 10 × 10 × 3 = 300 rows

-- solution using SQL

-- -- WITH cte AS (
-- --     -- Select distinct users who were active in June 2022
-- --     SELECT DISTINCT user_id
-- --     FROM user_actions
-- --     WHERE event_type IN ('sign-in', 'like', 'comment')
-- --     AND EXTRACT(MONTH FROM event_date) = 6  -- Users active in June
-- --     AND EXTRACT(YEAR FROM event_date) = 2022
-- -- )
-- -- SELECT 
-- --     7 AS mth,  -- Report July (7) as the final month
-- --     COUNT(DISTINCT u.user_id) AS monthly_active_users
-- -- FROM user_actions u
-- -- JOIN cte c ON u.user_id = c.user_id  -- Ensure user was also active in June
-- -- WHERE u.event_type IN ('sign-in', 'like', 'comment')
-- -- AND EXTRACT(MONTH FROM u.event_date) = 7  -- Users active in July
-- -- AND EXTRACT(YEAR FROM u.event_date) = 2022;  -- Ensure it's for 2022

-- solution using Python

-- -- import pandas as pd
-- -- import numpy as np
-- -- # Sample Data (Assume we have a DataFrame)
-- -- data = {
-- --     "user_id": np.random.randint(1, 51, 300),  # 50 unique users
-- --     "event_type": np.random.choice(["sign-in", "like", "comment", "share"], 300),  # Actions
-- --     "event_date": pd.to_datetime("2022-06-01") + pd.to_timedelta(np.random.randint(0, 60, 300), unit="D")  # Random June & July dates
-- -- }
-- -- # Create DataFrame
-- -- df = pd.DataFrame(data)
-- -- # Step 1: Convert dates to month and year
-- -- df["month"] = df["event_date"].dt.month
-- -- df["year"] = df["event_date"].dt.year
-- -- # Step 2: Filter users active in June 2022
-- -- users_june = set(df[(df["month"] == 6) & (df["year"] == 2022) & 
-- --                      (df["event_type"].isin(["sign-in", "like", "comment"]))]["user_id"])
-- -- # Step 3: Filter users active in July 2022
-- -- users_july = set(df[(df["month"] == 7) & (df["year"] == 2022) & 
-- --                      (df["event_type"].isin(["sign-in", "like", "comment"]))]["user_id"])
-- -- # Step 4: Find users active in both June and July
-- -- active_users = users_june.intersection(users_july)
-- -- # Step 5: Count distinct users (MAU)
-- -- result = pd.DataFrame({"mth": [7], "monthly_active_users": [len(active_users)]})
-- -- # Display result
-- -- print(result)


-- Further this type of question asked in "CARS24"

-- -- For each month, what is the M1 retention of users after their first order. A user is considered as retained in M1 if they have purchased a product between 30 to 60 days of their first order

-- -- CREATE TABLE Product_data_Apr_July (     
-- -- Timestamp TIMESTAMP,            
-- -- UserId VARCHAR(50),             
-- -- Event VARCHAR(20),     
-- -- Screen VARCHAR(50),          
-- -- Product_ID VARCHAR(20)      
-- -- );

-- -- data was provided
-- -- LOAD DATA LOCAL INFILE '/Users/akhichoudhary/Downloads/Product_data_Apr_July.csv'
-- -- INTO TABLE Product_data_Apr_July
-- -- FIELDS TERMINATED BY ',' 
-- -- ENCLOSED BY '"' 
-- -- LINES TERMINATED BY '\n'
-- -- IGNORE 1 ROWS
-- -- (Timestamp, UserId, Event, Screen, Product_ID);

-- the table looks like this -

-- +---------------------+--------------------------------------+-------+----------------------+--------------------+
-- | Timestamp           | UserId                               | Event | Screen               | Product_ID         |
-- +---------------------+--------------------------------------+-------+----------------------+--------------------+
--  |2024-05-22 20:27:04 | 000ecd0x-ffce-44d0-9c08-b6032bx506ff | View  | Product Listing Page | 01002-acvsf-09060
--  |2024-05-22 20:27:04 | 0002005d-9e7x-4de3-xc47-8xfd495602b4 | View  | Product Details Page | 01002-acvsf-09060
--  |2024-05-24 20:34:25 | 00093ed5-3925-4x66-x707-c4b406747dd7 | ATC   | Product Details Page | 01002-acvsf-09060
--  |2024-05-24 22:49:28 | 000b75dc-9x26-4e67-xf33-b0fd3386c4xe | Buy   | Cart                 | 01002-acvsf-09060
--  |2024-06-19 11:58:37 | 000c90e2-e37c-49de-850f-ee3c57c8205e | Buy   | Cart                 | 01002-acvsf-09068
-- +---------------------+--------------------------------------+-------+----------------------+--------------------+

-- select * from Product_data_Apr_July limit 5;
-- -- show databases;

-- WITH first_purchase AS (
--     SELECT 
--         userid, 
--         MIN(timestamp) AS first_buy_time,
--         EXTRACT(MONTH FROM MIN(timestamp)) AS first_buy_month
--     FROM classicmodels.Product_data_Apr_July
--     WHERE event = 'Buy'
--     GROUP BY userid
-- ),
-- retained_users AS (
--     SELECT 
--         p.userid, 
--         p.first_buy_month AS Month 
--     FROM first_purchase p
--     JOIN classicmodels.Product_data_Apr_July d
--     ON p.userid = d.userid
--     WHERE d.event = 'Buy' 
--     AND DATEDIFF(d.timestamp, p.first_buy_time) BETWEEN 30 AND 60
-- ),
-- monthly_users AS (
--     SELECT first_buy_month AS Month, COUNT(DISTINCT userid) AS total_users
--     FROM first_purchase
--     GROUP BY first_buy_month
-- )
-- SELECT 
--     r.Month, 
--     COUNT(DISTINCT r.userid) AS M1_retention_users,
--     m.total_users,
--     ROUND((COUNT(DISTINCT r.userid) * 100.0) / NULLIF(m.total_users, 0), 2) AS retention_percentage
-- FROM retained_users r
-- JOIN monthly_users m ON r.Month = m.Month
-- GROUP BY r.Month, m.total_users
-- ORDER BY r.Month;



--  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------







-- **************************** question-2 Y-on-Y Growth Rate Wayfair SQL Interview Question ******************************************************

-- -----------------------------          Y-on-Y Growth Rate                ------------------------------------

-- Assume you're given a table containing information about Wayfair user transactions for different products. 
-- Write a query to calculate the year-on-year growth rate for the total spend of each product, grouping the results by product ID.

-- The output should include the year in ascending order, product ID, current year's spend, previous year's spend and year-on-year growth percentage, rounded to 2 decimal places.

-- user_transactions Table:
-- Column Name	Type
-- transaction_id	integer
-- product_id	integer
-- spend	decimal
-- transaction_date	datetime

-- Solution:

-- step-1 Create a table
-- step-2 Insert random values
-- step-3 Write query to get the desired result

-- ----------         step-1

-- CREATE TABLE y_on_y_growth_rate (
--     transaction_id INT PRIMARY KEY AUTO_INCREMENT,
--     product_id INT,
--     spend DECIMAL(10,2),
--     transaction_date DATETIME
-- );



--  -----------    step-2


-- Method -1 to insert simply random 300 values;


-- INSERT INTO y_on_y_growth_rate (product_id, spend, transaction_date)
-- SELECT 
--     FLOOR(1 + (RAND() * 10)) AS product_id,  -- Random product_id from 1 to 10
--     ROUND(10 + (RAND() * 490), 2) AS spend,  -- Random spend between $10 and $500
--     DATE_ADD('2022-01-01', INTERVAL FLOOR(RAND() * 1000) DAY) AS transaction_date
-- FROM (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
--       UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 
--       UNION ALL SELECT 9 UNION ALL SELECT 10) AS t1,
--      (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
--       UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 
--       UNION ALL SELECT 9 UNION ALL SELECT 10) AS t2,
--      (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3) AS t3
-- LIMIT 300;

-- Summary: How RAND() is Used?
-- Use Case	Example
-- Random integer (1-10)	e.g FLOOR(1 + (RAND() * 10))
-- Random decimal (10-500)	e.g ROUND(10 + (RAND() * 490), 2)
-- Random event (30% probability)	e.g CASE WHEN RAND() < 0.3 THEN 'Yes' ELSE 'No' END
-- Random date within a year	e.g DATE_ADD('2022-01-01', INTERVAL FLOOR(RAND() * 365) DAY)

-- Columns Being Inserted
-- product_id: Randomly selects a product ID between 1 and 10.
-- spend: Generates a random transaction spend between $10 and $500.
-- transaction_date: Creates a random date starting from January 1, 2022, adding up to 1000 days (~2.7 years)

-- Method -2 

-- theory 

-- *Enhancements to Make the Data More Realistic

-- 1. Vary transaction amounts by product type

-- a.Expensive products have a higher average spend.
-- b.Cheaper products have a lower average spend.

-- 2.Distribute transactions over multiple years (e.g., 2021-2024)

-- a.Instead of just a random number of days, we’ll generate realistic transaction dates over multiple years.

-- 3.Introduce seasonal spending patterns

-- a.Higher spending around holidays (e.g., December for Christmas, November for Black Friday).

-- 4.Simulate different user behaviors

-- a.Some users buy frequently, while others buy rarely.

-- INSERT INTO y_on_y_growth_rate (product_id, spend, transaction_date)
-- SELECT 
--     -- Assign product IDs from 1 to 10 randomly
--     FLOOR(1 + (RAND() * 10)) AS product_id,  

--     -- Assign realistic spend based on product category
--     CASE 
--         WHEN RAND() < 0.3 THEN ROUND(100 + (RAND() * 900), 2)  -- 30% chance for high-value spend ($100-$1000)
--         WHEN RAND() < 0.6 THEN ROUND(50 + (RAND() * 450), 2)   -- 30% chance for medium-value spend ($50-$500)
--         ELSE ROUND(10 + (RAND() * 90), 2)                     -- 40% chance for low-value spend ($10-$100)
--     END AS spend,  

--     -- Assign random transaction dates between 2021 and 2024
--     DATE_ADD(
--         '2021-01-01', 
--         INTERVAL FLOOR(RAND() * 1460) DAY  -- 1460 days = ~4 years
--     ) AS transaction_date  
-- FROM 
--     (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
--      UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 
--      UNION ALL SELECT 9 UNION ALL SELECT 10) AS t1,
    
--     (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
--      UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 
--      UNION ALL SELECT 9 UNION ALL SELECT 10) AS t2,
    
--     (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 
--      UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 
--      UNION ALL SELECT 9 UNION ALL SELECT 10) AS t3
    
-- LIMIT 300;

-- m-1

-- with spends_prod_id_wise_yoy as(
-- select DISTINCT(EXTRACT(YEAR from transaction_date)) as yr,sum(spend) as total_spends,product_id
-- from classicmodels.y_on_y_growth_rate
-- group by product_id,EXTRACT(YEAR from transaction_date)
-- ),
-- prod_wise_spend_yoy as(
-- select yr,product_id,total_spends,
-- row_number() over(partition by product_id order by yr,total_spends) as r,
-- lag(total_spends,1,NULL) over(partition by product_id order by yr,total_spends) as spend_l_yr
-- from spends_prod_id_wise_yoy)
-- select yr as year,product_id,total_spends as curr_year_spend,spend_l_yr as yoy_rate, 
-- round((total_spends-spend_l_yr)*100/NULLIF(spend_l_yr,0),2) as incYOY
-- from prod_wise_spend_yoy;

-- m-2
-- WITH yearly_spend AS (
--     SELECT 
--         YEAR(transaction_date) AS year,
--         product_id,
--         SUM(spend) AS current_year_spend
--     FROM classicmodels.y_on_y_growth_rate
--     GROUP BY year, product_id
-- ),
-- previous_year_spend AS (
--     SELECT 
--         year + 1 AS year,  -- Shifting year to join with next year
--         product_id,
--         current_year_spend AS previous_year_spend
--     FROM yearly_spend
-- )
-- SELECT 
--     y.year,
--     y.product_id,
--     y.current_year_spend,
--     p.previous_year_spend,
--     ROUND(((y.current_year_spend - p.previous_year_spend) / NULLIF(p.previous_year_spend, 0)) * 100, 2) AS YoY_growth_percentage
-- FROM yearly_spend y
-- LEFT JOIN previous_year_spend p
-- ON y.year = p.year AND y.product_id = p.product_id
-- ORDER BY y.year, y.product_id;


--  ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------







-- **************************** question-2 Maximize Prime Item Inventory Amazon SQL Interview Question ******************************************************

-- -----------------------------          Maximize Prime Item Inventory                ------------------------------------

-- Amazon wants to maximize the storage capacity of its 500,000 square-foot warehouse by prioritizing a specific batch of prime items. 
-- The specific prime product batch detailed in the inventory table must be maintained.

-- So, if the prime product batch specified in the item_category column included 1 laptop and 1 side table, that would be the base batch. 
-- We could not add another laptop without also adding a side table; they come all together as a batch set.

-- After prioritizing the maximum number of prime batches, any remaining square footage will be utilized to stock non-prime batches, which also come in batch sets and cannot be separated into individual items.

-- Write a query to find the maximum number of prime and non-prime batches that can be stored in the 500,000 square feet warehouse based on the following criteria:

-- Prioritize stocking prime batches
-- After accommodating prime items, allocate any remaining space to non-prime batches
-- Output the item_type with prime_eligible first followed by not_prime, along with the maximum number of batches that can be stocked.

-- Assumptions:

-- Again, products must be stocked in batches, so we want to find the largest available quantity of prime batches, and then the largest available quantity of non-prime batches
-- Non-prime items must always be available in stock to meet customer demand, so the non-prime item count should never be zero.
-- Item count should be whole numbers (integers).
-- inventory table:
-- Column Name	Type
-- item_id	integer
-- item_type	string
-- item_category	string
-- square_footage	decimal


-- item_id	item_type	item_category	square_footage
-- 1374	prime_eligible	mini refrigerator	68.00
-- 4245	not_prime	standing lamp	26.40
-- 2452	prime_eligible	television	85.00
-- 3255	not_prime	side table	22.60
-- 1672	prime_eligible	laptop	8.50


create table Amazon_Inventory_Storage(
    item_id INTEGER Primary key,
    item_type VARCHAR(20),
    item_category  varchar(50),
    square_footage DECIMAL(10,2)
);

INSERT INTO Amazon_Inventory_Storage (item_id, item_type, item_category, square_footage)
SELECT 
    ROW_NUMBER() OVER () AS item_id,
    CASE WHEN ROW_NUMBER() OVER () % 2 = 0 THEN 'prime_eligible' ELSE 'not_prime' END AS item_type,
    CASE 
        WHEN ROW_NUMBER() OVER () % 5 = 0 THEN 'mini refrigerator'
        WHEN ROW_NUMBER() OVER () % 5 = 1 THEN 'standing lamp'
        WHEN ROW_NUMBER() OVER () % 5 = 2 THEN 'television'
        WHEN ROW_NUMBER() OVER () % 5 = 3 THEN 'side table'
        ELSE 'laptop'
    END AS item_category,
    ROUND(20 + (RAND() * 80), 2) AS square_footage
FROM (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) AS a,
     (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) AS b,
     (SELECT 1 AS n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) AS c
LIMIT 300;
