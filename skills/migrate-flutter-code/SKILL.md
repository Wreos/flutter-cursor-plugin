---
name: migrate-flutter-code
description: Execute Flutter/Dart migrations and refactors with minimal risk and clear validation.
---

# Migrate Flutter Code

Use for framework/API/state-management migrations.

## Workflow

1. Define migration target and acceptance criteria.
2. Run baseline analysis and tests.
3. Apply migration in small batches by module.
4. Re-run analysis/tests after each batch.
5. Address deprecations and remove temporary adapters.
6. Final pass for style, naming, and docs.

## Guardrails

- Do not mix unrelated refactors with migration work.
- Keep intermediate states buildable when possible.
- Prefer codemod-like repetitive edits over ad hoc changes.
