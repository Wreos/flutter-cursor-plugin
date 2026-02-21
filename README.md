# flutter-cursor-plugin

Open-source Cursor plugin for production Flutter development and testing.

## Quickstart (1-5 minutes)

1. Install/enable the plugin in Cursor.
2. Ensure Dart MCP is available (`dart mcp-server`) and keep `mcp.json` in this repo enabled.
3. Run one practical flow:
   - `implement-flutter-feature` for feature scaffolding and implementation.
   - `generate-flutter-tests` for unit/widget/bloc/Patrol E2E tests.
   - `review-flutter-code` for risk-focused review with mandatory security checks.
4. Use `prepare-mobile-release` and `setup-mobile-github-pipeline` before shipping Android/iOS builds.

## Manifest and compatibility

- Canonical manifest: `.cursor-plugin/plugin.json` (schema-aligned for Cursor plugins).
- Compatibility manifest kept for existing setups: `plugin.json`.
- MCP auto-configuration: `mcp.json` (Dart MCP server).

## Compatibility matrix

- Cursor plugins: latest stable with plugin support.
- Flutter SDK: stable channel recommended.
- Dart SDK: must support `dart mcp-server`.
- Patrol: required only for Patrol E2E scenarios.
- Monorepo/workspace usage: see `docs/monorepo-workspace-guide.md`.

## What this plugin covers

- Flutter feature implementation with clean architecture defaults.
- Figma-to-Flutter implementation workflow with Figma MCP.
- Dart/Flutter analysis and code generation workflows with Dart MCP.
- Full testing strategy: unit, widget, bloc/cubit, and Patrol E2E.

## Core principles

- Keep business logic outside widgets.
- Prefer deterministic async and explicit state transitions.
- Keep selectors stable and tests behavior-first.
- Favor small, composable widgets and injected dependencies.

## Included assets

- **Release checklist**: `docs/official-release-checklist.md` for official/public release prep.
- **Agents**
  - `flutter-app-builder` (general Flutter implementation)
  - `flutter-code-reviewer`
  - `flutter-mobile-release-manager`
  - `flutter-test-writer`
- **Commands**
  - `implement-flutter-feature`
  - `implement-figma-screen`
  - `scaffold-flutter-feature`
  - `generate-flutter-tests`
  - `migrate-flutter-code`
  - `resolve-flutter-build-error`
  - `review-flutter-code`
  - `update-flutter-dependencies`
  - `prepare-mobile-release`
  - `setup-mobile-github-pipeline`
  - `integrate-firebase`
  - `security-review`
  - `write-widget-test`
  - `write-bloc-test`
  - `write-e2e-test`
- **Rules**
  - `rules/flutter-development-best-practices.mdc`
  - `rules/dart-effective-dart.mdc`
  - `rules/flutter-test-best-practices.mdc`
- **Skills**
  - `skills/build-flutter-features/`
  - `skills/scaffold-flutter-architecture/`
  - `skills/release-mobile-apps/`
  - `skills/integrate-firebase/`
  - `skills/write-flutter-tests/`
  - `skills/review-flutter-code/`
  - `skills/debug-flutter-issues/`
  - `skills/migrate-flutter-code/`
  - `skills/update-flutter-dependencies/`
  - `skills/security-audit/`

## MCP integrations

- **Dart MCP**: use for analysis, fix suggestions, formatting guidance, and project-aware Dart/Flutter workflows.
- **Figma MCP**: use when translating Figma nodes/screens to Flutter UI with higher visual fidelity.
- **Effective Dart**: align implementation with the official guidance at https://dart.dev/effective-dart.
- **Claude `/security-review` parity**: security workflow mirrors `anthropics/claude-code-security-review` patterns (diff-aware + false-positive filtering).

## Official documentation

- Flutter Android deployment: https://docs.flutter.dev/deployment/android
- Flutter iOS deployment: https://docs.flutter.dev/deployment/ios
- Firebase setup for Flutter: https://firebase.google.com/docs/flutter/setup
- Android App Bundle guide: https://developer.android.com/guide/app-bundle
- App Store Connect submission: https://developer.apple.com/help/app-store-connect/manage-submissions-to-app-review/submit-an-app
- Claude Code Security Review: https://github.com/anthropics/claude-code-security-review
- Cursor plugin schema: https://raw.githubusercontent.com/cursor/plugins/main/schemas/plugin.schema.json
- Flutter MCP server docs: https://docs.flutter.dev/ai/mcp-server

## Requirements

- Flutter SDK and Dart tooling.
- Patrol (only if you run Patrol E2E tests).
- Dart MCP server configured in Cursor.
- Figma MCP server configured in Cursor for design implementation tasks.

## Usage

1. Enable this plugin in Cursor.
2. For feature work, use `flutter-app-builder` or `implement-flutter-feature`.
3. For design implementation, use `implement-figma-screen` (Figma MCP).
4. For testing, use `flutter-test-writer` or `generate-flutter-tests`.
5. For migrations, debugging, and reviews use dedicated commands:
   - `migrate-flutter-code`
   - `resolve-flutter-build-error`
   - `review-flutter-code`
   - `update-flutter-dependencies`
   - or use dedicated review agent: `flutter-code-reviewer`
6. For Android/iOS publication readiness use:
   - `flutter-mobile-release-manager`
   - `prepare-mobile-release`
   - `docs/mobile-app-publishing-checklist.md`
   - `setup-mobile-github-pipeline`
   - `docs/mobile-ci-pipeline-checklist.md`
7. For Firebase integration use:
   - `integrate-firebase`
   - `docs/firebase-integration-checklist.md`
8. For security audit and secrets scanning use:
   - `security-review`
   - `docs/security-audit-checklist.md`
9. Keep generated output aligned with plugin rules.
10. For dependency upgrades, also follow:
   - `docs/dependency-upgrade-checklist.md`
11. For monorepo/workspace setups, follow:
   - `docs/monorepo-workspace-guide.md`

Note: every code review flow includes mandatory security checks (OWASP MASVS-oriented).

## Top use cases

1. Architecture scaffolding for new feature modules (BLoC/Riverpod/Clean).
2. Test generation for unit/widget/bloc/Patrol E2E.
3. Migration and refactoring workflows (framework/API/state-management changes).
4. Debug and error resolution for Dart/Android/iOS/dependency failures.
5. Risk-focused code review against conventions and architecture rules.
6. Android/iOS publishing readiness with official Flutter + store submission checklists.
7. Production-ready Firebase integration workflow for Flutter apps.
8. GitHub Actions mobile CI pipeline setup for APK/AAB build automation.
9. Security audit and secrets scanner workflow via `/security-review`.
10. Safe Flutter/Dart dependency upgrades with deterministic validation and rollback.
