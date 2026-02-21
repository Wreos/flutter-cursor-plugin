---
name: scaffold-flutter-architecture
description: Scaffold Flutter feature modules with consistent architecture, state management, and testable boundaries.
---

# Scaffold Flutter Architecture

Use for new feature/module boilerplate generation.

## Workflow

1. Confirm target feature name and selected pattern (BLoC, Riverpod, or clean layered default).
2. Create folder structure with presentation/domain/data boundaries.
3. Add state-management entry points (cubit/bloc/provider/notifier).
4. Add repository and data source contracts.
5. Add initial model/entity mapping points.
6. Add starter tests and TODOs for missing behavior.

## Quality defaults

- Keep public API small and explicit.
- Inject dependencies through constructors.
- Avoid hidden globals.
- Keep files cohesive and naming consistent.
