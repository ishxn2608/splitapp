// Script to clear all users from the database
require('dotenv').config();
const mongoose = require('mongoose');

mongoose.connect(process.env.MONGODB_URI)
  .then(async () => {
    console.log('Connected to MongoDB');
    
    // Drop the users collection
    await mongoose.connection.db.dropCollection('users').catch(() => {
      console.log('Users collection does not exist or already empty');
    });
    
    console.log('✅ All users cleared successfully!');
    console.log('You can now register with any email address.');
    
    process.exit(0);
  })
  .catch(err => {
    console.error('Error:', err);
    process.exit(1);
  });
