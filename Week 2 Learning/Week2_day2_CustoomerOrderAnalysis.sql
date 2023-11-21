-- Using Multiple Tables

-- Exercise 2 Investigate Outer Joins
SELECT *
FROM Customers
-- task 1: Create a query that counts customers
SELECT
	COUNT(*) AS CustomerCount
FROM dbo.Customers;

-- task 2: Write a query that groups orders based on the customer's name
SELECT
	c.CompanyName,
	COUNT(o.OrderID) AS NumOrders
FROM dbo.Customers c
LEFT JOIN dbo.Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.CompanyName
ORDER BY NumOrders DESC;

-- task 3: Write a query that uses left and right outer joins

SELECT
	c.CompanyName,
	COUNT(o.OrderID) AS NumOrders,
	MIN(o.OrderDate) AS MinDate
FROM dbo.Orders AS o
RIGHT OUTER JOIN dbo.Customers AS c 
ON o.CustomerID = c.CustomerID
GROUP BY c.CompanyName
ORDER BY NumOrders;

