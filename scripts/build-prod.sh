#!/bin/bash
# Production build script for ZIRO.FIT Flutter app
# Usage: ./scripts/build-prod.sh [apk|appbundle|ios|ios-framework]
#
# Sets the API_BASE_URL to https://ziro.fit/ for all builds.

set -e

PROD_URL="https://ziro.fit/"
BUILD_TYPE="${1:-apk}"

echo "🔨 Building ZIRO.FIT for production..."
echo "🌐 API Base URL: $PROD_URL"
echo "📦 Build type: $BUILD_TYPE"
echo ""

case "$BUILD_TYPE" in
  apk)
    flutter build apk --release --dart-define=API_BASE_URL="$PROD_URL"
    ;;
  appbundle)
    flutter build appbundle --release --dart-define=API_BASE_URL="$PROD_URL"
    ;;
  ios)
    flutter build ios --release --dart-define=API_BASE_URL="$PROD_URL"
    ;;
  ios-framework)
    flutter build ios-framework --release --dart-define=API_BASE_URL="$PROD_URL"
    ;;
  *)
    echo "❌ Unknown build type: $BUILD_TYPE"
    echo "Usage: $0 [apk|appbundle|ios|ios-framework]"
    exit 1
    ;;
esac

echo ""
echo "✅ Build complete!"
