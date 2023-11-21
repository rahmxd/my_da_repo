-- Using Multiple Tables

-- Exercise 1 Join Fundamentals

SELECT *
FROM Customers

SELECT *
FROM Orders

-- Task 1: Write a query that selects rows from the customers and orders tables
--first verified that 91 rows are produced
SELECT
	c.CustomerID,
	c.CompanyName,
	c.ContactName,
	c.City
FROM dbo.Customers c;

--modify
SELECT
	c.CustomerID,
	c.CompanyName,
	c.ContactName,
	c.City,
	o.OrderID,
	o.OrderDate
FROM dbo.Customers c
JOIN dbo.Orders o
ON c.CustomerID = o.CustomerID;

-- Task 2: Write a query that filters and sorts the results
-- prints 56 rows
SELECT
	c.CustomerID,
	c.CompanyName,
	c.ContactName,
	c.City,
	o.OrderID,
	o.OrderDate
FROM dbo.Customers c
JOIN dbo.Orders o
ON c.CustomerID = o.CustomerID
WHERE c.Country = 'UK'
ORDER BY c.CompanyName, o.OrderDate;

-- Task 3: Write a query that includes rows from more than two tables
-- confirmed the first order is for 25 lots of Guarana Fantastica and the last one is for 20 Scottish Longbreads
SELECT
	c.CustomerID,
	c.CompanyName,
	c.ContactName,
	o.OrderID,
	o.OrderDate,
	od.ProductID,
	od.Quantity,
	p.ProductName
FROM dbo.Customers c
JOIN dbo.Orders o
ON c.CustomerID = o.CustomerID
JOIN dbo.[Order Details] od
ON o.OrderID = od.OrderID
JOIN dbo.Products p
ON od.ProductID = p.ProductID
WHERE c.Country = 'UK'
ORDER BY c.CompanyName, o.OrderDate;