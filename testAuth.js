// Test script to verify authentication is working
const axios = require('axios');

const API_URL = 'http://localhost:3001/api/users';

async function testAuth() {
    try {
        console.log('🧪 Testing Authentication System...\n');
        
        // Test 1: Register a new user
        console.log('1️⃣ Testing Registration...');
        const registerData = {
            firstName: 'Test',
            lastName: 'User',
            emailId: 'test@example.com',
            password: 'Test@1234'
        };
        
        try {
            const registerResponse = await axios.post(`${API_URL}/v1/register`, registerData);
            console.log('✅ Registration successful!');
            console.log('   User ID:', registerResponse.data.userId);
        } catch (err) {
            if (err.response?.data?.message?.includes('already present')) {
                console.log('⚠️  User already exists, proceeding to login test...');
            } else {
                throw err;
            }
        }
        
        // Test 2: Login with the user
        console.log('\n2️⃣ Testing Login...');
        const loginData = {
            emailId: 'test@example.com',
            password: 'Test@1234'
        };
        
        const loginResponse = await axios.post(`${API_URL}/v1/login`, loginData);
        console.log('✅ Login successful!');
        console.log('   User:', loginResponse.data.firstName, loginResponse.data.lastName);
        console.log('   Email:', loginResponse.data.emailId);
        console.log('   Token:', loginResponse.data.accessToken.substring(0, 20) + '...');
        
        console.log('\n🎉 All tests passed! Authentication is working correctly.');
        console.log('\n📝 You can now use these credentials to login:');
        console.log('   Email: test@example.com');
        console.log('   Password: Test@1234');
        
    } catch (error) {
        console.error('\n❌ Test failed!');
        if (error.response) {
            console.error('   Status:', error.response.status);
            console.error('   Message:', error.response.data.message);
        } else {
            console.error('   Error:', error.message);
        }
        console.error('\n💡 Make sure the server is running on http://localhost:3001');
    }
}

testAuth();
