--EX 1 
-- Practical Lab
--Task 1:

SELECT * FROM Products

--Task 2: StockList.sql

SELECT ProductID, ProductName, UnitPrice, UnitsInStock 
FROM Products

--Task 3: Write a query that selects individual columns from a table

SELECT 
ProductID, 
ProductName, 
UnitPrice, 
UnitsInStock, 
UnitsOnOrder,
UnitPrice * UnitsInStock AS CurrentStockValue,
(UnitsOnOrder + UnitsInStock) * UnitPrice AS FutureStockValue
FROM Products

-- Exercise 2: Concatenate Strings in a select list

SELECT
FirstName + ' ' + LastName AS FullName,
Extension
FROM Employees