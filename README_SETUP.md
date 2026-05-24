# 🎯 SplitApp - Quick Setup Summary

## ⚡ Fastest Way to Get Started

### Option 1: Double-click `SETUP.bat` (Easiest!)
Just double-click the `SETUP.bat` file and follow the interactive guide.

### Option 2: Run PowerShell Script
```powershell
.\COMPLETE_SETUP_GUIDE.ps1
```

### Option 3: Manual Setup (3 Steps)

#### Step 1: Set up MongoDB Atlas
1. Go to https://www.mongodb.com/cloud/atlas/register
2. Create FREE account and cluster
3. Create database user: `splitapp_user` / `SplitApp2026!`
4. Whitelist IP: `0.0.0.0/0`
5. Get connection string

#### Step 2: Update .env
Replace `MONGODB_URI` in `.env` with your Atlas connection string:
```
MONGODB_URI=mongodb+srv://splitapp_user:SplitApp2026!@cluster0.xxxxx.mongodb.net/splitapp?retryWrites=true&w=majority
```

#### Step 3: Start Server
```powershell
node test-mongodb-connection.js  # Test connection
npm start                         # Start server
```

## 📊 View Your Database

### In Browser (Easiest)
```powershell
npm run view-db
```
Open: http://localhost:3002

### MongoDB Compass (Professional)
1. Download: https://www.mongodb.com/try/download/compass
2. Connect with your connection string
3. Browse `splitapp` database

## 🔧 Fix Client Install Issue

The React client install is hanging. Solutions:

```powershell
# Solution 1: Use fix script
.\fix-client-install.ps1

# Solution 2: Manual fix
cd client
Remove-Item package-lock.json -Force
npm install --legacy-peer-deps --prefer-offline

# Solution 3: Use Yarn
npm install -g yarn
cd client
yarn install
```

## 📁 Important Files

| File | Purpose |
|------|---------|
| `SETUP.bat` | Double-click to start setup |
| `COMPLETE_SETUP_GUIDE.ps1` | Interactive setup script |
| `START_HERE.md` | Detailed instructions |
| `SETUP_MONGODB_ATLAS.md` | MongoDB Atlas guide |
| `test-mongodb-connection.js` | Test database connection |
| `fix-client-install.ps1` | Fix npm install issues |
| `.env` | Configuration file |

## 🚀 Quick Commands

```powershell
# Test database connection
node test-mongodb-connection.js

# Start backend server (Port 3001)
npm start

# View database in browser (Port 3002)
npm run view-db

# Fix client install
.\fix-client-install.ps1

# Interactive setup
.\COMPLETE_SETUP_GUIDE.ps1
```

## ✅ Success Checklist

- [ ] MongoDB Atlas cluster created
- [ ] Database user created (splitapp_user)
- [ ] IP whitelisted (0.0.0.0/0)
- [ ] Connection string obtained
- [ ] .env file updated
- [ ] Connection test passed ✅
- [ ] Server starts successfully
- [ ] Database viewer works (http://localhost:3002)

## 🎯 What's Working Now

✅ **Backend Server** - Fully functional
✅ **MongoDB Atlas** - Cloud database ready
✅ **Database Viewer** - Web interface to view data
✅ **API Endpoints** - All routes working
✅ **MongoDB Compass** - Can connect and browse

⏳ **React Client** - Install may take time (optional)

## 📖 Detailed Guides

- **MongoDB Setup**: Read `SETUP_MONGODB_ATLAS.md`
- **Complete Guide**: Read `START_HERE.md`
- **API Testing**: Import `API_collection.json` to Postman

## 🆘 Common Issues

### "npm install" hanging?
- Press Ctrl+C to stop
- Run `.\fix-client-install.ps1`
- Or use Yarn: `npm install -g yarn && cd client && yarn install`

### "MongoDB connection failed"?
- Check cluster is active in Atlas
- Verify IP 0.0.0.0/0 is whitelisted
- Confirm username/password correct
- Ensure `/splitapp` is in connection string

### "Port already in use"?
```powershell
netstat -ano | findstr :3001
taskkill /PID <PID> /F
```

## 🎉 Next Steps

Once server is running:

1. **View Database**: http://localhost:3002
2. **Test APIs**: Import `API_collection.json` to Postman
3. **Create Users**: POST `/api/users/register`
4. **Create Groups**: POST `/api/group/create`
5. **Add Expenses**: POST `/api/expense/create`

## 💡 Pro Tips

- Use MongoDB Compass for advanced database management
- Use Postman for API testing
- Database viewer auto-refreshes when you click buttons
- Server logs are in `logs/` folder
- Client install can be done later - backend works independently

---

**Ready?** Double-click `SETUP.bat` or run `.\COMPLETE_SETUP_GUIDE.ps1`
