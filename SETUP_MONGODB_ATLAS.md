# MongoDB Atlas Setup Guide for SplitApp

## 🚀 Quick Setup Steps

### Step 1: Create MongoDB Atlas Account (FREE)

1. Go to [MongoDB Atlas](https://www.mongodb.com/cloud/atlas/register)
2. Sign up for a FREE account
3. Create a new cluster (choose FREE tier - M0)
4. Wait 3-5 minutes for cluster creation

### Step 2: Configure Database Access

1. In Atlas Dashboard, click **"Database Access"** (left sidebar)
2. Click **"Add New Database User"**
3. Choose **"Password"** authentication
4. Username: `splitapp_user`
5. Password: `SplitApp2026!` (or create your own secure password)
6. Database User Privileges: **"Read and write to any database"**
7. Click **"Add User"**

### Step 3: Configure Network Access

1. Click **"Network Access"** (left sidebar)
2. Click **"Add IP Address"**
3. Click **"Allow Access from Anywhere"** (for development)
4. Confirm: `0.0.0.0/0` should be added
5. Click **"Confirm"**

### Step 4: Get Connection String

1. Click **"Database"** (left sidebar)
2. Click **"Connect"** button on your cluster
3. Choose **"Connect your application"**
4. Driver: **Node.js**, Version: **4.1 or later**
5. Copy the connection string (looks like):
   ```
   mongodb+srv://splitapp_user:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority
   ```
6. Replace `<password>` with your actual password
7. Add database name before the `?`: 
   ```
   mongodb+srv://splitapp_user:SplitApp2026!@cluster0.xxxxx.mongodb.net/splitapp?retryWrites=true&w=majority
   ```

### Step 5: Update .env File

Open `.env` file and update the MONGODB_URI:

```env
PORT=3001
NODE_ENV=development
MONGODB_URI=mongodb+srv://splitapp_user:SplitApp2026!@cluster0.xxxxx.mongodb.net/splitapp?retryWrites=true&w=majority
JWT_SECRET=splitapp-secret-key-2026-secure-token-12345
ACCESS_TOKEN_SECRET=splitapp-secret-key-2026-secure-token-12345
```

## 🎯 Running the Project

### Option 1: Run Server Only (Recommended for now)

```powershell
# Start the backend server
npm start
```

The server will run on http://localhost:3001

### Option 2: View Database in Browser

```powershell
# Run the database viewer
npm run view-db
```

Then open: http://localhost:3002

### Option 3: Fix Client Install Issue

If npm install is hanging in the client folder, try:

```powershell
# Navigate to client folder
cd client

# Delete package-lock.json
Remove-Item package-lock.json -Force

# Try installing with different registry
npm install --legacy-peer-deps --registry=https://registry.npmjs.org/

# OR use yarn instead
npm install -g yarn
yarn install
```

## 🧪 Testing the Setup

### Test 1: Check Server Connection

```powershell
node testAuth.js
```

### Test 2: View Database

```powershell
npm run view-db
```

Open browser: http://localhost:3002

### Test 3: Test API Endpoints

Use the provided `API_collection.json` with Postman or Thunder Client

## 📊 MongoDB Compass Connection

1. Download [MongoDB Compass](https://www.mongodb.com/try/download/compass)
2. Open Compass
3. Paste your connection string:
   ```
   mongodb+srv://splitapp_user:SplitApp2026!@cluster0.xxxxx.mongodb.net/splitapp
   ```
4. Click **"Connect"**
5. You'll see your database: `splitapp`
6. Collections: `users`, `groups`, `expenses`, `settlements`

## 🔧 Troubleshooting

### Issue: "npm install" hangs in client folder

**Solution 1**: Use Yarn
```powershell
npm install -g yarn
cd client
yarn install
```

**Solution 2**: Clear npm cache and retry
```powershell
npm cache clean --force
Remove-Item -Recurse -Force node_modules
Remove-Item package-lock.json
npm install --legacy-peer-deps
```

**Solution 3**: Install in safe mode
```powershell
npm install --legacy-peer-deps --prefer-offline --no-audit
```

### Issue: MongoDB connection fails

- Check if IP address is whitelisted (0.0.0.0/0)
- Verify username and password are correct
- Ensure database name is in the connection string
- Check if cluster is active in Atlas dashboard

### Issue: Port already in use

```powershell
# Find process using port 3001
netstat -ano | findstr :3001

# Kill the process (replace PID with actual process ID)
taskkill /PID <PID> /F
```

## 📝 Next Steps

1. ✅ Set up MongoDB Atlas
2. ✅ Update .env file
3. ✅ Start server: `npm start`
4. ✅ View database: `npm run view-db`
5. ✅ Connect MongoDB Compass
6. 🔄 Fix client install (optional - can use API directly)

## 🎉 Success Indicators

- Server starts without errors
- Console shows: "DB Connected"
- Database viewer shows collections
- MongoDB Compass connects successfully
