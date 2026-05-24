# Quick Test - Use a demo MongoDB Atlas connection to test the project

Clear-Host

Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║                                                                ║" -ForegroundColor Cyan
Write-Host "║         🧪 QUICK TEST MODE - Demo Database 🧪                 ║" -ForegroundColor Cyan
Write-Host "║                                                                ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════════╝`n" -ForegroundColor Cyan

Write-Host "⚠️  This will use a DEMO MongoDB Atlas database for testing." -ForegroundColor Yellow
Write-Host "   You should set up your own MongoDB Atlas later.`n" -ForegroundColor Yellow

Write-Host "Do you want to:" -ForegroundColor White
Write-Host "1. Use DEMO database (quick test)" -ForegroundColor Yellow
Write-Host "2. Set up MY OWN MongoDB Atlas (recommended)" -ForegroundColor Green
Write-Host "3. Exit`n" -ForegroundColor White

$choice = Read-Host "Enter choice (1-3)"

if ($choice -eq "1") {
    Write-Host "`n📝 Setting up demo database connection...`n" -ForegroundColor Cyan
    
    # Note: This is a placeholder - you'll need to provide your own demo connection
    Write-Host "❌ Demo database not available." -ForegroundColor Red
    Write-Host "   You need to set up your own MongoDB Atlas account.`n" -ForegroundColor Yellow
    
    Write-Host "It's FREE and takes only 5 minutes!" -ForegroundColor Green
    Write-Host "Run: .\SETUP_NOW.ps1`n" -ForegroundColor Cyan
    
} elseif ($choice -eq "2") {
    Write-Host "`n🚀 Starting MongoDB Atlas setup...`n" -ForegroundColor Cyan
    & ".\SETUP_NOW.ps1"
} else {
    Write-Host "`nExiting...`n" -ForegroundColor Gray
}
