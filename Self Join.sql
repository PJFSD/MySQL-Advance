CREATE DATABASE Self_Join;

USE Self_Join;

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
manager_id INT
);

INSERT INTO employees (emp_id, emp_name, manager_id) VALUES
(1, 'Amit', NULL),             -- CEO
(2, 'Rohit', 1),               -- Reports to Amit
(3, 'Neha', 1),                -- Reports to Amit
(4, 'Priya', 2),               -- Reports to Rohit
(5, 'Karan', 2),               -- Reports to Rohit
(6, 'Sneha', 3);               -- Reports to Neha

-- SELF JOIN (Employee → Manager)
SELECT 
     e.emp_name AS Employee,
     m.emp_name AS Manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- Employees with their Manager ID & Name
SELECT 
      e.emp_id,
      e.emp_name,
      e.manager_id,
      m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

-- Find Managers Only
SELECT DISTINCT m.emp_name AS Manager
FROM employees e
JOIN employees m
ON e.manager_id = m.emp_id;

-- Employees Reporting to Amit
SELECT e.emp_name
FROM employees e
JOIN employees m 
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Amit';

-- Multi-table JOIN
CREATE TABLE customers (
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
city VARCHAR(50)
);

CREATE TABLE products (
product_id INT PRIMARY KEY,
product_name VARCHAR(50),
price DECIMAL(10,2)
);

CREATE TABLE orders (
order_id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
order_item_id INT PRIMARY KEY,
order_id INT,
product_id INT,
quantity INT,
FOREIGN KEY (order_id) REFERENCES orders(order_id),
FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Amit', 'Mumbai'),
(2, 'Neha', 'Pune'),
(3, 'Rohit', 'Delhi');

INSERT INTO products VALUES
(101, 'Laptop', 60000),
(102, 'Mobile', 30000),
(103, 'Headphones', 2000);

INSERT INTO orders VALUES
(1001, 1, '2025-01-10'),
(1002, 2, '2025-01-12'),
(1003, 1, '2025-01-15');

INSERT INTO order_items VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 103, 3);

-- Customer → Order → Product Details
SELECT 
      c.customer_name,
      c.city,
      o.order_id,
      o.order_date,
      p.product_name,
      oi.quantity,
      p.price,
      (oi.quantity * p.price) AS total_amount
FROM customers c
JOIN orders o
     ON c.customer_id = o.customer_id
JOIN order_items oi
     ON o.order_id = oi.order_id
JOIN products p
     ON oi.product_id = p.product_id;
     
     
-- Total Amount Spent by Each Customer
SELECT 
     c.customer_name,
     SUM(oi.quantity * p.price) AS total_spent
FROM customers c 
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_name;

-- Customers Who Never Placed Orders
SELECT c.customer_name
FROM customers c 
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Most Sold Product
SELECT p.product_name, SUM(oi.quantity) AS total_qty 
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_qty DESC
LIMIT 1;

-- Orders With More Than One Product
SELECT o.order_id, COUNT(oi.product_id) AS product_count
FROM orders o 
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id
HAVING COUNT(oi.product_id) > 1;