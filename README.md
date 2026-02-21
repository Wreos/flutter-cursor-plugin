# flutter-cursor-plugin

Open-source Cursor plugin for production Flutter development and testing.

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
  - `flutter-test-writer`
  - `flutter-widget-test-writer`
  - `flutter-e2e-test-writer`
- **Commands**
  - `implement-flutter-feature`
  - `implement-figma-screen`
  - `write-widget-test`
  - `write-bloc-test`
  - `write-e2e-test`
- **Rules**
  - `rules/flutter-development-best-practices.mdc`
  - `rules/dart-effective-dart.mdc`
  - `rules/flutter-test-best-practices.mdc`
- **Skills**
  - `skills/build-flutter-features/`
  - `skills/write-flutter-tests/`

## MCP integrations

- **Dart MCP**: use for analysis, fix suggestions, formatting guidance, and project-aware Dart/Flutter workflows.
- **Figma MCP**: use when translating Figma nodes/screens to Flutter UI with higher visual fidelity.
- **Effective Dart**: align implementation with the official guidance at https://dart.dev/effective-dart.

## Requirements

- Flutter SDK and Dart tooling.
- Patrol (only if you run Patrol E2E tests).
- Dart MCP server configured in Cursor.
- Figma MCP server configured in Cursor for design implementation tasks.

## Usage

1. Enable this plugin in Cursor.
2. For feature work, use `flutter-app-builder` or `implement-flutter-feature`.
3. For design implementation, use `implement-figma-screen`.
4. For tests, use `flutter-test-writer` or specific test commands.
5. Keep generated output aligned with plugin rules.
