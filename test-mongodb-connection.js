// Test MongoDB Connection
require('dotenv').config();
const mongoose = require('mongoose');

console.log('\n🔍 Testing MongoDB Connection...\n');
console.log('📊 Connection String:', process.env.MONGODB_URI);
console.log('⏳ Connecting...\n');

mongoose.connect(process.env.MONGODB_URI, {
    serverSelectionTimeoutMS: 5000
})
.then(() => {
    console.log('✅ SUCCESS! MongoDB connection established!\n');
    console.log('📦 Database:', mongoose.connection.name);
    console.log('🌐 Host:', mongoose.connection.host);
    console.log('\n🎉 Your database is ready to use!\n');
    
    // List collections
    mongoose.connection.db.listCollections().toArray()
        .then(collections => {
            if (collections.length > 0) {
                console.log('📁 Existing Collections:');
                collections.forEach(col => {
                    console.log(`   - ${col.name}`);
                });
            } else {
                console.log('📁 No collections yet (will be created automatically)');
            }
            console.log('\n');
            process.exit(0);
        });
})
.catch(err => {
    console.error('❌ FAILED! MongoDB connection error:\n');
    console.error('Error:', err.message);
    console.error('\n📝 Common Issues:\n');
    console.error('1. Check if MongoDB Atlas cluster is active');
    console.error('2. Verify IP address is whitelisted (0.0.0.0/0)');
    console.error('3. Confirm username and password are correct');
    console.error('4. Ensure connection string includes database name');
    console.error('\n📖 Read SETUP_MONGODB_ATLAS.md for detailed instructions\n');
    process.exit(1);
});
