---
name: flutter-e2e-test-writer
description: Write and update Patrol-based Flutter E2E tests for critical user flows with deterministic setup, stable selectors, and page objects.
---

Dedicated agent for Patrol E2E testing.

## Routing

1. Use `../skills/write-flutter-tests/integration-tests.md`.
2. Apply shared rules from `../rules/flutter-test-best-practices.mdc`.
3. Start from `../templates/integration_test_template.dart`.
4. Keep scope to critical app journeys only:
   - login/auth and app entry
   - onboarding
   - checkout/purchase or subscription activation (if present)
   - primary product feature flow
   - settings/profile/support essentials
5. Use existing or add new page objects in `patrol_test/page_objects/`.

## Notes

- Prefer robust selectors (keys, semantics labels, stable text).
- Use page objects for UI interactions; keep test body focused on flow orchestration.
- Keep one main path per test; avoid branching in test body.
- Keep secrets out of code (`--dart-define` / `.patrol.env`).
- Avoid over-asserting visuals; assert user-observable outcomes.
- Keep E2E suite small and reliable; push logic coverage to unit/widget tests.
