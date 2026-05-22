# 🗄️ MongoDB Viewing Guide

## 📋 Table of Contents
1. [View MongoDB in Web Browser (Local)](#1-view-mongodb-in-web-browser-local)
2. [MongoDB Atlas (Cloud Database)](#2-mongodb-atlas-cloud-database)
3. [MongoDB Compass (Desktop App)](#3-mongodb-compass-desktop-app)
4. [Command Line Tools](#4-command-line-tools)

---

## 1️⃣ View MongoDB in Web Browser (Local)

### Quick Start - Web Viewer

I've created a simple web interface for you!

#### Start the MongoDB Viewer:
```bash
node viewDatabase.js
```

#### Access the Viewer:
Open your browser: **http://localhost:3002**

#### Features:
- 👥 View all users
- 📁 View all groups
- 💰 View all expenses
- ✅ View settlements
- 📊 Database statistics

**Note**: This viewer runs on port 3002 (different from your main app on 3000/3001)

---

## 2️⃣ MongoDB Atlas (Cloud Database)

### What is MongoDB Atlas?
MongoDB Atlas is a **cloud-hosted MongoDB database** that:
- ✅ Works from anywhere (no local MongoDB needed)
- ✅ Free tier available (512MB storage)
- ✅ Has a built-in web interface
- ✅ Automatic backups
- ✅ Better for production/sharing with friends

### Step-by-Step Setup:

#### Step 1: Create MongoDB Atlas Account
1. Go to: **https://www.mongodb.com/cloud/atlas/register**
2. Sign up with email or Google account
3. Choose **FREE** tier (M0 Sandbox)

#### Step 2: Create a Cluster
1. After login, click **"Build a Database"**
2. Choose **FREE** tier (Shared)
3. Select a cloud provider (AWS recommended)
4. Choose a region closest to you
5. Click **"Create Cluster"** (takes 3-5 minutes)

#### Step 3: Create Database User
1. Click **"Database Access"** in left sidebar
2. Click **"Add New Database User"**
3. Choose **"Password"** authentication
4. Username: `splitapp_user`
5. Password: Create a strong password (save it!)
6. User Privileges: **"Read and write to any database"**
7. Click **"Add User"**

#### Step 4: Whitelist Your IP Address
1. Click **"Network Access"** in left sidebar
2. Click **"Add IP Address"**
3. Click **"Allow Access from Anywhere"** (for development)
   - Or add your specific IP for security
4. Click **"Confirm"**

#### Step 5: Get Connection String
1. Click **"Database"** in left sidebar
2. Click **"Connect"** on your cluster
3. Choose **"Connect your application"**
4. Copy the connection string (looks like):
   ```
   mongodb+srv://splitapp_user:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority
   ```
5. Replace `<password>` with your actual password

#### Step 6: Update Your .env File
```bash
# Old (Local MongoDB)
MONGODB_URI=mongodb://localhost:27017/splitapp

# New (MongoDB Atlas)
MONGODB_URI=mongodb+srv://splitapp_user:YOUR_PASSWORD@cluster0.xxxxx.mongodb.net/splitapp?retryWrites=true&w=majority
```

**Important**: Replace:
- `YOUR_PASSWORD` with your database user password
- `cluster0.xxxxx` with your actual cluster address
- Add `/splitapp` before the `?` to specify database name

#### Step 7: Restart Your App
```bash
# Stop current app (Ctrl+C)
# Start again
npm run dev
```

### View Data in MongoDB Atlas:

1. Go to **https://cloud.mongodb.com**
2. Login to your account
3. Click **"Database"** → **"Browse Collections"**
4. You'll see:
   - **users** collection
   - **groups** collection
   - **expenses** collection
   - **settlements** collection
5. Click any collection to view data
6. You can:
   - ✅ View documents
   - ✅ Edit documents
   - ✅ Delete documents
   - ✅ Add new documents
   - ✅ Search and filter

---

## 3️⃣ MongoDB Compass (Desktop App)

### What is MongoDB Compass?
A **free desktop application** to view and manage MongoDB databases.

### Download & Install:
1. Go to: **https://www.mongodb.com/try/download/compass**
2. Download for Windows
3. Install the application

### Connect to Local MongoDB:
1. Open MongoDB Compass
2. Connection string: `mongodb://localhost:27017`
3. Click **"Connect"**
4. Select **"splitapp"** database
5. View collections: users, groups, expenses, settlements

### Connect to MongoDB Atlas:
1. Open MongoDB Compass
2. Use your Atlas connection string:
   ```
   mongodb+srv://splitapp_user:YOUR_PASSWORD@cluster0.xxxxx.mongodb.net/splitapp
   ```
3. Click **"Connect"**
4. Browse your cloud database

---

## 4️⃣ Command Line Tools

### Using MongoDB Shell (mongosh):

#### Install mongosh:
Download from: **https://www.mongodb.com/try/download/shell**

#### Connect to Local MongoDB:
```bash
mongosh mongodb://localhost:27017/splitapp
```

#### Connect to MongoDB Atlas:
```bash
mongosh "mongodb+srv://splitapp_user:YOUR_PASSWORD@cluster0.xxxxx.mongodb.net/splitapp"
```

#### Useful Commands:
```javascript
// Show all databases
show dbs

// Use splitapp database
use splitapp

// Show all collections
show collections

// View all users
db.users.find().pretty()

// Count users
db.users.countDocuments()

// View all groups
db.groups.find().pretty()

// View all expenses
db.expenses.find().pretty()

// Find specific user
db.users.findOne({ emailId: "test@example.com" })

// Delete all users (careful!)
db.users.deleteMany({})

// View latest 5 expenses
db.expenses.find().sort({ expenseDate: -1 }).limit(5)
```

---

## 🎯 Comparison Table

| Method | Pros | Cons | Best For |
|--------|------|------|----------|
| **Web Viewer (viewDatabase.js)** | ✅ Simple<br>✅ No installation<br>✅ Custom interface | ❌ Basic features<br>❌ Local only | Quick viewing |
| **MongoDB Atlas** | ✅ Cloud-based<br>✅ Web interface<br>✅ Free tier<br>✅ Accessible anywhere | ❌ Requires internet<br>❌ Setup needed | Production use |
| **MongoDB Compass** | ✅ Full features<br>✅ Visual interface<br>✅ Works offline | ❌ Desktop app<br>❌ Installation needed | Development |
| **mongosh (CLI)** | ✅ Powerful<br>✅ Scriptable<br>✅ Fast | ❌ Command line<br>❌ Learning curve | Advanced users |

---

## 🚀 Quick Start Commands

### View Database in Web Browser:
```bash
# Terminal 1: Run your main app
npm run dev

# Terminal 2: Run database viewer
node viewDatabase.js

# Open browser: http://localhost:3002
```

### Switch to MongoDB Atlas:
```bash
# 1. Create Atlas account and cluster
# 2. Get connection string
# 3. Update .env file:
MONGODB_URI=mongodb+srv://user:pass@cluster.mongodb.net/splitapp

# 4. Restart app
npm run dev
```

---

## 📊 Viewing Backend API Responses

### Test Backend APIs:

#### Using Browser (GET requests only):
```
http://localhost:3001/api/users
```

#### Using PowerShell (POST requests):
```powershell
# View user
Invoke-WebRequest -Uri "http://localhost:3001/api/users/v1/login" `
  -Method POST `
  -ContentType "application/json" `
  -Body '{"emailId":"test@example.com","password":"Test@1234"}' `
  -UseBasicParsing
```

#### Using Postman:
1. Download Postman: **https://www.postman.com/downloads/**
2. Import `API_collection.json` from your project
3. Test all API endpoints
4. View responses in formatted JSON

---

## 🔧 Troubleshooting

### Issue: Can't connect to local MongoDB
**Solution**: Make sure MongoDB service is running
```bash
# Check if MongoDB is running
# Windows: Open Services → Look for "MongoDB"
# Or install MongoDB if not installed
```

### Issue: MongoDB Atlas connection fails
**Solutions**:
1. Check your IP is whitelisted
2. Verify username/password in connection string
3. Ensure password doesn't have special characters (or URL encode them)
4. Check internet connection

### Issue: Web viewer shows empty data
**Solution**: 
```bash
# Add some test data first
node testAuth.js
# Or register users through the app
```

---

## 📝 Summary

### For Quick Local Viewing:
```bash
node viewDatabase.js
# Open: http://localhost:3002
```

### For Production/Cloud:
1. Create MongoDB Atlas account
2. Get connection string
3. Update `.env` file
4. View data at: https://cloud.mongodb.com

### For Desktop App:
1. Download MongoDB Compass
2. Connect with connection string
3. Browse visually

**Recommended**: Start with the web viewer, then move to MongoDB Atlas for production!
