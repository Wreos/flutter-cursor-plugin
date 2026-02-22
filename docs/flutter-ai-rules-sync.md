# Official Flutter AI Rules Sync

This document explains how to sync and route official Flutter AI rules in this plugin.

## Why this exists

Flutter publishes official AI rules in multiple sizes. This repository keeps a synced copy and exposes an active profile, then applies plugin policy via a separate higher-priority routing layer.

## Profiles

- `10k`: full and most detailed profile.
- `4k`: balanced profile (recommended default).
- `1k`: compact profile for constrained contexts.

## Sync command

Run from repository root:

```bash
scripts/sync_official_flutter_ai_rules.sh <10k|4k|1k>
```

Example:

```bash
scripts/sync_official_flutter_ai_rules.sh 4k
```

## Generated files

- `rules/official/flutter-ai-rules-10k.mdc`
- `rules/official/flutter-ai-rules-4k.mdc`
- `rules/official/flutter-ai-rules-1k.mdc`
- `rules/flutter-official-ai-rules.mdc` (active profile copy)
- `rules/flutter-plugin-policy-priority.mdc` (high-priority policy routing layer)

## Routing and precedence

- Official Flutter rules are synced as-is and used as the base.
- Plugin policy is defined separately in `rules/flutter-plugin-policy-priority.mdc`.
- If official guidance conflicts with plugin policy, plugin policy wins.
- Do not patch official text in sync scripts to enforce plugin policy.

## Upstream sources

- https://raw.githubusercontent.com/flutter/flutter/main/docs/rules/rules_10k.md
- https://raw.githubusercontent.com/flutter/flutter/main/docs/rules/rules_4k.md
- https://raw.githubusercontent.com/flutter/flutter/main/docs/rules/rules_1k.md
- https://docs.flutter.dev/ai
