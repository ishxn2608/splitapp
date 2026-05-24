# Complete SplitApp Setup Guide
# This script will guide you through the entire setup process

function Write-Header {
    param($text)
    Write-Host "`n========================================" -ForegroundColor Cyan
    Write-Host $text -ForegroundColor Cyan
    Write-Host "========================================`n" -ForegroundColor Cyan
}

function Write-Step {
    param($number, $text)
    Write-Host "`n📍 Step $number : $text" -ForegroundColor Yellow
    Write-Host ("─" * 50) -ForegroundColor Gray
}

function Write-Success {
    param($text)
    Write-Host "✅ $text" -ForegroundColor Green
}

function Write-Error {
    param($text)
    Write-Host "❌ $text" -ForegroundColor Red
}

function Write-Info {
    param($text)
    Write-Host "ℹ️  $text" -ForegroundColor Blue
}

Clear-Host
Write-Header "🚀 SplitApp Complete Setup Guide"

Write-Host "This script will help you:" -ForegroundColor White
Write-Host "  1. Set up MongoDB Atlas (cloud database)" -ForegroundColor White
Write-Host "  2. Configure your .env file" -ForegroundColor White
Write-Host "  3. Test database connection" -ForegroundColor White
Write-Host "  4. Start the server" -ForegroundColor White
Write-Host "  5. View your database`n" -ForegroundColor White

$continue = Read-Host "Ready to start? (y/n)"
if ($continue -ne "y") {
    Write-Host "`nSetup cancelled. Run this script again when ready.`n" -ForegroundColor Yellow
    exit
}

# Step 1: Check MongoDB Atlas Setup
Write-Step 1 "MongoDB Atlas Setup"

Write-Host "`nDo you already have a MongoDB Atlas account and cluster?" -ForegroundColor White
Write-Host "  If NO: Go to https://www.mongodb.com/cloud/atlas/register" -ForegroundColor Gray
Write-Host "  If YES: Continue below`n" -ForegroundColor Gray

$hasAtlas = Read-Host "Do you have MongoDB Atlas set up? (y/n)"

if ($hasAtlas -ne "y") {
    Write-Host "`n📖 MongoDB Atlas Setup Instructions:" -ForegroundColor Cyan
    Write-Host "`n1. Open your browser and go to:" -ForegroundColor White
    Write-Host "   https://www.mongodb.com/cloud/atlas/register`n" -ForegroundColor Yellow
    
    Write-Host "2. Create a FREE account (no credit card required)`n" -ForegroundColor White
    
    Write-Host "3. Create a new cluster:" -ForegroundColor White
    Write-Host "   - Choose FREE tier (M0)" -ForegroundColor Gray
    Write-Host "   - Select a region close to you" -ForegroundColor Gray
    Write-Host "   - Click 'Create Cluster'" -ForegroundColor Gray
    Write-Host "   - Wait 3-5 minutes for creation`n" -ForegroundColor Gray
    
    Write-Host "4. Create Database User:" -ForegroundColor White
    Write-Host "   - Click 'Database Access' in left sidebar" -ForegroundColor Gray
    Write-Host "   - Click 'Add New Database User'" -ForegroundColor Gray
    Write-Host "   - Username: splitapp_user" -ForegroundColor Gray
    Write-Host "   - Password: SplitApp2026! (or your own)" -ForegroundColor Gray
    Write-Host "   - Role: 'Read and write to any database'" -ForegroundColor Gray
    Write-Host "   - Click 'Add User'`n" -ForegroundColor Gray
    
    Write-Host "5. Whitelist IP Address:" -ForegroundColor White
    Write-Host "   - Click 'Network Access' in left sidebar" -ForegroundColor Gray
    Write-Host "   - Click 'Add IP Address'" -ForegroundColor Gray
    Write-Host "   - Click 'Allow Access from Anywhere'" -ForegroundColor Gray
    Write-Host "   - Confirm 0.0.0.0/0 is added" -ForegroundColor Gray
    Write-Host "   - Click 'Confirm'`n" -ForegroundColor Gray
    
    Write-Host "6. Get Connection String:" -ForegroundColor White
    Write-Host "   - Click 'Database' in left sidebar" -ForegroundColor Gray
    Write-Host "   - Click 'Connect' button on your cluster" -ForegroundColor Gray
    Write-Host "   - Choose 'Connect your application'" -ForegroundColor Gray
    Write-Host "   - Driver: Node.js" -ForegroundColor Gray
    Write-Host "   - Copy the connection string`n" -ForegroundColor Gray
    
    Write-Host "Press Enter when you have completed these steps..." -ForegroundColor Yellow
    Read-Host
}

# Step 2: Get Connection String
Write-Step 2 "Configure MongoDB Connection"

Write-Host "`nPlease paste your MongoDB Atlas connection string:" -ForegroundColor White
Write-Host "Format: mongodb+srv://username:password@cluster.mongodb.net/splitapp?retryWrites=true&w=majority`n" -ForegroundColor Gray

$connectionString = Read-Host "Connection String"

if ([string]::IsNullOrWhiteSpace($connectionString)) {
    Write-Error "No connection string provided!"
    Write-Host "`nExample format:" -ForegroundColor Yellow
    Write-Host "mongodb+srv://splitapp_user:SplitApp2026!@cluster0.xxxxx.mongodb.net/splitapp?retryWrites=true&w=majority`n" -ForegroundColor Gray
    exit
}

