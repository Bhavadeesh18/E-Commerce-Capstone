import React, { useState } from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { Provider } from 'react-redux';
import store from './redux/store';
import Sidebar from './components/Sidebar';
import TopHeader from './components/TopHeader';

import Home from './pages/Home';
import Login from './pages/Login';
import Register from './pages/Register';
import Cart from './pages/Cart';
import Checkout from './pages/Checkout';
import Payment from './pages/Payment';
import Orders from './pages/Orders';
import OrderDetails from './pages/OrderDetails';
import AdminPanel from './pages/AdminPanel';
import ProductDetails from './pages/ProductDetails';
import Wishlist from './pages/Wishlist';
import './utils/customAlert';
import 'bootstrap/dist/css/bootstrap.min.css';

function App() {
  const [isCollapsed, setIsCollapsed] = useState(false);

  return (
    <Provider store={store}>
      <Router>
        <div className="App">
          <TopHeader />
          <div className="d-flex">
            <Sidebar isCollapsed={isCollapsed} setIsCollapsed={setIsCollapsed} />
            <div className="flex-grow-1" style={{ marginLeft: isCollapsed ? '70px' : '280px', marginTop: '60px', minHeight: 'calc(100vh - 60px)', backgroundColor: '#f8f9fa', transition: 'margin-left 0.3s ease' }}>
              <div className="container-fluid p-4">
                <Routes>
                  <Route path="/" element={<Home />} />
                  <Route path="/login" element={<Login />} />
                  <Route path="/register" element={<Register />} />
                  <Route path="/cart" element={<Cart />} />
                  <Route path="/checkout" element={<Checkout />} />
                  <Route path="/payment" element={<Payment />} />
                  <Route path="/orders" element={<Orders />} />
                  <Route path="/order/:orderId" element={<OrderDetails />} />
                  <Route path="/admin" element={<AdminPanel />} />
                  <Route path="/product/:id" element={<ProductDetails />} />
                  <Route path="/wishlist" element={<Wishlist />} />
                </Routes>
              </div>
            </div>
          </div>

        </div>
      </Router>
    </Provider>
  );
}

export default App;