CREATE DATABASE Window_Function_Practice;

USE Window_Function_Practice;

-- Create Department Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1, 'Engineering'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Sales');


SELECT * FROM departments;
-- Create Employee Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    hire_date DATE,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(101, 'Alice', 1, '2018-03-12', NULL),
(102, 'Bob', 1, '2019-07-01', 101),
(103, 'Charlie', 2, '2020-01-15', 101),
(104, 'David', 3, '2017-09-23', NULL),
(105, 'Eve', 4, '2021-04-11', 104),
(106, 'Frank', 4, '2022-06-22', 104);

SELECT * FROM employees;

-- Create Salary Table
CREATE TABLE salaries (
    emp_id INT,
    base_salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    effective_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO salaries VALUES
(101, 95000, 8000, '2024-01-01'),
(102, 85000, 6000, '2024-01-01'),
(103, 55000, 3000, '2024-01-01'),
(104, 70000, 4000, '2024-01-01'),
(105, 50000, 2000, '2024-01-01'),
(106, 48000, 1000, '2024-01-01');

SELECT * FROM salaries;

-- a) ROW NUMBER()
--  Gives each row a unique sequence number within its partition.
-- (1) Find the highest-paid employee per department.
SELECT e.emp_name,
d.dept_name,
s.base_salary,
ROW_NUMBER() OVER (PARTITION BY d.dept_name ORDER BY s.base_salary DESC) AS row_num
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salaries s ON e.emp_id = s.emp_id;


-- b) RANK() vs DENSE_RANK()
 -- RANK() skips numbers after ties.
-- DENSE_RANK() doesn’t skip. 
SELECT e.emp_name,
d.dept_name,
s.base_salary,
RANK() OVER (PARTITION BY d.dept_name ORDER BY s.base_salary DESC) AS rank_pos,
DENSE_RANK() OVER (PARTITION BY d.dept_name ORDER BY s.base_salary DESC) AS dense_rank_pos
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN salaries s ON e.emp_id = s.emp_id;



-- Aggregate Window Functions
-- a) Running Total of Salary by Department
SELECT 
e.emp_name,
d.dept_name,
s.base_salary,
sum(s.base_salary) OVER (PARTITION BY d.dept_name ORDER BY s.base_salary DESC) AS running_total
FROM employees e
JOIN departments d on e.dept_id = d.dept_id
join salaries s ON e.emp_id = s.emp_id; 


-- Average salary per department
SELECT 
e.emp_name,
d.dept_name,
s.base_salary,
AVG(s.base_salary) OVER (PARTITION BY d.dept_name ORDER BY s.base_salary DESC) AS average_salary
FROM employees e
JOIN departments d on e.dept_id = d.dept_id
JOIN salaries s ON e.emp_id = s.emp_id;


-- Percentile or Percent Rank
-- To see relative standing in the company.
SELECT
e.emp_name,
s.base_salary,
PERCENT_RANK() OVER (ORDER BY s.base_salary DESC) AS pct_rank
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id;