/*
Problem:
Calculate the running total of sales by date.

Table Structure:
sales(
    id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
)
*/

-- Solution:
SELECT 
    sale_date,
    SUM(amount) OVER (ORDER BY sale_date) AS running_total
FROM sales;

-- Explanation:
-- SUM() OVER() creates a window function.
-- It accumulates the total based on date order.
