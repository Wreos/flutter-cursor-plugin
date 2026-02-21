---
name: security-review
description: Run security-focused review with secret scanning and prioritized findings for Flutter/Dart repositories.
---

Run a security audit and secrets scan (Claude-style `/security-review` workflow).

1. Follow `../skills/security-audit/SKILL.md`.
2. Start with secrets scanning and credential leak checks.
3. Continue with code-level security review for risky patterns.
4. Return findings first, prioritized by severity and exploitability.
5. Include concrete remediation steps and verification commands.
