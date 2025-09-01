-- E-Commerce Platform Views
-- Server: BHAVADEESHREDDY\SQLEXPRESS
-- Database: EcommerceDB

USE EcommerceDB;
GO

-- 1. Product Catalog View
CREATE OR ALTER VIEW vw_ProductCatalog AS
SELECT 
    p.ProductID,
    p.ProductName,
    p.Description,
    p.Price,
    p.StockQuantity,
    p.ImageURL,
    c.CategoryName,
    AVG(CAST(r.Rating AS FLOAT)) AS AverageRating,
    COUNT(r.ReviewID) AS ReviewCount
FROM Products p
LEFT JOIN Categories c ON p.CategoryID = c.CategoryID
LEFT JOIN Reviews r ON p.ProductID = r.ProductID
WHERE p.IsActive = 1
GROUP BY p.ProductID, p.ProductName, p.Description, p.Price, 
         p.StockQuantity, p.ImageURL, c.CategoryName;
GO

-- 2. Order Summary View
CREATE OR ALTER VIEW vw_OrderSummary AS
SELECT 
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    o.Status,
    u.FirstName + ' ' + u.LastName AS CustomerName,
    u.Email,
    COUNT(oi.OrderItemID) AS ItemCount
FROM Orders o
JOIN Users u ON o.UserID = u.UserID
LEFT JOIN OrderItems oi ON o.OrderID = oi.OrderID
GROUP BY o.OrderID, o.OrderDate, o.TotalAmount, o.Status, 
         u.FirstName, u.LastName, u.Email;
GO

-- 3. Sales Analytics View
CREATE OR ALTER VIEW vw_SalesAnalytics AS
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryName,
    SUM(oi.Quantity) AS TotalSold,
    SUM(oi.TotalPrice) AS TotalRevenue,
    AVG(oi.UnitPrice) AS AveragePrice
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
JOIN OrderItems oi ON p.ProductID = oi.ProductID
JOIN Orders o ON oi.OrderID = o.OrderID
WHERE o.Status = 'Delivered'
GROUP BY p.ProductID, p.ProductName, c.CategoryName;
GO