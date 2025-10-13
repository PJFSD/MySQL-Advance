CREATE DATABASE MySQL_Advance;

USE MySQL_Advance;

CREATE TABLE  employees (
emp_id INT,
emp_name VARCHAR(50),
department VARCHAR(30),
salary DECIMAL(10,2),
hire_date date
);

INSERT INTO employees VALUES
(101, "Amit", "Sales", 45000, "2020-01-15"),
(102, "Priya", "IT", 60000, "2019-11-10"),
(103, "Ravi", "HR", 50000, "2021-05-20"),
(104, "Sneha", "IT", 65000, "2018-09-12"),
(105, "Vivek", "Sales", 48000, "2022-02-01");

SELECT * FROM employees;

SELECT emp_name, salary FROM employees WHERE department = "IT";

SELECT emp_name, salary FROM employees WHERE salary > 50000; 


SELECT COUNT(*) AS total_employees FROM employees;
SELECT AVG(salary) AS avg_salary FROM employees;
SELECT MAX(salary) AS max_salary FROM employees;
SELECT MIN(salary) AS min_salary FROM employees;
SELECT SUM(salary) AS total_salary FROM employees;



CREATE TABLE sales (
sale_id INT,
emp_id INT,
sale_amount DECIMAL(10,2),
sale_date DATE
);

INSERT INTO sales VALUES 
(1, 101, 5000, "2024-01-10"),
(2, 101, 7000, "2024-02-15"),
(3, 102, 8000, "2024-03-12"),
(4, 103, 3000, "2024-01-20"),
(5, 105, 9000, "2024-03-10"),
(6, 105, 4000, "2024-03-30");

SELECT emp_id, SUM(sale_amount) AS total_sales
FROM sales
GROUP BY emp_id;

SELECT emp_id, SUM(sale_amount) AS total_sales
FROM sales
GROUP BY emp_id
HAVING SUM(sale_amount) > 10000;


CREATE TABLE department (
dept_name VARCHAR(30),
manager_name VARCHAR(50),
location VARCHAR(30)
);

INSERT INTO department VALUES
("Sales", "Rajesh", "Mumbai"),
("IT", "Karan", "Pune"),
("HR", "Simran", "Delhi"),
("Finance", "Aarti", "Chennai");

-- SQL JOINS 
-- INNER JOIN
--  Returns only matching records from both tables.
SELECT e.emp_name, 
       e.department,     
       d.manager_name, 
       d.location
FROM employees e
INNER JOIN department d
ON e.department = d.dept_name;


-- LEFT JOIN
-- ➡ Returns all rows from the left table, even if there is no match in the right table.
SELECT e.emp_name, e.department, d.manager_name
FROM employees e
LEFT JOIN department d
ON e.department = d.dept_name;

-- RIGHT JOIN-- 
-- ➡ Opposite of LEFT JOIN. Returns all rows from the right table.
SELECT e.emp_name, e.department, d.manager_name
FROM employees e
RIGHT JOIN department d
ON e.department = d.dept_name;

-- FULL JOIN (if your DB supports it)
-- ➡ Returns all records from both sides (MySQL doesn’t have FULL JOIN directly — we simulate it using UNION).
SELECT e.emp_name, e.department, d.manager_name
FROM employees e
LEFT JOIN department d ON e.department = d.dept_name

UNION

SELECT e.emp_name, e.department, d.manager_name
FROM employees e
RIGHT JOIN department d ON e.department = d.dept_name;


--  Subqueries
CREATE TABLE projects (
project_id INT,
project_name VARCHAR(50),
emp_id INT,
budget DECIMAL(10,2)
);

INSERT INTO projects VALUES
(1, "CRM System", 102, 150000),
(2, "HR Portal", 103, 80000),
(3, "Sales Dashboard", 101, 120000),
(4, "Cloud Migration", 104, 200000),
(5, "Customer Feedback", 105, 70000);

-- Subquery in WHERE
-- Find employees who earn more than the average salary.
SELECT emp_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- SubQuery in FROM
--  Calculate total project budgets by department using a subquery.
SELECT department, SUM(total_budget) AS dept_total_budget
FROM (
SELECT e.department, p.budget AS total_budget
FROM employees e
JOIN projects p ON e.emp_id = p.emp_id
) AS sub
GROUP BY department;

-- Subquery with IN
-- Find employees who are working on projects with budgets above 100000.
SELECT emp_name
FROM employees 
WHERE emp_id IN (
SELECT emp_id FROM projects WHERE budget > 1000000);

-- CASE Expression
SELECT emp_name,
       department,
       salary,
       CASE 
           WHEN salary > 60000 THEN 'High Earner'
           WHEN salary BETWEEN 45000 AND 60000 THEN 'Mid Earner'
           ELSE 'Low Earner'
       END AS salary_level
FROM employees;



--  String & Date Functions
SELECT emp_name, SYSDATE() AS systyem_time FROM employees;








-- ADVANCE MySQL_Begins -- 

CREATE TABLE sales_data (
    sale_id INT,
    emp_id INT,
    sale_amount DECIMAL(10,2),
    sale_month VARCHAR(20)
);

INSERT INTO sales_data VALUES
(1, 101, 5000, 'Jan'),
(2, 101, 7000, 'Feb'),
(3, 102, 8000, 'Jan'),
(4, 102, 6000, 'Feb'),
(5, 103, 4000, 'Jan'),
(6, 103, 9000, 'Feb'),
(7, 101, 10000, 'Mar'),
(8, 102, 9000, 'Mar'),
(9, 103, 5000, 'Mar');

SELECT * FROM sales_data;

--  ROW_NUMBER()
-- Gives a unique sequence number for each row within a partition.

SELECT emp_id, sale_month, sale_amount, 
ROW_NUMBER() OVER (PARTITION BY emp_id ORDER BY sale_amount DESC) AS row_num
FROM sales_data;

-- Assigns rank within each employee based on sales.
-- RANK() vs DENSE_RANK()
-- RANK() leaves gaps if there are ties.
-- DENSE_RANK() does not.

SELECT emp_id, sale_month, sale_amount,
RANK() OVER (PARTITION BY emp_id ORDER BY sale_amount DESC) AS rank_no,
DENSE_RANK() OVER (PARTITION BY emp_id ORDER BY sale_amount DESC) AS dense_rank_no
FROM sales_data;


-- SUM() OVER

-- Running total (cumulative sum).
SELECT emp_id, sale_month, sale_amount,
SUM(sale_amount) OVER (PARTITION BY emp_id ORDER BY sale_month) AS running_total
FROM sales_data;


-- CTE – Common Table Expressions

-- CTEs are like temporary named result sets you can reuse within a query. 
WITH high_sales AS (
SELECT emp_id, SUM(sale_amount) AS total_sales
FROM sales_data
GROUP BY emp_id
)
SELECT * FROM high_sales WHERE total_sales > 15000;

-- Multiple CTEs
 WITH emp_total AS (
    SELECT emp_id, SUM(sale_amount) AS total_sales
    FROM sales_data
    GROUP BY emp_id
),
emp_rank AS (
    SELECT emp_id, total_sales,
           RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
    FROM emp_total
)
SELECT * FROM emp_rank WHERE sales_rank <= 2;
