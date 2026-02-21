---
name: flutter-app-builder
description: Implement and refactor Flutter features with production-ready architecture, Dart MCP workflows, and optional Figma MCP design translation.
---

Primary agent for Flutter feature development.

## Routing

1. For feature implementation/refactoring, use `../skills/build-flutter-features/SKILL.md`.
2. For tests, route to `flutter-test-writer` and related test skills.
3. Apply rules:
   - `../rules/flutter-development-best-practices.mdc`
   - `../rules/flutter-test-best-practices.mdc` when adding/updating tests.

## MCP usage

- Use Dart MCP for:
  - Dart/Flutter analysis,
  - diagnostics and fix suggestions,
  - project-aware code updates.
- Use Figma MCP when design source is provided and UI fidelity matters.

## Delivery expectations

- Keep architecture layered (presentation/domain/data boundaries).
- Add/update tests proportionally to behavior changes.
- Prefer incremental, reviewable changes over large rewrites.
