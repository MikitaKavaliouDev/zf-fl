# Production build script for ZIRO.FIT Flutter app (Windows)
# Usage: .\scripts\build-prod.ps1 [apk|appbundle|ios|ios-framework]
#
# Sets the API_BASE_URL to https://ziro.fit/ for all builds.

param(
    [ValidateSet('apk', 'appbundle', 'ios', 'ios-framework')]
    [string]$BuildType = 'apk'
)

$PROD_URL = 'https://ziro.fit/'

Write-Host "🔨 Building ZIRO.FIT for production..." -ForegroundColor Cyan
Write-Host "🌐 API Base URL: $PROD_URL" -ForegroundColor Cyan
Write-Host "📦 Build type: $BuildType" -ForegroundColor Cyan
Write-Host ""

switch ($BuildType) {
    'apk' {
        flutter build apk --release --dart-define="API_BASE_URL=$PROD_URL"
    }
    'appbundle' {
        flutter build appbundle --release --dart-define="API_BASE_URL=$PROD_URL"
    }
    'ios' {
        flutter build ios --release --dart-define="API_BASE_URL=$PROD_URL"
    }
    'ios-framework' {
        flutter build ios-framework --release --dart-define="API_BASE_URL=$PROD_URL"
    }
}

Write-Host ""
Write-Host "✅ Build complete!" -ForegroundColor Green
