CREATE DATABASE SUBQUARIES_Interview_Assignment;

USE SUBQUARIES_Interview_Assignment;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    job_title VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments (dept_id, dept_name, location) VALUES
(1, 'HR', 'Mumbai'),
(2, 'Sales', 'Delhi'),
(3, 'IT', 'Bangalore'),
(4, 'Finance', 'Pune'),
(5, 'Marketing', 'Chennai');

INSERT INTO employees (emp_id, name, job_title, salary, dept_id, hire_date) VALUES
(101, 'Amit', 'HR Executive', 45000, 1, '2020-02-15'),
(102, 'Neha', 'HR Manager', 70000, 1, '2018-08-10'),
(103, 'Raj', 'Sales Executive', 40000, 2, '2021-06-22'),
(104, 'Priya', 'Sales Manager', 85000, 2, '2017-04-18'),
(105, 'Karan', 'Software Engineer', 65000, 3, '2019-03-12'),
(106, 'Sneha', 'System Analyst', 90000, 3, '2016-11-30'),
(107, 'Arjun', 'Finance Analyst', 50000, 4, '2021-01-05'),
(108, 'Meera', 'Accountant', 60000, 4, '2019-09-23'),
(109, 'Vikram', 'Marketing Executive', 48000, 5, '2020-05-10'),
(110, 'Ananya', 'Marketing Head', 95000, 5, '2015-12-19');

SELECT * FROM departments;

SELECT * FROM employees;

-- 1) Singale Row Sub_quaries 
-- Get employees who earn more than the average salary. 
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Avarege salary 
select avg(salary) as avg_salary from employees;


-- 2) Multi Row Sub_Quaries
-- Get employees who work in departments with 'Sales' or 'HR'
SELECT name
FROM employees
WHERE dept_id IN (SELECT dept_id FROM departments WHERE dept_name IN ('Sales', 'HR'));

-- 3) Multi Columns Sub Quaries  
-- Find employees with the same department and salary as someone named “ ”: 
SELECT name
FROM employees 
WHERE (dept_id, salary) IN 
(SELECT dept_id, salary FROM employees WHERE name = 'John');

-- 4) Correlated SubQuery
-- Find employees who earn more than the average salary of their own deparment
  SELECT name, dept_id, salary
  FROM employees e
  WHERE salary > (
  SELECT AVG(salary)
  FROM employees
  WHERE dept_id = e.dept_id);
  
  -- 5) Subquery in FROM (Derived Table)
 -- Show departments and their average salaries, then filter
 SELECT dept_id, avg_salary
 FROM (
 SELECT dept_id, AVG(salary) AS avg_salary
 FROM  employees 
 GROUP BY dept_id
 ) AS dept_avg
 WHERE avg_salary > 50000;
 
 -- 6) Subquery in SELECT
 -- Add a column showing each employee’s department average: .
 SELECT name, salary,
 (SELECT AVG(salary)
 FROM employees e2
 WHERE e2.dept_id = e1.dept_id) AS dept_dept
 FROM employees e1;