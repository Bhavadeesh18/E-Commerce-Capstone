# Database Documentation

## Database Setup
- **Database Name**: ECommerceDB
- **Server**: SQL Server (SSMS)
- **Status**: Already created and populated with sample data

## Tables Structure
1. **Users** - User authentication and profile data
2. **Categories** - Product categories
3. **Products** - Product catalog
4. **Cart** - Shopping cart
5. **CartItems** - Cart item details
6. **Orders** - Order management
7. **OrderItems** - Order item details
8. **Reviews** - Product reviews

## Connection
The backend API connects to this database using Entity Framework Core with SQL Server provider.

**Server**: BHAVADEESHREDDY\SQLEXPRESS
**Database**: EcommerceDB
**Connection Configuration**: Database connection string is configured in the backend project's appsettings.json file.