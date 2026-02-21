# Changelog

## 0.3.0

- Expanded plugin scope from testing-only to full Flutter development + testing.
- Added general development agent: `flutter-app-builder`.
- Added feature commands:
  - `implement-flutter-feature`
  - `implement-figma-screen`
- Added development skill set under `skills/build-flutter-features/`.
- Added production code rule set: `rules/flutter-development-best-practices.mdc`.
- Added explicit Dart MCP and Figma MCP workflows to docs and agents.
- Added open-source project docs for official publishing readiness:
  - `CONTRIBUTING.md`
  - `CODE_OF_CONDUCT.md`
  - `docs/official-release-checklist.md`

## 0.2.0

- Open-source rebrand to `flutter-testing`.
- Updated plugin metadata for public GitHub publishing.
- Added Patrol E2E support across plugin assets:
  - Agent: `flutter-e2e-test-writer`
  - Command: `write-e2e-test`
  - Skill guide: `skills/write-flutter-tests/integration-tests.md`
  - Template: `templates/integration_test_template.dart`
- Updated guidance with Patrol-first E2E practices and page-object usage.
- Improved bloc/cubit guidance: deterministic `act`, proper `wait:` usage, stronger `verify` conventions.
- Removed company-specific references from docs, skills, rules, and templates.

## 0.1.0

- Initial release: agents, rules, skills, commands, and bloc/widget test support.
