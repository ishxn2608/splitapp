# Fix MongoDB Authentication
Clear-Host

Write-Host "`n╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                                ║" -ForegroundColor Cyan
Write-Host "║              🔧 Fix MongoDB Authentication Error               ║" -ForegroundColor Cyan
Write-Host "║                                                                ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

Write-Host "❌ Authentication Failed Error Detected!`n" -ForegroundColor Red

Write-Host "This means either:" -ForegroundColor Yellow
Write-Host "  1. The username doesn't exist in MongoDB Atlas" -ForegroundColor White
Write-Host "  2. The password is incorrect" -ForegroundColor White
Write-Host "  3. The user doesn't have proper permissions`n" -ForegroundColor White

Write-Host "═══════════════════════════════════════════════════════════════`n" -ForegroundColor Gray

Write-Host "Let's fix this! I'll guide you through creating/updating the user.`n" -ForegroundColor Cyan

Write-Host "📋 STEP 1: Go to MongoDB Atlas Dashboard" -ForegroundColor Yellow
Write-Host "   Open: https://cloud.mongodb.com/`n" -ForegroundColor White

Write-Host "📋 STEP 2: Create/Update Database User" -ForegroundColor Yellow
Write-Host "   1. Click 'Database Access' in the left sidebar" -ForegroundColor White
Write-Host "   2. Check if user 'splitapp_user' exists" -ForegroundColor White
Write-Host "      - If YES: Click 'Edit' → 'Edit Password' → Set new password" -ForegroundColor Gray
Write-Host "      - If NO: Click 'Add New Database User'`n" -ForegroundColor Gray

Write-Host "📋 STEP 3: Configure User (if creating new)" -ForegroundColor Yellow
Write-Host "   • Authentication Method: Password" -ForegroundColor White
Write-Host "   • Username: splitapp_user" -ForegroundColor White
Write-Host "   • Password: (create a strong password)" -ForegroundColor White
Write-Host "   • Database User Privileges: 'Atlas admin' or 'Read and write to any database'" -ForegroundColor White
Write-Host "   • Click 'Add User' or 'Update User'`n" -ForegroundColor White

Write-Host "📋 STEP 4: Whitelist IP Address" -ForegroundColor Yellow
Write-Host "   1. Click 'Network Access' in the left sidebar" -ForegroundColor White
Write-Host "   2. Click 'Add IP Address'" -ForegroundColor White
Write-Host "   3. Click 'Allow Access from Anywhere'" -ForegroundColor White
Write-Host "   4. Confirm that 0.0.0.0/0 is in the list" -ForegroundColor White
Write-Host "   5. Click 'Confirm'`n" -ForegroundColor White

Write-Host "═══════════════════════════════════════════════════════════════`n" -ForegroundColor Gray

$openBrowser = Read-Host "Open MongoDB Atlas in browser? (y/n)"
if ($openBrowser -eq "y") {
    Start-Process "https://cloud.mongodb.com/"
    Write-Host "`n✅ Browser opened. Complete the steps above.`n" -ForegroundColor Green
}

Write-Host "Press Enter when you've completed the steps above..." -ForegroundColor Yellow
Read-Host

Write-Host "`n═══════════════════════════════════════════════════════════════`n" -ForegroundColor Gray

Write-Host "Now let's update your .env file with the correct credentials.`n" -ForegroundColor Cyan

Write-Host "📝 Enter your MongoDB Atlas username:" -ForegroundColor White
Write-Host "   (Default: splitapp_user)`n" -ForegroundColor Gray
$username = Read-Host "Username"
if ([string]::IsNullOrWhiteSpace($username)) {
    $username = "splitapp_user"
}

Write-Host "`n📝 Enter your MongoDB Atlas password:" -ForegroundColor White
Write-Host "   (The password you just set/updated)`n" -ForegroundColor Gray
$password = Read-Host "Password" -AsSecureString
$passwordPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

if ([string]::IsNullOrWhiteSpace($passwordPlain)) {
    Write-Host "`n❌ No password entered. Exiting...`n" -ForegroundColor Red
    exit
}

# URL encode the password to handle special characters
Add-Type -AssemblyName System.Web
$passwordEncoded = [System.Web.HttpUtility]::UrlEncode($passwordPlain)

# Update .env file
$connectionString = "mongodb+srv://${username}:${passwordEncoded}@scanxqr.i0edxrb.mongodb.net/splitapp?retryWrites=true&w=majority&appName=ScanxQR"

$envContent = @"
PORT=3001
NODE_ENV=development
MONGODB_URI=$connectionString
JWT_SECRET=splitapp-secret-key-2026-secure-token-12345
ACCESS_TOKEN_SECRET=splitapp-secret-key-2026-secure-token-12345
"@

Set-Content ".env" $envContent

Write-Host "`n✅ .env file updated!`n" -ForegroundColor Green

Write-Host "═══════════════════════════════════════════════════════════════`n" -ForegroundColor Gray

Write-Host "🧪 Testing connection...`n" -ForegroundColor Cyan

$testResult = node test-mongodb-connection.js 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║                                                                ║" -ForegroundColor Green
    Write-Host "║                  ✅ SUCCESS! CONNECTION WORKS! ✅               ║" -ForegroundColor Green
    Write-Host "║                                                                ║" -ForegroundColor Green
    Write-Host "╚════════════════════════════════════════════════════════════════╝`n" -ForegroundColor Green
    
    Write-Host "🚀 Ready to start the server!`n" -ForegroundColor Cyan
    
    $startNow = Read-Host "Start the server now? (y/n)"
    if ($startNow -eq "y") {
        Write-Host "`n🚀 Starting server...`n" -ForegroundColor Cyan
        Write-Host "Server will run on: http://localhost:3001" -ForegroundColor Yellow
        Write-Host "Press Ctrl+C to stop`n" -ForegroundColor Gray
        npm start
    } else {
        Write-Host "`n📝 To start the server later, run: npm start`n" -ForegroundColor Yellow
    }
} else {
    Write-Host "`n❌ Connection still failed!`n" -ForegroundColor Red
    Write-Host "Error details:" -ForegroundColor Yellow
    Write-Host $testResult -ForegroundColor Gray
    Write-Host "`n📝 Please double-check:" -ForegroundColor Yellow
    Write-Host "  1. Username is correct: $username" -ForegroundColor White
    Write-Host "  2. Password is correct (no typos)" -ForegroundColor White
    Write-Host "  3. User exists in MongoDB Atlas → Database Access" -ForegroundColor White
    Write-Host "  4. IP 0.0.0.0/0 is whitelisted in Network Access" -ForegroundColor White
    Write-Host "  5. Cluster is active (not paused)`n" -ForegroundColor White
    
    $retry = Read-Host "Try again with different credentials? (y/n)"
    if ($retry -eq "y") {
        & $MyInvocation.MyCommand.Path
    }
}
