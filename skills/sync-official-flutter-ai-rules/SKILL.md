---
name: sync-official-flutter-ai-rules
description: Synchronize official Flutter AI rules profiles and set the active profile used by this plugin.
---

# Sync Official Flutter AI Rules

Use this workflow to keep plugin guidance aligned with upstream Flutter AI rules.

## Workflow

1. Choose target profile:
   - `10k`: full guidance, best for larger context windows.
   - `4k`: balanced default profile.
   - `1k`: minimal profile for constrained contexts.
2. Run:
   - `scripts/sync_official_flutter_ai_rules.sh <10k|4k|1k>`
3. Verify synced outputs:
   - `rules/official/flutter-ai-rules-10k.mdc`
   - `rules/official/flutter-ai-rules-4k.mdc`
   - `rules/official/flutter-ai-rules-1k.mdc`
   - `rules/flutter-official-ai-rules.mdc` (active profile copy)
4. Review diffs and ensure no local manual edits were mixed in.
5. Update changelog if behavior/guidance changed materially.

## Guardrails

- Do not hand-edit generated files under `rules/official/`.
- Keep active file `rules/flutter-official-ai-rules.mdc` aligned with chosen profile.
- Prefer `4k` unless there is a clear reason to switch to `10k` or `1k`.

## Official upstream sources

- `https://raw.githubusercontent.com/flutter/flutter/main/docs/rules/rules_10k.md`
- `https://raw.githubusercontent.com/flutter/flutter/main/docs/rules/rules_4k.md`
- `https://raw.githubusercontent.com/flutter/flutter/main/docs/rules/rules_1k.md`
