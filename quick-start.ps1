# SplitApp Quick Start Script
# This script helps you get started quickly

Write-Host "🚀 SplitApp Quick Start" -ForegroundColor Cyan
Write-Host "========================`n" -ForegroundColor Cyan

# Check if .env exists
if (Test-Path ".env") {
    Write-Host "✅ .env file found" -ForegroundColor Green
    
    # Read MongoDB URI
    $envContent = Get-Content ".env" -Raw
    if ($envContent -match "MONGODB_URI=(.+)") {
        $mongoUri = $matches[1].Trim()
        Write-Host "📊 MongoDB URI: $mongoUri`n" -ForegroundColor Yellow
        
        if ($mongoUri -like "*localhost*") {
            Write-Host "⚠️  WARNING: You're using local MongoDB" -ForegroundColor Yellow
            Write-Host "   Local MongoDB is not installed on your system." -ForegroundColor Yellow
            Write-Host "   Please set up MongoDB Atlas instead.`n" -ForegroundColor Yellow
            Write-Host "   📖 Read: SETUP_MONGODB_ATLAS.md for instructions`n" -ForegroundColor Cyan
            
            $response = Read-Host "Do you want to update to MongoDB Atlas now? (y/n)"
            if ($response -eq "y") {
                Write-Host "`n📝 Please provide your MongoDB Atlas connection string:" -ForegroundColor Cyan
                Write-Host "   Format: mongodb+srv://username:password@cluster.mongodb.net/splitapp" -ForegroundColor Gray
                $newUri = Read-Host "Connection String"
                
                if ($newUri) {
                    $envContent = $envContent -replace "MONGODB_URI=.+", "MONGODB_URI=$newUri"
                    Set-Content ".env" $envContent
                    Write-Host "✅ .env updated successfully!`n" -ForegroundColor Green
                }
            } else {
                Write-Host "`n❌ Cannot proceed without MongoDB Atlas setup" -ForegroundColor Red
                Write-Host "   Please read SETUP_MONGODB_ATLAS.md and set up MongoDB Atlas first.`n" -ForegroundColor Yellow
                exit
            }
        } else {
            Write-Host "✅ MongoDB Atlas URI detected`n" -ForegroundColor Green
        }
    }
} else {
    Write-Host "❌ .env file not found!" -ForegroundColor Red
    Write-Host "   Copying from .env.example...`n" -ForegroundColor Yellow
    Copy-Item ".env.example" ".env"
    Write-Host "✅ .env file created" -ForegroundColor Green
    Write-Host "   Please edit .env and add your MongoDB Atlas URI`n" -ForegroundColor Yellow
    exit
}

# Check server dependencies
Write-Host "🔍 Checking server dependencies..." -ForegroundColor Cyan
if (Test-Path "node_modules") {
    Write-Host "✅ Server dependencies installed`n" -ForegroundColor Green
} else {
    Write-Host "📦 Installing server dependencies..." -ForegroundColor Yellow
    npm install
    Write-Host "✅ Server dependencies installed`n" -ForegroundColor Green
}

# Menu
Write-Host "`n📋 What would you like to do?`n" -ForegroundColor Cyan
Write-Host "1. Start Backend Server (Port 3001)" -ForegroundColor White
Write-Host "2. View Database in Browser (Port 3002)" -ForegroundColor White
Write-Host "3. Fix Client Install Issue" -ForegroundColor White
Write-Host "4. Test Database Connection" -ForegroundColor White
Write-Host "5. Open MongoDB Atlas Setup Guide" -ForegroundColor White
Write-Host "6. Exit`n" -ForegroundColor White

$choice = Read-Host "Enter your choice (1-6)"

switch ($choice) {
    "1" {
        Write-Host "`n🚀 Starting Backend Server..." -ForegroundColor Cyan
        Write-Host "   Server will run on: http://localhost:3001" -ForegroundColor Yellow
        Write-Host "   Press Ctrl+C to stop`n" -ForegroundColor Gray
        npm start
    }
    "2" {
        Write-Host "`n🌐 Starting Database Viewer..." -ForegroundColor Cyan
        Write-Host "   Viewer will run on: http://localhost:3002" -ForegroundColor Yellow
        Write-Host "   Press Ctrl+C to stop`n" -ForegroundColor Gray
        npm run view-db
    }
    "3" {
        Write-Host "`n🔧 Fixing Client Install..." -ForegroundColor Cyan
        Set-Location "client"
        
        Write-Host "   Removing package-lock.json..." -ForegroundColor Yellow
        if (Test-Path "package-lock.json") {
            Remove-Item "package-lock.json" -Force
        }
        
        Write-Host "   Installing with legacy peer deps..." -ForegroundColor Yellow
        npm install --legacy-peer-deps --prefer-offline
        
        Write-Host "`n✅ Client dependencies installed!" -ForegroundColor Green
        Set-Location ".."
    }
    "4" {
        Write-Host "`n🧪 Testing Database Connection..." -ForegroundColor Cyan
        node -e "require('dotenv').config(); const mongoose = require('mongoose'); mongoose.connect(process.env.MONGODB_URI).then(() => { console.log('✅ Database connection successful!'); process.exit(0); }).catch(err => { console.error('❌ Database connection failed:', err.message); process.exit(1); });"
    }
    "5" {
        Write-Host "`n📖 Opening MongoDB Atlas Setup Guide..." -ForegroundColor Cyan
        Start-Process "SETUP_MONGODB_ATLAS.md"
    }
    "6" {
        Write-Host "`nGoodbye! 👋`n" -ForegroundColor Cyan
        exit
    }
    default {
        Write-Host "`n❌ Invalid choice. Please run the script again.`n" -ForegroundColor Red
    }
}
