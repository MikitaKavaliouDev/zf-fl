# Build production APK and install on connected device
# Usage: .\scripts\install-prod.ps1 [-Release]

param(
    [switch]$Release
)

$PROD_URL = 'https://ziro.fit/'
$DEVICE_ID = 'RFCY70LDDXP'

Write-Host "🔨 Building APK with API_BASE_URL=$PROD_URL" -ForegroundColor Cyan
Write-Host "📱 Device: $DEVICE_ID" -ForegroundColor Cyan
Write-Host ""

$buildType = if ($Release) { '--release' } else { '--debug' }

flutter build apk $buildType --dart-define="API_BASE_URL=$PROD_URL"

if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Build failed!" -ForegroundColor Red
    exit 1
}

$apkSuffix = if ($Release) { 'release' } else { 'debug' }
$apkPath = "build\app\outputs\flutter-apk\app-$apkSuffix.apk"

Write-Host ""
Write-Host "📱 Installing on $DEVICE_ID..." -ForegroundColor Cyan

adb -s $DEVICE_ID install -r $apkPath

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✅ Installed successfully!" -ForegroundColor Green
    Write-Host "🚀 Launching app..." -ForegroundColor Cyan
    adb -s $DEVICE_ID shell am start -n fit.ziro.ziro_fit/.MainActivity
} else {
    Write-Host "❌ Installation failed!" -ForegroundColor Red
}
