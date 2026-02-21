---
name: review-flutter-code
description: Perform risk-focused Flutter code review for correctness, architecture, testing, and maintainability.
---

# Review Flutter Code

Use for PR/diff/code review requests.

## Workflow

1. Review for correctness and behavioral regressions first.
2. Check architecture boundaries and dependency direction.
3. Check state-management misuse and async hazards.
4. Check tests for missing cases and flakiness.
5. Run security audit checks from `../security-audit/SKILL.md` for every review.
6. Include OWASP MASVS-focused checks for mobile risk areas.
7. Check accessibility/localization/performance basics.

## Mandatory security scope (OWASP MASVS-oriented)

- MASVS-ARCH: architecture and trust boundaries.
- MASVS-STORAGE/CRYPTO: sensitive data storage and crypto usage.
- MASVS-AUTH: authentication/session handling weaknesses.
- MASVS-NETWORK: transport security and certificate validation.
- MASVS-PLATFORM: Android/iOS platform integration risks and exported surfaces.
- MASVS-CODE: unsafe code patterns and hardcoded secrets.

## Output format

- Findings first, ordered by severity.
- File references for each finding.
- Brief residual risk/testing gap summary.

## Required references

- `../security-audit/SKILL.md`
- https://mas.owasp.org/MASVS/
