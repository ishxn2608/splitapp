# 🎯 Complete Setup Guide - All URLs & Access Points

## 🌐 Your Application URLs

| Service | URL | Purpose | Status |
|---------|-----|---------|--------|
| **Frontend (Main App)** | http://localhost:3000 | Use this to access the app | ✅ Running |
| **Backend API** | http://localhost:3001 | API server (don't access directly) | ✅ Running |
| **Database Viewer** | http://localhost:3002 | View MongoDB data | ✅ Running |

---

## 🚀 Quick Start Commands

### Start Everything:
```bash
# Terminal 1: Main Application
npm run dev

# Terminal 2: Database Viewer
npm run view-db
```

### Access Points:
- **Use the app**: http://localhost:3000
- **View database**: http://localhost:3002
- **Test account**: test@example.com / Test@1234

---

## 📊 What Each URL Does

### 1. http://localhost:3000 (Frontend) ⭐
**This is what you and your friends use!**
- ✅ Login/Register
- ✅ Create groups
- ✅ Add expenses
- ✅ View balances
- ✅ Settle payments

### 2. http://localhost:3001 (Backend)
**API server - don't access directly in browser**
- ❌ Shows "Invalid path" if accessed directly
- ✅ Used by frontend to fetch data
- ✅ Test with Postman or PowerShell

### 3. http://localhost:3002 (Database Viewer)
**View your MongoDB data**
- ✅ See all users
- ✅ See all groups
- ✅ See all expenses
- ✅ Database statistics

---

## 🗄️ MongoDB Viewing Options

### Option 1: Web Viewer (Easiest) ⭐
```bash
npm run view-db
```
**Access**: http://localhost:3002

**Features**:
- Simple interface
- No installation
- View all collections
- Real-time data

### Option 2: MongoDB Atlas (Cloud) ☁️
**Best for production and sharing with friends**

**Setup Steps**:
1. Go to: https://www.mongodb.com/cloud/atlas/register
2. Create FREE account
3. Create cluster (FREE tier)
4. Get connection string
5. Update `.env`:
   ```
   MONGODB_URI=mongodb+srv://user:pass@cluster.mongodb.net/splitapp
   ```
6. Restart app

**View Data**: https://cloud.mongodb.com → Browse Collections

**Benefits**:
- ✅ Access from anywhere
- ✅ Friends can use app from their homes
- ✅ Automatic backups
- ✅ Free forever (512MB)

### Option 3: MongoDB Compass (Desktop)
**Download**: https://www.mongodb.com/try/download/compass

**Connect**:
- Local: `mongodb://localhost:27017`
- Atlas: `mongodb+srv://user:pass@cluster.mongodb.net/splitapp`

**Features**:
- Full GUI
- Query builder
- Visual aggregations
- Schema analysis

---

## 👥 How Friends Access Your App

### Current Setup (Local Network):
**Friends on same WiFi can access**:
- Main app: http://192.168.56.1:3000
- They must register first
- You add them to groups by email

### For Internet Access (Recommended):
**Deploy to cloud** so friends can access from anywhere:

#### Option A: MongoDB Atlas + Heroku
1. Setup MongoDB Atlas (see above)
2. Deploy to Heroku: https://www.heroku.com
3. Get public URL: https://your-app.herokuapp.com
4. Share with friends

#### Option B: MongoDB Atlas + Render
1. Setup MongoDB Atlas
2. Deploy to Render: https://render.com
3. Get public URL: https://your-app.onrender.com
4. Share with friends

#### Option C: MongoDB Atlas + Vercel
1. Setup MongoDB Atlas
2. Deploy to Vercel: https://vercel.com
3. Get public URL: https://your-app.vercel.app
4. Share with friends

---

## 🔧 Backend API Testing

### Using Postman (Recommended):
1. Download: https://www.postman.com/downloads/
2. Import `API_collection.json`
3. Test all endpoints
4. View formatted responses

