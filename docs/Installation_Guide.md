# 🚀 E-Commerce Platform Installation Guide

## Prerequisites Checklist

Before starting the installation, ensure you have the following installed:

### Required Software
- ✅ **.NET 8 SDK** - [Download here](https://dotnet.microsoft.com/download/dotnet/8.0)
- ✅ **Node.js 18+** - [Download here](https://nodejs.org/)
- ✅ **SQL Server** (LocalDB or full instance) - [Download here](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- ✅ **Git** - [Download here](https://git-scm.com/)

### Recommended Tools
- ✅ **Visual Studio 2022** or **VS Code** - [Download VS](https://visualstudio.microsoft.com/)
- ✅ **SQL Server Management Studio (SSMS)** - [Download here](https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
- ✅ **Postman** (for API testing) - [Download here](https://www.postman.com/)

### System Requirements
- **OS:** Windows 10/11, macOS 10.15+, or Linux
- **RAM:** Minimum 8GB (16GB recommended)
- **Storage:** 5GB free space
- **Network:** Internet connection for package downloads

---

## 📥 Step 1: Download the Project

### Option A: Clone from Repository
```bash
git clone <repository-url>
cd E-CommercePlatform
```

### Option B: Download ZIP
1. Download the project ZIP file
2. Extract to your desired location
3. Navigate to the extracted folder

---

## 🗄️ Step 2: Database Setup

### Option A: Using SQL Server LocalDB (Recommended for Development)

1. **Verify LocalDB Installation:**
   ```bash
   sqllocaldb info
   ```

2. **Create LocalDB Instance (if needed):**
   ```bash
   sqllocaldb create MSSQLLocalDB
   sqllocaldb start MSSQLLocalDB
   ```

### Option B: Using Full SQL Server

1. **Install SQL Server** with default settings
2. **Note your connection details:**
   - Server name (usually `localhost` or `.\SQLEXPRESS`)
   - Authentication method (Windows or SQL Server)
   - Username/password (if using SQL Server authentication)

### Database Connection String

Update the connection string in `Backend/E-CommercePlatform/appsettings.json`:

**For LocalDB:**
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=ECommerceDB;Trusted_Connection=true;MultipleActiveResultSets=true"
  }
}
```

**For SQL Server:**
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost;Database=ECommerceDB;Trusted_Connection=true;MultipleActiveResultSets=true"
  }
}
```

**For SQL Server with Authentication:**
```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost;Database=ECommerceDB;User Id=your_username;Password=your_password;MultipleActiveResultSets=true"
  }
}
```

---

## 🔧 Step 3: Backend Setup

### Navigate to Backend Directory
```bash
cd Backend/E-CommercePlatform
```

### Restore NuGet Packages
```bash
dotnet restore
```

### Build the Solution
```bash
dotnet build
```

### Run Database Migrations
```bash
# Install EF Core tools (if not already installed)
dotnet tool install --global dotnet-ef

# Create and apply migrations
dotnet ef migrations add InitialCreate
dotnet ef database update
```

### Verify Database Creation
1. Open **SQL Server Management Studio**
2. Connect to your SQL Server instance
3. Verify `ECommerceDB` database exists with tables:
   - Users
   - Products
   - Orders
   - OrderItems
   - Cart

### Start the Backend API
```bash
dotnet run
```

**Expected Output:**
```
info: Microsoft.Hosting.Lifetime[14]
      Now listening on: https://localhost:7000
      Now listening on: http://localhost:5000
info: Microsoft.Hosting.Lifetime[0]
      Application started. Press Ctrl+C to shut down.
```

### Verify API is Running
1. Open browser and navigate to: `https://localhost:7000/swagger`
2. You should see the Swagger API documentation
3. Test the API endpoints using Swagger UI

---

## ⚛️ Step 4: Frontend Setup

### Open New Terminal/Command Prompt
Keep the backend running and open a new terminal.

### Navigate to Frontend Directory
```bash
cd Frontend/ecommerce-web-app
```

### Install Node.js Dependencies
```bash
npm install
```

**Expected Output:**
```
added 1500 packages, and audited 1501 packages in 45s
found 0 vulnerabilities
```

### Configure API Base URL
Verify the API URL in `src/services/api.js`:
```javascript
const API_BASE_URL = 'https://localhost:7000/api';
```

### Start the React Development Server
```bash
npm start
```

**Expected Output:**
```
Compiled successfully!

You can now view ecommerce-web-app in the browser.

  Local:            http://localhost:3000
  On Your Network:  http://192.168.1.100:3000
```

### Verify Frontend is Running
1. Browser should automatically open to `http://localhost:3000`
2. You should see the E-Commerce Platform homepage
3. Verify you can see products (if any exist in database)

---

## 🧪 Step 5: Verify Installation

### Test User Registration
1. Click **"Register"** in the top navigation
2. Fill out the registration form:
   - Username: `testuser`
   - Email: `test@example.com`
   - Password: `Test123!`
3. Click **"Register"** button
4. Verify successful registration and automatic login

### Test Product Management (Admin)
1. **Create Admin User** (via database or API)
2. Login with admin credentials
3. Navigate to **Admin Panel**
4. Add a test product:
   - Name: `Test Product`
   - Description: `Test Description`
   - Price: `29.99`
   - Category: `Test Category`
   - Stock: `10`

### Test Shopping Flow
1. **Browse products** on homepage
2. **Add product to cart**
3. **View cart** and verify items
4. **Proceed to checkout**
5. **Enter shipping address**
6. **Complete payment** (test mode)
7. **Verify order creation**

---

## 🔍 Troubleshooting

### Common Backend Issues

**Issue: Database Connection Failed**
```
Solution:
1. Verify SQL Server is running
2. Check connection string in appsettings.json
3. Ensure database exists (run migrations)
4. Check firewall settings
```

**Issue: Port Already in Use**
```
Solution:
1. Change port in launchSettings.json
2. Or kill process using the port:
   netstat -ano | findstr :7000
   taskkill /PID <process_id> /F
```

**Issue: Migration Errors**
```
Solution:
1. Delete Migrations folder
2. Drop database if exists
3. Run: dotnet ef migrations add InitialCreate
4. Run: dotnet ef database update
```

### Common Frontend Issues

**Issue: npm install Fails**
```
Solution:
1. Clear npm cache: npm cache clean --force
2. Delete node_modules folder
3. Delete package-lock.json
4. Run: npm install
```

**Issue: API Connection Error**
```
Solution:
1. Verify backend is running on correct port
2. Check API_BASE_URL in api.js
3. Verify CORS settings in backend
4. Check browser console for errors
```

**Issue: Build Errors**
```
Solution:
1. Check Node.js version (should be 18+)
2. Clear cache: npm cache clean --force
3. Reinstall dependencies: rm -rf node_modules && npm install
4. Check for syntax errors in code
```

### Database Issues

**Issue: LocalDB Not Found**
```
Solution:
1. Install SQL Server Express LocalDB
2. Or use full SQL Server instance
3. Update connection string accordingly
```

**Issue: Permission Denied**
```
Solution:
1. Run as Administrator (Windows)
2. Check SQL Server authentication mode
3. Verify user permissions on database
```

---

## 🔧 Development Environment Setup

### Visual Studio Setup
1. **Open Solution:** `Backend/E-CommercePlatform.sln`
2. **Set Startup Project:** E-CommercePlatform
3. **Configure Multiple Startup Projects:**
   - E-CommercePlatform: Start
   - Frontend: External Program (npm start)

### VS Code Setup
1. **Install Extensions:**
   - C# for Visual Studio Code
   - ES7+ React/Redux/React-Native snippets
   - REST Client (for API testing)

2. **Configure Launch Settings:**
   ```json
   // .vscode/launch.json
   {
     "version": "0.2.0",
     "configurations": [
       {
         "name": ".NET Core Launch (web)",
         "type": "coreclr",
         "request": "launch",
         "preLaunchTask": "build",
         "program": "${workspaceFolder}/Backend/E-CommercePlatform/bin/Debug/net8.0/E-CommercePlatform.dll",
         "args": [],
         "cwd": "${workspaceFolder}/Backend/E-CommercePlatform",
         "stopAtEntry": false,
         "serverReadyAction": {
           "action": "openExternally",
           "pattern": "\\bNow listening on:\\s+(https?://\\S+)"
         },
         "env": {
           "ASPNETCORE_ENVIRONMENT": "Development"
         }
       }
     ]
   }
   ```

---

## 🚀 Production Deployment Preparation

### Backend Production Settings
1. **Update appsettings.Production.json:**
   ```json
   {
     "ConnectionStrings": {
       "DefaultConnection": "your-production-connection-string"
     },
     "JwtSettings": {
       "SecretKey": "your-production-secret-key",
       "Issuer": "your-production-issuer",
       "Audience": "your-production-audience"
     }
   }
   ```

2. **Build for Production:**
   ```bash
   dotnet publish -c Release -o ./publish
   ```

### Frontend Production Build
1. **Update API URL** for production in `api.js`
2. **Build for Production:**
   ```bash
   npm run build
   ```
3. **Serve Static Files** using a web server (IIS, Nginx, Apache)

---

## ✅ Installation Complete!

### What You Should Have Now:
- ✅ **Backend API** running on `https://localhost:7000`
- ✅ **Frontend App** running on `http://localhost:3000`
- ✅ **Database** with all required tables
- ✅ **Swagger Documentation** available
- ✅ **User Registration/Login** working
- ✅ **Product Management** functional
- ✅ **Shopping Cart** operational
- ✅ **Order Processing** complete

### Next Steps:
1. **Add Sample Data** to test all features
2. **Configure Email Settings** for notifications
3. **Set up Payment Gateway** (Stripe/PayPal)
4. **Customize UI/UX** as needed
5. **Deploy to Production** environment

### Need Help?
- 📧 **Email:** support@ecommerce-platform.com
- 📚 **Documentation:** Check other files in `/docs` folder
- 🐛 **Issues:** Report bugs via GitHub Issues

**Happy Coding! 🎉**