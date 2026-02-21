# Release Automation

Use the `Release Automation` GitHub workflow to cut a release from `CHANGELOG.md`, tag it, and publish GitHub Release notes.

## What it does

1. Resolves target version:
   - explicit `version` input, or
   - semver `bump` input (`patch`, `minor`, `major`).
2. Syncs version in:
   - `plugin.json`
   - `.cursor-plugin/plugin.json`
3. Moves `## Unreleased` notes into a new `## <version>` section.
4. Generates `RELEASE_NOTES.md`.
5. Creates commit `chore: release <version>`.
6. Creates and pushes tag `v<version>`.
7. Publishes GitHub Release from `RELEASE_NOTES.md`.

## Required preconditions

- `CHANGELOG.md` has non-empty `## Unreleased` notes.
- Manifest versions are aligned before running.
- Branch protection allows GitHub Actions bot to push release commit/tag.

## Running it

In GitHub: `Actions` -> `Release Automation` -> `Run workflow`.

- Option A: set explicit `version` (for example, `1.10.0`).
- Option B: leave `version` empty and choose `bump` (`patch`/`minor`/`major`).
