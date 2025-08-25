#!/bin/bash

# Dandelion Android build script
# Navigate to the Android project directory and run Gradle commands

cd "$(dirname "$0")/../android"

case "$1" in
    "build")
        echo "🏗️ Building Dandelion Android app..."
        ./gradlew assembleDebug
        ;;
    "install")
        echo "📱 Installing Dandelion Android app..."
        ./gradlew installDebug
        ;;
    "run")
        echo "🚀 Building and installing Dandelion Android app..."
        ./gradlew installDebug
        ;;
    "clean")
        echo "🧹 Cleaning Android build..."
        ./gradlew clean
        ;;
    "test")
        echo "🧪 Running Android tests..."
        ./gradlew test
        ;;
    *)
        echo "🌻 Dandelion Android Build Script"
        echo ""
        echo "Usage: $0 [command]"
        echo ""
        echo "Commands:"
        echo "  build   - Build the debug APK"
        echo "  install - Install the app on connected device"
        echo "  run     - Build and install the app"
        echo "  clean   - Clean the build directory"
        echo "  test    - Run unit tests"
        echo ""
        echo "Make sure you have:"
        echo "  - Android SDK installed"
        echo "  - Device connected or emulator running"
        echo "  - Rails server running on localhost:3000"
        ;;
esac
