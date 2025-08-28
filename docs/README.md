# 🛒 E-Commerce Platform

A full-stack e-commerce platform built with **ASP.NET Core** backend and **React** frontend, featuring user authentication, product management, shopping cart, order processing, and payment integration.

## 🚀 Features

### 👤 User Management
- ✅ User registration and login
- ✅ JWT-based authentication
- ✅ Profile management
- ✅ Role-based access control (Admin/Customer)

### 📦 Product Management
- ✅ Product catalog with categories
- ✅ Product search and filtering
- ✅ Product details with images
- ✅ Admin product CRUD operations
- ✅ Stock management

### 🛒 Shopping Experience
- ✅ Add/remove items from cart
- ✅ Cart persistence across sessions
- ✅ Quantity management
- ✅ Real-time cart updates

### 📋 Order Management
- ✅ Order creation and tracking
- ✅ Order history for customers
- ✅ Order status updates
- ✅ Order cancellation
- ✅ Admin order management

### 💳 Payment Processing
- ✅ Multiple payment methods
- ✅ Secure payment processing
- ✅ Payment confirmation
- ✅ Transaction history

### 🎨 User Interface
- ✅ Responsive design
- ✅ Modern React components
- ✅ Redux state management
- ✅ Bootstrap styling
- ✅ Mobile-friendly interface

---

## 🏗️ Architecture

### Backend (ASP.NET Core 8)
```
├── AuthenticationService/     # User authentication & JWT
├── ProductService/           # Product management
├── CartService/             # Shopping cart operations
├── OrderService/            # Order processing
├── PaymentService/          # Payment handling
├── Common/                  # Shared DTOs & interfaces
├── Database/               # EF Core models & context
└── API/Controllers/        # REST API endpoints
```

### Frontend (React 18)
```
├── components/             # Reusable UI components
├── pages/                 # Page components
├── redux/                 # State management
├── services/              # API service calls
└── utils/                 # Utility functions
```

---

## 🛠️ Technology Stack

### Backend
- **Framework:** ASP.NET Core 8
- **Database:** SQL Server with Entity Framework Core
- **Authentication:** JWT Bearer tokens
- **Password Hashing:** BCrypt
- **API Documentation:** Swagger/OpenAPI
- **Architecture:** Clean Architecture with service layers

### Frontend
- **Framework:** React 18
- **State Management:** Redux Toolkit
- **Routing:** React Router v6
- **HTTP Client:** Axios
- **UI Framework:** Bootstrap 5
- **Build Tool:** Create React App

### Database
- **Primary:** SQL Server
- **ORM:** Entity Framework Core
- **Migrations:** Code-First approach

---

## 🚀 Getting Started

### Prerequisites
- .NET 8 SDK
- Node.js 18+
- SQL Server (LocalDB or full instance)
- Visual Studio 2022 or VS Code

### Backend Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd E-CommercePlatform/Backend
   ```

2. **Update connection string**
   ```json
   // appsettings.json
   {
     "ConnectionStrings": {
       "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=ECommerceDB;Trusted_Connection=true;"
     }
   }
   ```

3. **Run database migrations**
   ```bash
   dotnet ef database update
   ```

4. **Start the API**
   ```bash
   dotnet run --project E-CommercePlatform
   ```
   
   API will be available at: `https://localhost:7000`

### Frontend Setup

1. **Navigate to frontend directory**
   ```bash
   cd E-CommercePlatform/Frontend/ecommerce-web-app
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Update API base URL**
   ```javascript
   // src/services/api.js
   const API_BASE_URL = 'https://localhost:7000/api';
   ```

4. **Start the React app**
   ```bash
   npm start
   ```
   
   App will be available at: `http://localhost:3000`

---

## 📊 Database Schema

### Users Table
- Id (Primary Key)
- Username
- Email
- PasswordHash
- CreatedAt

### Products Table
- Id (Primary Key)
- Name
- Description
- Price
- Category
- Stock
- ImageUrl
- CreatedAt

