-- E-Commerce Platform Stored Procedures
-- Server: BHAVADEESHREDDY\SQLEXPRESS
-- Database: EcommerceDB

USE EcommerceDB;
GO

-- 1. Add Product to Cart
CREATE OR ALTER PROCEDURE sp_AddToCart
    @UserID INT,
    @ProductID INT,
    @Quantity INT
AS
BEGIN
    DECLARE @CartID INT;
    DECLARE @ExistingQuantity INT = 0;
    
    -- Get or create cart for user
    SELECT @CartID = CartID FROM Cart WHERE UserID = @UserID;
    
    IF @CartID IS NULL
    BEGIN
        INSERT INTO Cart (UserID) VALUES (@UserID);
        SET @CartID = SCOPE_IDENTITY();
    END
    
    -- Check if product already in cart
    SELECT @ExistingQuantity = Quantity FROM CartItems 
    WHERE CartID = @CartID AND ProductID = @ProductID;
    
    IF @ExistingQuantity > 0
    BEGIN
        -- Update existing item
        UPDATE CartItems 
        SET Quantity = Quantity + @Quantity
        WHERE CartID = @CartID AND ProductID = @ProductID;
    END
    ELSE
    BEGIN
        -- Add new item
        DECLARE @Price DECIMAL(10,2);
        SELECT @Price = Price FROM Products WHERE ProductID = @ProductID;
        
        INSERT INTO CartItems (CartID, ProductID, Quantity, Price)
        VALUES (@CartID, @ProductID, @Quantity, @Price);
    END
END;
GO

-- 2. Process Order
CREATE OR ALTER PROCEDURE sp_ProcessOrder
    @UserID INT,
    @ShippingAddress NVARCHAR(500),
    @PaymentMethod NVARCHAR(50)
AS
BEGIN
    DECLARE @OrderID INT;
    DECLARE @TotalAmount DECIMAL(10,2) = 0;
    
    -- Calculate total amount
    SELECT @TotalAmount = SUM(ci.Quantity * ci.Price)
    FROM Cart c
    JOIN CartItems ci ON c.CartID = ci.CartID
    WHERE c.UserID = @UserID;
    
    -- Create order
    INSERT INTO Orders (UserID, TotalAmount, ShippingAddress, PaymentMethod)
    VALUES (@UserID, @TotalAmount, @ShippingAddress, @PaymentMethod);
    
    SET @OrderID = SCOPE_IDENTITY();
    
    -- Move cart items to order items
    INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice, TotalPrice)
    SELECT @OrderID, ci.ProductID, ci.Quantity, ci.Price, (ci.Quantity * ci.Price)
    FROM Cart c
    JOIN CartItems ci ON c.CartID = ci.CartID
    WHERE c.UserID = @UserID;
    
    -- Clear cart
    DELETE ci FROM CartItems ci
    JOIN Cart c ON ci.CartID = c.CartID
    WHERE c.UserID = @UserID;
    
    SELECT @OrderID AS OrderID;
END;
GO

-- 3. Update Order Status
CREATE OR ALTER PROCEDURE sp_UpdateOrderStatus
    @OrderID INT,
    @Status NVARCHAR(20)
AS
BEGIN
    UPDATE Orders 
    SET Status = @Status
    WHERE OrderID = @OrderID;
END;
GO