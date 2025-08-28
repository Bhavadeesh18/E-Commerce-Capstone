# 📖 E-Commerce Platform User Manual

## Table of Contents
1. [Getting Started](#getting-started)
2. [User Registration & Login](#user-registration--login)
3. [Browsing Products](#browsing-products)
4. [Shopping Cart](#shopping-cart)
5. [Checkout Process](#checkout-process)
6. [Order Management](#order-management)
7. [Admin Features](#admin-features)
8. [Troubleshooting](#troubleshooting)

---

## 🚀 Getting Started

### System Requirements
- **Browser:** Chrome, Firefox, Safari, or Edge (latest versions)
- **Internet Connection:** Required for all features
- **JavaScript:** Must be enabled

### Accessing the Platform
1. Open your web browser
2. Navigate to: `http://localhost:3000` (development) or your deployed URL
3. The homepage will display featured products

---

## 👤 User Registration & Login

### Creating a New Account

1. **Click "Register"** in the top navigation
2. **Fill out the registration form:**
   - Username (3-50 characters)
   - Email address (valid email required)
   - Password (minimum 6 characters)
3. **Click "Register"** button
4. **Success:** You'll be automatically logged in

### Logging In

1. **Click "Login"** in the top navigation
2. **Enter your credentials:**
   - Email address
   - Password
3. **Click "Login"** button
4. **Success:** You'll be redirected to the homepage

### User Profile

After logging in, you'll see:
- **User avatar** in the top-right corner
- **Dropdown menu** with account options:
  - Account Info (username, status, role)
  - My Orders
  - Logout

---

## 📦 Browsing Products

### Homepage Features

**Product Grid:**
- Displays featured products in card format
- Each card shows: image, name, description, price, stock

**Search & Filter:**
- **Search Bar:** Type product name, description, or category
- **Category Filter:** Select from dropdown to filter by category
- **Clear Filters:** Reset all filters with "Clear All" button

### Product Details

**Viewing Product Details:**
1. **Click any product card** to view detailed information
2. **Product details include:**
   - Large product image
   - Complete description
   - Price and stock availability
   - Product specifications
   - Shipping & return information

**Navigation:**
- **Back Button:** Return to previous page
- **Breadcrumb:** Shows navigation path

---

## 🛒 Shopping Cart

### Adding Items to Cart

**From Product Grid:**
1. Click **"Add to Cart"** button on any product card
2. Item is added with quantity of 1

**From Product Details:**
1. **Adjust quantity** using +/- buttons or input field
2. Click **"Add to Cart"** button
3. Confirmation message appears

### Managing Your Cart

**Accessing Cart:**
- Click **cart icon** in sidebar
- Shows cart item count badge

**Cart Features:**
- **View all items** with images and details
- **Update quantities** for each item
- **Remove items** individually
- **View total amount** automatically calculated
- **Clear entire cart** option

### Cart Persistence
- Cart items are **saved across sessions**
- Items remain until manually removed or purchased

---

## 💳 Checkout Process

### Step 1: Review Cart
1. **Navigate to Cart** page
2. **Review all items** and quantities
3. **Update if needed** before proceeding
4. Click **"Proceed to Checkout"**

### Step 2: Shipping Information
1. **Enter shipping address:**
   - Complete street address
   - City, state, zip code
   - Any special delivery instructions
2. **Review order summary** on the right
3. Click **"Proceed to Payment"**

### Step 3: Payment
1. **Select payment method:**
   - Credit Card
   - PayPal
   - Debit Card

2. **For Credit Card:**
   - Card number (16 digits)
   - Expiry date (MM/YY)
   - CVV (3 digits)
   - Cardholder name

3. **Review order details** in sidebar
4. Click **"Pay $XX.XX"** button

### Step 4: Confirmation
1. **Confirmation popup** appears with order details
2. **Confirm or cancel** the payment
3. **Success message** shows order confirmation
4. **Automatic redirect** to Orders page

---

## 📋 Order Management

### Viewing Your Orders

**Access Orders:**
- Click **"My Orders"** in user dropdown, or
- Click **orders icon** in sidebar

**Order Information:**
Each order displays:
- **Order ID** and date
- **Order status** (Pending, Processing, Shipped, Delivered)
- **Total amount** paid
- **Shipping address**
- **Item details** with images

### Order Status Meanings

| Status | Description |
|--------|-------------|
| **Pending** | Order received, awaiting processing |
| **Processing** | Order being prepared for shipment |
| **Shipped** | Order dispatched, tracking available |
| **Delivered** | Order successfully delivered |
| **Cancelled** | Order cancelled by user or admin |

### Order Actions

**Available Actions:**
- **View Details:** See complete order information
- **Cancel Order:** Available for Pending/Processing orders only
- **Return Order:** Available for Delivered orders only

**Cancelling an Order:**
1. Click **"Cancel Order"** button
2. **Confirm cancellation** in popup
3. Order status changes to "Cancelled"
4. Refund processed automatically

---

## 🔧 Admin Features

### Accessing Admin Panel
- **Admin users only:** "Admin Panel" appears in sidebar
- Click to access administrative features

### Product Management

**Adding New Products:**
1. Click **"Add New Product"**
2. **Fill product details:**
   - Name and description
   - Price and category
   - Stock quantity
   - Product image URL
3. Click **"Add Product"**

**Managing Existing Products:**
- **View all products** in admin table
- **Edit product details** inline
- **Update stock levels**
- **Delete products** (with confirmation)

### Order Management

**Admin Order View:**
- **See all customer orders**
- **Filter by status** or date
- **Update order status**
- **View customer details**

**Status Updates:**
1. Select order from list
2. Choose new status from dropdown
3. Click **"Update Status"**
4. Customer receives automatic notification

---

## 🔍 Troubleshooting

### Common Issues

**Login Problems:**
- ✅ **Check email/password** spelling
- ✅ **Ensure account exists** (register if needed)
- ✅ **Clear browser cache** and try again

**Cart Issues:**
- ✅ **Refresh the page** to sync cart
- ✅ **Check internet connection**
- ✅ **Ensure you're logged in** for cart persistence

**Payment Problems:**
- ✅ **Verify card details** are correct
- ✅ **Check card has sufficient funds**
- ✅ **Try different payment method**
- ✅ **Contact support** if issues persist

**Product Search:**
- ✅ **Check spelling** in search terms
- ✅ **Try broader search terms**
- ✅ **Use category filter** instead
- ✅ **Clear all filters** and start over

### Browser Compatibility

**Supported Browsers:**
- ✅ Chrome 90+
- ✅ Firefox 88+
- ✅ Safari 14+
- ✅ Edge 90+

**If experiencing issues:**
1. **Update your browser** to latest version
2. **Clear browser cache** and cookies
3. **Disable browser extensions** temporarily
4. **Try incognito/private mode**

### Performance Tips

**For Better Experience:**
- ✅ **Stable internet connection** recommended
- ✅ **Close unnecessary browser tabs**
- ✅ **Clear browser cache** regularly
- ✅ **Update browser** to latest version

---

## 📞 Getting Help

### Contact Support
- **Email:** support@ecommerce-platform.com
- **Response Time:** Within 24 hours
- **Available:** Monday-Friday, 9 AM - 6 PM

### What to Include in Support Requests
1. **Detailed description** of the issue
2. **Steps to reproduce** the problem
3. **Browser and version** you're using
4. **Screenshots** if applicable
5. **Your account email** (for account-specific issues)

### Self-Help Resources
- **FAQ Section:** Common questions and answers
- **Video Tutorials:** Step-by-step guides
- **Community Forum:** User discussions and tips

---

## 🎯 Tips for Best Experience

### Shopping Tips
- ✅ **Create account** for order tracking and faster checkout
- ✅ **Add items to cart** early to reserve stock
- ✅ **Check product details** before purchasing
- ✅ **Review shipping address** carefully

### Security Tips
- ✅ **Use strong passwords** with mixed characters
- ✅ **Log out** when using shared computers
- ✅ **Keep payment info** secure
- ✅ **Report suspicious activity** immediately

### Mobile Usage
- ✅ **Responsive design** works on all devices
- ✅ **Touch-friendly** buttons and navigation
- ✅ **Optimized images** for faster loading
- ✅ **Same features** as desktop version

---

**Happy Shopping! 🛒✨**

*Last updated: January 2024*