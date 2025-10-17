CREATE DATABASE SQL_Keys_Example;

USE SQL_Keys_Example;

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

SELECT * FROM Departments;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Employees (emp_id, emp_name, salary, dept_id) VALUES
(101, 'Alice', 55000, 2),
(102, 'Bob', 48000, 1),
(103, 'Charlie', 62000, 2),
(104, 'David', 75000, 3),
(105, 'Eva', 50000, 4);

SELECT * FROM Employees;

CREATE TABLE Project_Assignments (
    emp_id INT,
    project_id INT,
    role VARCHAR(50),
    PRIMARY KEY (emp_id, project_id),         -- ✅ Composite Key
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);

INSERT INTO Project_Assignments (emp_id, project_id, role) VALUES
(101, 201, 'Developer'),
(102, 202, 'HR Executive'),
(103, 201, 'Tester'),
(104, 203, 'Accountant'),
(105, 204, 'Marketing Lead'),
(101, 205, 'Team Lead');

SELECT * FROM Project_Assignments;






