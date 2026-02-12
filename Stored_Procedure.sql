CREATE DATABASE Stored_Procedure;

USE Stored_Procedure;

CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

-- Create Stored Procedure to Insert Data

DELIMITER $$

CREATE PROCEDURE AddEmployee(
    IN emp_name VARCHAR(100),
    IN emp_dept VARCHAR(50),
    IN emp_salary INT
)
BEGIN
    INSERT INTO employees(name, department, salary)
    VALUES(emp_name, emp_dept, emp_salary);
END $$

DELIMITER ;

-- Call Stored Procedure
CALL AddEmployee('Gourav', 'IT', 50000);

-- Add more data
CALL AddEmployee('Rahul', 'HR', 35000);
CALL AddEmployee('Sneha', 'Finance', 45000);

-- Check Data
-- Stored Procedure to Create Table + Insert Data 
SELECT * FROM employees;

DELIMITER $$

CREATE PROCEDURE CreateAndInsert()
BEGIN
    CREATE TABLE IF NOT EXISTS students (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50)
    );

    INSERT INTO students(name) VALUES ('Amit');
END $$

DELIMITER ;

CALL CreateAndInsert();

-- Hospital Management Example (Stored Procedure)

CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT,
    disease VARCHAR(100),
    city VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE PROCEDURE AddPatient(
    IN p_name VARCHAR(100),
    IN p_age INT,
    IN p_disease VARCHAR(100),
    IN p_city VARCHAR(50)
)
BEGIN

    IF p_age > 0 THEN
    
        INSERT INTO patients(patient_name, age, disease, city)
        VALUES(p_name, p_age, p_disease, p_city);
        
    ELSE
    
        SELECT 'Invalid Age' AS Message;
        
    END IF;

END $$

DELIMITER ;

-- Stored Procedure with UPDATE

-- Update patient disease.

DELIMITER $$

CREATE PROCEDURE UpdateDisease(
    IN p_id INT,
    IN new_disease VARCHAR(100)
)
BEGIN
    UPDATE patients
    SET disease = new_disease
    WHERE patient_id = p_id;
END $$

DELIMITER ;

-- Stored Procedure with DELETE 
DELIMITER $$

CREATE PROCEDURE DeletePatient(
    IN p_id INT
)
BEGIN
    DELETE FROM patients
    WHERE patient_id = p_id;
END $$

DELIMITER ;

SELECT * FROM employees;

