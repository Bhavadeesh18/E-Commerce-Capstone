// Network connectivity test utility

export const testBackendConnection = async () => {
  const baseUrl = process.env.REACT_APP_API_URL || 'http://localhost:5165/api';
  
  console.log('Testing backend connection...');
  console.log('Base URL:', baseUrl);
  
  try {
    // Test 1: Basic fetch to see if server is reachable
    const response = await fetch(baseUrl.replace('/api', '/swagger/index.html'), {
      method: 'GET',
      mode: 'no-cors' // Bypass CORS for this test
    });
    
    console.log('✅ Backend server is reachable');
    return true;
  } catch (error) {
    console.error('❌ Backend server is NOT reachable');
    console.error('Error:', error.message);
    
    // Test alternative URLs
    const alternatives = [
      'https://localhost:7167/api',
      'http://localhost:5165/api',
      'http://localhost:7167/api'
    ];
    
    console.log('Testing alternative URLs...');
    for (const url of alternatives) {
      try {
        await fetch(url.replace('/api', '/swagger/index.html'), { 
          method: 'GET', 
          mode: 'no-cors',
          timeout: 5000 
        });
        console.log(`✅ Found working URL: ${url}`);
        return url;
      } catch (err) {
        console.log(`❌ Failed: ${url}`);
      }
    }
    
    return false;
  }
};

export const testLoginEndpoint = async () => {
  const baseUrl = process.env.REACT_APP_API_URL || 'http://localhost:5165/api';
  
  try {
    const response = await fetch(`${baseUrl}/Auth/login`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({
        email: 'test@test.com',
        password: 'test123'
      })
    });
    
    console.log('Login endpoint response status:', response.status);
    
    if (response.status === 401) {
      console.log('✅ Login endpoint is working (401 = invalid credentials expected)');
      return true;
    } else if (response.status === 200) {
      console.log('✅ Login endpoint is working (200 = success)');
      return true;
    } else {
      console.log('⚠️ Login endpoint returned unexpected status:', response.status);
      return false;
    }
  } catch (error) {
    console.error('❌ Login endpoint test failed:', error.message);
    return false;
  }
};