### Orders Table
- Id (Primary Key)
- UserId (Foreign Key)
- TotalAmount
- Status
- ShippingAddress
- CreatedAt

### OrderItems Table
- Id (Primary Key)
- OrderId (Foreign Key)
- ProductId (Foreign Key)
- Quantity
- Price

### Cart Table
- Id (Primary Key)
- UserId (Foreign Key)
- ProductId (Foreign Key)
- Quantity
- CreatedAt

---

## 🔐 Authentication Flow

1. **Registration:** User creates account with email/password
2. **Login:** User authenticates and receives JWT token
3. **Authorization:** Token included in API requests
4. **Token Validation:** Server validates token for protected routes
5. **Role-based Access:** Admin vs Customer permissions

---

## 🛒 Shopping Flow

1. **Browse Products:** View product catalog
2. **Product Details:** Click product for detailed view
3. **Add to Cart:** Add desired items with quantities
4. **Cart Management:** Update quantities or remove items
5. **Checkout:** Enter shipping information
6. **Payment:** Process payment with card details
7. **Order Confirmation:** Receive order confirmation
8. **Order Tracking:** Monitor order status

---

## 🎯 API Endpoints

### Authentication
- `POST /api/Auth/register` - Register new user
- `POST /api/Auth/login` - User login

### Products
- `GET /api/Product` - Get all products
- `GET /api/Product/{id}` - Get product by ID
- `POST /api/Product` - Create product (Admin)
- `PUT /api/Product/{id}` - Update product (Admin)
- `DELETE /api/Product/{id}` - Delete product (Admin)

### Cart
- `GET /api/Cart` - Get user cart
- `POST /api/Cart` - Add to cart
- `PUT /api/Cart/{id}` - Update cart item
- `DELETE /api/Cart/{id}` - Remove from cart

### Orders
- `GET /api/Order` - Get user orders
- `POST /api/Order` - Create order
- `PUT /api/Order/{id}/cancel` - Cancel order
- `GET /api/Order/admin/all` - Get all orders (Admin)

### Payment
- `POST /api/Payment/process` - Process payment

---

## 🧪 Testing

### Backend Testing
```bash
# Run unit tests
dotnet test

# Run with coverage
dotnet test --collect:"XPlat Code Coverage"
```

### Frontend Testing
```bash
# Run Jest tests
npm test

# Run with coverage
npm test -- --coverage
```

---

## 🚀 Deployment

### Docker Deployment
```bash
# Build and run with Docker Compose
docker-compose up --build
```

### Azure Deployment
- Configure Azure App Service
- Set up SQL Database
- Deploy via Azure DevOps

### AWS Deployment
- Use Elastic Beanstalk
- Configure RDS for database
- Set up CloudFront for frontend

---

## 📈 Performance Considerations

- **Caching:** Redis for session and product caching
- **Database:** Indexed queries and optimized relationships
- **API:** Pagination for large datasets
- **Frontend:** Lazy loading and code splitting
- **Images:** CDN for product images

---

## 🔒 Security Features

- **Authentication:** JWT with secure secret keys
- **Password Security:** BCrypt hashing
- **CORS:** Configured for frontend domain
- **Input Validation:** Data annotations and model validation
- **SQL Injection:** Entity Framework parameterized queries
- **XSS Protection:** Input sanitization

---

## 📞 Support & Contributing

### Issues
Report bugs and feature requests via GitHub Issues.

### Contributing
1. Fork the repository
2. Create feature branch
3. Make changes with tests
4. Submit pull request

### Contact
- **Email:** support@ecommerce-platform.com
- **Documentation:** See `/docs` folder
- **API Docs:** Available at `/swagger` when running

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 🙏 Acknowledgments

- ASP.NET Core team for the excellent framework
- React team for the powerful frontend library
- Bootstrap team for the responsive UI components
- Entity Framework team for the robust ORM

---

**Built with ❤️ for modern e-commerce needs**