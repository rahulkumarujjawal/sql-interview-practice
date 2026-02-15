/*
Problem:
Find the second highest salary from the employees table.

Table Structure:
employees(
    id INT,
    name VARCHAR(100),
    salary INT,
    department_id INT
)
*/

-- Solution 1: Using Subquery
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

-- Explanation:
-- 1. First find the maximum salary.
-- 2. Then select the maximum salary that is less than the highest.

