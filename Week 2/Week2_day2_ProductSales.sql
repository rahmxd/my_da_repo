-- -- Grouping and Aggregating Data
-- Exercise 3: Aggregating calculated values and filtering aggregates

-- task 1: Write a query that sums quantities of products sold
SELECT
	ProductID,
	SUM(Quantity) AS TotalSold
FROM [Order Details]
GROUP BY ProductID

-- task 2: Write a query that sums a calculation
SELECT
	ProductID,
	SUM(Quantity * UnitPrice) AS TotalValue
FROM [Order Details]
GROUP BY ProductID
ORDER BY TotalValue DESC;

-- task 3: Write a query that filters aggregates values

SELECT
	ProductID,
	SUM(Quantity * UnitPrice) AS TotalValue
FROM [Order Details]
GROUP BY ProductID
HAVING SUM(Quantity * UnitPrice) <= 5000
ORDER BY TotalValue DESC;
