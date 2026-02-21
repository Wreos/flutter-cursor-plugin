---
name: security-audit
description: Perform a practical security audit for Flutter/Dart projects, including secrets scanning and prioritized remediation guidance.
---

# Security Audit

Use this skill for `/security-review` style checks.

Every code review must include this security pass.

## Workflow

1. Start diff-aware: review pending changes first, then expand to dependent context.
2. Run repository-level secrets checks.
3. Review code for high-risk patterns:
   - hardcoded credentials/tokens/keys
   - insecure storage or logging of sensitive data
   - missing TLS/certificate validation controls
   - unsafe deserialization / dynamic execution patterns
   - insufficient authz/authn checks in app/service boundaries
4. Review mobile-specific concerns:
   - Android/iOS configuration leaks
   - debug flags/logging in release paths
   - weak handling of deep links/intent data
5. Apply false-positive filtering (remove low-impact/no-exploitability noise).
6. Classify findings by severity and exploitability.
7. Provide minimal safe fixes and validation steps.

## OWASP MASVS coverage (required)

- MASVS-ARCH
- MASVS-STORAGE
- MASVS-CRYPTO
- MASVS-AUTH
- MASVS-NETWORK
- MASVS-PLATFORM
- MASVS-CODE
- MASVS-RESILIENCE (where applicable)

## Output format

- Findings first (highest severity first).
- File references and concise impact statement per finding.
- Remediation guidance with concrete next step.
- Residual risks and follow-up checks.

## Optional scanner commands

- `gitleaks detect --source .`
- `trufflehog filesystem .`
- `rg -n \"(api[_-]?key|secret|token|password|private[_-]?key|BEGIN RSA PRIVATE KEY)\"`

## Official references

- Flutter security overview: https://docs.flutter.dev/security
- OWASP MASVS: https://mas.owasp.org/MASVS/
- Google Play app security best practices: https://developer.android.com/privacy-and-security/security-best-practices
- Apple security resources: https://developer.apple.com/security/
- Anthropic Claude Code Security Review: https://github.com/anthropics/claude-code-security-review
