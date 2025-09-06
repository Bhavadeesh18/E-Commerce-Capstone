-- Seed Data for E-Commerce Platform
USE EcommerceDB;
GO

-- Insert sample users (if not exists)
IF NOT EXISTS (SELECT 1 FROM Users WHERE Email = 'admin@ecommerce.com')
BEGIN
    INSERT INTO Users (Username, Email, PasswordHash, Role, CreatedAt) VALUES
    ('admin', 'admin@ecommerce.com', '$2a$11$8K1p/a0dURXAMcGe71sS1eKczMd/Qo9X5kIvGH5Gvx5XvZQf5Qf5Q', 'Admin', GETDATE()),
    ('testuser', 'test@example.com', '$2a$11$8K1p/a0dURXAMcGe71sS1eKczMd/Qo9X5kIvGH5Gvx5XvZQf5Qf5Q', 'User', GETDATE());
END

-- Insert sample products (if not exists)
IF NOT EXISTS (SELECT 1 FROM Products)
BEGIN
    INSERT INTO Products (Name, Description, Price, StockQuantity, Category, ImageUrl, CreatedAt) VALUES
    ('MacBook Pro 16"', 'Apple MacBook Pro with M2 chip, 16GB RAM, 512GB SSD', 2499.99, 25, 'Electronics', 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500', GETDATE()),
    ('iPhone 15 Pro', 'Latest iPhone with A17 Pro chip, 128GB storage', 999.99, 50, 'Electronics', 'https://images.unsplash.com/photo-1592750475338-74b7b21085ab?w=500', GETDATE()),
    ('Nike Air Max 270', 'Comfortable running shoes with Air Max technology', 129.99, 100, 'Footwear', 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500', GETDATE()),
    ('Levi''s 501 Jeans', 'Classic straight-fit jeans, 100% cotton', 79.99, 75, 'Clothing', 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=500', GETDATE()),
    ('Sony WH-1000XM5', 'Wireless noise-canceling headphones', 399.99, 30, 'Electronics', 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500', GETDATE()),
    ('Samsung 4K Smart TV', '55-inch QLED 4K Smart TV with HDR', 899.99, 15, 'Electronics', 'https://images.unsplash.com/photo-1593359677879-a4bb92f829d1?w=500', GETDATE()),
    ('Adidas Ultraboost 22', 'Premium running shoes with Boost technology', 189.99, 60, 'Footwear', 'https://images.unsplash.com/photo-1549298916-b41d501d3772?w=500', GETDATE()),
    ('The Art of Programming', 'Comprehensive guide to software development', 49.99, 200, 'Books', 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=500', GETDATE()),
    ('Wireless Gaming Mouse', 'High-precision gaming mouse with RGB lighting', 79.99, 40, 'Electronics', 'https://images.unsplash.com/photo-1527864550417-7fd91fc51a46?w=500', GETDATE()),
    ('Cotton T-Shirt', 'Premium quality cotton t-shirt, various colors', 24.99, 150, 'Clothing', 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500', GETDATE());
END

PRINT 'Sample data inserted successfully!';