# Dependency Upgrade Checklist

Use before merging dependency or Flutter SDK upgrade PRs.

## Baseline

- Record `flutter --version` and `flutter doctor -v`.
- Capture baseline `flutter analyze` and impacted test results.
- Confirm lockfiles are in sync before upgrade.

## Upgrade execution

- Run `flutter upgrade` only when SDK update is in scope.
- Run `flutter pub outdated` and review major version jumps.
- Prefer incremental dependency upgrades over one-shot massive changes.
- Avoid mixing feature work and formatting-only edits.

## Validation

- `flutter analyze` passes.
- Impacted unit/widget/bloc tests pass.
- Patrol E2E coverage rerun for critical journeys when relevant.
- CI workflow remains green.

## Release hygiene

- Document breaking changes and mitigation in PR description.
- Update docs if setup, tooling, or min-version requirements changed.
- Include rollback plan (revert commit/tag or lockfile restore path).
