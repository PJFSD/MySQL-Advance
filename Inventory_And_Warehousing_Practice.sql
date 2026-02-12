CREATE DATABASE Inventory_And_Warehousing_Practice;

USE Inventory_And_Warehousing_Practice;

CREATE TABLE Warehouses (
WarehouseID INT PRIMARY KEY,
Location VARCHAR(50),
Capicity INT
);

CREATE TABLE Inventory (
ItemID INT PRIMARY KEY,
ItemName VARCHAR(100),
CategoryID INT,
Price DECIMAL(10,2),
Quantity INT,
WarehouseID INT,
FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)
);

INSERT INTO Warehouses VALUES (1, "Chicago", 5000), (2, "Miami", 3000), (3, "Austin", 4000);

INSERT INTO Inventory VALUES
(101, "Industrial Fan", 1, 150.00, 45, 1),
(102, "Solar Panel", 2, 800.00, 12, 1),
(103, "LED Blub", 1, 5.50, 500, 2),
(104, "Power Drill", 3, 120.00, 0, 3),
(104, "Safety Vest", 4, 25.00, 150, 2);

INSERT INTO Inventory VALUES
(101, "Industrial Fan", 1, 150.00, 45, 1),
(102, "Solar Panel", 2, 800.00, 12, 1),
(103, "LED Bulb", 1, 5.50, 500, 2),
(104, "Power Drill", 3, 120.00, 0, 3),
(105, "Safety Vest", 4, 25.00, 150, 2);


-- Conditional Pricing (CASE): Write a query to display ItemName and a DiscountedPrice. 
-- If the CategoryID is 1, apply a 10% discount; if it is 2, apply a 20% discount; for all others, keep the price as is. 
-- 1. CASE Statement
SELECT ItemName,
       CASE 
           WHEN CategoryID = 1 THEN Price * 0.90
           WHEN CategoryID = 2 THEN Price * 0.80
           ELSE Price
           END AS DiscountedPrice
FROM Inventory;

-- Correlated Subquery: Find all items in the Inventory table that have a Price higher than the average price of items within their own warehouse.
-- Correlated Subquery
SELECT ItemName, Price, WarehouseID
FROM Inventory i1
WHERE Price > (SELECT AVG(Price) FROM Inventory i2 WHERE i1. WarehouseID = i2.WarehouseID);  

-- Exists Logic: Retrieve all warehouse locations that currently store at least one item with a Price greater than $500. Use the EXISTS keyword.
-- 3. EXISTS
SELECT Location FROM Warehouses w
WHERE EXISTS (SELECT 1 FROM Inventory i WHERE i.WarehouseID = w.WarehouseID AND i.Price > 500);

-- Stored Procedure with Logic: Create a procedure CheckRestock that takes a p_WarehouseID.
-- It should return all ItemNames from that warehouse where Quantity is less than 20.   
-- 4. Stored Procedure
DELIMITER //
CREATE PROCEDURE CheckRestock(IN p_WarehouseID INT)
BEGIN
     SELECT ItemName, Quantity FROM Inventory
     WHERE WarehouseID = p_WarehouseID AND Quantity < 20;
END //
DELIMITER ;

