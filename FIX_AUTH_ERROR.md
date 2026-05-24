# 🔧 Fix Authentication Error

## ❌ Error: "bad auth: authentication failed"

This means your MongoDB Atlas username or password is incorrect.

---

## 🚀 Quick Fix (2 Options)

### **Option 1: Use Fix Script (Easiest)** ⭐

```powershell
.\fix-mongodb-auth.ps1
```

This interactive script will:
1. Guide you to MongoDB Atlas
2. Help you create/update the user
3. Ask for correct credentials
4. Update .env automatically
5. Test the connection
6. Start the server!

---

### **Option 2: Manual Fix**

#### Step 1: Go to MongoDB Atlas

Open: https://cloud.mongodb.com/

#### Step 2: Check/Create Database User

1. Click **"Database Access"** in left sidebar
2. Look for user **"splitapp_user"**

**If user EXISTS:**
- Click **"Edit"**
- Click **"Edit Password"**
- Set a new password (remember it!)
- Click **"Update User"**

**If user DOESN'T EXIST:**
- Click **"Add New Database User"**
- Authentication Method: **Password**
- Username: **splitapp_user** (or any name you want)
- Password: Create a strong password
- Database User Privileges: **"Atlas admin"** or **"Read and write to any database"**
- Click **"Add User"**

#### Step 3: Whitelist Your IP

1. Click **"Network Access"** in left sidebar
2. Click **"Add IP Address"**
3. Click **"Allow Access from Anywhere"**
4. Confirm **0.0.0.0/0** is added
5. Click **"Confirm"**

#### Step 4: Update .env File

Open `.env` file and update the connection string with your **actual** username and password:

```env
MONGODB_URI=mongodb+srv://YOUR_USERNAME:YOUR_PASSWORD@scanxqr.i0edxrb.mongodb.net/splitapp?retryWrites=true&w=majority&appName=ScanxQR
```

**Example:**
```env
MONGODB_URI=mongodb+srv://splitapp_user:MyRealPassword456@scanxqr.i0edxrb.mongodb.net/splitapp?retryWrites=true&w=majority&appName=ScanxQR
```

**⚠️ Important:** If your password has special characters like `@`, `#`, `$`, etc., you need to URL encode them:

| Character | Encoded |
|-----------|---------|
| @ | %40 |
| # | %23 |
| $ | %24 |
| % | %25 |
| & | %26 |
| + | %2B |
| / | %2F |
| : | %3A |

**Example with special chars:**
- Password: `Pass@123#`
- Encoded: `Pass%40123%23`

#### Step 5: Test Connection

```powershell
node test-mongodb-connection.js
```

**Expected Output:**
```
✅ SUCCESS! MongoDB connection established!
📦 Database: splitapp
🌐 Host: scanxqr.i0edxrb.mongodb.net
```

#### Step 6: Start Server

```powershell
npm start
```

---

## 🎯 Common Issues

### Issue 1: "User doesn't exist"

**Solution:** Create the user in MongoDB Atlas → Database Access

### Issue 2: "Password is wrong"

**Solution:** Reset password in MongoDB Atlas → Database Access → Edit User → Edit Password

### Issue 3: "IP not whitelisted"

**Solution:** Add 0.0.0.0/0 in MongoDB Atlas → Network Access

### Issue 4: "Cluster is paused"

**Solution:** Resume cluster in MongoDB Atlas → Database → Click "Resume"

### Issue 5: "Special characters in password"

**Solution:** URL encode the password or use a simpler password without special characters

---

## 📝 Recommended Password

Use a password without special characters to avoid encoding issues:

✅ Good passwords:
- `SplitApp2026`
- `MyPassword123`
- `SecurePass456`

❌ Avoid (requires encoding):
- `Pass@word123`
- `My#Pass$word`
- `Test&123!`

---

## 🚀 Quick Commands

```powershell
# Fix authentication (interactive)
.\fix-mongodb-auth.ps1

# Test connection
node test-mongodb-connection.js

# Start server
npm start

# View database
npm run view-db
```

---

## ✅ Success Checklist

- [ ] User exists in MongoDB Atlas (Database Access)
- [ ] Password is correct (no typos!)
- [ ] IP 0.0.0.0/0 is whitelisted (Network Access)
- [ ] Cluster is active (not paused)
- [ ] .env file updated with correct credentials
- [ ] Connection test passed ✅
- [ ] Server starts successfully

---

## 🆘 Still Not Working?

1. **Double-check username** in MongoDB Atlas → Database Access
2. **Reset password** and use a simple one (no special chars)
3. **Wait 1-2 minutes** after creating user (propagation time)
4. **Check cluster status** - make sure it's not paused
5. **Verify connection string** - make sure database name is included

---

**👉 EASIEST WAY: Run `.\fix-mongodb-auth.ps1`**
