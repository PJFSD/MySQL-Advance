CREATE DATABASE Stored_Procedure_Flask;

USE Stored_Procedure_Flask;

CREATE TABLE Employees (
EmpID INT PRIMARY KEY,
EmpName VARCHAR(100),
Department VARCHAR(50),
Salary DECIMAL(10,2)
);

DELIMITER $$

CREATE PROCEDURE ShowAllEmployees()
BEGIN 
SELECT * FROM Employees;
END$$

DELIMITER ;

CALL ShowAllEmployees();