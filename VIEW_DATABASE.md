# 🗄️ Quick Guide: View Your MongoDB Database

## 🚀 Fastest Way - Web Viewer

### Start the Database Viewer:
```bash
npm run view-db
```

### Access in Browser:
Open: **http://localhost:3002**

### What You Can See:
- 👥 **Users** - All registered users
- 📁 **Groups** - All expense groups
- 💰 **Expenses** - All expenses added
- ✅ **Settlements** - Payment settlements
- 📊 **Statistics** - Database overview

---

## 🎯 Three Ways to View MongoDB

### 1. Web Viewer (Easiest) ⭐
```bash
npm run view-db
```
- ✅ No installation needed
- ✅ Simple interface
- ✅ Works in browser
- 📍 URL: http://localhost:3002

### 2. MongoDB Atlas (Cloud) ☁️
- ✅ Access from anywhere
- ✅ Free tier available
- ✅ Built-in web interface
- 📍 URL: https://cloud.mongodb.com

**Setup**: See `MONGODB_GUIDE.md` for detailed instructions

### 3. MongoDB Compass (Desktop) 💻
- ✅ Full-featured GUI
- ✅ Visual query builder
- ✅ Works offline
- 📥 Download: https://www.mongodb.com/try/download/compass

---

## 📊 View Backend API Responses

### Your Backend API:
- **URL**: http://localhost:3001/api
- **Note**: This is for API calls, not direct browser viewing

### Test APIs with Postman:
1. Download Postman: https://www.postman.com/downloads/
2. Import `API_collection.json` from your project
3. Test all endpoints
4. View formatted responses

### Test APIs with PowerShell:
```powershell
# Login API
Invoke-WebRequest -Uri "http://localhost:3001/api/users/v1/login" `
  -Method POST `
  -ContentType "application/json" `
  -Body '{"emailId":"test@example.com","password":"Test@1234"}' `
  -UseBasicParsing
```

---

## 🌐 MongoDB Atlas Setup (5 Minutes)

### Why Use MongoDB Atlas?
- ✅ Your friends can access the app from anywhere
- ✅ No need to run local MongoDB
- ✅ Automatic backups
- ✅ Free forever (512MB)

### Quick Setup:
1. **Sign up**: https://www.mongodb.com/cloud/atlas/register
2. **Create cluster** (choose FREE tier)
3. **Create database user**
4. **Whitelist IP** (allow from anywhere)
5. **Get connection string**
6. **Update .env**:
   ```
   MONGODB_URI=mongodb+srv://user:pass@cluster.mongodb.net/splitapp
   ```
7. **Restart app**: `npm run dev`

**Detailed guide**: See `MONGODB_GUIDE.md`

---

## 🎬 Quick Demo

### Step 1: Start Everything
```bash
# Terminal 1: Main app
npm run dev

# Terminal 2: Database viewer
npm run view-db
```

### Step 2: Open Browsers
- **Main App**: http://localhost:3000
- **Database Viewer**: http://localhost:3002

### Step 3: Test It
1. Register a user at http://localhost:3000
2. Refresh http://localhost:3002
3. Click "View Users" - you'll see your new user!

---

## 📱 Screenshots of What You'll See

### Web Viewer Interface:
```
┌─────────────────────────────────────────┐
│     🗄️ MongoDB Database Viewer          │
├─────────────────────────────────────────┤
│  [👥 Users] [📁 Groups] [💰 Expenses]   │
│  [✅ Settlements] [📊 Stats]             │
├─────────────────────────────────────────┤
│  Total Records: 5                       │
│  ┌──────────────────────────────────┐  │
│  │ _id    │ firstName │ emailId     │  │
│  │ 6a04.. │ Test      │ test@ex..   │  │
│  │ 7b15.. │ John      │ john@ex..   │  │
│  └──────────────────────────────────┘  │
└─────────────────────────────────────────┘
```

### MongoDB Atlas Interface:
```
┌─────────────────────────────────────────┐
│  MongoDB Atlas                          │
├─────────────────────────────────────────┤
│  📊 Cluster0                            │
│    └─ splitapp (database)               │
│       ├─ users (5 documents)            │
│       ├─ groups (3 documents)           │
│       ├─ expenses (12 documents)        │
│       └─ settlements (2 documents)      │
└─────────────────────────────────────────┘
```

---

## 🔧 Troubleshooting

### Web Viewer Not Working?
```bash
# Make sure MongoDB is running
# Check if port 3002 is free
# Try: http://127.0.0.1:3002
```

### Can't See Data?
```bash
# Add test data first
node clearUsers.js
# Then register at http://localhost:3000
```

### Backend Shows "Invalid path"?
- ✅ Use http://localhost:3000 (frontend)
- ❌ Don't use http://localhost:3001 directly in browser

---

## 📚 More Information

- **Complete MongoDB Guide**: `MONGODB_GUIDE.md`
- **How the App Works**: `HOW_IT_WORKS.md`
- **Quick Reference**: `QUICK_REFERENCE.md`

---

## 🎉 Summary

### To View Database:
```bash
npm run view-db
# Open: http://localhost:3002
```

### To Use Cloud Database:
1. Create MongoDB Atlas account
2. Get connection string
3. Update `.env`
4. View at: https://cloud.mongodb.com

**That's it!** You can now see all your data! 🚀
