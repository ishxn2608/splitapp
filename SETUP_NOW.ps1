# Immediate Setup Script - Get SplitApp Running NOW
# This script will guide you through MongoDB Atlas setup

Clear-Host

Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                                ║" -ForegroundColor Cyan
Write-Host "║         🚀 SPLITAPP - IMMEDIATE SETUP WIZARD 🚀               ║" -ForegroundColor Cyan
Write-Host "║                                                                ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

Write-Host "This wizard will:" -ForegroundColor Yellow
Write-Host "  1. Help you set up MongoDB Atlas (FREE cloud database)" -ForegroundColor White
Write-Host "  2. Configure your .env file" -ForegroundColor White
Write-Host "  3. Test the connection" -ForegroundColor White
Write-Host "  4. Start your server`n" -ForegroundColor White

# Check if user already has MongoDB Atlas
Write-Host "═══════════════════════════════════════════════════════════════`n" -ForegroundColor Gray
Write-Host "❓ Do you already have a MongoDB Atlas account?" -ForegroundColor Yellow
Write-Host "   (If you don't know, answer 'n')`n" -ForegroundColor Gray

$hasAccount = Read-Host "Do you have MongoDB Atlas? (y/n)"

if ($hasAccount -ne "y") {
    Write-Host "`n📋 STEP 1: Create MongoDB Atlas Account (2 minutes)`n" -ForegroundColor Cyan
    Write-Host "I'm opening MongoDB Atlas registration in your browser..." -ForegroundColor Yellow
    Start-Sleep -Seconds 2
    Start-Process "https://www.mongodb.com/cloud/atlas/register"
    
    Write-Host "`n📝 Follow these steps in the browser:`n" -ForegroundColor Yellow
    Write-Host "  1. Sign up with Google/Email (FREE - no credit card)" -ForegroundColor White
    Write-Host "  2. Choose 'M0 FREE' tier" -ForegroundColor White
    Write-Host "  3. Select a cloud provider (AWS recommended)" -ForegroundColor White
    Write-Host "  4. Choose a region close to you" -ForegroundColor White
    Write-Host "  5. Click 'Create Cluster' (wait 3-5 minutes)`n" -ForegroundColor White
    
    Write-Host "Press Enter when your cluster is created..." -ForegroundColor Green
    Read-Host
}

Write-Host "`n📋 STEP 2: Create Database User`n" -ForegroundColor Cyan
Write-Host "In MongoDB Atlas Dashboard:" -ForegroundColor Yellow
Write-Host "  1. Click 'Database Access' (left sidebar)" -ForegroundColor White
Write-Host "  2. Click 'Add New Database User'" -ForegroundColor White
Write-Host "  3. Authentication Method: Password" -ForegroundColor White
Write-Host "`n  Suggested credentials:" -ForegroundColor Gray
Write-Host "     Username: splitapp_user" -ForegroundColor Green
Write-Host "     Password: SplitApp2026!" -ForegroundColor Green
Write-Host "`n  4. Database User Privileges: 'Atlas admin' or 'Read and write to any database'" -ForegroundColor White
Write-Host "  5. Click 'Add User'`n" -ForegroundColor White

Write-Host "Press Enter when user is created..." -ForegroundColor Green
Read-Host

Write-Host "`n📋 STEP 3: Whitelist Your IP Address`n" -ForegroundColor Cyan
Write-Host "In MongoDB Atlas Dashboard:" -ForegroundColor Yellow
Write-Host "  1. Click 'Network Access' (left sidebar)" -ForegroundColor White
Write-Host "  2. Click 'Add IP Address'" -ForegroundColor White
Write-Host "  3. Click 'Allow Access from Anywhere'" -ForegroundColor White
Write-Host "  4. Confirm that 0.0.0.0/0 is added" -ForegroundColor White
Write-Host "  5. Click 'Confirm'`n" -ForegroundColor White

Write-Host "Press Enter when IP is whitelisted..." -ForegroundColor Green
Read-Host

Write-Host "`n📋 STEP 4: Get Your Connection String`n" -ForegroundColor Cyan
Write-Host "In MongoDB Atlas Dashboard:" -ForegroundColor Yellow
Write-Host "  1. Click 'Database' (left sidebar)" -ForegroundColor White
Write-Host "  2. Click 'Connect' button on your cluster" -ForegroundColor White
Write-Host "  3. Choose 'Connect your application'" -ForegroundColor White
Write-Host "  4. Driver: Node.js, Version: 4.1 or later" -ForegroundColor White
Write-Host "  5. Copy the connection string`n" -ForegroundColor White

Write-Host "Example format:" -ForegroundColor Gray
Write-Host "mongodb+srv://splitapp_user:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority`n" -ForegroundColor Gray

Write-Host "⚠️  IMPORTANT: Replace <password> with your actual password!" -ForegroundColor Yellow
Write-Host "⚠️  Add '/splitapp' before the '?' in the connection string`n" -ForegroundColor Yellow

Write-Host "Example after editing:" -ForegroundColor Gray
Write-Host "mongodb+srv://splitapp_user:SplitApp2026!@cluster0.xxxxx.mongodb.net/splitapp?retryWrites=true&w=majority`n" -ForegroundColor Green

Write-Host "═══════════════════════════════════════════════════════════════`n" -ForegroundColor Gray

Write-Host "📝 Paste your COMPLETE connection string here:" -ForegroundColor Cyan
$connectionString = Read-Host "Connection String"

# Validate
if ([string]::IsNullOrWhiteSpace($connectionString)) {
    Write-Host "`n❌ No connection string provided! Please run this script again.`n" -ForegroundColor Red
    exit 1
}

