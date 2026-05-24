# SplitApp Setup Guide

## ✅ Current Status
- Backend Server: Running on **http://localhost:3001**
- Frontend: Running on **http://localhost:3000**
- Database: MongoDB connected successfully

## 🔐 Login/Registration Issue - FIXED!

### Problem
You were getting "email already exists" error because there was old data in the database.

### Solution Applied
All users have been cleared from the database. You can now:
1. **Register a new account** with any email
2. **Login** with your newly created credentials

## 🗄️ Database Management

### Clear All Users (if needed again)
```bash
node clearUsers.js
```

### MongoDB Connection
- Database: `splitapp`
- Connection: `mongodb://localhost:27017/splitapp`

## 🚀 Running the Application

### Start Development Servers
```bash
npm run dev
```
This runs both backend and frontend concurrently.

### Start Backend Only
```bash
npm test
```

### Start Frontend Only
```bash
cd client
npm start
```

## 📝 Test the Application

1. Open **http://localhost:3000** in your browser
2. Click "Get started" or "Sign up"
3. Register with:
   - First Name
   - Last Name (optional)
   - Email address
   - Password (min 8 chars, must include uppercase, lowercase, number, special char)
4. After registration, login with your credentials

## 🔧 Environment Variables

Located in `.env` file:
- `PORT=3001` - Backend server port
- `NODE_ENV=development` - Environment mode
- `MONGODB_URI=mongodb://localhost:27017/splitapp` - Database connection
- `ACCESS_TOKEN_SECRET=your-secret-key-here` - JWT secret for authentication

## 📌 Important Notes

- Make sure MongoDB is running on your system
- The app uses JWT tokens for authentication
- Passwords are encrypted using bcrypt
- Frontend proxies API requests to backend automatically

## 🐛 Troubleshooting

### Can't login or register?
Run: `node clearUsers.js` to clear the database

### MongoDB connection error?
Make sure MongoDB service is running on your system

### Port already in use?
Change the PORT in `.env` file
