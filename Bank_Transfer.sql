CREATE DATABASE Bank_Transfer;

USE Bank_Transfer;

CREATE TABLE bank_accounts (
account_id INT,
customer_name VARCHAR(50),
balance INT
);

INSERT INTO bank_accounts VALUES
(1, "Ravi", 5000),
(2, "Anita", 3000);

SELECT * FROM bank_accounts;

-- Atomicity (All or Nothing)
--  Transaction 

START TRANSACTION;

UPDATE bank_accounts
SET balance = balance - 1000
WHERE account_id = 1;

UPDATE bank_accounts
SET balance = balance + 1000
WHERE account_id = 2;

COMMIT; 

-- Consistency (Rules Always True)
-- Rule
-- Balance cannot be negative 

UPDATE bank_accounts
SET balance = -500
WHERE account_id = 1;


-- Isolation (No Dirty Reads)
-- Scenario
-- Transaction A is transferring money
-- Transaction B checks balance before commit

START TRANSACTION;
UPDATE bank_accounts
SET balance = balance - 2000
WHERE account_id = 1;

-- Durability (Once Committed, Always Saved)