# Validate connection string
if ($connectionString -notlike "*mongodb+srv://*" -and $connectionString -notlike "*mongodb://*") {
    Write-Error "Invalid connection string format!"
    Write-Host "Connection string should start with 'mongodb+srv://' or 'mongodb://'`n" -ForegroundColor Yellow
    exit
}

# Ensure database name is included
if ($connectionString -notlike "*/splitapp*") {
    Write-Host "`n⚠️  Warning: Database name 'splitapp' not found in connection string" -ForegroundColor Yellow
    Write-Host "Adding '/splitapp' to connection string..." -ForegroundColor Yellow
    
    if ($connectionString -like "*?*") {
        $connectionString = $connectionString -replace "\?", "/splitapp?"
    } else {
        $connectionString = $connectionString + "/splitapp"
    }
}

# Update .env file
Write-Host "`nUpdating .env file..." -ForegroundColor White

$envContent = @"
PORT=3001
NODE_ENV=development
MONGODB_URI=$connectionString
JWT_SECRET=splitapp-secret-key-2026-secure-token-12345
ACCESS_TOKEN_SECRET=splitapp-secret-key-2026-secure-token-12345
"@

Set-Content ".env" $envContent
Write-Success ".env file updated successfully!"

# Step 3: Test Connection
Write-Step 3 "Test Database Connection"

Write-Host "`nTesting MongoDB connection..." -ForegroundColor White
Write-Host "This may take a few seconds...`n" -ForegroundColor Gray

$testResult = node test-mongodb-connection.js 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Success "Database connection successful!"
    Write-Host $testResult -ForegroundColor Green
} else {
    Write-Error "Database connection failed!"
    Write-Host $testResult -ForegroundColor Red
    Write-Host "`n📝 Please check:" -ForegroundColor Yellow
    Write-Host "  1. MongoDB Atlas cluster is active" -ForegroundColor White
    Write-Host "  2. IP address 0.0.0.0/0 is whitelisted" -ForegroundColor White
    Write-Host "  3. Username and password are correct" -ForegroundColor White
    Write-Host "  4. Database name 'splitapp' is in connection string`n" -ForegroundColor White
    
    $retry = Read-Host "Would you like to try a different connection string? (y/n)"
    if ($retry -eq "y") {
        & $MyInvocation.MyCommand.Path
        exit
    } else {
        exit
    }
}

# Step 4: Choose Action
Write-Step 4 "What would you like to do next?"

Write-Host "`n1. Start Backend Server (Port 3001)" -ForegroundColor White
Write-Host "2. View Database in Browser (Port 3002)" -ForegroundColor White
Write-Host "3. Fix Client Install Issue" -ForegroundColor White
Write-Host "4. Open MongoDB Compass Instructions" -ForegroundColor White
Write-Host "5. Exit`n" -ForegroundColor White

$choice = Read-Host "Enter your choice (1-5)"

switch ($choice) {
    "1" {
        Write-Host "`n🚀 Starting Backend Server...`n" -ForegroundColor Cyan
        Write-Host "Server will run on: http://localhost:3001" -ForegroundColor Yellow
        Write-Host "Press Ctrl+C to stop`n" -ForegroundColor Gray
        npm start
    }
    "2" {
        Write-Host "`n🌐 Starting Database Viewer...`n" -ForegroundColor Cyan
        Write-Host "Opening browser at: http://localhost:3002" -ForegroundColor Yellow
        Write-Host "Press Ctrl+C to stop`n" -ForegroundColor Gray
        Start-Process "http://localhost:3002"
        npm run view-db
    }
    "3" {
        Write-Host "`n🔧 Running Client Install Fix...`n" -ForegroundColor Cyan
        & ".\fix-client-install.ps1"
    }
    "4" {
        Write-Host "`n📖 MongoDB Compass Setup:`n" -ForegroundColor Cyan
        Write-Host "1. Download MongoDB Compass:" -ForegroundColor White
        Write-Host "   https://www.mongodb.com/try/download/compass`n" -ForegroundColor Yellow
        Write-Host "2. Install and open Compass`n" -ForegroundColor White
        Write-Host "3. Paste your connection string:" -ForegroundColor White
        Write-Host "   $connectionString`n" -ForegroundColor Gray
        Write-Host "4. Click 'Connect'`n" -ForegroundColor White
        Write-Host "5. Browse your 'splitapp' database`n" -ForegroundColor White
        
        $openBrowser = Read-Host "Open download page in browser? (y/n)"
        if ($openBrowser -eq "y") {
            Start-Process "https://www.mongodb.com/try/download/compass"
        }
    }
    "5" {
        Write-Host "`n✅ Setup Complete!`n" -ForegroundColor Green
        Write-Host "Quick Commands:" -ForegroundColor Cyan
        Write-Host "  npm start          - Start backend server" -ForegroundColor White
        Write-Host "  npm run view-db    - View database in browser" -ForegroundColor White
        Write-Host "  node test-mongodb-connection.js - Test connection`n" -ForegroundColor White
        exit
    }
    default {
        Write-Error "Invalid choice"
        exit
    }
}
