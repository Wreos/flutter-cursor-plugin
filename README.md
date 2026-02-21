# flutter-testing

Open-source Cursor plugin to make Dart/Flutter test writing faster, cleaner, and more consistent.

## Goals

- **Efficient test pyramid**: keep most coverage in unit/widget tests, keep E2E small and high-value.
- **Reliable patterns**: deterministic async, stable selectors, clear GIVEN-WHEN-THEN naming.
- **Reusable workflows**: agents, skills, commands, and templates for bloc/cubit, widget, and Patrol E2E tests.

## Components

- **Agents**: main test router plus focused widget/bloc/e2e agents.
- **Rules**: repo-wide conventions for test quality and consistency.
- **Skills**: practical step-by-step guides for each test layer.
- **Templates**: starter templates for widget, bloc/cubit, and Patrol E2E tests.
- **Setup guide**: optional shared test-environment patterns in `docs/test-environment-setup.md`.

## Requirements

- Flutter SDK and Dart tooling.
- `flutter_test` for widget tests.
- `bloc_test` + `mocktail` for bloc/cubit tests.
- `patrol` for E2E tests (if your repo uses Patrol).

## Usage

1. Enable this plugin in Cursor.
2. Use the `flutter-test-writer` agent, or run commands:
   - `write-widget-test`
   - `write-bloc-test`
   - `write-e2e-test`
3. Keep tests aligned with `.cursor-plugin/rules/flutter-test-best-practices.mdc`.

## Conventions

- Event tests: `WHEN user taps <control> THEN <result>`.
- State tests: `GIVEN <state> THEN <rendered result>`.
- Prefer behavior assertions over visual internals.
- Use stable selectors (keys -> semantics -> text fallback).
- Keep async deterministic (`wait:` in `blocTest`, deliberate `pump`/`pumpAndSettle`).
- Use page objects for Patrol E2E interactions.
