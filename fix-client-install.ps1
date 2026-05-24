# Fix Client Install Issues
# This script tries multiple methods to fix npm install hanging

Write-Host "🔧 Fixing Client Install Issues" -ForegroundColor Cyan
Write-Host "================================`n" -ForegroundColor Cyan

Set-Location "client"

Write-Host "Method 1: Clean install with legacy peer deps`n" -ForegroundColor Yellow

# Remove lock file
if (Test-Path "package-lock.json") {
    Write-Host "  Removing package-lock.json..." -ForegroundColor Gray
    Remove-Item "package-lock.json" -Force -ErrorAction SilentlyContinue
}

# Try npm install with various flags
Write-Host "  Installing dependencies (this may take 5-10 minutes)..." -ForegroundColor Gray
Write-Host "  Please be patient...`n" -ForegroundColor Yellow

$npmArgs = @(
    "install",
    "--legacy-peer-deps",
    "--prefer-offline",
    "--no-audit",
    "--progress=false"
)

$process = Start-Process -FilePath "npm" -ArgumentList $npmArgs -NoNewWindow -PassThru -Wait

if ($process.ExitCode -eq 0) {
    Write-Host "`n✅ Client dependencies installed successfully!" -ForegroundColor Green
    Set-Location ".."
    exit 0
}

Write-Host "`n⚠️  Method 1 failed. Trying Method 2...`n" -ForegroundColor Yellow

# Method 2: Use Yarn
Write-Host "Method 2: Installing with Yarn`n" -ForegroundColor Yellow

$yarnInstalled = Get-Command yarn -ErrorAction SilentlyContinue

if (-not $yarnInstalled) {
    Write-Host "  Installing Yarn globally..." -ForegroundColor Gray
    npm install -g yarn
}

Write-Host "  Installing dependencies with Yarn..." -ForegroundColor Gray
yarn install

if ($LASTEXITCODE -eq 0) {
    Write-Host "`n✅ Client dependencies installed successfully with Yarn!" -ForegroundColor Green
    Set-Location ".."
    exit 0
}

Write-Host "`n❌ Both methods failed." -ForegroundColor Red
Write-Host "`n📝 Manual Steps:" -ForegroundColor Yellow
Write-Host "1. Close all terminals and VS Code" -ForegroundColor White
Write-Host "2. Restart your computer" -ForegroundColor White
Write-Host "3. Open PowerShell as Administrator" -ForegroundColor White
Write-Host "4. Run: npm cache clean --force" -ForegroundColor White
Write-Host "5. Navigate to client folder" -ForegroundColor White
Write-Host "6. Run: npm install --legacy-peer-deps`n" -ForegroundColor White

Set-Location ".."
