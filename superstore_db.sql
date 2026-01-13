CREATE DATABASE superstore_db;

USE superstore_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    region VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    discount DECIMAL(5,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Amit Sharma', 'North', 'Delhi'),
(2, 'Neha Verma', 'South', 'Chennai'),
(3, 'Ravi Kumar', 'West', 'Mumbai'),
(4, 'Pooja Singh', 'East', 'Kolkata'),
(5, 'Ankit Patel', 'South', 'Bangalore');

SELECT * FROM customers;

INSERT INTO categories VALUES
(1, 'Furniture'),
(2, 'Office Supplies'),
(3, 'Technology');

SELECT * FROM categories;

INSERT INTO products VALUES
(101, 'Office Chair', 1, 3500),
(102, 'Desk', 1, 5000),
(103, 'Pen Set', 2, 200),
(104, 'Notebook', 2, 120),
(105, 'Laptop', 3, 55000),
(106, 'Printer', 3, 15000),
(107, 'Mouse', 3, 800);

SELECT * FROM products;

INSERT INTO orders VALUES
(1001, 1, '2024-01-10', 5800),
(1002, 2, '2024-02-15', 56000),
(1003, 3, '2024-03-05', 15200),
(1004, 4, '2024-04-01', 130),
(1005, 5, '2024-05-12', 55200);

SELECT * FROM orders;

INSERT INTO order_items VALUES
(1, 1001, 101, 1, 0.10),
(2, 1001, 103, 2, 0.00),
(3, 1002, 105, 1, 0.05),
(4, 1003, 106, 1, 0.00),
(5, 1003, 107, 2, 0.00),
(6, 1004, 104, 1, 0.00),
(7, 1005, 105, 1, 0.10);

SELECT * FROM order_items;

-- Customers whose total order amount is greater than average order value.
SELECT customer_id, total_amount
FROM orders
WHERE total_amount > (SELECT
AVG(total_amount) FROM orders);

--  Type 2: Multi-row Subquery (IN)
--  Get product names that are part of orders above ₹20,000.
SELECT product_name
from products
WHERE product_id IN (
select product_id
 from order_items where order_id in (
select order_id from orders where total_amount > '20000')
);

 -- Multi-column Subquery 
-- Find product and category pairs that match the same combination as “Laptop”.
SELECT product_name 
from products
WHERE (category_id, price) IN  (
SELECT category_id, price 
FROM products WHERE product_name = 'Laptop');

-- Multi Column 2
-- Find all products that have the same (category, price) pair as any product sold in orders over ₹20,000. 
 SELECT product_id, product_name,
 category_id, price
 FROM products
 WHERE (category_id, price) IN(
 SELECT p.category_id, p.price
 FROM products p 
 join order_items oi ON p.product_id = oi.product_id
 join orders o ON o.order_id = oi.order_id
 where o.total_amount > 20000);
