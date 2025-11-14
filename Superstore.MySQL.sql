CREATE DATABASE Superstore;

USE Superstore;

CREATE TABLE Product(
product_id int,
customer_name VARCHAR(100),
product_name VARCHAR(100),
price DECIMAL(2.4),
product_quantity VARCHAR(100)
);

INSERT INTO Product(Product_id, customer_name, product_name, price, product_quantity) VALUES(14, 'suraj more', 'sunflower', '23.00', 'good');

INSERT INTO Product(Product_id, customer_name, product_name, price, product_quantity) VALUES(32, 'javahar nehru', 'nivea cream', '19.00', 'nice');

INSERT INTO Product(Product_id, customer_name, product_name, price, product_quantity) VALUES(43, 'pandit anuja', 'golden flow', '12.00', 'best');

INSERT INTO Product(Product_id, customer_name, product_name, price, product_quantity) VALUES(44, 'kamble swapnil', 'shampo', '17.00', 'good');

INSERT INTO Product(Product_id, customer_name, product_name, price, product_quantity) VALUES(65, 'sadanand gholse', 'nirma', '10.00', 'bad');

select * from Product;

select * from Product where product_quantity = 'good';

select * from Product where 

 