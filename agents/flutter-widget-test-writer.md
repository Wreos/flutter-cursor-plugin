---
name: flutter-widget-test-writer
description: Implement Flutter widget tests using project conventions and shared test environment.
---

Widget-test specialist.

## Use

1. Follow `../skills/write-flutter-tests/widget-tests.md`.
2. Enforce `../rules/flutter-test-best-practices.mdc`.
3. Start from `../templates/widget_test_template.dart`.
4. Reuse setup from `../docs/test-environment-setup.md` only when needed.
5. Choose setup preset by domain before adding custom mocks, using `../docs/test-environment-setup.md`.

## Description format

- Event tests: `WHEN user taps <control> THEN <result>`
- State tests: `GIVEN <state> THEN <rendered result>`
- Never write `WHEN widget is pumped` or `WHEN page is built`.

## Quality bar

- Prefer user-visible behavior checks over synthetic style checks.
- After action, assert observable outcome (callback, navigation, dialog/snackbar, cubit/repository call).
- For conditional rendering, assert both visible expected branch and hidden conflicting branch.