if ($connectionString -notlike "*mongodb*") {
    Write-Host "`n❌ Invalid connection string! It should start with 'mongodb+srv://' or 'mongodb://'`n" -ForegroundColor Red
    exit 1
}

# Add database name if missing
if ($connectionString -notlike "*/splitapp*") {
    Write-Host "`n⚠️  Adding '/splitapp' to connection string..." -ForegroundColor Yellow
    if ($connectionString -like "*?*") {
        $connectionString = $connectionString -replace "\?", "/splitapp?"
    } else {
        $connectionString = $connectionString + "/splitapp"
    }
    Write-Host "✅ Updated: $connectionString`n" -ForegroundColor Green
}

# Update .env file
Write-Host "📝 Updating .env file..." -ForegroundColor Cyan

$envContent = @"
PORT=3001
NODE_ENV=development
MONGODB_URI=$connectionString
JWT_SECRET=splitapp-secret-key-2026-secure-token-12345
ACCESS_TOKEN_SECRET=splitapp-secret-key-2026-secure-token-12345
"@

Set-Content ".env" $envContent
Write-Host "✅ .env file updated!`n" -ForegroundColor Green

# Test connection
Write-Host "═══════════════════════════════════════════════════════════════`n" -ForegroundColor Gray
Write-Host "🧪 Testing MongoDB connection..." -ForegroundColor Cyan
Write-Host "Please wait...`n" -ForegroundColor Yellow

$testOutput = node test-mongodb-connection.js 2>&1
Write-Host $testOutput

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║                                                                ║" -ForegroundColor Green
    Write-Host "║              ✅ DATABASE CONNECTION SUCCESSFUL! ✅              ║" -ForegroundColor Green
    Write-Host "║                                                                ║" -ForegroundColor Green
    Write-Host "╚════════════════════════════════════════════════════════════════╝`n" -ForegroundColor Green
    
    Write-Host "🎉 Your MongoDB Atlas database is connected!`n" -ForegroundColor Green
    
    Write-Host "═══════════════════════════════════════════════════════════════`n" -ForegroundColor Gray
    Write-Host "🚀 What would you like to do now?`n" -ForegroundColor Cyan
    Write-Host "1. Start Backend Server (Port 3001)" -ForegroundColor White
    Write-Host "2. View Database in Browser (Port 3002)" -ForegroundColor White
    Write-Host "3. Both (Server + Database Viewer)" -ForegroundColor White
    Write-Host "4. Exit`n" -ForegroundColor White
    
    $choice = Read-Host "Enter your choice (1-4)"
    
    switch ($choice) {
        "1" {
            Write-Host "`n🚀 Starting Backend Server...`n" -ForegroundColor Cyan
            Write-Host "Server URL: http://localhost:3001" -ForegroundColor Yellow
            Write-Host "Press Ctrl+C to stop`n" -ForegroundColor Gray
            npm start
        }
        "2" {
            Write-Host "`n🌐 Starting Database Viewer...`n" -ForegroundColor Cyan
            Write-Host "Opening: http://localhost:3002" -ForegroundColor Yellow
            Start-Sleep -Seconds 2
            Start-Process "http://localhost:3002"
            npm run view-db
        }
        "3" {
            Write-Host "`n🚀 Starting both Server and Database Viewer...`n" -ForegroundColor Cyan
            Write-Host "Server: http://localhost:3001" -ForegroundColor Yellow
            Write-Host "Database Viewer: http://localhost:3002" -ForegroundColor Yellow
            Write-Host "`nOpening database viewer in browser..." -ForegroundColor Gray
            Start-Sleep -Seconds 2
            Start-Process "http://localhost:3002"
            Write-Host "Press Ctrl+C to stop both`n" -ForegroundColor Gray
            npm run dev
        }
        default {
            Write-Host "`n✅ Setup complete! Run these commands to start:`n" -ForegroundColor Green
            Write-Host "  npm start          - Start backend server" -ForegroundColor White
            Write-Host "  npm run view-db    - View database in browser`n" -ForegroundColor White
        }
    }
    
} else {
    Write-Host "`n╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Red
    Write-Host "║                                                                ║" -ForegroundColor Red
    Write-Host "║              ❌ DATABASE CONNECTION FAILED! ❌                  ║" -ForegroundColor Red
    Write-Host "║                                                                ║" -ForegroundColor Red
    Write-Host "╚════════════════════════════════════════════════════════════════╝`n" -ForegroundColor Red
    
    Write-Host "📝 Common Issues:`n" -ForegroundColor Yellow
    Write-Host "1. ❌ Wrong username or password" -ForegroundColor White
    Write-Host "   → Check your database user credentials in Atlas`n" -ForegroundColor Gray
    
    Write-Host "2. ❌ IP not whitelisted" -ForegroundColor White
    Write-Host "   → Go to Network Access and add 0.0.0.0/0`n" -ForegroundColor Gray
    
    Write-Host "3. ❌ Cluster not ready" -ForegroundColor White
    Write-Host "   → Wait a few minutes for cluster to be active`n" -ForegroundColor Gray
    
    Write-Host "4. ❌ Missing database name in connection string" -ForegroundColor White
    Write-Host "   → Should have '/splitapp' before the '?'`n" -ForegroundColor Gray
    
    Write-Host "5. ❌ Password contains special characters" -ForegroundColor White
    Write-Host "   → URL encode special characters or use simple password`n" -ForegroundColor Gray
    
    Write-Host "═══════════════════════════════════════════════════════════════`n" -ForegroundColor Gray
    
    $retry = Read-Host "Would you like to try a different connection string? (y/n)"
    if ($retry -eq "y") {
        & $MyInvocation.MyCommand.Path
    }
}
