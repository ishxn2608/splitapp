# 🚀 START HERE - SplitApp Setup

## ⚠️ Current Issues

1. **npm install hanging in client folder** - This is a common Windows issue with large React projects
2. **MongoDB not installed locally** - We'll use MongoDB Atlas (cloud) instead

## ✅ Quick Solution (3 Steps)

### Step 1: Set Up MongoDB Atlas (5 minutes)

MongoDB Atlas is a FREE cloud database. No local installation needed!

1. **Create Account**: Go to https://www.mongodb.com/cloud/atlas/register
2. **Create Cluster**: 
   - Choose FREE tier (M0)
   - Select a region close to you
   - Wait 3-5 minutes for creation
3. **Create Database User**:
   - Go to "Database Access"
   - Add user: `splitapp_user`
   - Password: `SplitApp2026!`
   - Role: "Read and write to any database"
4. **Whitelist IP**:
   - Go to "Network Access"
   - Add IP: `0.0.0.0/0` (Allow from anywhere)
5. **Get Connection String**:
   - Go to "Database" → Click "Connect"
   - Choose "Connect your application"
   - Copy the connection string
   - It looks like: `mongodb+srv://splitapp_user:SplitApp2026!@cluster0.xxxxx.mongodb.net/splitapp?retryWrites=true&w=majority`

📖 **Detailed Guide**: See `SETUP_MONGODB_ATLAS.md`

### Step 2: Update .env File

Open `.env` file and replace the MONGODB_URI line:

**Change from:**
```
MONGODB_URI=mongodb://localhost:27017/splitapp
```

**Change to:** (use YOUR connection string from Atlas)
```
MONGODB_URI=mongodb+srv://splitapp_user:SplitApp2026!@cluster0.xxxxx.mongodb.net/splitapp?retryWrites=true&w=majority
```

### Step 3: Start the Server

Open PowerShell in this folder and run:

```powershell
# Test MongoDB connection
node test-mongodb-connection.js

# If successful, start the server
npm start
```

Server will run on: **http://localhost:3001**

## 🎯 View Your Database

### Option 1: Web Browser (Easiest)

```powershell
npm run view-db
```

Then open: **http://localhost:3002**

You'll see a beautiful web interface showing:
- 👥 Users
- 📁 Groups  
- 💰 Expenses
- ✅ Settlements

### Option 2: MongoDB Compass (Professional Tool)

1. Download: https://www.mongodb.com/try/download/compass
2. Install and open
3. Paste your connection string
4. Click "Connect"
5. Browse your `splitapp` database

## 🔧 Fix Client Install (Optional)

The client install is hanging. Here are solutions:

### Solution 1: Use the Fix Script

```powershell
.\fix-client-install.ps1
```

### Solution 2: Manual Fix

```powershell
cd client
Remove-Item package-lock.json -Force
npm install --legacy-peer-deps --prefer-offline --no-audit
```

### Solution 3: Use Yarn Instead

```powershell
npm install -g yarn
cd client
yarn install
```

### Solution 4: Skip Client for Now

You can use the backend API directly with:
- Postman (import `API_collection.json`)
- Thunder Client (VS Code extension)
- Any REST client

## 📋 Quick Commands

```powershell
# Test database connection
node test-mongodb-connection.js

# Start backend server
npm start

# View database in browser
npm run view-db

# Run interactive setup
.\quick-start.ps1

# Fix client install
.\fix-client-install.ps1
```

## 🧪 Test the Setup

### Test 1: Database Connection
```powershell
node test-mongodb-connection.js
```
Expected: ✅ SUCCESS! MongoDB connection established!

### Test 2: Start Server
```powershell
npm start
```
Expected: 
- Server started in PORT | 3001
- DB Connected

### Test 3: View Database
```powershell
npm run view-db
```
Expected: Opens http://localhost:3002 with database viewer

## 📊 Project Structure

```
SplitApp/
├── app.js                          # Main server file
├── model/schema.js                 # MongoDB schemas
├── routes/                         # API routes
│   ├── userRouter.js
│   ├── groupRouter.js
│   └── expenseRouter.js
├── components/                     # Business logic
├── helper/                         # Utilities
├── viewDatabase.js                 # Database viewer
├── test-mongodb-connection.js      # Connection tester
├── client/                         # React frontend
└── .env                           # Configuration

```

## 🎉 Success Checklist

- [ ] MongoDB Atlas cluster created
- [ ] Database user created
- [ ] IP whitelisted (0.0.0.0/0)
- [ ] Connection string copied
- [ ] .env file updated
- [ ] Connection test passed
- [ ] Server starts successfully
- [ ] Database viewer works
- [ ] MongoDB Compass connected (optional)
- [ ] Client installed (optional)

## ❓ Troubleshooting

### "npm install" still hanging?

**Quick Fix**: Press `Ctrl+C` to stop it, then:
```powershell
cd client
npm install --legacy-peer-deps --prefer-offline --progress=false
```

If still hanging after 10 minutes, use Yarn:
```powershell
npm install -g yarn
yarn install
```

### "MongoDB connection failed"?

1. Check if cluster is active in Atlas dashboard
2. Verify IP is whitelisted: 0.0.0.0/0
3. Confirm username/password are correct
4. Ensure database name is in connection string: `/splitapp?`

### "Port 3001 already in use"?

```powershell
# Find and kill the process
netstat -ano | findstr :3001
taskkill /PID <PID> /F
```

## 📚 Additional Resources

- `SETUP_MONGODB_ATLAS.md` - Detailed MongoDB Atlas setup
- `API_collection.json` - Postman API collection
- `MONGODB_GUIDE.md` - MongoDB usage guide
- `VIEW_DATABASE.md` - Database viewer guide

## 🆘 Need Help?

1. Read `SETUP_MONGODB_ATLAS.md` for detailed MongoDB setup
2. Run `.\quick-start.ps1` for interactive setup
3. Check logs in `logs/` folder for errors

## 🎯 Next Steps

Once server is running:

1. **Test APIs**: Import `API_collection.json` into Postman
2. **Create Users**: POST to `/api/users/register`
3. **Create Groups**: POST to `/api/group/create`
4. **Add Expenses**: POST to `/api/expense/create`
5. **View in Browser**: http://localhost:3002

---

**Ready to start?** Run: `.\quick-start.ps1`
