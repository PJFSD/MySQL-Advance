CREATE DATABASE company_db;

USE company_db;

CREATE TABLE employees (
emp_id int,
name VARCHAR (100),
email VARCHAR (100),
salary int,
department VARCHAR (50),
join_date date
);

ALTER TABLE employees ADD PRIMARY KEY (emp_id);

ALTER TABLE employees MODIFY salary DECIMAL(10,2);

ALTER TABLE employees ADD status VARCHAR(20) DEFAULT "ACTIVE";

ALTER TABLE employees RENAME COLUMN name TO emp_name;

ALTER TABLE employees RENAME TO employee_master;

ALTER TABLE employee_master DROP COLUMN status;

DROP TABLE employee_master;

INSERT INTO employees VALUES (101, "Amit", "amit@mail.com", 50000, "IT", "2023-01-10");

INSERT INTO employees VALUES
(102, "Neha", "neha@mail.com", 60000, "HR", "2022-05-12"),
(103, "Raj", "raj@mail.com", 70000, "IT", "2021-03-15");

INSERT INTO employees (emp_id, emp_name, salary) VALUES (104, "Sita", 45000);

INSERT INTO employees VALUES
(105, "Ravi", "ravi@mail.com", 40000, "Finance", "2020-11-20");

INSERT INTO employees VALUES
(106, "Anil", "anil@mail.com", 55000, "IT", CURDATE());

INSERT INTO employees (emp_id, emp_name)
VALUES (107, "Pooja");

-- INSERT INTO employees_archive
-- SELECT * FROM employees;

INSERT INTO employees VALUES
(108, "Karan", NULL, NULL, NULL, NULL);

INSERT INTO employees VALUES
(109, "Meera", "meera@mail.com", DEFAULT, "HR", "2024-02-01");

INSERT INTO employees VALUES
(101, "Duplicate", "dup@mail.com", 30000, "IT", "2023-01-01");

SELECT * FROM employees;

SELECT emp_name, salary FROM employees;

SELECT DISTINCT department FROM employees;

SELECT * FROM employees WHERE salary > 50000;

SELECT * FROM employees WHERE department = "IT";

SELECT * FROM employees WHERE join_date > "2023-01-01";

SELECT * FROM employees ORDER BY salary ASC;

SELECT * FROM employees ORDER BY join_date DESC;

SELECT * FROM employees ORDER BY salary DESC LIMIT 5;

SELECT * FROM employees WHERE salary IS NULL;

SELECT * FROM employees WHERE salary BETWEEN 30000 AND 80000;

SELECT * FROM employees WHERE department IN ("IT", "HR");

SELECT * FROM employees WHERE salary != 50000;

SELECT * FROM employees WHERE emp_name LIKE "A%";

SELECT * FROM employees WHERE emp_name LIKE "%n";

SELECT * FROM employees WHERE emp_name LIKE "%ar%";

SELECT * FROM employees WHERE department IN ("IT", "Finance");

SELECT * FROM employees WHERE department NOT IN ("HR");

SELECT * FROM employees WHERE email IS NULL;

SELECT * FROM employees WHERE email IS NOT NULL;


-- SECTION 5 : Aggregate Functions & GROUP BY
-- Find total numbers of employees
SELECT COUNT(*) AS Total_employees FROM employees;

-- Find average salary of empoyees
SELECT AVG(salary) AS avg_salary FROM employees;

-- Find highest salary
SELECT MAX(salary) AS max_salary FROM employees;

-- Find lowest salary   
SELECT MIN(salary) AS min_salary FROM employees;

-- Find department-wise average salary
SELECT department, COUNT(*) FROM employees GROUP BY department;

-- Display departments having more than 3 employees
SELECT department, AVG(salary) FROM employees GROUP BY department;

-- Display total salary paid per department.
SELECT department FROM employees GROUP BY department HAVING COUNT(*) > 3; 

-- Display departments with average salary greater than 60,000.
SELECT department FROM employees GROUP BY department HAVING AVG(salary) > 60000;

-- Count employees joined in each year.
SELECT YEAR(join_date), COUNT(*) FROM employees GROUP BY YEAR(join_date);  

-- SECTION 6: UPDATE & DELETE

-- Update salary of employee with emp_id = 101.
UPDATE employees SET salary = 60000 WHERE emp_id = 101;

-- Increase salary by 10% for IT department.
UPDATE employees SET salary = salary * 1.10 WHERE department = "IT";

-- Update department to Admin where department is NULL.
UPDATE employees SET department = "Admin" WHERE deparTment IS NULL;

