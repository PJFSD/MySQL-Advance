CREATE DATABASE HRC_1;

USE HRC_1;

-- 1️⃣ Create department table first
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- 2️⃣ Then create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M', 'F')),
    dept_id INT,
    salary DECIMAL(10,2),
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO department (dept_id, dept_name)
VALUES
(10, 'HR'),
(20, 'IT'),
(30, 'Finance');

INSERT INTO employees (emp_id, emp_name, gender, dept_id, salary, hire_date)
VALUES
(101, 'Rahul', 'M', 10, 55000, '2019-03-15'),
(102, 'Priya', 'F', 20, 65000, '2020-07-10'),
(103, 'Suresh', 'M', 10, 48000, '2021-02-12'),
(104, 'Ananya', 'F', 30, 72000, '2018-11-01'),
(105, 'Kiran', 'M', 20, 51000, '2022-06-20');

-- 1. Show details of employees hired after 2020-01-01.
SELECT * FROM employees WHERE hire_date > '2020-01-01'; 

-- 2. Find the total number of employees in each department.
SELECT dept_id, COUNT(emp_id) AS total_employees
FROM employees
GROUP BY dept_id;

--  3. List names and salaries of employees earning more than ₹50,000.
SELECT emp_name, salary
FROM employees
WHERE salary > '50000';

-- 4. Retrieve names of all female employees.
SELECT emp_name
FROM employees
WHERE gender = 'F';

--  5. Show details of employees hired after 2020-01-01.
SELECT * FROM employees WHERE hire_date > '2020-01-01';

--  6. Display all departments in alphabetical order.
SELECT *
FROM department
ORDER BY dept_name ASC;

-- 7. Calculate the average salary of employees in the IT department.
SELECT AVG(salary) AS avg_salary 
FROM employees 
WHERE dept_id = (SELECT dept_id FROM department WHERE dept_name='IT');

-- 8. Display the department name and total salary paid per department.
SELECT d.dept_name, SUM(e.salary) AS total_salary 
FROM employees e JOIN department d ON e.dept_id=d.dept_id 
GROUP BY d.dept_name;

-- 9. Count the number of male and female employees.
SELECT gender, COUNT(*) FROM employees GROUP BY gender;

--  10. Find the highest and lowest salary in each department.
SELECT dept_id, MAX(salary) AS max_salary,
MIN(salary) AS min_salary FROM employees
GROUP BY dept_id;

-- 11.Find employees whose names start with the letter ‘A’.
 SELECT * FROM employees WHERE emp_name LIKE 'A%';
 
 -- 12. Retrieve details of employees whose salary is between ₹50,000 and ₹70,000.
 SELECT * FROM employees WHERE salary BETWEEN 50000 AND 70000;
 
 -- 13.Show all employees not in the HR department. 
 SELECT * FROM department WHERE dept_name NOT LIKE "HR%";
 
 -- 14. Show department names with more than 1 employee.
 SELECT d.dept_name, COUNT(e.emp_id) AS total_employees
FROM department d
JOIN employees e ON d.dept_id = e.dept_id

-- 15. List employees who earn more than the average salary of all employees.
SELECT emp_name, salary 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 16. Display employees hired in the last 2 years
SELECT * FROM employees 
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- 17.Employees hired in same year as ‘Rahul’
 SELECT emp_name FROM employees
 WHERE YEAR(hire_date) = (SELECT YEAR(hire_date)
 FROM employees WHERE emp_name='Rahul');

-- 18.Top 3 highest-paid employees
SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

-- 19.Most recent hire (youngest)
 SELECT * FROM employees ORDER BY hire_date 