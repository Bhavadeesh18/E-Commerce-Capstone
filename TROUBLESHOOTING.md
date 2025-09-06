# NETWORK FAILURE TROUBLESHOOTING

## 🚨 **QUICK FIX STEPS**

### **1. Start Backend First**
```bash
cd "C:\E-CommercePlatform\Backend .NET\E-CommercePlatform\E-CommercePlatform"
dotnet run
```
**Expected Output:**
```
Now listening on: https://localhost:7167
Now listening on: http://localhost:5165
```

### **2. Test Backend is Running**
Open browser: `https://localhost:7167/swagger`
- If you see "Your connection is not private" → Click "Advanced" → "Proceed to localhost"
- You should see Swagger API documentation

### **3. Start Frontend**
```bash
cd "C:\E-CommercePlatform\Frontend React\ecommerce-web-app"
npm start
```

### **4. If Still Network Error**

#### **Option A: Use HTTP Instead of HTTPS**
Edit `C:\E-CommercePlatform\Frontend React\ecommerce-web-app\.env`:
```
REACT_APP_API_URL=http://localhost:5165/api
```

#### **Option B: Accept HTTPS Certificate**
1. Go to `https://localhost:7167/swagger` in browser
2. Click "Advanced" → "Proceed to localhost"
3. This accepts the self-signed certificate
4. Now frontend will work

#### **Option C: Disable HTTPS Redirect (Backend)**
In `Program.cs`, comment out:
```csharp
// app.UseHttpsRedirection();  // Comment this line
```

## 🔍 **COMMON ISSUES & SOLUTIONS**

### **Issue 1: "ERR_CERT_AUTHORITY_INVALID"**
**Solution:** Accept the self-signed certificate in browser first

### **Issue 2: "Network Error" or "CORS Error"**
**Solution:** Make sure backend is running and CORS is configured

### **Issue 3: "Connection Refused"**
**Solution:** Check if backend is running on correct port (7167)

### **Issue 4: "401 Unauthorized"**
**Solution:** Login first to get JWT token

## ✅ **VERIFICATION STEPS**

1. **Backend Running:** `https://localhost:7167/swagger` shows API docs
2. **Frontend Running:** `http://localhost:3000` shows React app
3. **API Connection:** Login should work without network errors
4. **CORS Working:** No CORS errors in browser console

## 🛠️ **MANUAL TESTING ORDER**

1. Start backend
2. Accept HTTPS certificate in browser
3. Test API endpoints in Swagger
4. Start frontend
5. Test login functionality