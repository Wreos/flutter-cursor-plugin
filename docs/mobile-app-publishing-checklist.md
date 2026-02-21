# Mobile App Publishing Checklist (Android + iOS)

This checklist is designed for production-ready Flutter app publication.

## 1) Release gating

- Freeze release scope and changelog.
- Run `flutter analyze`.
- Run automated tests relevant to changed areas.
- Execute smoke tests on release build variants.

## 2) Versioning

- Bump app version and build numbers consistently.
- Verify versioning in both Android and iOS project metadata.

## 3) Android release readiness

- Confirm app signing configuration and key management.
- Build Android App Bundle:
  - `flutter build appbundle`
- Verify release artifact installation/startup in release mode.
- Ensure Play Console listing content and release notes are ready.
- Ensure required Play declarations are complete (for example app content/data safety as applicable).

## 4) iOS release readiness

- Confirm Apple signing setup (certificates/profiles) and capabilities.
- Build iOS release artifact:
  - `flutter build ipa` (or archive via Xcode flow when required)
- Validate startup and critical path behavior on physical iOS device.
- Ensure App Store Connect metadata/screenshots/release notes are ready.
- Ensure required privacy declarations are complete.

## 5) Submission and rollout

- Submit to Play Console and App Store Connect.
- Use staged rollout when risk is non-trivial.
- Monitor crashes, ANRs, and key feature metrics after release.
- Prepare hotfix branch/process before rollout starts.

## Official references

- Flutter Android deployment: https://docs.flutter.dev/deployment/android
- Flutter iOS deployment: https://docs.flutter.dev/deployment/ios
- Android App Bundle (Android Developers): https://developer.android.com/guide/app-bundle
- Play Console app setup (Google): https://support.google.com/googleplay/android-developer/answer/9859152
- Submit an app (App Store Connect): https://developer.apple.com/help/app-store-connect/manage-submissions-to-app-review/submit-an-app
