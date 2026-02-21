# Prompt Execution Guardrails

Use these rules for all command prompts.

## Required inputs (before execution)

- Goal: what outcome is required.
- Scope: target modules/files and out-of-scope areas.
- Constraints: architecture/state-management/tooling constraints.
- Validation: exact commands to prove success.

If any required input is missing, stop and request clarification instead of guessing.

## Fail-fast rules

- Do not fabricate external context (Figma node IDs, CI logs, credentials, API contracts).
- If prerequisites are unavailable (tools, credentials, build context), report blocker and minimal next input needed.
- For security/review commands, require explicit target: diff, branch, or file set.

## Change scope limits

- Keep blast radius small: modify only files needed for the stated goal.
- No unrelated refactors in the same run.
- If migration is large, split into batches with per-batch validation.

## Output quality

- Tie claims to concrete checks run.
- Prefer precise file references and command results.
- Explicitly call out residual risks and unverified assumptions.
