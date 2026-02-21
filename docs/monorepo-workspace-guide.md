# Monorepo and Workspace Guide

Use this plugin safely in multi-package Flutter repos.

## Scope selection

- Run commands from the package root you are changing.
- Keep generated files inside the target package unless cross-package refactor is required.
- For Melos-style repos, make package boundaries explicit in prompts.

## Rules and context

- Load only relevant module files for the target package.
- Avoid broad repository-wide edits for local feature work.
- Keep test generation focused on impacted package(s).

## Suggested workflow

1. Select package and target feature/module.
2. Run feature or migration command in that package context.
3. Run package-level checks first, then monorepo-level checks if needed.
4. Document any cross-package contract changes.

## Validation

- Package-level analyze/tests pass.
- Workspace-level CI remains green when shared interfaces change.
- Security review still runs for every code review flow.
