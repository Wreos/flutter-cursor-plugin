# Official Release Checklist

Use this checklist before tagging a public release.

## Product

- Plugin metadata is up to date (`plugin.json`: name, version, author, description, keywords).
- README clearly explains scope, commands, agents, and MCP requirements.
- Changelog includes the release notes for the target version.

## Quality

- Rules, skills, and commands are consistent (no conflicting guidance).
- Templates are generic and repository-agnostic.
- No private/company-specific references remain.
- Effective Dart alignment is explicitly enforced (`rules/dart-effective-dart.mdc`).

## Tooling

- Dart MCP workflow is documented and referenced by relevant agents/commands.
- Figma MCP workflow is documented for UI implementation paths.

## Open source readiness

- `LICENSE`, `CONTRIBUTING.md`, and `CODE_OF_CONDUCT.md` are present.
- Repository description, topics, and social preview are configured.
- First release tag and GitHub Release notes are prepared.

## Mobile publication readiness

- Android/iOS release flow is documented (`docs/mobile-app-publishing-checklist.md`).
- Publishing skill/command/agent exist and are linked from README.
- Official references for Flutter/Android/Apple submission are included and up to date.
