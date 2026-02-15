/*
Problem:
Fetch users who logged in for 3 consecutive days.

Table Structure:
logins(
    user_id INT,
    login_date DATE
)
*/

WITH cte AS (
    SELECT 
        user_id,
        login_date,
        login_date - ROW_NUMBER() OVER (
            PARTITION BY user_id 
            ORDER BY login_date
        ) AS grp
    FROM logins
)

SELECT user_id
FROM cte
GROUP BY user_id, grp
HAVING COUNT(*) >= 3;

-- Explanation:
-- ROW_NUMBER helps detect consecutive dates.
-- Grouping by date difference identifies sequences.
