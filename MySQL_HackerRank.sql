CREATE DATABASE Hacker_Rank;

USE Hacker_Rank;

CREATE TABLE Departments (
DeptID INT PRIMARY KEY,
DeptName VARCHAR(50) NOT NULL,
Location VARCHAR(50)
);

INSERT INTO Departments (DeptID, DeptName, Location) VALUES
(101, 'HR', 'Mumbai'),
(102, 'IT', 'Pune'),
(103, 'Finance', 'Delhi');

SELECT * FROM Departments;

CREATE TABLE Employees (
EmpID INT PRIMARY KEY,
EmpName VARCHAR (100) NOT NULL,
Department VARCHAR(50),
Salary DECIMAL(10,2),
JoiningDate DATE,
Gender CHAR(1),
ManagerID INT,
FOREIGN KEY (ManagerID) REFERENCES Employees(EmpID));

INSERT INTO Employees (EmpID, EmpName, Department, Salary, JoiningDate, Gender, ManagerID)
VALUES
(5, 'Meena', 'HR', 80000, '2018-06-12', 'F', NULL),
(6, 'John', 'Finance', 90000, '2017-02-10', 'M', NULL),
(7, 'Ramesh', 'IT', 95000, '2016-07-18', 'M', NULL);

-- Now insert subordinates
INSERT INTO Employees (EmpID, EmpName, Department, Salary, JoiningDate, Gender, ManagerID)
VALUES
(1, 'Rahul', 'HR', 45000, '2021-05-12', 'M', 5),
(2, 'Priya', 'IT', 60000, '2020-09-23', 'F', 7),
(3, 'Amit', 'Finance', 55000, '2021-01-15', 'M', 6),
(4, 'Sneha', 'IT', 65000, '2019-03-08', 'F', 7);

SELECT * FROM Employees;

CREATE TABLE Projects (
ProjID INT PRIMARY KEY,
ProjName VARCHAR(100) NOT NULL,
DeptID INT,
StartDate DATE,
EndDate DATE,
FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Projects (ProjID, ProjName, DeptID, StartDate, EndDate) VALUES
(201, 'Payroll System', 103, '2022-01-01', '2022-12-31'),
(202, 'AI Chatbot', 102, '2023-03-01', NULL),
(203, 'Recruitment Portal', 101, '2021-04-01', '2021-11-30');

SELECT * FROM Projects;

CREATE TABLE Attendance (
EmpID INT,
Date DATE,
Status ENUM('Present', 'Absent'),
FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

INSERT INTO Attendance (EmpID, Date, Status) VALUES
(1, '2025-10-01', 'Present'),
(1, '2025-10-02', 'Absent'),
(2, '2025-10-01', 'Present'),
(3, '2025-10-01', 'Present');

SELECT * FROM Attendance;

-- List all employees who work in the IT department.
SELECT * FROM Employees WHERE Department = 'IT';

--  Display the names and salaries of all employees earning more than ₹60,000.
SELECT * FROM Employees WHERE Salary > 60000;

--  Show all employees who joined after 2020
SELECT * FROM Employees WHERE YEAR(JoiningDate) > 2020;

-- Find the total number of employees in each department.
SELECT Department, COUNT(EmpID) as total_employees FROM Employees group by Department;

-- Display the details of employees whose name starts with ‘S’.
SELECT * FROM Employees WHERE EmpName LIKE 'S%';

--  Show employee names in alphabetical order.
SELECT EmpName FROM Employees ORDER BY EmpName;

-- List all female employees who work in HR.


-- Find the employee with the highest salary.
SELECT 

--  Display employees who don’t have a manager.

-- Show the count of employees in each gender category.  


