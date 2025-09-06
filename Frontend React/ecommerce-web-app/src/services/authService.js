import api from './api';

export const authService = {
  // User login
  login: async (email, password) => {
    try {
      console.log('Making login request to:', api.defaults.baseURL + '/Auth/login');
      console.log('Login payload:', { email, password: '***' });
      
      const response = await api.post('/Auth/login', { email, password });
      
      console.log('Login response status:', response.status);
      console.log('Login response data:', response.data);
      
      if (response.data.token) {
        localStorage.setItem('token', response.data.token);
      }
      return response.data;
    } catch (error) {
      console.error('Login request failed:');
      console.error('Error message:', error.message);
      console.error('Error code:', error.code);
      console.error('Response status:', error.response?.status);
      console.error('Response data:', error.response?.data);
      throw error;
    }
  },

  // User registration
  register: async (username, email, password) => {
    const response = await api.post('/Auth/register', {
      username,
      email,
      password,
    });
    return response.data;
  },

  // Logout
  logout: () => {
    localStorage.removeItem('token');
  },

  // Check if user is logged in
  isAuthenticated: () => {
    return !!localStorage.getItem('token');
  },

  // Get current token
  getToken: () => {
    return localStorage.getItem('token');
  },
};