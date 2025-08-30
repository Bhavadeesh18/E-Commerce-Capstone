# E-Commerce Platform API Documentation

## Overview
This document provides comprehensive information about the E-Commerce Platform REST API endpoints, built with ASP.NET Core and documented using Swagger/OpenAPI.

## Base URL
- **Development**: `https://localhost:7000`
- **Production**: `https://your-domain.com`

## Swagger UI Access
- **URL**: `/api-docs`
- **Full URL**: `https://localhost:7000/api-docs`

## Authentication
The API uses JWT (JSON Web Token) for authentication. Include the token in the Authorization header:
```
Authorization: Bearer <your-jwt-token>
```

## API Endpoints

### Authentication Endpoints
| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/Auth/login` | User login | No |
| POST | `/api/Auth/register` | User registration | No |

### Product Endpoints
| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/Product` | Get all products | No |
| GET | `/api/Product/{id}` | Get product by ID | No |
| POST | `/api/Product` | Create product | Admin |
| PUT | `/api/Product/{id}` | Update product | Admin |
| DELETE | `/api/Product/{id}` | Delete product | Admin |

### Cart Endpoints
| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/Cart` | Get user cart | Yes |
| POST | `/api/Cart/add` | Add item to cart | Yes |
| PUT | `/api/Cart/update/{productId}` | Update cart item | Yes |
| DELETE | `/api/Cart/remove/{productId}` | Remove from cart | Yes |
| DELETE | `/api/Cart/clear` | Clear cart | Yes |

### Order Endpoints
| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| GET | `/api/Order` | Get user orders | Yes |
| GET | `/api/Order/{id}` | Get order by ID | Yes |
| POST | `/api/Order` | Create order | Yes |
| PUT | `/api/Order/{id}/status` | Update order status | Admin |

### Payment Endpoints
| Method | Endpoint | Description | Auth Required |
|--------|----------|-------------|---------------|
| POST | `/api/Payment/process` | Process payment | Yes |
| GET | `/api/Payment/{id}` | Get payment details | Yes |

## Response Formats

### Success Response
```json
{
  "data": {},
  "message": "Success message",
  "success": true
}
```

### Error Response
```json
{
  "error": "Error message",
  "details": "Detailed error information",
  "success": false
}
```

## Status Codes
- `200 OK` - Request successful
- `201 Created` - Resource created successfully
- `204 No Content` - Request successful, no content returned
- `400 Bad Request` - Invalid request data
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Insufficient permissions
- `404 Not Found` - Resource not found
- `500 Internal Server Error` - Server error

## Data Models

### LoginDto
```json
{
  "email": "user@example.com",
  "password": "password123"
}
```

### RegisterDto
```json
{
  "username": "johndoe",
  "email": "john@example.com",
  "password": "password123",
  "confirmPassword": "password123"
}
```

### ProductDto
```json
{
  "id": 1,
  "name": "Product Name",
  "description": "Product description",
  "price": 29.99,
  "stock": 100,
  "category": "Electronics",
  "imageUrl": "https://example.com/image.jpg"
}
```

### CartItemDto
```json
{
  "productId": 1,
  "productName": "Product Name",
  "price": 29.99,
  "quantity": 2,
  "subtotal": 59.98
}
```

## Testing with Swagger UI

1. **Access Swagger UI**: Navigate to `/api-docs`
2. **Authenticate**: 
   - Click "Authorize" button
   - Enter `Bearer <your-token>` in the value field
   - Click "Authorize"
3. **Test Endpoints**: 
   - Expand endpoint sections
   - Click "Try it out"
   - Fill in parameters
   - Click "Execute"

## Example Usage

### 1. User Registration
```bash
curl -X POST "https://localhost:7000/api/Auth/register" \
  -H "Content-Type: application/json" \
  -d '{
    "username": "johndoe",
    "email": "john@example.com",
    "password": "password123",
    "confirmPassword": "password123"
  }'
```

### 2. User Login
```bash
curl -X POST "https://localhost:7000/api/Auth/login" \
  -H "Content-Type: application/json" \
  -d '{
    "email": "john@example.com",
    "password": "password123"
  }'
```

### 3. Get Products
```bash
curl -X GET "https://localhost:7000/api/Product" \
  -H "Accept: application/json"
```

### 4. Add to Cart (Authenticated)
```bash
curl -X POST "https://localhost:7000/api/Cart/add" \
  -H "Authorization: Bearer <your-token>" \
  -H "Content-Type: application/json" \
  -d '{
    "productId": 1,
    "quantity": 2
  }'
```

## Environment Setup

### Development
1. Start the API server: `dotnet run`
2. Access Swagger UI: `https://localhost:7000/api-docs`
3. API Base URL: `https://localhost:7000`

### Production
1. Deploy to your hosting platform
2. Update base URLs in documentation
3. Configure HTTPS certificates
4. Set up proper CORS policies

## Security Considerations

1. **JWT Tokens**: Expire after 24 hours
2. **HTTPS**: All endpoints require HTTPS in production
3. **CORS**: Configured for specific origins
4. **Rate Limiting**: Implement for production use
5. **Input Validation**: All inputs are validated
6. **SQL Injection**: Protected by Entity Framework

## Support

For API support and questions:
- **Email**: support@ecommerce.com
- **Documentation**: `/api-docs`
- **GitHub**: https://github.com/your-repo/ecommerce-platform