# Validation Matrix

Deterministic validation baseline per command.

## implement-flutter-feature

- `flutter analyze`
- `flutter test` (targeted for changed feature/tests)

## implement-figma-screen

- `flutter analyze`
- `flutter test` (widget tests for implemented screen)

## generate-flutter-tests

- `flutter test` for created/changed test files

## review-flutter-code

- Evidence-based findings against changed files/diff
- Security pass included (`security-audit` scope)

## security-review

- Secrets scan command(s) executed or explicitly unavailable
- Findings with severity + remediation + verification steps

## update-flutter-dependencies

- `flutter --version` (before/after)
- `flutter pub outdated`
- `flutter analyze`
- impacted `flutter test` suite

## resolve-flutter-build-error

- Reproduction command captured
- Re-run reproduction command after fix
- `flutter analyze` + impacted tests

## prepare-mobile-release

- `flutter analyze`
- `flutter test` (required suite)
- release artifact build commands documented (`.aab`/`.ipa` path)

## integrate-firebase

- `flutter analyze`
- `flutter test` (impacted)
- platform config verification (Android/iOS init)

## migrate-flutter-code

- Per-batch `flutter analyze`
- Per-batch impacted tests
- migration checklist completion status
