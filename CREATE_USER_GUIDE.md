# 📖 Create MongoDB Atlas User - Visual Guide

## 🎯 Goal
Create a database user with username `admin` and password `admin123`

---

## Step 1: Open MongoDB Atlas

Go to: **https://cloud.mongodb.com/**

Login with your account.

---

## Step 2: Navigate to Database Access

Look at the **left sidebar** and click on:

```
🔐 Database Access
```

---

## Step 3: Add New Database User

Click the green button that says:

```
+ ADD NEW DATABASE USER
```

---

## Step 4: Fill in User Details

You'll see a form. Fill it in exactly like this:

### Authentication Method
- Select: **Password** (should be selected by default)

### Username
```
admin
```

### Password
```
admin123
```

### Database User Privileges
- Click the dropdown
- Select: **Atlas admin**

(This gives full access to the database)

### Temporary User
- Leave unchecked

---

## Step 5: Add User

Click the button at the bottom:

```
Add User
```

Wait a few seconds. You should see a success message.

---

## Step 6: Whitelist IP Address

Now click on **Network Access** in the left sidebar:

```
🌐 Network Access
```

---

## Step 7: Add IP Address

Click the green button:

```
+ ADD IP ADDRESS
```

---

## Step 8: Allow Access from Anywhere

In the popup:

1. Click the button that says: **ALLOW ACCESS FROM ANYWHERE**
2. You'll see: `0.0.0.0/0` appear in the box
3. Click: **Confirm**

---

## Step 9: Verify Setup

You should now see:

### In Database Access:
- User: `admin`
- Authentication Method: `SCRAM`
- Database User Privileges: `atlasAdmin@admin`

### In Network Access:
- IP Address: `0.0.0.0/0` (Allows access from anywhere)
- Status: `Active` (green)

---

## Step 10: Test Connection

Go back to PowerShell and run:

```powershell
node test-mongodb-connection.js
```

**Expected Output:**
```
✅ SUCCESS! MongoDB connection established!
📦 Database: splitapp
🌐 Host: scanxqr.i0edxrb.mongodb.net
```

---

## Step 11: Start Server

```powershell
npm start
```

**Expected Output:**
```
Server started in PORT | 3001
DB Connected
```

---

## Step 12: View Database

```powershell
npm run view-db
```

Opens: **http://localhost:3002**

---

## ✅ Success!

Your SplitApp is now running with MongoDB Atlas!

---

## 🔄 If You Want Different Credentials

If you used a different username or password, update `.env` file:

```powershell
notepad .env
```

Change this line:
```
MONGODB_URI=mongodb+srv://YOUR_USERNAME:YOUR_PASSWORD@scanxqr.i0edxrb.mongodb.net/splitapp?retryWrites=true&w=majority&appName=ScanxQR
```

Replace `YOUR_USERNAME` and `YOUR_PASSWORD` with your actual credentials.

---

## 🆘 Troubleshooting

### "User already exists"
- Use a different username, or
- Edit the existing user and change the password

### "IP not whitelisted"
- Make sure you added `0.0.0.0/0` in Network Access
- Wait 1-2 minutes for changes to propagate

### "Cluster paused"
- Go to Database → Click your cluster → Click "Resume"

### "Still getting auth error"
- Double-check username and password (no typos!)
- Make sure user has "Atlas admin" role
- Wait 1-2 minutes after creating user

---

## 📝 Current Setup

Your `.env` file is configured with:
- Username: `admin`
- Password: `admin123`
- Database: `splitapp`
- Cluster: `scanxqr.i0edxrb.mongodb.net`

Make sure these match what you created in MongoDB Atlas!

---

**👉 Next: Run `node test-mongodb-connection.js`**
