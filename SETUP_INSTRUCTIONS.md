# SplitApp - Setup Instructions

## Quick Start Guide

### Prerequisites
- Node.js (v14 or higher)
- MongoDB Atlas account (or local MongoDB)
- Git

### Installation Steps

#### 1. Clone the Repository
```bash
git clone <your-repo-url>
cd SplitApp
```

#### 2. Install Backend Dependencies
```bash
npm install --legacy-peer-deps
```

#### 3. Install Frontend Dependencies
```bash
cd client
npm install --force
cd ..
```

#### 4. Environment Configuration
Create a `.env` file in the root directory:

```env
PORT=3001
NODE_ENV=development
MONGODB_URI=your_mongodb_atlas_connection_string
JWT_SECRET=your_jwt_secret_key
```

**To generate a JWT secret:**
```bash
node -e "console.log(require('crypto').randomBytes(256).toString('base64'));"
```

#### 5. Run the Application

**Option 1: Run Both Servers Together (Recommended)**
```bash
npm run dev
```

**Option 2: Run Separately**

Terminal 1 (Backend):
```bash
npm start
```

Terminal 2 (Frontend):
```bash
cd client
npm start
```

### Access the Application
- **Frontend:** http://localhost:3000
- **Backend API:** http://localhost:3001

## Troubleshooting

### Windows Users - Node Modules Issues
If you encounter `ENOTEMPTY` or module errors on Windows:

1. **Clean install:**
```bash
# Backend
rmdir /s /q node_modules
del package-lock.json
npm install --legacy-peer-deps

# Frontend
cd client
rmdir /s /q node_modules
del package-lock.json
npm install --force
```

2. **Run with administrator privileges** or close any file explorers/IDEs that might be locking files

3. **Use PowerShell instead of CMD** for better compatibility

### Common Issues

**Issue: MongoDB Connection Error**
- Ensure MongoDB Atlas is accessible
- Check your IP whitelist in MongoDB Atlas
- Verify connection string in `.env`

**Issue: Port Already in Use**
- Change PORT in `.env` file
- Kill existing processes: `npx kill-port 3001 3000`

**Issue: React Scripts Not Found**
- Run: `cd client && npm install --force`

## Project Structure
```
SplitApp/
├── client/              # React frontend
│   ├── public/
│   ├── src/
│   └── package.json
├── model/               # MongoDB schemas
├── routes/              # Express routes
├── helper/              # Utility functions
├── app.js               # Express server
├── package.json         # Backend dependencies
└── .env                 # Environment variables (create this)
```

## Scripts

- `npm start` - Run backend in production mode
- `npm test` - Run backend with nodemon (development)
- `npm run dev` - Run both frontend and backend concurrently
- `npm run heroku-postbuild` - Build for deployment

## Deployment

### Deploy to Render/Heroku
1. Set environment variables in platform dashboard
2. Push to GitHub
3. Connect repository to Render/Heroku
4. Deploy!

## Support
For issues, please create a GitHub issue or contact the maintainer.
