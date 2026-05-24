# 📱 SplitApp - How It Works

## 🎯 What is SplitApp?

SplitApp is a **group expense splitting application** (like Splitwise) that helps you and your friends track shared expenses and automatically calculates who owes whom.

---

## 🚀 Quick Start Guide

### ⚠️ IMPORTANT: Access the Right URL!

- ✅ **Frontend (Use This)**: http://localhost:3000
- ❌ **Backend API (Don't use directly)**: http://localhost:3001

**The error you saw** (`{"status":"fail","message":"Invalid path"}`) happens when you try to access the backend API directly in your browser. Always use **http://localhost:3000** instead!

---

## 👥 How You and Your Friends Use It

### Step 1: Everyone Creates an Account
1. Each person goes to **http://localhost:3000**
2. Click "Get started" or "Sign up"
3. Register with:
   - First Name
   - Last Name (optional)
   - Email address
   - Password (min 8 chars, uppercase, lowercase, number, special char)

### Step 2: Create a Group
1. **You** login and create a group (e.g., "Roommates", "Trip to Goa", "Office Lunch")
2. Add group details:
   - Group Name
   - Description
   - Currency (INR, USD, EUR)
   - Category (Trip, Home, Office, etc.)

### Step 3: Add Friends to the Group
1. Click on your group
2. Click "Add Members" or "Edit Group"
3. **Enter your friends' email addresses** (they must be registered)
4. Save the group

### Step 4: Add Expenses
**Anyone in the group can add expenses!**

When someone pays for something:
1. Click "Add Expense"
2. Fill in:
   - **Expense Name**: "Dinner at restaurant"
   - **Amount**: 1200
   - **Paid by**: Who paid (you or a friend)
   - **Split between**: Select which members to split with
   - **Category**: Food, Transport, Entertainment, etc.
   - **Date**: When the expense occurred

### Step 5: View Who Owes Whom
The app **automatically calculates** the split:
- If you paid ₹1200 for dinner with 3 friends
- Each person owes ₹300
- The app shows: "Friend A owes you ₹300", "Friend B owes you ₹300", etc.

### Step 6: Settle Up
When a friend pays you back:
1. Click "Settle Up"
2. Select who paid whom
3. Enter the amount
4. The balance updates automatically

---

## 🔑 Key Features

### 1. **Multiple Groups**
- Create unlimited groups
- Each group has its own expenses and balances
- Examples: "Roommates", "College Friends", "Family Trip"

### 2. **Shared Access**
- **All group members can:**
  - ✅ View all expenses in the group
  - ✅ Add new expenses
  - ✅ Edit expenses they created
  - ✅ See who owes whom
  - ✅ Mark settlements

### 3. **Automatic Split Calculation**
- The app automatically divides expenses equally
- Tracks running balances
- Shows simplified settlements (who should pay whom)

### 4. **Expense Categories**
- Food & Drinks
- Transportation
- Entertainment
- Shopping
- Utilities
- Others

### 5. **Analytics & Reports**
- View expenses by category
- Monthly expense trends
- Daily expense tracking
- Total group spending

### 6. **Settlement Tracking**
- Mark when someone pays you back
- Balances update automatically
- Settlement history maintained

---

## 📊 Example Scenario

### Scenario: Weekend Trip with 3 Friends

**Group Members:**
- You (you@example.com)
- Friend A (frienda@example.com)
- Friend B (friendb@example.com)
- Friend C (friendc@example.com)

**Expenses:**

1. **You paid for hotel**: ₹4000
   - Split between: All 4 people
   - Each person's share: ₹1000
   - **Result**: Friend A, B, C each owe you ₹1000

2. **Friend A paid for dinner**: ₹1200
   - Split between: All 4 people
   - Each person's share: ₹300
   - **Result**: You, Friend B, C each owe Friend A ₹300

3. **Friend B paid for transport**: ₹800
   - Split between: All 4 people
   - Each person's share: ₹200
   - **Result**: You, Friend A, C each owe Friend B ₹200

**Final Balance (Simplified):**
The app calculates the optimal way to settle:
- Friend C owes you ₹500
- Friend B owes you ₹500
- You owe Friend A ₹0 (balanced out)

---

## 🔐 Privacy & Access Control

### What Friends Can See:
- ✅ All expenses in groups they're members of
- ✅ Group balances and settlements
- ✅ Other members' names and emails (in the group)

### What Friends CANNOT See:
- ❌ Your other groups (where they're not members)
- ❌ Your personal account details
- ❌ Groups they haven't been added to

### Editing Permissions:
- Users can **edit/delete** expenses they created
- Group owner can **edit group details** and **add/remove members**
- All members can **add new expenses**

---

## 📱 How Friends Access the App

### Option 1: Local Development (Current Setup)
**Only works on your local network:**
1. Friends must be on the **same WiFi network** as you
2. They access: **http://192.168.56.1:3000** (your network IP)
3. They register and you add them to groups

### Option 2: Deploy Online (Recommended for Real Use)
To let friends access from anywhere:
1. Deploy to a hosting service (Heroku, Render, Vercel, etc.)
2. Get a public URL (e.g., https://your-splitapp.herokuapp.com)
3. Share the URL with friends
4. They register and you add them to groups

---

## 🛠️ Common Questions

### Q: Can friends edit my expenses?
**A:** No, only the person who created an expense can edit/delete it.

### Q: How do I add a friend to a group?
**A:** 
1. Friend must register first
2. Go to your group → Edit Group
3. Add their email address
4. Save

### Q: Can I have multiple groups?
**A:** Yes! Create unlimited groups for different purposes.

### Q: What if someone doesn't have an account?
**A:** They must register first at http://localhost:3000 before you can add them to a group.

### Q: How does the split calculation work?
**A:** 
- Expense amount ÷ Number of people = Each person's share
- The app tracks who paid and who owes
- Automatically simplifies settlements

### Q: Can I split expenses unequally?
**A:** Currently, the app splits equally among selected members. Unequal splits would require code modification.

---

## 🎨 User Interface Overview

### Dashboard
- View all your groups
- Recent expenses
- Total balance (what you owe / what you're owed)
- Quick actions

### Group View
- Group details and members
- All expenses in the group
- Balance sheet (who owes whom)
- Add expense button
- Settle up button

### Expense View
- Expense details
- Who paid
- Who it's split between
- Category and date
- Edit/Delete options (if you created it)

---

## 🔧 Technical Details

### API Endpoints (For Developers)

**User APIs:**
- `POST /api/users/v1/register` - Register new user
- `POST /api/users/v1/login` - Login
- `GET /api/users/v1/emailList` - Get all user emails

**Group APIs:**
- `POST /api/group/v1/create` - Create group
- `POST /api/group/v1/view` - View group details
- `POST /api/group/v1/edit` - Edit group
- `POST /api/group/v1/findUserGroup` - Get user's groups
- `POST /api/group/v1/balanceSheet` - Get who owes whom

**Expense APIs:**
- `POST /api/expense/v1/add` - Add expense
- `POST /api/expense/v1/edit` - Edit expense
- `POST /api/expense/v1/delete` - Delete expense
- `POST /api/expense/v1/viewGroupExpense` - View all group expenses
- `POST /api/expense/v1/viewUserExpense` - View user's expenses

---

## 🎉 Summary

1. **Everyone registers** their own account
2. **You create groups** and add friends by email
3. **Anyone can add expenses** to the group
4. **App automatically calculates** who owes whom
5. **Mark settlements** when friends pay you back
6. **View analytics** and expense history

**Remember**: Always use **http://localhost:3000** (not 3001) to access the app!
