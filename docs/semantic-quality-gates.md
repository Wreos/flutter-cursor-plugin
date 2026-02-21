# Semantic Prompt Quality Gates

This repository validates prompt quality on two levels:

1. Structural checks (`scripts/validate_agents_skills.sh`):
   - required sections exist in agents and skills.
2. Semantic checks (`scripts/validate_prompt_semantics.sh`):
   - canonical commands include guardrails and validation references.
   - skills include workflow, output contract, and guardrails/scope limits.
   - agents require validation evidence in output expectations.
   - active Flutter rules remain project-first for state management.
   - no blanket prohibition of Riverpod/Bloc/GetX in active rules.

Run locally:

```bash
bash scripts/validate_agents_skills.sh
bash scripts/validate_prompt_semantics.sh
```

CI runs both checks in `.github/workflows/semantic-quality.yml`.
