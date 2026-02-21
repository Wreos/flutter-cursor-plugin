# Mobile CI Pipeline Checklist (GitHub Actions)

Use this checklist to deploy a typical Flutter mobile pipeline for APK/AAB builds.

## 1) Workflow setup

- Add workflow file under `.github/workflows/`.
- Start from `templates/github_actions_flutter_mobile_ci.yml`.
- Ensure triggers match your release strategy (`pull_request`, `push`, `workflow_dispatch`).

## 2) Build gates

- Run `flutter pub get`.
- Run `flutter analyze`.
- Run tests before building artifacts.

## 3) Android artifacts

- Build release APK (`flutter build apk --release`).
- Build release AAB (`flutter build appbundle --release`).
- Upload artifacts via `actions/upload-artifact`.

## 4) iOS validation (optional in CI)

- Use a macOS runner for iOS build checks.
- Use `flutter build ios --release --no-codesign` for validation-only job.
- Keep signing/export steps in dedicated secured workflows when needed.

## 5) Stability and security

- Pin tool versions where possible (Flutter, Java).
- Keep secrets in GitHub encrypted secrets only.
- Add cache cautiously and invalidate on dependency changes.

## Official references

- Flutter Android deployment: https://docs.flutter.dev/deployment/android
- Flutter iOS deployment: https://docs.flutter.dev/deployment/ios
- GitHub Actions (workflow syntax): https://docs.github.com/actions/using-workflows/workflow-syntax-for-github-actions
- GitHub Actions artifacts: https://docs.github.com/actions/using-workflows/storing-workflow-data-as-artifacts
