CREATE DATABASE SQL_Test_1;

USE SQL_Test_1;

-- 1) Create Employees Table

CREATE TABLE Employees(
  EmpID INT PRIMARY KEY,
  EmpName VARCHAR(50),
  Department VARCHAR(50),
  Salary DECIMAL(10,2),
  JoinDate DATE
);

-- Insert sample data
INSERT INTO Employees(EmpID, EmpName, Department, Salary, JoinDate) VALUES
 (1, 'Amit', 'IT', 30000, '2025-10-23'),
 (2, 'Sneha', 'Finance', 40000, '2025-09-20'),
 (3, 'Jay', 'IT', 35000, '2024-10-12'),
 (4, 'Manthan', 'Account', 25000, '2025-08-19'),
 (5, 'Suresh', 'Sales', 25000, '2025-07-20');

SELECT * FROM Employees;

-- 2) Unique Department Names
SELECT DISTINCT Department FROM Employees;

-- 3) Sort Employees by Salary (Descending)
SELECT EmpName, Salary FROM Employees ORDER BY Salary DESC;

-- 4) Employees who joined after 2020
SELECT EmpID, EmpName,Department,
JoinDate
FROM employees
WHERE JoinDate > "2020-12-31";

-- 5) Employees with Salary greater than 50,000
SELECT * FROM employees WHERE Salary > 50000;
SELECT EmpID, EmpName, Salary
FROM Employees
WHERE Salary > 50000;

-- 6) Employees whose name starts with ‘A’
SELECT EmpID, EmpName
FROM Employees
WHERE EmpName LIKE "A%";

-- 7) Count total number of employees
SELECT COUNT(*) AS Total_Employees FROM Employees;

-- 8) Display Max, Min, and Avg Salary
SELECT MAX(Salary) AS max_Salary, 
 MIN(Salary) AS min_Salary,
 AVG(Salary) AS avg_Salary
FROM Employees;

 -- 9) Create Departments Table
CREATE TABLE Departments(
  DeptID INT PRIMARY KEY,
  DeptName VARCHAR(50),
  Location VARCHAR(50)
);

-- Insert sample data
INSERT INTO Departments (DeptID, DeptName, Location) VALUES
 (101, 'IT', 'Pune'),
 (102, 'Finance', 'Mumbai'),
 (103, 'Account', 'Delhi'),
 (104, 'Sales', 'Bangalore'),
 (105, 'HR', 'Chennai');

SELECT * FROM Departments;

-- 🔟 Join Employees and Departments Tables
SELECT e.EmpName, e.Department,
e.Salary, d.Location
FROM Employees e
LEFT JOIN Departments d
ON e.Department = d.DeptName;

-- 11) Employees working in ‘IT’ department
SELECT EmpName, Salary
FROM Employees
WHERE Department = "IT";

-- 12) Total Salary per Department
SELECT  Department, SUM(Salary) AS Total_Salary
FROM Employees
GROUP BY Department;

-- 13) Departments having more than 3 employees
SELECT Department, COUNT(*) AS
Employees_Count
FROM employees
GROUP BY Department
HAVING COUNT(*) > 3;

-- 14) Top 3 highest paid employees
SELECT EmpName, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 3;

-- 15) Employees not assigned to any department
SELECT e.EmpName
FROM Employees e
LEFT JOIN Departments d
ON e.Department = d.DeptName
WHERE d.DeptName IS NULL;

-- 16) Salary Classification using CASE
SELECT EmpName, Department, Salary,
CASE
WHEN Salary > 35000 THEN "HIGH"
WHEN Salary BETWEEN 25000 AND
35000 THEN "Medium"
ELSE "Low"
END AS Salary_Level
FROM Employees;

-- 17) Update Salary by 10% for IT Department
UPDATE Employees
SET Salary = Salary * 1.10
WHERE Department = "IT";

SELECT * FROM Employees;

-- 18) Create Projects Table

CREATE TABLE Projects(
  ProjectID INT PRIMARY KEY,
  ProjectName VARCHAR(50),
  StartDate DATE,
  EndDate DATE,
  EmpID INT,
  FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);

-- Insert sample projects
INSERT INTO Projects(ProjectID, ProjectName, StartDate, EndDate, EmpID) VALUES
 (1001, 'Testing', '2025-01-01', '2025-06-01', 1),
 (1002, 'Audit', '2025-03-01', '2025-08-01', 2),
 (1003, 'Development', '2025-02-01', '2025-05-01', 3),
 (1004, 'Recruitment', '2025-01-15', '2025-07-15', 1);

SELECT * FROM Projects;

-- 19) Employees working on more than one project
SELECT EmpID, COUNT(ProjectID) AS
Project_Count
FROM Projects
GROUP BY EmpID
HAVING COUNT(ProjectID) > 1;

-- 20) Employees not assigned to any project
SELECT e.EmpName
FROM Employees e
LEFT JOIN Projects p ON e.EmpID =
p.EmpID
WHERE p.ProjectID IS NULL;

-- 21) Average Project Duration
SELECT AVG(DATEDIFF(EndDate, StartDate)) AS Avg_Project_Duration
FROM Projects;

-- 22) Employees with salary greater than average salary (Subquery)
SELECT EmpName, Salary
FROM employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);

-- 23) EXISTS – Departments having employees
SELECT DeptName 
FROM Departments d
WHERE EXISTS (
SELECT 1 FROM Employees e WHERE 
e.Department = d.DeptName);

-- 24) ANY / ALL – Compare salary to IT department
SELECT EmpName,Department, Salary
FROM employees
WHERE Salary > ALL (
SELECT Salary FROM Employees WHERE
Department ="IT");

-- 25) View for Active Employees
CREATE VIEW ActiveEmployees AS
SELECT * FROM employees
WHERE Salary IS NOT NULL;

SELECT * FROM ActiveEmployees;