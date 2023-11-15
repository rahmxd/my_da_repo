SELECT
	c.CategoryName,
	COUNT(DISTINCT p.ProductID) AS NumOfProducts
FROM dbo.Categories c
JOIN dbo.Products P
ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY NumOfProducts

-- doesn't matter order of join as SELECT done after FROM finished

SELECT
	c.CategoryName,
	COUNT(DISTINCT p.ProductID) AS NumOfProducts
FROM dbo.Products p
JOIN dbo.Categories c
ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY NumOfProducts

-- WHich employee made the most money

SELECT 
	e.EmployeeID,
	CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
	SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS TotalRevenue
FROM dbo.Orders o
JOIN dbo.Employees e
ON e.EmployeeID = o.OrderID
JOIN dbo.[Order Details] od
ON o.OrderID = od.OrderID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
ORDER BY TotalRevenue DESC


-- How many customers placed exactly 2 orders

SELECT 
	c.CustomerID, 
	COUNT(o.OrderID) AS NumOfOrders
FROM dbo.Customers c
JOIN dbo.Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID
ORDER BY NumOfOrders DESC
