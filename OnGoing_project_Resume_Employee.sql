CREATE DATABASE employee_db;

USE employee_db;

CREATE TABLE employees (
emp_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL,
department VARCHAR(50),
position VARCHAR(50),
salary DECIMAL(10,2),
email VARCHAR(100)
);
