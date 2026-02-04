CREATE DATABASE Window_Function_Challenge;

USE Window_Function_Challenge;

CREATE TABLE employee_salary (
emp_id INT AUTO_INCREMENT PRIMARY KEY,
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
salary_month DATE
);

INSERT INTO employee_salary (emp_name, department, salary, salary_month) VALUES
-- IT Department
('Amit', 'IT', 50000, '2024-01-01'),
('Amit', 'IT', 55000, '2024-02-01'),
('Amit', 'IT', 60000, '2024-03-01'),

('Ravi', 'IT', 60000, '2024-01-01'),
('Ravi', 'IT', 60000, '2024-02-01'),
('Ravi', 'IT', 65000, '2024-03-01'),

-- HR Department
('Neha', 'HR', 40000, '2024-01-01'),
('Neha', 'HR', 42000, '2024-02-01'),
('Pooja', 'HR', 42000, '2024-01-01'),
('Neha', 'HR', 45000, '2024-02-01'),

-- Finance Department
('Suresh', 'Finance', 70000,'2024-01-01'),
('Suresh', 'Finance', 75000, '2024-01-01'),
('Karan', 'Finance', 75000, '2024-01-01');

SELECT emp_name, department, salary,
RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_pos,
DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dense_rank_pos
FROM employee_salary;

-- Previous Month Salary 
SELECT emp_name, salary_month, salary,
LAG(salary) OVER (
    PARTITION BY emp_name
    ORDER BY salary_month
) AS previous_salary
FROM employee_salary;


