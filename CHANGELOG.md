# Changelog

## 1.1.0

- Added Top 5 production use-case coverage with dedicated agents, commands, and skills:
  - Architecture scaffolding:
    - agent: `agents/flutter-architecture-scaffolder.md`
    - command: `commands/scaffold-flutter-feature.md`
    - skill: `skills/scaffold-flutter-architecture/SKILL.md`
  - Test generation:
    - command: `commands/generate-flutter-tests.md`
    - routed through existing test skills and agents
  - Migration and refactoring:
    - agent: `agents/flutter-migration-refactor.md`
    - command: `commands/migrate-flutter-code.md`
    - skill: `skills/migrate-flutter-code/SKILL.md`
  - Debug and error resolution:
    - agent: `agents/flutter-debug-resolver.md`
    - command: `commands/resolve-flutter-build-error.md`
    - skill: `skills/debug-flutter-issues/SKILL.md`
  - Code review and conventions:
    - agent: `agents/flutter-code-reviewer.md`
    - command: `commands/review-flutter-code.md`
    - skill: `skills/review-flutter-code/SKILL.md`
- Updated README usage and top use-cases section.
- Updated plugin metadata and keywords for discoverability.

## 1.0.2

- Added manifest hardening for marketplace readiness:
  - explicit `repository` and `logo`
  - explicit component paths for `rules`, `skills`, `agents`, and `commands`
- Added committed logo asset at `assets/logo.svg`.

## 1.0.1

- Added explicit Effective Dart rules: `rules/dart-effective-dart.mdc`.
- Integrated Effective Dart enforcement into:
  - `agents/flutter-app-builder.md`
  - `commands/implement-flutter-feature.md`
  - `commands/implement-figma-screen.md`
  - `skills/build-flutter-features/SKILL.md`
  - `rules/flutter-development-best-practices.mdc`
- Updated README and official release checklist with Effective Dart alignment.

## 1.0.0

- First stable public release.
- End-to-end Flutter development and testing workflow.
- Includes Flutter feature implementation guidance with architecture best practices.
- Includes Dart MCP and Figma MCP integrated workflows.
- Includes unit/widget/bloc/Patrol E2E testing agents, skills, rules, and templates.
- Includes open-source project docs and official release checklist.

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
