CREATE DATABASE Practice_Worksheet;

USE Practice_Worksheet;

CREATE TABLE Employees (
  emp_id INT,
  emp_name VARCHAR(50),
  department VARCHAR(30)
);

INSERT INTO Employees VALUES
(1, 'Anita', 'HR'),
(2, 'Suresh', 'Finance'),
(3, 'Omkar', 'Sales'),
(4, 'Isha', 'IT'),
(5, 'Deepak', 'Admin'),
(6, 'Umesh', 'Support');

SELECT * FROM Employees;

-- 1) Find all employee names that start with a vowel.
SELECT *
FROM Employees
WHERE emp_name REGEXP '^[AEIOUaeiou]';

-- 2) Find all employee names that end with a vowel.
SELECT *
 FROM Employees
 WHERE emp_name REGEXP '[AEIOUaeiou]$';
 
 -- 3)  Find all employee names that do not start with a vowel.
 SELECT * FROM Employees WHERE emp_name NOT REGEXP '[AEIOUaeiou]';
 
 
 -- 2nd Table 
 CREATE TABLE Cities (
  city_id INT,
  city_name VARCHAR(50)
);

INSERT INTO Cities VALUES
(1, 'Indore'),
(2, 'Ahmedabad'),
(3, 'Pune'),
(4, 'Udaipur'),
(5, 'Bhopal'),
(6, 'Chennai');

SELECT * FROM Cities;

-- 4) List all cities that contain at least one vowel.
 SELECT * FROM Cities WHERE city_name REGEXP '^A.e';
 
 -- 5)  List all cities that start and end with vowels.
SELECT * FROM Cities WHERE city_name  REGEXP '^[AEIOUaeiou].*[AEIOUaeiou]$';

-- 6)  Find all cities that have double vowels (like "oo", "aa", "ee").
SELECT * FROM Cities WHERE city_name REGEXP '(aa|ee|ii|oo|uu)';


--  3rd Table
CREATE TABLE Students (
  roll_no INT,
  name VARCHAR(50)
);

INSERT INTO Students VALUES
(1, 'Aarav'),
(2, 'Esha'),
(3, 'Kunal'),
(4, 'Oviya'),
(5, 'Riya'),
(6, 'Utkarsh');

SELECT * FROM Students;

-- 7)  Find names where the second letter is a vowel.
SELECT * FROM Students WHERE name REGEXP '^.[AEIOUaeiou]';

-- 8)  Find names containing a vowel followed by “y”.
SELECT * FROM Students WHERE name REGEXP '[AEIOUaeiou]y';

-- 9) Find names that end with a vowel but do not start with one. 
SELECT * FROM Students WHERE name REGEXP '^[^AEIOUaeiou].*[AEIOUaeiou]$';


-- 4th Table 
CREATE TABLE Products (
  pid INT,
  pname VARCHAR(50)
);

INSERT INTO Products VALUES
(1, 'Oil'),
(2, 'Apple'),
(3, 'Umbrella'),
(4, 'Ink'),
(5, 'Soap'),
(6, 'Egg'); 

SELECT * FROM Products;

-- 10) Find product names starting with a vowel.
SELECT * FROM Products WHERE pname REGEXP '^[AEIOUaeiou]';

-- 11) Find products that end with “a”.
 SELECT * FROM Products WHERE pname REGEXP '[AEIOUaeiou]n';  

-- 12)  Find product names that contain more than one vowel.


-- 5th Table
CREATE TABLE Countries (
  cid INT,
  country_name VARCHAR(50)
);

INSERT INTO Countries VALUES
(1, 'India'),
(2, 'Australia'),
(3, 'Egypt'),
(4, 'Oman'),
(5, 'Ukraine'),
(6, 'Nepal');

SELECT * FROM Countries;

-- 13) List countries starting with vowels.
SELECT * FROM Countries WHERE country_name REGEXP '^[AEIOUaeiou]';

-- 14) List countries ending with vowels.
SELECT * FROM Countries WHERE country_name REGEXP '[AEIOUaeiou]$';  

-- 15) Find countries where the third letter is a vowel.



-- 6th Table
 CREATE TABLE Movies (
  movie_id INT,
  title VARCHAR(50)
);

INSERT INTO Movies VALUES
(1, 'Avatar'),
(2, 'Eternals'),
(3, 'Ironman'),
(4, 'Ocean'),
(5, 'Up'),
(6, 'Dune');

SELECT * FROM Movies;

-- 16) Find movies starting with a vowel.
SELECT * FROM Movies WHERE title REGEXP '^[AEIOUaeiou]';

-- 17)  Find movies that contain consecutive vowels.

-- 18) Find movies ending with a vowel.
SELECT * FROM Movies WHERE title REGEXP  '[AEIOUaeiou]$';
 

 

