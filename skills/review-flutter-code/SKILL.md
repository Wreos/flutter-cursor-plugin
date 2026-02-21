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
5. Check accessibility/localization/performance basics.

## Output format

- Findings first, ordered by severity.
- File references for each finding.
- Brief residual risk/testing gap summary.