### Using PowerShell:
```powershell
# Test Login
Invoke-WebRequest -Uri "http://localhost:3001/api/users/v1/login" `
  -Method POST `
  -ContentType "application/json" `
  -Body '{"emailId":"test@example.com","password":"Test@1234"}' `
  -UseBasicParsing

# Test Registration
Invoke-WebRequest -Uri "http://localhost:3001/api/users/v1/register" `
  -Method POST `
  -ContentType "application/json" `
  -Body '{"firstName":"John","lastName":"Doe","emailId":"john@example.com","password":"Test@1234"}' `
  -UseBasicParsing
```

### Using curl (if installed):
```bash
# Test Login
curl -X POST http://localhost:3001/api/users/v1/login \
  -H "Content-Type: application/json" \
  -d '{"emailId":"test@example.com","password":"Test@1234"}'
```

---

## 📁 Project Structure

```
SplitApp-main/
├── app.js                    # Main backend server
├── package.json              # Dependencies
├── .env                      # Environment variables
├── viewDatabase.js           # Database viewer (NEW!)
│
├── client/                   # React frontend
│   ├── src/
│   ├── public/
│   └── package.json
│
├── components/               # Backend logic
│   ├── user.js              # User operations
│   ├── group.js             # Group operations
│   └── expense.js           # Expense operations
│
├── routes/                   # API routes
│   ├── userRouter.js
│   ├── groupRouter.js
│   └── expenseRouter.js
│
├── model/                    # Database schemas
│   └── schema.js
│
├── helper/                   # Utilities
│   ├── logger.js
│   ├── validation.js
│   └── apiAuthentication.js
│
└── Documentation/            # Guides (NEW!)
    ├── HOW_IT_WORKS.md
    ├── MONGODB_GUIDE.md
    ├── VIEW_DATABASE.md
    ├── QUICK_REFERENCE.md
    └── COMPLETE_SETUP.md (this file)
```

---

## 🎯 Common Tasks

### View Database:
```bash
npm run view-db
# Open: http://localhost:3002
```

### Clear All Users:
```bash
node clearUsers.js
```

### Test Authentication:
```bash
# Register at: http://localhost:3000
# Login with: test@example.com / Test@1234
```

### Check Logs:
```bash
# View error logs
cat logs/error.log

# View app logs
cat logs/app.log
```

### Restart Everything:
```bash
# Stop all (Ctrl+C in each terminal)
# Then restart:
npm run dev          # Terminal 1
npm run view-db      # Terminal 2
```

---

## 🐛 Troubleshooting

### Issue: "Invalid path" error
**Cause**: Accessing http://localhost:3001 directly
**Solution**: Use http://localhost:3000 instead

### Issue: Can't see database
**Solution**: 
```bash
npm run view-db
# Open: http://localhost:3002
```

### Issue: Login not working
**Solution**:
```bash
node clearUsers.js
# Then register again at http://localhost:3000
```

### Issue: Port already in use
**Solution**:
```bash
# Find and kill process using the port
# Or change PORT in .env file
```

### Issue: MongoDB connection failed
**Solution**:
- Check if MongoDB is running
- Or switch to MongoDB Atlas (cloud)

---

## 📚 Documentation Files

| File | Purpose |
|------|---------|
| `HOW_IT_WORKS.md` | Complete guide on how the app works |
| `MONGODB_GUIDE.md` | Detailed MongoDB viewing guide |
| `VIEW_DATABASE.md` | Quick database viewing guide |
| `QUICK_REFERENCE.md` | Quick reference card |
| `LOGIN_FIXED.md` | Authentication fix details |
| `SETUP_GUIDE.md` | Initial setup guide |
| `COMPLETE_SETUP.md` | This file - complete overview |

---

## 🎉 Summary

### Three URLs You Need:
1. **http://localhost:3000** - Main app (use this!)
2. **http://localhost:3001** - Backend API (don't access directly)
3. **http://localhost:3002** - Database viewer (view data)

### To View MongoDB:
- **Web**: `npm run view-db` → http://localhost:3002
- **Cloud**: MongoDB Atlas → https://cloud.mongodb.com
- **Desktop**: MongoDB Compass

### To Share with Friends:
- **Local**: Same WiFi → http://192.168.56.1:3000
- **Internet**: Deploy to Heroku/Render/Vercel

**You're all set!** 🚀
