# Firebase Integration Checklist (Flutter, Android, iOS)

Use this checklist to integrate Firebase in production-oriented Flutter apps.

## 1) Plan scope

- Confirm which Firebase products are needed.
- Define environments (dev/stage/prod) and app IDs.
- Define data/privacy requirements before enabling analytics collection.

## 2) Bootstrap FlutterFire

- Install and run FlutterFire CLI.
- Configure project and generate `firebase_options.dart`.
- Initialize Firebase in app startup (`Firebase.initializeApp` with generated options).

## 3) Android setup

- Ensure Android package/application ID matches Firebase app config.
- Confirm Gradle plugin/config requirements for selected Firebase products.
- Verify Google services configuration is present and build succeeds.

## 4) iOS setup

- Ensure iOS bundle ID matches Firebase app config.
- Add required config file and platform capabilities.
- Run CocoaPods install/update and verify clean build in Xcode.

## 5) Service integration and validation

- Auth: sign-in/sign-out flow and token refresh behavior.
- Analytics: key events and screen tracking.
- Crashlytics: non-fatal + fatal reporting in release-capable build.
- Messaging: token lifecycle and notification handling.
- Remote Config: defaults, fetch/activate, and fallback behavior.

## 6) Release safety

- Gate debug-only diagnostics from production builds.
- Add runtime error handling for unavailable Firebase services.
- Document rollback/fallback strategy for remote-config-driven features.

## Official references

- Firebase setup for Flutter (official): https://firebase.google.com/docs/flutter/setup
- Firebase Auth for Flutter: https://firebase.google.com/docs/auth/flutter/start
- Firebase Analytics for Flutter: https://firebase.google.com/docs/analytics/get-started?platform=flutter
- Firebase Crashlytics for Flutter: https://firebase.google.com/docs/crashlytics/get-started?platform=flutter
- Firebase Cloud Messaging for Flutter: https://firebase.google.com/docs/cloud-messaging/flutter/client
- Firebase Remote Config for Flutter: https://firebase.google.com/docs/remote-config/get-started?platform=flutter
- Flutter Android deployment: https://docs.flutter.dev/deployment/android
- Flutter iOS deployment: https://docs.flutter.dev/deployment/ios
