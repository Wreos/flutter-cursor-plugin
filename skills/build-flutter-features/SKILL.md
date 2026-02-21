---
name: build-flutter-features
description: Build and refactor Flutter features with layered architecture, robust state management, Dart MCP analysis, and optional Figma MCP UI implementation.
---

# Build Flutter Features

Use this skill for non-test Flutter development tasks.

## Workflow

1. Understand the target behavior and constraints.
2. Map changes by layer: presentation -> domain -> data.
3. Keep dependency flow one-directional and injectable.
4. Implement feature changes in small increments.
5. Use Dart MCP to validate diagnostics and apply safe fixes.
6. If Figma source exists, follow `figma-to-flutter.md`.
7. Add/update tests using `../write-flutter-tests/SKILL.md`.

## Architecture defaults

- Keep widgets focused on rendering and interaction.
- Keep business logic in cubit/bloc/use-cases/services.
- Avoid hidden global state/singletons when DI can be used.
- Keep models immutable where practical.

## Required references

- `../../rules/flutter-development-best-practices.mdc`
- `../../rules/dart-effective-dart.mdc`
- `../../rules/flutter-test-best-practices.mdc`
