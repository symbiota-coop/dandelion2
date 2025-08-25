# Dandelion Android App

The Android companion app for Dandelion, built with Kotlin and Hotwire Native.

## Features

- **Events**: Browse and interact with Dandelion events
- **People**: Connect with other Dandelion community members
- **Maps**: View event locations with integrated Google Maps
- **Native Performance**: Built with Hotwire Native for smooth web-to-native bridging

## Prerequisites

- Android Studio or Android SDK
- Java 17+
- Android device or emulator (API level 28+)
- Dandelion Rails server running

## Quick Start

1. **Build and run:**
   ```bash
   # From the dandelion2 root directory
   ./bin/android.sh run
   ```

2. **Available commands:**
   ```bash
   ./bin/android.sh build    # Build APK
   ./bin/android.sh install  # Install on device
   ./bin/android.sh clean    # Clean build
   ./bin/android.sh test     # Run tests
   ```

## Configuration

The app connects to your Rails server at `http://localhost:3000` by default. To change this:

1. Edit `android/app/build.gradle.kts`
2. Update the `BASE_URL` values in the `buildConfigField` sections
3. Rebuild the app

## Architecture

- **Hotwire Native**: Seamless web-to-native transitions
- **Jetpack Compose**: Modern Android UI toolkit
- **Material Design 3**: Beautiful, accessible interface
- **Google Maps**: Interactive location features

## Development

The app uses a standard Android project structure:
- `app/src/main/java/com/dandelion/app/` - Main source code
- `app/src/main/res/` - Resources (layouts, strings, etc.)
- `app/build.gradle.kts` - App-level build configuration

## Testing

Run the test suite:
```bash
./bin/android.sh test
```

## Building for Release

1. Configure signing in `android/app/build.gradle.kts`
2. Run: `./gradlew assembleRelease`
3. Find APK in `app/build/outputs/apk/release/`

---

Part of the Dandelion ecosystem
