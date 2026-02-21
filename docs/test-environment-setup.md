# Test environment setup (shared dependencies)

This doc answers: how to prepare a reusable test environment in Flutter projects.

## Universal setup steps

- Register fallback values/fakes for your mocking library when required.
- Reset dependency container in `tearDown` (`getIt.reset`, scoped DI cleanup, or equivalent).
- Keep setup deterministic and minimal per test.

## Shared helpers pattern

If your project has common test wrappers, centralize them.

### 1) Shared DI helper (example: `TestEnv`)

Create a helper class that registers baseline dependencies in one call.

Suggested API:

- `registerBaseDependencies()` for common setup.
- Feature presets for larger domains (optional).
- `resetDependencies()` for teardown.

Example:

```dart
setUp(() {
  TestEnv.registerBaseDependencies();
  getIt.registerSingleton<MyRepository>(MockMyRepository());
});

tearDown(() async {
  await TestEnv.resetDependencies();
});
```

### 2) Shared widget pump helper (example: `tester.pumpApp`)

Wrap widgets in your standard app shell once (e.g. `MaterialApp`, localization delegates, theme wrappers).

Example:

```dart
await tester.pumpApp(MyWidgetUnderTest());
await tester.pumpAndSettle();
```

## Decision tree

- Pure logic/state -> bloc/cubit unit tests.
- UI behavior in isolation -> widget tests.
- Cross-screen critical journeys -> Patrol E2E tests.

## Practical recommendations

- Prefer project builders/factories for test data.
- Use stable selectors in widget/E2E tests (`Key` -> semantics -> text fallback).
- For async state timing in bloc tests, use `wait:` in `blocTest`.
- Keep E2E suite small and focused on high-value flows.
