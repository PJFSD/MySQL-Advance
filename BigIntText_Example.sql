CREATE DATABASE BigIntText_Example;

USE BigIntText_Example;

CREATE TABLE transactions (
transactions_id BIGINT,
uder_id INT,
amount DECIMAL(10,2),
transaction_time DATETIME
);

INSERT INTO transactions VALUES
(9000000001, 101, 1500.50, '2025-01-10 10:15:00'),
(9000000002, 102, 2999.99, '2025-01-10 10:16:30'),
(9000000003, 103, 450.75, '2025-01-10 10:18:45');

SELECT * FROM transactions;

CREATE TABLE product_reviews (
review_id INT,
product_id INT,
review_text TEXT,
review_date DATE
);

INSERT INTO product_reviews VALUES
(1, 501, 'The product quality is excellent. Battery lasts long and performance is smooth.', '2025-01-08'),
(2, 502, 'Average experience. The packaging was damaged and delivery was late.', '2025-01-09'),
(3, 503, 'Excellent value for money. Would definitely recommend to others.', '2025-01-10');

SELECT * FROM product_reviews;

