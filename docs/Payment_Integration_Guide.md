# Payment Integration Guide - Stripe Implementation

## Overview
This guide explains how to set up and use the Stripe payment integration in the E-Commerce Platform.

## Backend Setup

### 1. Stripe Configuration
Add your Stripe keys to `appsettings.json`:
```json
{
  "Stripe": {
    "PublishableKey": "pk_test_your_publishable_key_here",
    "SecretKey": "sk_test_your_secret_key_here"
  }
}
```

### 2. Get Stripe API Keys
1. Create account at [stripe.com](https://stripe.com)
2. Go to Dashboard → Developers → API Keys
3. Copy **Publishable key** and **Secret key**
4. Use **test keys** for development (start with `pk_test_` and `sk_test_`)

### 3. Package Dependencies
- **Backend**: `Stripe.net` (already added)
- **Frontend**: `paymentService.js` (already created)

## API Endpoints

### Process Payment
```http
POST /api/Payment/process
Authorization: Bearer <jwt-token>
Content-Type: application/json

{
  "amount": 29.99,
  "paymentToken": "pm_card_visa",
  "currency": "usd",
  "description": "Order payment"
}
```

### Refund Payment (Admin only)
```http
POST /api/Payment/refund
Authorization: Bearer <jwt-token>
Content-Type: application/json

{
  "transactionId": "pi_1234567890",
  "amount": 29.99
}
```

## Frontend Integration

### 1. Payment Service
```javascript
import { paymentService } from '../services/paymentService';

// Process payment
const result = await paymentService.processPayment({
  amount: 29.99,
  paymentToken: 'pm_card_visa'
});
```

### 2. Payment Form Component
```jsx
import PaymentForm from '../components/PaymentForm';

<PaymentForm 
  amount={totalAmount}
  onPaymentSuccess={(result) => {
    console.log('Payment successful:', result);
    // Redirect to success page
  }}
  onPaymentError={(error) => {
    console.error('Payment failed:', error);
    // Show error message
  }}
/>
```

## Testing

### Test Card Numbers (Stripe Test Mode)
- **Visa**: `4242424242424242`
- **Visa (debit)**: `4000056655665556`
- **Mastercard**: `5555555555554444`
- **American Express**: `378282246310005`
- **Declined**: `4000000000000002`

### Test Scenarios
1. **Successful Payment**: Use valid test card
2. **Declined Payment**: Use `4000000000000002`
3. **Insufficient Funds**: Use `4000000000009995`
4. **Expired Card**: Use `4000000000000069`

## Security Features

### Backend Security
- JWT authentication required
- Input validation on all endpoints
- Stripe webhook signature verification
- HTTPS enforcement in production

### Frontend Security
- No sensitive card data stored
- Payment tokens used instead of raw card data
- HTTPS required for payment forms
- PCI DSS compliance through Stripe

## Production Deployment

### 1. Environment Variables
```bash
# Set in production environment
STRIPE_SECRET_KEY=sk_live_your_live_secret_key
STRIPE_PUBLISHABLE_KEY=pk_live_your_live_publishable_key
```

### 2. Webhook Setup
1. Go to Stripe Dashboard → Webhooks
2. Add endpoint: `https://your-domain.com/api/webhooks/stripe`
3. Select events: `payment_intent.succeeded`, `payment_intent.payment_failed`
4. Copy webhook secret to configuration

### 3. SSL Certificate
- Ensure HTTPS is enabled
- Stripe requires SSL for live payments
- Use Let's Encrypt or commercial SSL

## Error Handling

### Common Errors
```javascript
// Payment declined
{
  "success": false,
  "message": "Your card was declined."
}

// Insufficient funds
{
  "success": false,
  "message": "Your card has insufficient funds."
}

// Invalid card
{
  "success": false,
  "message": "Your card number is incorrect."
}
```

### Error Codes
- `card_declined`: Card was declined
- `insufficient_funds`: Not enough money
- `invalid_number`: Invalid card number
- `invalid_expiry_month`: Invalid expiry month
- `invalid_cvc`: Invalid CVC code

## Integration Checklist

### Backend
- [x] Stripe.net package installed
- [x] PaymentService implemented
- [x] PaymentController with endpoints
- [x] Configuration in appsettings.json
- [x] Error handling and logging

### Frontend
- [x] Payment service created
- [x] Payment form component
- [x] Error handling
- [x] Loading states
- [x] Success/failure callbacks

### Testing
- [ ] Test with Stripe test cards
- [ ] Verify webhook handling
- [ ] Test refund functionality
- [ ] Load testing for high volume

### Production
- [ ] Live Stripe keys configured
- [ ] Webhooks set up
- [ ] SSL certificate installed
- [ ] PCI compliance review
- [ ] Security audit completed

## Support

### Stripe Resources
- [Stripe Documentation](https://stripe.com/docs)
- [Stripe Testing](https://stripe.com/docs/testing)
- [Stripe Dashboard](https://dashboard.stripe.com)

### Implementation Support
- Check Swagger API docs: `/api-docs`
- Review error logs in application
- Test with Stripe's test environment first