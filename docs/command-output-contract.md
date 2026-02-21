# Command Output Contract

All command workflows should return results using this structure.

## Required sections

1. Result
   - One short statement of outcome (done/blocked/partial).
2. Changes
   - Files touched and what changed.
3. Validation
   - Commands/checks executed and pass/fail status.
4. Risks
   - Remaining risks, assumptions, or edge cases.
5. Next steps
   - Optional, only when actionable follow-up exists.

## Command-specific requirements

- Review/security commands:
  - Findings first, ordered by severity.
  - Include exact file references.
- Migration/upgrade commands:
  - Before/after versions.
  - Rollback notes.
- Build/debug commands:
  - Reproduction command.
  - Root cause and fix verification.

## Quality bar

- Avoid vague summaries without evidence.
- Prefer concrete file paths and command outputs.
- Keep conclusions tied to actual checks, not assumptions.
