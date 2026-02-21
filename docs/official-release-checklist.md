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
- Mobile CI pipeline flow is documented (`docs/mobile-ci-pipeline-checklist.md`).
- Publishing skills/commands exist and are linked from README.
- Official references for Flutter/Android/Apple submission are included and up to date.

## Firebase readiness

- Firebase integration flow is documented (`docs/firebase-integration-checklist.md`).
- Firebase skill/command exist and are linked from README.
- Official FlutterFire/Firebase setup references are included and up to date.

## Security readiness

- Security review flow is documented (`docs/security-audit-checklist.md`).
- `/security-review` command and security skill exist and are linked from README.
- Official security references are included and up to date.
- Optional GitHub Action template exists for PR security reviews (`templates/github_actions_security_review.yml`).
