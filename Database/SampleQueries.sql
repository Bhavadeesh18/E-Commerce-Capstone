-- E-Commerce Platform Sample Queries
-- Server: BHAVADEESHREDDY\SQLEXPRESS
-- Database: EcommerceDB

USE EcommerceDB;
GO

-- 1. Get all products with category information
SELECT p.ProductID, p.ProductName, p.Price, p.StockQuantity, c.CategoryName
FROM Products p
LEFT JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE p.IsActive = 1;

-- 2. Get user order history
SELECT o.OrderID, o.OrderDate, o.TotalAmount, o.Status, 
       u.FirstName + ' ' + u.LastName AS CustomerName
FROM Orders o
JOIN Users u ON o.UserID = u.UserID
ORDER BY o.OrderDate DESC;

-- 3. Get order details with products
SELECT o.OrderID, oi.ProductID, p.ProductName, oi.Quantity, oi.UnitPrice, oi.TotalPrice
FROM Orders o
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN Products p ON oi.ProductID = p.ProductID;

-- 4. Get product reviews with ratings
SELECT p.ProductName, r.Rating, r.Comment, r.ReviewDate,
       u.FirstName + ' ' + u.LastName AS ReviewerName
FROM Reviews r
JOIN Products p ON r.ProductID = p.ProductID
JOIN Users u ON r.UserID = u.UserID
ORDER BY r.ReviewDate DESC;

-- 5. Get cart items for a user
SELECT c.CartID, ci.ProductID, p.ProductName, ci.Quantity, ci.Price,
       (ci.Quantity * ci.Price) AS TotalPrice
FROM Cart c
JOIN CartItems ci ON c.CartID = ci.CartID
JOIN Products p ON ci.ProductID = p.ProductID
WHERE c.UserID = 1; -- Replace with actual UserID

-- 6. Sales report by category
SELECT c.CategoryName, COUNT(oi.ProductID) AS ProductsSold,
       SUM(oi.TotalPrice) AS TotalRevenue
FROM Categories c
JOIN Products p ON c.CategoryID = p.CategoryID
JOIN OrderItems oi ON p.ProductID = oi.ProductID
JOIN Orders o ON oi.OrderID = o.OrderID
WHERE o.Status = 'Delivered'
GROUP BY c.CategoryName;

-- 7. Top selling products
SELECT TOP 10 p.ProductName, SUM(oi.Quantity) AS TotalSold,
       SUM(oi.TotalPrice) AS Revenue
FROM Products p
JOIN OrderItems oi ON p.ProductID = oi.ProductID
JOIN Orders o ON oi.OrderID = o.OrderID
WHERE o.Status = 'Delivered'
GROUP BY p.ProductID, p.ProductName
ORDER BY TotalSold DESC;