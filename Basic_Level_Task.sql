CREATE DATABASE Employees_Task;

USE Employees_Task;

CREATE TABLE Employees (
Emp_ID int,
EmpName VARCHAR(50),
Department VARCHAR(30),
Salary int,
Join_Date DATE
);

INSERT INTO Employees VALUES
(101, 'Swatik Chiraga', 'Sport', 65000, '2025-04-12'),
(102, 'Narayan Murti', 'Finance', 90000, '2021-09-02'),
(103, 'Satyam More', 'HR', 74000, '2022-07-08'),
(104, 'Kunal Ghatge', 'IT', 85000, '2024-01-01'),
(105, 'Pooja Pawar', 'Sales', 45000, '2023-07-15');

-- (1) Write a query to display all employee details.
SELECT * FROM Employees;

-- (2) Write a query to display unique department names.
SELECT * FROM Employees where department;

-- (3) Write a query to sort employees by salary in descending order.
SELECT * FROM Employees ORDER BY Salary DESC;

-- (4) Find employees who joined after 2020.
SELECT * FROM Employees 
WHERE Join_Date > '2020-12-31';

-- (5) Write a query to find employees with salary greater than 50,000.
SELECT * FROM Employees WHERE Salary > 50000;

-- (6)  Display employees whose name starts with ‘A’.
SELECT * FROM Employees WHERE EmpName LIKE 'S%';

-- (7)  Count total number of employees.
SELECT COUNT(*) AS Total_Employees FROM Employees;

-- (8)  Display maximum, minimum, and average salary.
SELECT max(salary) AS Total_Employees FROM Employees;

-- Minimum
SELECT min(salary) AS Total_Employees FROM Employees; 

-- Average
SELECT AVG(Salary) AS Total_Employees FROM Employees;

-- 🔹 Intermediate Level Tasks
 -- Create a table named Departments with columns (DeptID, DeptName, Location).
 CREATE TABLE Department (
 Dept_ID int,
 DeptName VARCHAR(50),
 Location VARCHAR(30)
 );
 
 INSERT INTO Department VALUES
 (11, 'IT', 'Nashik'),
 (12, 'Sport', 'Mumbai'),
 (13, 'IT', 'Pune'),
 (14, 'HR', 'Gujrat'),
 (15, 'Finance', 'Kolhapur');
 
 SELECT * FROM Department;
 
 -- (1) Write a query to join Employees and Departments tables.
SELECT  

-- (2) Display employees working in ‘IT’ department.

SELECT * FROM Department WHERE DeptName = "IT";

-- (3) Write a query to group employees by department and show total salary per department.
 SELECT * FROM Employees
 WHERE Salary
 
-- (4)  Find departments having more than 3 employees.
SELECT * FROM Department
 
 
 



