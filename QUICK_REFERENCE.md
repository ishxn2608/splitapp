# 🚀 SplitApp - Quick Reference Card

## ⚠️ IMPORTANT - Access URLs

| Purpose | URL | Use? |
|---------|-----|------|
| **Frontend (Web App)** | http://localhost:3000 | ✅ **USE THIS** |
| **Backend API** | http://localhost:3001 | ❌ Don't access directly |

**The error you saw** happens when accessing port 3001 directly. Always use **port 3000**!

---

## 🔐 Test Account

Already created for you:
- **Email**: test@example.com
- **Password**: Test@1234

---

## 📋 Quick Workflow

### For You (Group Creator):
1. Login at http://localhost:3000
2. Create a group
3. Add friends by their email addresses
4. Add expenses when you pay for something
5. View who owes you

### For Your Friends:
1. Register at http://localhost:3000
2. Wait for you to add them to a group
3. View group expenses
4. Add expenses when they pay for something
5. See what they owe

---

## 🎯 Key Features

| Feature | What It Does |
|---------|--------------|
| **Groups** | Organize expenses by purpose (Trip, Roommates, etc.) |
| **Add Expense** | Record who paid and split among members |
| **Balance Sheet** | See who owes whom (automatically calculated) |
| **Settle Up** | Mark when someone pays you back |
| **Analytics** | View spending by category, month, day |

---

## 👥 Sharing with Friends

### Current Setup (Local Network):
- Friends on **same WiFi** can access: http://192.168.56.1:3000
- They must register first
- You add them to groups by email

### For Internet Access:
- Deploy to Heroku/Render/Vercel
- Get public URL
- Share with friends anywhere

---

## 🛠️ Utility Commands

```bash
# Clear all users (if needed)
node clearUsers.js

# Start the app
npm run dev

# Access the app
# Open browser: http://localhost:3000
```

---

## 🐛 Troubleshooting

| Problem | Solution |
|---------|----------|
| "Invalid path" error | Use http://localhost:3000 (not 3001) |
| Can't login | Run `node clearUsers.js` then register again |
| Email already exists | Use different email or clear database |
| Backend not working | Check if MongoDB is running |
| Friend can't access | They must be on same WiFi network |

---

## 📞 Need Help?

Check these files:
- `HOW_IT_WORKS.md` - Detailed guide
- `LOGIN_FIXED.md` - Authentication info
- `SETUP_GUIDE.md` - Setup instructions
