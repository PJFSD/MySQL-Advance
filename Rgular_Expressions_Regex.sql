CREATE DATABASE Rgular_Expressions_Regex;

USE Rgular_Expressions_Regex;

CREATE TABLE Employees (
  id INT,
  name VARCHAR(50),
  department VARCHAR(50)
);

INSERT INTO Employees VALUES
(1, 'Alice', 'Sales'),
(2, 'Bob', 'HR'),
(3, 'Charlie', 'Finance'),
(4, 'David', 'Sales'),
(5, 'Eve', 'Support'),
(6, 'Annie', 'Admin'),
(7, 'Amit', 'Finance');

SELECT * FROM Employees;

SELECT column_name
FROM table_name
WHERE column_name REGEXP 'pattern';
SELECT column_name
FROM table_name
WHERE column_name REGEXP 'pattern';

-- Macth beginning of a string-- ^
SELECT * FROM employees
WHERE name REGEXP '^A';

-- Match end of a string --$
SELECT * FROM Employees
WHERE name REGEXP '^e$';

-- Match any one character --.
SELECT * FROM Employees
WHERE name REGEXP '^A.e';

-- Match multiple possible characters -- []
SELECT * FROM Employees
WHERE name REGEXP '^[CD]';

-- Match charater ranges
SELECT * FROM Employees
WHERE name REGEXP '^[A-M]';

-- Match one of multiple strings
SELECT * FROM Employees 
WHERE department REGEXP 'Sales|Support';    

-- Match any one character --.
SELECT * FROM Employees 
WHERE name REGEXP 'A.e';

-- Match multiple possible character -[]
SELECT * FROM Employees
WHERE name REGEXP '^[CD]';

-- Match character ranges
SELECT * FROM Employees  
WHERE name REGEXP '[A-M]'; 

-- Match repeating patterns — +, *, {n}

-- Match words anywhere in text
SELECT * FROM Employees
WHERE department REGEXP '[[:<:]]Sales[[:>:]]';

-- Case-insensitive (default)

-- MySQL regex is case-insensitive by default.
-- If you need case-sensitive, use:

SELECT * FROM Employees
WHERE BINARY name REGEXP '^A';

CREATE TABLE Students (
  id INT,
  name VARCHAR(50)
);

INSERT INTO Students VALUES
(1, 'Amit'),
(2, 'Esha'),
(3, 'Ira'),
(4, 'Omkar'),
(5, 'Uday'),
(6, 'Kiran'),
(7, 'Rahul'),
(8, 'Anil'),
(9, 'Oliver'),
(10, 'Sneha');

SELECT * FROM Students;

-- Names starting with a vowel 
SELECT * FROM Students
WHERE name REGEXP '^[AEIOUaeiou]';

-- Names ending with a vowel
SELECT * FROM Students
WHERE name REGEXP '[AEIOUaeiou]'; 

-- Names with two consecutive vowels
SELECT * FROM Students
WHERE name NOT REGEXP '[AEIOUaeiou]{2}';

-- Names not starting with a vowel
SELECT * FROM Students
WHERE name NOT REGEXP
'^[AEIOUaeiou]';

-- Names where secound letter is a vowel
SELECT * FROM Students
WHERE name REGEXP '^.[AEIOUaeiou]';

-- Names having vowel + n pattern (like An, In, On, etc.)
SELECT * FROM Students
WHERE name REGEXP '[AEIOUaeiou]n';   
   