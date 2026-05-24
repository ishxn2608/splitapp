# Update MongoDB Password in .env file

Write-Host "`n╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                                ║" -ForegroundColor Cyan
Write-Host "║              🔐 Update MongoDB Password                        ║" -ForegroundColor Cyan
Write-Host "║                                                                ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

Write-Host "Your current connection string has: <db_password>" -ForegroundColor Yellow
Write-Host "You need to replace it with your actual password.`n" -ForegroundColor Yellow

Write-Host "📝 Enter your MongoDB Atlas password:" -ForegroundColor White
Write-Host "   (The password you set for user: splitapp_user)`n" -ForegroundColor Gray

$password = Read-Host "Password" -AsSecureString
$passwordPlain = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($password))

if ([string]::IsNullOrWhiteSpace($passwordPlain)) {
    Write-Host "`n❌ No password entered. Exiting...`n" -ForegroundColor Red
    exit
}

# Read current .env
$envContent = Get-Content ".env" -Raw

# Replace <db_password> with actual password
$envContent = $envContent -replace "<db_password>", $passwordPlain

# Save updated .env
Set-Content ".env" $envContent

Write-Host "`n✅ Password updated successfully!`n" -ForegroundColor Green

# Test connection
Write-Host "🧪 Testing database connection...`n" -ForegroundColor Cyan

$testResult = node test-mongodb-connection.js 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✅ SUCCESS! Database connection works!`n" -ForegroundColor Green
    Write-Host "🚀 You can now start the server with: npm start`n" -ForegroundColor Yellow
} else {
    Write-Host "`n❌ Connection failed. Please check:`n" -ForegroundColor Red
    Write-Host "  1. Password is correct" -ForegroundColor White
    Write-Host "  2. IP 0.0.0.0/0 is whitelisted in MongoDB Atlas" -ForegroundColor White
    Write-Host "  3. Database user 'splitapp_user' exists`n" -ForegroundColor White
    Write-Host "Error details:" -ForegroundColor Yellow
    Write-Host $testResult -ForegroundColor Gray
    Write-Host "`n"
}