-- Update multiple columns in a single query.
UPDATE employees SET department = "50000", department = "HR" WHERE emp_id =107;

-- Set salary to NULL for employees in HR.
UPDATE  employees SET salary = NULL WHERE department = "HR";

-- Delete employee with emp_id = 110.
DELETE FROM employees WHERE emp_id = 110;

-- Delete employees with salary less than 20,000.
DELETE FROM employees WHERE salary < 20000;

-- Delete employees whose department is NULL.
DELETE FROM employees WHERE department IS NULL;

-- Delete all employees (without dropping table).
DELETE FROM employees;

-- Delete employees joined before 2020-01-01.
DELETE FROM employees WHERE join_date < "2020-01-01";

SELECT * FROM employees;

-- Create table with PRIMARY KEY and NOT NULL. 
CREATE TABLE test1 (
id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL
);

-- Create table with UNIQUE email constraint. 
CREATE TABLE test2 (
email VARCHAR(100) UNIQUE
);

--  Create table with DEFAULT salary.
CREATE TABLE test3 (
salary INT DEFAULT 30000
);

-- Create table with CHECK constraint on salary.
CREATE TABLE test4 (
salary INT CHECK (salary > 0)
);

--  Add FOREIGN KEY between employees and departments.
alter table employees add constraint fk_dept foreign key (department) references departments (dept_name);

-- Insert data violating PRIMARY KEY.
INSERT INTO test1 VALUES (1, "A");
INSERT INTO test1 VALUES (1, "B");        -- Error 

-- Insert data violating UNIQUE constraint.
INSERT INTO test2 VALUES ("a@mail.com");
INSERT INTO test2 VALUES ("a@mail.com");  -- Error

-- Insert data violating FOREIGN KEY.
INSERT INTO employees VALUES (200, "X", "x@mail.com", 40000, "Unknown", "2023-01-01");

-- Drop a constraint from a table.
ALTER TABLE employees DROP FOREIGN KEY fk_dept;

-- Disable foreign key checks temporarily.
SET FOREIGN_KEY_CHECKS =0;  


-- SECTION 8: JOINS

-- Create departments table.
CREATE TABLE departmentS(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

-- Display employees with their department names using INNER JOIN.
SELECT e.emp_name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.department = d.dept_name;

-- Display all employees even if department is missing (LEFT JOIN).
SELECT * FROM employees e
INNER JOIN departments d
ON e.department = d.dept_name;

-- Display all departments even if no employees (RIGHT JOIN).
SELECT * FROM employees e
RIGHT JOIN departments d
ON e.department = d.dept_name;

-- Display matching records using NATURAL JOIN.
SELECT * FROM employees NATURAL JOIN departments;

-- Display all combinations of employees and departments.
SELECT * FROM employees CROSS JOIN departments;

-- Find employees working in IT.
SELECT * FROM employees WHERE department = "IT";

-- Count employees per department using JOIN.
SELECT d.dept_name, COUNT(e.emp_id)
FROM departments d
LEFT JOIN employees e
ON d.dept_name = e.department
GROUP BY d.dept_name;

-- Display employees whose department does not exist.
SELECT * FROM employees e
LEFT JOIN departments d
ON e.department = d.dept_name
WHERE d.dept_name IS NULL;

-- Join same table to find manager-employee relation.
 SELECT e1.emp_name, e2.emp_name AS manager
 FROM employees e1
 JOIN employees e2
 ON e1.manager_id = e2.emp_id;
 
--  SECTION 9: Subqueries

-- Display employee with highest salary.
SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);

-- Display employees earning more than average salary.
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);

-- Display employees from department having highest average salary.
SELECT * FROM employees WHERE department = (SELECT department FROM employees GROUP BY department ORDER BY AVG(salary) DESC LIMIT 1);

-- Display employees whose salary equals max salary.
SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);

-- Display department with maximum employees.
SELECT department FROM employees GROUP BY department ORDER BY COUNT(*) DESC LIMIT 1;

-- Display employees not in IT department using subquery.
SELECT * FROM employees WHERE department NOT IN (SELECT department FROM employees WHERE department = "IT");

-- Display employees joined in latest year.
SELECT * FROM employees employees WHERE YEAR(join_date) = (SELECT MAX(YEAR(join_date)) FROM employees); 

-- Display second highest salary.
SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);

-- Display employees earning more than department average.
SELECT * FROM employees e WHERE salary > (SELECT AVG(salary) FROM employees WHERE  department = e.department);

-- Delete employees earning below average salary.
DELETE FROM employees WHERE salary < (SELECT AVG(salary) FROM employees);