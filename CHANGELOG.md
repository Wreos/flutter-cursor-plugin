# Changelog

## 1.6.1

- Enforced security checks on every code review.
- `flutter-code-reviewer` and `review-flutter-code` now require running `skills/security-audit/SKILL.md`.
- Added mandatory OWASP MASVS-oriented coverage for mobile security checks.
- Updated security checklist and README to reflect always-on review security pass.

## 1.6.0

- Added security audit workflow with Claude-style `/security-review` entrypoint:
  - command: `commands/security-review.md`
  - skill: `skills/security-audit/SKILL.md`
  - checklist: `docs/security-audit-checklist.md`
- Added secrets scanning guidance and prioritized findings format.
- Updated README, official release checklist, and plugin metadata for security workflow support.

## 1.5.0

- Consolidated plugin architecture to reduce agent duplication.
- Kept a small agent set:
  - `agents/flutter-app-builder.md`
  - `agents/flutter-test-writer.md`
- Reintroduced specialized agents where dedicated mode is useful:
  - `agents/flutter-code-reviewer.md`
  - `agents/flutter-mobile-release-manager.md`
- Moved feature-specific workflows to skills + commands as the primary interface.
- Updated README and official release checklist to reflect the streamlined model.

## 1.4.0

- Added command-only workflow for mobile GitHub CI pipeline setup (no new agent):
  - command: `commands/setup-mobile-github-pipeline.md`
  - template: `templates/github_actions_flutter_mobile_ci.yml`
  - checklist: `docs/mobile-ci-pipeline-checklist.md`
- Linked pipeline setup into release-mobile skill and README usage.
- Added official GitHub Actions documentation references for workflow syntax and artifacts.

## 1.3.0

- Added Firebase integration workflow:
  - agent: `agents/flutter-firebase-integrator.md`
  - command: `commands/integrate-firebase.md`
  - skill: `skills/integrate-firebase/SKILL.md`
  - checklist: `docs/firebase-integration-checklist.md`
- Linked Firebase workflow into main app-builder routing and official release checklist.
- Updated plugin metadata keywords and README usage for Firebase support.

## 1.2.0

- Added Android/iOS publishing readiness workflow:
  - agent: `agents/flutter-mobile-release-manager.md`
  - command: `commands/prepare-mobile-release.md`
  - skill: `skills/release-mobile-apps/SKILL.md`
  - checklist: `docs/mobile-app-publishing-checklist.md`
- Integrated official source links for Flutter deployment, Android App Bundle, Play Console setup, and App Store Connect submission.
- Updated plugin metadata keywords for release/publishing discoverability.

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
