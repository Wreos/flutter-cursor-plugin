# Security Posture

This page defines what `/security-review` covers, how findings are reported, and how to wire checks into CI.

## Scope of `/security-review`

The command follows `skills/security-audit/SKILL.md` and `docs/security-audit-checklist.md`:

1. Diff-aware review first (focus on pending changes).
2. Secrets scan and credential leak checks.
3. Code-level security checks for risky patterns.
4. Mobile hardening checks (Android/iOS release posture).
5. Supply-chain/dependency checks.
6. Findings prioritized by severity and exploitability.

## Findings format

Security findings should be returned in this structure:

- Severity: `critical`, `high`, `medium`, `low`.
- Risk: what can be exploited and under which conditions.
- Evidence: affected file/path and short explanation.
- Remediation: concrete fix steps.
- Verification: command/check proving the fix.

## False-positive handling

Use these rules to keep output actionable:

- Mark suspected false positives explicitly.
- Explain why the alert is likely non-exploitable.
- Keep a short "accepted risk" note only with clear rationale.
- Do not suppress high/critical issues without remediation plan.

## CI integration

Recommended baseline:

1. Run `/review-flutter-code` on PRs for architecture + quality checks.
2. Run `/security-review` for security findings before merge/release.
3. Keep `validate-plugin`, `doc-link-health`, and `api-stability` workflows green.
4. Enforce release checklist completion in `docs/official-release-checklist.md`.

Optional CI extension:

- Use `templates/github_actions_security_review.yml` as a starter workflow.
- Add repository secrets only through your CI provider secret store.
- Block release tags if high/critical findings are unresolved.

## References

- Flutter security: https://docs.flutter.dev/security
- OWASP MASVS: https://mas.owasp.org/MASVS/
- Google Play security best practices: https://developer.android.com/privacy-and-security/security-best-practices
- Apple security resources: https://developer.apple.com/security/
- Claude Code Security Review: https://github.com/anthropics/claude-code-security-review
