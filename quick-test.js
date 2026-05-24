// Quick MongoDB Connection Test
require('dotenv').config();
const mongoose = require('mongoose');

console.log('\n🔍 Quick Connection Test\n');
console.log('Connection String:', process.env.MONGODB_URI);
console.log('\nConnecting (timeout: 10 seconds)...\n');

mongoose.connect(process.env.MONGODB_URI, {
    serverSelectionTimeoutMS: 10000,
    socketTimeoutMS: 10000,
})
.then(() => {
    console.log('✅ SUCCESS! Connected to MongoDB Atlas!\n');
    console.log('Database:', mongoose.connection.name);
    console.log('Host:', mongoose.connection.host);
    console.log('\n🎉 Your setup is working!\n');
    process.exit(0);
})
.catch(err => {
    console.error('❌ Connection Failed!\n');
    console.error('Error:', err.message);
    
    if (err.message.includes('bad auth')) {
        console.error('\n🔧 Fix: Username or password is incorrect');
        console.error('   Check MongoDB Atlas → Database Access');
    } else if (err.message.includes('ENOTFOUND') || err.message.includes('ETIMEDOUT')) {
        console.error('\n🔧 Fix: Network/Firewall issue');
        console.error('   1. Check internet connection');
        console.error('   2. Check if MongoDB Atlas is accessible');
        console.error('   3. Disable VPN if using one');
        console.error('   4. Check firewall settings');
    } else if (err.message.includes('IP') || err.message.includes('not authorized')) {
        console.error('\n🔧 Fix: IP not whitelisted');
        console.error('   Add 0.0.0.0/0 in MongoDB Atlas → Network Access');
    }
    
    console.error('\n');
    process.exit(1);
});

// Timeout handler
setTimeout(() => {
    console.error('⏱️  Connection timeout (10 seconds)');
    console.error('\nPossible issues:');
    console.error('  1. Firewall blocking connection');
    console.error('  2. VPN interfering');
    console.error('  3. Internet connection slow/unstable');
    console.error('  4. MongoDB Atlas cluster paused\n');
    process.exit(1);
}, 10000);
