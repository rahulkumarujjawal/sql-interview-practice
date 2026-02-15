/*
Problem:
Rank products by sales in descending order for each region.

Table Structure:
sales(
    region VARCHAR(50),
    product_id INT,
    amount DECIMAL(10,2)
)
*/

SELECT 
    region,
    product_id,
    SUM(amount) AS total_sales,
    RANK() OVER (
        PARTITION BY region 
        ORDER BY SUM(amount) DESC
    ) AS rank
FROM sales
GROUP BY region, product_id;

-- Explanation:
-- PARTITION BY region creates ranking within region.
-- ORDER BY SUM(amount) DESC ranks highest sales first.
