-- Grouping and Aggregating Data
-- Exercise 2: Grouping Aggregates

-- task 1: Create a query that counts orders
SELECT COUNT(OrderID) AS NumberOfOrders
From Orders

-- task 2: Write a query that groups orders based on the customer's ID
SELECT 
	COUNT(OrderID) AS NumberOfOrders,
	CustomerID
From Orders
GROUP BY CustomerID


-- task 3: Write a query that sorts order counts in descending order
SELECT 
	COUNT(OrderID) AS NumberOfOrders,
	CustomerID
From Orders
GROUP BY CustomerID
ORDER BY NumberOfOrders DESC
